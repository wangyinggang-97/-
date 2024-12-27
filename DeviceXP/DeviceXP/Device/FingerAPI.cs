using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Reflection.Emit;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Xml.XPath;

namespace test.Device
{
    internal class FingerAPI : System.IDisposable
    {
        //设备数
        [DllImport("FingerVeinDLL_X64.dll", EntryPoint = "fvdev_get_count", CharSet = CharSet.Ansi)]
        private static extern bool fvdev_get_count(ref int count);

        //设备打开
        [DllImport("FingerVeinDLL_X64.dll", EntryPoint = "fvdev_open", CharSet = CharSet.Ansi)]
        private static extern bool fvdev_open(int devno, IntPtr hwnd);

        //设备关闭
        [DllImport("FingerVeinDLL_X64.dll", EntryPoint = "fvdev_close", CharSet = CharSet.Ansi)]
        private static extern bool fvdev_close();

        //1:1比对
        [DllImport("FingerVeinDLL_X64.dll", EntryPoint = "fv_match", CharSet = CharSet.Ansi)]
        private static extern bool fv_match(ref byte img, int imgLen, ref byte model, ref float score);

        //1:N比对
        [DllImport("FingerVeinDLL_X64.dll", EntryPoint = "fv_user_index", CharSet = CharSet.Ansi)]
        private static extern bool fv_user_index(ref byte img, int len, ref int indexID, float threshold, ref float score, bool bUpdate);

        //设备探测状态
        [DllImport("FingerVeinDLL_X64.dll", EntryPoint = "fvdev_get_state", CharSet = CharSet.Ansi)]
        private static extern bool fvdev_get_state(ref int state);//0没有，3手指正常按压

        //取得原图
        [DllImport("FingerVeinDLL_X64.dll", EntryPoint = "fvdev_grab", CharSet = CharSet.Ansi)]
        private static extern bool fvdev_grab(ref byte img, ref int len);//初值不小于78000个字节

        //取得jpg图
        [DllImport("FingerVeinDLL_X64.dll", EntryPoint = "fvdev_getJpg", CharSet = CharSet.Ansi)]
        private static extern bool fvdev_getJpg(ref byte img, ref int len, ref byte imgDec);

        //检测手指图质量
        [DllImport("FingerVeinDLL_X64.dll", EntryPoint = "fv_quality", CharSet = CharSet.Ansi)]
        private static extern bool fv_quality(byte[] img, int len, ref int a, ref int q);//0质量通过，2001不好，2003不行

        //获取模板
        [DllImport("FingerVeinDLL_X64.dll", EntryPoint = "fv_extract_model", CharSet = CharSet.Ansi)]
        private static extern bool fv_extract_model(ref byte picData1, int picLen1, ref byte picData2, int picLen2, ref byte picData3, int picLen3, ref byte model, ref int modelLen);

        //添加用户
        [DllImport("FingerVeinDLL_X64.dll", EntryPoint = "fv_user_add", CharSet = CharSet.Ansi)]
        private static extern bool fv_user_add(byte[] picData1, int picLen1, byte[] picData2, int picLen2, byte[] picData3, int picLen3, ref uint indexID);

        //删除用户
        [DllImport("FingerVeinDLL_X64.dll", EntryPoint = "fv_user_del", CharSet = CharSet.Ansi)]
        private static extern bool fv_user_del(uint indexID);

        //调入之前/设定dat文件为模板存储目录
        [DllImport("FingerVeinDLL_X64.dll", EntryPoint = "fv_load_model", CharSet = CharSet.Ansi)]
        private static extern bool fv_load_model(string modelPath, ref int num);
        private int iFdevs = 0;
        private bool bFopen = false;
        public FingerAPI()
        {
            try
            {
                this.OpenDev();
                // 重新加载设备中的指纹
                this.ReLoad();
            }
            catch
            {
            }
        }

        private void CloseDev()
        {
            try
            {
                if (fvdev_close())
                {
                    bFopen = false;
                }
            }
            catch
            {

            }
        }

        private bool IsOpen()
        {
            if (bFopen)
                return true;
            return false;
        }

        private bool OpenDev()
        {
            try
            {
                if (bFopen)
                {
                    CloseDev();
                    bFopen = false;
                }

                iFdevs = 0;
                fvdev_get_count(ref iFdevs);
                if (iFdevs > 0)
                {
                    bFopen = fvdev_open(0, IntPtr.Zero);
                    if (bFopen)
                    {
                        string spath = Application.StartupPath + "\\model";

                        spath = spath.Replace("\\\\", "\\");
                        if (!System.IO.Directory.Exists(spath))
                        {
                            try
                            {
                                System.IO.Directory.CreateDirectory(spath);
                            }
                            catch (Exception)
                            {
                                return false;
                            }
                        }

                        int inum = 0; // unused
                        if (fv_load_model(spath, ref inum))
                        {
                            // this.Text = "模板加载成功";
                            return true;
                        }
                    }
                }


            }
            catch (Exception ex)
            {
                bFopen = false;
                MessageBox.Show(ex.Message);
            }

            return false;
        }
        private bool DeleteFinger(int ID)
        {
            if (!bFopen)
            {
                return false;
            }

            if (ID > 0)
            {
                uint ifv = Convert.ToUInt32(ID);


                if (ifv > 0)
                {
                    if (fv_user_del(ifv))
                    {
                        return true;
                    }
                    else
                    {
                        return false;
                    }
                }
                else
                {
                    return false;
                }
            }
            else
            {
                return false;
            }
        }

        public bool ReLoad()
        {
            if (bFopen)
            {
                string spath = Application.StartupPath + "\\model";

                spath = spath.Replace("\\\\", "\\");
                if (!System.IO.Directory.Exists(spath))
                {
                    try
                    {
                        System.IO.Directory.CreateDirectory(spath);
                    }
                    catch (Exception)
                    {
                        return false;
                    }
                }

                int inum = 0; // unused
                if (fv_load_model(spath, ref inum))
                {
                    // this.Text = "模板加载成功";

                    return true;
                }
            }
            return false;
        }
        /// <summary>
        /// 获取静脉（指纹）器按压状态
        /// </summary>
        /// <returns>-1 设备未打开 1 已按压 2 未安压</returns>
        public int GetFingerState()
        {
            try
            {
                //OpenDev();
                if (!bFopen)
                {
                    return -1;
                }

                int ista = 0;
                if (fvdev_get_state(ref ista))
                {
                    if (ista == 3)
                    {
                        return 1;
                    }
                    else
                    {
                        return 2;
                    }
                }
                else
                {
                    return 2;
                }
            }
            catch (Exception ex)
            {
                return 2;
            }


        }
        /// <summary>
        /// 获取指纹识别身份ID（0表示没有识别身份）
        /// </summary>
        /// <returns></returns>
        public int GetIdentyUserID()
        {

            if (!bFopen)
            {
                return 0;
            }

            int ista = 0;
            if (fvdev_get_state(ref ista))
            {
                if (ista == 3)
                {
                    byte[] bimg = new byte[80000];
                    int ilen = bimg.Length;
                    if (fvdev_grab(ref bimg[0], ref ilen))
                    {
                        byte[] btmp = new byte[ilen];
                        Array.Copy(bimg, btmp, ilen);
                        bimg = btmp;

                        int ia = 0;
                        int iq = -1;
                        if (fv_quality(bimg, ilen, ref ia, ref iq))
                        {
                            if (iq == 0)
                            {
                                // FIXME
                                int iin = 0;
                                float ft = 0.9f;
                                float fs = 0.0f;
                                if (fv_user_index(ref bimg[0], ilen, ref iin, ft, ref fs, false))
                                {
                                    if (fs > 0.6)
                                    {
                                        if (iin > 0)//成功
                                        {
                                            return iin;
                                        }
                                    }
                                    else
                                    {
                                        return -1;
                                    }

                                }
                                else
                                {
                                    return -2; //失败，该手指未注册
                                }
                            }
                            else
                            {
                                return -3;
                            }
                        }
                        else
                        {
                            return -4;
                        }
                    }
                    else
                    {
                        return -5;
                    }

                }
                else
                {
                    return -6;
                }
            }
            else
            {
                return -7;
            }
            return 0;

        }

        private bool upFingre = true;
        private bool downFingre = false;
        private DateTime DownDate = DateTime.Now;
        /// <summary>
        /// 采集指纹（需要采集4次），第4次保存保存用户ID
        /// </summary>
        /// <param name="result">本次采集返回结果</param>
        /// <param name="userID">4次成功后保存的指纹ID</param>
        /// <returns>>本次采集返回状态</returns>
        public int CreateFingreRecord(out string result,uint userID)
        {
            result = "";
            int ista = 0;
            if (fvdev_get_state(ref ista))
            {
                if (ista == 3)
                {

                    byte[] bimg = new byte[80000];
                    int ilen = bimg.Length;
                    if (fvdev_grab(ref bimg[0], ref ilen))
                    {
                        if (!upFingre)
                        {
                            result = "请抬起手指";
                            return -1;
                        }

                        if (downFingre == false)
                        {
                            DownDate = DateTime.Now;
                            downFingre = true;
                            result = "请抬起手指";
                            return -1;
                        }

                        if (DownDate.AddSeconds(1) > DateTime.Now)
                        {
                            //result = $@"正在按压手指, 请等待{(DownDate.AddSeconds(1) - DateTime.Now).TotalSeconds.ToString("0.##")}秒";
                            result = $@"请等待";
                            return -1;
                        }

                        byte[] btmp = new byte[ilen];
                        Array.Copy(bimg, btmp, ilen);
                        bimg = btmp;

                        int ia = 0; int iq = -1;
                        if (fv_quality(bimg, ilen, ref ia, ref iq))
                        {
                            if (iq == 0)
                            {
                                int iin = 0;
                                float ft = 0.0f;
                                float fs = 0.0f;
                                if (fv_user_index(ref bimg[0], ilen, ref iin, ft, ref fs, false))
                                {
                                    if (iin > 0)
                                    {
                                        result = "该手指已注册";
                                        return -1;
                                    }
                                    else
                                    {
                                        string vResult = fvuserIndesOF(bimg, ilen, out result, userID); // 手指可用
                                        if (vResult == "已采集")
                                        {
                                            result = "成功";
                                            return 1;
                                        }
                                        else
                                        {
                                            result = vResult;
                                            return -1;
                                        }
                                    }
                                }
                                else
                                {
                                    string vResult=fvuserIndesOF(bimg, ilen, out result, userID); // 手指可用
                                    if (vResult == "已采集")
                                    {
                                        result = "成功";
                                        return 1;
                                    }
                                    else
                                    {
                                        result = vResult;
                                        return -1;
                                    }
                                }
                            }
                            else
                            {
                                result = "请重新录入";//图片质量不合格
                                string str = "";
                                if (iq == 2001)
                                {
                                    str = "压力过大";
                                }
                                else if (iq == 2002)
                                {
                                    str = "指位不正";
                                }
                                else if (iq == 2003)
                                {
                                    str = "漏光";
                                }

                                else if (iq == 2007)
                                {
                                    str = "能量不足";
                                }

                                if (!string.IsNullOrEmpty(str))
                                {
                                    result = "iq:" + iq + "," + str;
                                }
                                else
                                {
                                    result = "iq:" + iq;
                                }
                            }
                        }
                        else
                        {
                            result = "请重新录入";//图片质量不合格！
                        }
                    }
                    else
                    {
                        result = "请稍等";//采图出错"未获取到图片";
                    }
                }
                else
                {
                    upFingre = true;//已抬起手指
                    downFingre = false;
                    DownDate = DateTime.Now;
                    result = "请按指纹";
                    Thread.Sleep(500);
                }
            }
            return -1;
        }
        private int iFingerCount = 1;
        byte[] bFingerImage1 = new byte[0];
        byte[] bFingerImage2 = new byte[0];
        byte[] bFingerImage3 = new byte[0];
        byte[] bOutModel1;
        byte[] bOutModel2;
        byte[] bOutModel3;
        private string fvuserIndesOF(byte[] bimg, int ilen, out string result,uint userID)
        {
            byte[] bImage = new byte[1];
            //byte[] bOutModel = new byte[ilen];
            byte[] bOutModel = new byte[3352];
            int bOutModelLen = bOutModel.Length;
            if (fv_extract_model(ref bimg[0], ilen, ref bImage[0], 0, ref bImage[0], 0, ref bOutModel[0], ref bOutModelLen))
            {
                if (iFingerCount == 1)
                {
                    bFingerImage1 = bimg;
                    bOutModel1 = bOutModel;
                }
                else if (iFingerCount == 2)
                {
                    float score = 0;
                    if (fv_match(ref bimg[0], bimg.Length, ref bOutModel1[0], ref score))
                    {
                        if (score < 0.55)
                        {
                            result = "不是同一手指";
                            return result;
                        }
                    }
                    else
                    {
                        result = "不是同一手指";
                        return result;
                    }
                    bFingerImage2 = bimg;
                    bOutModel2 = bOutModel;
                }
                else if (iFingerCount == 3)
                {
                    float score = 0.0f;
                    //3和1比较
                    if (fv_match(ref bimg[0], bimg.Length, ref bOutModel1[0], ref score))
                    {
                        if (score < 0.55)
                        {
                            result = "不是同一手指";
                            return result;
                        }
                    }
                    else
                    {
                        result = "不是同一手指";
                        return result;
                    }
                    //3和2比较
                    if (fv_match(ref bimg[0], bimg.Length, ref bOutModel2[0], ref score))
                    {
                        if (score < 0.55)
                        {
                            result = "不是同一手指";
                            return result;
                        }
                    }
                    else
                    {
                        result = "不是同一手指";
                        return result;
                    }

                    bFingerImage3 = bimg;
                    bOutModel3 = bOutModel;
                }
                result = "已采集";
                upFingre = false;
                if (iFingerCount <= 4)
                {
                    iFingerCount++;
                }
                if (iFingerCount == 5)
                {
                    //建模
                    CreateFingre(userID);
                }
            }
            else
            {
                result = "请重新录入";
            }
            return result;
        }
        private void CreateFingre(uint userID)
        {
            if (fv_user_add(bFingerImage1, bFingerImage1.Length, bFingerImage2, bFingerImage2.Length, bFingerImage3, bFingerImage3.Length, ref userID))
            {
                this.ReLoad();
            }
        }

        public void Dispose()
        {
            try
            {
                if (bFopen)
                {
                    CloseDev();
                }
            }
            catch
            {
            }
        }
    }
}