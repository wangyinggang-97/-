using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.IO.Ports;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.ListView;
using System.Xml.Linq;
using test.EF;
using System.Diagnostics;
using test.Device;
using System.Xml.XPath;
using AForge.Controls;
using AForge.Video.DirectShow;
using AForge.Video;
using System.Reflection;
using System.Diagnostics.Tracing;
using System.Configuration;
using AdminApp.Model;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Net;
using DeviceXP.Properties;
using DeviceXP;
using DeviceXP.Device;
using System.Text.Json.Serialization;
namespace test
{
    public partial class FormDevice : Form
    {
        public FormDevice()
        {
            InitializeComponent();
        }
        CardScanAPI card = new CardScanAPI();
        WeightAPI weight;
        FingerAPI fg;
        DoorAPI door;
        PullPushAPI pull;
        AutoPushDrugAPI autuDrug;
        RecycleAPI recycle;
        CameraAPI cm; //暂时无用，使用face;
        FaceAPI face;
        WenShiDuAPI wendu;
        ScreenAPI sc;
        SpeechAPI sp = new SpeechAPI();
        FilterInfoCollection videoDevices = new FilterInfoCollection(FilterCategory.VideoInputDevice);//摄像头集合
        private void Form1_Load(object sender, EventArgs e)
        {
            foreach (var com in SerialPort.GetPortNames())
            {
                comboBox1.Items.Add(com);
                comboBox2.Items.Add(com);
                comboBox3.Items.Add(com);
                comboBox4.Items.Add(com);
                comboBox5.Items.Add(com);
                comboBox7.Items.Add(com);
                comboBox8.Items.Add(com);
            }
            for (int i = 1; i <= 20; i++)
            {
                cmMainIndex.Items.Add(i.ToString());
                cmAddIndex.Items.Add(i.ToString());
                cmValueInfo.Items.Add(i.ToString());
            }
            cmMainIndex.Text = "1";
            cmAddIndex.Text = "1";
            cmValueInfo.Text = "1";

            int count = videoDevices.Count;
            if (count > 0)
            {
                for (int i = 0; i < videoDevices.Count; i++)
                {
                    comboBox6.Items.Add(videoDevices[i].MonikerString);
                }
            }
            llLinfo.Text = "";
        }
        void Run()
        {
            while (this.Visible)
            {
                System.Threading.Thread.Sleep(2000);
                if (this.weight != null)
                {
                    this.BeginInvoke(
                 new Action(() =>
                 {

                     this.Text = this.weight.GetWeight(9).ToArray() + " " + DateTime.Now.ToString();
                 })
                 );
                }
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            door.OpenDoor(byte.Parse(cmMainIndex.Text), byte.Parse(cmAddIndex.Text));
        }

        private void button2_Click(object sender, EventArgs e)
        {
            MessageBox.Show(door.GetDoorStatus(byte.Parse(cmMainIndex.Text), byte.Parse(cmAddIndex.Text),
                int.Parse(cmValueInfo.Text)).ToString());
        }

        private void timer1_Tick(object sender, EventArgs e)
        {
            try
            {
                if (face != null)
                {
                    pictureBox1.Image = face.GetCameraIMG();
                    if (pictureBox1.Image == null)
                    {
                        timer1.Interval = 2000;
                    }
                    else
                        timer1.Interval = 1000;
                }
                
            }
            catch (System.Exception err)
            {
                MessageBox.Show(err.Message);
                timer1.Enabled = false;
            }
        }

        private void button3_Click(object sender, EventArgs e)
        {
            recycle.OpenLight(byte.Parse(cmMainIndex.Text), byte.Parse(cmAddIndex.Text), byte.Parse(cmValueInfo.Text));
        }

        private void button4_Click(object sender, EventArgs e)
        {
            recycle.CloseLight(byte.Parse(cmMainIndex.Text), byte.Parse(cmAddIndex.Text), byte.Parse(cmValueInfo.Text));
        }

        private void button5_Click(object sender, EventArgs e)
        {
            autuDrug.PushDrug(byte.Parse(cmMainIndex.Text), byte.Parse(cmAddIndex.Text), byte.Parse(cmValueInfo.Text),0);
        }

        private void button9_Click(object sender, EventArgs e)
        {
            recycle.RotateMotor(byte.Parse(cmMainIndex.Text), byte.Parse(cmAddIndex.Text));
        }

        private void button10_Click(object sender, EventArgs e)
        {
            if (face == null)
            {
                MessageBox.Show("请选择摄像头");
                return;
            }
            pictureBox1.Image = face.GetCameraIMG();
            pictureBox1.Image.Save(@"d:\1.jpg");
        }

        private void Form1_FormClosing(object sender, FormClosingEventArgs e)
        {
            //cm.Dispose();
            if (face != null)
                face.Dispose();
        }

        private void button11_Click(object sender, EventArgs e)
        {
            try
            {
                MessageBox.Show("将对d:\\1.jpg提到本地5001端口进行OCR识别");
                OcrAPI.GetOCR(@"D:\\1.jpg");
            }
            catch (System.Exception err)
            {
                MessageBox.Show(err.Message);
            }
        }

        private void button12_Click(object sender, EventArgs e)
        {
            recycle.OpenMotor(byte.Parse(cmMainIndex.Text), byte.Parse(cmAddIndex.Text));
        }
        private void button13_Click(object sender, EventArgs e)
        {
            pull.OpenPullPush((byte)byte.Parse(cmMainIndex.Text), byte.Parse(cmAddIndex.Text));
        }
        private void button14_Click(object sender, EventArgs e)
        {
            pull.ClosePullPush((byte)byte.Parse(cmMainIndex.Text), byte.Parse(cmAddIndex.Text));
        }

        private void button15_Click(object sender, EventArgs e)
        {
            int result=pull.GetPullPushStatus((byte)byte.Parse(cmMainIndex.Text), byte.Parse(cmAddIndex.Text));
            MessageBox.Show(result.ToString());
        }

        private void button16_Click(object sender, EventArgs e)
        {
            double tempCount = wendu.GetWendu();
            if (tempCount > 0)
            {
                MessageBox.Show("温度:" + tempCount.ToString("0.##") + "℃");
            }
        }

        private void button17_Click(object sender, EventArgs e)
        {
            double tempCount = wendu.GetShidu();
            if (tempCount > 0)
            {
                MessageBox.Show("湿度: " + tempCount.ToString("0.##") + "%");
            }
        }

        private void button18_Click(object sender, EventArgs e)
        {
            sc.SendToLabel_1_7("LCDON(0);\r\n", 1);
            MessageBox.Show("aa");
            sc.SendToLabel_1_7("SET_TXT(1,'CCCCC');\r\n", 1);
            MessageBox.Show("BBBB");
            sc.SendToLabel_1_7("LCDON(1);\r\n", 1);
        }

        private void button6_Click(object sender, EventArgs e)
        {
            MessageBox.Show(string.Join("_", weight.GetWeight(byte.Parse(cmMainIndex.Text))));
        }

        private void button7_Click(object sender, EventArgs e)
        {
            if (weight.ClearPeel(byte.Parse(cmMainIndex.Text), 5))
            {
                MessageBox.Show("去皮成功");
            }
        }

        private void button8_Click(object sender, EventArgs e)
        {
            var value=weight.CheckPrecision(byte.Parse(cmMainIndex.Text), byte.Parse(cmAddIndex.Text));
            if (value != null)
            {
                MessageBox.Show("校准成功 "+value);
            }
        }
        private void button27_Click(object sender, EventArgs e)
        {
            string value = cmValueInfo.Text;
            bool isok=weight.UpdateWeightInfo(byte.Parse(cmMainIndex.Text),value);
            if (isok)
                MessageBox.Show("更新成功");
        }
        private void button19_Click(object sender, EventArgs e)
        {
            
            if (face == null)
            {
                MessageBox.Show("请先选择摄像头");
                return;
            }
            var image=face.GetFaceIdentIMG(DateTime.Now.Millisecond);
            if (image != null)
            {
                pictureBox1.Image = image;
                timer1.Enabled = false;
                MessageBox.Show("人脸保存成功");
                timer1.Enabled = true;
            }
        }

        private void button20_Click(object sender, EventArgs e)
        {
            DateTime dt = DateTime.Now;
            if (face == null)
            {
                MessageBox.Show("请先选择摄像头");
                return;
            }
            int userID = -1;
            var t=Task.Run(() =>
            {
                while (userID<0)
                {
                    userID = face.GetFaceUserID(face.GetCameraIMG());
                    System.Threading.Thread.Sleep(500);
                }
            });
            while (!t.IsCompleted)
            {
                Application.DoEvents();
            }
            MessageBox.Show("OK " + userID +" "+ DateTime.Now.Subtract(dt).TotalSeconds);
            
        }
        ICCardAPI ic;
        private void button21_Click(object sender, EventArgs e)
        {
            //ic = new ICCardAPI("COM2");
            string str;
            ic.GetICCardID(out str);
            MessageBox.Show(str);
            //MessageBox.Show("读取卡号："+card.GetScanCode());
        }

        private void linkLabel1_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            linkLabel1.Enabled = false;
            string result=WeightAPI.AutoFindDevice();
            if (result.Length > 0)
            {
                comboBox1.Items.Clear();
                string[] items = result.Split(new string[] { "," }, StringSplitOptions.RemoveEmptyEntries);
                foreach (string item in items)
                {
                    comboBox1.Items.Add(item);
                }
                comboBox1.SelectedIndex = 0;
            }
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            weight = new WeightAPI(comboBox1.Text);
        }

        bool isEnterFingre = false;
        private void button22_Click(object sender, EventArgs e)
        {
            if (fg == null)
                fg = new FingerAPI();
            isEnterFingre = true;
            int index = 0;
            fg = new FingerAPI();
            var t = Task.Run(() =>
            {
                while (isEnterFingre && this.Visible)
                {
                    string msg;
                    int result=fg.CreateFingreRecord(out msg, (uint)DateTime.Now.Millisecond);
                    if (result > 0)
                    {
                        pictureBox2.Image = Resources.FingreHas;
                        this.Invoke(new Action(() => { llLinfo.Text =  msg; }));
                        System.Threading.Thread.Sleep(2000);
                        this.Invoke(new Action(() =>
                        {
                            index = index + 1;
                            pictureBox2.Image = Resources.FingreNull;
                            llLinfo.Text = "录入下次";
                        }));

                    }
                    else
                    {
                        this.Invoke(new Action(() => { llLinfo.Text = msg; }));
                    }

                    this.Invoke(new Action(() =>
                    {
                        if ((index+1) == 5)
                        {
                            this.button22.Text = "录入成功";
                            isEnterFingre = false;
                        }
                        else
                            this.button22.Text = "第" + (index + 1).ToString() + "次录入指纹";
                    }));
                }
            });

            
        }
        bool isValidateFingre = false;
        private void button24_Click(object sender, EventArgs e)
        {
            isValidateFingre = true;
            if (fg == null)
                fg = new FingerAPI();

            this.button24.Text = "开始识别";
            if (fg != null)
            {
                while (isValidateFingre && this.Visible)
                {
                    int result = fg.GetIdentyUserID();
                    if (result > 0)
                    {
                        this.Invoke(new Action(() =>
                        {
                            pictureBox2.Image = Resources.FingreHas;
                            llLinfo.Text = "ID:" + result;

                            this.button24.Text = "识别";
                        }));
                        break;
                    }
                    Application.DoEvents();
                }
            }
        }
        private void comboBox2_SelectedIndexChanged(object sender, EventArgs e)
        {
            door = new DoorAPI(comboBox2.Text);
        }

        private void linkLabel2_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            linkLabel2.Enabled = false;
            string result = DoorAPI.AutoFindDevice();
            if (result.Length > 0)
            {
                comboBox2.Items.Clear();
                string[] items = result.Split(new string[] { "," }, StringSplitOptions.RemoveEmptyEntries);
                foreach (string item in items)
                {
                    comboBox2.Items.Add(item);
                }
                comboBox2.SelectedIndex = 0;
            }
        }

        private void comboBox3_SelectedIndexChanged(object sender, EventArgs e)
        {
          autuDrug  = new AutoPushDrugAPI(comboBox3.Text, 9600, 1000);
        }

        private void linkLabel3_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            linkLabel3.Enabled = false;
            comboBox3.Items.Clear();
            string result = AutoPushDrugAPI.AutoFindDevice();
            if (result.Length > 0)
            {
                string[] items = result.Split(new string[] { "," }, StringSplitOptions.RemoveEmptyEntries);
                foreach (string item in items)
                {
                    comboBox3.Items.Add(item);
                }
                comboBox3.SelectedIndex = 0;
            }
        }

        private void linkLabel5_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            linkLabel5.Enabled = false;
            string result = PullPushAPI.AutoFindDevice();
            if (result.Length > 0)
            {
                comboBox5.Items.Clear();
                string[] items = result.Split(new string[] { "," }, StringSplitOptions.RemoveEmptyEntries);
                foreach (string item in items)
                {
                    comboBox5.Items.Add(item);
                }
                comboBox5.SelectedIndex = 0;
            }
        }

        private void button23_Click(object sender, EventArgs e)
        {
            int[] info=autuDrug.GetDrugInventoryInfo(byte.Parse(cmMainIndex.Text), byte.Parse(cmAddIndex.Text),byte.Parse(cmValueInfo.Text));
            if (info!=null)
            {
                string result = "";
                for(int i=0;i<info.Length;i++)
                {
                    result = result + (i + 1) +":" +info[i] + "\t";
                }
                MessageBox.Show(result); 
            }
        }

        private void comboBox5_SelectedIndexChanged(object sender, EventArgs e)
        {
            pull = new PullPushAPI(comboBox5.Text, 9600, 1000);
        }
        Task<HttpResponseMessage> t;
        private async void linkLabel4_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            HttpContent httpContent;
            httpContent = new StringContent("", Encoding.UTF8, "application/json");
            httpContent.Headers.ContentType = new MediaTypeHeaderValue("application/json");
            httpContent.Headers.ContentType.CharSet = "utf-8";
            HttpClientHandler httpHandler = new HttpClientHandler { AutomaticDecompression = DecompressionMethods.GZip };
        }
            

        private void comboBox4_SelectedIndexChanged(object sender, EventArgs e)
        {
            recycle = new RecycleAPI(comboBox4.Text, 9600, 1000);
        }

        private void comboBox6_SelectedIndexChanged_1(object sender, EventArgs e)
        {
            if(face!=null)
                face.Dispose();
            face = new FaceAPI(comboBox6.Text);
        }

        private void linkLabel6_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            if (comboBox6.Items.Count > -1)
            {
                if (comboBox6.SelectedIndex == -1)
                {
                    string res = "";
                    foreach (var item in comboBox6.Items)
                    {
                        res += item.ToString();
                    }
                    MessageBox.Show("复制成功");
                }
                else
                {
                    System.Windows.Forms.Clipboard.SetText(comboBox6.Text);
                    MessageBox.Show("复制成功");
                }
            }
        }

        

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void label4_Click(object sender, EventArgs e)
        {

        }

        private void label4_Click_1(object sender, EventArgs e)
        {

        }

        private void button25_Click(object sender, EventArgs e)
        {
            if (recycle != null)
            {
               int result= recycle.GetRecycleWatch(byte.Parse(cmMainIndex.Text), byte.Parse(cmAddIndex.Text));
                MessageBox.Show(result.ToString());
            }
        }
        private void button26_Click(object sender, EventArgs e)
        {
            sp.TextSpeak("正在打开要门，并自动发药");
        }

        private void comboBox7_SelectedIndexChanged(object sender, EventArgs e)
        {
            wendu = new WenShiDuAPI(comboBox7.Text, 9600, 1000);
        }

        private void comboBox8_SelectedIndexChanged(object sender, EventArgs e)
        {
           sc = new ScreenAPI(comboBox8.Text, 9600, 500);
        }
    }
}