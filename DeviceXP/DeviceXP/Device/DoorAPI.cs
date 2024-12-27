using System;
using System.Collections.Generic;
using System.IO.Ports;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using test.Device.DeviceBase;
using System.Text.Json;
using System.Text.Json.Serialization;
namespace test.Device
{
    public class DoorAPI:SerialPortBase
    {
        public DoorAPI(string comName, int baudRate = 9600,int timeOut=1000) :base("DoorAPI", comName,baudRate, timeOut)
        { 
            
        }
        /// <summary>
        /// 开门
        /// </summary>
        /// <param name="mainAddr">主板地址</param>
        /// <param name="doorAddr">门地址</param>
        public bool OpenDoor(byte mainAddr, byte doorAddr)
        {
            DataFrameItem req = new DataFrameItem
            {
                head = 0x7E,
                func = FuncCodeEnum.OpenDoor,
                mainAddr = mainAddr,
                screenAddr = doorAddr,
                lineIndex = 1,
                len = 0x01,
                data = new byte[1]
            };
            req.data[0] = 0x01;

            //crc可以自动计算，不用管
            req.tail = 0x68;

            this.WriteBuffer(req);


            req = this.ReadBuffer(FuncCodeEnum.OpenDoor);

            if (req == null)
                return false;
            else
                return true;
        }
        /// <summary>
        /// 返回门状态
        /// </summary>
        /// <param name="mainAddr">主板地址</param>
        /// <param name="doorAddr">门地址</param>
        /// <returns>0 关闭 1及以上打开</returns>
        public int GetDoorStatus(byte mainAddr, byte doorAddr, int dataParseType = 0)
        {
            DataFrameItem req = new DataFrameItem();
            req.head = 0x7E;
            req.func = FuncCodeEnum.QueryStatus;
            req.mainAddr = mainAddr;
            req.screenAddr = doorAddr;
            req.lineIndex = 1;
            req.len = 0x01;

            req.data = new byte[1];
            req.data[0] = 0x01;

            //crc可以自动计算，不用管
            req.tail = 0x68;

            lock (serial)
            {
                this.WriteBuffer(req);
                req = this.ReadBuffer(FuncCodeEnum.QueryStatus,5000);
            }
            if (req == null || req.data == null)
                return -1;
            else
            {
                //Convert.ToString(req.data[0]>>1-1, 2)
                if (dataParseType == 0)
                {
                    if (req.data.Length == 0)
                        return 0;
                    return req.data[0] >> doorAddr - 1 & 1;
                }
                else if (dataParseType == 1)
                {
                    if (req.data[0] % 16 == 0x02)
                        return 0;
                    else
                        return 1;
                }
                else if (dataParseType == 2)
                {
                    if (req.data[0] % 16 == 0x02)
                        return 1;
                    else
                        return 0;
                }
                else if (dataParseType == 3)
                {
                    int[] result = new int[48];
                    for (int i = 0; i <= 47; i++)
                    {
                        int dataByte = 5 - (i) / 8; // doorIndex - 1
                        int dataPos = (i) % 8; // doorIndex - 1
                                               // int resInt = (res.data[dataByte] >> dataPos) % 2;
                        result[i] = (req.data[dataByte] >> dataPos) % 2;
                    }
                    return result[doorAddr - 1];
                }
                else
                    return req.data[0];
            }
        }
        public static string AutoFindDevice()
        {
            string comStr = "";
            foreach (var com in SerialPort.GetPortNames())
            {
                DoorAPI door = new DoorAPI(com, 9600, 500);
                int result = door.GetDoorStatus(1, 1);
                if (result >-1&&result<15)
                {
                    comStr +=com + ",";
                    door.Dispose();
                }
                door.Dispose();
            }
            if(comStr.Length > 0) {
                return comStr;
            }
            MessageBox.Show("无法找到端口");
            return "";
        }
    }

}
