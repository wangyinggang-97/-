using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.Header;
using System.Text.Json;
namespace test.Device
{
    public  class DataFrameItem
    {
        public bool bHead { get; set; }
        public bool bFunc { get; set; }
        public bool bmainAddr { get; set; }
        public bool bscreenAddr { get; set; }
        public bool blineIndex { get; set; }
        public bool bLen { get; set; }
        public bool bData { get; set; }
        public bool bCrc { get; set; }
        public bool bTail { get; set; }
        public byte head { get; set; }
        public FuncCodeEnum func { get; set; }
        public byte mainAddr { get; set; }
        public byte screenAddr { get; set; }
        public byte lineIndex { get; set; }
        public byte len { get; set; }
        public byte[] data { get; set; }
        public byte tail { get; set; }

        public DataFrameItem()
        {
            bHead = false;
            bFunc = false;
            bmainAddr = false;
            bscreenAddr = false;
            blineIndex = false;
            bLen = false;
            bData = false;
            bCrc = false;
            bTail = false;
        }
        public byte[] ToArray()
        {
            int nDataLen = 0;
            if (data != null && data.Length > 0)
            {
                nDataLen = data.Length;
            }

            byte tmpCrc = 0;

            byte[] ret;
            switch (func)
            {
                case FuncCodeEnum.GetWenShiDu:
                case FuncCodeEnum.ShowText:
                case FuncCodeEnum.OpenLight:
                case FuncCodeEnum.CloseLight:
                case FuncCodeEnum.CloseDoor:
                case FuncCodeEnum.OpenDoor:
                case FuncCodeEnum.QueryStatus:
                case FuncCodeEnum.AutoSend:
                case FuncCodeEnum.PullPushRod:
                case FuncCodeEnum.SetDrawerModel:
                case FuncCodeEnum.GetWeight:
                case FuncCodeEnum.Peel:
                case FuncCodeEnum.CheckPrecision:
                case FuncCodeEnum.AutoReset:
                case FuncCodeEnum.DropMedicine:
                case FuncCodeEnum.SingleInventory:
                case FuncCodeEnum.LoopGetWeight:
                case FuncCodeEnum.MotorControl:
                case FuncCodeEnum.ObjectMonitoring:
                case FuncCodeEnum.RodMonitoring:
                case FuncCodeEnum.OpenSplashScreen:
                case FuncCodeEnum.TakeMonitoring:
                case FuncCodeEnum.GetWeightInfo:
                case FuncCodeEnum.UpdateWeightInfo:
                    {
                        #region 显示文字
                        ret = new byte[nDataLen + 8];
                        ret[0] = head;
                        ret[1] = (byte)func;
                        ret[2] = mainAddr;
                        ret[3] = screenAddr;
                        ret[4] = lineIndex;
                        ret[5] = len;

                        //计算crc
                        for (int i = 0; i <= 5; i++)
                        {
                            tmpCrc += ret[i];
                        }

                        //填充数据部分的字节
                        if (nDataLen > 0)
                        {
                            Array.Copy(data, 0, ret, 6, data.Length);
                        }
                        #endregion
                    }
                    break;
                default:
                    throw new Exception("func值不合法!当前值为:" + func.ToString());
            }

            ret[ret.Length - 2] = tmpCrc;
            ret[ret.Length - 1] = tail;

            return ret;
        }
        public override string ToString()
        {
            return JsonSerializer.Serialize(this);
        }
        public static string DataToString(byte[] data)
        {
            StringBuilder sb = new StringBuilder();
            byte[] arr = data;
            if (arr != null)
            {
                for (int i = 0; i < arr.Length; i++)
                {
                    sb.Append(arr[i].ToString("X2"));
                }
            }
            return sb.ToString();
        }
        public static byte[] StringToData(string str)
        {
            byte[] data;
            if (string.IsNullOrEmpty(str))
                return null;
            int strLen = str.Length;
            if (strLen % 2 == 1)
            {
                str = "0" + str;
                strLen = strLen + 1;
            }
            int len = strLen / 2;


            data = new byte[len];

            for (int i = 0; i < len; i++)
            {

                data[i] = (byte)Convert.ToInt32(str.Substring(i * 2, 2), 16);
            }
            return data;
        }
    }
}
