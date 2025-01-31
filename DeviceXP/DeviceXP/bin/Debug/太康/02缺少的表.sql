
/****** Object:  Table [dbo].[AppSettingTemplate]    Script Date: 2024/10/31 16:10:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppSettingTemplate](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TemplateCode] [nvarchar](50) NOT NULL,
	[TemplateDescription] [nvarchar](500) NULL,
 CONSTRAINT [PK_AppSettingTemplate] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AppSettingTemplateItem]    Script Date: 2024/10/31 16:10:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppSettingTemplateItem](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TemplateCode] [nvarchar](50) NOT NULL,
	[TableName] [nvarchar](50) NOT NULL,
	[ColumnName] [nvarchar](50) NOT NULL,
	[ColumnValue] [nvarchar](1000) NOT NULL,
	[ColumnType] [nvarchar](50) NULL,
	[Remark] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_AppSettingTemplateItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ChargingResponse]    Script Date: 2024/10/31 16:10:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChargingResponse](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Recipleid] [int] NOT NULL,
	[WebServiceUrl] [nvarchar](500) NULL,
	[MethodName] [nvarchar](100) NULL,
	[Request] [nvarchar](max) NULL,
	[Result] [int] NULL,
	[ResultMsg] [nvarchar](1000) NULL,
	[CreateTime] [datetime] NULL,
	[SubCount] [int] NULL,
	[RedDrugSubCount] [int] NULL,
 CONSTRAINT [PK_ChargingResponse] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Consumables]    Script Date: 2024/10/31 16:10:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Consumables](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[ConsumablesCode] [nvarchar](64) NOT NULL,
	[ConsumablesName] [nvarchar](64) NOT NULL,
	[SuiteName] [nvarchar](64) NULL,
	[HisCode] [nvarchar](64) NULL,
	[CreateTime] [datetime] NULL,
	[CreateUserId] [int] NULL,
	[UpdateTime] [datetime] NULL,
	[UpdateUserId] [int] NULL,
	[SortIndex] [int] NULL,
	[IsEnable] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ConsumablesCharging]    Script Date: 2024/10/31 16:10:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ConsumablesCharging](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RecipelId] [int] NULL,
	[ConsumablesId] [int] NULL,
	[ConsumablesCount] [decimal](10, 2) NULL,
	[SuiteName] [varchar](64) NULL,
	[SuiteCheck] [int] NULL,
	[Status] [int] NULL,
	[User1] [int] NULL,
	[User2] [int] NULL,
	[User3] [int] NULL,
	[Type] [int] NULL,
	[DeviceId] [int] NULL,
	[CreateTime] [datetime] NULL,
	[UpdateTime] [datetime] NULL,
 CONSTRAINT [PK_ConsumablesCharging] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ConsumablesDept]    Script Date: 2024/10/31 16:10:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConsumablesDept](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[ConsumablesCode] [nvarchar](64) NOT NULL,
	[ConsumablesName] [nvarchar](64) NOT NULL,
	[SuiteName] [nvarchar](64) NULL,
	[HisCode] [nvarchar](64) NULL,
	[CreateTime] [datetime] NULL,
	[CreateUserId] [int] NULL,
	[UpdateTime] [datetime] NULL,
	[UpdateUserId] [int] NULL,
	[SortIndex] [int] NULL,
	[IsEnable] [int] NULL,
	[DeptId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DeviceGridBox]    Script Date: 2024/10/31 16:10:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeviceGridBox](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TemplateCode] [nvarchar](50) NOT NULL,
	[DeviceId] [int] NOT NULL,
	[DrugAttId] [int] NOT NULL,
	[FloorIndex] [int] NOT NULL,
	[LineIndex] [int] NOT NULL,
	[BoxIndex] [int] NOT NULL,
	[RowNO] [int] NOT NULL,
	[ColumnNO] [int] NOT NULL,
	[Rowspan] [decimal](18, 2) NULL,
	[Colspan] [decimal](18, 2) NULL,
	[CellCount] [int] NULL,
	[CellAddress] [tinyint] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DeviceGridBoxTemplate]    Script Date: 2024/10/31 16:10:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeviceGridBoxTemplate](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TemplateCode] [nvarchar](50) NOT NULL,
	[TemplateDescription] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DeviceGridBoxTemplateItem]    Script Date: 2024/10/31 16:10:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeviceGridBoxTemplateItem](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TemplateCode] [nvarchar](50) NOT NULL,
	[FloorIndex] [int] NOT NULL,
	[LineIndex] [int] NOT NULL DEFAULT ((1)),
	[BoxIndex] [int] NOT NULL,
	[RowNO] [int] NOT NULL,
	[ColumnNO] [int] NOT NULL,
	[LayoutRule] [int] NOT NULL,
	[Rowspan] [decimal](18, 2) NULL DEFAULT ((1)),
	[Colspan] [decimal](18, 2) NULL DEFAULT ((1)),
	[CellCount] [int] NULL,
	[CellAddress] [tinyint] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DrugBatchAndValidTime]    Script Date: 2024/10/31 16:10:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DrugBatchAndValidTime](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DeptId] [int] NULL,
	[DeviceId] [int] NULL,
	[DrugId] [int] NULL,
	[DrugName] [nvarchar](50) NULL,
	[Batch] [nvarchar](50) NULL,
	[ValidTime] [datetime] NULL,
	[IsEnable] [int] NULL,
	[Remark] [text] NULL,
 CONSTRAINT [PK_DrugBatchAndValidTime] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DrugBatchValid]    Script Date: 2024/10/31 16:10:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DrugBatchValid](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DeviceId] [int] NULL,
	[ProvidDeptId] [int] NULL,
	[DrugId] [int] NULL,
	[Batch] [nvarchar](50) NULL,
	[ValidTime] [datetime] NULL,
	[IsStop] [int] NULL,
	[CreateTime] [datetime] NULL,
	[CreateUserId] [int] NULL,
	[UpdateTime] [datetime] NULL,
	[UpdateUserId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DrugDeptAtt]    Script Date: 2024/10/31 16:10:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DrugDeptAtt](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DrugDeptAttId] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[Disabled] [int] NULL,
	[SortIndex] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DrugInventoryRequest]    Script Date: 2024/10/31 16:10:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DrugInventoryRequest](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Recipleid] [int] NOT NULL,
	[WebServiceUrl] [nvarchar](500) NULL,
	[MethodName] [nvarchar](100) NULL,
	[Request] [nvarchar](max) NULL,
	[Result] [int] NULL,
	[ResultMsg] [nvarchar](1000) NULL,
	[CreateTime] [datetime] NULL,
	[SubCount] [int] NULL,
	[RedDrugSubCount] [int] NULL,
 CONSTRAINT [PK_DrugInventoryRequest] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DrugOutDetail]    Script Date: 2024/10/31 16:10:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DrugOutDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SummaryId] [int] NOT NULL,
	[DeviceId] [int] NOT NULL,
	[RoomId] [int] NOT NULL,
	[AttId] [int] NOT NULL,
	[BindId] [int] NOT NULL,
	[Floorindex] [int] NOT NULL,
	[Doorindex] [int] NOT NULL,
	[StockId] [int] NOT NULL,
	[DrugId] [int] NOT NULL,
	[DrugName] [nvarchar](50) NULL,
	[ValidTime] [datetime] NULL,
	[Batch] [nvarchar](50) NULL,
	[Count] [int] NULL,
	[UseCount] [int] NULL,
	[ReturnDrugCount] [int] NULL,
	[ReturnNullCount] [int] NULL,
	[TakeReturnDrugCount] [int] NULL,
	[TakeReturnNullCount] [int] NULL,
	[CreateTime] [datetime] NULL,
	[AuthUserId1] [int] NULL,
	[Auth1Type] [int] NULL,
	[AuthUserId2] [int] NULL,
	[Auth2Type] [int] NULL,
	[Remark] [nvarchar](500) NULL,
	[IsWeight] [int] NULL,
	[Type] [int] NULL,
	[status] [int] NULL DEFAULT ((0)),
	[IsDeleted] [int] NULL DEFAULT ((0)),
 CONSTRAINT [PK_DrugOutDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DrugOutDetailReturnFlow]    Script Date: 2024/10/31 16:10:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DrugOutDetailReturnFlow](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DeviceId] [int] NOT NULL,
	[DrugOutDetailId] [int] NOT NULL,
	[ReturnType] [int] NOT NULL CONSTRAINT [DF_DrugOutDetailReturnFlow_BType]  DEFAULT ((0)),
	[DrugId] [int] NOT NULL,
	[DrugName] [nvarchar](50) NULL,
	[ReturnCount] [int] NOT NULL CONSTRAINT [DF_DrugOutDetailReturnFlow_ReturnNullConut]  DEFAULT ((0)),
	[TakeReturnCount] [int] NOT NULL CONSTRAINT [DF_DrugOutDetailReturnFlow_CurrentReturnNullConut]  DEFAULT ((0)),
	[AuthUserId1] [int] NULL,
	[Auth1Type] [int] NULL,
	[AuthUserId2] [int] NULL,
	[Auth2Type] [int] NULL,
	[CreateTime] [datetime] NOT NULL,
	[TakeBatch] [varchar](50) NULL,
	[TakeValieTime] [datetime] NULL,
	[RecycleBatch] [nvarchar](50) NULL,
	[RecycleValieTime] [datetime] NULL,
	[Reason] [varchar](200) NULL,
	[TakeTime] [datetime] NULL,
	[SourceType] [tinyint] NULL,
	[TakeUserId] [int] NULL,
	[TakeAuthUserId] [int] NULL,
 CONSTRAINT [PK_DrugOutDetailReturnFlow] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FaceFile]    Script Date: 2024/10/31 16:10:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FaceFile](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FilePath] [nvarchar](100) NULL,
	[Feature] [nvarchar](100) NULL,
	[Type] [int] NULL,
 CONSTRAINT [PK_FaceFile] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HisUpdateOperation]    Script Date: 2024/10/31 16:10:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HisUpdateOperation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[InpatientNo] [nvarchar](20) NULL,
	[OperationApplyNo] [nvarchar](20) NULL,
	[PatientNo] [nvarchar](20) NULL,
	[Name] [nvarchar](20) NULL,
	[Age] [nvarchar](20) NULL,
	[Sex] [nvarchar](20) NULL,
	[ChuFangStatus] [nvarchar](20) NULL,
	[RoomName] [nvarchar](20) NULL,
	[ZxDoctorCode] [nvarchar](20) NULL,
	[ZxDoctorName] [nvarchar](50) NULL,
	[ZxDeptCode] [nvarchar](20) NULL,
	[ZxDeptName] [nvarchar](50) NULL,
	[OperationTime] [datetime] NULL,
	[BedNo] [nvarchar](30) NULL,
	[IdNo] [nvarchar](30) NULL,
	[OperationId] [int] NULL,
	[RecipelId] [int] NULL,
	[CreateTime] [datetime] NULL,
 CONSTRAINT [PK_HisUpdateOperation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HisUpdateOperationDetail]    Script Date: 2024/10/31 16:10:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HisUpdateOperationDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[HisUpdateOperationId] [int] NULL,
	[DrugCode] [nvarchar](50) NULL,
	[DrugName] [nvarchar](50) NULL,
	[Unit] [nvarchar](50) NULL,
	[Spec] [nvarchar](50) NULL,
	[Count] [decimal](18, 3) NULL,
	[Batch] [nvarchar](300) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OperationErrorRecord]    Script Date: 2024/10/31 16:10:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OperationErrorRecord](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[operationNo] [nvarchar](200) NULL,
	[dateStart] [datetime] NULL,
	[dateEnd] [datetime] NULL,
 CONSTRAINT [PK_OperationErrorRecord] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OperationRequest]    Script Date: 2024/10/31 16:10:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OperationRequest](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[cardNo] [nvarchar](200) NULL,
	[visitNo] [nvarchar](200) NULL,
	[visitSqNo] [nvarchar](200) NULL,
	[visitTypeCode] [nvarchar](255) NULL,
	[visitTypeName] [nvarchar](255) NULL,
	[visitTimes] [nvarchar](255) NULL,
	[patientId] [nvarchar](255) NULL,
	[patientHisId] [nvarchar](255) NULL,
	[idCardNumber] [nvarchar](255) NULL,
	[medicareCard] [nvarchar](255) NULL,
	[patientName] [nvarchar](255) NULL,
	[genderCode] [nvarchar](255) NULL,
	[genderName] [nvarchar](255) NULL,
	[birthDate] [nvarchar](255) NULL,
	[age] [nvarchar](255) NULL,
	[height] [nvarchar](255) NULL,
	[weight] [nvarchar](255) NULL,
	[phone] [nvarchar](255) NULL,
	[adress] [nvarchar](255) NULL,
	[bedCode] [nvarchar](255) NULL,
	[bedName] [nvarchar](255) NULL,
	[sickroomCode] [nvarchar](255) NULL,
	[sickroomName] [nvarchar](255) NULL,
	[deptCode] [nvarchar](255) NULL,
	[deptName] [nvarchar](255) NULL,
	[wardCode] [nvarchar](255) NULL,
	[wardName] [nvarchar](255) NULL,
	[orderDepeCode] [nvarchar](255) NULL,
	[orderDepeName] [nvarchar](255) NULL,
	[orderDocCode] [nvarchar](255) NULL,
	[orderDocName] [nvarchar](255) NULL,
	[requestNo] [nvarchar](255) NULL,
	[requestTime] [nvarchar](255) NULL,
	[anestheticMethodsCode] [nvarchar](255) NULL,
	[anestheticMethodsName] [nvarchar](255) NULL,
	[execDeptCode] [nvarchar](255) NULL,
	[execDeptName] [nvarchar](255) NULL,
	[operationCategoryCode] [nvarchar](255) NULL,
	[operationCategoryName] [nvarchar](255) NULL,
	[operationDate] [nvarchar](255) NULL,
	[operationDuration] [nvarchar](255) NULL,
	[operationDurationUnit] [nvarchar](255) NULL,
	[operationRoomCode] [nvarchar](255) NULL,
	[operationRoomName] [nvarchar](255) NULL,
	[operatorCode] [nvarchar](255) NULL,
	[operatorName] [nvarchar](255) NULL,
	[operatorNatureCode] [nvarchar](255) NULL,
	[operatorNatureName] [nvarchar](255) NULL,
	[attentionItem] [nvarchar](255) NULL,
	[reviewDate] [nvarchar](255) NULL,
	[reviewDocCode] [nvarchar](255) NULL,
	[reviewDocName] [nvarchar](255) NULL,
	[visitDate] [nvarchar](255) NULL,
	[operationDescList] [nvarchar](4000) NULL,
	[diagnosisList] [nvarchar](4000) NULL,
	[SyncTiem] [datetime] NULL,
 CONSTRAINT [PK__Operatio__3214EC07B0C6B92A] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RecipelHistory]    Script Date: 2024/10/31 16:10:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RecipelHistory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RecipelId] [int] NOT NULL,
	[HisId] [nvarchar](50) NULL,
	[OperationId] [int] NULL,
	[OrderNo] [nvarchar](50) NULL,
	[HAreaId] [int] NULL,
	[RecipelNo] [nvarchar](50) NULL,
	[RecipelType] [nvarchar](50) NULL,
	[DAdviceType] [nvarchar](50) NULL,
	[PatientNo] [nvarchar](50) NULL,
	[HospitalNo] [nvarchar](50) NULL,
	[PatientId] [nvarchar](50) NULL,
	[Name] [nvarchar](50) NULL,
	[CurrentDeptId] [int] NULL,
	[CurrentDeptCode] [nvarchar](50) NULL,
	[CurrentDeptName] [nvarchar](50) NULL,
	[Diagnostic] [nvarchar](1000) NULL,
	[Sex] [nvarchar](10) NULL,
	[BedNo] [nchar](10) NULL,
	[Age] [nvarchar](50) NULL,
	[PICCard] [nvarchar](50) NULL,
	[height] [nvarchar](50) NULL,
	[Weight] [nvarchar](50) NULL,
	[HandleName] [nvarchar](50) NULL,
	[HandleIDCard] [nvarchar](50) NULL,
	[SystemTime] [datetime] NULL,
	[CreateTime] [datetime] NULL,
	[PayTime] [datetime] NULL,
	[CheckTime] [datetime] NULL,
	[CheckUserName] [nvarchar](50) NULL,
	[CheckDeptId] [int] NULL,
	[ImplementDoctorId] [nvarchar](50) NULL,
	[ImplementDoctorName] [nvarchar](50) NULL,
	[ImplementDeptId] [int] NULL,
	[BillDeptid] [int] NULL,
	[BillDeptCode] [nvarchar](50) NULL,
	[BillDeptName] [nvarchar](50) NULL,
	[ClaimDeptId] [int] NULL,
	[ClaimDeptCode] [nvarchar](50) NULL,
	[ClaimDeptName] [nvarchar](50) NULL,
	[Drugid] [int] NULL,
	[DrugCode] [nvarchar](50) NULL,
	[DrugName] [nvarchar](50) NULL,
	[DrugSpec] [nvarchar](50) NULL,
	[DrugCount] [decimal](18, 3) NULL,
	[BackCount] [decimal](18, 3) NULL,
	[UseFlg] [nvarchar](50) NULL,
	[Usage] [nvarchar](50) NULL,
	[LeftUsage] [nvarchar](50) NULL,
	[Batch] [nvarchar](50) NULL,
	[ValidTime] [datetime] NULL,
	[Status] [nvarchar](50) NULL,
	[FinishTime] [datetime] NULL,
	[BackDrugTime] [datetime] NULL,
	[BackUserName] [nvarchar](50) NULL,
	[BackDeptId] [int] NULL,
	[BackDeptCode] [nvarchar](50) NULL,
	[DAdviceStartTime] [datetime] NULL,
	[DAdviceStopTime] [datetime] NULL,
	[DAdviceStatus] [int] NULL,
	[DAdviceZXTime] [datetime] NULL,
	[BillDoctorId] [int] NULL,
	[BillDoctorName] [nvarchar](50) NULL,
	[HisBackDrugTime] [datetime] NULL,
	[RegisterTime] [datetime] NULL,
	[IsDel] [int] NULL,
	[Spare1] [nvarchar](50) NULL,
	[Spare2] [nvarchar](50) NULL,
	[Spare3] [nvarchar](50) NULL,
	[Spare4] [datetime] NULL,
	[Spare5] [datetime] NULL,
	[Spare6] [datetime] NULL,
	[Spare7] [int] NULL,
	[Spare8] [int] NULL,
	[Spare9] [int] NULL,
	[ImplementRoomId] [int] NULL,
	[RedRecipelNo] [varchar](50) NULL,
	[Frequency] [varchar](50) NULL,
	[PleaseId] [int] NULL,
	[RecycleCount] [int] NULL,
	[ChargingStatus] [int] NULL,
	[Commiter] [int] NULL,
	[Examer] [int] NULL,
	[Charger] [int] NULL,
	[CommitTime] [datetime] NULL,
	[ExameTime] [datetime] NULL,
	[ChargTime] [datetime] NULL,
 CONSTRAINT [PK_RecipelHistory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TBillNO]    Script Date: 2024/10/31 16:10:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBillNO](
	[BillNO] [nvarchar](25) NOT NULL,
	[BillType] [nvarchar](5) NULL,
	[CreateTime] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BillNO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserMaxDrugOut]    Script Date: 2024/10/31 16:10:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserMaxDrugOut](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[DrugID] [int] NULL,
	[DrugName] [nvarchar](50) NULL,
	[MaxDrugOut] [int] NULL,
 CONSTRAINT [PK_UserMaxDrugOut] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[WeightIni]    Script Date: 2024/10/31 16:10:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[WeightIni](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DeviceId] [int] NULL,
	[MainBoardAddress] [int] NULL,
	[WeightData] [varchar](80) NULL,
	[Weight1] [int] NULL,
	[Weight2] [int] NULL,
	[Weight3] [int] NULL,
	[Weight4] [int] NULL,
	[Consersion1] [int] NULL,
	[Consersion2] [int] NULL,
	[Consersion3] [int] NULL,
	[Consersion4] [int] NULL,
	[CreateTime] [datetime] NULL,
	[UpdateTime] [datetime] NULL,
 CONSTRAINT [PK_WeightIni] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[DeviceGridBox] ADD  DEFAULT ((1)) FOR [LineIndex]
GO
ALTER TABLE [dbo].[DeviceGridBox] ADD  DEFAULT ((1)) FOR [Rowspan]
GO
ALTER TABLE [dbo].[DeviceGridBox] ADD  DEFAULT ((1)) FOR [Colspan]
GO
ALTER TABLE [dbo].[DeviceGridBox] ADD  DEFAULT ((0)) FOR [CellCount]
GO
ALTER TABLE [dbo].[DeviceGridBox] ADD  DEFAULT ((0)) FOR [CellAddress]
GO
ALTER TABLE [dbo].[DrugBatchValid] ADD  DEFAULT ((0)) FOR [IsStop]
GO
ALTER TABLE [dbo].[DrugDeptAtt] ADD  DEFAULT ((-1)) FOR [Status]
GO
ALTER TABLE [dbo].[DrugDeptAtt] ADD  DEFAULT ((1)) FOR [Disabled]
GO
ALTER TABLE [dbo].[RecipelHistory] ADD  DEFAULT ((0)) FOR [Commiter]
GO
ALTER TABLE [dbo].[RecipelHistory] ADD  DEFAULT ((0)) FOR [Examer]
GO
ALTER TABLE [dbo].[RecipelHistory] ADD  DEFAULT ((0)) FOR [Charger]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'模板ID（主键）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AppSettingTemplate', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'模板编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AppSettingTemplate', @level2type=N'COLUMN',@level2name=N'TemplateCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'模板描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AppSettingTemplate', @level2type=N'COLUMN',@level2name=N'TemplateDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'系统配置模板表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AppSettingTemplate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'模板配置对象ID（主键）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AppSettingTemplateItem', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'模板编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AppSettingTemplateItem', @level2type=N'COLUMN',@level2name=N'TemplateCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'配置表名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AppSettingTemplateItem', @level2type=N'COLUMN',@level2name=N'TableName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'配置列名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AppSettingTemplateItem', @level2type=N'COLUMN',@level2name=N'ColumnName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'配置列值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AppSettingTemplateItem', @level2type=N'COLUMN',@level2name=N'ColumnValue'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'配置列类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AppSettingTemplateItem', @level2type=N'COLUMN',@level2name=N'ColumnType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AppSettingTemplateItem', @level2type=N'COLUMN',@level2name=N'Remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'系统配置模板明细表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AppSettingTemplateItem'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'划价计费，请求HIS接口表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ChargingResponse'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'唯一值，自增' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consumables', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'耗材编码,不允许重复' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consumables', @level2type=N'COLUMN',@level2name=N'ConsumablesCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'耗材名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consumables', @level2type=N'COLUMN',@level2name=N'ConsumablesName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'套组名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consumables', @level2type=N'COLUMN',@level2name=N'SuiteName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'his编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consumables', @level2type=N'COLUMN',@level2name=N'HisCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consumables', @level2type=N'COLUMN',@level2name=N'CreateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consumables', @level2type=N'COLUMN',@level2name=N'CreateUserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consumables', @level2type=N'COLUMN',@level2name=N'UpdateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改人ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consumables', @level2type=N'COLUMN',@level2name=N'UpdateUserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序序号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consumables', @level2type=N'COLUMN',@level2name=N'SortIndex'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否启用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consumables', @level2type=N'COLUMN',@level2name=N'IsEnable'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'耗材表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consumables'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'手术排程Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ConsumablesCharging', @level2type=N'COLUMN',@level2name=N'RecipelId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1已计费 NULL未计费 0计费失败' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ConsumablesCharging', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'审核人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ConsumablesCharging', @level2type=N'COLUMN',@level2name=N'User1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'提交人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ConsumablesCharging', @level2type=N'COLUMN',@level2name=N'User2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ConsumablesCharging', @level2type=N'COLUMN',@level2name=N'User3'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'设备Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ConsumablesCharging', @level2type=N'COLUMN',@level2name=N'DeviceId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'划价后保存表，以及后台审核划价单管理保存表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ConsumablesCharging'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'唯一值，自增' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ConsumablesDept', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'耗材编码,不允许重复' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ConsumablesDept', @level2type=N'COLUMN',@level2name=N'ConsumablesCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'耗材名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ConsumablesDept', @level2type=N'COLUMN',@level2name=N'ConsumablesName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'套组名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ConsumablesDept', @level2type=N'COLUMN',@level2name=N'SuiteName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'his编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ConsumablesDept', @level2type=N'COLUMN',@level2name=N'HisCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ConsumablesDept', @level2type=N'COLUMN',@level2name=N'CreateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ConsumablesDept', @level2type=N'COLUMN',@level2name=N'CreateUserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ConsumablesDept', @level2type=N'COLUMN',@level2name=N'UpdateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改人ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ConsumablesDept', @level2type=N'COLUMN',@level2name=N'UpdateUserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序序号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ConsumablesDept', @level2type=N'COLUMN',@level2name=N'SortIndex'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否启用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ConsumablesDept', @level2type=N'COLUMN',@level2name=N'IsEnable'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'部门Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ConsumablesDept', @level2type=N'COLUMN',@level2name=N'DeptId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'耗材表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ConsumablesDept'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'药格ID（主键）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DeviceGridBox', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'配置模板编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DeviceGridBox', @level2type=N'COLUMN',@level2name=N'TemplateCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'设备Id（关联Device表的Id）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DeviceGridBox', @level2type=N'COLUMN',@level2name=N'DeviceId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'药品属性Id（关联DurgAtt表的Id）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DeviceGridBox', @level2type=N'COLUMN',@level2name=N'DrugAttId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'所在层号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DeviceGridBox', @level2type=N'COLUMN',@level2name=N'FloorIndex'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'所在门列的序号：一层多门时，从左到右，依次从1开始' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DeviceGridBox', @level2type=N'COLUMN',@level2name=N'LineIndex'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'药格序号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DeviceGridBox', @level2type=N'COLUMN',@level2name=N'BoxIndex'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'布局行号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DeviceGridBox', @level2type=N'COLUMN',@level2name=N'RowNO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'布局列号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DeviceGridBox', @level2type=N'COLUMN',@level2name=N'ColumnNO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'布局行跨距' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DeviceGridBox', @level2type=N'COLUMN',@level2name=N'Rowspan'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'布局列跨距' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DeviceGridBox', @level2type=N'COLUMN',@level2name=N'Colspan'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单元格点位数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DeviceGridBox', @level2type=N'COLUMN',@level2name=N'CellCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单元格点位数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DeviceGridBox', @level2type=N'COLUMN',@level2name=N'CellAddress'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'设备药格单元格表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DeviceGridBox'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'模板ID（主键）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DeviceGridBoxTemplate', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'模板编码：编码后三位对应“系统部署院区版本枚举”的枚举值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DeviceGridBoxTemplate', @level2type=N'COLUMN',@level2name=N'TemplateCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'模板描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DeviceGridBoxTemplate', @level2type=N'COLUMN',@level2name=N'TemplateDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'设备药格单元格配置模板表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DeviceGridBoxTemplate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'模板配置对象ID（主键）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DeviceGridBoxTemplateItem', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'配置模板编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DeviceGridBoxTemplateItem', @level2type=N'COLUMN',@level2name=N'TemplateCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'所在层号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DeviceGridBoxTemplateItem', @level2type=N'COLUMN',@level2name=N'FloorIndex'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'所在门列的序号：一层多门时，从左到右，依次从1开始' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DeviceGridBoxTemplateItem', @level2type=N'COLUMN',@level2name=N'LineIndex'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'药格序号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DeviceGridBoxTemplateItem', @level2type=N'COLUMN',@level2name=N'BoxIndex'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'布局行号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DeviceGridBoxTemplateItem', @level2type=N'COLUMN',@level2name=N'RowNO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'布局列号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DeviceGridBoxTemplateItem', @level2type=N'COLUMN',@level2name=N'ColumnNO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'布局规则，0-未指定规则或者按行按列都支持，1-指定按行进行规范布局，2-指定按列进行规范布局' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DeviceGridBoxTemplateItem', @level2type=N'COLUMN',@level2name=N'LayoutRule'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'布局行跨距' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DeviceGridBoxTemplateItem', @level2type=N'COLUMN',@level2name=N'Rowspan'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'布局列跨距' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DeviceGridBoxTemplateItem', @level2type=N'COLUMN',@level2name=N'Colspan'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单元格点位数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DeviceGridBoxTemplateItem', @level2type=N'COLUMN',@level2name=N'CellCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单元格点位地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DeviceGridBoxTemplateItem', @level2type=N'COLUMN',@level2name=N'CellAddress'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'设备药格单元格配置模板明细表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DeviceGridBoxTemplateItem'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DrugBatchAndValidTime', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'科室编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DrugBatchAndValidTime', @level2type=N'COLUMN',@level2name=N'DeptId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'设备编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DrugBatchAndValidTime', @level2type=N'COLUMN',@level2name=N'DeviceId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'药品编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DrugBatchAndValidTime', @level2type=N'COLUMN',@level2name=N'DrugId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'药品名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DrugBatchAndValidTime', @level2type=N'COLUMN',@level2name=N'DrugName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'批号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DrugBatchAndValidTime', @level2type=N'COLUMN',@level2name=N'Batch'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'效期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DrugBatchAndValidTime', @level2type=N'COLUMN',@level2name=N'ValidTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否启用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DrugBatchAndValidTime', @level2type=N'COLUMN',@level2name=N'IsEnable'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DrugBatchAndValidTime', @level2type=N'COLUMN',@level2name=N'Remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID，唯一值，自增' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DrugBatchValid', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'设备ID，唯一值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DrugBatchValid', @level2type=N'COLUMN',@level2name=N'DeviceId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发药科室ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DrugBatchValid', @level2type=N'COLUMN',@level2name=N'ProvidDeptId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'药品ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DrugBatchValid', @level2type=N'COLUMN',@level2name=N'DrugId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'批号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DrugBatchValid', @level2type=N'COLUMN',@level2name=N'Batch'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'效期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DrugBatchValid', @level2type=N'COLUMN',@level2name=N'ValidTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否停用，默认0,1停用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DrugBatchValid', @level2type=N'COLUMN',@level2name=N'IsStop'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DrugBatchValid', @level2type=N'COLUMN',@level2name=N'CreateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DrugBatchValid', @level2type=N'COLUMN',@level2name=N'CreateUserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DrugBatchValid', @level2type=N'COLUMN',@level2name=N'UpdateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改人ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DrugBatchValid', @level2type=N'COLUMN',@level2name=N'UpdateUserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'批号效期管理表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DrugBatchValid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'表ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DrugDeptAtt', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'关联Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DrugDeptAtt', @level2type=N'COLUMN',@level2name=N'DrugDeptAttId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'默认-1; 0显示' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DrugDeptAtt', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否禁用 0是禁用;1是启用；管理端电子划价修改添加药品处用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DrugDeptAtt', @level2type=N'COLUMN',@level2name=N'Disabled'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序序号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DrugDeptAtt', @level2type=N'COLUMN',@level2name=N'SortIndex'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'科室药品目录表（划价处其他药品管理）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DrugDeptAtt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'已发放数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DrugOutDetail', @level2type=N'COLUMN',@level2name=N'Count'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'已分配数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DrugOutDetail', @level2type=N'COLUMN',@level2name=N'UseCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'退药数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DrugOutDetail', @level2type=N'COLUMN',@level2name=N'ReturnDrugCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'空瓶回收数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DrugOutDetail', @level2type=N'COLUMN',@level2name=N'ReturnNullCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'退药数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DrugOutDetail', @level2type=N'COLUMN',@level2name=N'TakeReturnDrugCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'空瓶回收数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DrugOutDetail', @level2type=N'COLUMN',@level2name=N'TakeReturnNullCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'入库时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DrugOutDetail', @level2type=N'COLUMN',@level2name=N'CreateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'认证人1ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DrugOutDetail', @level2type=N'COLUMN',@level2name=N'AuthUserId1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'认证方式 刷卡、指纹' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DrugOutDetail', @level2type=N'COLUMN',@level2name=N'Auth1Type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'认证人2ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DrugOutDetail', @level2type=N'COLUMN',@level2name=N'AuthUserId2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'认证方式 刷卡、指纹' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DrugOutDetail', @level2type=N'COLUMN',@level2name=N'Auth2Type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否是称重数据 1：是' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DrugOutDetail', @level2type=N'COLUMN',@level2name=N'IsWeight'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1:汇总发药2:患者发药' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DrugOutDetail', @level2type=N'COLUMN',@level2name=N'Type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态(0未分配 1已分配 2删除)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DrugOutDetail', @level2type=N'COLUMN',@level2name=N'status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否删除(0未删除 1删除)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DrugOutDetail', @level2type=N'COLUMN',@level2name=N'IsDeleted'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'针对手术室管理-取药列表-实时取药记录表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DrugOutDetail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'设备id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DrugOutDetailReturnFlow', @level2type=N'COLUMN',@level2name=N'DeviceId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'回收登记表ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DrugOutDetailReturnFlow', @level2type=N'COLUMN',@level2name=N'DrugOutDetailId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'业务类型 1回收,2:退药' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DrugOutDetailReturnFlow', @level2type=N'COLUMN',@level2name=N'ReturnType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'药品ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DrugOutDetailReturnFlow', @level2type=N'COLUMN',@level2name=N'DrugId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'药品名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DrugOutDetailReturnFlow', @level2type=N'COLUMN',@level2name=N'DrugName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'回收空瓶数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DrugOutDetailReturnFlow', @level2type=N'COLUMN',@level2name=N'ReturnCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'当前空瓶数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DrugOutDetailReturnFlow', @level2type=N'COLUMN',@level2name=N'TakeReturnCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'认证人1ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DrugOutDetailReturnFlow', @level2type=N'COLUMN',@level2name=N'AuthUserId1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'认证方式 1是指纹认证，2是刷卡认证' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DrugOutDetailReturnFlow', @level2type=N'COLUMN',@level2name=N'Auth1Type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'认证人2ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DrugOutDetailReturnFlow', @level2type=N'COLUMN',@level2name=N'AuthUserId2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'认证方式 1是指纹认证，2是刷卡认证' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DrugOutDetailReturnFlow', @level2type=N'COLUMN',@level2name=N'Auth2Type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'取出时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DrugOutDetailReturnFlow', @level2type=N'COLUMN',@level2name=N'TakeTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数据来源(1DrugOutDetail 2PleaseBill)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DrugOutDetailReturnFlow', @level2type=N'COLUMN',@level2name=N'SourceType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'取出用户ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DrugOutDetailReturnFlow', @level2type=N'COLUMN',@level2name=N'TakeUserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'取出认证用户ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DrugOutDetailReturnFlow', @level2type=N'COLUMN',@level2name=N'TakeAuthUserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'空瓶回收销毁流水表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DrugOutDetailReturnFlow'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'人脸识别人脸图片保存表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FaceFile'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'手术进度更新记录主表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HisUpdateOperation', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'住院流水号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HisUpdateOperation', @level2type=N'COLUMN',@level2name=N'InpatientNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'手术申请号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HisUpdateOperation', @level2type=N'COLUMN',@level2name=N'OperationApplyNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'住院号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HisUpdateOperation', @level2type=N'COLUMN',@level2name=N'PatientNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'患者名字' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HisUpdateOperation', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'年龄' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HisUpdateOperation', @level2type=N'COLUMN',@level2name=N'Age'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'性别' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HisUpdateOperation', @level2type=N'COLUMN',@level2name=N'Sex'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'手术状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HisUpdateOperation', @level2type=N'COLUMN',@level2name=N'ChuFangStatus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'手术间号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HisUpdateOperation', @level2type=N'COLUMN',@level2name=N'RoomName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'麻醉医生编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HisUpdateOperation', @level2type=N'COLUMN',@level2name=N'ZxDoctorCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'麻醉医生名字' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HisUpdateOperation', @level2type=N'COLUMN',@level2name=N'ZxDoctorName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'执行科室编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HisUpdateOperation', @level2type=N'COLUMN',@level2name=N'ZxDeptCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'执行科室名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HisUpdateOperation', @level2type=N'COLUMN',@level2name=N'ZxDeptName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HisUpdateOperation', @level2type=N'COLUMN',@level2name=N'OperationTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'床号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HisUpdateOperation', @level2type=N'COLUMN',@level2name=N'BedNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'身份证号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HisUpdateOperation', @level2type=N'COLUMN',@level2name=N'IdNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'手术排程ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HisUpdateOperation', @level2type=N'COLUMN',@level2name=N'OperationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'医嘱ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HisUpdateOperation', @level2type=N'COLUMN',@level2name=N'RecipelId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'明细ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HisUpdateOperationDetail', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'his更新主表记录id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HisUpdateOperationDetail', @level2type=N'COLUMN',@level2name=N'HisUpdateOperationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'门诊号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OperationRequest', @level2type=N'COLUMN',@level2name=N'cardNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'就诊号（住院号）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OperationRequest', @level2type=N'COLUMN',@level2name=N'visitNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'诊疗流水号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OperationRequest', @level2type=N'COLUMN',@level2name=N'visitSqNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'就诊类型编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OperationRequest', @level2type=N'COLUMN',@level2name=N'visitTypeCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'就诊类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OperationRequest', @level2type=N'COLUMN',@level2name=N'visitTypeName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'就诊次数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OperationRequest', @level2type=N'COLUMN',@level2name=N'visitTimes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'患者ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OperationRequest', @level2type=N'COLUMN',@level2name=N'patientId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'患者HisID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OperationRequest', @level2type=N'COLUMN',@level2name=N'patientHisId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'身份证号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OperationRequest', @level2type=N'COLUMN',@level2name=N'idCardNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'医保卡号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OperationRequest', @level2type=N'COLUMN',@level2name=N'medicareCard'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'患者姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OperationRequest', @level2type=N'COLUMN',@level2name=N'patientName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'性别编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OperationRequest', @level2type=N'COLUMN',@level2name=N'genderCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'性别' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OperationRequest', @level2type=N'COLUMN',@level2name=N'genderName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'出生日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OperationRequest', @level2type=N'COLUMN',@level2name=N'birthDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'年龄' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OperationRequest', @level2type=N'COLUMN',@level2name=N'age'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'身高' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OperationRequest', @level2type=N'COLUMN',@level2name=N'height'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'体重' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OperationRequest', @level2type=N'COLUMN',@level2name=N'weight'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'电话' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OperationRequest', @level2type=N'COLUMN',@level2name=N'phone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OperationRequest', @level2type=N'COLUMN',@level2name=N'adress'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'病床编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OperationRequest', @level2type=N'COLUMN',@level2name=N'bedCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'病床号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OperationRequest', @level2type=N'COLUMN',@level2name=N'bedName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'病房编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OperationRequest', @level2type=N'COLUMN',@level2name=N'sickroomCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'病房号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OperationRequest', @level2type=N'COLUMN',@level2name=N'sickroomName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'患者所属科室编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OperationRequest', @level2type=N'COLUMN',@level2name=N'deptCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'患者所属科室' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OperationRequest', @level2type=N'COLUMN',@level2name=N'deptName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'患者所在病区编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OperationRequest', @level2type=N'COLUMN',@level2name=N'wardCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'患者所在病区名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OperationRequest', @level2type=N'COLUMN',@level2name=N'wardName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'申请科室编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OperationRequest', @level2type=N'COLUMN',@level2name=N'orderDepeCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'申请科室名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OperationRequest', @level2type=N'COLUMN',@level2name=N'orderDepeName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'申请单开立者编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OperationRequest', @level2type=N'COLUMN',@level2name=N'orderDocCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'申请单开立者' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OperationRequest', @level2type=N'COLUMN',@level2name=N'orderDocName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'申请单编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OperationRequest', @level2type=N'COLUMN',@level2name=N'requestNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'申请单开立时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OperationRequest', @level2type=N'COLUMN',@level2name=N'requestTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'麻醉方式编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OperationRequest', @level2type=N'COLUMN',@level2name=N'anestheticMethodsCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'麻醉方式名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OperationRequest', @level2type=N'COLUMN',@level2name=N'anestheticMethodsName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'执行科室编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OperationRequest', @level2type=N'COLUMN',@level2name=N'execDeptCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'执行科室名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OperationRequest', @level2type=N'COLUMN',@level2name=N'execDeptName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'手术类别编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OperationRequest', @level2type=N'COLUMN',@level2name=N'operationCategoryCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'手术类别名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OperationRequest', @level2type=N'COLUMN',@level2name=N'operationCategoryName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'拟手术日期、预定手术时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OperationRequest', @level2type=N'COLUMN',@level2name=N'operationDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'拟手术持续时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OperationRequest', @level2type=N'COLUMN',@level2name=N'operationDuration'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'拟手术持续时间单位' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OperationRequest', @level2type=N'COLUMN',@level2name=N'operationDurationUnit'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'手术室编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OperationRequest', @level2type=N'COLUMN',@level2name=N'operationRoomCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'手术室名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OperationRequest', @level2type=N'COLUMN',@level2name=N'operationRoomName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(主刀医生)术者编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OperationRequest', @level2type=N'COLUMN',@level2name=N'operatorCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(主刀医生)术者名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OperationRequest', @level2type=N'COLUMN',@level2name=N'operatorName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'手术性质编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OperationRequest', @level2type=N'COLUMN',@level2name=N'operatorNatureCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'手术性质名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OperationRequest', @level2type=N'COLUMN',@level2name=N'operatorNatureName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'注意事项' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OperationRequest', @level2type=N'COLUMN',@level2name=N'attentionItem'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'审核日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OperationRequest', @level2type=N'COLUMN',@level2name=N'reviewDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'审核人编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OperationRequest', @level2type=N'COLUMN',@level2name=N'reviewDocCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'审核人姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OperationRequest', @level2type=N'COLUMN',@level2name=N'reviewDocName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'就诊日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OperationRequest', @level2type=N'COLUMN',@level2name=N'visitDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'诊断list' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OperationRequest', @level2type=N'COLUMN',@level2name=N'operationDescList'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'诊断list' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OperationRequest', @level2type=N'COLUMN',@level2name=N'diagnosisList'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'同步时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OperationRequest', @level2type=N'COLUMN',@level2name=N'SyncTiem'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'处方医嘱Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecipelHistory', @level2type=N'COLUMN',@level2name=N'RecipelId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'HIS系统ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecipelHistory', @level2type=N'COLUMN',@level2name=N'HisId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'汇总单号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecipelHistory', @level2type=N'COLUMN',@level2name=N'OrderNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'院区Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecipelHistory', @level2type=N'COLUMN',@level2name=N'HAreaId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'处方号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecipelHistory', @level2type=N'COLUMN',@level2name=N'RecipelNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'处方类型：住院医嘱，急诊医嘱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecipelHistory', @level2type=N'COLUMN',@level2name=N'RecipelType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'医嘱类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecipelHistory', @level2type=N'COLUMN',@level2name=N'DAdviceType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'门诊号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecipelHistory', @level2type=N'COLUMN',@level2name=N'PatientNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'住院号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecipelHistory', @level2type=N'COLUMN',@level2name=N'HospitalNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'患者姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecipelHistory', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'患者当前科室id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecipelHistory', @level2type=N'COLUMN',@level2name=N'CurrentDeptId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'患者当前科室编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecipelHistory', @level2type=N'COLUMN',@level2name=N'CurrentDeptCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'患者当前科室名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecipelHistory', @level2type=N'COLUMN',@level2name=N'CurrentDeptName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'诊断信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecipelHistory', @level2type=N'COLUMN',@level2name=N'Diagnostic'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'患者性别' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecipelHistory', @level2type=N'COLUMN',@level2name=N'Sex'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'患者床号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecipelHistory', @level2type=N'COLUMN',@level2name=N'BedNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'年龄' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecipelHistory', @level2type=N'COLUMN',@level2name=N'Age'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'患者身份证号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecipelHistory', @level2type=N'COLUMN',@level2name=N'PICCard'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'身高' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecipelHistory', @level2type=N'COLUMN',@level2name=N'height'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'体重' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecipelHistory', @level2type=N'COLUMN',@level2name=N'Weight'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'经办人/代办人/领药人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecipelHistory', @level2type=N'COLUMN',@level2name=N'HandleName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'经办人身份证号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecipelHistory', @level2type=N'COLUMN',@level2name=N'HandleIDCard'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'系统创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecipelHistory', @level2type=N'COLUMN',@level2name=N'SystemTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'处方创建日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecipelHistory', @level2type=N'COLUMN',@level2name=N'CreateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'处方缴费日期、记账日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecipelHistory', @level2type=N'COLUMN',@level2name=N'PayTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'药房处方审核发药日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecipelHistory', @level2type=N'COLUMN',@level2name=N'CheckTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'药房处方审核发药医' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecipelHistory', @level2type=N'COLUMN',@level2name=N'CheckUserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'审核部门（药房）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecipelHistory', @level2type=N'COLUMN',@level2name=N'CheckDeptId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'医嘱执行医师Code' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecipelHistory', @level2type=N'COLUMN',@level2name=N'ImplementDoctorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'医嘱执行医师名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecipelHistory', @level2type=N'COLUMN',@level2name=N'ImplementDoctorName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'医嘱执行科室' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecipelHistory', @level2type=N'COLUMN',@level2name=N'ImplementDeptId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'开单科室ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecipelHistory', @level2type=N'COLUMN',@level2name=N'BillDeptid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'开单科室编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecipelHistory', @level2type=N'COLUMN',@level2name=N'BillDeptCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'BillDeptName' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecipelHistory', @level2type=N'COLUMN',@level2name=N'BillDeptName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'领药部门ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecipelHistory', @level2type=N'COLUMN',@level2name=N'ClaimDeptId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'领药部门编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecipelHistory', @level2type=N'COLUMN',@level2name=N'ClaimDeptCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'领药科室名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecipelHistory', @level2type=N'COLUMN',@level2name=N'ClaimDeptName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用药id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecipelHistory', @level2type=N'COLUMN',@level2name=N'Drugid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用药编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecipelHistory', @level2type=N'COLUMN',@level2name=N'DrugCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用药名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecipelHistory', @level2type=N'COLUMN',@level2name=N'DrugName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用药规格' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecipelHistory', @level2type=N'COLUMN',@level2name=N'DrugSpec'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用药数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecipelHistory', @level2type=N'COLUMN',@level2name=N'DrugCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'退药数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecipelHistory', @level2type=N'COLUMN',@level2name=N'BackCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用药用法' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecipelHistory', @level2type=N'COLUMN',@level2name=N'UseFlg'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用药剂量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecipelHistory', @level2type=N'COLUMN',@level2name=N'Usage'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'药液余量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecipelHistory', @level2type=N'COLUMN',@level2name=N'LeftUsage'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'药批号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecipelHistory', @level2type=N'COLUMN',@level2name=N'Batch'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用药效期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecipelHistory', @level2type=N'COLUMN',@level2name=N'ValidTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态:药房待发药、药房已发药、未发his已退药、已发his已退药、已执行退药' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecipelHistory', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'处方、医嘱取药完成时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecipelHistory', @level2type=N'COLUMN',@level2name=N'FinishTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'处方、医嘱设备上执行退药时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecipelHistory', @level2type=N'COLUMN',@level2name=N'BackDrugTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'退药执行人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecipelHistory', @level2type=N'COLUMN',@level2name=N'BackUserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'退药执行科室id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecipelHistory', @level2type=N'COLUMN',@level2name=N'BackDeptId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'退药执行科室编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecipelHistory', @level2type=N'COLUMN',@level2name=N'BackDeptCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'医嘱开始时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecipelHistory', @level2type=N'COLUMN',@level2name=N'DAdviceStartTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'医嘱结束时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecipelHistory', @level2type=N'COLUMN',@level2name=N'DAdviceStopTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'医嘱执行状态  0：已创建  1：进行中  2：已结束 3：急诊已发药 4 已取药  默认为0 ;-1:已取消' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecipelHistory', @level2type=N'COLUMN',@level2name=N'DAdviceStatus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'医嘱执行时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecipelHistory', @level2type=N'COLUMN',@level2name=N'DAdviceZXTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'开单医生Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecipelHistory', @level2type=N'COLUMN',@level2name=N'BillDoctorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'开单医生名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecipelHistory', @level2type=N'COLUMN',@level2name=N'BillDoctorName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'His退药执行时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecipelHistory', @level2type=N'COLUMN',@level2name=N'HisBackDrugTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报道时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecipelHistory', @level2type=N'COLUMN',@level2name=N'RegisterTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'红处方序号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecipelHistory', @level2type=N'COLUMN',@level2name=N'RedRecipelNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用药频次' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecipelHistory', @level2type=N'COLUMN',@level2name=N'Frequency'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注(仅住院药房使用)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecipelHistory', @level2type=N'COLUMN',@level2name=N'PleaseId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N' 备注(仅住院药房使用)处方回收数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecipelHistory', @level2type=N'COLUMN',@level2name=N'RecycleCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'未提交 0,已提交1，已审核2，已计费3，已驳回-1，未用药NULL，计费失败4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecipelHistory', @level2type=N'COLUMN',@level2name=N'ChargingStatus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'提交人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecipelHistory', @level2type=N'COLUMN',@level2name=N'Commiter'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'审核人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecipelHistory', @level2type=N'COLUMN',@level2name=N'Examer'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'计费人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecipelHistory', @level2type=N'COLUMN',@level2name=N'Charger'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'提交时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecipelHistory', @level2type=N'COLUMN',@level2name=N'CommitTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'审核时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecipelHistory', @level2type=N'COLUMN',@level2name=N'ExameTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'计费时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecipelHistory', @level2type=N'COLUMN',@level2name=N'ChargTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'处方、医嘱信息表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecipelHistory'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单据号，唯一' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TBillNO', @level2type=N'COLUMN',@level2name=N'BillNO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单据类型，如LS...' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TBillNO', @level2type=N'COLUMN',@level2name=N'BillType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TBillNO', @level2type=N'COLUMN',@level2name=N'CreateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单据号表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TBillNO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'设备号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WeightIni', @level2type=N'COLUMN',@level2name=N'DeviceId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主板地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WeightIni', @level2type=N'COLUMN',@level2name=N'MainBoardAddress'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Weight1 Weight2 Weight3 Weight4 Consersion1 Consersion2 Consersion3 Consersion4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WeightIni', @level2type=N'COLUMN',@level2name=N'WeightData'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'L1:WeightType == 2 && WeightAddress == 1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WeightIni', @level2type=N'COLUMN',@level2name=N'Weight1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'H1:WeightType == 1 && WeightAddress == 1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WeightIni', @level2type=N'COLUMN',@level2name=N'Weight2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'L2:WeightType == 2 && WeightAddress == 2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WeightIni', @level2type=N'COLUMN',@level2name=N'Weight3'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'H2:WeightType == 1 && WeightAddress == 2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WeightIni', @level2type=N'COLUMN',@level2name=N'Weight4'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'L1:WeightType == 2 && WeightAddress == 1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WeightIni', @level2type=N'COLUMN',@level2name=N'Consersion1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'H1:WeightType == 1 && WeightAddress == 1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WeightIni', @level2type=N'COLUMN',@level2name=N'Consersion2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'L2:WeightType == 2 && WeightAddress == 2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WeightIni', @level2type=N'COLUMN',@level2name=N'Consersion3'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'H2:WeightType == 1 && WeightAddress == 2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WeightIni', @level2type=N'COLUMN',@level2name=N'Consersion4'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WeightIni', @level2type=N'COLUMN',@level2name=N'CreateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WeightIni', @level2type=N'COLUMN',@level2name=N'UpdateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'设备称重系数保存表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WeightIni'
GO
