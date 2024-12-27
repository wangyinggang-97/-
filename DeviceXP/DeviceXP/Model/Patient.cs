namespace test.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Patient")]
    public partial class Patient
    {
        public int Id { get; set; }

        [StringLength(50)]
        public string PatientHisId { get; set; }

        [StringLength(50)]
        public string HospitalNo { get; set; }

        public DateTime? InHospitalTime { get; set; }

        public int? HAreaId { get; set; }

        [StringLength(50)]
        public string HAreaCode { get; set; }

        [StringLength(50)]
        public string HAreaName { get; set; }

        public int? DeptId { get; set; }

        [StringLength(50)]
        public string DeptCode { get; set; }

        [StringLength(50)]
        public string DeptName { get; set; }

        [StringLength(10)]
        public string FeeType { get; set; }

        [StringLength(50)]
        public string Name { get; set; }

        [StringLength(10)]
        public string Sex { get; set; }

        [StringLength(20)]
        public string Age { get; set; }

        [StringLength(50)]
        public string ICCard { get; set; }

        [StringLength(10)]
        public string Height { get; set; }

        [StringLength(10)]
        public string Weight { get; set; }

        [StringLength(1000)]
        public string Diagnose { get; set; }

        [StringLength(50)]
        public string BedNo { get; set; }

        public int? DoctorId { get; set; }

        [StringLength(20)]
        public string DoctorCode { get; set; }

        [StringLength(10)]
        public string DoctorName { get; set; }

        public DateTime? CreateTime { get; set; }
    }
}
