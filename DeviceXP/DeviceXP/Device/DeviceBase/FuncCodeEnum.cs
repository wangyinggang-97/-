using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace test.Device
{
    public enum FuncCodeEnum
    {
        /// <summary>
        /// 要求屏幕显示指定的内容
        /// </summary>
        ShowText = 0x01,

        /// <summary>
        /// 开门
        /// </summary>
        OpenDoor = 0x02,

        /// <summary>
        /// 关门
        /// </summary>
        CloseDoor = 0x03,

        /// <summary>
        /// 查询副柜门和主柜抽屉门的状态
        /// </summary>
        QueryStatus = 0x04,

        /// <summary>
        /// 开灯
        /// </summary>
        OpenLight = 0x05,

        /// <summary>
        /// 关灯
        /// </summary>
        CloseLight = 0x06,

        /// <summary>
        /// 针剂相关 单独盘点（单格盘点)
        /// </summary>
        SingleInventory = 0x07,

        /// <summary>
        /// 称重相关 循环重力查询开关
        /// </summary>
        LoopGetWeight = 0x08,

        /// <summary>
        /// 推拉杆
        /// </summary>
        PullPushRod = 0x0C,


        /// <summary>
        /// 针剂发药
        /// </summary>
        AutoSend = 0x19,
        /// <summary>
        /// 获取称重数据
        /// </summary>
        GetWeight = 0x20,
        /// <summary>       
        /// 校准     
        /// </summary>
        CheckPrecision = 0x21,
        /// <summary>
        /// 去皮
        /// </summary>
        Peel = 0x22,
        /// <summary>
        /// 电机开合
        /// </summary>
        DropMedicine = 0x23,
        /// <summary>
        /// 设置模式
        /// </summary>
        SetDrawerModel = 0x24,
        /// <summary>
        /// 针剂重置履带转动计数
        /// </summary>
        AutoReset = 0x25,

        /// <summary>
        /// 转动电机
        /// </summary>
        MotorControl = 0x26,

        /// <summary>
        /// 拿药检测
        /// </summary>
        TakeMonitoring = 0x27,

        /// <summary>
        /// 开闪屏
        /// </summary>
        OpenSplashScreen = 0x28,

        ///// <summary>
        ///// 卡药检测
        ///// </summary>
        //StuckMonitoring = 0x28,

        /// <summary>
        /// 物体监测回收是否有药瓶
        /// </summary>
        ObjectMonitoring = 0x29,

        /// <summary>
        /// 获取称重初值和系数
        /// </summary>
        GetWeightInfo = 0x2B,

        /// <summary>
        /// 更新称重初值和系数
        /// </summary>
        UpdateWeightInfo = 0x2C,


        /// <summary>
        /// 物体监测
        /// </summary>
        RodMonitoring = 0x30,

        /// <summary>
        /// 获取温湿度 
        /// </summary>
        GetWenShiDu = 0x09,
    }
}
