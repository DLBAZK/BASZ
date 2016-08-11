IF EXISTS(SELECT 1 FROM sys.objects WHERE name='VsCHDBFTable' AND type='U')
  DROP TABLE VsCHDBFTable

CREATE TABLE VsCHDBFTable 
(
	BID VARCHAR(36) DEFAULT NEWID() PRIMARY KEY ,
	xh INT IDENTITY ,          ----------序号 
	TableName VARCHAR(50),      ---------表名称
	TableCus   VARCHAR(50),     --------表名称别名
	TableDesc VARCHAR(50),       ---------表说明描述
	TableSQL VARCHAR(1000),     -----------表SQL
	TableRel  varchar(300),      -----------表关联
	LinkTableCus VARCHAR(10)     -----------关联表别名
)
----------------表关联记录
IF EXISTS(SELECT 1 FROM sys.objects WHERE name='VsCHDBFTableRel' AND type='U')
  DROP TABLE VsCHDBFTableRel

CREATE TABLE VsCHDBFTableRel 
(
	RID VARCHAR(36) DEFAULT NEWID() PRIMARY KEY ,
	LBID VARCHAR(36),      ---------左表名称
	RBID   VARCHAR(36),     --------右表名称
	LField VARCHAR(50),       ---------左字段
	LKind  VARCHAR(4),      -------------左字段类型
	RKind  VARCHAR(4),    ---------------右字段类型
	BRelKind VARCHAR(1) DEFAULT 1,     ------------表连接方式
	RField VARCHAR(50)     -----------右字段
)

----------------上报DBF主题
IF EXISTS(SELECT 1 FROM sys.objects WHERE name='VsCHDBFTheme' AND type='U')
  DROP TABLE VsCHDBFTheme

CREATE TABLE VsCHDBFTheme 
(
	TID VARCHAR(36) DEFAULT NEWID() PRIMARY KEY ,
	ThemeMC VARCHAR(200),   ---------DBF上报主题名称
	StartDate DATETIME,     ---------上报开始时间
	EndDate DATETIME ,     -----------上报结束时间
	ThemePath VARCHAR(200)	----------DBF保存路径
)


IF EXISTS(SELECT 1 FROM sys.objects WHERE name='VsCHDBFStructure' AND type='U')
  DROP TABLE VsCHDBFStructure

CREATE TABLE VsCHDBFStructure 
(
	TID VARCHAR(36),			----------DBF方案ID
	FID VARCHAR(36),			----------DBF字段ID
	xh INT IDENTITY ,          ----------序号 
	DBFName VARCHAR(50),      ---------导出DBF字段
	DBFMC   VARCHAR(100),     ---------DBF字段描述
	FieldName VARCHAR(50),    ---------来源字段
	FieldSQL    VARCHAR(300),   -----------自定义字段转换
	FieldTable VARCHAR(50),   ---------来源表
	FieldTableCus VARCHAR(10), ----------来源表别名
    DBFBZ BIT DEFAULT 1         ---------是否启用  
)
SELECT * FROM VsCHDBFStructure


TRUNCATE TABLE [VsCHDBFStructure]

SET IDENTITY_INSERT [dbo].[VsCHDBFStructure] ON
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (1, N'USERNAME', N'机构名称', N'', N'(SELECT VsSiName FROM dbo.VsSysInfo)', NULL, NULL, 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (2, N'YLFKFS', N'医疗付款方式', N'', N'(Case When CH0A82=9 Then ''99'' Else ''0'' +Convert(varchar(10),CH0A82)End)', N'VsCH0A', N'A', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (3, N'JKKH', N'健康卡号', N'A.CH0A81', N'CH0A81', N'VsCH0A', N'A', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (4, N'ZYCS', N'住院次数', N'', N'Right(CH0A01,2)', N'VsCH0A', N'A', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (5, N'BAH', N'病案号', N'', N'Left(CH0A01,Len(CH0A01)-2)', N'VsCH0A', N'A', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (6, N'XM', N'姓名', N'A.CH0A02', N'CH0A02', N'VsCH0A', N'A', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (7, N'XB', N'性别', N'A.CH0A03', N'CH0A03', N'VsCH0A', N'A', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (8, N'CSRQ', N'出生日期', N'', N'Convert(VarChar(8),replace(Convert(varchar(10),CH0A04,120),''-'',''''))', N'VsCH0A', N'A', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (9, N'NL', N'年龄', N'', N'(Case When IsNull(CH0AA1,'''')<>''Y'' Then 1 Else CH0A06 End)', N'VsCH0A', N'A', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (10, N'GJ', N'国籍', N'', N'N.StdDm', N'VsNationality', N'N', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (11, N'BZYZS_NL', N'（年龄不足1周岁的）年龄(月)', N'', N'IsNull(CH0AN1,0)', N'VsCH0A', N'A', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (12, N'XSETZ', N'新生儿出生体重(克)', N'A.CH0AN2', N'CH0AN2', N'VsCH0A', N'A', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (13, N'XSERYTZ', N'新生儿入院体重（克）', N'A.CH0AN3', N'CH0AN3', N'VsCH0A', N'A', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (14, N'CSD', N'出生地', N'', N'X1.DmMc', N'VsXzqh_12', N'X1', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (15, N'GG', N'籍贯', N'', N'X2.DmMc', N'VsXzqh_12', N'X2', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (16, N'MZ', N'民族', N'A.CH0A10', N'CH0A10', N'VsCH0A', N'A', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (17, N'SFZH', N'身份证号', N'', N'Upper(CH0A05)', N'VsCH0A', N'A', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (18, N'ZY', N'职业', N'A.CH0A08', N'CH0A08', N'VsCH0A', N'A', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (19, N'HY', N'婚姻', N'', N'(Case When IsNull(CH0A07,'''')='''' Then ''90'' Else Convert(varchar(1),CH0A07)+''0'' End)', N'VsCH0A', N'A', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (20, N'XZZ', N'现住址', N'', N'X3.DmMc+CH0AN6', N'VsXzqh_12', N'X3', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (21, N'DH', N'电话', N'A.CH0AN7', N'CH0AN7', N'VsCH0A', N'A', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (22, N'YB1', N'邮编', N'A.CH0AN8', N'CH0AN8', N'VsCH0A', N'A', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (23, N'HKDZ', N'户口地址', N'', N'X4.DmMc+CH0A13', N'VsXzqh_12', N'X4', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (24, N'YB2', N'邮编', N'A.CH0A14', N'CH0A14', N'VsCH0A', N'A', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (25, N'GZDWJDZ', N'工作单位及地址', N'A.CH0AA3', N'CH0AA3', N'VsCH0A', N'A', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (26, N'DWDH', N'单位电话', N'A.CH0AA5', N'CH0AA5', N'VsCH0A', N'A', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (27, N'YB3', N'邮编', N'A.CH0AA4', N'CH0AA4', N'VsCH0A', N'A', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (28, N'LXRXM', N'联系人姓名', N'A.CH0A15', N'CH0A15', N'VsCH0A', N'A', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (29, N'GX', N'关系', N'', N'(Case When CH0A16=9 Then 8 Else CH0A16 End)', N'VsCH0A', N'A', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (30, N'DZ', N'地址', N'', N'X5.DmMc+CH0A18', N'VsXzqh_12', N'X5', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (31, N'DH1', N'电话', N'A.CH0A19', N'CH0A19', N'VsCH0A', N'A', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (32, N'RYTJ', N'入院途径', N'A.CH0A56', N'CH0A56', N'VsCH0A', N'A', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (33, N'ZLLB', N'治疗类别', N'A.CH0A55', N'CH0A55', N'VsCH0A', N'A', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (34, N'RYSJ', N'入院时间', N'', N'Convert(VarChar(8),replace(Convert(varchar(10),CH0A24,120),''-'',''''))', N'VsCH0A', N'A', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (35, N'RYSJ_S', N'时', N'', N'Left(CH0A24_SJ,2)', N'VsCH0A', N'A', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (36, N'RYKB', N'入院科别', N'', N'Ks1.SoKm', N'VsSOffice', N'Ks1', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (37, N'RYBF', N'入院病房', N'A.CH0ANA', N'CH0ANA', N'VsCH0A', N'A', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (38, N'ZKKB', N'转科科别', N'', N'Ks2.SoKm', N'VsSOffice', N'Ks2', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (39, N'CYSJ', N'出院时间', N'', N'Convert(VarChar(8),replace(Convert(varchar(10),CH0A27,120),''-'',''''))', N'VsCH0A', N'A', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (40, N'CYSJ_S', N'时', N'', N'Left(CH0A27_SJ,2)', N'VsCH0A', N'A', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (41, N'CYKB', N'出院科别', N'', N'Ks3.SoKm', N'VsSOffice', N'Ks3', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (42, N'CYBF', N'出院病房', N'A.CH0ANB', N'CH0ANB', N'VsCH0A', N'A', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (43, N'SJZY', N'实际住院(天)', N'A.CH0A29', N'CH0A29', N'VsCH0A', N'A', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (44, N'MZD_ZYZD', N'门(急)诊诊断(中医诊断)', N'', N'TCD1.BzMC', N'VsUseZybz', N'TCD1', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (45, N'JBDM', N'疾病代码', N'', N'CH0K02', N'VsCH0K', N'K', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (46, N'MZZD_XYZD', N'门(急)诊诊断(西医诊断)', N'', N'ZD1.BmMc', N'VsUseICD', N'ZD1', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (47, N'JBBM', N'疾病编码', N'', N'ZD1.BmICD', N'VsUseICD', N'ZD1', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (48, N'SSLCLJ', N'实施临床路径', N'A.CH0ANQ', N'CH0ANQ', N'VsCH0A', N'A', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (49, N'ZYYJ', N'使用医疗机构中药制剂', N'A.CH0A70', N'CH0A70', N'VsCH0A', N'A', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (50, N'ZYZLSB', N'使用中医诊疗设备', N'A.CH0ANR', N'CH0ANR', N'VsCH0A', N'A', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (51, N'ZYZLJS', N'使用中医诊疗技术', N'A.CH0ANS', N'CH0ANS', N'VsCH0A', N'A', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (52, N'BZSH', N'辩证施护', N'A.CH0ANT', N'CH0ANT', N'VsCH0A', N'A', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (53, N'ZB', N'主病出院中医诊断', N'', N'TCD2.BzMC', N'VsUseZybz', N'TCD2', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (54, N'ZB_JBBM', N'主病疾病编码', N'', N'CH0K06', N'VsCH0K', N'K', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (55, N'ZB_RYBQ', N'主病入院病情', N'', N'K.CH0KN1', N'VsCH0K', N'K', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (56, N'ZYZD', N'主要诊断出院西医诊断', N'', N'ZD2.BmMc', N'VsUseICD', N'ZD2', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (57, N'ZYZD_JBBM', N'主要诊断疾病编码', N'', N'ZD2.BmICD', N'VsUseICD', N'ZD2', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (58, N'XY_RYBQ', N'主要诊断入院病情', N'A.CH0ANO', N'CH0ANO', N'VsCH0A', N'A', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (59, N'ZZ1', N'主证1出院中医诊断', N'', N'TCD3.BzMC', N'VsUseZybz', N'TCD3', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (60, N'ZZ_JBBM1', N'主证1疾病编码', N'', N'CH0K03', N'VsCH0K', N'K', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (61, N'ZZ_RYBQ1', N'主证1住入院病情', N'', N'K.CH0KN1', N'VsCH0K', N'K', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (62, N'QTZD1', N'其他诊断1出院西医诊断', N'', N'ZD3.BmMc', N'VsUseICD', N'ZD3', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (63, N'ZYZD_JBBM1', N'其他诊断1疾病编码', N'', N'ZD3.BmICD', N'VsUseICD', N'ZD3', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (64, N'RYBQ1', N'其他诊断1入院病情', N'', N'C1.CH0CN1', N'VsCH0C', N'C1', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (65, N'ZZ2', N'主证2出院中医诊断', N'', N'TCD3.BzMC', N'VsUseZybz', N'TCD3', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (66, N'ZZ_JBBM2', N'主证2疾病编码', N'', N'CH0K03', N'VsCH0K', N'K', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (67, N'ZZ_RYBQ2', N'主证2入院病情', N'', N'K.CH0KN2', N'VsCH0K', N'K', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (68, N'QTZD2', N'其他诊断2出院西医诊断', N'', N'ZD4.BmMc', N'VsUseICD', N'ZD4', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (69, N'ZYZD_JBBM2', N'其他诊断2疾病编码', N'', N'ZD4.BmICD', N'VsUseICD', N'ZD4', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (70, N'RYBQ2', N'其他诊断2入院病情', N'', N'C2.CH0CN1', N'VsCH0C', N'C2', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (71, N'ZZ3', N'主证3出院中医诊断', N'', N'TCD4.BzMC', N'VsUseZybz', N'TCD4', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (72, N'ZZ_JBBM3', N'主证3疾病编码', N'', N'CH0K04', N'VsCH0K', N'K', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (73, N'ZZ_RYBQ3', N'主证3入院病情', N'', N'K.CH0KN2', N'VsCH0K', N'K', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (74, N'QTZD3', N'其他诊断3出院西医诊断', N'', N'ZD5.BmMc', N'VsUseICD', N'ZD5', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (75, N'ZYZD_JBBM3', N'其他诊断3疾病编码', N'', N'ZD5.BmICD', N'VsUseICD', N'ZD5', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (76, N'RYBQ3', N'其他诊断3入院病情', N'', N'C3.CH0CN1', N'VsCH0C', N'C3', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (77, N'ZZ4', N'主证4中医诊断', N'', N'TCD5.BzMC', N'VsUseZybz', N'TCD5', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (78, N'ZZ_JBBM4', N'主证4疾病编码', N'', N'CH0K05', N'VsCH0K', N'K', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (79, N'ZZ_RYBQ4', N'主证4入院病情', N'', N'K.CH0KN3', N'VsCH0K', N'K', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (80, N'QTZD4', N'其他诊断4出院西医诊断', N'', N'ZD6.BmMc', N'VsUseICD', N'ZD6', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (81, N'ZYZD_JBBM4', N'其他诊断4疾病编码', N'', N'ZD6.BmICD', N'VsUseICD', N'ZD6', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (82, N'RYBQ4', N'其他诊断4入院病情', N'', N'C4.CH0CN1', N'VsCH0C', N'C4', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (83, N'ZZ5', N'主证5中医诊断', N'', N'TCD6.BzMC', N'VsUseZybz', N'TCD6', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (84, N'ZZ_JBBM5', N'主证5疾病编码', N'', N'CH0K07', N'VsCH0K', N'K', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (85, N'ZZ_RYBQ5', N'主证入院病情', N'', N'K.CH0KN3', N'VsCH0K', N'K', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (86, N'QTZD5', N'其他诊断5出院西医诊断', N'', N'ZD7.BmMc', N'VsUseICD', N'ZD7', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (87, N'ZYZD_JBBM5', N'其他诊断5疾病编码', N'', N'ZD7.BmICD', N'VsUseICD', N'ZD7', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (88, N'RYBQ5', N'其他诊断5入院病情', N'', N'C5.CH0CN1', N'VsCH0C', N'C5', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (89, N'ZZ6', N'主证6出院中医诊断', N'', N'TCD7.BzMC', N'VsUseZybz', N'TCD7', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (90, N'ZZ_JBBM6', N'主证6疾病编码', N'', N'CH0K14', N'VsCH0K', N'K', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (91, N'ZZ_RYBQ6', N'主证6入院病情', N'', N'K.CH0KN4', N'VsCH0K', N'K', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (92, N'QTZD6', N'其他诊断6西医诊断', N'', N'ZD8.BmMc', N'VsUseICD', N'ZD8', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (93, N'ZYZD_JBBM6', N'其他诊断6疾病编码', N'', N'ZD8.BmICD', N'VsUseICD', N'ZD8', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (94, N'RYBQ6', N'其他诊断6入院病情', N'', N'C6.CH0CN1', N'VsCH0C', N'C6', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (95, N'ZZ7', N'主证7出院中医诊断', N'', N'TCD8.BzMC', N'VsUseZybz', N'TCD8', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (96, N'ZZ_JBBM7', N'主证7疾病编码', N'', N'CH0K15', N'VsCH0K', N'K', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (97, N'ZZ_RYBQ7', N'主证7入院病情', N'', N'K.CH0KN4', N'VsCH0K', N'K', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (98, N'QTZD7', N'其他诊断7出院西医诊断', N'', N'ZD9.BmMc', N'VsUseICD', N'ZD9', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (99, N'ZYZD_JBBM7', N'其他诊断7疾病编码', N'', N'ZD9.BmICD', N'VsUseICD', N'ZD9', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (100, N'RYBQ7', N'其他诊断7入院病情', N'', N'C7.CH0CN1', N'VsCH0C', N'C7', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (101, N'WBYY', N'中毒的外部原因', N'', N'SS.WYMC', N'VsSSZD_12', N'SS', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (102, N'JBBM1', N'疾病编码', N'A.CH0A79', N'CH0A79', N'VsCH0A', N'A', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (103, N'BLZD', N'病理诊断', N'', N'Left(CH0D03,50)', NULL, NULL, 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (104, N'JBBM2', N'疾病编码', N'', N'CH0D07', NULL, NULL, 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (105, N'BLH', N'病理号', N'', N'CH0D02', NULL, NULL, 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (106, N'YWGM', N'药物过敏', N'A.CH0A52', N'CH0A52', N'VsCH0A', N'A', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (107, N'GMYW', N'过敏药物', N'', N'GM.DmMc', N'VSSensitivity', N'GM', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (108, N'SJ', N'死亡患者尸检', N'A.CH0ANC', N'CH0ANC', N'VsCH0A', N'A', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (109, N'XX', N'血型', N'A.CH0A45', N'CH0A45', N'VsCH0A', N'A', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (110, N'RH', N'Rh', N'A.CH0AC5', N'CH0AC5', N'VsCH0A', N'A', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (111, N'KZR', N'科主任', N'A.CH0AB1', N'CH0AB1', N'VsCH0A', N'A', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (112, N'ZRYS', N'主任（副主任）医师', N'A.CH0A32', N'CH0A32', N'VsCH0A', N'A', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (113, N'ZZYS', N'主治医师', N'A.CH0A33', N'CH0A33', N'VsCH0A', N'A', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (114, N'ZYYS', N'住院医师', N'A.CH0A34', N'CH0A34', N'VsCH0A', N'A', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (115, N'ZRHS', N'责任护士', N'A.CH0AND', N'CH0AND', N'VsCH0A', N'A', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (116, N'JXYS', N'进修医师', N'A.CH0AB2', N'CH0AB2', N'VsCH0A', N'A', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (117, N'SXYS', N'实习医师', N'A.CH0AB4', N'CH0AB4', N'VsCH0A', N'A', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (118, N'BMY', N'编码员', N'A.CH0A59', N'CH0A59', N'VsCH0A', N'A', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (119, N'BAZL', N'病案质量', N'A.CH0A51', N'CH0A51', N'VsCH0A', N'A', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (120, N'ZKYS', N'质控医师', N'A.CH0AB5', N'CH0AB5', N'VsCH0A', N'A', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (121, N'ZKHS', N'质控护士', N'A.CH0A69', N'CH0A69', N'VsCH0A', N'A', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (122, N'ZKRQ', N'质控日期', N'', N'Convert(VarChar(8),replace(Convert(varchar(10),CH0AB6,120),''-'',''''))', N'VsCH0A', N'A', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (123, N'SSJCZBM1', N'手术及操作编码', N'', N'CM1.SSICCM', N'VsUseICCM', N'CM1', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (124, N'SSJCZRQ1', N'手术及操作日期', N'', N'Convert(VarChar(8),replace(Convert(varchar(10),E1.CH0E11,120),''-'',''''))', N'VsCH0E', N'E1', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (125, N'SHJB1', N'手术级别', N'', N'E1.CH0E04', N'VsCH0E', N'E1', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (126, N'SSJCZMC1', N'手术及操作名称', N'', N'CM1.SSMC', N'VsUseICCM', N'CM1', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (127, N'SZ1', N'术者', N'', N'E1.CH0E09', N'VsCH0E', N'E1', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (128, N'YZ1', N'I助', N'', N'E1.CH0E14', N'VsCH0E', N'E1', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (129, N'EZ1', N'手术及操作医师', N'', N'E1.CH0E15', N'VsCH0E', N'E1', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (130, N'QKDJ1', N'手术信息切口等级', N'', N'(Case When IsNull(E1.CH0E01,'''')=''''Then Null Else(Case When E1.CH0E12=1 Then 2 When E1.CH0E12=2 Then 3 When E1.CH0E12=3 Then 4 Else 1 End)End)', N'VsCH0E', N'E1', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (131, N'QKYLB1', N'切口愈合类别', N'', N'(Case When IsNull(E1.CH0E01,'''')=''''Then Null Else(Case When(IsNull(E1.CH0E13,9)=9)or(IsNull(E1.CH0E13,0)=0)Then 9 Else E1.CH0E13 End)End)', N'VsCH0E', N'E1', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (132, N'MZFS1', N'麻醉方式', N'', N'NA1.WTMZM', N'VsNarcosis', N'NA1', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (133, N'MZYS1', N'麻醉医师', N'', N'E1.CH0E16', N'VsCH0E', N'E1', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (134, N'SSJCZBM2', N'手术及操作编码', N'', N'CM2.SSICCM', N'VsUseICCM', N'CM2', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (135, N'SSJCZRQ2', N'手术及操作日期', N'', N'Convert(VarChar(8),replace(Convert(varchar(10),E2.CH0E11,120),''-'',''''))', N'VsCH0E', N'E2', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (136, N'SHJB2', N'手术信息手术级别', N'', N'E2.CH0E04', N'VsCH0E', N'E2', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (137, N'SSJCZMC2', N'手术及操作名称', N'', N'CM2.SSMC', N'VsUseICCM', N'CM2', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (138, N'SZ2', N'术者', N'', N'E2.CH0E09', N'VsCH0E', N'E2', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (139, N'YZ2', N'I助', N'', N'E2.CH0E14', N'VsCH0E', N'E2', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (140, N'EZ2', N'II助', N'', N'E2.CH0E15', N'VsCH0E', N'E2', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (141, N'QKDJ2', N'切口等级', N'', N'(Case When IsNull(E2.CH0E01,'''')=''''Then Null Else(Case When E2.CH0E12=1 Then 2  When E2.CH0E12=2Then 3 When E2.CH0E12=3 Then 4 Else 1 End)End)', N'VsCH0E', N'E2', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (142, N'QKYLB2', N'切口愈合类别', N'', N'(Case When IsNull(E2.CH0E01,'''')=''''Then Null Else(Case When(IsNull(E2.CH0E13,9)=9)or(IsNull(E2.CH0E13,0)=0)Then 9 Else E2.CH0E13 End)End)', N'VsCH0E', N'E2', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (143, N'MZFS2', N'麻醉方式', N'', N'NA2.WTMZM', N'VsNarcosis', N'NA2', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (144, N'MZYS2', N'麻醉医师', N'', N'E2.CH0E16', N'VsCH0E', N'E2', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (145, N'SSJCZBM3', N'手术及操作编码', N'', N'CM3.SSICCM', N'VsUseICCM', N'CM3', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (146, N'SSJCZRQ3', N'手术及操作日期', N'', N'Convert(VarChar(8),replace(Convert(varchar(10),E3.CH0E11,120),''-'',''''))', N'VsCH0E', N'E3', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (147, N'SHJB3', N'手术级别', N'', N'E3.CH0E04', N'VsCH0E', N'E3', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (148, N'SSJCZMC3', N'手术及操作名称', N'', N'CM3.SSMC', N'VsUseICCM', N'CM3', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (149, N'SZ3', N'术者', N'', N'E3.CH0E09', N'VsCH0E', N'E3', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (150, N'YZ3', N'I助', N'', N'E3.CH0E14', N'VsCH0E', N'E3', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (151, N'EZ3', N'II助', N'', N'E3.CH0E15', N'VsCH0E', N'E3', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (152, N'QKDJ3', N'切口等级', N'', N'(Case When IsNull(E3.CH0E01,'''')=''''Then Null Else(Case When E3.CH0E12=1 Then 2 When E3.CH0E12=2 Then 3 When E3.CH0E12=3 Then 4 Else 1 End)End)', N'VsCH0E', N'E3', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (153, N'QKYLB3', N'切口愈合类别', N'', N'(Case When IsNull(E3.CH0E01,'''')='''' Then Null Else(Case When(IsNull(E3.CH0E13,9)=9)or(IsNull(E3.CH0E13,0)=0)Then 9 Else E3.CH0E13 End)End)', N'VsCH0E', N'E3', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (154, N'MZFS3', N'麻醉方式', N'', N'NA3.WTMZM', N'VsNarcosis', N'NA3', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (155, N'MZYS3', N'麻醉医师', N'', N'E3.CH0E16', N'VsCH0E', N'E3', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (156, N'SSJCZBM4', N'手术及操作编码', N'', N'CM4.SSICCM', N'VsUseICCM', N'CM4 ', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (157, N'SSJCZRQ4', N'手术及操作日期', N'', N'Convert(VarChar(8),replace(Convert(varchar(10),E4.CH0E11,120),''-'',''''))', N'VsCH0E', N'E4', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (158, N'SHJB4', N'手术信息手术级别', N'', N'E4.CH0E04', N'VsCH0E', N'E4', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (159, N'SSJCZMC4', N'手术及操作名称', N'', N'CM4.SSMC', N'VsUseICCM', N'CM4 ', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (160, N'SZ4', N'手术及操作医师术者', N'', N'E4.CH0E09', N'VsCH0E', N'E4', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (161, N'YZ4', N'I助', N'', N'E4.CH0E14', N'VsCH0E', N'E4', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (162, N'EZ4', N'II助', N'', N'E4.CH0E15', N'VsCH0E', N'E4', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (163, N'QKDJ4', N'手术信息切口等级', N'', N'(Case When IsNull(E4.CH0E01,'''')='''' Then Null Else(Case When E4.CH0E12=1 Then 2 When E4.CH0E12=2 Then 3 When E4.CH0E12=3 Then 4 Else 1 End)End)', N'VsCH0E', N'E4', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (164, N'QKYLB4', N'切口愈合类别', N'', N'(Case When IsNull(E4.CH0E01,'''')='''' Then Null Else(Case When(IsNull(E4.CH0E13,9)=9)or(IsNull(E4.CH0E13,0)=0)Then 9 Else E4.CH0E13 End)End)', N'VsCH0E', N'E4', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (165, N'MZFS4', N'麻醉方式', N'', N'NA4.WTMZM', N'VsNarcosis', N'NA4', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (166, N'MZYS4', N'麻醉医师', N'', N'E4.CH0E16', N'VsCH0E', N'E4', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (167, N'SSJCZBM5', N'手术及操作编码', N'', N'CM5.SSICCM', N'VsUseICCM', N'CM5 ', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (168, N'SSJCZRQ5', N'手术及操作日期', N'', N'Convert(VarChar(8),replace(Convert(varchar(10),E5.CH0E11,120),''-'',''''))', N'VsCH0E', N'E5', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (169, N'SHJB5', N'手术级别', N'', N'E5.CH0E04', N'VsCH0E', N'E5', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (170, N'SSJCZMC5', N'手术及操作名称', N'', N'CM5.SSMC', N'VsUseICCM', N'CM5 ', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (171, N'SZ5', N'术者', N'', N'E5.CH0E09', N'VsCH0E', N'E5', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (172, N'YZ5', N'I助', N'', N'E5.CH0E14', N'VsCH0E', N'E5', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (173, N'EZ5', N'II助', N'', N'E5.CH0E15', N'VsCH0E', N'E5', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (174, N'QKDJ5', N'切口等级', N'', N'(Case When IsNull(E5.CH0E01,'''')='''' Then Null Else(Case When E5.CH0E12=1 Then 2 When E5.CH0E12=2 Then 3 When E5.CH0E12=3 Then 4 Else 1 End)End)', N'VsCH0E', N'E5', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (175, N'QKYLB5', N'切口愈合类别', N'', N'(Case When IsNull(E5.CH0E01,'''')='''' Then Null Else(Case When(IsNull(E5.CH0E13,9)=9)or(IsNull(E5.CH0E13,0)=0)Then 9 Else E5.CH0E13 End)End)', N'VsCH0E', N'E5', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (176, N'MZFS5', N'麻醉方式', N'', N'NA5.WTMZM', N'VsNarcosis', N'NA5', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (177, N'MZYS5', N'麻醉医师', N'', N'E5.CH0E16', N'VsCH0E', N'E5', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (178, N'SSJCZBM6', N'手术及操作编码', N'', N'CM6.SSICCM', N'VsUseICCM', N'CM6', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (179, N'SSJCZRQ6', N'手术及操作日期', N'', N'Convert(VarChar(8),replace(Convert(varchar(10),E6.CH0E11,120),''-'',''''))', N'VsCH0E', N'E6', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (180, N'SHJB6', N'手术级别', N'', N'E6.CH0E04', N'VsCH0E', N'E6', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (181, N'SSJCZMC6', N'手术及操作名称', N'', N'CM6.SSMC', N'VsUseICCM', N'CM6', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (182, N'SZ6', N'术者', N'', N'E6.CH0E09', N'VsCH0E', N'E6', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (183, N'YZ6', N'I助', N'', N'E6.CH0E14', N'VsCH0E', N'E6', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (184, N'EZ6', N'II助', N'', N'E6.CH0E15', N'VsCH0E', N'E6', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (185, N'QKDJ6', N'切口等级', N'', N'(Case When   IsNull(E6.CH0E01,'''')='''' Then Null Else(Case When E6.CH0E12=1 Then 2 When E6.CH0E12=2 Then 3 When E6.CH0E12=3 Then 4 Else 1 End)End)', N'VsCH0E', N'E6', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (186, N'QKYLB6', N'切口愈合类别', N'', N'(Case  When IsNull(E6.CH0E01,'''')='''' Then Null Else(Case When(IsNull(E6.CH0E13,9)=9)or(IsNull(E6.CH0E13,0)=0)Then 9 Else E6.CH0E13 End)End)', N'VsCH0E', N'E6', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (187, N'MZFS6', N'麻醉方式', N'', N'NA6.WTMZM', N'VsNarcosis', N'NA6', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (188, N'MZYS6', N'麻醉医师', N'', N'E6.CH0E16', N'VsCH0E', N'E6', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (189, N'LYFS', N'离院方式', N'A.CH0ANE', N'CH0ANE', N'VsCH0A', N'A', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (190, N'YZZY_JGMC', N'医嘱转院，拟接收医疗机构名称', N'A.CH0ANF', N'CH0ANF', N'VsCH0A', N'A', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (191, N'WSY_JGMC', N'医嘱转社区卫生服务机构/乡镇卫生院，拟接收医疗机构名称', N'A.CH0ANF', N'CH0ANF', N'VsCH0A', N'A', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (192, N'ZZYJH', N'是否有出院31天内再住院计划', N'A.CH0ANG', N'CH0ANG', N'VsCH0A', N'A', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (193, N'MD', N'目的', N'A.CH0ANH', N'CH0ANH', N'VsCH0A', N'A', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (194, N'RYQ_T', N'颅脑损伤患者昏迷入院前时间：天', N'A.CH0ANI', N'CH0ANI', N'VsCH0A', N'A', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (195, N'RYQ_XS', N'颅脑损伤患者昏迷入院前时间：小时', N'A.CH0ANJ', N'CH0ANJ', N'VsCH0A', N'A', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (196, N'RYQ_FZ', N'颅脑损伤患者昏迷入院前时间：分钟', N'A.CH0ANK', N'CH0ANK', N'VsCH0A', N'A', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (197, N'RYH_T', N'颅脑损伤患者昏迷入院后时间：天', N'A.CH0ANL', N'CH0ANL', N'VsCH0A', N'A', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (198, N'RYH_XS', N'颅脑损伤患者昏迷入院后时间：小时', N'A.CH0ANM', N'CH0ANM', N'VsCH0A', N'A', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (199, N'RYH_FZ', N'颅脑损伤患者昏迷入院后时间：分钟', N'A.CH0ANN', N'CH0ANN', N'VsCH0A', N'A', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (200, N'ZFY', N'总费用', N'', N'IsNull(CH0B83,0)', N'VsCH0B', N'B', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (201, N'ZFJE', N'自付金额', N'', N'IsNull(CH0BP1,0)', N'VsCH0B', N'B', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (202, N'YLFWF', N'综合医疗服务类(1)一般医疗服务费', N'', N'IsNull(CH0BP2,0)', N'VsCH0B', N'B', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (203, N'BZLZF', N'中医辨证论治费', N'', N'IsNull(CH0BZ1,0)', N'VsCH0B', N'B', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (204, N'ZYBLZHZF', N'中医辨证论治会诊费', N'', N'IsNull(CH0BZ2,0)', N'VsCH0B', N'B', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (205, N'ZLCZF', N'一般治疗操作费', N'', N'IsNull(CH0BP3,0)', N'VsCH0B', N'B', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (206, N'HLF', N'护理费', N'', N'IsNull(CH0BP4,0)', N'VsCH0B', N'B', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (207, N'QTFY', N'其他费用', N'', N'IsNull(CH0BP5,0)', N'VsCH0B', N'B', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (208, N'BLZDF', N'诊断类(5)病理诊断费', N'', N'IsNull(CH0BP6,0)', N'VsCH0B', N'B', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (209, N'ZDF', N'实验室诊断费', N'', N'IsNull(CH0BP7,0)', N'VsCH0B', N'B', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (210, N'YXXZDF', N'影像学诊断费', N'', N'IsNull(CH0BP8,0)', N'VsCH0B', N'B', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (211, N'LCZDXMF', N'临床诊断项目费', N'', N'IsNull(CH0BP9,0)', N'VsCH0B', N'B', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (212, N'FSSZLXMF', N'治疗类(9)非手术治疗项目费', N'', N'IsNull(CH0BPA,0)', N'VsCH0B', N'B', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (213, N'ZLF', N'临床物理治疗费', N'', N'IsNull(CH0BPB,0)', N'VsCH0B', N'B', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (214, N'SSZLF', N'手术治疗费', N'', N'IsNull(CH0BPC,0)', N'VsCH0B', N'B', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (215, N'MZF', N'麻醉费', N'', N'IsNull(CH0BPD,0)', N'VsCH0B', N'B', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (216, N'SSF', N'手术费', N'', N'IsNull(CH0BPE,0)', N'VsCH0B', N'B', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (217, N'KFF', N'康复类(11)康复费', N'', N'IsNull(CH0BPF,0)', N'VsCH0B', N'B', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (218, N'ZYL_ZYZD', N'中医类(中医和名族医医疗服务)（12）中医诊断', N'', N'', NULL, NULL, 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (219, N'ZYZL', N'中医治疗', N'', N'IsNull(CH0BPG,0)', N'VsCH0B', N'B', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (220, N'ZYWZ', N'中医外治', N'', N'IsNull(CH0BZ4,0)', N'VsCH0B', N'B', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (221, N'ZYGS', N'中医骨伤', N'', N'IsNull(CH0BZ5,0)', N'VsCH0B', N'B', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (222, N'ZCYJF', N'针刺与灸法', N'', N'IsNull(CH0BZ6,0)', N'VsCH0B', N'B', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (223, N'ZYTNZL', N'中医推拿治疗', N'', N'IsNull(CH0BZ7,0)', N'VsCH0B', N'B', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (224, N'ZYGCZL', N'中医肛肠治疗', N'', N'IsNull(CH0BZ8,0)', N'VsCH0B', N'B', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (225, N'ZYTSZL', N'中医特殊治疗', N'', N'IsNull(CH0BZ9,0)', N'VsCH0B', N'B', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (226, N'ZYQT', N'中医其他', N'', N'IsNull(CH0BZA,0)', N'VsCH0B', N'B', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (227, N'ZYTSTPJG', N'中医特殊调配加工', N'', N'IsNull(CH0BZB,0)', N'VsCH0B', N'B', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (228, N'BZSS', N'辨证施膳', N'', N'IsNull(CH0BZC,0)', N'VsCH0B', N'B', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (229, N'XYF', N'西药类(15)西药费', N'', N'IsNull(CH0BPH,0)', N'VsCH0B', N'B', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (230, N'KJYWF', N'抗菌药物费', N'', N'IsNull(CH0BPI,0)', N'VsCH0B', N'B', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (231, N'ZCYF', N'中药类(16)中成药费', N'', N'IsNull(CH0BPJ,0)', N'VsCH0B', N'B', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (232, N'ZYZJF', N'医疗机构中药制剂费', N'', N'IsNull(CH0BZD,0)', N'VsCH0B', N'B', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (233, N'ZCYF1', N'中草药费', N'', N'IsNull(CH0BPK,0)', N'VsCH0B', N'B', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (234, N'XF', N'血液和血液制品类(18)血费', N'', N'IsNull(CH0BPL,0)', N'VsCH0B', N'B', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (235, N'BDBLZPF', N'白蛋白类制品费', N'', N'IsNull(CH0BPM,0)', N'VsCH0B', N'B', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (236, N'QDBLZPF', N'球蛋白类制品费', N'', N'IsNull(CH0BPN,0)', N'VsCH0B', N'B', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (237, N'NXYZLZPF', N'凝血因子类制品费', N'', N'IsNull(CH0BPO,0)', N'VsCH0B', N'B', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (238, N'XBYZLZPF', N'细胞因子类制品费', N'', N'IsNull(CH0BPP,0)', N'VsCH0B', N'B', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (239, N'JCYYCLF', N'耗材类(23)检查用一次性医用材料费', N'', N'IsNull(CH0BPQ,0)', N'VsCH0B', N'B', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (240, N'YYCLF', N'治疗用一次性医用材料费', N'', N'IsNull(CH0BPR,0)', N'VsCH0B', N'B', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (241, N'SSYCXCLF', N'手术用一次性医用材料费', N'', N'IsNull(CH0BPS,0)', N'VsCH0B', N'B', 1)
INSERT [dbo].[VsCHDBFStructure] ([xh], [DBFName], [DBFMC], [FieldName], [FieldSQL], [FieldTable], [FieldTableCus], [DBFBZ]) VALUES (242, N'QTF', N'其他类(26)其他费', N'', N'IsNull(CH0BPT,0)', N'VsCH0B', N'B', 1)

SET IDENTITY_INSERT [dbo].[VsCHDBFStructure] OFF



INSERT INTO dbo.VsCHDBFTable(TableName,TableCus,TableDesc,TableRel,LinkTableCus) VALUES('VsCH0A','A','','','')
INSERT INTO dbo.VsCHDBFTable(TableName,TableCus,TableDesc,TableRel,LinkTableCus) VALUES('VsCH0B','B','','A.CHYear=B.CHYear and A.CH0A01=B.CH0B01','')
INSERT INTO dbo.VsCHDBFTable(TableName,TableCus,TableDesc,TableRel,LinkTableCus) VALUES('VsNationality','N','','A.CH0AA2=N.Dm','')
INSERT INTO dbo.VsCHDBFTable(TableName,TableCus,TableDesc,TableRel,LinkTableCus) VALUES('VsXzqh_12','X1','','A.CH0A09=X1.Dm','')
INSERT INTO dbo.VsCHDBFTable(TableName,TableCus,TableDesc,TableRel,LinkTableCus) VALUES('VsXzqh_12','X2','','A.CH0AN4=X2.Dm','')
INSERT INTO dbo.VsCHDBFTable(TableName,TableCus,TableDesc,TableRel,LinkTableCus) VALUES('VsXzqh_12','X3','','A.CH0AN5=X3.Dm','')
INSERT INTO dbo.VsCHDBFTable(TableName,TableCus,TableDesc,TableRel,LinkTableCus) VALUES('VsXzqh_12','X4','','A.CH0A12=X4.Dm','')
INSERT INTO dbo.VsCHDBFTable(TableName,TableCus,TableDesc,TableRel,LinkTableCus) VALUES('VsXzqh_12','X5','','A.CH0A17=X5.Dm','')
INSERT INTO dbo.VsCHDBFTable(TableName,TableCus,TableDesc,TableRel,LinkTableCus) VALUES('VsSOffice','Ks1','','A.CH0A21=Ks1.SoDm','')
INSERT INTO dbo.VsCHDBFTable(TableName,TableCus,TableDesc,TableRel,LinkTableCus) VALUES('VsSOffice','Ks2','','Left(A.CH0A22,4)=Ks2.SoDm','')
INSERT INTO dbo.VsCHDBFTable(TableName,TableCus,TableDesc,TableRel,LinkTableCus) VALUES('VsSOffice','Ks3','','A.CH0A23=Ks3.SoDm','')
INSERT INTO dbo.VsCHDBFTable(TableName,TableCus,TableDesc,TableRel,LinkTableCus) VALUES('VsUseICD','ZD1','','A.CH0A36=ZD1.Bmm','')
INSERT INTO dbo.VsCHDBFTable(TableName,TableCus,TableDesc,TableRel,LinkTableCus) VALUES('VsUseICD','ZD2','','A.CH0A38=ZD2.Bmm','')
INSERT INTO dbo.VsCHDBFTable(TableName,TableCus,TableDesc,TableRel,LinkTableCus) VALUES('VsCH0C','C1','','A.CHYear=C1.CHYear and C1.CH0C01=A.CH0A01 and C1.CH0C02=1','')
INSERT INTO dbo.VsCHDBFTable(TableName,TableCus,TableDesc,TableRel,LinkTableCus) VALUES('VsUseICD','ZD3','','C1.CH0C03=ZD3.Bmm','C1')
INSERT INTO dbo.VsCHDBFTable(TableName,TableCus,TableDesc,TableRel,LinkTableCus) VALUES('VsCH0C','C2','','A.CHYear=C2.CHYear and C2.CH0C01=A.CH0A01 and C2.CH0C02=2','')
INSERT INTO dbo.VsCHDBFTable(TableName,TableCus,TableDesc,TableRel,LinkTableCus) VALUES('VsUseICD','ZD4','','C2.CH0C03=ZD4.Bmm','C2')
INSERT INTO dbo.VsCHDBFTable(TableName,TableCus,TableDesc,TableRel,LinkTableCus) VALUES('VsCH0C','C3','','A.CHYear=C3.CHYear and C3.CH0C01=A.CH0A01 and C3.CH0C02=3','')
INSERT INTO dbo.VsCHDBFTable(TableName,TableCus,TableDesc,TableRel,LinkTableCus) VALUES('VsUseICD','ZD5','','C3.CH0C03=ZD5.Bmm','C3')
INSERT INTO dbo.VsCHDBFTable(TableName,TableCus,TableDesc,TableRel,LinkTableCus) VALUES('VsCH0C','C4','','A.CHYear=C4.CHYear and C4.CH0C01=A.CH0A01 and C4.CH0C02=4','')
INSERT INTO dbo.VsCHDBFTable(TableName,TableCus,TableDesc,TableRel,LinkTableCus) VALUES('VsUseICD','ZD6','','C4.CH0C03=ZD6.Bmm','C4')
INSERT INTO dbo.VsCHDBFTable(TableName,TableCus,TableDesc,TableRel,LinkTableCus) VALUES('VsCH0C','C5','','A.CHYear=C5.CHYear and C5.CH0C01=A.CH0A01 and C5.CH0C02=5','')
INSERT INTO dbo.VsCHDBFTable(TableName,TableCus,TableDesc,TableRel,LinkTableCus) VALUES('VsUseICD','ZD7','','C5.CH0C03=ZD7.Bmm','C5')
INSERT INTO dbo.VsCHDBFTable(TableName,TableCus,TableDesc,TableRel,LinkTableCus) VALUES('VsCH0C','C6','','A.CHYear=C6.CHYear and C6.CH0C01=A.CH0A01 and C6.CH0C02=6','')
INSERT INTO dbo.VsCHDBFTable(TableName,TableCus,TableDesc,TableRel,LinkTableCus) VALUES('VsUseICD','ZD8','','C6.CH0C03=ZD8.Bmm','C6')
INSERT INTO dbo.VsCHDBFTable(TableName,TableCus,TableDesc,TableRel,LinkTableCus) VALUES('VsCH0C','C7','','A.CHYear=C7.CHYear and C7.CH0C01=A.CH0A01 and C7.CH0C02=7','')
INSERT INTO dbo.VsCHDBFTable(TableName,TableCus,TableDesc,TableRel,LinkTableCus) VALUES('VsUseICD','ZD9','','C7.CH0C03=ZD9.Bmm','C7')
INSERT INTO dbo.VsCHDBFTable(TableName,TableCus,TableDesc,TableRel,LinkTableCus) VALUES('VsCH0K','K','','A.CHYear=K.CHYear and K.CH0K01=A.CH0A01','')
INSERT INTO dbo.VsCHDBFTable(TableName,TableCus,TableDesc,TableRel,LinkTableCus) VALUES('VsUseZybz','TCD1','','K.CH0K02=TCD1.BzDm','K')
INSERT INTO dbo.VsCHDBFTable(TableName,TableCus,TableDesc,TableRel,LinkTableCus) VALUES('VsUseZybz','TCD2','','K.CH0K06=TCD2.BzDm','K')
INSERT INTO dbo.VsCHDBFTable(TableName,TableCus,TableDesc,TableRel,LinkTableCus) VALUES('VsUseZybz','TCD3','','K.CH0K03=TCD3.BzDm','K')
INSERT INTO dbo.VsCHDBFTable(TableName,TableCus,TableDesc,TableRel,LinkTableCus) VALUES('VsUseZybz','TCD4','','K.CH0K04=TCD4.BzDm','K')
INSERT INTO dbo.VsCHDBFTable(TableName,TableCus,TableDesc,TableRel,LinkTableCus) VALUES('VsUseZybz','TCD5','','K.CH0K05=TCD5.BzDm','K')
INSERT INTO dbo.VsCHDBFTable(TableName,TableCus,TableDesc,TableRel,LinkTableCus) VALUES('VsUseZybz','TCD6','','K.CH0K07=TCD6.BzDm','K')
INSERT INTO dbo.VsCHDBFTable(TableName,TableCus,TableDesc,TableRel,LinkTableCus) VALUES('VsUseZybz','TCD7','','K.CH0K14=TCD7.BzDm','K')
INSERT INTO dbo.VsCHDBFTable(TableName,TableCus,TableDesc,TableRel,LinkTableCus) VALUES('VsUseZybz','TCD8','','K.CH0K15=TCD8.BzDm','K')
INSERT INTO dbo.VsCHDBFTable(TableName,TableCus,TableDesc,TableRel,LinkTableCus) VALUES('VsSSZD_12','SS','','SS.DM=A.CH0A79','')
INSERT INTO dbo.VsCHDBFTable(TableName,TableCus,TableDesc,TableRel,LinkTableCus) VALUES('VsCH0G','G','','A.CHYear=G.CHYear and A.CH0A01=G.CH0G01 and CH0G03=1','')
INSERT INTO dbo.VsCHDBFTable(TableName,TableCus,TableDesc,TableRel,LinkTableCus) VALUES('VSSensitivity','GM','','G.CH0G04=GM.Dm','G')
INSERT INTO dbo.VsCHDBFTable(TableName,TableCus,TableDesc,TableRel,LinkTableCus) VALUES('VsCH0E','E1','','A.CHYear=E1.CHYear and A.CH0A01=E1.CH0E01 and E1.CH0E07=1','')
INSERT INTO dbo.VsCHDBFTable(TableName,TableCus,TableDesc,TableRel,LinkTableCus) VALUES('VsUseICCM','CM1','','E1.CH0E08=CM1.Ssm','E1')
INSERT INTO dbo.VsCHDBFTable(TableName,TableCus,TableDesc,TableRel,LinkTableCus) VALUES('VsNarcosis','NA1','','E1.CH0E10=NA1.Dm','E1')
INSERT INTO dbo.VsCHDBFTable(TableName,TableCus,TableDesc,TableRel,LinkTableCus) VALUES('VsCH0E','E2','','A.CHYear=E2.CHYear and A.CH0A01=E2.CH0E01 and E2.CH0E07=2','')
INSERT INTO dbo.VsCHDBFTable(TableName,TableCus,TableDesc,TableRel,LinkTableCus) VALUES('VsUseICCM','CM2','','E2.CH0E08=CM2.Ssm','E2')
INSERT INTO dbo.VsCHDBFTable(TableName,TableCus,TableDesc,TableRel,LinkTableCus) VALUES('VsNarcosis','NA2','','E2.CH0E10=NA2.Dm','E2')
INSERT INTO dbo.VsCHDBFTable(TableName,TableCus,TableDesc,TableRel,LinkTableCus) VALUES('VsCH0E','E3','','A.CHYear=E3.CHYear and A.CH0A01=E3.CH0E01 and E3.CH0E07=3','')
INSERT INTO dbo.VsCHDBFTable(TableName,TableCus,TableDesc,TableRel,LinkTableCus) VALUES('VsUseICCM','CM3','','E3.CH0E08=CM3.Ssm','E3')
INSERT INTO dbo.VsCHDBFTable(TableName,TableCus,TableDesc,TableRel,LinkTableCus) VALUES('VsNarcosis','NA3','','E3.CH0E10=NA3.Dm','E3')
INSERT INTO dbo.VsCHDBFTable(TableName,TableCus,TableDesc,TableRel,LinkTableCus) VALUES('VsCH0E','E4','','A.CHYear=E4.CHYear and A.CH0A01=E4.CH0E01 and E4.CH0E07=4','')
INSERT INTO dbo.VsCHDBFTable(TableName,TableCus,TableDesc,TableRel,LinkTableCus) VALUES('VsUseICCM','CM4','','E4.CH0E08=CM4.Ssm','E4')
INSERT INTO dbo.VsCHDBFTable(TableName,TableCus,TableDesc,TableRel,LinkTableCus) VALUES('VsNarcosis','NA4','','E4.CH0E10=NA4.Dm','E4')
INSERT INTO dbo.VsCHDBFTable(TableName,TableCus,TableDesc,TableRel,LinkTableCus) VALUES('VsCH0E','E5','','A.CHYear=E5.CHYear and A.CH0A01=E5.CH0E01 and E5.CH0E07=5','')
INSERT INTO dbo.VsCHDBFTable(TableName,TableCus,TableDesc,TableRel,LinkTableCus) VALUES('VsUseICCM','CM5','','E5.CH0E08=CM5.Ssm','E5')
INSERT INTO dbo.VsCHDBFTable(TableName,TableCus,TableDesc,TableRel,LinkTableCus) VALUES('VsNarcosis','NA5','','E5.CH0E10=NA5.Dm','E5')
INSERT INTO dbo.VsCHDBFTable(TableName,TableCus,TableDesc,TableRel,LinkTableCus) VALUES('VsCH0E','E6','','A.CHYear=E6.CHYear and A.CH0A01=E6.CH0E01 and E6.CH0E07=6','')
INSERT INTO dbo.VsCHDBFTable(TableName,TableCus,TableDesc,TableRel,LinkTableCus) VALUES('VsUseICCM','CM6','','E6.CH0E08=CM6.Ssm','E6')
INSERT INTO dbo.VsCHDBFTable(TableName,TableCus,TableDesc,TableRel,LinkTableCus) VALUES('VsNarcosis','NA6','','E6.CH0E10=NA6.Dm','E6')




SELECT a.*,b.TableRel, b.LTableName,b.LtableCus,b.LTableRel FROM dbo.VsCHDBFStructure a
LEFT JOIN (SELECT c.*,d.TableName LTableName,d.TableCus LtableCus,d.TableRel LTableRel FROM dbo.VsCHDBFTable c
 LEFT JOIN dbo.VsCHDBFTable d ON c.linktablecus =d.TableCus
) b ON a.FieldTable =b.TableName AND a.FieldTableCus = b.TableCus



SELECT * FROM dbo.VsCHDBFTable


 if not exists(select * from VsMidOper where MidOperCode ='412')
   insert into VSMIDOPER (MidOperCode, MidOperName, MidOperLib, MidOperEnu, MidOperDes) 
values(412, 'TVsCHDBFRel', '200028', 'EuVsDBFRel', 'DBF上报设置')


 if not exists(select * from VsMidOper where MidOperCode ='413')
   insert into VSMIDOPER (MidOperCode, MidOperName, MidOperLib, MidOperEnu, MidOperDes) 
values(413, 'TVsCHDBFTheme', '200028', 'EuVsDBFThem', 'DBF上报方案设置')



if not exists(select * from VsMenu where MenuCode ='1031303')
   insert into VsMenu(MenuCode,MenuICode,MenuPCode,MenuName,MenuEnd,MenuFormName,MenuLib,MenuSysCenter,MenuVisible) 
 Values('1031303','03','10313','&3.DBF上报方案',1,'TfrmDBFTheme','100028',1,1)