using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace test.Device.DeviceBase
{
    public class OCRRecognizedImage
    {
        public OCRRecognizedImage()
        {
            IdentityRuleMatchedWords = new List<string>();
            RegularRuleMatchedWords = new List<string>();
            DrugNameMatchedWords = new List<string>();
        }

        public int DrugId { get; set; }
        public string DrugName { get; set; }
        public string Spec { get; set; }
        public string Text { get; set; }
        public float? Similar { get; set; }
        public List<string> Flips { get; set; }
        public string OtherStr { get; set; }
        public string ImagePath { get; set; }

        public string IdentityRule { get; set; }
        public int IdentityRuleHits
        {
            get
            {
                if (IdentityRuleMatchedWords == null || !IdentityRuleMatchedWords.Any())
                {
                    return 0;
                }
                return IdentityRuleMatchedWords.Count;
            }
        }
        public List<string> IdentityRuleMatchedWords { get; set; }

        public string RegularRule { get; set; }
        public int RegularRuleHits
        {
            get
            {
                if (RegularRuleMatchedWords == null || !RegularRuleMatchedWords.Any())
                {
                    return 0;
                }
                return RegularRuleMatchedWords.Count;
            }
        }
        public List<string> RegularRuleMatchedWords { get; set; }

        public string SpecMatchedWords { get; set; }
        public float? SpecSimilarity { get; set; }

        public List<string> DrugNameMatchedWords { get; set; }

        public float? DrugNameSpecSimilarity { get; set; }



        public string Batch { get; set; }

        public string ValidTime { get; set; }

        public float? BatchSimilarity { get; set; }

        public float? VaildTimeSimilarity { get; set; }


        public float? TotalScore => SpecSimilarity + DrugNameSpecSimilarity;

    }
}
