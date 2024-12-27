using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using test.Device.DeviceBase;

namespace test.Device
{
    public class WenShiDuAPI : SerialPortBase
    {
        public WenShiDuAPI(string comName, int baudRate = 9600, int timeOut = 500) : base("WenShiDuAPI", comName, baudRate, timeOut)
        {

        }
        public double GetWendu()
        {
            DataFrameItem req = new DataFrameItem();
            req.head = 0x7E;
            req.func = FuncCodeEnum.GetWenShiDu;
            req.mainAddr = 0x01;
            req.screenAddr = 0x06;
            req.lineIndex = 0x01;
            req.len = 0x01;

            req.data = new byte[1];
            req.data[0] = 0x01;

            //crc可以自动计算，不用管
            req.tail = 0x68;

            WriteBuffer(req);
            req = ReadBuffer(FuncCodeEnum.GetWenShiDu);
            if (req != null)
            {
                double wendu = ((double)(req.data[0] * 256 + req.data[1]) / 10.0f - 40);
                return wendu;
            }
            return 1;
        }
        public double GetShidu()
        {
            DataFrameItem req = new DataFrameItem();
            req.head = 0x7E;
            req.func = FuncCodeEnum.GetWenShiDu;
            req.mainAddr = 0x01;
            req.screenAddr = 0x06;
            req.lineIndex = 0x01;
            req.len = 0x01;

            req.data = new byte[1];
            req.data[0] = 0x01;

            //crc可以自动计算，不用管
            req.tail = 0x68;

            WriteBuffer(req);
            req = ReadBuffer(FuncCodeEnum.GetWenShiDu);
            if (req != null)
            {
                double shidu = ((double)(req.data[2] * 256 + req.data[3]));
                return shidu;
            }
            return 1;
        }
        [DllImport("Temperature.dll", EntryPoint = "GetTemp1", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern int GetTempWendu();
        [DllImport("Temperature.dll", EntryPoint = "GetHumidity1", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern int GetTempShidu();
        [DllImport("Temperature.dll", EntryPoint = "GetHumidityCount", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern int GetHumidityCount();
        [DllImport("Temperature.dll", EntryPoint = "GetTempCount", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern int GetTempCount();
    }
}
