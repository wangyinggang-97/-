using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO.Ports;
using System.Linq;
using System.Runtime.InteropServices.WindowsRuntime;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using test.Device.DeviceBase;

namespace test.Device
{
    public class AutoPushDrugAPI : SerialPortBase
    {
        public AutoPushDrugAPI(string comName, int baudRate = 9600, int timeOut = 1000) : base("AutoPushDrugAPI", comName, baudRate, timeOut)
        {

        }
        public int PushDrug(byte mainAddr, byte doorAddr, byte count, int version = 0)
        {
            DataFrameItem req;
            if (version == 0)
            {
                req = new DataFrameItem
                {
                    head = 0x7E,
                    func = FuncCodeEnum.AutoSend,
                    mainAddr = mainAddr,
                    screenAddr = doorAddr,
                    lineIndex = 0x01,
                    len = 0x01,
                    data = new byte[1],
                };
                req.data[0] = count;

                //crc可以自动计算，不用管
                req.tail = 0x68;
            }
            else
            {
                req = new DataFrameItem();
                req.head = 0x7E;
                req.func = FuncCodeEnum.AutoSend;
                req.mainAddr = mainAddr;
                req.screenAddr = 0x01;
                req.lineIndex = 0x01;
                req.len = 0x03;
                //数据格式：第一位 药发药的列个个数  第二位 列地址 第三位 发药数量  第四位 列地址 第五位 发药数量 。。。。。。。。 
                List<byte> array = new List<byte>(req.len);
                array.Add(1);
                req.tail = 0x68;

                array.Add((byte)doorAddr);
                array.Add((byte)count);
                req.data = array.ToArray();
            }

            lock (serial)
            {
                this.WriteBuffer(req);
                req = this.ReadBuffer(FuncCodeEnum.AutoSend, 2000 * count);
            }

            if (req != null && req.data != null && req.data.Length > 0)
                return req.data[0];
            else
                return -1;
        }
        public int[] GetDrugInventoryInfo(byte mainAddr, byte doorAddr)
        {
            DataFrameItem req = new DataFrameItem
            {
                head = 0x7E,
                func = FuncCodeEnum.SingleInventory,
                mainAddr = mainAddr,
                screenAddr = doorAddr,
                lineIndex = 0x01,
                len = 0x01,

                data = new byte[1],
            };
            req.data[0] = 0x01;

            //crc可以自动计算，不用管
            req.tail = 0x68;

            this.WriteBuffer(req);
            req = this.ReadBuffer(FuncCodeEnum.SingleInventory);

            if (req == null)
                return null;
            else
            {
                int subLen = 4; //56-4=52格
                int[] result = new int[req.len * 8 - subLen];
                for (int i = 0; i < result.Length; i++)
                {
                    int dataByte = (i) / 8; // doorIndex - 1
                    int dataPos = 7 - (i) % 8; // doorIndex - 1
                    result[i] = (req.data[dataByte] >> (dataPos)) % 2;
                }
                return result;
            }
        }
        public int[] GetDrugInventoryInfo(byte mainAddr, byte doorAddr, int version = 0)
        {
            DataFrameItem req = new DataFrameItem
            {
                head = 0x7E,
                func = FuncCodeEnum.SingleInventory,
                mainAddr = mainAddr,
                screenAddr = doorAddr,
                lineIndex = 0x01,
                len = 0x01,

                data = new byte[1],
            };
            req.data[0] = 0x01;

            //crc可以自动计算，不用管
            req.tail = 0x68;

            lock (serial)
            {
                this.WriteBuffer(req);
                req = this.ReadBuffer(FuncCodeEnum.SingleInventory);
            }

            if (req == null)
                return null;
            else
            {
                if (version == 0)
                {
                    int subLen = 0; //56-4=52格
                    int[] result = new int[req.len * 8 - subLen];
                    for (int i = 0; i < result.Length; i++)
                    {
                        int dataByte = (i) / 8; // doorIndex - 1
                        int dataPos = 7 - (i) % 8; // doorIndex - 1
                        result[i] = (req.data[dataByte] >> (dataPos)) % 2;
                    }
                    return result;
                }
                else
                {
                    int subLen = 4; //56-4=52格
                    int[] result = new int[req.len * 8];
                    for (int i = 0; i < result.Length; i++)
                    {
                        int dataByte = (i) / 8; // doorIndex - 1
                        int dataPos = (i) % 8; // doorIndex - 1
                        result[i] = (req.data[dataByte] >> (dataPos)) % 2;
                    }
                    int[] returnData = new int[req.len * 8 - subLen];
                    for (int i = 0; i < returnData.Length; i++)
                    {
                        returnData[i] = result[i + subLen];
                    }
                    return returnData;
                }
            }
        }
        public static string AutoFindDevice()
        {
            foreach (var com in SerialPort.GetPortNames())
            {
                AutoPushDrugAPI autuDrug = new AutoPushDrugAPI(com, 9600, 500);
                var result = autuDrug.GetDrugInventoryInfo(1,1);
                if (result!=null)
                {
                    autuDrug.Dispose();
                    return com;
                }
                autuDrug.Dispose();
            }
            MessageBox.Show("无法找到端口");
            return "";
        }
    }
}
