-------------Dept
--���code his��wbCode
alter table Dept add wbCode nvarchar(50);
exec sp_addextendedproperty N'MS_Description', N'���code his��wbCode', N'SCHEMA', N'dbo',N'table',N'Dept',N'column', N'wbCode';

-------------Device
--��ҩ����
alter table Device add ProvidDeptIds nvarchar(500);
exec sp_addextendedproperty N'MS_Description', N'��ҩ����', N'SCHEMA', N'dbo',N'table',N'Device',N'column', N'ProvidDeptIds';

-------------DrugAtt_Column
--�ŵ�ַ
alter table DrugAtt_Column add DoorAddress int;
exec sp_addextendedproperty N'MS_Description', N'��ҩ����', N'SCHEMA', N'dbo',N'table',N'DrugAtt_Column',N'column', N'DoorAddress';

-------------DrugAtt
--
alter table DrugAtt add BigGridKB varchar(50);
--exec sp_addextendedproperty N'MS_Description', N'��ҩ����', N'SCHEMA', N'dbo',N'table',N'DrugAtt',N'column', N'BigGridKB';
--
alter table DrugAtt add SmallGridKB varchar(50);
--exec sp_addextendedproperty N'MS_Description', N'��ҩ����', N'SCHEMA', N'dbo',N'table',N'DrugAtt',N'column', N'SmallGridKB';
--
alter table DrugAtt add FuGridKB varchar(50);
--exec sp_addextendedproperty N'MS_Description', N'��ҩ����', N'SCHEMA', N'dbo',N'table',N'DrugAtt',N'column', N'FuGridKB';
--
alter table DrugAtt add WeightType int;
--exec sp_addextendedproperty N'MS_Description', N'��ҩ����', N'SCHEMA', N'dbo',N'table',N'DrugAtt',N'column', N'WeightType';
--
alter table DrugAtt add WeightIndex int;
--exec sp_addextendedproperty N'MS_Description', N'��ҩ����', N'SCHEMA', N'dbo',N'table',N'DrugAtt',N'column', N'WeightIndex';
--
alter table DrugAtt add MainGridKB varchar(50);
--exec sp_addextendedproperty N'MS_Description', N'��ҩ����', N'SCHEMA', N'dbo',N'table',N'DrugAtt',N'column', N'MainGridKB';


-------------DrugBind
--���ҩ��
alter table DrugBind add MaxDrugOut int;
exec sp_addextendedproperty N'MS_Description', N'���ҩ��', N'SCHEMA', N'dbo',N'table',N'DrugBind',N'column', N'MaxDrugOut';


-------------DrugDept
--���ҩ��
alter table DrugDept add MaxDrugOut int;
exec sp_addextendedproperty N'MS_Description', N'���ҩ��', N'SCHEMA', N'dbo',N'table',N'DrugDept',N'column', N'MaxDrugOut';

-------------HArea
--�������
alter table HArea add ShortName nvarchar(50);
exec sp_addextendedproperty N'MS_Description', N'���ҩ��', N'SCHEMA', N'dbo',N'table',N'HArea',N'column', N'ShortName';


-------------NullBottleFlow
--ȡ������
alter table NullBottleFlow add TakeBatch varchar(50);
exec sp_addextendedproperty N'MS_Description', N'ȡ������', N'SCHEMA', N'dbo',N'table',N'NullBottleFlow',N'column', N'TakeBatch';
--ȡ��Ч��
alter table NullBottleFlow add TakeValieTime datetime;
exec sp_addextendedproperty N'MS_Description', N'ȡ��Ч��', N'SCHEMA', N'dbo',N'table',N'NullBottleFlow',N'column', N'TakeValieTime';

--��������
alter table NullBottleFlow add RecycleBatch nvarchar(50);
exec sp_addextendedproperty N'MS_Description', N'��������', N'SCHEMA', N'dbo',N'table',N'NullBottleFlow',N'column', N'RecycleBatch';

--����Ч��
alter table NullBottleFlow add RecycleValieTime datetime;
exec sp_addextendedproperty N'MS_Description', N'����Ч��', N'SCHEMA', N'dbo',N'table',N'NullBottleFlow',N'column', N'RecycleValieTime';

--
alter table NullBottleFlow add ProvidDeptId int;


--
alter table NullBottleFlow add ProvidDeptName nvarchar(50);


-------------Operation
--�������
alter table Operation add OperationRequestNo nvarchar(50);
exec sp_addextendedproperty N'MS_Description', N'�������', N'SCHEMA', N'dbo',N'table',N'Operation',N'column', N'OperationRequestNo';
--����ҽ��id
alter table Operation add MzDoctorId int;
exec sp_addextendedproperty N'MS_Description', N'����ҽ��id', N'SCHEMA', N'dbo',N'table',N'Operation',N'column', N'MzDoctorId';
--����ҽ������
alter table Operation add MzDoctorCode nvarchar(50);
exec sp_addextendedproperty N'MS_Description', N'����ҽ������', N'SCHEMA', N'dbo',N'table',N'Operation',N'column', N'MzDoctorCode';
--����ҽ������
alter table Operation add MzDoctorName nvarchar(50);
exec sp_addextendedproperty N'MS_Description', N'����ҽ������', N'SCHEMA', N'dbo',N'table',N'Operation',N'column', N'MzDoctorName';
--��ʵ����ʱ��
alter table Operation add RealSurgicalTime datetime;
exec sp_addextendedproperty N'MS_Description', N'��ʵ����ʱ��', N'SCHEMA', N'dbo',N'table',N'Operation',N'column', N'RealSurgicalTime';


-------------User
--��������
alter table [User] add HAreaName nvarchar(50);
exec sp_addextendedproperty N'MS_Description', N'��������', N'SCHEMA', N'dbo',N'table',N'User',N'column', N'HAreaName';
--�ƾ���
alter table [User] add PalmarVein varchar(100);
exec sp_addextendedproperty N'MS_Description', N'�ƾ���', N'SCHEMA', N'dbo',N'table',N'User',N'column', N'PalmarVein';
--��Ĥ
alter table [User] add Iris varchar(100);
exec sp_addextendedproperty N'MS_Description', N'��Ĥ', N'SCHEMA', N'dbo',N'table',N'User',N'column', N'Iris';
--���ҩ��
alter table [User] add MaxDrugOut int;
exec sp_addextendedproperty N'MS_Description', N'���ҩ��', N'SCHEMA', N'dbo',N'table',N'User',N'column', N'MaxDrugOut';



-------------Room
alter table Room add PharmacyCode nvarchar(50);



-------------Recipel
--ҽ��ִ�п���
alter table Recipel add ImplementRoomId int;
exec sp_addextendedproperty N'MS_Description', N'ҽ��ִ�п���', N'SCHEMA', N'dbo',N'table',N'Recipel',N'column', N'ImplementRoomId';
--��ҩƵ��
alter table Recipel add Frequency varchar(50);
exec sp_addextendedproperty N'MS_Description', N'��ҩƵ��', N'SCHEMA', N'dbo',N'table',N'Recipel',N'column', N'Frequency';
--��ע(��סԺҩ��ʹ��)
alter table Recipel add PleaseId int;
exec sp_addextendedproperty N'MS_Description', N'��ע(��סԺҩ��ʹ��)', N'SCHEMA', N'dbo',N'table',N'Recipel',N'column', N'PleaseId';
--������������
alter table Recipel add RecycleCount int;
exec sp_addextendedproperty N'MS_Description', N'������������', N'SCHEMA', N'dbo',N'table',N'Recipel',N'column', N'RecycleCount';
--�ύ��
alter table Recipel add Commiter int;
exec sp_addextendedproperty N'MS_Description', N'�ύ��', N'SCHEMA', N'dbo',N'table',N'Recipel',N'column', N'Commiter';


--״̬
alter table Recipel add ChargingStatus int;
exec sp_addextendedproperty N'MS_Description', N'δ�ύ 0,���ύ1�������2���ѼƷ�3���Ѳ���-1��δ��ҩNULL���Ʒ�ʧ��4', N'SCHEMA', N'dbo',N'table',N'Recipel',N'column', N'ChargingStatus';
--�����
alter table Recipel add Examer int;
exec sp_addextendedproperty N'MS_Description', N'�����', N'SCHEMA', N'dbo',N'table',N'Recipel',N'column', N'Examer';
--�Ʒ���
alter table Recipel add Charger int;
exec sp_addextendedproperty N'MS_Description', N'�Ʒ���', N'SCHEMA', N'dbo',N'table',N'Recipel',N'column', N'Charger';
--�ύʱ��
alter table Recipel add CommitTime datetime;
exec sp_addextendedproperty N'MS_Description', N'�ύʱ��', N'SCHEMA', N'dbo',N'table',N'Recipel',N'column', N'CommitTime';
--�Ʒ�ʱ��
alter table Recipel add ChargTime datetime;
exec sp_addextendedproperty N'MS_Description', N'�Ʒ�ʱ��', N'SCHEMA', N'dbo',N'table',N'Recipel',N'column', N'ChargTime';



--���ʱ��
alter table Recipel add ExameTime datetime;
exec sp_addextendedproperty N'MS_Description', N'���ʱ��', N'SCHEMA', N'dbo',N'table',N'Recipel',N'column', N'ExameTime';
--1���˷�
alter table Recipel add HisBackState int;
exec sp_addextendedproperty N'MS_Description', N'1���˷�', N'SCHEMA', N'dbo',N'table',N'Recipel',N'column', N'HisBackState';
--�˷���id
alter table Recipel add HisBackUserId int;
exec sp_addextendedproperty N'MS_Description', N'�˷���id', N'SCHEMA', N'dbo',N'table',N'Recipel',N'column', N'HisBackUserId';
--�˷�ʱ��
alter table Recipel add HisBackTime datetime;
exec sp_addextendedproperty N'MS_Description', N'�˷�ʱ��', N'SCHEMA', N'dbo',N'table',N'Recipel',N'column', N'HisBackTime';






-------------PleaseBill
--��¼��
alter table PleaseBill add UserId1 int;
exec sp_addextendedproperty N'MS_Description', N'��¼��', N'SCHEMA', N'dbo',N'table',N'PleaseBill',N'column', N'UserId1';
--�˶���
alter table PleaseBill add UserId2 int;
exec sp_addextendedproperty N'MS_Description', N'�˶���', N'SCHEMA', N'dbo',N'table',N'PleaseBill',N'column', N'UserId2';
--סԺ��
alter table PleaseBill add HospitalNo nvarchar(50);
exec sp_addextendedproperty N'MS_Description', N'סԺ��', N'SCHEMA', N'dbo',N'table',N'PleaseBill',N'column', N'HospitalNo';
--�÷�����
alter table PleaseBill add UsageDosage nvarchar(500);
exec sp_addextendedproperty N'MS_Description', N'�÷�����', N'SCHEMA', N'dbo',N'table',N'PleaseBill',N'column', N'UsageDosage';
--�ٴ�����id
alter table PleaseBill add ClaimDeptId int;
exec sp_addextendedproperty N'MS_Description', N'�ٴ�����id', N'SCHEMA', N'dbo',N'table',N'PleaseBill',N'column', N'ClaimDeptId';


--�Ƿ��ӡ
alter table PleaseBill add isPrint int;
exec sp_addextendedproperty N'MS_Description', N'�Ƿ��ӡ', N'SCHEMA', N'dbo',N'table',N'PleaseBill',N'column', N'isPrint';
--��ϸid
alter table PleaseBill add DrugOutDetailId int;
exec sp_addextendedproperty N'MS_Description', N'��ϸid', N'SCHEMA', N'dbo',N'table',N'PleaseBill',N'column', N'DrugOutDetailId';
--����
alter table PleaseBill add Batch nvarchar(50);
exec sp_addextendedproperty N'MS_Description', N'����', N'SCHEMA', N'dbo',N'table',N'PleaseBill',N'column', N'Batch';
--��Ч��
alter table PleaseBill add ValidTime datetime;
exec sp_addextendedproperty N'MS_Description', N'��Ч��', N'SCHEMA', N'dbo',N'table',N'PleaseBill',N'column', N'ValidTime';