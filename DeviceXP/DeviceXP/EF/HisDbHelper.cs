using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace test.EF
{
    public class HisDbHelper : DbContext
    {
        public HisDbHelper() : base("name=hisconnstr")
        {
            Database.SetInitializer<DbHelper>(null);
            this.Database.Log = Log;
        }
        private void Log(string message)
        {
            Console.WriteLine(message);
        }
        
    }
    public class HisOperation
    {
        public String HisPatientID { get; set; }  //HISID
        public String zyh { get; set; }  //住院号
        public String mzh { get; set; }  //门诊号
        public String PatientName { get; set; } //患者姓名
        public String Age { get; set; } //患者年龄
        public string Sex { get; set; } //患者性别
        public string Diagnose { get; set; } //诊断
        public string BedNo { get; set; } //床号
        public string ApplyDeptCode { get; set; } //申请科室编号
        public string ApplyDeptName { get; set; } //申请科室名称
        public string HospitalAreaCode { get; set; } //院区编号
        public string HisApplyID { get; set; } //手术申请单号
        public DateTime? sssj { get; set; } //手术时间
        public string ssjbh { get; set; } //手术编号
        public string OperatingRoom { get; set; } //手书室名称
        public DateTime? CreateDate { get; set; } //数据创建时间
        public DateTime? UpdateDate { get; set; } //数据更新时间

        public string sfzh { get; set; } //身份证号
        public string ApplyUserCode { get; set; } //医生编号
        public string ApplyUserName { get; set; } //医生姓名
        public string mzyydm { get; set; } //麻药医生编号
        public string mzyy { get; set; } //麻药医生姓名
        public int sstc { get; set; } //台次
        public string ssmc { get; set; } //手术名称
        public double? Height { get; set; } //患者身高
        public double? Weight { get; set; } //患者体重

    }
}
