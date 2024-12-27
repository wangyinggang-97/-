namespace test.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Operation")]
    public partial class Operation
    {
        public int Id { get; set; }

        [Required]
        [StringLength(50)]
        public string HISID { get; set; }

        [StringLength(50)]
        public string OperationRequestNo { get; set; }

        public int? HAreaId { get; set; }

        [StringLength(50)]
        public string HAreaCode { get; set; }

        [StringLength(50)]
        public string HAreaName { get; set; }

        public int? PatientDeptId { get; set; }

        [StringLength(50)]
        public string PatientDeptCode { get; set; }

        [StringLength(50)]
        public string PatientDeptName { get; set; }

        public int? RoomId { get; set; }

        [StringLength(50)]
        public string RoomCode { get; set; }

        [StringLength(50)]
        public string RoomName { get; set; }

        public int? TaiCi { get; set; }

        public int? PatientId { get; set; }

        [StringLength(50)]
        public string PatientHisId { get; set; }

        [StringLength(50)]
        public string HospitalNo { get; set; }

        [StringLength(50)]
        public string SchCode { get; set; }

        [StringLength(50)]
        public string SpecialIdNo { get; set; }

        public int? KdDoctorId { get; set; }

        [StringLength(50)]
        public string KdDoctorCode { get; set; }

        [StringLength(50)]
        public string KdDoctorName { get; set; }

        [StringLength(50)]
        public string KdDeptId { get; set; }

        [StringLength(50)]
        public string KdDeptCode { get; set; }

        [StringLength(50)]
        public string KdDeptName { get; set; }

        [StringLength(50)]
        public string OperateName { get; set; }

        [StringLength(50)]
        public string MzType { get; set; }

        public int? MzDoctorId { get; set; }

        [StringLength(50)]
        public string MzDoctorCode { get; set; }

        [StringLength(50)]
        public string MzDoctorName { get; set; }

        [StringLength(50)]
        public string PatientType { get; set; }

        public int? ZxDeptId { get; set; }

        [StringLength(50)]
        public string ZxDeptCode { get; set; }

        [StringLength(50)]
        public string ZxDeptName { get; set; }

        public int? OpeDoctorId { get; set; }

        [StringLength(50)]
        public string OpeDoctorCode { get; set; }

        [StringLength(50)]
        public string OpeDoctorName { get; set; }

        [StringLength(50)]
        public string Assistant { get; set; }

        public DateTime? StartDate { get; set; }

        public DateTime? EndDate { get; set; }

        public DateTime? HisCreateTime { get; set; }

        [StringLength(50)]
        public string Status { get; set; }
    }
}
