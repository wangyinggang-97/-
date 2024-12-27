using System;
using System.Collections.Generic;
using System.IO.Ports;
using System.Linq;
using System.Text;
using System.Text.Json.Serialization;
using System.Threading.Tasks;
using System.Windows.Forms;
using test.Device;
using test.Device.DeviceBase;

namespace test
{
    public class PullPushAPI : SerialPortBase
    {
        public PullPushAPI(string comName, int baudRate = 9600, int timeOut = 1000) : base("PullPushAPI", comName, baudRate, timeOut)
        {

        }
        public bool OpenPullPush(byte mainAddr, byte doorAddr)
        {
            DataFrameItem req = new DataFrameItem();
            req.head = 0x7E;
            req.func = FuncCodeEnum.PullPushRod;
            req.mainAddr = mainAddr;
            req.screenAddr = doorAddr;
            req.lineIndex = 1; //打开
            req.len = 0x01;

            req.data = new byte[1];
            req.data[0] = 0x01;

            //crc可以自动计算，不用管
            req.tail = 0x68;

            this.WriteBuffer(req);

            req = this.ReadBuffer(FuncCodeEnum.PullPushRod);
            if (req == null)
                return false;
            else
                return true;
        }
        public void ClosePullPush(byte mainAddr, byte doorAddr)
        {
            DataFrameItem req = new DataFrameItem();
            req.head = 0x7E;
            req.func = FuncCodeEnum.PullPushRod;
            req.mainAddr = mainAddr;
            req.screenAddr = doorAddr;
            req.lineIndex = 2; //打开
            req.len = 0x01;

            req.data = new byte[1];
            req.data[0] = 0x01;

            //crc可以自动计算，不用管
            req.tail = 0x68;

            this.WriteBuffer(req);

            req = this.ReadBuffer(FuncCodeEnum.PullPushRod);
        }
        public int GetPullPushStatus(byte mainAddr, byte doorAddr)
        {
            DataFrameItem req = new DataFrameItem();
            req.head = 0x7E;
            req.func = FuncCodeEnum.RodMonitoring;
            req.mainAddr = mainAddr;
            req.screenAddr = doorAddr;
            req.lineIndex = 1;
            req.len = 0x01;

            req.data = new byte[1];
            req.data[0] = 0x01;

            //crc可以自动计算，不用管
            req.tail = 0x68;
            this.WriteBuffer(req);
            req = this.ReadBuffer(FuncCodeEnum.RodMonitoring,5000);
            if (req != null) {
                MessageBox.Show(System.Text.Json.JsonSerializer.Serialize(req));
                if (req.data[0] % 16 == 1)
                {
                    return 0;
                }
                else if (req.data[0] % 16 == 2)
                {
                    return 1;
                }
                else
                {
                    return -1;
                }
            }
            return -1;
        }
        public static string AutoFindDevice()
        {
            for (int i = 0; i < 5; i++)
            {
                foreach (var com in SerialPort.GetPortNames())
                {
                    PullPushAPI pull = new PullPushAPI(com, 9600, 500);
                    var result = pull.GetPullPushStatus((byte)i, 1);
                    if (result > -1)
                    {
                        pull.Dispose();
                        return com;
                    }
                    pull.Dispose();
                }
            }
            MessageBox.Show("无法找到端口");
            return "";
        }
    }
}
