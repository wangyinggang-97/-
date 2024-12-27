using AForge.Imaging.Filters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using test.Device.DeviceBase;

namespace DeviceXP
{
    /// <summary>
    /// 电子屏COM通信接口类
    /// </summary>
    public class ScreenAPI : SerialPortBase
    {
        /// <summary>
        /// 接口对象的标识符：用于API对象实例化时标记一些特殊的API对象
        /// </summary>
        public string ApiTag { get; set; }

        public ScreenAPI(string comName, int baudRate = 9600, int timeOut = 500) : base("ScreenAPI", comName, baudRate, timeOut)
        {

        }
        /// <summary>
        /// 发送显示文本信息
        /// </summary>
        /// <param name="txt"></param>
        /// <param name="screenNo"></param>
        public void Send(string txt, int screenNo)
        {
            //地址
            int addrInt = screenNo + 255;
            byte a = Convert.ToByte(addrInt / 256);
            byte b = Convert.ToByte(addrInt % 256);
            byte[] arr = Str2byte(a, b, txt).ToArray();
            serial.Write(arr, 0, arr.Length);
        }
        private static byte[] Str2byteForLabel_1_7(string content)
        {
            byte[] txt = null;
            if (!string.IsNullOrEmpty(content) && !string.IsNullOrWhiteSpace(content))
            {
                txt = Encoding.Default.GetBytes(content);
                return txt;
            }
            return null;

        }
        /// <summary>
        /// 发送显示文本信息（标签屏：1.7寸屏）
        /// </summary>
        /// <param name="txt">发送内容</param>
        /// <param name="screenNo">屏幕地址</param>
        /// <param name="isReadReceived">是否读取通讯回复，默认为true</param>
        public void SendToLabel_1_7(string txt, int screenNo, bool isReadReceived = true)
        {
            string contentStr;
            byte[] bytes;
            if(screenNo==-1)
                bytes = Str2byteForLabel_1_7(txt);
            else
                bytes = Str2byteForLabel_1_7(txt, (byte)screenNo, out contentStr);
            byte[] arr;
            if (bytes != null)
            {
                arr = bytes.ToArray();
                serial.Write(arr, 0, arr.Length);
            }
            else
            {
                return;
            }
            #region 读取回复
            string receiveContent = string.Empty;
            if (isReadReceived)
            {
                List<byte> lstBuffer = new List<byte>();
                List<byte> chkBuffer = new List<byte>();
                DateTime dtStartRead = DateTime.Now;//开始读取的时间
                while ((DateTime.Now - dtStartRead).TotalMilliseconds <= 1000)//1秒内要得到回复，否则就超时
                {
                    try
                    {
                        #region chkBuffer
                        if (chkBuffer.Count >= 5)
                        {
                            #region 字节有可能是一个完整帧
                            bool bExist = false;
                            int nEndIndex = -1;
                            // 02 4F 4B 0D 0A
                            if (chkBuffer[0] == arr[0])
                            {
                                int len = chkBuffer.Count;

                                if (chkBuffer[len - 2] == 0X0D)
                                {
                                    if (chkBuffer[len - 1] == 0x0A)
                                    {

                                        break;
                                    }
                                    else
                                    {
                                        chkBuffer.RemoveAt(0);
                                    }
                                }
                                else
                                {
                                    chkBuffer.RemoveAt(0);
                                }
                            }
                            else
                            {
                                chkBuffer.RemoveAt(0);
                            }
                            #endregion
                        }

                        #endregion
                        #region 读取字节流
                        int nBytestoRead = serial.BytesToRead;
                        if (nBytestoRead != 0)
                        {
                            byte[] buffer = new byte[nBytestoRead];
                            int nRecvedCount = 0;
                            while (nRecvedCount < buffer.Length)
                            {
                                nRecvedCount += serial.Read(buffer, nRecvedCount, nBytestoRead - nRecvedCount);
                            }
                            lstBuffer.AddRange(buffer);
                            chkBuffer.AddRange(buffer);
                            var readarr = lstBuffer.ToArray();
                            string readAll = "";
                            for (int i = 0; i < readarr.Length; i++)
                            {
                                readAll = readAll + readarr[i].ToString("X2") + " ";
                            }
                            receiveContent = readAll;
                        }
                        #endregion
                    }
                    catch (Exception)
                    {

                    }
                }
            }

            #endregion
        }

        /// <summary>
        /// 发送显示文本信息（标签屏：2.4寸屏）
        /// </summary>
        /// <param name="txt">发送内容</param>
        /// <param name="screenNo">屏幕地址</param>
        /// <param name="isReadReceived">是否读取通讯回复，默认为false</param>
        public void SendToLabel_2_4(string txt, int screenNo, bool isReadReceived = false)
        {
            //发送指令和数据解析算法与主控屏幕相同，只是screenNo设置不同（在调用时赋值）
            int addrInt = screenNo + 255;
            byte a = Convert.ToByte(addrInt / 256);
            byte b = Convert.ToByte(addrInt % 256);
            byte[] arr = Str2byte(a, b, txt).ToArray();
            serial.Write(arr, 0, arr.Length);

            #region 读取回复
            string receiveContent = string.Empty;
            if (isReadReceived)
            {
                List<byte> lstBuffer = new List<byte>();
                List<byte> chkBuffer = new List<byte>();
                DateTime dtStartRead = DateTime.Now;//开始读取的时间
                while ((DateTime.Now - dtStartRead).TotalMilliseconds <= 1000)//1秒内要得到回复，否则就超时
                {
                    try
                    {
                        #region chkBuffer

                        if (chkBuffer.Count >= 5)
                        {
                            #region 字节有可能是一个完整帧
                            if (chkBuffer[0] == arr[0])
                            {
                                int len = chkBuffer.Count;

                                if (chkBuffer[len - 2] == 0X0D)
                                {
                                    if (chkBuffer[len - 1] == 0x0A)
                                    {
                                        break;
                                    }
                                    else
                                    {
                                        chkBuffer.RemoveAt(0);
                                    }
                                }
                                else
                                {
                                    chkBuffer.RemoveAt(0);
                                }
                            }
                            else
                            {
                                chkBuffer.RemoveAt(0);
                            }
                            #endregion
                        }
                        #endregion
                        #region 读取字节流
                        int nBytestoRead = serial.BytesToRead;
                        if (nBytestoRead != 0)
                        {
                            byte[] buffer = new byte[nBytestoRead];
                            int nRecvedCount = 0;
                            while (nRecvedCount < buffer.Length)
                            {
                                nRecvedCount += serial.Read(buffer, nRecvedCount, nBytestoRead - nRecvedCount);
                            }
                            lstBuffer.AddRange(buffer);
                            chkBuffer.AddRange(buffer);
                            var readarr = lstBuffer.ToArray();
                            string readAll = "";
                            for (int i = 0; i < readarr.Length; i++)
                            {
                                readAll = readAll + readarr[i].ToString("X2") + " ";
                            }
                            receiveContent = readAll;
                        }

                        #endregion
                    }
                    catch (Exception)
                    {

                    }
                }
            }
            #endregion
        }

        /// <summary>
        /// 字符串转Byte数组
        /// </summary>
        /// <param name="A"></param>
        /// <param name="B"></param>
        /// <param name="content"></param>
        /// <returns></returns>
        private static byte[] Str2byte(byte A, byte B, string content)
        {
            if (string.IsNullOrEmpty(content)) return null;
            byte[] txt = null;
            if (content != null && content.Trim() != "")
            {
                txt = Encoding.Default.GetBytes(content.Trim());
            }
            byte[] data = new byte[txt.Length + 5];
            data[0] = B;
            data[1] = A;
            for (int n = 0; n < txt.Length; n++)
            {
                data[n + 2] = txt[n];
            }
            data[txt.Length + 2] = 0xFF;
            data[txt.Length + 3] = 0xFF;
            data[txt.Length + 4] = 0xFF;
            return data;
        }

        /// <summary>
        /// 字符串转Byte数组（标签屏：1.7寸屏）
        /// </summary>
        /// <param name="content"></param>
        /// <param name="screenNo"></param>
        /// <param name="str"></param>
        /// <returns></returns>
        private static byte[] Str2byteForLabel_1_7(string content, byte screenNo, out string str)
        {
            byte[] txt = null;
            if (!string.IsNullOrEmpty(content) && !string.IsNullOrWhiteSpace(content))
            {
                txt = Encoding.Default.GetBytes(content);
            }
            else
            {
                str = "";
                return null;
            }
            byte[] data = new byte[txt.Length + 1];
            data[0] = screenNo;
            for (int n = 1; n < data.Length; n++)
            {
                data[n] = txt[n - 1];
            }
            string bData = "";

            foreach (var d in data)
            {
                bData = bData + d.ToString("X2") + " ";
            }
            str = bData;
            return data;
        }
    }
}
