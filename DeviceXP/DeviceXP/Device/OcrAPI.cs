using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Text;
using System.Text.Json;
using System.Text.Json.Nodes;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Xml.XPath;
using test.Device.DeviceBase;

namespace test.Device
{
    public class OcrAPI
    {
        public static List<OCRRecognizedImage> GetOCR(string imgPath)
        {
            WebClient client = new WebClient();
            var obj = new {
                ImagePath = imgPath,
                MatchNumber = 1,
                ClientName = "TextInScanClient",
                IsEnableRotate = true
            };
            byte[] postJson = System.Text.ASCIIEncoding.UTF8.GetBytes(System.Text.Json.JsonSerializer.Serialize(obj));
            client.Headers["Content-Type"] = "application/json";
            //byte[] data= client.UploadData("http://192.168.1.171:5001/Scanner","POST",postJson);
            byte[] data = client.UploadData("http://localhost:5001/Scanner", "POST", postJson);
            string result = System.Text.ASCIIEncoding.UTF8.GetString(data);
            MessageBox.Show(result);
            //List<OCRRecognizedImage> list = JsonSerializer.Deserialize<List<OCRRecognizedImage>>(result,new JsonSerializerOptions() { PropertyNameCaseInsensitive=true});
            
            return null;
        }
    }
}
