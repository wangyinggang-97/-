-------------Dept
--五笔code his：wbCode
alter table Dept add wbCode nvarchar(50);
exec sp_addextendedproperty N'MS_Description', N'五笔code his：wbCode', N'SCHEMA', N'dbo',N'table',N'Dept',N'column', N'wbCode';

-------------Device
--发药部门
alter table Device add ProvidDeptIds nvarchar(500);
exec sp_addextendedproperty N'MS_Description', N'发药部门', N'SCHEMA', N'dbo',N'table',N'Device',N'column', N'ProvidDeptIds';

-------------DrugAtt_Column
--门地址
alter table DrugAtt_Column add DoorAddress int;
exec sp_addextendedproperty N'MS_Description', N'发药部门', N'SCHEMA', N'dbo',N'table',N'DrugAtt_Column',N'column', N'DoorAddress';

-------------DrugAtt
--
alter table DrugAtt add BigGridKB varchar(50);
--exec sp_addextendedproperty N'MS_Description', N'发药部门', N'SCHEMA', N'dbo',N'table',N'DrugAtt',N'column', N'BigGridKB';
--
alter table DrugAtt add SmallGridKB varchar(50);
--exec sp_addextendedproperty N'MS_Description', N'发药部门', N'SCHEMA', N'dbo',N'table',N'DrugAtt',N'column', N'SmallGridKB';
--
alter table DrugAtt add FuGridKB varchar(50);
--exec sp_addextendedproperty N'MS_Description', N'发药部门', N'SCHEMA', N'dbo',N'table',N'DrugAtt',N'column', N'FuGridKB';
--
alter table DrugAtt add WeightType int;
--exec sp_addextendedproperty N'MS_Description', N'发药部门', N'SCHEMA', N'dbo',N'table',N'DrugAtt',N'column', N'WeightType';
--
alter table DrugAtt add WeightIndex int;
--exec sp_addextendedproperty N'MS_Description', N'发药部门', N'SCHEMA', N'dbo',N'table',N'DrugAtt',N'column', N'WeightIndex';
--
alter table DrugAtt add MainGridKB varchar(50);
--exec sp_addextendedproperty N'MS_Description', N'发药部门', N'SCHEMA', N'dbo',N'table',N'DrugAtt',N'column', N'MainGridKB';


-------------DrugBind
--最大发药量
alter table DrugBind add MaxDrugOut int;
exec sp_addextendedproperty N'MS_Description', N'最大发药量', N'SCHEMA', N'dbo',N'table',N'DrugBind',N'column', N'MaxDrugOut';


-------------DrugDept
--最大发药量
alter table DrugDept add MaxDrugOut int;
exec sp_addextendedproperty N'MS_Description', N'最大发药量', N'SCHEMA', N'dbo',N'table',N'DrugDept',N'column', N'MaxDrugOut';

-------------HArea
--病区简称
alter table HArea add ShortName nvarchar(50);
exec sp_addextendedproperty N'MS_Description', N'最大发药量', N'SCHEMA', N'dbo',N'table',N'HArea',N'column', N'ShortName';


-------------NullBottleFlow
--取出批号
alter table NullBottleFlow add TakeBatch varchar(50);
exec sp_addextendedproperty N'MS_Description', N'取出批号', N'SCHEMA', N'dbo',N'table',N'NullBottleFlow',N'column', N'TakeBatch';
--取出效期
alter table NullBottleFlow add TakeValieTime datetime;
exec sp_addextendedproperty N'MS_Description', N'取出效期', N'SCHEMA', N'dbo',N'table',N'NullBottleFlow',N'column', N'TakeValieTime';

--回收批号
alter table NullBottleFlow add RecycleBatch nvarchar(50);
exec sp_addextendedproperty N'MS_Description', N'回收批号', N'SCHEMA', N'dbo',N'table',N'NullBottleFlow',N'column', N'RecycleBatch';

--回收效期
alter table NullBottleFlow add RecycleValieTime datetime;
exec sp_addextendedproperty N'MS_Description', N'回收效期', N'SCHEMA', N'dbo',N'table',N'NullBottleFlow',N'column', N'RecycleValieTime';

--
alter table NullBottleFlow add ProvidDeptId int;


--
alter table NullBottleFlow add ProvidDeptName nvarchar(50);


-------------Operation
--手术编号
alter table Operation add OperationRequestNo nvarchar(50);
exec sp_addextendedproperty N'MS_Description', N'手术编号', N'SCHEMA', N'dbo',N'table',N'Operation',N'column', N'OperationRequestNo';
--麻醉医生id
alter table Operation add MzDoctorId int;
exec sp_addextendedproperty N'MS_Description', N'麻醉医生id', N'SCHEMA', N'dbo',N'table',N'Operation',N'column', N'MzDoctorId';
--麻醉医生工号
alter table Operation add MzDoctorCode nvarchar(50);
exec sp_addextendedproperty N'MS_Description', N'麻醉医生工号', N'SCHEMA', N'dbo',N'table',N'Operation',N'column', N'MzDoctorCode';
--麻醉医生名字
alter table Operation add MzDoctorName nvarchar(50);
exec sp_addextendedproperty N'MS_Description', N'麻醉医生名字', N'SCHEMA', N'dbo',N'table',N'Operation',N'column', N'MzDoctorName';
--真实手术时间
alter table Operation add RealSurgicalTime datetime;
exec sp_addextendedproperty N'MS_Description', N'真实手术时间', N'SCHEMA', N'dbo',N'table',N'Operation',N'column', N'RealSurgicalTime';


-------------User
--病区名称
alter table [User] add HAreaName nvarchar(50);
exec sp_addextendedproperty N'MS_Description', N'病区名称', N'SCHEMA', N'dbo',N'table',N'User',N'column', N'HAreaName';
--掌静脉
alter table [User] add PalmarVein varchar(100);
exec sp_addextendedproperty N'MS_Description', N'掌静脉', N'SCHEMA', N'dbo',N'table',N'User',N'column', N'PalmarVein';
--虹膜
alter table [User] add Iris varchar(100);
exec sp_addextendedproperty N'MS_Description', N'虹膜', N'SCHEMA', N'dbo',N'table',N'User',N'column', N'Iris';
--最大发药量
alter table [User] add MaxDrugOut int;
exec sp_addextendedproperty N'MS_Description', N'最大发药量', N'SCHEMA', N'dbo',N'table',N'User',N'column', N'MaxDrugOut';



-------------Room
alter table Room add PharmacyCode nvarchar(50);



-------------Recipel
--医嘱执行科室
alter table Recipel add ImplementRoomId int;
exec sp_addextendedproperty N'MS_Description', N'医嘱执行科室', N'SCHEMA', N'dbo',N'table',N'Recipel',N'column', N'ImplementRoomId';
--用药频次
alter table Recipel add Frequency varchar(50);
exec sp_addextendedproperty N'MS_Description', N'用药频次', N'SCHEMA', N'dbo',N'table',N'Recipel',N'column', N'Frequency';
--备注(仅住院药房使用)
alter table Recipel add PleaseId int;
exec sp_addextendedproperty N'MS_Description', N'备注(仅住院药房使用)', N'SCHEMA', N'dbo',N'table',N'Recipel',N'column', N'PleaseId';
--处方回收数量
alter table Recipel add RecycleCount int;
exec sp_addextendedproperty N'MS_Description', N'处方回收数量', N'SCHEMA', N'dbo',N'table',N'Recipel',N'column', N'RecycleCount';
--提交人
alter table Recipel add Commiter int;
exec sp_addextendedproperty N'MS_Description', N'提交人', N'SCHEMA', N'dbo',N'table',N'Recipel',N'column', N'Commiter';


--状态
alter table Recipel add ChargingStatus int;
exec sp_addextendedproperty N'MS_Description', N'未提交 0,已提交1，已审核2，已计费3，已驳回-1，未用药NULL，计费失败4', N'SCHEMA', N'dbo',N'table',N'Recipel',N'column', N'ChargingStatus';
--审核人
alter table Recipel add Examer int;
exec sp_addextendedproperty N'MS_Description', N'审核人', N'SCHEMA', N'dbo',N'table',N'Recipel',N'column', N'Examer';
--计费人
alter table Recipel add Charger int;
exec sp_addextendedproperty N'MS_Description', N'计费人', N'SCHEMA', N'dbo',N'table',N'Recipel',N'column', N'Charger';
--提交时间
alter table Recipel add CommitTime datetime;
exec sp_addextendedproperty N'MS_Description', N'提交时间', N'SCHEMA', N'dbo',N'table',N'Recipel',N'column', N'CommitTime';
--计费时间
alter table Recipel add ChargTime datetime;
exec sp_addextendedproperty N'MS_Description', N'计费时间', N'SCHEMA', N'dbo',N'table',N'Recipel',N'column', N'ChargTime';



--审核时间
alter table Recipel add ExameTime datetime;
exec sp_addextendedproperty N'MS_Description', N'审核时间', N'SCHEMA', N'dbo',N'table',N'Recipel',N'column', N'ExameTime';
--1已退费
alter table Recipel add HisBackState int;
exec sp_addextendedproperty N'MS_Description', N'1已退费', N'SCHEMA', N'dbo',N'table',N'Recipel',N'column', N'HisBackState';
--退费人id
alter table Recipel add HisBackUserId int;
exec sp_addextendedproperty N'MS_Description', N'退费人id', N'SCHEMA', N'dbo',N'table',N'Recipel',N'column', N'HisBackUserId';
--退费时间
alter table Recipel add HisBackTime datetime;
exec sp_addextendedproperty N'MS_Description', N'退费时间', N'SCHEMA', N'dbo',N'table',N'Recipel',N'column', N'HisBackTime';






-------------PleaseBill
--登录人
alter table PleaseBill add UserId1 int;
exec sp_addextendedproperty N'MS_Description', N'登录人', N'SCHEMA', N'dbo',N'table',N'PleaseBill',N'column', N'UserId1';
--核对人
alter table PleaseBill add UserId2 int;
exec sp_addextendedproperty N'MS_Description', N'核对人', N'SCHEMA', N'dbo',N'table',N'PleaseBill',N'column', N'UserId2';
--住院号
alter table PleaseBill add HospitalNo nvarchar(50);
exec sp_addextendedproperty N'MS_Description', N'住院号', N'SCHEMA', N'dbo',N'table',N'PleaseBill',N'column', N'HospitalNo';
--用法用量
alter table PleaseBill add UsageDosage nvarchar(500);
exec sp_addextendedproperty N'MS_Description', N'用法用量', N'SCHEMA', N'dbo',N'table',N'PleaseBill',N'column', N'UsageDosage';
--临床科室id
alter table PleaseBill add ClaimDeptId int;
exec sp_addextendedproperty N'MS_Description', N'临床科室id', N'SCHEMA', N'dbo',N'table',N'PleaseBill',N'column', N'ClaimDeptId';


--是否打印
alter table PleaseBill add isPrint int;
exec sp_addextendedproperty N'MS_Description', N'是否打印', N'SCHEMA', N'dbo',N'table',N'PleaseBill',N'column', N'isPrint';
--明细id
alter table PleaseBill add DrugOutDetailId int;
exec sp_addextendedproperty N'MS_Description', N'明细id', N'SCHEMA', N'dbo',N'table',N'PleaseBill',N'column', N'DrugOutDetailId';
--批号
alter table PleaseBill add Batch nvarchar(50);
exec sp_addextendedproperty N'MS_Description', N'批号', N'SCHEMA', N'dbo',N'table',N'PleaseBill',N'column', N'Batch';
--有效期
alter table PleaseBill add ValidTime datetime;
exec sp_addextendedproperty N'MS_Description', N'有效期', N'SCHEMA', N'dbo',N'table',N'PleaseBill',N'column', N'ValidTime';