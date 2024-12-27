using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using test.Device.DeviceBase;

namespace test.Device
{
    public class RecycleAPI : SerialPortBase
    {
        public RecycleAPI(string comName, int baudRate = 9600, int timeOut = 1000) : base("RecycleAPI", comName, baudRate, timeOut)
        {

        }
        public int GetRecycleWatch(byte mainAddr, byte doorAddr)
        {
            DataFrameItem req = new DataFrameItem();
            req.head = 0x7E;
            req.func = FuncCodeEnum.ObjectMonitoring;
            req.mainAddr = mainAddr;
            req.screenAddr = doorAddr;
            req.lineIndex = 0x01;
            req.len = 0x01;

            req.data = new byte[1];
            req.data[0] = 0x01;

            //crc可以自动计算，不用管
            req.tail = 0x68;

            WriteBuffer(req);
            DataFrameItem df = ReadBuffer(FuncCodeEnum.ObjectMonitoring);
            if (df == null)
                return -1;
            //int rang = ((int)df.data[0] % 16) == 2 ? 1 : 0; //1表示有，0表示无
            //return rang;
            return df.data[0];
        }
        public void OpenLight(byte mainAddr, byte doorAddr, byte line)
        {
            DataFrameItem req = new DataFrameItem();
            req.head = 0x7E;
            req.func = FuncCodeEnum.OpenLight;
            req.mainAddr = mainAddr;
            req.screenAddr = doorAddr;
            req.lineIndex = line;
            req.len = 0x01;

            req.data = new byte[1];
            req.data[0] = 0x01;

            //crc可以自动计算，不用管
            req.tail = 0x68;

            WriteBuffer(req);
            req = ReadBuffer(FuncCodeEnum.OpenLight);
        }
        public void CloseLight(byte mainAddr, byte doorAddr, byte line)
        {
            DataFrameItem req = new DataFrameItem();
            req.head = 0x7E;
            req.func = FuncCodeEnum.CloseLight;
            req.mainAddr = mainAddr;
            req.screenAddr = doorAddr;
            req.lineIndex = line;
            req.len = 0x01;

            req.data = new byte[1];
            req.data[0] = 0x01;

            //crc可以自动计算，不用管
            req.tail = 0x68;

            WriteBuffer(req);
            req = ReadBuffer(FuncCodeEnum.CloseLight);
        }
        /// <summary>
        /// 回收拍照前转动
        /// </summary>
        /// <param name="mainAddr"></param>
        /// <param name="doorAddr"></param>
        /// <param name="timeInterval"></param>
        public void RotateMotor(int mainAddr, int doorAddr, int timeInterval = 169)
        {
            DataFrameItem req = new DataFrameItem();
            req.head = 0x7E;
            req.func = FuncCodeEnum.MotorControl;
            req.mainAddr = (byte)mainAddr;
            req.screenAddr = (byte)doorAddr;
            req.lineIndex = 0x01;
            req.len = 0x01;
            req.data = new byte[1];
            req.data[0] = (byte)timeInterval;

            //crc可以自动计算，不用管
            req.tail = 0x68;
            WriteBuffer(req);
            req = ReadBuffer(FuncCodeEnum.MotorControl);
        }
        public void OpenMotor(int mainAddr, int doorAddr)
        {
            DataFrameItem req = new DataFrameItem();
            req.head = 0x7E;
            req.func = FuncCodeEnum.DropMedicine;
            req.mainAddr = (byte)mainAddr;
            req.screenAddr = (byte)doorAddr;
            req.lineIndex = 0x01;
            req.len = 0x01;
            req.data = new byte[1];
            req.data[0] = (byte)0x01;

            //crc可以自动计算，不用管
            req.tail = 0x68;
            WriteBuffer(req);
            req = ReadBuffer(FuncCodeEnum.DropMedicine);

        }
    }
}
