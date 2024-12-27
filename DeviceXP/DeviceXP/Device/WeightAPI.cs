using System;
using System.Collections.Generic;
using System.IO.Ports;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Windows.Forms.VisualStyles;
using test.Device.DeviceBase;

namespace test.Device
{
    /// <summary>
    /// 电子称类
    /// </summary>
    public class WeightAPI:SerialPortBase
    {
        public WeightAPI(string comName, int baudRate = 9600 ,int timeout = 1000) :base("WeightAPI", comName,baudRate, timeout)
        {
            
        }
        /// <summary>
        /// 获取主板4个电子称重量 单位：mg
        /// </summary>
        /// <param name="mainAddr">主板号</param>
        /// <returns>返回4个值表示该主板4个称重量</returns>
        public long[] GetWeight(byte mainAddr)
        {
            DataFrameItem req = new DataFrameItem();
            req.head = 0x7E;
            req.func = FuncCodeEnum.GetWeight;
            req.mainAddr = mainAddr;
            req.screenAddr = 0x01;
            req.lineIndex = 0x01;
            req.len = 0x01;

            req.data = new byte[1];
            req.data[0] = 0x01;
            //crc可以自动计算，不用管
            req.tail = 0x68;
            try
            {
                this.WriteBuffer(req);

                DataFrameItem item = ReadBuffer(FuncCodeEnum.GetWeight,5000);
                if (item != null)
                {
                    // 2
                    long LowWeight1 = item.data[0] * 0x1000000 + item.data[1] * 0x10000 + item.data[2] * 0x100 + item.data[3];
                    // 1
                    long HighWeight1 = item.data[4] * 0x1000000 + item.data[5] * 0x10000 + item.data[6] * 0x100 + item.data[7];
                    // 4
                    long LowWeight2 = item.data[8] * 0x1000000 + item.data[9] * 0x10000 + item.data[10] * 0x100 + item.data[11];
                    //long LowWeight2 = 0;
                    // 3
                    long HighWeight2 = item.data[12] * 0x1000000 + item.data[13] * 0x10000 + item.data[14] * 0x100 + item.data[15];
                    //long HighWeight2 = 0;

                    return new long[] { HighWeight1, LowWeight1, HighWeight2, LowWeight2 };
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            return null;
        }
        /// <summary>
        /// 电子称去皮 
        /// </summary>
        /// <param name="mainAddr">去皮主板</param>
        /// <param name="screen">去皮电子称(1-4 5表示整整个板子去皮)</param>
        /// <returns></returns>
        public bool ClearPeel(byte mainAddr, byte screen)
        {
            DataFrameItem req = new DataFrameItem();
            req.head = 0x7E;
            req.func = FuncCodeEnum.Peel;
            req.mainAddr = mainAddr;
            req.screenAddr = screen;
            req.lineIndex = 0x01;
            req.len = 0x01;

            req.data = new byte[1];
            req.data[0] = 0x01;
            //crc可以自动计算，不用管
            req.tail = 0x68;

            this.WriteBuffer(req);
            DataFrameItem item = ReadBuffer(FuncCodeEnum.Peel,5000);
            if (item.data[0] == 1)
                return true;
            else
                return false;
        }

        public string CheckPrecision(byte mainAddr, byte screen)
        {
            DataFrameItem req = new DataFrameItem();
            req.head = 0x7E;
            req.func = FuncCodeEnum.CheckPrecision;
            req.mainAddr = mainAddr;
            req.screenAddr = screen;
            req.lineIndex = 0x01;
            req.len = 0x01;

            req.data = new byte[1];
            req.data[0] = 0x01;

            //crc可以自动计算，不用管
            req.tail = 0x68;

            this.WriteBuffer(req);
            DataFrameItem item = ReadBuffer(FuncCodeEnum.CheckPrecision);
            if (item.data[0] == 1)
            {
                var df = GetWeightInfo(mainAddr);
                string value = DataFrameItem.DataToString(df.data);
                System.Windows.Forms.Clipboard.SetText(value);
                return value;
            }
            else
                return null;
        }
        private DataFrameItem GetWeightInfo(byte mainAddr)
        {
            DataFrameItem req = new DataFrameItem();
            req.head = 0x7E;
            req.func = FuncCodeEnum.GetWeightInfo;
            req.mainAddr = mainAddr;
            req.screenAddr = 0x01;
            req.lineIndex = 0x01;
            req.len = 0x01;

            req.data = new byte[1];
            req.data[0] = 0x01;
            //crc可以自动计算，不用管
            req.tail = 0x68;
            try
            {
                this.WriteBuffer(req);
                DataFrameItem item = ReadBuffer(FuncCodeEnum.GetWeightInfo);
                if (item != null)
                {
                    return item;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            return null;
        }
        public bool UpdateWeightInfo(byte mainAddr, string dataStr)
        {
            byte[] data=DataFrameItem.StringToData(dataStr);

            DataFrameItem req = new DataFrameItem();
            req.head = 0x7E;
            req.func = FuncCodeEnum.UpdateWeightInfo;
            req.mainAddr = mainAddr;
            req.screenAddr = 0x01;
            req.lineIndex = 0x01;

            int len = data.Length;

            req.len = (byte)len;

            req.data = new byte[len];
            req.data = data;

            //crc可以自动计算，不用管
            req.tail = 0x68;

            this.WriteBuffer(req);
            DataFrameItem item = ReadBuffer(FuncCodeEnum.UpdateWeightInfo,1000);
            if (item != null && item.data != null && item.data.Length > 0 && item.data[0] == 1)
                return true;
            else
                return false;
        }

        public static string AutoFindDevice()
        {
            foreach (var com in SerialPort.GetPortNames())
            {
                WeightAPI weight = new WeightAPI(com, 9600, 500);
                var result = weight.GetWeight(1);
                if (result != null)
                {
                    weight.Dispose();
                    return com;
                }
                weight.Dispose();
            }
            MessageBox.Show("无法找到端口");
            return "";
        }

    }
}
