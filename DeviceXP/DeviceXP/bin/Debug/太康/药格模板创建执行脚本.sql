/*
Navicat SQL Server Data Transfer

Source Server         : 本地数据库
Source Server Version : 110000
Source Host           : .:1433
Source Database       : HnhrDB_DrugWeighingTool
Source Schema         : dbo

Target Server Type    : SQL Server
Target Server Version : 110000
File Encoding         : 65001

Date: 2024-10-31 16:44:06
*/


-- ----------------------------
-- Table structure for DeviceGridBoxTemplate
-- ----------------------------
--DROP TABLE [dbo].[DeviceGridBoxTemplate]
--GO
CREATE TABLE [dbo].[DeviceGridBoxTemplate] (
[Id] int NOT NULL IDENTITY(1,1) ,
[TemplateCode] nvarchar(50) NOT NULL ,
[TemplateDescription] nvarchar(500) NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[DeviceGridBoxTemplate]', RESEED, 7)
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'DeviceGridBoxTemplate', 
NULL, NULL)) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'设备药格单元格配置模板表'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'DeviceGridBoxTemplate'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'设备药格单元格配置模板表'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'DeviceGridBoxTemplate'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'DeviceGridBoxTemplate', 
'COLUMN', N'Id')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'模板ID（主键）'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'DeviceGridBoxTemplate'
, @level2type = 'COLUMN', @level2name = N'Id'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'模板ID（主键）'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'DeviceGridBoxTemplate'
, @level2type = 'COLUMN', @level2name = N'Id'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'DeviceGridBoxTemplate', 
'COLUMN', N'TemplateCode')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'模板编码：编码后三位对应“系统部署院区版本枚举”的枚举值'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'DeviceGridBoxTemplate'
, @level2type = 'COLUMN', @level2name = N'TemplateCode'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'模板编码：编码后三位对应“系统部署院区版本枚举”的枚举值'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'DeviceGridBoxTemplate'
, @level2type = 'COLUMN', @level2name = N'TemplateCode'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'DeviceGridBoxTemplate', 
'COLUMN', N'TemplateDescription')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'模板描述'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'DeviceGridBoxTemplate'
, @level2type = 'COLUMN', @level2name = N'TemplateDescription'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'模板描述'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'DeviceGridBoxTemplate'
, @level2type = 'COLUMN', @level2name = N'TemplateDescription'
GO

-- ----------------------------
-- Records of DeviceGridBoxTemplate
-- ----------------------------
SET IDENTITY_INSERT [dbo].[DeviceGridBoxTemplate] ON
GO
INSERT INTO [dbo].[DeviceGridBoxTemplate] ([Id], [TemplateCode], [TemplateDescription]) VALUES (N'1', N'DGB001', N'郑大一河医院区日间手术部麻药车设备药格单元格配置模板')
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplate] ([Id], [TemplateCode], [TemplateDescription]) VALUES (N'2', N'DGB002', N'郑大一河医院区手术五部麻药车设备药格单元格配置模板')
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplate] ([Id], [TemplateCode], [TemplateDescription]) VALUES (N'3', N'DGB003', N'郑大一河医院区药房麻药车设备药格单元格配置模板')
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplate] ([Id], [TemplateCode], [TemplateDescription]) VALUES (N'4', N'DGB004', N'郑大一郑东院区药房麻药车设备药格单元格配置模板')
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplate] ([Id], [TemplateCode], [TemplateDescription]) VALUES (N'5', N'DGB011', N'省肿瘤医院麻药车设备药格单元格配置模板')
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplate] ([Id], [TemplateCode], [TemplateDescription]) VALUES (N'6', N'DGB012', N'省肿瘤医院麻药柜设备药格单元格配置模板')
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplate] ([Id], [TemplateCode], [TemplateDescription]) VALUES (N'7', N'DGB015', N'太康县人民医院麻药车设备药格单元格配置模板')
GO
GO
SET IDENTITY_INSERT [dbo].[DeviceGridBoxTemplate] OFF
GO

-- ----------------------------
-- Indexes structure for table DeviceGridBoxTemplate
-- ----------------------------
CREATE INDEX [IX_DeviceGridBoxTemplate_1] ON [dbo].[DeviceGridBoxTemplate]
([Id] ASC) 
GO
CREATE INDEX [IX_DeviceGridBoxTemplate_2] ON [dbo].[DeviceGridBoxTemplate]
([TemplateCode] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table DeviceGridBoxTemplate
-- ----------------------------
ALTER TABLE [dbo].[DeviceGridBoxTemplate] ADD PRIMARY KEY ([Id])
GO


/*
Navicat SQL Server Data Transfer

Source Server         : 本地数据库
Source Server Version : 110000
Source Host           : .:1433
Source Database       : HnhrDB_DrugWeighingTool
Source Schema         : dbo

Target Server Type    : SQL Server
Target Server Version : 110000
File Encoding         : 65001

Date: 2024-10-31 16:44:15
*/


-- ----------------------------
-- Table structure for DeviceGridBoxTemplateItem
-- ----------------------------
--DROP TABLE [dbo].[DeviceGridBoxTemplateItem]
--GO
CREATE TABLE [dbo].[DeviceGridBoxTemplateItem] (
[Id] int NOT NULL IDENTITY(1,1) ,
[TemplateCode] nvarchar(50) NOT NULL ,
[FloorIndex] int NOT NULL ,
[LineIndex] int NOT NULL DEFAULT ((1)) ,
[BoxIndex] int NOT NULL ,
[RowNO] int NOT NULL ,
[ColumnNO] int NOT NULL ,
[LayoutRule] int NOT NULL ,
[Rowspan] decimal(18,2) NULL DEFAULT ((1)) ,
[Colspan] decimal(18,2) NULL DEFAULT ((1)) ,
[CellCount] int NULL ,
[CellAddress] tinyint NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[DeviceGridBoxTemplateItem]', RESEED, 227)
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'DeviceGridBoxTemplateItem', 
NULL, NULL)) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'设备药格单元格配置模板明细表'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'DeviceGridBoxTemplateItem'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'设备药格单元格配置模板明细表'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'DeviceGridBoxTemplateItem'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'DeviceGridBoxTemplateItem', 
'COLUMN', N'Id')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'模板配置对象ID（主键）'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'DeviceGridBoxTemplateItem'
, @level2type = 'COLUMN', @level2name = N'Id'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'模板配置对象ID（主键）'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'DeviceGridBoxTemplateItem'
, @level2type = 'COLUMN', @level2name = N'Id'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'DeviceGridBoxTemplateItem', 
'COLUMN', N'TemplateCode')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'配置模板编码'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'DeviceGridBoxTemplateItem'
, @level2type = 'COLUMN', @level2name = N'TemplateCode'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'配置模板编码'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'DeviceGridBoxTemplateItem'
, @level2type = 'COLUMN', @level2name = N'TemplateCode'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'DeviceGridBoxTemplateItem', 
'COLUMN', N'FloorIndex')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'所在层号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'DeviceGridBoxTemplateItem'
, @level2type = 'COLUMN', @level2name = N'FloorIndex'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'所在层号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'DeviceGridBoxTemplateItem'
, @level2type = 'COLUMN', @level2name = N'FloorIndex'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'DeviceGridBoxTemplateItem', 
'COLUMN', N'LineIndex')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'所在门列的序号：一层多门时，从左到右，依次从1开始'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'DeviceGridBoxTemplateItem'
, @level2type = 'COLUMN', @level2name = N'LineIndex'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'所在门列的序号：一层多门时，从左到右，依次从1开始'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'DeviceGridBoxTemplateItem'
, @level2type = 'COLUMN', @level2name = N'LineIndex'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'DeviceGridBoxTemplateItem', 
'COLUMN', N'BoxIndex')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'药格序号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'DeviceGridBoxTemplateItem'
, @level2type = 'COLUMN', @level2name = N'BoxIndex'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'药格序号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'DeviceGridBoxTemplateItem'
, @level2type = 'COLUMN', @level2name = N'BoxIndex'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'DeviceGridBoxTemplateItem', 
'COLUMN', N'RowNO')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'布局行号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'DeviceGridBoxTemplateItem'
, @level2type = 'COLUMN', @level2name = N'RowNO'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'布局行号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'DeviceGridBoxTemplateItem'
, @level2type = 'COLUMN', @level2name = N'RowNO'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'DeviceGridBoxTemplateItem', 
'COLUMN', N'ColumnNO')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'布局列号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'DeviceGridBoxTemplateItem'
, @level2type = 'COLUMN', @level2name = N'ColumnNO'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'布局列号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'DeviceGridBoxTemplateItem'
, @level2type = 'COLUMN', @level2name = N'ColumnNO'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'DeviceGridBoxTemplateItem', 
'COLUMN', N'LayoutRule')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'布局规则，0-未指定规则或者按行按列都支持，1-指定按行进行规范布局，2-指定按列进行规范布局，3-在行布局的基础上混合布局，4-在列布局基础上混合布局，5-固定宽度布局（高度按行动态布局，且默认宽度为350），6-固定高度布局（宽度按列动态布局，且默认高度为220），7-固定宽度和高度布局（默认宽度*高度=350*220）'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'DeviceGridBoxTemplateItem'
, @level2type = 'COLUMN', @level2name = N'LayoutRule'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'布局规则，0-未指定规则或者按行按列都支持，1-指定按行进行规范布局，2-指定按列进行规范布局，3-在行布局的基础上混合布局，4-在列布局基础上混合布局，5-固定宽度布局（高度按行动态布局，且默认宽度为350），6-固定高度布局（宽度按列动态布局，且默认高度为220），7-固定宽度和高度布局（默认宽度*高度=350*220）'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'DeviceGridBoxTemplateItem'
, @level2type = 'COLUMN', @level2name = N'LayoutRule'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'DeviceGridBoxTemplateItem', 
'COLUMN', N'Rowspan')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'布局行跨距'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'DeviceGridBoxTemplateItem'
, @level2type = 'COLUMN', @level2name = N'Rowspan'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'布局行跨距'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'DeviceGridBoxTemplateItem'
, @level2type = 'COLUMN', @level2name = N'Rowspan'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'DeviceGridBoxTemplateItem', 
'COLUMN', N'Colspan')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'布局列跨距'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'DeviceGridBoxTemplateItem'
, @level2type = 'COLUMN', @level2name = N'Colspan'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'布局列跨距'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'DeviceGridBoxTemplateItem'
, @level2type = 'COLUMN', @level2name = N'Colspan'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'DeviceGridBoxTemplateItem', 
'COLUMN', N'CellCount')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'单元格点位数量'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'DeviceGridBoxTemplateItem'
, @level2type = 'COLUMN', @level2name = N'CellCount'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'单元格点位数量'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'DeviceGridBoxTemplateItem'
, @level2type = 'COLUMN', @level2name = N'CellCount'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'DeviceGridBoxTemplateItem', 
'COLUMN', N'CellAddress')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'单元格点位地址'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'DeviceGridBoxTemplateItem'
, @level2type = 'COLUMN', @level2name = N'CellAddress'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'单元格点位地址'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'DeviceGridBoxTemplateItem'
, @level2type = 'COLUMN', @level2name = N'CellAddress'
GO

-- ----------------------------
-- Records of DeviceGridBoxTemplateItem
-- ----------------------------
SET IDENTITY_INSERT [dbo].[DeviceGridBoxTemplateItem] ON
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'1', N'DGB001', N'1', N'1', N'1', N'1', N'1', N'1', N'1.00', N'1.20', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'2', N'DGB001', N'1', N'1', N'2', N'1', N'2', N'1', N'1.00', N'1.20', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'3', N'DGB001', N'1', N'1', N'3', N'1', N'3', N'1', N'1.00', N'1.20', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'4', N'DGB001', N'1', N'1', N'4', N'1', N'4', N'1', N'1.00', N'1.20', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'5', N'DGB001', N'1', N'1', N'5', N'1', N'5', N'1', N'1.00', N'1.20', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'6', N'DGB001', N'1', N'1', N'6', N'2', N'1', N'1', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'7', N'DGB001', N'1', N'1', N'7', N'2', N'2', N'1', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'8', N'DGB001', N'1', N'1', N'8', N'2', N'3', N'1', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'9', N'DGB001', N'1', N'1', N'9', N'2', N'4', N'1', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'10', N'DGB001', N'1', N'1', N'10', N'2', N'5', N'1', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'11', N'DGB001', N'1', N'1', N'11', N'2', N'6', N'1', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'12', N'DGB001', N'1', N'1', N'12', N'3', N'1', N'1', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'13', N'DGB001', N'1', N'1', N'13', N'3', N'2', N'1', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'14', N'DGB001', N'1', N'1', N'14', N'3', N'3', N'1', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'15', N'DGB001', N'1', N'1', N'15', N'3', N'4', N'1', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'16', N'DGB001', N'1', N'1', N'16', N'3', N'5', N'1', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'17', N'DGB001', N'1', N'1', N'17', N'3', N'6', N'1', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'18', N'DGB001', N'1', N'1', N'18', N'4', N'1', N'1', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'19', N'DGB001', N'1', N'1', N'19', N'4', N'2', N'1', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'20', N'DGB001', N'1', N'1', N'20', N'4', N'3', N'1', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'21', N'DGB001', N'1', N'1', N'21', N'4', N'4', N'1', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'22', N'DGB001', N'1', N'1', N'22', N'4', N'5', N'1', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'23', N'DGB001', N'1', N'1', N'23', N'4', N'6', N'1', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'24', N'DGB001', N'1', N'1', N'24', N'5', N'1', N'1', N'1.00', N'1.20', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'25', N'DGB001', N'1', N'1', N'25', N'5', N'2', N'1', N'1.00', N'1.20', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'26', N'DGB001', N'1', N'1', N'26', N'5', N'3', N'1', N'1.00', N'1.20', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'27', N'DGB001', N'1', N'1', N'27', N'5', N'4', N'1', N'1.00', N'1.20', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'28', N'DGB001', N'1', N'1', N'28', N'5', N'5', N'1', N'1.00', N'1.20', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'29', N'DGB001', N'2', N'1', N'1', N'1', N'1', N'2', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'30', N'DGB001', N'2', N'1', N'2', N'1', N'2', N'2', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'31', N'DGB001', N'2', N'1', N'3', N'1', N'3', N'2', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'32', N'DGB001', N'2', N'1', N'16', N'1', N'4', N'2', N'1.50', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'33', N'DGB001', N'2', N'1', N'17', N'1', N'5', N'2', N'1.50', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'34', N'DGB001', N'2', N'1', N'4', N'2', N'1', N'2', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'35', N'DGB001', N'2', N'1', N'5', N'2', N'2', N'2', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'36', N'DGB001', N'2', N'1', N'6', N'2', N'3', N'2', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'37', N'DGB001', N'2', N'1', N'18', N'2', N'4', N'2', N'1.50', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'38', N'DGB001', N'2', N'1', N'19', N'2', N'5', N'2', N'1.50', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'39', N'DGB001', N'2', N'1', N'7', N'3', N'1', N'2', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'40', N'DGB001', N'2', N'1', N'8', N'3', N'2', N'2', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'41', N'DGB001', N'2', N'1', N'9', N'3', N'3', N'2', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'42', N'DGB001', N'2', N'1', N'20', N'3', N'4', N'2', N'1.50', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'43', N'DGB001', N'2', N'1', N'21', N'3', N'5', N'2', N'1.50', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'44', N'DGB001', N'2', N'1', N'10', N'4', N'1', N'2', N'.80', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'45', N'DGB001', N'2', N'1', N'11', N'4', N'2', N'2', N'.80', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'46', N'DGB001', N'2', N'1', N'12', N'4', N'3', N'2', N'.80', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'47', N'DGB001', N'2', N'1', N'13', N'5', N'1', N'2', N'.80', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'48', N'DGB001', N'2', N'1', N'14', N'5', N'2', N'2', N'.80', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'49', N'DGB001', N'2', N'1', N'15', N'5', N'3', N'2', N'.80', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'50', N'DGB002', N'1', N'1', N'1', N'1', N'1', N'1', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'51', N'DGB002', N'1', N'1', N'2', N'1', N'2', N'1', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'52', N'DGB002', N'1', N'1', N'3', N'1', N'3', N'1', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'53', N'DGB002', N'1', N'1', N'4', N'1', N'4', N'1', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'54', N'DGB002', N'1', N'1', N'5', N'1', N'5', N'1', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'55', N'DGB002', N'1', N'1', N'6', N'2', N'1', N'1', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'56', N'DGB002', N'1', N'1', N'7', N'2', N'2', N'1', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'57', N'DGB002', N'1', N'1', N'8', N'2', N'3', N'1', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'58', N'DGB002', N'1', N'1', N'9', N'2', N'4', N'1', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'59', N'DGB002', N'1', N'1', N'10', N'2', N'5', N'1', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'60', N'DGB002', N'1', N'1', N'11', N'3', N'1', N'1', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'61', N'DGB002', N'1', N'1', N'12', N'3', N'2', N'1', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'62', N'DGB002', N'1', N'1', N'13', N'3', N'3', N'1', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'63', N'DGB002', N'1', N'1', N'14', N'3', N'4', N'1', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'64', N'DGB002', N'1', N'1', N'15', N'3', N'5', N'1', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'65', N'DGB002', N'1', N'1', N'16', N'4', N'1', N'1', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'66', N'DGB002', N'1', N'1', N'17', N'4', N'2', N'1', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'67', N'DGB002', N'1', N'1', N'18', N'4', N'3', N'1', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'68', N'DGB002', N'1', N'1', N'19', N'4', N'4', N'1', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'69', N'DGB002', N'1', N'1', N'20', N'4', N'5', N'1', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'70', N'DGB002', N'2', N'1', N'1', N'1', N'1', N'1', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'71', N'DGB002', N'2', N'1', N'2', N'1', N'2', N'1', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'72', N'DGB002', N'2', N'1', N'3', N'1', N'3', N'1', N'1.00', N'1.50', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'73', N'DGB002', N'2', N'1', N'4', N'1', N'4', N'1', N'1.00', N'1.50', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'74', N'DGB002', N'2', N'1', N'5', N'2', N'1', N'1', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'75', N'DGB002', N'2', N'1', N'6', N'2', N'2', N'1', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'76', N'DGB002', N'2', N'1', N'7', N'2', N'3', N'1', N'1.00', N'1.50', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'77', N'DGB002', N'2', N'1', N'8', N'2', N'4', N'1', N'1.00', N'1.50', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'78', N'DGB002', N'2', N'1', N'9', N'3', N'1', N'1', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'79', N'DGB002', N'2', N'1', N'10', N'3', N'2', N'1', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'80', N'DGB002', N'2', N'1', N'11', N'3', N'3', N'1', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'81', N'DGB002', N'2', N'1', N'12', N'3', N'4', N'1', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'82', N'DGB002', N'2', N'1', N'13', N'3', N'5', N'1', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'83', N'DGB002', N'2', N'1', N'14', N'4', N'1', N'1', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'84', N'DGB002', N'2', N'1', N'15', N'4', N'2', N'1', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'85', N'DGB002', N'2', N'1', N'16', N'4', N'3', N'1', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'86', N'DGB002', N'2', N'1', N'17', N'4', N'4', N'1', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'87', N'DGB002', N'2', N'1', N'18', N'4', N'5', N'1', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'88', N'DGB002', N'3', N'1', N'1', N'1', N'1', N'2', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'89', N'DGB002', N'3', N'1', N'2', N'2', N'1', N'2', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'90', N'DGB002', N'3', N'1', N'3', N'3', N'1', N'2', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'91', N'DGB002', N'3', N'1', N'4', N'4', N'1', N'2', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'92', N'DGB002', N'3', N'1', N'5', N'1', N'2', N'2', N'1.00', N'2.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'93', N'DGB002', N'3', N'1', N'6', N'2', N'2', N'2', N'1.00', N'2.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'94', N'DGB002', N'3', N'1', N'7', N'3', N'2', N'2', N'1.00', N'2.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'95', N'DGB002', N'3', N'1', N'8', N'4', N'2', N'2', N'1.00', N'2.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'96', N'DGB002', N'3', N'1', N'9', N'1', N'3', N'2', N'1.00', N'2.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'97', N'DGB002', N'3', N'1', N'10', N'2', N'3', N'2', N'1.00', N'2.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'98', N'DGB002', N'3', N'1', N'11', N'3', N'3', N'2', N'2.00', N'2.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'99', N'DGB003', N'1', N'1', N'1', N'1', N'1', N'6', N'1.00', N'1.20', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'100', N'DGB003', N'1', N'1', N'2', N'1', N'2', N'6', N'1.00', N'1.20', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'101', N'DGB003', N'1', N'1', N'3', N'1', N'3', N'6', N'1.00', N'1.20', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'102', N'DGB003', N'1', N'1', N'4', N'1', N'4', N'6', N'1.00', N'1.20', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'103', N'DGB003', N'1', N'1', N'5', N'1', N'5', N'6', N'1.00', N'1.20', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'104', N'DGB003', N'2', N'1', N'1', N'2', N'1', N'6', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'105', N'DGB003', N'2', N'1', N'2', N'2', N'2', N'6', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'106', N'DGB003', N'2', N'1', N'3', N'2', N'3', N'6', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'107', N'DGB003', N'2', N'1', N'4', N'2', N'4', N'6', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'108', N'DGB003', N'2', N'1', N'5', N'2', N'5', N'6', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'109', N'DGB003', N'2', N'1', N'6', N'2', N'6', N'6', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'110', N'DGB003', N'3', N'1', N'1', N'3', N'1', N'6', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'111', N'DGB003', N'3', N'1', N'2', N'3', N'2', N'6', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'112', N'DGB003', N'3', N'1', N'3', N'3', N'3', N'6', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'113', N'DGB003', N'3', N'1', N'4', N'3', N'4', N'6', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'114', N'DGB003', N'3', N'1', N'5', N'3', N'5', N'6', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'115', N'DGB003', N'3', N'1', N'6', N'3', N'6', N'6', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'116', N'DGB003', N'4', N'1', N'1', N'4', N'1', N'6', N'1.00', N'1.20', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'117', N'DGB003', N'4', N'1', N'2', N'4', N'2', N'6', N'1.00', N'1.20', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'118', N'DGB003', N'4', N'1', N'3', N'4', N'3', N'6', N'1.00', N'1.20', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'119', N'DGB003', N'4', N'1', N'4', N'4', N'4', N'6', N'1.00', N'1.20', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'120', N'DGB003', N'4', N'1', N'5', N'4', N'5', N'6', N'1.00', N'1.20', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'121', N'DGB003', N'5', N'1', N'1', N'5', N'1', N'6', N'1.00', N'1.20', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'122', N'DGB003', N'5', N'1', N'2', N'5', N'2', N'6', N'1.00', N'1.20', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'123', N'DGB003', N'5', N'1', N'3', N'5', N'3', N'6', N'1.00', N'1.20', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'124', N'DGB003', N'5', N'1', N'4', N'5', N'4', N'6', N'1.00', N'1.20', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'125', N'DGB003', N'5', N'1', N'5', N'5', N'5', N'6', N'1.00', N'1.20', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'126', N'DGB004', N'1', N'1', N'1', N'1', N'1', N'6', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'127', N'DGB004', N'1', N'1', N'2', N'1', N'2', N'6', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'128', N'DGB004', N'1', N'1', N'3', N'1', N'3', N'6', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'129', N'DGB004', N'1', N'1', N'4', N'1', N'4', N'6', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'130', N'DGB004', N'1', N'1', N'5', N'1', N'5', N'6', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'131', N'DGB004', N'1', N'1', N'6', N'1', N'6', N'6', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'132', N'DGB004', N'2', N'1', N'1', N'2', N'1', N'6', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'133', N'DGB004', N'2', N'1', N'2', N'2', N'2', N'6', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'134', N'DGB004', N'2', N'1', N'3', N'2', N'3', N'6', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'135', N'DGB004', N'2', N'1', N'4', N'2', N'4', N'6', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'136', N'DGB004', N'2', N'1', N'5', N'2', N'5', N'6', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'137', N'DGB004', N'2', N'1', N'6', N'2', N'6', N'6', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'138', N'DGB004', N'3', N'1', N'1', N'3', N'1', N'6', N'1.00', N'1.20', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'139', N'DGB004', N'3', N'1', N'2', N'3', N'2', N'6', N'1.00', N'1.20', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'140', N'DGB004', N'3', N'1', N'3', N'3', N'3', N'6', N'1.00', N'1.20', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'141', N'DGB004', N'3', N'1', N'4', N'3', N'4', N'6', N'1.00', N'1.20', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'142', N'DGB004', N'3', N'1', N'5', N'3', N'5', N'6', N'1.00', N'1.20', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'143', N'DGB004', N'4', N'1', N'1', N'4', N'1', N'6', N'1.00', N'1.20', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'144', N'DGB004', N'4', N'1', N'2', N'4', N'2', N'6', N'1.00', N'1.20', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'145', N'DGB004', N'4', N'1', N'3', N'4', N'3', N'6', N'1.00', N'1.20', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'146', N'DGB004', N'4', N'1', N'4', N'4', N'4', N'6', N'1.00', N'1.20', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'147', N'DGB004', N'4', N'1', N'5', N'4', N'5', N'6', N'1.00', N'1.20', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'148', N'DGB004', N'5', N'1', N'1', N'5', N'1', N'6', N'1.00', N'1.20', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'149', N'DGB004', N'5', N'1', N'2', N'5', N'2', N'6', N'1.00', N'1.20', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'150', N'DGB004', N'5', N'1', N'3', N'5', N'3', N'6', N'1.00', N'1.20', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'151', N'DGB004', N'5', N'1', N'4', N'5', N'4', N'6', N'1.00', N'1.20', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'152', N'DGB004', N'5', N'1', N'5', N'5', N'5', N'6', N'1.00', N'1.20', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'153', N'DGB011', N'1', N'1', N'1', N'1', N'1', N'1', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'154', N'DGB011', N'1', N'1', N'2', N'1', N'2', N'1', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'155', N'DGB011', N'1', N'1', N'3', N'1', N'3', N'1', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'156', N'DGB011', N'1', N'1', N'4', N'1', N'4', N'1', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'157', N'DGB011', N'1', N'1', N'5', N'1', N'5', N'1', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'158', N'DGB011', N'1', N'1', N'6', N'2', N'1', N'1', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'159', N'DGB011', N'1', N'1', N'7', N'2', N'2', N'1', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'160', N'DGB011', N'1', N'1', N'8', N'2', N'3', N'1', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'161', N'DGB011', N'1', N'1', N'9', N'2', N'4', N'1', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'162', N'DGB011', N'1', N'1', N'10', N'2', N'5', N'1', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'163', N'DGB011', N'1', N'1', N'11', N'3', N'1', N'1', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'164', N'DGB011', N'1', N'1', N'12', N'3', N'2', N'1', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'165', N'DGB011', N'1', N'1', N'13', N'3', N'3', N'1', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'166', N'DGB011', N'1', N'1', N'14', N'3', N'4', N'1', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'167', N'DGB011', N'1', N'1', N'15', N'3', N'5', N'1', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'168', N'DGB011', N'1', N'1', N'16', N'4', N'1', N'1', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'169', N'DGB011', N'1', N'1', N'17', N'4', N'2', N'1', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'170', N'DGB011', N'1', N'1', N'18', N'4', N'3', N'1', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'171', N'DGB011', N'1', N'1', N'19', N'4', N'4', N'1', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'172', N'DGB011', N'1', N'1', N'20', N'4', N'5', N'1', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'173', N'DGB011', N'2', N'1', N'1', N'1', N'1', N'1', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'174', N'DGB011', N'2', N'1', N'2', N'1', N'2', N'1', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'175', N'DGB011', N'2', N'1', N'3', N'1', N'3', N'1', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'176', N'DGB011', N'2', N'1', N'4', N'1', N'4', N'1', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'177', N'DGB011', N'2', N'1', N'5', N'2', N'1', N'1', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'178', N'DGB011', N'2', N'1', N'6', N'2', N'2', N'1', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'179', N'DGB011', N'2', N'1', N'7', N'2', N'3', N'1', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'180', N'DGB011', N'2', N'1', N'8', N'2', N'4', N'1', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'181', N'DGB011', N'2', N'1', N'9', N'3', N'1', N'1', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'182', N'DGB011', N'2', N'1', N'10', N'3', N'2', N'1', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'183', N'DGB011', N'2', N'1', N'11', N'3', N'3', N'1', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'184', N'DGB011', N'2', N'1', N'12', N'3', N'4', N'1', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'185', N'DGB011', N'2', N'1', N'13', N'4', N'1', N'1', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'186', N'DGB011', N'2', N'1', N'14', N'4', N'2', N'1', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'187', N'DGB011', N'2', N'1', N'15', N'4', N'3', N'1', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'188', N'DGB011', N'2', N'1', N'16', N'4', N'4', N'1', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'189', N'DGB011', N'3', N'1', N'1', N'1', N'1', N'4', N'1.00', N'2.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'190', N'DGB011', N'3', N'1', N'4', N'2', N'1', N'4', N'1.00', N'2.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'191', N'DGB011', N'3', N'1', N'7', N'3', N'1', N'4', N'1.00', N'2.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'192', N'DGB011', N'3', N'1', N'9', N'4', N'1', N'4', N'1.00', N'2.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'193', N'DGB011', N'3', N'1', N'2', N'1', N'2', N'4', N'1.00', N'2.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'194', N'DGB011', N'3', N'1', N'5', N'2', N'2', N'4', N'1.00', N'2.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'195', N'DGB011', N'3', N'1', N'8', N'3', N'2', N'4', N'1.00', N'5.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'196', N'DGB011', N'3', N'1', N'10', N'4', N'2', N'4', N'1.00', N'5.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'197', N'DGB011', N'3', N'1', N'3', N'1', N'3', N'4', N'1.00', N'3.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'198', N'DGB011', N'3', N'1', N'6', N'2', N'3', N'4', N'1.00', N'3.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'199', N'DGB011', N'3', N'1', N'11', N'1', N'4', N'4', N'2.00', N'3.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'200', N'DGB011', N'3', N'1', N'12', N'2', N'4', N'4', N'2.00', N'3.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'201', N'DGB015', N'1', N'1', N'1', N'1', N'1', N'6', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'202', N'DGB015', N'1', N'1', N'2', N'1', N'2', N'6', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'203', N'DGB015', N'1', N'1', N'3', N'1', N'3', N'6', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'204', N'DGB015', N'1', N'1', N'4', N'1', N'4', N'6', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'205', N'DGB015', N'1', N'1', N'5', N'1', N'5', N'6', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'206', N'DGB015', N'1', N'1', N'6', N'1', N'6', N'6', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'207', N'DGB015', N'2', N'1', N'1', N'2', N'1', N'6', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'208', N'DGB015', N'2', N'1', N'2', N'2', N'2', N'6', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'209', N'DGB015', N'2', N'1', N'3', N'2', N'3', N'6', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'210', N'DGB015', N'2', N'1', N'4', N'2', N'4', N'6', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'211', N'DGB015', N'2', N'1', N'5', N'2', N'5', N'6', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'212', N'DGB015', N'2', N'1', N'6', N'2', N'6', N'6', N'1.00', N'1.00', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'213', N'DGB015', N'3', N'1', N'1', N'3', N'1', N'6', N'1.00', N'1.20', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'214', N'DGB015', N'3', N'1', N'2', N'3', N'2', N'6', N'1.00', N'1.20', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'215', N'DGB015', N'3', N'1', N'3', N'3', N'3', N'6', N'1.00', N'1.20', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'216', N'DGB015', N'3', N'1', N'4', N'3', N'4', N'6', N'1.00', N'1.20', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'217', N'DGB015', N'3', N'1', N'5', N'3', N'5', N'6', N'1.00', N'1.20', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'218', N'DGB015', N'4', N'1', N'1', N'4', N'1', N'6', N'1.00', N'1.20', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'219', N'DGB015', N'4', N'1', N'2', N'4', N'2', N'6', N'1.00', N'1.20', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'220', N'DGB015', N'4', N'1', N'3', N'4', N'3', N'6', N'1.00', N'1.20', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'221', N'DGB015', N'4', N'1', N'4', N'4', N'4', N'6', N'1.00', N'1.20', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'222', N'DGB015', N'4', N'1', N'5', N'4', N'5', N'6', N'1.00', N'1.20', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'223', N'DGB015', N'5', N'1', N'1', N'5', N'1', N'6', N'1.00', N'1.20', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'224', N'DGB015', N'5', N'1', N'2', N'5', N'2', N'6', N'1.00', N'1.20', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'225', N'DGB015', N'5', N'1', N'3', N'5', N'3', N'6', N'1.00', N'1.20', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'226', N'DGB015', N'5', N'1', N'4', N'5', N'4', N'6', N'1.00', N'1.20', null, null)
GO
GO
INSERT INTO [dbo].[DeviceGridBoxTemplateItem] ([Id], [TemplateCode], [FloorIndex], [LineIndex], [BoxIndex], [RowNO], [ColumnNO], [LayoutRule], [Rowspan], [Colspan], [CellCount], [CellAddress]) VALUES (N'227', N'DGB015', N'5', N'1', N'5', N'5', N'5', N'6', N'1.00', N'1.20', null, null)
GO
GO
SET IDENTITY_INSERT [dbo].[DeviceGridBoxTemplateItem] OFF
GO

-- ----------------------------
-- Indexes structure for table DeviceGridBoxTemplateItem
-- ----------------------------
CREATE INDEX [IX_DeviceGridBoxTemplateItem_1] ON [dbo].[DeviceGridBoxTemplateItem]
([Id] ASC) 
GO
CREATE INDEX [IX_DeviceGridBoxTemplateItem_2] ON [dbo].[DeviceGridBoxTemplateItem]
([TemplateCode] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table DeviceGridBoxTemplateItem
-- ----------------------------
ALTER TABLE [dbo].[DeviceGridBoxTemplateItem] ADD PRIMARY KEY ([Id])
GO
