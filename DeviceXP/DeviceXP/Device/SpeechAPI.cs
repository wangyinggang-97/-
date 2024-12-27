using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Speech.Synthesis;
using System.Threading;
namespace DeviceXP.Device
{
    public class SpeechAPI
    {
        private SpeechSynthesizer speech;
        /// <summary>
        /// 音量
        /// </summary>
        private int value = 100;
        /// <summary>
        /// 语速
        /// </summary>
        private int RateSpeak = 1;
        /// <summary>
        /// 文字内容
        /// </summary>
        public string content = "";
        private string VoiceSpeak = "Microsoft Huihui Desktop"; //（中文）"Microsoft Huihui Desktop"
        public SpeechAPI() {
            
            speech = new SpeechSynthesizer();
            speech.Rate = RateSpeak;//语速
            speech.SelectVoice(VoiceSpeak);//设置播音员
            speech.Volume = value;//音量
        }
        public void stop()
        {
            speech.SpeakAsyncCancelAll();
        }
        /// <summary>
        /// 文字转语音
        /// </summary>
        /// <param name="pContent"></param>
        public void TextSpeak(string pContent)
        {
            pContent = pContent.Replace("枸橼", "举橼");
            content = pContent;
            try
            {
                new Thread(Speak).Start();
            }
            catch (Exception ex)
            {
            }
        }
        private void Speak()
        {
            speech.SpeakAsync(content);//语音阅读方法
        }
    }
}
