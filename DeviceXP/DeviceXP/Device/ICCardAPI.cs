using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using test.Device.DeviceBase;
using HFrfid;
using System.Windows.Forms;
namespace DeviceXP.Device
{
    public class ICCardAPI:System.IDisposable
    {
        RfidReader Reader = new RfidReader();
        public bool IsOpen { get; set; } = false;
        public ICCardAPI(string comName, int baudRate = 9600, int timeOut = 1000) 
        {
            if (IsOpen)
            {
                Reader.DisConnect();
            }
            try
            {
                bool flg = Reader.Connect(comName, baudRate);
                if (flg == true)
                {
                    IsOpen = true;
                }
                else
                {
                    IsOpen = false;
                }

            }
            catch(System.Exception err)
            {
                IsOpen = false;
                MessageBox.Show(err.Message);
            }
        }
        public int GetICCardID(out string Block)
        {
            Block = "";
            int status;
            byte[] type = new byte[2];
            byte[] id = new byte[4];

            Reader.Cmd = Cmd.M1_ReadId;//读卡号命令
            Reader.Addr = 0x20;//读写器地址,设备号
            Reader.Beep = Beep.On;

            status = Reader.M1_Operation();
            if (status == 0)//读卡成功
            {
                for (int i = 0; i < 2; i++)//获取2字节卡类型
                {
                    type[i] = Reader.RxBuffer[i];
                }
                for (int i = 0; i < 04; i++)//获取4字节卡号
                {
                    id[i] = Reader.RxBuffer[i + 2];
                }
                // 卡类型
                string CardType = byteToHexStr(type, 2);
                string CardNo = byteToHexStr(id, 4);
                Block = CardNo;
            }
            else
            {
                // "错误码：" + status.ToString();
                //- 1 代表数据长度或者缓冲区长度错误 
                //- 2 代表命令错误 
                //- 3 代表读写器返回数据错误 
                //- 4 代表 M1 卡操作失败，比如读数据块失败。 
                //- 5 代表读写器返回数据超时 
                //- 6 代表串口错误
            }
            return status;
        }
        public int GetICCardBlock(out string Block)
        {
            int status;
            Block = "";
            byte[] blockdata = new byte[16];
            Reader.Cmd = Cmd.M1_KeyA_ReadBlock; //读卡数据块命令，验证KeyA
            Reader.Addr = 0x20; //读写器地址
            Reader.M1Block = 0;//数据块块号
            Reader.Beep = Beep.On;//读数据块成功蜂鸣器提示

            status = Reader.M1_Operation();//读操作
            if (status == 0)//读成功
            {
                for (int i = 0; i < 16; i++)
                {
                    blockdata[i] = Reader.RxBuffer[i];//获取读到的数据，将读到的数据拷贝到blockdata数组
                }
                string ss = byteToHexStr(blockdata, 16); //将读取的数据转换成字符串
                Block = ss;
            }
            else
            {
                //textBoxStatus.Text = "错误码：" + status.ToString();//错误码参照DLL说明手册
            }
            return status;
        }
        public string byteToHexStr(byte[] bytes, int len)  //数组转十六进制字符
        {
            string returnStr = "";
            if (bytes != null)
            {
                for (int i = 0; i < len; i++)
                {
                    returnStr += bytes[i].ToString("X2");
                }
            }
            return returnStr;
        }

        public void Dispose()
        {
            if (IsOpen)
            {
                Reader.DisConnect();
                IsOpen = false;
            }
        }
    }
}
