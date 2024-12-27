using System;
using System.Collections.Generic;
using System.IO;
using System.IO.Ports;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Collections.Generic;
using System.Data.Entity.Infrastructure;
using System.Threading;
using System.Drawing;
using System.Windows.Forms;
using AForge.Imaging.Filters;
namespace test.Device.DeviceBase
{
    public class SerialPortBase : System.IDisposable
    {
        private static Dictionary<string, SerialPort> dicSerial = new Dictionary<string, SerialPort>();
        protected SerialPort serial;
        private string ComType;
        private int BaudRate;
        public int TimeOut = 500;
        public SerialPortBase(string comType,string comName,int baudRate = 9600,int timeOut=500)
        {
            ComType = comType;
            TimeOut = timeOut;
            BaudRate = baudRate;
            foreach (var dv in dicSerial.ToList()) 
            {
                if (dv.Key.Equals(comName)) //一个串口
                {
                    serial = dv.Value;
                    break;
                }
            }
            if (serial == null)//没有发现重复端口
            {
                serial = new SerialPort();
                dicSerial.Add(comName, serial);
            }
            if (serial.IsOpen)
            {
                serial.Close();
            }
            try
            {
                serial.PortName = comName;
                serial.BaudRate = BaudRate;
                serial.DataBits = 8;
                serial.StopBits = System.IO.Ports.StopBits.One;
                serial.Parity = System.IO.Ports.Parity.None;
                serial.Open();
                TimeOut = timeOut;
            }
            catch (Exception ex)
            {
                MessageBox.Show(comType+":"+ex.Message);
            }
        }
        protected void WriteBuffer(DataFrameItem req)
        {
            byte[] arr = req.ToArray();
            serial.Write(arr, 0, arr.Length);
        }
        protected DataFrameItem ReadBuffer(FuncCodeEnum func, int _timeOut = 500)
        {
            if (_timeOut == 500)
                _timeOut = TimeOut;
            //接收数据
            List<byte> lstBuffer = new List<byte>();
            DateTime dtTimeout = DateTime.Now.AddMilliseconds(_timeOut);
            while (dtTimeout > DateTime.Now)
            {
                int readLen = serial.BytesToRead;
                if (readLen > 0)
                {
                    byte[] buffer = new byte[readLen];
                    serial.Read(buffer, 0, readLen);
                    lstBuffer.AddRange(buffer);
                }

                if (lstBuffer.Count > 8)
                {
                    if (func == (FuncCodeEnum)lstBuffer[1])
                    {
                        int len = (int)lstBuffer[5];
                        if (lstBuffer.Count >= len + 8)
                        {
                            break;
                        }
                    }
                }
            }
            DataFrameItem item = GetDataFrameItem(lstBuffer.ToArray(), func);
            return item;
        }
        private static DataFrameItem GetDataFrameItem(byte[] buffer, FuncCodeEnum func)
        {
            DataFrameItem item = null;
            if (buffer.Length > 8)
            {
                if (buffer[0] == 0x7F && buffer[1] == (byte)func)
                {
                    item = new DataFrameItem();
                    item.head = buffer[0];
                    item.func = (FuncCodeEnum)buffer[1];
                    item.mainAddr = buffer[2];
                    item.screenAddr = buffer[3];
                    item.lineIndex = buffer[4];
                    item.len = buffer[5];
                    item.data = new byte[item.len];
                    for (int i = 0; i < item.len; i++)
                    {
                        item.data[i] = buffer[6 + i];
                    }
                }
            }
            return item;
        }
        public void Dispose()
        {
            if (serial != null)
            {
                serial.Dispose();
            }
        }
    }
}
