using AForge.Controls;
using AForge.Video.DirectShow;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace test.Device
{
    public class CameraAPI:System.IDisposable
    {
        private VideoSourcePlayer videoSourcePlayer = null;
        private VideoCaptureDevice videoSource = null;
        public CameraAPI(string deviceID) {
            try
            {
                videoSourcePlayer = new VideoSourcePlayer();
                videoSource = new VideoCaptureDevice(deviceID);
                var cap = videoSource.VideoCapabilities.FirstOrDefault();
                int width = cap.FrameSize.Width;
                int height = cap.FrameSize.Height;
                videoSource.DesiredFrameSize = new System.Drawing.Size(width, height);
                videoSource.DesiredFrameRate = 1;
                videoSourcePlayer.VideoSource = videoSource;
                videoSourcePlayer.Visible = false;
                videoSourcePlayer.Start();
            }
            catch(System.Exception err) {
                MessageBox.Show("CameraAPI:" + err.Message);
            }
        }

        public Bitmap GetCameraIMG()
        {
            var bitMap = videoSourcePlayer.GetCurrentVideoFrame();
            return bitMap;
        }

        public void Dispose()
        {
            if (videoSourcePlayer != null)
            {
                videoSourcePlayer.Stop();
                videoSourcePlayer.Dispose();
            }
        }
    }
}
