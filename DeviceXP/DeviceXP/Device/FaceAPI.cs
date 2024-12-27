using AForge.Controls;
using AForge.Imaging.Filters;

//using AForge.Imaging;
using AForge.Video.DirectShow;
using ArcSoftFace.SDKModels;
using ArcSoftFace.SDKUtil;
using ArcSoftFace.Utils;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;
namespace DeviceXP
{
    public class FaceAPI : System.IDisposable
    {
        private VideoSourcePlayer videoSourcePlayer = null;
        private VideoCaptureDevice videoSource = null;
        public FaceAPI(string deviceID)
        {
            try
            {
                InitEngines();
                videoSourcePlayer = new VideoSourcePlayer();
                videoSource = new VideoCaptureDevice(deviceID);
                var cap = videoSource.VideoCapabilities.FirstOrDefault();
                if (cap == null)
                    return;
                int width = cap.FrameSize.Width;
                int height = cap.FrameSize.Height;
                videoSource.DesiredFrameSize = new System.Drawing.Size(width, height);
                videoSource.DesiredFrameRate = 1;
                videoSourcePlayer.VideoSource = videoSource;
                videoSourcePlayer.Visible = false;
                videoSourcePlayer.Start();
            }
            catch (System.Exception err)
            {
                MessageBox.Show("FaceAPI:" + err.Message+" "+err.StackTrace);
            }
        }
        public Bitmap GetCameraIMG()
        {
            var bitMap = videoSourcePlayer.GetCurrentVideoFrame();
            return bitMap;
        }
        private string PATH = Application.StartupPath + "\\Face\\";
        public Image GetFaceIdentIMG(int userID)
        {
            System.IO.Directory.CreateDirectory(PATH);

            Image image = videoSourcePlayer.GetCurrentVideoFrame();
            if (image == null)
                return null;
            if (image.Width > 1536 || image.Height > 1536)
            {
                image = ArcSoftFace.Utils.ImageUtil.ScaleImage(image, 1536, 1536);
            }
            if (image.Width % 4 != 0)
            {
                image = ImageUtil.ScaleImage(image, image.Width - (image.Width % 4), image.Height);
            }
            ASF_MultiFaceInfo multiFaceInfo = FaceUtil.DetectFace(pImageEngine, image);
            //判断检测结果
            if (multiFaceInfo.faceNum > 0)
            {
                MRECT rect = MemoryUtil.PtrToStructure<MRECT>(multiFaceInfo.faceRects);
                image = ImageUtil.CutImage(image, rect.left, rect.top, rect.right, rect.bottom);
                image.Save(PATH + userID.ToString() + ".jpg");
                return image;
            }
            else
            {
                return null;
            }
        }
        public int GetFaceUserID(Bitmap bitmap)
        {
            if (bitmap == null)
            {
                return -1;
            }
            //检测人脸，得到Rect框
            ASF_MultiFaceInfo multiFaceInfo = FaceUtil.DetectFace(pVideoEngine, bitmap);
            //得到最大人脸
            ASF_SingleFaceInfo maxFace = FaceUtil.GetMaxFace(multiFaceInfo);
            //得到Rect
            MRECT rect = maxFace.faceRect;
            //检测RGB摄像头下最大人脸
            //Graphics g = e.Graphics;
            float offsetX = videoSourcePlayer.Width * 1f / bitmap.Width;
            float offsetY = videoSourcePlayer.Height * 1f / bitmap.Height;
            float x = rect.left * offsetX;
            float width = rect.right * offsetX - x;
            float y = rect.top * offsetY;
            float height = rect.bottom * offsetY - y;
            //根据Rect进行画框
            //g.DrawRectangle(Pens.GreenYellow, x, y, width, height);
            //if (trackRGBUnit.message != "" && x > 0 && y > 0)
            //{
            //    //将上一帧检测结果显示到页面上
            //    g.DrawString(trackRGBUnit.message, font, trackRGBUnit.message.Contains("活体") ? YesBrush : NoBrush, x, y - 15);

            //}

            //保证只检测一帧，防止页面卡顿以及出现其他内存被占用情况
            if (isRGBLock == false)
            {
                isRGBLock = true;
                //异步处理提取特征值和比对，不然页面会比较卡
                if (rect.left != 0 && rect.right != 0 && rect.top != 0 && rect.bottom != 0)
                {
                    try
                    {
                        lock (rectLock)
                        {
                            allRect.left = (int)(rect.left * offsetX);
                            allRect.top = (int)(rect.top * offsetY);
                            allRect.right = (int)(rect.right * offsetX);
                            allRect.bottom = (int)(rect.bottom * offsetY);
                        }

                        bool isLiveness = false;

                        //调整图片数据，非常重要
                        ArcSoftFace.Entity.ImageInfo imageInfo = ImageUtil.ReadBMP(bitmap);
                        if (imageInfo == null)
                        {
                            //trackRGBUnit.message = "null";
                        }
                        int retCode_Liveness = -1;
                        //RGB活体检测
                        //ASF_LivenessInfo liveInfo = FaceUtil.LivenessInfo_RGB(CommClassParam.FaceService.pVideoRGBImageEngine, imageInfo, multiFaceInfo, out retCode_Liveness);
                        ////判断检测结果
                        //if (retCode_Liveness == 0 && liveInfo.num > 0)
                        //{
                        //    int isLive = MemoryUtil.PtrToStructure<int>(liveInfo.isLive);
                        //    isLiveness = (isLive == 1) ? true : false;
                        //}
                        //if (imageInfo != null)
                        //{
                        //    MemoryUtil.Free(imageInfo.imgData);
                        //}
                        if (/*isLiveness*/true)
                        {
                            //提取人脸特征
                            IntPtr feature = FaceUtil.ExtractFeature(pVideoRGBImageEngine, bitmap, maxFace);
                            float similarity = 0f;
                            string userId;
                            //得到比对结果
                            int userid = compareFeature(feature, out similarity);
                            MemoryUtil.Free(feature);
                            if (userid > -1)
                            {
                                return userid;

                            }
                            else
                            {
                                //.TextSpeakService?.TextSpeak("人脸匹配失败");
                            }
                        }
                        else
                        {
                            //CommClassParam.TextSpeakService?.TextSpeak("未检测到活体");
                        }
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine(ex.Message);
                    }
                    finally
                    {
                        if (bitmap != null)
                        {
                            bitmap.Dispose();
                        }
                        isRGBLock = false;
                    }
                }
                else
                {
                    //CommClassParam.TextSpeakService?.TextSpeak("未检测到人脸");
                    lock (rectLock)
                    {
                        allRect.left = 0;
                        allRect.top = 0;
                        allRect.right = 0;
                        allRect.bottom = 0;
                    }
                }
                isRGBLock = false;
            }

            return -1;
        }
        private long maxSize = 1024 * 1024 * 2;
        /// <summary>
        /// 相似度
        /// </summary>
        private float threshold = 0.9f;
        private object rectLock = new object();
        private bool isRGBLock = false;
        private MRECT allRect = new MRECT();
        /// <summary>
        /// RGB 摄像头索引
        /// </summary>
        private int rgbCameraIndex = 0;
        /// <summary>
        /// IR 摄像头索引
        /// </summary>
        private int irCameraIndex = 0;
        /// <summary>
        /// 视频引擎Handle
        /// </summary>
        public IntPtr pVideoEngine = IntPtr.Zero;
        /// <summary>
        /// RGB视频引擎 FR Handle 处理   FR和图片引擎分开，减少强占引擎的问题
        /// </summary>
        public IntPtr pVideoRGBImageEngine = IntPtr.Zero;
        /// <summary>
        /// RGB摄像头设备
        /// </summary>
        private VideoCaptureDevice rgbDeviceVideo;
        /// <summary>
        /// IR摄像头设备
        /// </summary>
        private VideoCaptureDevice irDeviceVideo;
        private IntPtr pImageEngine = IntPtr.Zero;
        List<FaceUser> users = new List<FaceUser>();
        private int compareFeature(IntPtr feature, out float similarity)
        {
            if (users.Count == 0)
            {
                System.IO.FileInfo[] files = new System.IO.DirectoryInfo(PATH).GetFiles("*.jpg").Where(f => System.Text.RegularExpressions.Regex.IsMatch(f.Name, @"^\d+(\.\w+)?$")).OrderByDescending
                    (n => n.LastWriteTime).ToArray();
                foreach (var f in files)
                {
                    FaceUser user = new FaceUser();
                    user.Id = int.Parse(f.Name.Replace(f.Extension, ""));
                    user.FilePath = f.FullName;
                    users.Add(user);
                }
            }
            int result = -1;
            similarity = 0f;
            //如果人脸库不为空，则进行人脸匹配
            if (users != null && users.Count > 0)
            {
                for (int i = 0; i < users.Count; i++)
                {
                    string FilePath = users[i].FilePath;
                    FilePath = FilePath.Replace("/r/n", "");
                    //检测图片格式
                    if (!checkImage(FilePath))
                    {
                        continue;
                    }
                    DateTime detectStartTime = DateTime.Now;

                    //获取文件，拒绝过大的图片
                    System.IO.FileInfo fileInfo = new System.IO.FileInfo(FilePath);
                    if (fileInfo.Length > maxSize)
                    {
                        //MessageBox.Show("图像文件最大为2MB，请压缩后再导入!");
                        //AppendText(string.Format("检测结束，时间:{0}\n", DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss:ms")));
                        //AppendText("\n");
                        continue;
                    }

                    Image srcImage = ImageUtil.readFromFile(FilePath);
                    if (srcImage == null)
                    {
                        //MessageBox.Show("图像数据获取失败，请稍后重试!");
                        //AppendText(string.Format("检测结束，时间:{0}\n", DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss:ms")));
                        //AppendText("\n");
                        continue;
                    }
                    if (srcImage.Width > 800 || srcImage.Height > 800)
                    {
                        srcImage = ImageUtil.ScaleImage(srcImage, 800, 800);
                        //srcImage.Save(users[])
                    }
                    if (srcImage == null)
                    {
                        //MessageBox.Show("图像数据获取失败，请稍后重试!");
                        //AppendText(string.Format("检测结束，时间:{0}\n", DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss:ms")));
                        //AppendText("\n");
                        continue;
                    }
                    //调整图像宽度，需要宽度为4的倍数
                    if (srcImage.Width % 4 != 0)
                    {
                        srcImage = ImageUtil.ScaleImage(srcImage, srcImage.Width - (srcImage.Width % 4), srcImage.Height);
                    }
                    //srcImage = ImageUtil.ScaleImage(srcImage, picImageCompare.Width, picImageCompare.Height);
                    ASF_SingleFaceInfo singleFaceInfo = new ASF_SingleFaceInfo();
                    IntPtr userFeature = FaceUtil.ExtractFeature(pImageEngine, srcImage, out singleFaceInfo);
                    //调用人脸匹配方法，进行匹配
                    ASFFunctions.ASFFaceFeatureCompare(pVideoRGBImageEngine, feature, userFeature, ref similarity);
                    if (similarity >= threshold)
                    {
                        result = users[i].Id;
                        //将人脸加权
                        srcImage.Save(users[i].FilePath);
                        break;
                    }
                }
            }
            return result;
        }
        private bool checkImage(string imagePath)
        {
            if (imagePath == null)
            {
                return false;
            }
            try
            {
                //判断图片是否正常，如将其他文件把后缀改为.jpg，这样就会报错
                Image image = ImageUtil.readFromFile(imagePath);
                if (image == null)
                {
                    throw new Exception();
                }
                else
                {
                    image.Dispose();
                }
            }
            catch
            {
                return false;
            }
            System.IO.FileInfo fileCheck = new System.IO.FileInfo(imagePath);
            if (fileCheck.Exists == false)
            {
                return false;
            }
            else if (fileCheck.Length > maxSize)
            {
                return false;
            }
            else if (fileCheck.Length < 2)
            {
                return false;
            }
            return true;
        }
        private int InitEngines()
        {
            //读取配置文件
            AppSettingsReader reader = new AppSettingsReader();
            string appId = (string)reader.GetValue("APP_ID", typeof(string));
            string sdkKey64 = (string)reader.GetValue("SDKKEY64", typeof(string));
            string sdkKey32 = (string)reader.GetValue("SDKKEY32", typeof(string));
            rgbCameraIndex = (int)reader.GetValue("RGB_CAMERA_INDEX", typeof(int));
            //判断CPU位数
            var is64CPU = Environment.Is64BitProcess;
            if (string.IsNullOrWhiteSpace(appId) || string.IsNullOrWhiteSpace(is64CPU ? sdkKey64 : sdkKey32))
            {
                MessageBox.Show(string.Format("请在App.config配置文件中先配置APP_ID和SDKKEY{0}!", is64CPU ? "64" : "32"));
                return 0;
            }
            //在线激活引擎    如出现错误，1.请先确认从官网下载的sdk库已放到对应的bin中，2.当前选择的CPU为x86或者x64
            int retCode = 0;
            try
            {
                retCode = ASFFunctions.ASFActivation(appId, is64CPU ? sdkKey64 : sdkKey32);
            }
            catch (Exception ex)
            {
                if (ex.Message.Contains("无法加载 DLL"))
                {
                    //MessageBox.Show("请将sdk相关DLL放入bin对应的x86或x64下的文件夹中!");
                }
                else
                {
                    //MessageBox.Show("激活引擎失败!");
                }
                return 0;
            }
            //初始化引擎
            uint detectMode = DetectionMode.ASF_DETECT_MODE_IMAGE;
            //Video模式下检测脸部的角度优先值
            int videoDetectFaceOrientPriority = ASF_OrientPriority.ASF_OP_0_HIGHER_EXT;
            //Image模式下检测脸部的角度优先值
            int imageDetectFaceOrientPriority = ASF_OrientPriority.ASF_OP_0_ONLY;
            //人脸在图片中所占比例，如果需要调整检测人脸尺寸请修改此值，有效数值为2-32
            int detectFaceScaleVal = 16;
            //最大需要检测的人脸个数
            int detectFaceMaxNum = 5;
            //引擎初始化时需要初始化的检测功能组合
            int combinedMask = FaceEngineMask.ASF_FACE_DETECT | FaceEngineMask.ASF_FACERECOGNITION | FaceEngineMask.ASF_AGE | FaceEngineMask.ASF_GENDER | FaceEngineMask.ASF_FACE3DANGLE;
            retCode = ASFFunctions.ASFInitEngine(detectMode, imageDetectFaceOrientPriority, detectFaceScaleVal, detectFaceMaxNum, combinedMask, ref pImageEngine);
            Console.WriteLine("InitEngine Result:" + retCode);
            //MessageBox.Show("InitEngine Result:" + retCode);
            if (retCode != 0)
            {
                MessageBox.Show("摄像头错误："+retCode.ToString());
                //MessageBox.Show("90118");
            }

            //初始化视频模式下人脸检测引擎
            uint detectModeVideo = DetectionMode.ASF_DETECT_MODE_VIDEO;
            int combinedMaskVideo = FaceEngineMask.ASF_FACE_DETECT | FaceEngineMask.ASF_FACERECOGNITION;
            retCode = ASFFunctions.ASFInitEngine(detectModeVideo, videoDetectFaceOrientPriority, detectFaceScaleVal, detectFaceMaxNum, combinedMaskVideo, ref pVideoEngine);
            //RGB视频专用FR引擎
            detectFaceMaxNum = 1;
            combinedMask = FaceEngineMask.ASF_FACE_DETECT | FaceEngineMask.ASF_FACERECOGNITION | FaceEngineMask.ASF_LIVENESS;
            retCode = ASFFunctions.ASFInitEngine(detectMode, imageDetectFaceOrientPriority, detectFaceScaleVal, detectFaceMaxNum, combinedMask, ref pVideoRGBImageEngine);

            ////IR视频专用FR引擎
            //combinedMask = FaceEngineMask.ASF_FACE_DETECT | FaceEngineMask.ASF_FACERECOGNITION | FaceEngineMask.ASF_IR_LIVENESS;
            //retCode = ASFFunctions.ASFInitEngine(detectMode, imageDetectFaceOrientPriority, detectFaceScaleVal, detectFaceMaxNum, combinedMask, ref pVideoIRImageEngine);

            Console.WriteLine("InitVideoEngine Result:" + retCode);
            return 1;
        }
        public void Dispose()
        {
            if (videoSource != null)
                videoSource.Stop();
            if (videoSourcePlayer != null)
                videoSourcePlayer.Dispose();
        }
    }
    public class FaceUser
    {
        public int Id { get; set; }
        public string UserID { get; set; }
        public string FilePath { get; set; }
    }
}
