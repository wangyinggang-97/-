using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace test.Device
{
    /// <summary>
    /// 刷卡一体机类
    /// </summary>
    public class CardScanAPI: System.IDisposable
    {
        IntPtr dev = IntPtr.Zero;

        //打开信道
        [DllImport("vbar.dll", EntryPoint = "vbar_channel_open", CallingConvention = CallingConvention.Cdecl)]
        private static extern IntPtr vbar_channel_open(int type, long parm);
        //发送数据
        [DllImport("vbar.dll", EntryPoint = "vbar_channel_send", CallingConvention = CallingConvention.Cdecl)]
        private static extern int vbar_channel_send(IntPtr dev, byte[] data, int length);
        //接收数据
        [DllImport("vbar.dll", EntryPoint = "vbar_channel_recv", CallingConvention = CallingConvention.Cdecl)]
        private static extern int vbar_channel_recv(IntPtr dev, byte[] buffer, int size, int milliseconds);
        //关闭信道
        [DllImport("vbar.dll", EntryPoint = "vbar_channel_close", CallingConvention = CallingConvention.Cdecl)]
        private static extern void vbar_channel_close(IntPtr dev);
        public CardScanAPI()
        {
            this.openDevice();
        }
        //连接设备
        private bool openDevice()
        {
            try
            {
                dev = vbar_channel_open(1, 1);
                if (dev == IntPtr.Zero)
                {
                    return false;
                }
                else
                {
                    return true;
                }
            }
            catch (Exception ex)
            {
                return false;
            }
        }
        private void closeDevice()
        {
            try
            {
                if (dev != null && dev != IntPtr.Zero)
                {
                    vbar_channel_close(dev);
                    dev = IntPtr.Zero;
                }
            }
            catch (Exception ex)
            {

            }


        }
        byte[] iSetByte_ctl = new byte[64];
        //扫码开关
        private void controlScan(bool cswitch)
        {
            if (dev != null && dev != IntPtr.Zero)
            {
                if (cswitch)
                {
                    iSetByte_ctl[0] = 0x55;
                    iSetByte_ctl[1] = 0xAA;
                    iSetByte_ctl[2] = 0x05;
                    iSetByte_ctl[3] = 0x01;
                    iSetByte_ctl[4] = 0x00;
                    iSetByte_ctl[5] = 0x00;
                    iSetByte_ctl[6] = 0xfb;
                }
                else
                {
                    iSetByte_ctl[0] = 0x55;
                    iSetByte_ctl[1] = 0xAA;
                    iSetByte_ctl[2] = 0x05;
                    iSetByte_ctl[3] = 0x01;
                    iSetByte_ctl[4] = 0x00;
                    iSetByte_ctl[5] = 0x01;
                    iSetByte_ctl[6] = 0xfa;
                }
                vbar_channel_send(dev, iSetByte_ctl, 64);
            }

        }
        //背光控制
        byte[] iSetByte = new byte[64];
        private void backlight(bool bswitch)
        {
            if (dev != null && dev != IntPtr.Zero)
            {
                if (bswitch)
                {
                    iSetByte[0] = 0x55;
                    iSetByte[1] = 0xAA;
                    iSetByte[2] = 0x24;
                    iSetByte[3] = 0x01;
                    iSetByte[4] = 0x00;
                    iSetByte[5] = 0x01;
                    iSetByte[6] = 0xDB;
                }
                else
                {
                    iSetByte[0] = 0x55;
                    iSetByte[1] = 0xAA;
                    iSetByte[2] = 0x24;
                    iSetByte[3] = 0x01;
                    iSetByte[4] = 0x00;
                    iSetByte[5] = 0x00;
                    iSetByte[6] = 0xDA;
                }
                vbar_channel_send(dev, iSetByte, 64);
            }

        }
        private void readBlock()
        {
            if (dev != null && dev != IntPtr.Zero)
            {

                // 55 AA 51 09 60 19 FF FF FF FF FF FF 00 DE
                // 55 AA 51 08 60 19 FF FF FF FF FF FF DF
                // 0101 0101
                iSetByte[0] = 0x55;
                // 1010 1010
                iSetByte[1] = 0xAA;


                // 1111 1111
                // 0101 0001
                iSetByte[2] = 0x51;

                // 1010 1110
                // 0000 1001
                // 长度,2字节
                iSetByte[3] = 0x09;
                iSetByte[4] = 0x00;
                // 1010 0111
                // 块号 A
                // 0110 0000
                // 秘钥类型 A
                iSetByte[5] = 0x60;

                // 1100 0111
                // 块号 A
                // 0000 0000
                iSetByte[6] = 0x00;

                // 秘钥

                //

                iSetByte[7] = 0xFF;
                iSetByte[8] = 0xFF;

                // 1010 0111
                iSetByte[9] = 0xFF;
                iSetByte[10] = 0xFF;


                iSetByte[11] = 0xFF;
                iSetByte[12] = 0xFF;


                // 1100 0111
                // AUTO
                iSetByte[13] = 0x00;


                // 校验码
                iSetByte[14] = 0xC7;

                vbar_channel_send(dev, iSetByte, 64);
            }

        }

        //解码设置
        private bool getResultStr(out byte[] result_buffer, out int result_size, out bool isBlock)
        {
            byte[] c_result = new byte[1024];
            if (dev != null && dev != IntPtr.Zero)
            {
                byte[] bufferrecv = new byte[1024];
                byte[] bufferrecv_1 = new byte[1024];
                byte[] bufferrecv_2 = new byte[1024];
                vbar_channel_recv(dev, bufferrecv, 1024, 200);
                // 85=U
                if (bufferrecv[0] == 85 && bufferrecv[1] == 170 && bufferrecv[3] == 0)
                {
                    int datalen = bufferrecv[4] + ((bufferrecv[5] << 8));
                    byte[] readBuffers = new byte[datalen + 7];
                    if (datalen <= 1017)
                    {
                        for (int s1 = 0; s1 < datalen; s1++)
                        {
                            readBuffers[s1] = bufferrecv[6 + s1];
                        }

                    }
                    if (1017 < datalen && datalen <= 2041)
                    {
                        for (int s1 = 0; s1 < 1018; s1++)
                        {
                            readBuffers[s1] = bufferrecv[6 + s1];
                        }
                        vbar_channel_recv(dev, bufferrecv_1, 1024, 200);
                        for (int s2 = 0; s2 < datalen + 7 - 1025; s2++)
                        {
                            readBuffers[s2 + 1018] = bufferrecv_1[s2];
                        }
                    }
                    if (2041 < datalen && datalen <= 3065)
                    {
                        for (int s1 = 0; s1 < 1018; s1++)
                        {
                            readBuffers[s1] = bufferrecv[6 + s1];
                        }
                        vbar_channel_recv(dev, bufferrecv_1, 1024, 200);
                        for (int s2 = 0; s2 < 1024; s2++)
                        {
                            readBuffers[s2 + 1018] = bufferrecv_1[s2];
                        }
                        vbar_channel_recv(dev, bufferrecv_2, 1024, 200);
                        for (int s3 = 0; s3 < datalen + 7 - 2049; s3++)
                        {
                            readBuffers[s3 + 1018 + 1024] = bufferrecv_2[s3];
                        }
                    }
                    result_buffer = readBuffers;
                    result_size = datalen;
                    isBlock = false;
                    if (bufferrecv[2] == 0x51)  // 81,  Q
                    {
                        isBlock = true;
                    }
                    return true;

                }
                else
                {
                    result_buffer = null;
                    result_size = 0;
                    isBlock = false;
                    return false;
                }
            }
            else
            {
                result_buffer = null;
                result_size = 0;
                isBlock = false;
                return false;
            }
        }
        /// <summary>
        /// 获取刷卡卡片Code
        /// </summary>
        /// <returns>Code</returns>
        public string GetScanCode()
        {
            byte[] result = null;
            bool isBlock = false;
            string sResult = null;
            int size;
            if (this.getResultStr(out result, out size, out isBlock))
            {
                string code = System.Text.ASCIIEncoding.ASCII.GetString(result);
                return code;
            }
            return null;
        }

        public void Dispose()
        {
            closeDevice();
        }
    }
}
