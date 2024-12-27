using System;
using System.CodeDom;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.Entity.Infrastructure;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Windows.Forms.VisualStyles;
using System.Xml.Linq;
using test.EF;
namespace test
{
    public class AAA
    {
        public int id { get; set; }
    }
    public partial class FAuto : Form
    {
        public FAuto()
        {
            InitializeComponent();
        }
        public static string GetValueXP(object obj,string Name)
        {

            foreach (var property in obj.GetType().GetProperties())
            {
                if (property.Name.Equals(Name))
                {
                    return property.GetValue(obj, null).ToString();
                }
            }
            return "";
        }
        private void FAuto_Load(object sender, EventArgs e)
        {
            ////var list = (from o in db.Operation join p in db.Patient on o.PatientId equals p.Id select new { p.Id }).ToList();
            ////IEnumerable<object> 
            ////list[0].Id;
            ////var list = db.Database.SqlQuery<object[]>("SELECT id,BedNo FROM Bed").Select(n => n[0]="aaaa").ToList();
            //var list = db.Database.SqlQuery<dynamic>("SELECT id,BedNo FROM Bed").Select(n => new { AAA = GetValueXP(n, "id") }).ToList();
            //string[] text = { "Albert was here", "Burke slept late", "Connor is happy" };

            //var tokens = text.Select(s => s.Split(new char[] { ' '}));

            //foreach (string[] line in tokens)
            //    foreach (string token in line)
            //        Console.Write("{0}.", token);



            string[]  text = { "Albert was here", "Burke slept late", "Connor is happy" };
            var tokens = text.SelectMany(s => s.Split(new char[] { ' ' }));

            foreach (string token in tokens)
                Console.Write("{0}.", token);

        }
        
        
        EF.HisDbHelper hisDb = new EF.HisDbHelper();
        EF.DbHelper db = new EF.DbHelper();
        public void Run()
        {
            while (true)
            {
                System.Threading.Thread.Sleep(1000 * 60);
                var list = hisDb.Database.SqlQuery<HisOperation>("SELECT * FROM DBO.vw_patient_hr order by CreateDate desc").ToList();

                for(int i=0;i<list.Count;i++)
                {
                    string hisPatientID = list[i].HisPatientID;
                    var find = db.Patient.FirstOrDefault(n => n.PatientHisId.Equals(hisPatientID));
                    if (find !=null)
                        continue;

                    Patient pn = new Patient();
                    pn.PatientHisId = list[i].HisPatientID;
                    pn.HospitalNo = list[i].HospitalAreaCode;
                    pn.HAreaCode = list[i].HospitalAreaCode;
                    pn.DeptCode= list[i].ApplyDeptCode;
                    pn.DeptName = list[i].ApplyDeptName;
                    pn.Name = list[i].PatientName;
                    pn.Sex = list[i].Sex;
                    pn.Age = list[i].Age;
                    pn.Diagnose = list[i].Diagnose;
                    pn.BedNo = list[i].BedNo;
                    pn.CreateTime= list[i].CreateDate;
                    pn.DoctorCode = list[i].ApplyUserCode;
                    pn.DoctorName = list[i].ApplyUserName;
                    pn.ICCard = list[i].sfzh;
                    pn.Height = list[i]?.Height.ToString();
                    pn.Weight = list[i]?.Weight.ToString();

                    db.Patient.Add(pn);
                    db.SaveChanges();


                    Operation opMode = new Operation();
                    opMode.HISID = list[i].HisPatientID;
                    opMode.OperationRequestNo = list[i].HisApplyID;
                    opMode.HAreaCode = list[i].HospitalAreaCode;
                    opMode.PatientDeptCode = list[i].ApplyDeptCode;
                    opMode.PatientDeptName = list[i].ApplyDeptName;
                    opMode.KdDeptCode = list[i].ApplyDeptCode;
                    opMode.KdDeptName = list[i].ApplyDeptName;
                    if (list[i].ssjbh != null)
                    {
                        if (list[i].ssjbh == "16" || list[i].ssjbh == "17" || list[i].ssjbh == "18")
                            opMode.RoomId = 4;
                        else if (list[i].ssjbh == "26" || list[i].ssjbh == "27" || list[i].ssjbh == "28" || list[i].ssjbh == "29")
                            opMode.RoomId = 5;
                    }
                    opMode.RoomCode = list[i].ssjbh;
                    opMode.RoomName = list[i].OperatingRoom;
                    opMode.HospitalNo = list[i].zyh;
                    opMode.StartDate = list[i].sssj;
                    opMode.HisCreateTime = list[i].CreateDate;
                    opMode.PatientId = pn.Id;
                    opMode.KdDoctorCode = list[i].ApplyUserCode;
                    opMode.KdDoctorName= list[i].ApplyUserName;
                    opMode.MzDoctorCode = list[i].mzyydm;
                    opMode.MzDoctorName = list[i].mzyy;
                    opMode.TaiCi = list[i].sstc;
                    opMode.OperateName = list[i].ssmc;

                    db.Operation.Add(opMode);
                    int result = db.SaveChanges();
                }

                
            }
        }
    }
}
