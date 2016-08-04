Declare @TmpStr VarChar(3000)
--在人员表里增加人员类型，人员级别，人员所属科室/病区
IF Col_Length('VsDoctor','DType') Is Null
   Alter Table VsDoctor Add DType VarChar(1)
IF Col_Length('VsDoctor','DLevel') Is Null
   Alter Table VsDoctor Add DLevel VarChar(1)
IF Col_Length('VsDoctor','DKSDM') Is Null
   Alter Table VsDoctor Add DKSDM VarChar(20)
--在综合表里增加医务人员类型，医务人员级别
IF Col_Length('VsZHDM','DoctorType') Is Null
   Alter Table VsZHDM Add DoctorType VarChar(10)
IF Col_Length('VsZHDM','DoctorLevel') Is Null
   Alter Table VsZHDM Add DoctorLevel VarChar(20)

--在手术代码库里增加手术级别字段
IF Col_Length('VsUseICCM','SSLevel') Is Null
   Alter Table VsUseICCM Add SSLevel VarChar(1)
--在综合表里增加手术级别
IF Col_Length('VsZHDM','SSLevel') Is Null
   Alter Table VsZHDM Add SSLevel VarChar(20)
--在用户表里增加所属分院
IF Col_Length('VsUser','UserUnitCode') Is Null
   Begin
     Alter Table VsUser Add UserUnitCode Int
     Exec('Update VsUser Set UserUnitCode=-1')
   End

if Not exists (select * from sysobjects where id = object_id(N'[VsUnitBranch]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
   Begin
     CREATE TABLE [VsUnitBranch] (
	[UnitCode] [Int] NOT NULL ,
	[UnitName] [varchar] (500) COLLATE Chinese_PRC_CI_AS NULL ,
	[UnitFzr] [varchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[UnitTjFzr] [varchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[UnitXzqh] [varchar] (6) COLLATE Chinese_PRC_CI_AS NULL ) ON [PRIMARY]
     ALTER TABLE [VsUnitBranch] WITH NOCHECK ADD CONSTRAINT [PK_VsUnitBranch] PRIMARY KEY  CLUSTERED ([UnitCode]) ON [PRIMARY] 
   End

Alter table VsSysInfo Alter Column VsSiName VarChar(200)
Alter table VsSysInfo Alter Column VsSiAddr VarChar(200)

--往工具栏中增加类别，1为常用功能列表，2为常用报表列表
IF Col_Length('VsUserToolsBar','ToolsBarType') Is Null
   Begin
     Alter Table VsUserToolsBar Add ToolsBarType Int
     Exec('Update VsUserToolsBar Set ToolsBarType=1')
     Select * into Tmp_VsUserToolsBar From VsUserToolsBar
     Alter Table Tmp_VsUserToolsBar Alter Column ToolsBarType Int Not Null
     Drop Table VsUserToolsBar
     EXECUTE sp_rename 'Tmp_VsUserToolsBar', 'VsUserToolsBar'
     Exec('ALTER TABLE VsUserToolsBar ADD CONSTRAINT PK_VsUserToolsBar PRIMARY KEY CLUSTERED (UserCode,ToolBarIndex,ToolsBarType) ON [PRIMARY]')
   End

-- 科室 增加分院字段
IF Col_Length('VsSOffice','UnitCode') Is Null begin
  Exec('Alter Table VsSOffice Add UnitCode int')
  Exec('Update VsSOffice Set UnitCode=-1')
end
-- 病区 增加分院字段
IF Col_Length('VsBQ','UnitCode') Is Null begin
  Exec('Alter Table VsBQ Add UnitCode int')
  Exec('Update VsBQ Set UnitCode=-1')
end

-- 在归口表中增加拼音码和五笔码
IF Col_Length('VsTjGroup','PYM') Is Null
   Alter Table VsTjGroup Add PYM VarChar(10)
IF Col_Length('VsTjGroup','WBM') Is Null
   Alter Table VsTjGroup Add WBM VarChar(10)
--在病区代码库中增加病区归口字段
IF Col_Length('VsBQ','BQGK') Is Null
   Alter Table VsBQ Add BQGK VarChar(3)

--增加2012版首页代码库

if Not exists (select * from sysobjects where id = object_id(N'[VsZhdm_12]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
   Begin
     CREATE TABLE [VsZhdm_12] (
	[id] [int] NOT NULL ,
	[xb] [varchar] (4) COLLATE Chinese_PRC_CI_AS NULL ,
	[hy] [varchar] (4) COLLATE Chinese_PRC_CI_AS NULL ,
	[lytj] [varchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[lybq] [varchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[yw] [varchar] (4) COLLATE Chinese_PRC_CI_AS NULL ,
	[sf] [varchar] (4) COLLATE Chinese_PRC_CI_AS NULL ,
	[xx] [varchar] (4) COLLATE Chinese_PRC_CI_AS NULL ,
	[Rh] [varchar] (4) COLLATE Chinese_PRC_CI_AS NULL ,
	[bazl] [varchar] (4) COLLATE Chinese_PRC_CI_AS NULL ,
	[ylfffs] [varchar] (120) COLLATE Chinese_PRC_CI_AS NULL ,
	[gx] [varchar] (120) COLLATE Chinese_PRC_CI_AS NULL,
        [lyfs] [varchar] (120) COLLATE Chinese_PRC_CI_AS NULL) ON [PRIMARY]
     ALTER TABLE [VsZhdm_12] WITH NOCHECK ADD PRIMARY KEY  CLUSTERED ([id])  ON [PRIMARY] 
End

if Not exists (select * from sysobjects where id = object_id(N'[VsZy_12]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
   Begin
     CREATE TABLE [VsZy_12] (
	[Dm] [VarChar] (20) NOT NULL ,
	[Dmmc] [varchar] (120) COLLATE Chinese_PRC_CI_AS NULL ,
        [PYM] [varchar] (10) COLLATE Chinese_PRC_CI_AS NULL ,
        [WBM] [varchar] (10) COLLATE Chinese_PRC_CI_AS NULL) ON [PRIMARY]
     ALTER TABLE [VsZy_12] WITH NOCHECK ADD PRIMARY KEY  CLUSTERED ([Dm])  ON [PRIMARY] 
insert into VsZy_12(Dm,Dmmc,PYM,WBM) Values(11,'国家公务员','GJGWY','LPWTK')
insert into VsZy_12(Dm,Dmmc,PYM,WBM) Values(13,'专业技术人员','ZYJSRY','FORSWK')
insert into VsZy_12(DM,Dmmc,PYM,WBM) Values(17,'职员','ZY','BK')
insert into VsZy_12(Dm,Dmmc,PYM,WBM) Values(21,'企业管理员人员','QYGLY','WOTGKWK')
insert into VsZy_12(Dm,Dmmc,PYM,WBM) Values(24,'工人','GR','AW')
insert into VsZy_12(Dm,Dmmc,PYM,WBM) Values(27,'农民','NM','PN')
insert into VsZy_12(Dm,Dmmc,PYM,WBM) Values(31,'学生','XS','IT')
insert into VsZy_12(Dm,Dmmc,PYM,WBM) Values(37,'现役军人','XYJR','GTPW')
insert into VsZy_12(Dm,Dmmc,PYM,WBM) Values(51,'自由职业者','ZYZYX','TMBOF')
insert into VsZy_12(Dm,Dmmc,PYM,WBM) Values(54,'个体经营者','GTJYZ','WWXAF')
insert into VsZy_12(Dm,Dmmc,PYM,WBM) Values(70,'无业人员','WYRY','FOWK')
insert into VsZy_12(Dm,Dmmc,PYM,WBM) Values(80,'退（离）休人员','TLXRY','VYWWK')
insert into VsZy_12(Dm,Dmmc,PYM,WBM) Values(90,'其他','QT','AW')

   End


--2012数据整理
IF Col_Length('VsCh0A','Ch0AN1') Is Null And
   Exists(Select Top 1 1 From VsCh0A Where ChYear>='2012')
   Begin
     --医疗付款方式
     Update VsCh0A Set Ch0A82=(Case Ch0A82 When '4' Then '8' When '6' Then '7' Else Ch0A82 End) Where ChYear>='2012'
     --职业
     Update VsCh0A Set Ch0A08=(Case When Ch0A08>='00' And Ch0A08<='09' And Ch0A08<>'05' Then '11'
                                    When Ch0A08='05' Then '21'
                                    When Ch0A08>='10' And Ch0A08<='29' Then '13' 
                                    When Ch0A08>='30' And Ch0A08<='49' Then '17' 
                                    When Ch0A08>='50' And Ch0A08<='59' Then '27' 
                                    When Ch0A08>='60' And Ch0A08<='99' Then '24' 
                                    When Ch0A08='X0' Then '37' 
                                    When Ch0A08='Y0' Then '90' 
                                    When Ch0A08='Z0' Then '70' Else Ch0A08 End)
       Where ChYear>='2012'
     --入院途径
     Update VsCh0A Set Ch0A56=(Case Ch0A56 When '1' Then '2' When '2' Then '1' Else '9' End) Where ChYear>='2012'
     --病理诊断标志
     Update VsCh0A Set Ch0A61=(Case Ch0A61 When '1' Then '2' When '2' Then '1' Else '1' End) Where ChYear>='2012' 
     --药物过敏标志
     Update VsCh0A Set Ch0A52=(Case Ch0A52 When '1' Then '2' When '2' Then '1' Else '1' End) Where ChYear>='2012' 
     --血型
     Update VsCh0A Set Ch0A45=(Case Ch0A45 When '3' Then '4' When '4' Then '3' Else Ch0A45 End) Where ChYear>='2012' 
   End

--首页中增加字段
IF Col_Length('VsCh0A','Ch0AN1') Is Null
   Alter Table VsCh0A Add Ch0AN1 int
IF Col_Length('VsCh0A','Ch0AN2') Is Null
   Alter Table VsCh0A Add Ch0AN2 int
IF Col_Length('VsCh0A','Ch0AN3') Is Null
   Alter Table VsCh0A Add Ch0AN3 int
IF Col_Length('VsCh0A','Ch0AN4') Is Null
   Alter Table VsCh0A Add Ch0AN4 VarChar(6)
IF Col_Length('VsCh0A','Ch0AN5') Is Null
   Alter Table VsCh0A Add Ch0AN5 VarChar(6)
IF Col_Length('VsCh0A','Ch0AN6') Is Null
   Alter Table VsCh0A Add Ch0AN6 VarChar(200)
IF Col_Length('VsCh0A','Ch0AN7') Is Null
   Alter Table VsCh0A Add Ch0AN7 VarChar(20)
IF Col_Length('VsCh0A','Ch0AN8') Is Null
   Alter Table VsCh0A Add Ch0AN8 VarChar(6)
IF Col_Length('VsCh0A','Ch0AN9') Is Null
   Alter Table VsCh0A Add Ch0AN9 VarChar(6)
IF Col_Length('VsCh0A','Ch0ANA') Is Null
   Alter Table VsCh0A Add Ch0ANA VarChar(10)
IF Col_Length('VsCh0A','Ch0ANB') Is Null
   Alter Table VsCh0A Add Ch0ANB VarChar(10)
IF Col_Length('VsCh0A','Ch0ANC') Is Null
   Begin
     Alter Table VsCh0A Add Ch0ANC int
     --尸检诊断标志
     Exec('Update VsCh0A Set Ch0ANC=(Case When Exists(Select 1 From VsCh0F Where VsCh0F.ChYear=VsCh0A.ChYear And Ch0F01=Ch0A01) Then ''1'' When Ch0A41=''4'' Then ''2'' Else '''' End) Where ChYear>=''2012''')
   end
IF Col_Length('VsCh0A','Ch0AND') Is Null
   Alter Table VsCh0A Add Ch0AND VarChar(50)
IF Col_Length('VsCh0A','Ch0ANE') Is Null
   Alter Table VsCh0A Add Ch0ANE int
IF Col_Length('VsCh0A','Ch0ANF') Is Null
   Alter Table VsCh0A Add Ch0ANF VarChar(200)
IF Col_Length('VsCh0A','Ch0ANG') Is Null
   Alter Table VsCh0A Add Ch0ANG int
IF Col_Length('VsCh0A','Ch0ANH') Is Null
   Alter Table VsCh0A Add Ch0ANH VarChar(200)
IF Col_Length('VsCh0A','Ch0ANI') Is Null
   Alter Table VsCh0A Add Ch0ANI int
IF Col_Length('VsCh0A','Ch0ANJ') Is Null
   Alter Table VsCh0A Add Ch0ANJ int
IF Col_Length('VsCh0A','Ch0ANK') Is Null
   Alter Table VsCh0A Add Ch0ANK int
IF Col_Length('VsCh0A','Ch0ANL') Is Null
   Alter Table VsCh0A Add Ch0ANL int
IF Col_Length('VsCh0A','Ch0ANM') Is Null
   Alter Table VsCh0A Add Ch0ANM int
IF Col_Length('VsCh0A','Ch0ANN') Is Null
   Alter Table VsCh0A Add Ch0ANN int
IF Col_Length('VsCh0A','Ch0ANO') Is Null
   Alter Table VsCh0A Add Ch0ANO int

IF Col_Length('VsCh0C','Ch0CN1') Is Null
   Alter Table VsCh0C Add Ch0CN1 VarChar

IF Col_Length('VsCh_CH0C','Ch0CN1') Is Null
   Alter Table VsCh_CH0C Add Ch0CN1 VarChar


-- 增加 2012版 医疗付款方式
IF Col_Length('VsZhDm','Fymc2') Is Null begin
  alter table VsZhdm Add Fymc2 varchar(50)
end
-- 增加费用表字段
IF Col_Length('VsCh0B','CH0BP1') Is Null
   Alter Table VsCh0B Add CH0BP1 Numeric(18,2)
IF Col_Length('VsCh0B','CH0BP2') Is Null
   Alter Table VsCh0B Add CH0BP2 Numeric(18,2)
IF Col_Length('VsCh0B','CH0BP3') Is Null
   Alter Table VsCh0B Add CH0BP3 Numeric(18,2)
IF Col_Length('VsCh0B','CH0BP4') Is Null
   Alter Table VsCh0B Add CH0BP4 Numeric(18,2)
IF Col_Length('VsCh0B','CH0BP5') Is Null
   Alter Table VsCh0B Add CH0BP5 Numeric(18,2)
IF Col_Length('VsCh0B','CH0BP6') Is Null
   Alter Table VsCh0B Add CH0BP6 Numeric(18,2)
IF Col_Length('VsCh0B','CH0BP7') Is Null
   Alter Table VsCh0B Add CH0BP7 Numeric(18,2)
IF Col_Length('VsCh0B','CH0BP8') Is Null
   Alter Table VsCh0B Add CH0BP8 Numeric(18,2)
IF Col_Length('VsCh0B','CH0BP9') Is Null
   Alter Table VsCh0B Add CH0BP9 Numeric(18,2)
IF Col_Length('VsCh0B','CH0BPA') Is Null
   Alter Table VsCh0B Add CH0BPA Numeric(18,2)
IF Col_Length('VsCh0B','CH0BPB') Is Null
   Alter Table VsCh0B Add CH0BPB Numeric(18,2)
IF Col_Length('VsCh0B','CH0BPC') Is Null
   Alter Table VsCh0B Add CH0BPC Numeric(18,2)
IF Col_Length('VsCh0B','CH0BPD') Is Null
   Alter Table VsCh0B Add CH0BPD Numeric(18,2)
IF Col_Length('VsCh0B','CH0BPE') Is Null
   Alter Table VsCh0B Add CH0BPE Numeric(18,2)
IF Col_Length('VsCh0B','CH0BPF') Is Null
   Alter Table VsCh0B Add CH0BPF Numeric(18,2)
IF Col_Length('VsCh0B','CH0BPG') Is Null
   Alter Table VsCh0B Add CH0BPG Numeric(18,2)
IF Col_Length('VsCh0B','CH0BPH') Is Null
   Alter Table VsCh0B Add CH0BPH Numeric(18,2)
IF Col_Length('VsCh0B','CH0BPI') Is Null
   Alter Table VsCh0B Add CH0BPI Numeric(18,2)
IF Col_Length('VsCh0B','CH0BPJ') Is Null
   Alter Table VsCh0B Add CH0BPJ Numeric(18,2)
IF Col_Length('VsCh0B','CH0BPK') Is Null
   Alter Table VsCh0B Add CH0BPK Numeric(18,2)
IF Col_Length('VsCh0B','CH0BPL') Is Null
   Alter Table VsCh0B Add CH0BPL Numeric(18,2)
IF Col_Length('VsCh0B','CH0BPM') Is Null
   Alter Table VsCh0B Add CH0BPM Numeric(18,2)
IF Col_Length('VsCh0B','CH0BPN') Is Null
   Alter Table VsCh0B Add CH0BPN Numeric(18,2)
IF Col_Length('VsCh0B','CH0BPO') Is Null
   Alter Table VsCh0B Add CH0BPO Numeric(18,2)
IF Col_Length('VsCh0B','CH0BPP') Is Null
   Alter Table VsCh0B Add CH0BPP Numeric(18,2)
IF Col_Length('VsCh0B','CH0BPQ') Is Null
   Alter Table VsCh0B Add CH0BPQ Numeric(18,2)
IF Col_Length('VsCh0B','CH0BPR') Is Null
   Alter Table VsCh0B Add CH0BPR Numeric(18,2)
IF Col_Length('VsCh0B','CH0BPS') Is Null
   Alter Table VsCh0B Add CH0BPS Numeric(18,2)
IF Col_Length('VsCh0B','CH0BPT') Is Null
   Alter Table VsCh0B Add CH0BPT Numeric(18,2)

--中间层 增加 新首页字段
IF Col_Length('VsCH_PatientInfo','Ch0MN1') Is Null
   Alter Table VsCH_PatientInfo Add Ch0MN1 int
IF Col_Length('VsCH_PatientInfo','Ch0MN2') Is Null
   Alter Table VsCH_PatientInfo Add Ch0MN2 int
IF Col_Length('VsCH_PatientInfo','Ch0MN3') Is Null
   Alter Table VsCH_PatientInfo Add Ch0MN3 int
IF Col_Length('VsCH_PatientInfo','Ch0MN4') Is Null
   Alter Table VsCH_PatientInfo Add Ch0MN4 VarChar(6)
IF Col_Length('VsCH_PatientInfo','Ch0MN5') Is Null
   Alter Table VsCH_PatientInfo Add Ch0MN5 VarChar(6)
IF Col_Length('VsCH_PatientInfo','Ch0MN6') Is Null
   Alter Table VsCH_PatientInfo Add Ch0MN6 VarChar(200)
IF Col_Length('VsCH_PatientInfo','Ch0MN7') Is Null
   Alter Table VsCH_PatientInfo Add Ch0MN7 VarChar(20)
IF Col_Length('VsCH_PatientInfo','Ch0MN8') Is Null
   Alter Table VsCH_PatientInfo Add Ch0MN8 VarChar(6)
IF Col_Length('VsCH_PatientInfo','Ch0MN9') Is Null
   Alter Table VsCH_PatientInfo Add Ch0MN9 VarChar(6)
IF Col_Length('VsCH_PatientInfo','Ch0MNA') Is Null
   Alter Table VsCH_PatientInfo Add Ch0MNA VarChar(10)
IF Col_Length('VsCH_PatientInfo','Ch0MNB') Is Null
   Alter Table VsCH_PatientInfo Add Ch0MNB VarChar(10)
IF Col_Length('VsCH_PatientInfo','Ch0MNC') Is Null
   Alter Table VsCH_PatientInfo Add Ch0MNC int
IF Col_Length('VsCH_PatientInfo','Ch0MND') Is Null
   Alter Table VsCH_PatientInfo Add Ch0MND VarChar(50)
IF Col_Length('VsCH_PatientInfo','Ch0MNE') Is Null
   Alter Table VsCH_PatientInfo Add Ch0MNE int
IF Col_Length('VsCH_PatientInfo','Ch0MNF') Is Null
   Alter Table VsCH_PatientInfo Add Ch0MNF VarChar(200)
IF Col_Length('VsCH_PatientInfo','Ch0MNG') Is Null
   Alter Table VsCH_PatientInfo Add Ch0MNG int
IF Col_Length('VsCH_PatientInfo','Ch0MNH') Is Null
   Alter Table VsCH_PatientInfo Add Ch0MNH VarChar(200)
IF Col_Length('VsCH_PatientInfo','Ch0MNI') Is Null
   Alter Table VsCH_PatientInfo Add Ch0MNI int
IF Col_Length('VsCH_PatientInfo','Ch0MNJ') Is Null
   Alter Table VsCH_PatientInfo Add Ch0MNJ int
IF Col_Length('VsCH_PatientInfo','Ch0MNK') Is Null
   Alter Table VsCH_PatientInfo Add Ch0MNK int
IF Col_Length('VsCH_PatientInfo','Ch0MNL') Is Null
   Alter Table VsCH_PatientInfo Add Ch0MNL int
IF Col_Length('VsCH_PatientInfo','Ch0MNM') Is Null
   Alter Table VsCH_PatientInfo Add Ch0MNM int
IF Col_Length('VsCH_PatientInfo','Ch0MNN') Is Null
   Alter Table VsCH_PatientInfo Add Ch0MNN int
IF Col_Length('VsCH_PatientInfo','Ch0MNO') Is Null
   Alter Table VsCH_PatientInfo Add Ch0MNO int

-- 中间库增加新费用项目
IF Col_Length('VsCH_PatientInfo','CH0MP1') Is Null
   Alter Table VsCH_PatientInfo Add CH0MP1 Numeric(18,2)
IF Col_Length('VsCH_PatientInfo','CH0MP2') Is Null
   Alter Table VsCH_PatientInfo Add CH0MP2 Numeric(18,2)
IF Col_Length('VsCH_PatientInfo','CH0MP3') Is Null
   Alter Table VsCH_PatientInfo Add CH0MP3 Numeric(18,2)
IF Col_Length('VsCH_PatientInfo','CH0MP4') Is Null
   Alter Table VsCH_PatientInfo Add CH0MP4 Numeric(18,2)
IF Col_Length('VsCH_PatientInfo','CH0MP5') Is Null
   Alter Table VsCH_PatientInfo Add CH0MP5 Numeric(18,2)
IF Col_Length('VsCH_PatientInfo','CH0MP6') Is Null
   Alter Table VsCH_PatientInfo Add CH0MP6 Numeric(18,2)
IF Col_Length('VsCH_PatientInfo','CH0MP7') Is Null
   Alter Table VsCH_PatientInfo Add CH0MP7 Numeric(18,2)
IF Col_Length('VsCH_PatientInfo','CH0MP8') Is Null
   Alter Table VsCH_PatientInfo Add CH0MP8 Numeric(18,2)
IF Col_Length('VsCH_PatientInfo','CH0MP9') Is Null
   Alter Table VsCH_PatientInfo Add CH0MP9 Numeric(18,2)
IF Col_Length('VsCH_PatientInfo','CH0MPA') Is Null
   Alter Table VsCH_PatientInfo Add CH0MPA Numeric(18,2)
IF Col_Length('VsCH_PatientInfo','CH0MPB') Is Null
   Alter Table VsCH_PatientInfo Add CH0MPB Numeric(18,2)
IF Col_Length('VsCH_PatientInfo','CH0MPC') Is Null
   Alter Table VsCH_PatientInfo Add CH0MPC Numeric(18,2)
IF Col_Length('VsCH_PatientInfo','CH0MPD') Is Null
   Alter Table VsCH_PatientInfo Add CH0MPD Numeric(18,2)
IF Col_Length('VsCH_PatientInfo','CH0MPE') Is Null
   Alter Table VsCH_PatientInfo Add CH0MPE Numeric(18,2)
IF Col_Length('VsCH_PatientInfo','CH0MPF') Is Null
   Alter Table VsCH_PatientInfo Add CH0MPF Numeric(18,2)
IF Col_Length('VsCH_PatientInfo','CH0MPG') Is Null
   Alter Table VsCH_PatientInfo Add CH0MPG Numeric(18,2)
IF Col_Length('VsCH_PatientInfo','CH0MPH') Is Null
   Alter Table VsCH_PatientInfo Add CH0MPH Numeric(18,2)
IF Col_Length('VsCH_PatientInfo','CH0MPI') Is Null
   Alter Table VsCH_PatientInfo Add CH0MPI Numeric(18,2)
IF Col_Length('VsCH_PatientInfo','CH0MPJ') Is Null
   Alter Table VsCH_PatientInfo Add CH0MPJ Numeric(18,2)
IF Col_Length('VsCH_PatientInfo','CH0MPK') Is Null
   Alter Table VsCH_PatientInfo Add CH0MPK Numeric(18,2)
IF Col_Length('VsCH_PatientInfo','CH0MPL') Is Null
   Alter Table VsCH_PatientInfo Add CH0MPL Numeric(18,2)
IF Col_Length('VsCH_PatientInfo','CH0MPM') Is Null
   Alter Table VsCH_PatientInfo Add CH0MPM Numeric(18,2)
IF Col_Length('VsCH_PatientInfo','CH0MPN') Is Null
   Alter Table VsCH_PatientInfo Add CH0MPN Numeric(18,2)
IF Col_Length('VsCH_PatientInfo','CH0MPO') Is Null
   Alter Table VsCH_PatientInfo Add CH0MPO Numeric(18,2)
IF Col_Length('VsCH_PatientInfo','CH0MPP') Is Null
   Alter Table VsCH_PatientInfo Add CH0MPP Numeric(18,2)
IF Col_Length('VsCH_PatientInfo','CH0MPQ') Is Null
   Alter Table VsCH_PatientInfo Add CH0MPQ Numeric(18,2)
IF Col_Length('VsCH_PatientInfo','CH0MPR') Is Null
   Alter Table VsCH_PatientInfo Add CH0MPR Numeric(18,2)
IF Col_Length('VsCH_PatientInfo','CH0MPS') Is Null
   Alter Table VsCH_PatientInfo Add CH0MPS Numeric(18,2)
IF Col_Length('VsCH_PatientInfo','CH0MPT') Is Null
   Alter Table VsCH_PatientInfo Add CH0MPT Numeric(18,2)

-- 保留旧有设置，留作特殊处理，但不会再被使用
if Col_Length('VsHis_ItemTally', 'IsNew') Is Null begin
   Alter Table VsHis_ItemTally Add IsNew int
   Exec('Update VsHis_ItemTally Set IsNew=0')
end

IF Col_Length('VsBaSet','VsBsBaCh0ANO') Is Null
   Alter Table VsBaSet Add VsBsBaCh0ANO VarChar(1)
IF Col_Length('VsBaSet','VsBsIsMemCh0ANF') Is Null
   Alter Table VsBaSet Add VsBsIsMemCh0ANF int
IF Col_Length('VsBaSet','VsBsIsMemCh0ANH') Is Null
   Alter Table VsBaSet Add VsBsIsMemCh0ANH int
IF Col_Length('VsBaSet','VsBsIsShowCH0A41') Is Null
   Alter Table VsBaSet Add VsBsIsShowCH0A41 int
IF Col_Length('VsBaSet','VsBsIsShowCH0A30') Is Null
   Alter Table VsBaSet Add VsBsIsShowCH0A30 int
IF Col_Length('VsBaSet','VsBsIsShowCH0A57') Is Null
   Alter Table VsBaSet Add VsBsIsShowCH0A57 int
IF Col_Length('VsBaSet','VsBsIsShowCH0A20') Is Null
   Alter Table VsBaSet Add VsBsIsShowCH0A20 int
IF Col_Length('VsBaSet','VsBsIsShowCH0A46') Is Null
   Alter Table VsBaSet Add VsBsIsShowCH0A46 int

IF Col_Length('VsBaSet','VsBsIsShowCH0C05') Is Null
   Alter Table VsBaSet Add VsBsIsShowCH0C05 int

--增加接收医疗机构代码库
if Not exists (select * from sysobjects where id = object_id(N'[VsYLJG]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
   begin
     CREATE TABLE [VsYLJG] (
	[DM] [varchar] (10) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[Dmmc] [varchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	[PYM] [varchar] (10) COLLATE Chinese_PRC_CI_AS NULL ,
	[WBM] [varchar] (10) COLLATE Chinese_PRC_CI_AS NULL) ON [PRIMARY]
     ALTER TABLE [VsYLJG] WITH NOCHECK ADD CONSTRAINT [PK_VsYLJG] PRIMARY KEY  CLUSTERED ([DM])  ON [PRIMARY] 
End
--再次住院目的
if Not exists (select * from sysobjects where id = object_id(N'[VsZCZYMD]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
   begin
     CREATE TABLE [VsZCZYMD] (
	[DM] [varchar] (10) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[Dmmc] [varchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	[PYM] [varchar] (10) COLLATE Chinese_PRC_CI_AS NULL ,
	[WBM] [varchar] (10) COLLATE Chinese_PRC_CI_AS NULL) ON [PRIMARY]
     ALTER TABLE [VsZCZYMD] WITH NOCHECK ADD CONSTRAINT [PK_VsZCZYMD] PRIMARY KEY  CLUSTERED ([DM])  ON [PRIMARY] 
End

--中医部份
IF Col_Length('VsZHDM_12','ZLLB') Is Null
   Alter Table VsZHDM_12 Add ZLLB VarChar(10)
IF Col_Length('VsZHDM_12','ZLLB_ZY') Is Null
   Alter Table VsZHDM_12 Add ZLLB_ZY VarChar(10)
IF Col_Length('VsZHDM_12','SSLCLJ') Is Null
   Alter Table VsZHDM_12 Add SSLCLJ VarChar(10)
IF Col_Length('VsCh0A','Ch0ANP') Is Null
   Alter Table VsCh0A Add Ch0ANP VarChar(1)
IF Col_Length('VsCh0A','Ch0ANQ') Is Null
   Alter Table VsCh0A Add Ch0ANQ VarChar(1)
IF Col_Length('VsCh0A','Ch0ANR') Is Null
   Alter Table VsCh0A Add Ch0ANR VarChar(1)
IF Col_Length('VsCh0A','Ch0ANS') Is Null
   Alter Table VsCh0A Add Ch0ANS VarChar(1)
IF Col_Length('VsCh0A','Ch0ANT') Is Null
   Alter Table VsCh0A Add Ch0ANT VarChar(1)

IF Col_Length('VsCh_PatientInfo','Ch0MNP') Is Null
   Alter Table VsCh_PatientInfo Add Ch0MNP VarChar(1)
IF Col_Length('VsCh_PatientInfo','Ch0MNQ') Is Null
   Alter Table VsCh_PatientInfo Add Ch0MNQ VarChar(1)
IF Col_Length('VsCh_PatientInfo','Ch0MNR') Is Null
   Alter Table VsCh_PatientInfo Add Ch0MNR VarChar(1)
IF Col_Length('VsCh_PatientInfo','Ch0MNS') Is Null
   Alter Table VsCh_PatientInfo Add Ch0MNS VarChar(1)
IF Col_Length('VsCh_PatientInfo','Ch0MNT') Is Null
   Alter Table VsCh_PatientInfo Add Ch0MNT VarChar(1)

IF Col_Length('VsCh0B','Ch0BZ1') Is Null
   Alter Table VsCh0B Add Ch0BZ1 Numeric(18,2)
IF Col_Length('VsCh0B','Ch0BZ2') Is Null
   Alter Table VsCh0B Add Ch0BZ2 Numeric(18,2)
IF Col_Length('VsCh0B','Ch0BZ3') Is Null
   Alter Table VsCh0B Add Ch0BZ3 Numeric(18,2)
IF Col_Length('VsCh0B','Ch0BZ4') Is Null
   Alter Table VsCh0B Add Ch0BZ4 Numeric(18,2)
IF Col_Length('VsCh0B','Ch0BZ5') Is Null
   Alter Table VsCh0B Add Ch0BZ5 Numeric(18,2)
IF Col_Length('VsCh0B','Ch0BZ6') Is Null
   Alter Table VsCh0B Add Ch0BZ6 Numeric(18,2)
IF Col_Length('VsCh0B','Ch0BZ7') Is Null
   Alter Table VsCh0B Add Ch0BZ7 Numeric(18,2)
IF Col_Length('VsCh0B','Ch0BZ8') Is Null
   Alter Table VsCh0B Add Ch0BZ8 Numeric(18,2)
IF Col_Length('VsCh0B','Ch0BZ9') Is Null
   Alter Table VsCh0B Add Ch0BZ9 Numeric(18,2)
IF Col_Length('VsCh0B','Ch0BZA') Is Null
   Alter Table VsCh0B Add Ch0BZA Numeric(18,2)
IF Col_Length('VsCh0B','Ch0BZB') Is Null
   Alter Table VsCh0B Add Ch0BZB Numeric(18,2)
IF Col_Length('VsCh0B','Ch0BZC') Is Null
   Alter Table VsCh0B Add Ch0BZC Numeric(18,2)
IF Col_Length('VsCh0B','Ch0BZD') Is Null
   Alter Table VsCh0B Add Ch0BZD Numeric(18,2)

IF Col_Length('VsCh_PatientInfo','Ch0MZ1') Is Null
   Alter Table VsCh_PatientInfo Add Ch0MZ1 Numeric(18,2)
IF Col_Length('VsCh_PatientInfo','Ch0MZ2') Is Null
   Alter Table VsCh_PatientInfo Add Ch0MZ2 Numeric(18,2)
IF Col_Length('VsCh_PatientInfo','Ch0MZ3') Is Null
   Alter Table VsCh_PatientInfo Add Ch0MZ3 Numeric(18,2)
IF Col_Length('VsCh_PatientInfo','Ch0MZ4') Is Null
   Alter Table VsCh_PatientInfo Add Ch0MZ4 Numeric(18,2)
IF Col_Length('VsCh_PatientInfo','Ch0MZ5') Is Null
   Alter Table VsCh_PatientInfo Add Ch0MZ5 Numeric(18,2)
IF Col_Length('VsCh_PatientInfo','Ch0MZ6') Is Null
   Alter Table VsCh_PatientInfo Add Ch0MZ6 Numeric(18,2)
IF Col_Length('VsCh_PatientInfo','Ch0MZ7') Is Null
   Alter Table VsCh_PatientInfo Add Ch0MZ7 Numeric(18,2)
IF Col_Length('VsCh_PatientInfo','Ch0MZ8') Is Null
   Alter Table VsCh_PatientInfo Add Ch0MZ8 Numeric(18,2)
IF Col_Length('VsCh_PatientInfo','Ch0MZ9') Is Null
   Alter Table VsCh_PatientInfo Add Ch0MZ9 Numeric(18,2)
IF Col_Length('VsCh_PatientInfo','Ch0MZA') Is Null
   Alter Table VsCh_PatientInfo Add Ch0MZA Numeric(18,2)
IF Col_Length('VsCh_PatientInfo','Ch0MZB') Is Null
   Alter Table VsCh_PatientInfo Add Ch0MZB Numeric(18,2)
IF Col_Length('VsCh_PatientInfo','Ch0MZC') Is Null
   Alter Table VsCh_PatientInfo Add Ch0MZC Numeric(18,2)
IF Col_Length('VsCh_PatientInfo','Ch0MZD') Is Null
   Alter Table VsCh_PatientInfo Add Ch0MZD Numeric(18,2)

IF Col_Length('VsCh0K','Ch0KN1') Is Null
   Alter Table VsCh0K Add Ch0KN1 VarChar(1)
IF Col_Length('VsCh0K','Ch0KN2') Is Null
   Alter Table VsCh0K Add Ch0KN2 VarChar(1)
IF Col_Length('VsCh0K','Ch0KN3') Is Null
   Alter Table VsCh0K Add Ch0KN3 VarChar(1)
IF Col_Length('VsCh0K','Ch0KN4') Is Null
   Alter Table VsCh0K Add Ch0KN4 VarChar(1)

IF Col_Length('VsCh_CH0K','Ch0KN1') Is Null
   Alter Table VsCh_CH0K Add Ch0KN1 VarChar(1)
IF Col_Length('VsCh_CH0K','Ch0KN2') Is Null
   Alter Table VsCh_CH0K Add Ch0KN2 VarChar(1)
IF Col_Length('VsCh_CH0K','Ch0KN3') Is Null
   Alter Table VsCh_CH0K Add Ch0KN3 VarChar(1)
IF Col_Length('VsCh_CH0K','Ch0KN4') Is Null
   Alter Table VsCh_CH0K Add Ch0KN4 VarChar(1)

IF Col_Length('VsBaSet','VsBsIsShowCH0A43') Is Null
   Alter Table VsBaSet Add VsBsIsShowCH0A43 int
IF Col_Length('VsBaSet','VsBsIsShowCH0AI3') Is Null
   Alter Table VsBaSet Add VsBsIsShowCH0AI3 int

IF Col_Length('VsZhdm_12','LCLJGL') Is Null
   Alter Table VsZhdm_12 Add LCLJGL VarChar(10)
IF Col_Length('VsCh0A','Ch0A24_SJ') Is Null
   Begin
     Alter Table VsCh0A Add Ch0A24_SJ VarChar(5)
     Set @TmpStr='Update VsCh0A Set Ch0A24_SJ=DBO.FormatDateTime(Ch0A24,''hh'+char(58)+'nn'') Where CHYear=''2012'''
     Exec(@TmpStr)
     Exec('Update VsCh0A Set Ch0A24=DBO.FormatDateTime(Ch0A24,''YYYY-MM-DD'') Where CHYear=''2012''')
   End
IF Col_Length('VsCh0A','Ch0A27_SJ') Is Null
   begin
     Alter Table VsCh0A Add Ch0A27_SJ VarChar(5)
     Set @TmpStr='Update VsCh0A Set Ch0A27_SJ=DBO.FormatDateTime(Ch0A27,''hh'+char(58)+'nn'') Where CHYear=''2012'''
     Exec(@TmpStr)
     Exec('Update VsCh0A Set Ch0A27=DBO.FormatDateTime(Ch0A27,''YYYY-MM-DD'') Where CHYear=''2012''')
   End

IF Col_Length('VsCh_PatientInfo','Ch0M24_SJ') Is Null
   Alter Table VsCh_PatientInfo Add Ch0M24_SJ VarChar(5)
IF Col_Length('VsCh_PatientInfo','Ch0M27_SJ') Is Null
   Alter Table VsCh_PatientInfo Add Ch0M27_SJ VarChar(5)
   
Alter Table VsZhdm Alter Column YHQK VarChar(10)

IF Col_Length('VsCh0A','Ch0ACH') Is Null
   Alter Table VsCh0A Add Ch0ACH VarChar(50)
IF Col_Length('VsCh_PatientInfo','Ch0MCH') Is Null
   Alter Table VsCh_PatientInfo Add Ch0MCH VarChar(50)

IF Col_Length('VsBaSet','VsBsIsShowCH0ACH') Is Null
   Alter Table VsBaSet Add VsBsIsShowCH0ACH Int

IF Col_Length('VsBaSet','VsBSCh0A77_UnEmpty') Is Null
   Alter Table VsBaSet Add VsBSCh0A77_UnEmpty Int

-- 存放自定义报表 取数据的SQL语句
if not exists(Select 1 From sysobjects where id=object_id('VsSelfRptSQL') and xtype = 'U')
CREATE TABLE [VsSelfRptSQL](
	[HospitolCode] [varchar](9) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[RptName] [varchar](200) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[PIdx] [varchar](50) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[PSQL] [text] COLLATE Chinese_PRC_CI_AS NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

IF Col_Length('VsTjzy_AD','Tjzy089') Is Null
   Alter Table VsTjzy_AD Add Tjzy089 Numeric(20,2)
If Not Exists(Select 1 From VsTjAdF Where Dm='Tjzy089')
   Insert Into VsTjAdF(Dm,Dmmc,Pym,WBM)
     Values('Tjzy089','平均住院费用','PJZYFY','GFWBXE') 

IF Col_Length('VsCh0A','Ch0ACH') Is Not Null
   Alter Table VsCh0A Alter Column Ch0ACH VarChar(500)
IF Col_Length('VsCh0A','Ch0ACI') Is Null
   Alter Table VsCh0A Add Ch0ACI Integer

IF Col_Length('VsCh_PatientInfo','Ch0MI3') Is Null
   Alter Table VsCh_PatientInfo Add Ch0MI3 Integer

--科室设置中增加分支机构支持
Exec('UPdate VsSoffice Set UnitCode=IsNull(UnitCode,-1)')

if not exists (select 1 from  sysobjects where  id = object_id('TETL_HospitalInfo') and   type = 'U')
   create table TETL_HospitalInfo (
     HospitalCode         varchar(9)           not null,
     UnitCode             int                  not null,
     HopitalName          varchar(200)         null,
     UnitName             varchar(200)         null,
     HISCompany           varchar(50)          null,
     HISVersion           varchar(50)          null,
     EMRCompany           varchar(50)          null,
     EMRVersion           varchar(50)          null,
     ReMark               varchar(1000)        null,
   constraint PK_TETL_HOSPITALINFO primary key (HospitalCode, UnitCode))

if not exists (select 1 from  sysobjects where  id = object_id('TETL_SQL') and type = 'U')
   create table TETL_SQL (
     HospitalCode         varchar(9)           not null,
     UnitCode             int                  not null,
     SQLKind              int                  not null,
     SQLText              text                 null,
     ConKind              int                  null,
     IsOldHIS             int                  null,
     SQLType              int                  null  -- 0 病案 1 统计
   constraint PK_TETL_SQL primary key (HospitalCode, UnitCode, SQLKind))

if not exists (select 1 from  sysobjects where  id = object_id('TETL_Config') and type = 'U')
   create table TETL_Config (
     HospitalCode         varchar(9)           not null,
     UnitCode             int                  not null,
     IsOldHIS             int                  not null,
     XX_Fy_Field          varchar(256)         null,
     IsReadICDIntoData    int                  null,
     ICDMapDm             int                  null,
     FyIsField            int                  null,
   constraint PK_TETL_CONFIG primary key (HospitalCode, UnitCode, IsOldHIS))

IF Col_Length('VsLkljsz','UnitCode') Is Null
   Begin
     Select * into tmp_VsLkljsz From VsLkljsz 
     Alter Table tmp_VsLkljsz Add UnitCode int
     Exec('Update tmp_VsLkljsz Set UnitCode=-1')
     Alter Table tmp_VsLkljsz alter column UnitCode int not Null
     Exec('Drop Table VsLkljsz')
     Exec('sp_rename ''tmp_VsLkljsz'', ''VsLkljsz'', ''OBJECT''')
     Exec('ALTER TABLE VsLkljsz ADD CONSTRAINT PK_VsLkljsz PRIMARY KEY CLUSTERED (LKbh,UnitCode) ON [PRIMARY]')
   End

IF Col_Length('VsHis_ItemTally','UnitCode') Is Null
   Begin
     Select ItemType,Item_Ba_Dm,Item_His_Dm,Item_Memo into tmp_VsHis_ItemTally From VsHis_ItemTally 
     Alter Table tmp_VsHis_ItemTally Add UnitCode int
     Exec('Update tmp_VsHis_ItemTally Set UnitCode=-1')
     Alter Table tmp_VsHis_ItemTally alter column UnitCode int not Null
     Exec('Drop Table VsHis_ItemTally')
     Exec('CREATE TABLE [VsHis_ItemTally] (
	[ItemID] [int] IDENTITY (1, 1) NOT NULL ,
	[ItemType] [varchar] (10) COLLATE Chinese_PRC_CI_AS NULL ,
	[Item_Ba_DM] [varchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[Item_His_DM] [varchar] (3000) COLLATE Chinese_PRC_CI_AS NULL ,
	[Item_Memo] [varchar] (250) COLLATE Chinese_PRC_CI_AS NULL ,
	[IsNew] [int] NULL ,
	[UnitCode] [int] NULL ,
	CONSTRAINT [PK_VsHis_ItemTally] PRIMARY KEY  CLUSTERED 
	(
		[ItemID]
	)  ON [PRIMARY] 
) ON [PRIMARY]')
     Exec('Insert VsHis_ItemTally(ItemType,Item_Ba_Dm,Item_His_Dm,Item_Memo, UnitCode)
             Select ItemType,Item_Ba_Dm,Item_His_Dm,Item_Memo, UnitCode From tmp_VsHis_ItemTally')
     Exec('Drop Table tmp_VsHis_ItemTally')
   End

if Col_Length('TETL_SQL','SQLType') Is Null
   Begin
     Alter Table TETL_SQL Add SQLType int Null
     Exec('Update TETL_SQL Set SQLType=0')
   End


/*==============================================================
   Drop Table VsBZRanger   病种条件设置                                        
==============================================================*/
if not exists (select 1 from  sysobjects where  id = object_id('VsBZRanger') and   type = 'U')
create table VsBZRanger (
   GUID                 varchar(50)          not null,
   BZTeam               varchar(100)         null,
   IsStop               int                  null,
   XH                   varchar(10)          null,
   ICDRanger            varchar(200)         null,
   ICCMRanger           varchar(200)         null,
   QTTJ                 varchar(200)         null,
   BZMC                 varchar(150)         null,
   AgeKind              int                  null,
   IsUser               int                  null,
   constraint PK_VSBZRANGER primary key (GUID)
)

IF Col_Length('VsDoctor','DKSDM') Is Null
   Alter Table VsDoctor Add DKSDM VarChar(20)

if Col_Length('VSSXZDJBZLYAQ_TJ', 'IsAll') is Null begin
  Drop Table VSSXZDJBZLYAQ_TJ
  CREATE TABLE VsSXZDJBZLYAQ_Tj(
	Ordinal int NOT NULL,
	EjOrdinal int NULL,
	SjOrdinal int NULL,
	JBMC varchar(200) COLLATE Chinese_PRC_CI_AS NULL,
	ICDQZFW varchar(200) COLLATE Chinese_PRC_CI_AS NULL,
	ICCMQZFW varchar(200) COLLATE Chinese_PRC_CI_AS NULL,
	IsCR int NULL,
	IsWBFZ int NULL,
	IsEJ int NULL,
    IsAll int NULL,
	FyOrdinal int NULL,
	IsSS int NULL,
	Ver int NOT NULL,
    FjTJ VarChar(5000) Null,
  CONSTRAINT PK_VSZDJBZLYAQ_TJ PRIMARY KEY (Ordinal, Ver)) 
end

--在综合表里增加年龄类别
IF Col_Length('VsZHDM','NLLB') Is Null
   Alter Table VsZHDM Add NLLB VarChar(10)

Update VsCH0A Set CH0A65=BmICD From (Select Bmm, BmICD From VsUseICD) T  Where CHYear>='2012' and CH0A38=Bmm and IsNull(CH0A65,'')<>BmICD

Update VsCh0A Set Ch0A53='1'
 Where ChYear>='2012' and Exists(Select 1 From VsCh0E e Where Ch0A01=Ch0E01 And VsCh0A.ChYear=e.ChYear) and IsNull(CH0A53,'')<>'1'
Update VsCh0A Set Ch0A53='2',CH0ACD='0'
 Where ChYear>='2012' and Not Exists(Select 1 From VsCh0E e Where Ch0A01=Ch0E01 And VsCh0A.ChYear=e.ChYear) and (IsNull(CH0A53,'')<>'2' or IsNull(CH0ACD,'')<>'0')

IF Col_Length('VsBaSet','VsBsIsShowCh0AH8') Is Null
   Alter Table VsBaSet Add VsBsIsShowCh0AH8 int
IF Col_Length('VsBaSet','VsBsIsShowCh0AH9') Is Null
   Alter Table VsBaSet Add VsBsIsShowCh0AH9 int
IF Col_Length('VsBaSet','VsBsIsShowCh0AHC') Is Null
   Alter Table VsBaSet Add VsBsIsShowCh0AHC int

IF Col_Length('VsCh0A','Ch0AH8') Is Null
   Alter Table VsCh0A Add Ch0AH8 int
IF Col_Length('VsCh0A','Ch0AH9') Is Null
   Alter Table VsCh0A Add Ch0AH9 VarChar(1)
IF Col_Length('VsCh0A','Ch0AHA') Is Null
   Alter Table VsCh0A Add Ch0AHA VarChar(1)
IF Col_Length('VsCh0A','Ch0AHB') Is Null
   Alter Table VsCh0A Add Ch0AHB VarChar(1)
IF Col_Length('VsCh0A','Ch0AHC') Is Null
   Alter Table VsCh0A Add Ch0AHC int
IF Col_Length('VsCh0A','Ch0AHD') Is Null
   Alter Table VsCh0A Add Ch0AHD int

IF Col_Length('VsZHDM','ZLFQ') Is Null
   Alter Table VsZHDM Add ZLFQ VarChar(20)

-- HQMS数据上报 用于保存网址 用户名及密码
if not exists (select 1 from  sysobjects where  id = object_id('VsHQMSLogin') and   type = 'U')
   create table VsHQMSLogin (
     sHttp                 varchar(500)         not null,
     sUserName             varchar(100)         null,
     sPassword             varchar(2000)        null,
     sTime                 varchar(10)          null,
     iMode                 int                  null,
     iICD                  int                  null,
     iICO                  int                  null
   constraint PK_VSHQMSLOGIN primary key (sHttp))
if Col_Length('VsHQMSLogin', 'sTime') Is Null
   Alter Table VsHQMSLogin Add sTime VarChar(10)
if Col_Length('VsHQMSLogin', 'iICD') Is Null
   Alter Table VsHQMSLogin Add iICD int
if Col_Length('VsHQMSLogin', 'iICO') Is Null
   Alter Table VsHQMSLogin Add iICO int   
if Col_Length('VsHQMSLogin', 'iSubDay') Is Null
   Alter Table VsHQMSLogin Add iSubDay int

if Not exists (select * from sysobjects where id = object_id(N'[VsXzqh_12]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
   begin
     CREATE TABLE [VsXzqh_12] (
	   [DM] [varchar] (6) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	   [Dmmc] [varchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	   [YZBM] [varchar] (6) COLLATE Chinese_PRC_CI_AS NULL ,
	   [PYM] [varchar] (10) COLLATE Chinese_PRC_CI_AS NULL ,
	   [WBM] [varchar] (10) COLLATE Chinese_PRC_CI_AS NULL ) ON [PRIMARY]
     ALTER TABLE [VsXzqh_12] WITH NOCHECK ADD CONSTRAINT [PK_VsXzqh_12] PRIMARY KEY  CLUSTERED ([DM]) ON [PRIMARY] 
   end
if Col_Length('VsXzqh_12','Sheng') Is Null
   Exec('Alter Table VsXzqh_12 Add Sheng VarChar(50)')
if Col_Length('VsXzqh_12','Shi') Is Null
   Exec('Alter Table VsXzqh_12 Add Shi VarChar(50)')
if Col_Length('VsXzqh_12','Xian') Is Null
   Exec('Alter Table VsXzqh_12 Add Xian VarChar(50)')
  
-- HQMS  数据上报增加字段
-- 医院感染总次数
if Col_Length('VsCH0A','CH0AQ1') Is Null begin
   Alter Table VsCH0A Add CH0AQ1 int
   Exec('Update VsCH0A Set CH0AQ1=1
          Where Exists(Select 1 From VsCH0C C Where VsCH0A.CHYear=C.CHYear and CH0A01=CH0C01 and ((C.CHYear<=''2011'' and CH0C02=8)or(C.CHYear=''2012'' and CH0C02=22)))')
end
if Col_Length('VsCH_PatientInfo','CH0MQ1') Is Null
   Alter Table VsCH_PatientInfo Add CH0MQ1 int


-- 过敏源
if Col_Length('VsCH0A','CH0AQ2') Is Null 
   Alter Table VsCH0A Add CH0AQ2 varchar(50)

if Col_Length('VsCH_PatientInfo','CH0MQ2') Is Null 
   Alter Table VsCH_PatientInfo Add CH0MQ2 varchar(50)   
if not exists (select 1 from  sysobjects where  id = object_id('VsZD_GMY') and   type = 'U') begin
   create table VsZD_GMY (
     Dm                 varchar(50)          not null,
     DmMc               varchar(100)         null,
   constraint PK_VsZD_GMY primary key (Dm))
End
-- 输血信息（自体回收）
if Col_Length('VsCH0H','CH0HN1') Is Null 
   Alter Table VsCH0H Add CH0HN1 money
if Col_Length('VsZhdm','ZGZDYJ') Is Null 
   Alter Table VsZhdm Add ZGZDYJ Varchar(50)
-- 最高诊断依据
if Col_Length('VsCH0A','CH0AQ3') Is Null 
   Alter Table VsCH0A Add CH0AQ3 int  
if Col_Length('VsCH_PatientInfo','CH0MQ3') Is Null
   Alter Table VsCH_PatientInfo Add CH0MQ3 int
if Col_Length('VsZhdm','FHCD') Is Null
   Alter Table VsZhdm Add FHCD Varchar(50)
-- 分化程度
if Col_Length('VsCH0A','CH0AQ4') Is Null 
   Alter Table VsCH0A Add CH0AQ4 int
if Col_Length('VsCH_PatientInfo','CH0MQ4') Is Null
   Alter Table VsCH_PatientInfo Add CH0MQ4 int
if Col_Length('VsZhdm','MZFJ') Is Null
   Alter Table VsZhdm Add MZFJ Varchar(50)
-- 麻醉分级
if Col_Length('VsCH0E','CH0EE2') Is Null 
   Alter Table VsCH0E Add CH0EE2 VarChar(1)
if Col_Length('VsCH_CH0E','CH0EE2') Is Null 
   Alter Table VsCH_CH0E Add CH0EE2 VarChar(50)   
-- 手术持续时间(单位小时)
if Col_Length('VsCH0E','CH0EE3') Is Null 
   Alter Table VsCH0E Add CH0EE3 int
if Col_Length('VsCH_CH0E','CH0EE3') Is Null 
   Alter Table VsCH_CH0E Add CH0EE3 int   
-- 手术部位
if Col_Length('VsCH0E','CH0EE4') Is Null 
   Alter Table VsCH0E Add CH0EE4 varchar(20)
if Col_Length('VsCH_CH0E','CH0EE4') Is Null 
   Alter Table VsCH_CH0E Add CH0EE4 varchar(200)   
--手术冰冻与石蜡
if Col_Length('VsCH0A','CH0AQ6') Is Null 
   Alter Table VsCH0A Add CH0AQ6 varchar(1)
if Col_Length('VsCH_PatientInfo','CH0MQ6') Is Null 
   Alter Table VsCH_PatientInfo Add CH0MQ6 varchar(1)
-- 手术部位字典
if not exists (select 1 from  sysobjects where  id = object_id('VsZD_SSBW') and   type = 'U')
   create table VsZD_SSBW (
     Dm                 varchar(20)          not null,
     DmMc               varchar(100)         null,
     SM                 varchar(50)          null,
     PYM                varchar(10)          null,
     WBM                varchar(10)          null,
   constraint PK_VSZD_SSBW primary key (Dm))
-- 重症监护类型字典
if not exists (select 1 from  sysobjects where  id = object_id('VsZD_ZZJH') and   type = 'U')
   create table VsZD_ZZJH (
     Dm                 varchar(20)          not null,
     DmMc               varchar(100)         null,
     constraint PK_VSZD_ZZJH primary key (Dm))
-- 重症监护记录
if not exists (select 1 from  sysobjects where  id = object_id('VsCH0O') and   type = 'U')
   create table VsCH0O (
     CHYear               varchar(4)          not null,
     CH0O01               varchar(50)         not null,
     CH0O02               int                 not null,
     CH0O03               varchar(50)         null,
     CH0O04               DateTime            null,
     CH0O05               DateTime            null,
   constraint PK_VSCH0O primary key (CHYear, CH0O01, CH0O02))
-- 重症监护记录中间表
if not exists (select 1 from  sysobjects where  id = object_id('VsCH_CH0O') and   type = 'U')
   create table VsCH_CH0O (
     CHYear               varchar(4)          not null,
     CH0O01               varchar(50)         not null,
     CH0O02               int                 not null,
     CH0O03               varchar(50)         null,
     CH0O04               DateTime            null,
     CH0O05               DateTime            null,
   constraint PK_VSCH_CH0O primary key (CHYear, CH0O01, CH0O02))

-- 标准麻醉码
if Col_Length('VsNarcosis','MZM') Is Null 
   Alter Table VsNarcosis Add MZM varchar(20)

if not exists (select 1 from  sysobjects where  id = object_id('VsZD_HQMSMZ') and   type = 'U')
   create table VsZD_HQMSMZ (
     Dm                 varchar(20)          not null,
     DmMc               varchar(100)         null,
   constraint PK_VSZD_HQMSMZ primary key (Dm))

-- 加长五表审核字段长度
if Col_Length('VsWT5_SH','TJ')<=250
  Alter Table VsWT5_SH Alter Column TJ varchar(2000)
--加长ICD字段长度，以适应北京临床版ICD库
Alter Table VsCh0A Alter Column Ch0A64 Varchar(20)
Alter Table VsCh0A Alter Column Ch0A65 Varchar(20)
Alter Table VsCh0A Alter Column Ch0A79 Varchar(20)
Alter Table VsCh0A Alter Column Ch0A77 Varchar(20)
Alter Table VsCh0C Alter Column Ch0C11 Varchar(20)
Alter Table VsCh0D Alter Column Ch0D07 Varchar(20)
Alter Table VsCh0F Alter Column Ch0F08 Varchar(20)

Alter Table VsCh_PatientInfo Alter Column Ch0M64 Varchar(20)
Alter Table VsCh_PatientInfo Alter Column Ch0M65 Varchar(20)
Alter Table VsCh_PatientInfo Alter Column Ch0M79 Varchar(20)
Alter Table VsCh_PatientInfo Alter Column Ch0M77 Varchar(20)
Alter Table VsCH_Ch0C Alter Column Ch0C11 Varchar(20)
Alter Table VsCH_Ch0D Alter Column Ch0D07 Varchar(20)
Alter Table VsCH_Ch0F Alter Column Ch0F08 Varchar(20)
Alter Table VsUseICD Alter Column BMICD Varchar(20)

if Col_Length('VsNarcosis','WTMZM') Is Null 
   Alter Table VsNarcosis Add WTMZM varchar(20)

if not exists (select 1 from  sysobjects where  id = object_id('VsZD_WTMZ') and   type = 'U')
   create table VsZD_WTMZ (
     Dm                 varchar(20)          not null,
     DmMc               varchar(100)         null,
   constraint PK_VSZD_WTMZ primary key (Dm))

-- 卫统四表国籍码
if Col_Length('VsNationality','StdDm') Is Null
  Alter Table VsNationality Add StdDm varchar(20)
--病案设置中增加麻醉分级，手术部位，手术持续时间
IF Col_Length('VsBaSet','VsBsIsShowCH0EE2') Is Null
   Begin
     Alter Table VsBaSet Add VsBsIsShowCH0EE2 VarChar(1)
     Exec('Update VsBaSet Set VsBsIsShowCH0EE2=0')
   End
IF Col_Length('VsBaSet','VsBsIsShowCH0EE3') Is Null
   Begin
     Alter Table VsBaSet Add VsBsIsShowCH0EE3 VarChar(1)
     Exec('Update VsBaSet Set VsBsIsShowCH0EE3=0')
   End
IF Col_Length('VsBaSet','VsBsIsShowCH0EE4') Is Null
   Begin
     Alter Table VsBaSet Add VsBsIsShowCH0EE4 VarChar(1)
     Exec('Update VsBaSet Set VsBsIsShowCH0EE4=0')
   End
--麻醉方式中增加停用标志
if Col_Length('VsNarcosis','IsTy') Is Null 
   begin
     Alter Table VsNarcosis Add IsTy int
     Exec('Update VsNarcosis Set IsTy=0')
   End 
--疾病与手术代码库选择，0 卫生部标准版，1 北京临床版
IF Col_Length('VsBaSet','VsJB_SSType') Is Null
   Begin
     Alter Table VsBaSet Add VsJB_SSType int
     Exec('Update VsBaSet Set VsJB_SSType=0')
   End
--在手术字典库中增加属性字段，用于标识是治疗性操作还是诊断性操作
IF Col_Length('VsUseICCM','SX') Is Null
   Begin
     Alter Table VsUseICCM Add SX VarChar(200)
     Exec('Update VsUseICCM Set SX=''''')
   End
-- 是否HQMS审核条件，用病案设置里的审核条件进行控制。
if Col_Length('VsWT5_SH','IsHQMS') Is Null
  Alter Table VsWT5_SH Add IsHQMS int
-- 审核时是否显示HQMS的审核结果
if Col_Length('VsBaset','VsBsIsShowHQMSSH') Is Null
  Alter Table VsBaset Add VsBsIsShowHQMSSH int 
--将年龄（月）改为小数位数
if Col_Length('VsCh0A','Ch0AN1') Is Not Null
  Alter Table VsCh0A Alter Column Ch0AN1 decimal(18, 2)
if Col_Length('VsCh_PatientInfo','Ch0MN1') Is Not Null
  Alter Table VsCh_PatientInfo Alter Column Ch0MN1 decimal(18, 2)

-- 损伤中毒2
if Col_Length('VsCh0A','Ch0AHH') Is Null
  Alter Table VsCh0A Add Ch0AHH varchar(10)
if Col_Length('VsCh_PatientInfo','Ch0MHH') Is Null
  Alter Table VsCh_PatientInfo Add Ch0MHH varchar(10)
-- 损伤中毒3
if Col_Length('VsCh0A','Ch0AHI') Is Null
  Alter Table VsCh0A Add Ch0AHI varchar(10)
if Col_Length('VsCh_PatientInfo','Ch0MHI') Is Null
  Alter Table VsCh_PatientInfo Add Ch0MHI varchar(10)
  
  
IF Col_Length('VsCH_PatientInfo','CH0MH8') Is Null
   Alter Table VsCH_PatientInfo Add CH0MH8 int
IF Col_Length('VsCH_PatientInfo','CH0MH9') Is Null
   Alter Table VsCH_PatientInfo Add CH0MH9 VarChar(1)
IF Col_Length('VsCH_PatientInfo','CH0MHA') Is Null
   Alter Table VsCH_PatientInfo Add CH0MHA VarChar(1)
IF Col_Length('VsCH_PatientInfo','CH0MHB') Is Null
   Alter Table VsCH_PatientInfo Add CH0MHB VarChar(1)
IF Col_Length('VsCH_PatientInfo','CH0MHC') Is Null
   Alter Table VsCH_PatientInfo Add CH0MHC int
IF Col_Length('VsCH_PatientInfo','CH0MHD') Is Null
   Alter Table VsCH_PatientInfo Add CH0MHD int

--该字段无任何意义，纯为了触发后台中间层的保存事件。  
If Col_Length('VsCh0A','EditCnt') Is Null
  Alter Table VsCh0A add EditCnt int
--增加损伤中毒唯一码字段
IF Col_Length('VsCh0A','Ch0ASS') Is Null
   Alter Table VsCh0A Add Ch0ASS VarChar(10)
IF Col_Length('VsCh_PatientInfo','Ch0MSS') Is Null
   Alter Table VsCh_PatientInfo Add Ch0MSS VarChar(10) 

-- 加入HQMS代码审核功能表
if Not exists (select * from sysobjects where id = object_id(N'[VsBZDMK]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
   Begin
     CREATE TABLE [VsBZDMK] (
	[DM] [varchar] (50) NOT NULL ,
	[DMMC] [varchar] (500)  NULL ,
        [VerKind] [int] not Null,  -- 0 全国版  1 北京版 2 通用
	[Kind] [int] not NULL,  -- 0 ICD 1 ICCM 2 形态学 3 损伤中毒
        [Property] [varchar] (50) Null,
        [FJM] [varchar] (20)  NULL ,
	[PYM] [varchar] (20)  NULL ,
	[WBM] [varchar] (20)  NULL  ) ON [PRIMARY]  
     ALTER TABLE [VsBZDMK] WITH NOCHECK ADD CONSTRAINT [PK_VSBZDMK] PRIMARY KEY  CLUSTERED ([DM],[VerKind],[Kind]) ON [PRIMARY] 
   End

-- 增加HQMS附页
if not exists (select 1 from  sysobjects where  id = object_id('VsHQMSFY') and   type = 'U')
Begin
/* VsHQMSFY     HQMS附页数据                             */
create table VsHQMSFY (
   Fy0A00               varchar(50)          not null,
   Fy0A01               varchar(50)          null,
   Fy0A02               int                  null,
   Fy0A03               varchar(100)         null,
   Fy0A04               int                  null,
   Fy0A05               int                  null,
   Fy0A06               int                  null,
   Fy0A07               int                  null,
   Fy0A08               int                  null,
   Fy0A09               int                  null,
   Fy0A10               varchar(20)          null,
   Fy0A11               varchar(20)          null,
   Fy0A12               varchar(20)          null,
   Fy0A13               varchar(20)          null,
   Fy0A14               Numeric(12,2)        null,
   Fy0A15               int                  null,
   Fy0A16               Money                null,
   Fy0A17               Money                null,
   Fy0A18               int                  null,
   Fy0A19               int                  null,
   Fy0A20               varchar(30)          null,
   Fy0A21               varchar(100)         null,
   Fy0A22               datetime             null,
   Fy0A23               varchar(100)         null,
   Fy0A24               varchar(100)         null,
   Fy0A25               varchar(100)         null,
   Fy0A26               varchar(100)         null,
   Fy0A27               varchar(100)         null,
   Fy0A28               varchar(100)         null,
   Fy0A29               varchar(100)         null,
   Fy0A30               int                  null,
   Fy0A31               int                  null,
   Fy0A32               int                  null,
   Fy0A33               int                  null,
   Fy0A34               int                  null,
   Fy0A35               int                  null,
   Fy0A36               int                  null,
   Fy0A37               int                  null,
   Fy0A38               int                  null,
   Fy0A39               int                  null,
   Fy0A40               int                  null,
   Fy0A41               int                  null,
   Fy0A42               int                  null,
   Fy0A43               varchar(40)          null,
   Fy0A44               int                  null,
   Fy0A45               varchar(30)          null,
   Ch0H02               Money                null,
   Ch0H03               Money                null,
   Ch0H04               Money                null,
   Ch0H05               Money                null,
   Ch0H06               Money                null,
   constraint PK_VSHQMSFY primary key (Fy0A00)
)
End

if  not  exists (select 1 from  sysobjects  where  id = object_id('VsHQMSFYZZ')   and   type = 'U')
begin
/*==============================================================*/
/* Table VsHQMSFYZZ    HQMS附页重症数据                        */
/*==============================================================*/
create table VsHQMSFYZZ (
   Fy0A00               varchar(50)          not null,
   ZzCode               int                  not null,
   ZzName               varchar(20)          null,
   ZzEnter              datetime             null,
   ZzOut                datetime             null,
   constraint PK_VSHQMSFYZZ primary key (Fy0A00, ZzCode)
)
end

if not exists (select 1 from  sysobjects  where  id = object_id('VsHQMSFYBL')  and   type = 'U')
Begin
/*==============================================================*/
/* Drop Table VsHQMSFYBL  HQMS附页病理数据                          */
/*==============================================================*/
create table VsHQMSFYBL (
   Fy0A00               varchar(50)          not null,
   Bl0A01               varchar(20)          null,
   Bl0A02               varchar(20)          null,
   Bl0A03               varchar(20)          null,
   Bl0A04               varchar(20)          null,
   Bl0A05               varchar(20)          null,
   Bl0A06               varchar(20)          null,
   constraint PK_VSHQMSFYBL primary key (Fy0A00)
)
End

if not exists (select 1 from  sysobjects where  id = object_id('VsHQMSFYSS') and   type = 'U')
Begin
/*==============================================================*/
/* Drop Table VsHQMSFYSS      HQMS附页手术数据                   */
/*==============================================================*/
create table VsHQMSFYSS (
   Fy0A00               varchar(50)          not null,
   SsCode               int                  not null,
   CH0EE4               varchar(4)           null,
   CH0EE3               int                  null,
   CH0EE2               int                  null,
   CH0E11               datetime             null,
   constraint PK_VSHQMSFYSS primary key (Fy0A00, SsCode)
)
End

if not exists (select 1 from  sysobjects where  id = object_id('VsHQMSFYZD')  and   type = 'U')
Begin
/*==============================================================*/
/* Table VsHQMSFYZD      HQMS附页字典数据                      */
/*==============================================================*/
create table VsHQMSFYZD (
   ZdCode               varchar(20)          not null,
   Zd0A01               varchar(100)         null,
   Zd0A02               varchar(10)          not null,
   Zd0A03               varchar(10)          null,
   Zd0A04               varchar(10)          null,
   constraint PK_VSHQMSFYZD primary key (ZdCode, Zd0A02)
)
End

if not exists (select 1 from  sysobjects where  id = object_id('VSHQMSFYPNLVIS') and   type = 'U')
Begin
/*==============================================================*/
/* Table VSHQMSFYPNLVIS     HQMS附页可见项目                   */
/*==============================================================*/
create table VSHQMSFYPNLVIS (
   VsHlts               int                  null,
   VsTz                 int                  null,
   VsQj                 int                  null,
   VsSz                 int                  null,
   VsSl                 int                  null,
   VsSx                 int                  null,
   VsRq                 int                  null,
   VsZd                 int                  null,
   VsZdfhqk             int                  null,
   VsHb                 int                  null
)
End

--最高诊断依据
IF Col_Length('vszhdm_12','ZGZDYJ') Is Null
   Alter Table vszhdm_12 Add ZGZDYJ varchar(50)
--分化层度
IF Col_Length('vszhdm_12','FHCD') Is Null
   Alter Table vszhdm_12 Add FHCD varchar(50)
--麻醉分级
IF Col_Length('vszhdm_12','Mzfj') Is Null
   Alter Table vszhdm_12 Add Mzfj varchar(50)

--分化层度
IF Col_Length('vszhdm_12','Jsyczbysj') Is Null
   Alter Table vszhdm_12 Add Jsyczbysj varchar(50)

--HQMS从医院电子病历中导入医生信息时发现医师编号字段长度超出范围，所增加字段长度
IF Col_Length('VsUser','UserCode')<=5 Begin
   Select * into tmp_VsUser From VsUser
   Alter Table tmp_VsUser Alter Column UserCode varchar(20) not Null   
   Drop Table VsUser
   EXECUTE sp_rename 'tmp_VsUser', 'VsUser'
   Exec('ALTER TABLE VsUser ADD CONSTRAINT PK_VsUser PRIMARY KEY CLUSTERED (UserCode) ON [PRIMARY]')
End

-- 山西附页
if not exists (select 1 from  sysobjects where  id = object_id('VsCH0P') and   type = 'U')
   begin
     create table VsCH0P(
       CHYear varchar(4) not null,
       CH0P01 varchar(50) not null,
       CH0P04 int,			--实施临床路径  sf
       CH0P05 varchar(50),		--临床路径病种名称
       CH0P06 int,			--单病种	sf
       CH0P07 int,			--危重病人 wzf
       CH0P08 int,			--病例讨论 yw
       CH0P09 int,			--住院患者压疮 yw
       CH0P10 int,			--术中异物遗留
       CH0P11 int,			--医源性气胸
       CH0P12 int,			--医源性意外穿刺伤
       CH0P13 int,			--医源性意外撕裂伤
       CH0P14 int,			--新生儿产伤
       CH0P15 int,			--医院内坠床
       CH0P16 int,			--医院内跌倒
       CH0P17 int,			--阴道分娩产妇产伤
       CH0P18 int,			--手术及麻醉并发症
       CH0P19 varchar(50)		--并发症名称
     CONSTRAINT PK_VSCH0P PRIMARY KEY  CLUSTERED (CHYear,CH0P01) ON [PRIMARY]) ON [PRIMARY]
   end
-- 山西附页_中间表
if not exists (select 1 from  sysobjects where  id = object_id('VsCH_CH0P') and   type = 'U')
   begin
     create table VsCH_CH0P(
       CHYear varchar(4) not null,
       CH0P01 varchar(50) not null,
       CH0P04 int,			--实施临床路径  sf
       CH0P05 varchar(50),		--临床路径病种名称
       CH0P06 int,			--单病种	sf
       CH0P07 int,			--危重病人 wzf
       CH0P08 int,			--病例讨论 yw
       CH0P09 int,			--住院患者压疮 yw
       CH0P10 int,			--术中异物遗留
       CH0P11 int,			--医源性气胸
       CH0P12 int,			--医源性意外穿刺伤
       CH0P13 int,			--医源性意外撕裂伤
       CH0P14 int,			--新生儿产伤
       CH0P15 int,			--医院内坠床
       CH0P16 int,			--医院内跌倒
       CH0P17 int,			--阴道分娩产妇产伤
       CH0P18 int,			--手术及麻醉并发症
       CH0P19 varchar(50)		--并发症名称
     CONSTRAINT PK_VsCH_CH0P PRIMARY KEY  CLUSTERED (CHYear,CH0P01) ON [PRIMARY]) ON [PRIMARY]
   end   
--山西首页 危重病人，已放到VsZhdm_12中   
IF Col_Length('vszhdm_12','SXWZ') Is Null
   Alter Table vszhdm_12 Add SXWZ varchar(4)

-- 并发症库（山西版附页用）
if Not exists (select * from sysobjects where id = object_id(N'[VsBFZK]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
   Begin
     CREATE TABLE [VsBFZK] (
	[DM] [varchar] (20) NOT NULL ,
	[DmMc] [varchar] (500) COLLATE Chinese_PRC_CI_AS NULL ,
	[PYM] [varchar] (10) COLLATE Chinese_PRC_CI_AS NULL ,
	[WBM] [varchar] (10) COLLATE Chinese_PRC_CI_AS NULL ,
	[Ty] [int]  NULL ) ON [PRIMARY]
     ALTER TABLE [VsBFZK] WITH NOCHECK ADD CONSTRAINT [PK_VsBFZK] PRIMARY KEY  CLUSTERED ([Dm]) ON [PRIMARY] 
   End
-- 单病种库（山西版附页用）
if Not exists (select * from sysobjects where id = object_id(N'[VsDBZK]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
   Begin
     CREATE TABLE [VsDBZK] (
	[DM] [varchar] (20) NOT NULL ,
	[DmMc] [varchar] (500) COLLATE Chinese_PRC_CI_AS NULL ,
	[PYM] [varchar] (10) COLLATE Chinese_PRC_CI_AS NULL ,
	[WBM] [varchar] (10) COLLATE Chinese_PRC_CI_AS NULL ,
	[Ty] [int]  NULL ) ON [PRIMARY]
     ALTER TABLE [VsDBZK] WITH NOCHECK ADD CONSTRAINT [PK_VsDBZK] PRIMARY KEY  CLUSTERED ([Dm]) ON [PRIMARY] 
   End
--添加山西省危重病人项
-- IF Col_Length('VsZHDM','SX_WZBR') Is Null  在上面已加入到 VsZhdm_12 中，所以此处应该删除
--    Alter Table VsZHDM Add SX_WZBR VarChar(20)

-- HQMS补报记录
if Not exists (select * from sysobjects where id = object_id(N'[VsHQMSSendLost]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
   Begin
     CREATE TABLE [VsHQMSSendLost] (
	[SendDate]  [DateTime] NOT NULL ,
	[SendStatu] [int]  NULL
     ) ON [PRIMARY]
     ALTER TABLE [VsHQMSSendLost] WITH NOCHECK ADD CONSTRAINT [PK_VsHQMSSendLost] PRIMARY KEY  CLUSTERED ([SendDate]) ON [PRIMARY] 
   End

-- 分化程度和最高诊断依据 在 VsZhdm中已经存在并且源码中使用的是 VsZhdm 中的 字段， 因此删除此两字段 -- ZMJ
if Col_Length('VsZhdm_12', 'FHCD')>0
  Alter Table VsZhdm_12 Drop Column FHCD
if Col_Length('VsZhdm_12', 'ZGZDYJ')>0
  Alter Table VsZhdm_12 Drop Column ZGZDYJ

-- 湖南版首页增加字段
-- A表
IF Col_Length('VsCH0A','CH0AHJ') Is Null  Alter Table VsCH0A Add [CH0AHJ] [varchar](2) NULL -- 病例分型 
IF Col_Length('VsCH0A','CH0AHK') Is Null  Alter Table VsCH0A Add [CH0AHK] [varchar](4) NULL -- 实施重症监护
IF Col_Length('VsCH0A','CH0AHL') Is Null  Alter Table VsCH0A Add [CH0AHL] int NULL          -- 监护总时间
IF Col_Length('VsCH0A','CH0AHM') Is Null  Alter Table VsCH0A Add [CH0AHM] [varchar](4) NULL -- 单病种管理
IF Col_Length('VsCH0A','CH0AHN') Is Null  Alter Table VsCH0A Add [CH0AHN] [varchar](20) NULL -- 实施临床路径管理
IF Col_Length('VsCH0A','CH0AHO') Is Null  Alter Table VsCH0A Add [CH0AHO] [varchar](20) NULL -- 实施DRG管理
IF Col_Length('VsCH0A','CH0AHP') Is Null  Alter Table VsCH0A Add [CH0AHP] [varchar](4) NULL -- 细菌培养标本送检
IF Col_Length('VsCH0A','CH0AHQ') Is Null  Alter Table VsCH0A Add [CH0AHQ] [varchar](8) NULL -- 法定传染病
IF Col_Length('VsCH0A','CH0AHR') Is Null  Alter Table VsCH0A Add [CH0AHR] [varchar](10) NULL -- 使用中医护理技术
IF Col_Length('VsCH0A','CH0AHS') Is Null  Alter Table VsCH0A Add [CH0AHS] int NULL -- 新生儿Apgar评分
IF Col_Length('VsCH0A','CH0AHT') Is Null  Alter Table VsCH0A Add [CH0AHT] int NULL -- 非药物中医治疗
-- 中间库
IF Col_Length('VsCH_PatientInfo','CH0MHJ') Is Null  Alter Table VsCH_PatientInfo Add [CH0MHJ] [varchar](2) NULL -- 病例分型 
IF Col_Length('VsCH_PatientInfo','CH0MHK') Is Null  Alter Table VsCH_PatientInfo Add [CH0MHK] [varchar](4) NULL -- 实施重症监护
IF Col_Length('VsCH_PatientInfo','CH0MHL') Is Null  Alter Table VsCH_PatientInfo Add [CH0MHL] int NULL          -- 监护总时间
IF Col_Length('VsCH_PatientInfo','CH0MHM') Is Null  Alter Table VsCH_PatientInfo Add [CH0MHM] [varchar](4) NULL -- 单病种管理
IF Col_Length('VsCH_PatientInfo','CH0MHN') Is Null  Alter Table VsCH_PatientInfo Add [CH0MHN] [varchar](20) NULL -- 实施临床路径管理
IF Col_Length('VsCH_PatientInfo','CH0MHO') Is Null  Alter Table VsCH_PatientInfo Add [CH0MHO] [varchar](20) NULL -- 实施DRG管理
IF Col_Length('VsCH_PatientInfo','CH0MHP') Is Null  Alter Table VsCH_PatientInfo Add [CH0MHP] [varchar](4) NULL -- 细菌培养标本送检
IF Col_Length('VsCH_PatientInfo','CH0MHQ') Is Null  Alter Table VsCH_PatientInfo Add [CH0MHQ] [varchar](8) NULL -- 法定传染病
IF Col_Length('VsCH_PatientInfo','CH0MHR') Is Null  Alter Table VsCH_PatientInfo Add [CH0MHR] [varchar](10) NULL -- 使用中医护理技术
IF Col_Length('VsCH_PatientInfo','CH0MHS') Is Null  Alter Table VsCH_PatientInfo Add [CH0MHS] int NULL -- 新生儿Apgar评分
IF Col_Length('VsCH_PatientInfo','CH0MHT') Is Null  Alter Table VsCH_PatientInfo Add [CH0MHT] int NULL -- 非药物中医治疗

-- VsZhdm_12
IF Col_Length('VsZhdm_12','BLFX') Is Null Alter Table VsZhdm_12 Add [BLFX] varchar(20) NULL           
-- IF Col_Length('VsZhdm_12','SSZZJH') Is Null  Alter Table VsZhdm_12 Add [SSZZJH] [varchar](20) NULL  
-- IF Col_Length('VsZhdm_12','DBZGL') Is Null    Alter Table VsZhdm_12 Add [DBZGL] [varchar](20) NULL             
IF Col_Length('VsZhdm_12','SSLCLJGL') Is Null  Alter Table VsZhdm_12 Add [SSLCLJGL] [varchar](20) NULL  
IF Col_Length('VsZhdm_12','SSDRGGL') Is Null    Alter Table VsZhdm_12 Add [SSDRGGL] [varchar](20) NULL            
-- IF Col_Length('VsZhdm_12','XJBBSJ') Is Null  Alter Table VsZhdm_12 Add [XJBBSJ] [varchar](20) NULL  
IF Col_Length('VsZhdm_12','FDCRB') Is Null    Alter Table VsZhdm_12 Add [FDCRB] [varchar](20) NULL            
IF Col_Length('VsZhdm_12','SYZYHLJS') Is Null  Alter Table VsZhdm_12 Add [SYZYHLJS] [varchar](20) NULL  
IF Col_Length('VsZhdm_12','CopyItem') Is Null            Alter Table VsZhdm_12 Add [CopyItem] [varchar](20) NULL    --复印内容         
IF Col_Length('VsZhdm_12','CopyUseFor') Is Null          Alter Table VsZhdm_12 Add [CopyUseFor] [varchar](20) NULL  --复印用途

-- 门诊病人明细
if Not exists (select * from sysobjects where id = object_id(N'[Vstjmz_mx]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
   Begin
	create table Vstjmz_mx (
		mzmxrq datetime not null,		--门诊日期
		mzmx01 varchar(20) not null,		--门诊ID
		mzmx02 varchar(20),		--患者姓名
		mzmx03 int,		--性别
		mzmx04 varchar(4),		--科别
		mzmx05 varchar(20),		--医师
		mzmx06 varchar(20),	 	--挂号类别01门诊0101专科0102专家02急诊
		TjMzKind int not null           --0门诊1诊疗组
		CONSTRAINT PK_Vstjmz_mx PRIMARY KEY  CLUSTERED 
		 (
			mzmxrq,
			mzmx01,
			TjMzKind 
		  )  ON [PRIMARY]
		) ON [PRIMARY]
   end

--HQMS 附页编辑可见项 增加控制
IF Col_Length('VSHQMSFYPNLVIS','VsBL') Is Null
   Alter Table VSHQMSFYPNLVIS Add VsBL int
IF Col_Length('VSHQMSFYPNLVIS','VsSSZD') Is Null
   Alter Table VSHQMSFYPNLVIS Add VsSSZD int

-- 增加云南版首页编辑内容
-- A表
IF Col_Length('VsCH0A','CH0AYN01') Is Null Alter Table VsCH0A Add [CH0AYN01] [int] NULL              --I类手术切口预防性应用抗菌药物
IF Col_Length('VsCH0A','CH0AYN02') Is Null Alter Table VsCH0A Add [CH0AYN02] [decimal](18, 1) NULL   --I类手术抗菌药物使用持续时间(小时）
IF Col_Length('VsCH0A','CH0AYN03') Is Null Alter Table VsCH0A Add [CH0AYN03] [int] NULL              --联合用药

IF Col_Length('VsCH0A','CH0AYN04') Is Null Alter Table VsCH0A Add [CH0AYN04] [int] NULL              --住院期间是否应用抗菌药物
IF Col_Length('VsCH0A','CH0AYN05') Is Null Alter Table VsCH0A Add [CH0AYN05] [decimal](18, 1) NULL   --住院期间抗菌药物使用持续时间(小时）
IF Col_Length('VsCH0A','CH0AYN06') Is Null Alter Table VsCH0A Add [CH0AYN06] [int] NULL              --联合用药

IF Col_Length('VsCH0A','CH0AYN07') Is Null Alter Table VsCH0A Add [CH0AYN07] [int] NULL              --是否完成临床路径
IF Col_Length('VsCH0A','CH0AYN08') Is Null Alter Table VsCH0A Add [CH0AYN08] [varchar](50) NULL      --退出原因
IF Col_Length('VsCH0A','CH0AYN09') Is Null Alter Table VsCH0A Add [CH0AYN09] [int] NULL              --是否变异
IF Col_Length('VsCH0A','CH0AYNAA') Is Null Alter Table VsCH0A Add [CH0AYNAA] [varchar](50) NULL      --变异原因

IF Col_Length('VsCH0A','CH0AYNA0') Is Null Alter Table VsCH0A Add [CH0AYNA0] [int] NULL              --住院期间是否出现危重
IF Col_Length('VsCH0A','CH0AYNA1') Is Null Alter Table VsCH0A Add [CH0AYNA1] [int] NULL              --距上一次住本院的时间
IF Col_Length('VsCH0A','CH0AYNA2') Is Null Alter Table VsCH0A Add [CH0AYNA2] [int] NULL              --上一次住本院与本次住院是否因同一疾病(主要诊断)

IF Col_Length('VsCH0A','CH0AYNA7') Is Null Alter Table VsCH0A Add [CH0AYNA7] [int] NULL              --是否有压疮
IF Col_Length('VsCH0A','CH0AYNA8') Is Null Alter Table VsCH0A Add [CH0AYNA8] [int] NULL              --压疮发生时间
IF Col_Length('VsCH0A','CH0AYNA9') Is Null Alter Table VsCH0A Add [CH0AYNA9] [int] NULL              --压疮分期 

IF Col_Length('VsCH0A','CH0AYNB0') Is Null Alter Table VsCH0A Add [CH0AYNB0] [int] NULL              --住院期间是否发生跌倒或坠床
IF Col_Length('VsCH0A','CH0AYNB1') Is Null Alter Table VsCH0A Add [CH0AYNB1] [int] NULL              --住院期间跌倒或坠床的伤害程度
IF Col_Length('VsCH0A','CH0AYNB2') Is Null Alter Table VsCH0A Add [CH0AYNB2] [int] NULL              --跌倒或坠床的原因

IF Col_Length('VsCH0A','CH0AYNB3') Is Null Alter Table VsCH0A Add [CH0AYNB3] [int] NULL              --住院期间是否使用物理约束
IF Col_Length('VsCH0A','CH0AYNB4') Is Null Alter Table VsCH0A Add [CH0AYNB4] [decimal](18, 1) NULL   --约束总时间
IF Col_Length('VsCH0A','CH0AYNB5') Is Null Alter Table VsCH0A Add [CH0AYNB5] [int] NULL              --约束方式
IF Col_Length('VsCH0A','CH0AYNB6') Is Null Alter Table VsCH0A Add [CH0AYNB6] [int] NULL              --约束工具 
IF Col_Length('VsCH0A','CH0AYNB7') Is Null Alter Table VsCH0A Add [CH0AYNB7] [int] NULL              --约束原因

IF Col_Length('VsCH0A','CH0AYNB8') Is Null Alter Table VsCH0A Add [CH0AYNB8] [int] NULL              --产科新生儿情况：离院方式
IF Col_Length('VsCH0A','CH0AYNB9') Is Null Alter Table VsCH0A Add [CH0AYNB9] [varchar](50) NULL      --重症监护室名称
IF Col_Length('VsCH0A','CH0AYNBA') Is Null Alter Table VsCH0A Add [CH0AYNBA] [int] NULL              --是否发生人工气道脱出

IF Col_Length('VsCH0A','CH0AYNC0') Is Null Alter Table VsCH0A Add [CH0AYNC0] [int] NULL              --是否非预期的重返重症医学科
IF Col_Length('VsCH0A','CH0AYNC1') Is Null Alter Table VsCH0A Add [CH0AYNC1] [int] NULL              --重返间隔时间
IF Col_Length('VsCH0A','CH0AYNC2') Is Null Alter Table VsCH0A Add [CH0AYNC2] [int] NULL              --手术及操作相关情况：是否发生围术期死亡
IF Col_Length('VsCH0A','CH0AYNC3') Is Null Alter Table VsCH0A Add [CH0AYNC3] [int] NULL              --是否发生术后猝死
-----中间表

IF Col_Length('VsCH_PatientInfo','CH0MYN01') Is Null Alter Table VsCH_PatientInfo Add [CH0MYN01] [int] NULL              --I类手术切口预防性应用抗菌药物
IF Col_Length('VsCH_PatientInfo','CH0MYN02') Is Null Alter Table VsCH_PatientInfo Add [CH0MYN02] [decimal](18, 1) NULL   --I类手术抗菌药物使用持续时间(小时）
IF Col_Length('VsCH_PatientInfo','CH0MYN03') Is Null Alter Table VsCH_PatientInfo Add [CH0MYN03] [int] NULL              --联合用药
IF Col_Length('VsCH_PatientInfo','CH0MYN04') Is Null Alter Table VsCH_PatientInfo Add [CH0MYN04] [int] NULL              --住院期间是否应用抗菌药物
IF Col_Length('VsCH_PatientInfo','CH0MYN05') Is Null Alter Table VsCH_PatientInfo Add [CH0MYN05] [decimal](18, 1) NULL   --住院期间抗菌药物使用持续时间(小时）
IF Col_Length('VsCH_PatientInfo','CH0MYN06') Is Null Alter Table VsCH_PatientInfo Add [CH0MYN06] [int] NULL              --联合用药
IF Col_Length('VsCH_PatientInfo','CH0MYN07') Is Null Alter Table VsCH_PatientInfo Add [CH0MYN07] [int] NULL              --是否完成临床路径
IF Col_Length('VsCH_PatientInfo','CH0MYN08') Is Null Alter Table VsCH_PatientInfo Add [CH0MYN08] [varchar](50) NULL      --退出原因
IF Col_Length('VsCH_PatientInfo','CH0MYN09') Is Null Alter Table VsCH_PatientInfo Add [CH0MYN09] [int] NULL              --是否变异
IF Col_Length('VsCH_PatientInfo','CH0MYNAA') Is Null Alter Table VsCH_PatientInfo Add [CH0MYNAA] [varchar](50) NULL      --变异原因
IF Col_Length('VsCH_PatientInfo','CH0MYNA0') Is Null Alter Table VsCH_PatientInfo Add [CH0MYNA0] [int] NULL              --住院期间是否出现危重
IF Col_Length('VsCH_PatientInfo','CH0MYNA1') Is Null Alter Table VsCH_PatientInfo Add [CH0MYNA1] [int] NULL              --距上一次住本院的时间
IF Col_Length('VsCH_PatientInfo','CH0MYNA2') Is Null Alter Table VsCH_PatientInfo Add [CH0MYNA2] [int] NULL              --上一次住本院与本次住院是否因同一疾病(主要诊断)
IF Col_Length('VsCH_PatientInfo','CH0MYNA7') Is Null Alter Table VsCH_PatientInfo Add [CH0MYNA7] [int] NULL              --是否有压疮
IF Col_Length('VsCH_PatientInfo','CH0MYNA8') Is Null Alter Table VsCH_PatientInfo Add [CH0MYNA8] [int] NULL              --压疮发生时间
IF Col_Length('VsCH_PatientInfo','CH0MYNA9') Is Null Alter Table VsCH_PatientInfo Add [CH0MYNA9] [int] NULL              --压疮分期 
IF Col_Length('VsCH_PatientInfo','CH0MYNB0') Is Null Alter Table VsCH_PatientInfo Add [CH0MYNB0] [int] NULL              --住院期间是否发生跌倒或坠床
IF Col_Length('VsCH_PatientInfo','CH0MYNB1') Is Null Alter Table VsCH_PatientInfo Add [CH0MYNB1] [int] NULL              --住院期间跌倒或坠床的伤害程度
IF Col_Length('VsCH_PatientInfo','CH0MYNB2') Is Null Alter Table VsCH_PatientInfo Add [CH0MYNB2] [VARCHAR](100) NULL              --跌倒或坠床的原因
IF Col_Length('VsCH_PatientInfo','CH0MYNB3') Is Null Alter Table VsCH_PatientInfo Add [CH0MYNB3] [int] NULL              --住院期间是否使用物理约束
IF Col_Length('VsCH_PatientInfo','CH0MYNB4') Is Null Alter Table VsCH_PatientInfo Add [CH0MYNB4] [decimal](18, 1) NULL   --约束总时间
IF Col_Length('VsCH_PatientInfo','CH0MYNB5') Is Null Alter Table VsCH_PatientInfo Add [CH0MYNB5] [int] NULL              --约束方式
IF Col_Length('VsCH_PatientInfo','CH0MYNB6') Is Null Alter Table VsCH_PatientInfo Add [CH0MYNB6] [int] NULL              --约束工具 
IF Col_Length('VsCH_PatientInfo','CH0MYNB7') Is Null Alter Table VsCH_PatientInfo Add [CH0MYNB7] [int] NULL              --约束原因
IF Col_Length('VsCH_PatientInfo','CH0MYNB8') Is Null Alter Table VsCH_PatientInfo Add [CH0MYNB8] [int] NULL              --产科新生儿情况：离院方式
IF Col_Length('VsCH_PatientInfo','CH0MYNB9') Is Null Alter Table VsCH_PatientInfo Add [CH0MYNB9] [varchar](50) NULL      --重症监护室名称
IF Col_Length('VsCH_PatientInfo','CH0MYNBA') Is Null Alter Table VsCH_PatientInfo Add [CH0MYNBA] [int] NULL              --是否发生人工气道脱出
IF Col_Length('VsCH_PatientInfo','CH0MYNC0') Is Null Alter Table VsCH_PatientInfo Add [CH0MYNC0] [int] NULL              --是否非预期的重返重症医学科
IF Col_Length('VsCH_PatientInfo','CH0MYNC1') Is Null Alter Table VsCH_PatientInfo Add [CH0MYNC1] [int] NULL              --重返间隔时间
IF Col_Length('VsCH_PatientInfo','CH0MYNC2') Is Null Alter Table VsCH_PatientInfo Add [CH0MYNC2] [int] NULL              --手术及操作相关情况：是否发生围术期死亡
IF Col_Length('VsCH_PatientInfo','CH0MYNC3') Is Null Alter Table VsCH_PatientInfo Add [CH0MYNC3] [int] NULL              --是否发生术后猝死

-- E表
IF Col_Length('VsCH0E','CH0EE5') Is Null Alter Table VsCH0E Add [CH0EE5] [int] NULL  --手术风险（NNIS）分级
IF Col_Length('VsCH0E','CH0EE6') Is Null Alter Table VsCH0E Add [CH0EE6] [int] NULL  --是否术前0.5-2小时内预防用抗菌药
IF Col_Length('VsCH0E','CH0EE7') Is Null Alter Table VsCH0E Add [CH0EE7] [int] NULL  --清洁手术围术期预防用抗菌药天数

IF Col_Length('VsCH0E','CH0EE8') Is Null Alter Table VsCH0E Add [CH0EE8] [int] NULL  --手术属于4个手术的第几列

IF Col_Length('VsCH0E','CH0EZ01') Is Null Alter Table VsCH0E Add [CH0EZ01] [int] NULL  --手后重症01 非预期的二次手术
IF Col_Length('VsCH0E','CH0EZ02') Is Null Alter Table VsCH0E Add [CH0EZ02] [int] NULL  --手后重症02 麻醉并发症
IF Col_Length('VsCH0E','CH0EZ03') Is Null Alter Table VsCH0E Add [CH0EZ03] [int] NULL  --手后重症03 术中异物遗留
IF Col_Length('VsCH0E','CH0EZ04') Is Null Alter Table VsCH0E Add [CH0EZ04] [int] NULL  --手后重症04 手术并发症
IF Col_Length('VsCH0E','CH0EZ05') Is Null Alter Table VsCH0E Add [CH0EZ05] [int] NULL  --手后重症05   术后出血或血肿
IF Col_Length('VsCH0E','CH0EZ06') Is Null Alter Table VsCH0E Add [CH0EZ06] [int] NULL  --手后重症06   手术伤口裂开
IF Col_Length('VsCH0E','CH0EZ07') Is Null Alter Table VsCH0E Add [CH0EZ07] [int] NULL  --手后重症07   术后深静脉血栓
IF Col_Length('VsCH0E','CH0EZ08') Is Null Alter Table VsCH0E Add [CH0EZ08] [int] NULL  --手后重症08   术后生理/代谢紊乱
IF Col_Length('VsCH0E','CH0EZ09') Is Null Alter Table VsCH0E Add [CH0EZ09] [int] NULL  --手后重症09   术后呼吸衰竭
IF Col_Length('VsCH0E','CH0EZ10') Is Null Alter Table VsCH0E Add [CH0EZ10] [int] NULL  --手后重症10   术后肺栓塞
IF Col_Length('VsCH0E','CH0EZ11') Is Null Alter Table VsCH0E Add [CH0EZ11] [int] NULL  --手后重症11   术后败血症
IF Col_Length('VsCH0E','CH0EZ12') Is Null Alter Table VsCH0E Add [CH0EZ12] [int] NULL  --手后重症12   术后髋关节骨折


---中间表
IF Col_Length('VsCH_CH0E','CH0EE5') Is Null Alter Table VsCH_CH0E Add [CH0EE5] [int] NULL  --手术风险（NNIS）分级
IF Col_Length('VsCH_CH0E','CH0EE6') Is Null Alter Table VsCH_CH0E Add [CH0EE6] [int] NULL  --是否术前0.5-2小时内预防用抗菌药
IF Col_Length('VsCH_CH0E','CH0EE7') Is Null Alter Table VsCH_CH0E Add [CH0EE7] [int] NULL  --清洁手术围术期预防用抗菌药天数

IF Col_Length('VsCH_CH0E','CH0EE8') Is Null Alter Table VsCH_CH0E Add [CH0EE8] [int] NULL  --手术属于4个手术的第几列

IF Col_Length('VsCH_CH0E','CH0EZ01') Is Null Alter Table VsCH_CH0E Add [CH0EZ01] [int] NULL  --手后重症01 非预期的二次手术
IF Col_Length('VsCH_CH0E','CH0EZ02') Is Null Alter Table VsCH_CH0E Add [CH0EZ02] [int] NULL  --手后重症02 麻醉并发症
IF Col_Length('VsCH_CH0E','CH0EZ03') Is Null Alter Table VsCH_CH0E Add [CH0EZ03] [int] NULL  --手后重症03 术中异物遗留
IF Col_Length('VsCH_CH0E','CH0EZ04') Is Null Alter Table VsCH_CH0E Add [CH0EZ04] [int] NULL  --手后重症04 手术并发症
IF Col_Length('VsCH_CH0E','CH0EZ05') Is Null Alter Table VsCH_CH0E Add [CH0EZ05] [int] NULL  --手后重症05   术后出血或血肿
IF Col_Length('VsCH_CH0E','CH0EZ06') Is Null Alter Table VsCH_CH0E Add [CH0EZ06] [int] NULL  --手后重症06   手术伤口裂开
IF Col_Length('VsCH_CH0E','CH0EZ07') Is Null Alter Table VsCH_CH0E Add [CH0EZ07] [int] NULL  --手后重症07   术后深静脉血栓
IF Col_Length('VsCH_CH0E','CH0EZ08') Is Null Alter Table VsCH_CH0E Add [CH0EZ08] [int] NULL  --手后重症08   术后生理/代谢紊乱
IF Col_Length('VsCH_CH0E','CH0EZ09') Is Null Alter Table VsCH_CH0E Add [CH0EZ09] [int] NULL  --手后重症09   术后呼吸衰竭
IF Col_Length('VsCH_CH0E','CH0EZ10') Is Null Alter Table VsCH_CH0E Add [CH0EZ10] [int] NULL  --手后重症10   术后肺栓塞
IF Col_Length('VsCH_CH0E','CH0EZ11') Is Null Alter Table VsCH_CH0E Add [CH0EZ11] [int] NULL  --手后重症11   术后败血症
IF Col_Length('VsCH_CH0E','CH0EZ12') Is Null Alter Table VsCH_CH0E Add [CH0EZ12] [int] NULL  --手后重症12   术后髋关节骨折

-- VsZhdm_12表
IF Col_Length('VsZhdm_12','YZ') Is Null            Alter Table VsZhdm_12 Add [YZ] [varchar](10) NULL              
IF Col_Length('VsZhdm_12','YZFQ') Is Null          Alter Table VsZhdm_12 Add [YZFQ] [varchar](10) NULL  
IF Col_Length('VsZhdm_12','BedSH') Is Null         Alter Table VsZhdm_12 Add [BedSH] [varchar](10) NULL             
IF Col_Length('VsZhdm_12','FallBedReason') Is Null Alter Table VsZhdm_12 Add [FallBedReason] [varchar](20) NULL              
IF Col_Length('VsZhdm_12','YSFS') Is Null          Alter Table VsZhdm_12 Add [YSFS] [varchar](10) NULL  
IF Col_Length('VsZhdm_12','YSGJ') Is Null          Alter Table VsZhdm_12 Add [YSGJ] [varchar](10) NULL  
IF Col_Length('VsZhdm_12','YSReason') Is Null      Alter Table VsZhdm_12 Add [YSReason] [varchar](10) NULL              
IF Col_Length('VsZhdm_12','NewLysf') Is Null       Alter Table VsZhdm_12 Add [NewLysf] [varchar](10) NULL  
IF Col_Length('VsZhdm_12','CFJGSJ') Is Null        Alter Table VsZhdm_12 Add [CFJGSJ] [varchar](10) NULL  
IF Col_Length('VsZhdm_12','NNIS') Is Null          Alter Table VsZhdm_12 Add [NNIS] [varchar](4) NULL              
IF Col_Length('VsZhdm_12','AfterSick') Is Null     Alter Table VsZhdm_12 Add [AfterSick] [varchar](20) NULL  


----------------------------------武汉科技大学附属天佑医院病案附页--------------------------------------------------------------------
-----------A表
IF Col_Length('VsCH0A','CH0ATY01') Is Null Alter Table VsCH0A Add [CH0ATY01] [int] NULL              --抗菌药物患者病原学检查送检
IF Col_Length('VsCH0A','CH0ATY02') Is Null Alter Table VsCH0A Add [CH0ATY02] [int] NULL              --清洁手术前0.5-2小时内给药
IF Col_Length('VsCH0A','CH0ATY03') Is Null Alter Table VsCH0A Add [CH0ATY03] [int] NULL              --联合用药
IF Col_Length('VsCH0A','CH0ATY04') Is Null Alter Table VsCH0A Add [CH0ATY04] [int] NULL              --髋关节置换术前0.5-2小时内给药
IF Col_Length('VsCH0A','CH0ATY05') Is Null Alter Table VsCH0A Add [CH0ATY05] [int] NULL              --膝关节置换术前0.5-2小时内给药
IF Col_Length('VsCH0A','CH0ATY06') Is Null Alter Table VsCH0A Add [CH0ATY06] [int] NULL              --子宫肌瘤切除术前0.5-2小时内给药
IF col_length('VsCH0A','CH0ATY07') Is NULL ALTER TABLE VsCH0A ADD[CH0ATY07]  [Int] NULL              --手术相关医院感染
IF col_length('VsCH0A','CH0ATY08') Is NULL ALTER TABLE VsCH0A ADD[CH0ATY08]  [Int] NULL              --血液透析
IF col_length('VsCH0A','CH0ATY09') Is NULL ALTER TABLE VsCH0A ADD[CH0ATY09]  [Int] NULL              --与血液透析相关感染
IF col_length('VsCH0A','CH0ATY10') Is NULL ALTER TABLE VsCH0A ADD[CH0ATY10]  [Int] NULL              --单病种质量管理与费用控制病种
IF col_length('VsCH0A','CH0ATY11') Is NULL ALTER TABLE VsCH0A ADD[CH0ATY11]  [Int] NULL              --纳入质控
IF col_length('VsCH0A','CH0ATY12') Is NULL ALTER TABLE VsCH0A ADD[CH0ATY12]  [varchar](50) NULL              --未纳入原因
IF col_length('VsCH0A','CH0ATY13') Is NULL ALTER TABLE VsCH0A ADD[CH0ATY13]  [Int] NULL              --是否发生围术期死亡
IF col_length('VsCH0A','CH0ATY14') Is NULL ALTER TABLE VsCH0A ADD[CH0ATY14]  [Int] NULL              --是否发生术后猝死
IF col_length('VsCH0A','CH0ATY15') Is NULL ALTER TABLE VsCH0A ADD[CH0ATY15]  [Int] NULL              --输血反应
IF col_length('VsCH0A','CH0ATY16') Is NULL ALTER TABLE VsCH0A ADD[CH0ATY16]  [Int] NULL              --输液反应 
IF col_length('VsCH0A','CH0ATY17') Is NULL ALTER TABLE VsCH0A ADD[CH0ATY17]  [Int] NULL              --肺部感染 
IF col_length('VsCH0A','CH0ATY18') Is NULL ALTER TABLE VsCH0A ADD[CH0ATY18]  [Int] NULL              --距上一次住本院时间 
IF col_length('VsCH0A','CH0ATY19') Is NULL ALTER TABLE VsCH0A ADD[CH0ATY19]  [Int] NULL              --上一次住本院与本次住院是否因同一疾病(主要诊断) 
IF col_length('VsCH0A','CH0ATY20') Is NULL ALTER TABLE VsCH0A ADD[CH0ATY20]  [Int] NULL              ---发生医源性气胸
IF col_length('VsCH0A','CH0ATY21') Is NULL ALTER TABLE VsCH0A ADD[CH0ATY21]  [Int] NULL              ---发生医源性意外穿刺伤或撕裂伤
IF col_length('VsCH0A','CH0ATY22') Is NULL ALTER TABLE VsCH0A ADD[CH0ATY22]  [Int] NULL              ---手术部位感染

----------中间表
IF Col_Length('VsCH_PatientInfo','CH0MTY01') Is Null  Alter Table VsCH_PatientInfo Add [CH0MTY01] [int] NULL --抗菌药物患者病原学检查送检
IF Col_Length('VsCH_PatientInfo','CH0MTY02') Is Null  Alter Table VsCH_PatientInfo Add [CH0MTY02] [int] NULL --清洁手术前0.5-2小时内给药
IF Col_Length('VsCH_PatientInfo','CH0MTY03') Is Null  Alter Table VsCH_PatientInfo Add [CH0MTY03] [int] NULL --联合用药
IF Col_Length('VsCH_PatientInfo','CH0MTY04') Is Null  Alter Table VsCH_PatientInfo Add [CH0MTY04] [int] NULL --髋关节置换术前0.5-2小时内给药
IF Col_Length('VsCH_PatientInfo','CH0MTY05') Is Null  Alter Table VsCH_PatientInfo Add [CH0MTY05] [int] NULL --膝关节置换术前0.5-2小时内给药
IF Col_Length('VsCH_PatientInfo','CH0MTY06') Is Null  Alter Table VsCH_PatientInfo Add [CH0MTY06] [int] NULL --子宫肌瘤切除术前0.5-2小时内给药
IF Col_Length('VsCH_PatientInfo','CH0MTY07') Is Null  Alter Table VsCH_PatientInfo Add [CH0MTY07] [int] NULL --手术相关医院感染
IF Col_Length('VsCH_PatientInfo','CH0MTY08') Is Null  Alter Table VsCH_PatientInfo Add [CH0MTY08] [int] NULL --血液透析
IF Col_Length('VsCH_PatientInfo','CH0MTY09') Is Null  Alter Table VsCH_PatientInfo Add [CH0MTY09] [int] NULL --与血液透析相关感染
IF Col_Length('VsCH_PatientInfo','CH0MTY10') Is Null  Alter Table VsCH_PatientInfo Add [CH0MTY10] [int] NULL --单病种质量管理与费用控制病种
IF Col_Length('VsCH_PatientInfo','CH0MTY11') Is Null  Alter Table VsCH_PatientInfo Add [CH0MTY11] [int] NULL --纳入质控
IF Col_Length('VsCH_PatientInfo','CH0MTY12') Is Null  Alter Table VsCH_PatientInfo Add [CH0MTY12] [varchar](50) NULL --未纳入原因
IF Col_Length('VsCH_PatientInfo','CH0MTY13') Is Null  Alter Table VsCH_PatientInfo Add [CH0MTY13] [int] NULL --是否发生围术期死亡
IF Col_Length('VsCH_PatientInfo','CH0MTY14') Is Null  Alter Table VsCH_PatientInfo Add [CH0MTY14] [int] NULL --是否发生术后猝死
IF Col_Length('VsCH_PatientInfo','CH0MTY15') Is Null  Alter Table VsCH_PatientInfo Add [CH0MTY15] [int] NULL --输血反应
IF Col_Length('VsCH_PatientInfo','CH0MTY16') Is Null  Alter Table VsCH_PatientInfo Add [CH0MTY16] [int] NULL --输液反应 
IF Col_Length('VsCH_PatientInfo','CH0MTY17') Is Null  Alter Table VsCH_PatientInfo Add [CH0MTY17] [int] NULL --肺部感染
IF Col_Length('VsCH_PatientInfo','CH0MTY18') Is Null  Alter Table VsCH_PatientInfo Add [CH0MTY18] [int] NULL --距上一次住本院时间 
IF Col_Length('VsCH_PatientInfo','CH0MTY19') Is Null  Alter Table VsCH_PatientInfo Add [CH0MTY19] [int] NULL --上一次住本院与本次住院是否因同一疾病(主要诊断) 
IF Col_Length('VsCH_PatientInfo','CH0MTY20') Is Null  Alter Table VsCH_PatientInfo Add [CH0MTY20] [int] NULL --发生医源性气胸  
IF Col_Length('VsCH_PatientInfo','CH0MTY21') Is Null  Alter Table VsCH_PatientInfo Add [CH0MTY21] [int] NULL --发生医源性意外穿刺伤或撕裂伤  
IF Col_Length('VsCH_PatientInfo','CH0MTY22') Is Null  Alter Table VsCH_PatientInfo Add [CH0MTY22] [int] NULL --手术部位感染  




-----------E表
IF Col_Length('VsCH0E','CH0EZ13') Is Null Alter Table VsCH0E Add [CH0EZ13] [int] NULL              --是否为重返手术室再手术
IF Col_Length('VsCH0E','CH0EZ14') Is Null Alter Table VsCH0E Add [CH0EZ14] [int] NULL              --再手术死亡
IF Col_Length('VsCH0E','CH0EZ15') Is Null Alter Table VsCH0E Add [CH0EZ15] [int] NULL              --进行PCI后同一天进行CABG手术
IF Col_Length('VsCH0E','CH0EZ16') Is Null Alter Table VsCH0E Add [CH0EZ16] [int] NULL              --术后骨折
IF Col_Length('VsCH0E','CH0EZ17') Is Null Alter Table VsCH0E Add [CH0EZ17] [int] NULL              --术后肺部感染
IF Col_Length('VsCH0E','CH0EZ18') Is Null Alter Table VsCH0E Add [CH0EZ18] [int] NULL              --术后人工气道脱出
IF Col_Length('VsCH0E','CH0EZ19') Is Null Alter Table VsCH0E Add [CH0EZ19] [int] NULL              --进行PCI

----中间表                                                                                       
IF Col_Length('VsCH_CH0E','CH0EZ13') Is Null Alter Table VsCH_CH0E Add CH0EZ13 int NULL			   --是否为重返手术室再手术
IF Col_Length('VsCH_CH0E','CH0EZ14') Is Null Alter Table VsCH_CH0E Add CH0EZ14 int NULL			   --再手术死亡
IF Col_Length('VsCH_CH0E','CH0EZ15') Is Null Alter Table VsCH_CH0E Add CH0EZ15 int NULL			   --进行PCI后同一天进行CABG手术
IF Col_Length('VsCH_CH0E','CH0EZ16') Is Null Alter Table VsCH_CH0E Add CH0EZ16 int NULL			   --术后骨折
IF Col_Length('VsCH_CH0E','CH0EZ17') Is Null Alter Table VsCH_CH0E Add CH0EZ17 int NULL			   --术后肺部感染
IF Col_Length('VsCH_CH0E','CH0EZ18') Is Null Alter Table VsCH_CH0E Add CH0EZ18 int NULL			   --术后人工气道脱出
IF Col_Length('VsCH_CH0E','CH0EZ19') Is Null Alter Table VsCH_CH0E Add CH0EZ19 int NULL			   --进行PCI

-----VsCh0R表
IF Col_Length('VsCh0R','CH0R10') Is Null Alter Table VsCh0R Add [CH0R10] [int] NULL                --是否发生人工气道脱出
IF Col_Length('VsCh0R','CH0R11') Is Null Alter Table VsCh0R Add [CH0R11] [int] NULL                --是否非预期的重返重症医学科
IF Col_Length('VsCh0R','CH0R12') Is Null Alter Table VsCh0R Add [CH0R12] [int] NULL                --重返间隔时间
IF Col_Length('VsCh0R','CH0R13') Is Null Alter Table VsCh0R Add [CH0R13] [int] NULL                --ICU死亡
IF Col_Length('VsCh0R','CH0R14') Is Null Alter Table VsCh0R Add [CH0R14] [int] NULL                --使用中静脉导管日数
IF Col_Length('VsCh0R','CH0R15') Is Null Alter Table VsCh0R Add [CH0R15] [int] NULL                --是否发生与中心静脉置管相关血液感染
IF Col_Length('VsCh0R','CH0R16') Is Null Alter Table VsCh0R Add [CH0R16] [int] NULL                --使用呼吸机日数
IF Col_Length('VsCh0R','CH0R17') Is Null Alter Table VsCh0R Add [CH0R17] [int] NULL                --是否发生与呼吸机相关肺炎感染
IF Col_Length('VsCh0R','CH0R18') Is Null Alter Table VsCh0R Add [CH0R18] [int] NULL                --使用留置导尿管日数
IF Col_Length('VsCh0R','CH0R19') Is Null Alter Table VsCh0R Add [CH0R19] [int] NULL                --是否发生与留置导尿管相关泌尿系统感染


-----中间表
IF Col_Length('VSCH_CH0R','CH0R10') Is NULL ALTER TABLE VSCH_CH0R ADD [CH0R10] [Int] NULL        --是否发生人工气道脱出
IF Col_Length('VSCH_CH0R','CH0R11') Is NULL ALTER TABLE VSCH_CH0R ADD [CH0R11] [Int] NULL        --是否非预期的重返重症医学科
IF Col_Length('VSCH_CH0R','CH0R12') Is NULL ALTER TABLE VSCH_CH0R ADD [CH0R12] [Int] NULL        --重返间隔时间
IF Col_Length('VSCH_CH0R','CH0R13') Is NULL ALTER TABLE VSCH_CH0R ADD [CH0R13] [Int] NULL        --ICU死亡
IF Col_Length('VSCH_CH0R','CH0R14') Is NULL ALTER TABLE VSCH_CH0R ADD [CH0R14] [Int] NULL        --使用中静脉导管日数
IF Col_Length('VSCH_CH0R','CH0R15') Is NULL ALTER TABLE VSCH_CH0R ADD [CH0R15] [Int] NULL        --是否发生与中心静脉置管相关血液感染
IF Col_Length('VSCH_CH0R','CH0R16') Is NULL ALTER TABLE VSCH_CH0R ADD [CH0R16] [Int] NULL        --使用呼吸机日数
IF Col_Length('VSCH_CH0R','CH0R17') Is NULL ALTER TABLE VSCH_CH0R ADD [CH0R17] [Int] NULL        --是否发生与呼吸机相关肺炎感染
IF Col_Length('VSCH_CH0R','CH0R18') Is NULL ALTER TABLE VSCH_CH0R ADD [CH0R18] [Int] NULL        --使用留置导尿管日数
IF Col_Length('VSCH_CH0R','CH0R19') Is NULL ALTER TABLE VSCH_CH0R ADD [CH0R19] [Int] NULL        --是否发生与留置导尿管相关泌尿系统感染

-------------------------------------新生儿-------------------------------
IF Col_Length('VsWt47_1','FM_SC1') Is NULL ALTER TABLE VsWt47_1 ADD [FM_SC1] [Int] NULL        --身长
IF Col_Length('VsWt47_1','FM_Weight1') Is NULL ALTER TABLE VsWt47_1 ADD [FM_Weight1] [Int] NULL        --体重
IF Col_Length('VsWt47_1','FM_JB1') Is NULL ALTER TABLE VsWt47_1 ADD [FM_JB1] [varchar](20) NULL        --疾病
IF Col_Length('VsWt47_1','FM_SWRQ1') Is NULL ALTER TABLE VsWt47_1 ADD [FM_SWRQ1] [datetime] NULL        --死亡日期
IF Col_Length('VsWt47_1','FM_SWYY1') Is NULL ALTER TABLE VsWt47_1 ADD [FM_SWYY1] [VARCHAR](50) NULL        --死亡原因
IF Col_Length('VsWt47_1','FM_YYGR1') Is NULL ALTER TABLE VsWt47_1 ADD [FM_YYGR1] [Int] NULL        --是否发生医院感染
IF Col_Length('VsWt47_1','FM_CYQK1') Is NULL ALTER TABLE VsWt47_1 ADD [FM_CYQK1] [varchar](50) NULL        --出院情况
IF Col_Length('VsWt47_1','FM_CSRQ1') Is NULL ALTER TABLE VsWt47_1 ADD [FM_CSRQ1] [DATETIME] NULL        --出生日期

IF Col_Length('VsWt47_1','FM_SC2') Is NULL ALTER TABLE VsWt47_1 ADD [FM_SC2] [Int] NULL        --身长
IF Col_Length('VsWt47_1','FM_Weight2') Is NULL ALTER TABLE VsWt47_1 ADD [FM_Weight2] [Int] NULL        --体重
IF Col_Length('VsWt47_1','FM_JB2') Is NULL ALTER TABLE VsWt47_1 ADD [FM_JB2] [varchar](20) NULL        --疾病
IF Col_Length('VsWt47_1','FM_SWRQ2') Is NULL ALTER TABLE VsWt47_1 ADD [FM_SWRQ2] [datetime] NULL        --死亡日期
IF Col_Length('VsWt47_1','FM_SWYY2') Is NULL ALTER TABLE VsWt47_1 ADD [FM_SWYY2] [VARCHAR](50) NULL        --死亡原因
IF Col_Length('VsWt47_1','FM_YYGR2') Is NULL ALTER TABLE VsWt47_1 ADD [FM_YYGR2] [Int] NULL        --是否发生医院感染
IF Col_Length('VsWt47_1','FM_CYQK2') Is NULL ALTER TABLE VsWt47_1 ADD [FM_CYQK2] [varchar](50) NULL        --出院情况
IF Col_Length('VsWt47_1','FM_CSRQ2') Is NULL ALTER TABLE VsWt47_1 ADD [FM_CSRQ2] [DATETIME] NULL        --出生日期

IF Col_Length('VsWt47_1','FM_SC3') Is NULL ALTER TABLE VsWt47_1 ADD [FM_SC3] [Int] NULL        --身长
IF Col_Length('VsWt47_1','FM_Weight3') Is NULL ALTER TABLE VsWt47_1 ADD [FM_Weight3] [Int] NULL        --体重
IF Col_Length('VsWt47_1','FM_JB3') Is NULL ALTER TABLE VsWt47_1 ADD [FM_JB3] [varchar](20) NULL        --疾病
IF Col_Length('VsWt47_1','FM_SWRQ3') Is NULL ALTER TABLE VsWt47_1 ADD [FM_SWRQ3] [datetime] NULL        --死亡日期
IF Col_Length('VsWt47_1','FM_SWYY3') Is NULL ALTER TABLE VsWt47_1 ADD [FM_SWYY3] [VARCHAR](50) NULL        --死亡原因
IF Col_Length('VsWt47_1','FM_YYGR3') Is NULL ALTER TABLE VsWt47_1 ADD [FM_YYGR3] [Int] NULL        --是否发生医院感染
IF Col_Length('VsWt47_1','FM_CYQK3') Is NULL ALTER TABLE VsWt47_1 ADD [FM_CYQK3] [varchar](50) NULL        --出院情况
IF Col_Length('VsWt47_1','FM_CSRQ3') Is NULL ALTER TABLE VsWt47_1 ADD [FM_CSRQ3] [DATETIME] NULL        --出生日期

IF Col_Length('VsWt47_1','FM_SC4') Is NULL ALTER TABLE VsWt47_1 ADD [FM_SC4] [Int] NULL        --身长
IF Col_Length('VsWt47_1','FM_Weight4') Is NULL ALTER TABLE VsWt47_1 ADD [FM_Weight4] [Int] NULL        --体重
IF Col_Length('VsWt47_1','FM_JB4') Is NULL ALTER TABLE VsWt47_1 ADD [FM_JB4] [varchar](20) NULL        --疾病
IF Col_Length('VsWt47_1','FM_SWRQ4') Is NULL ALTER TABLE VsWt47_1 ADD [FM_SWRQ4] [datetime] NULL        --死亡日期
IF Col_Length('VsWt47_1','FM_SWYY4') Is NULL ALTER TABLE VsWt47_1 ADD [FM_SWYY4] [VARCHAR](50) NULL        --死亡原因
IF Col_Length('VsWt47_1','FM_YYGR4') Is NULL ALTER TABLE VsWt47_1 ADD [FM_YYGR4] [Int] NULL        --是否发生医院感染
IF Col_Length('VsWt47_1','FM_CYQK4') Is NULL ALTER TABLE VsWt47_1 ADD [FM_CYQK4] [varchar](50) NULL        --出院情况
IF Col_Length('VsWt47_1','FM_CSRQ4') Is NULL ALTER TABLE VsWt47_1 ADD [FM_CSRQ4] [DATETIME] NULL        --出生日期

-----------中间表 
IF Col_Length('VsCH_Wt47_1','FM_SC1') Is NULL ALTER TABLE VsCH_Wt47_1 ADD [FM_SC1] [Int] NULL        --身长
IF Col_Length('VsCH_Wt47_1','FM_Weight1') Is NULL ALTER TABLE VsCH_Wt47_1 ADD [FM_Weight1] [Int] NULL        --体重
IF Col_Length('VsCH_Wt47_1','FM_JB1') Is NULL ALTER TABLE VsCH_Wt47_1 ADD [FM_JB1] [varchar](20) NULL        --疾病
IF Col_Length('VsCH_Wt47_1','FM_SWRQ1') Is NULL ALTER TABLE VsCH_Wt47_1 ADD [FM_SWRQ1] [datetime] NULL        --死亡日期
IF Col_Length('VsCH_Wt47_1','FM_SWYY1') Is NULL ALTER TABLE VsCH_Wt47_1 ADD [FM_SWYY1] [VARCHAR](50) NULL        --死亡原因
IF Col_Length('VsCH_Wt47_1','FM_YYGR1') Is NULL ALTER TABLE VsCH_Wt47_1 ADD [FM_YYGR1] [Int] NULL        --是否发生医院感染
IF Col_Length('VsCH_Wt47_1','FM_CYQK1') Is NULL ALTER TABLE VsCH_Wt47_1 ADD [FM_CYQK1] [VARCHAR](50) NULL        --出院情况
IF Col_Length('VsCH_Wt47_1','FM_CSRQ1') Is NULL ALTER TABLE VsCH_Wt47_1 ADD [FM_CSRQ1] [DATETIME] NULL        --出生日期

IF Col_Length('VsCH_Wt47_1','FM_SC2') Is NULL ALTER TABLE VsCH_Wt47_1 ADD [FM_SC2] [Int] NULL        --身长
IF Col_Length('VsCH_Wt47_1','FM_Weight2') Is NULL ALTER TABLE VsCH_Wt47_1 ADD [FM_Weight2] [Int] NULL        --体重
IF Col_Length('VsCH_Wt47_1','FM_JB2') Is NULL ALTER TABLE VsCH_Wt47_1 ADD [FM_JB2] [varchar](20) NULL        --疾病
IF Col_Length('VsCH_Wt47_1','FM_SWRQ2') Is NULL ALTER TABLE VsCH_Wt47_1 ADD [FM_SWRQ2] [datetime] NULL        --死亡日期
IF Col_Length('VsCH_Wt47_1','FM_SWYY2') Is NULL ALTER TABLE VsCH_Wt47_1 ADD [FM_SWYY2] [VARCHAR](50) NULL        --死亡原因
IF Col_Length('VsCH_Wt47_1','FM_YYGR2') Is NULL ALTER TABLE VsCH_Wt47_1 ADD [FM_YYGR2] [Int] NULL        --是否发生医院感染
IF Col_Length('VsCH_Wt47_1','FM_CYQK2') Is NULL ALTER TABLE VsCH_Wt47_1 ADD [FM_CYQK2] [VARCHAR](50) NULL        --出院情况
IF Col_Length('VsCH_Wt47_1','FM_CSRQ2') Is NULL ALTER TABLE VsCH_Wt47_1 ADD [FM_CSRQ2] [DATETIME] NULL        --出生日期

IF Col_Length('VsCH_Wt47_1','FM_SC3') Is NULL ALTER TABLE VsCH_Wt47_1 ADD [FM_SC3] [Int] NULL        --身长
IF Col_Length('VsCH_Wt47_1','FM_Weight3') Is NULL ALTER TABLE VsCH_Wt47_1 ADD [FM_Weight3] [Int] NULL        --体重
IF Col_Length('VsCH_Wt47_1','FM_JB3') Is NULL ALTER TABLE VsCH_Wt47_1 ADD [FM_JB3] [varchar](20) NULL        --疾病
IF Col_Length('VsCH_Wt47_1','FM_SWRQ3') Is NULL ALTER TABLE VsCH_Wt47_1 ADD [FM_SWRQ3] [datetime] NULL        --死亡日期
IF Col_Length('VsCH_Wt47_1','FM_SWYY3') Is NULL ALTER TABLE VsCH_Wt47_1 ADD [FM_SWYY3] [VARCHAR](50) NULL        --死亡原因
IF Col_Length('VsCH_Wt47_1','FM_YYGR3') Is NULL ALTER TABLE VsCH_Wt47_1 ADD [FM_YYGR3] [Int] NULL        --是否发生医院感染
IF Col_Length('VsCH_Wt47_1','FM_CYQK3') Is NULL ALTER TABLE VsCH_Wt47_1 ADD [FM_CYQK3] [VARCHAR](50) NULL        --出院情况
IF Col_Length('VsCH_Wt47_1','FM_CSRQ3') Is NULL ALTER TABLE VsCH_Wt47_1 ADD [FM_CSRQ3] [DATETIME] NULL        --出生日期

IF Col_Length('VsCH_Wt47_1','FM_SC4') Is NULL ALTER TABLE VsCH_Wt47_1 ADD [FM_SC4] [Int] NULL        --身长
IF Col_Length('VsCH_Wt47_1','FM_Weight4') Is NULL ALTER TABLE VsCH_Wt47_1 ADD [FM_Weight4] [Int] NULL        --体重
IF Col_Length('VsCH_Wt47_1','FM_JB4') Is NULL ALTER TABLE VsCH_Wt47_1 ADD [FM_JB4] [varchar](20) NULL        --疾病
IF Col_Length('VsCH_Wt47_1','FM_SWRQ4') Is NULL ALTER TABLE VsCH_Wt47_1 ADD [FM_SWRQ4] [datetime] NULL        --死亡日期
IF Col_Length('VsCH_Wt47_1','FM_SWYY4') Is NULL ALTER TABLE VsCH_Wt47_1 ADD [FM_SWYY4] [VARCHAR](50) NULL        --死亡原因
IF Col_Length('VsCH_Wt47_1','FM_YYGR4') Is NULL ALTER TABLE VsCH_Wt47_1 ADD [FM_YYGR4] [Int] NULL        --是否发生医院感染
IF Col_Length('VsCH_Wt47_1','FM_CYQK4') Is NULL ALTER TABLE VsCH_Wt47_1 ADD [FM_CYQK4] [VARCHAR](50) NULL        --出院情况
IF Col_Length('VsCH_Wt47_1','FM_CSRQ4') Is NULL ALTER TABLE VsCH_Wt47_1 ADD [FM_CSRQ4] [DATETIME] NULL        --出生日期
----------字典表-------------------
IF Col_Length('VsZhdm_12','CYQK') Is Null    
begin
  Alter Table VsZhdm_12 Add [CYQK] [varchar](20) NULL    ---新生儿出院情况
  --1.正常 2.有病 3.感染 4.死亡 5.转科 6.其他
 Exec('update  VsZhdm_12 set CYQK=''正常'' where  id=1')
 Exec('update  VsZhdm_12 set CYQK=''有病'' where  id=2')
 Exec('update  VsZhdm_12 set CYQK=''感染'' where  id=3')
 Exec('update  VsZhdm_12 set CYQK=''死亡'' where  id=4')
 Exec('update  VsZhdm_12 set CYQK=''转科'' where  id=5')
 Exec('update  VsZhdm_12 set CYQK=''其他'' where  id=6')
end

IF Col_Length('VsZhdm_12','zysftyjb') Is Null    
begin
  Alter Table VsZhdm_12 Add [zysftyjb] [varchar](20) NULL    
  
 Exec('update  VsZhdm_12 set zysftyjb=''第一次住院'' where  id=0')
 Exec('update  VsZhdm_12 set zysftyjb=''否'' where  id=1')
 Exec('update  VsZhdm_12 set zysftyjb=''是'' where  id=2')

END

IF Col_Length('VsZhdm_12','ycfq') Is Null    
begin
  Alter Table VsZhdm_12 Add [ycfq] [varchar](20) NULL    --压疮分期
  ----Ⅰ期 2.Ⅱ期 3.Ⅲ期 4.Ⅳ期 5.不可分期的压疮
  Exec('update  VsZhdm_12 set ycfq=''Ⅰ期'' where  id=1')
  Exec('update  VsZhdm_12 set ycfq=''Ⅱ期'' where  id=2')
  Exec('update  VsZhdm_12 set ycfq=''Ⅲ期'' where  id=3')
  Exec('update  VsZhdm_12 set ycfq=''Ⅳ期'' where  id=4')
  Exec('update  VsZhdm_12 set ycfq=''不可分期的压疮'' where  id=5')

END


-- 中间层增加病历接收动作
IF Col_Length('VsCh_PatientInfo', 'Ch0MRecivePersonId') Is Null Alter Table VsCh_PatientInfo Add [Ch0MRecivePersonId] [varchar](50) NULL  --接收人
IF Col_Length('VsCh_PatientInfo', 'Ch0MReciveDate') Is Null Alter Table VsCh_PatientInfo Add [Ch0MReciveDate] [datetime] NULL  --接收时间

-- 病历封存记录
IF not exists (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[VsFreeze]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
	CREATE TABLE [VsFreeze](
		[CHYear] [varchar](4) NOT NULL,
		[CH0A01] [varchar](50) NOT NULL,
		[CH0A02] [varchar](20) NULL,
		[CH0F01] [int] IDENTITY(1,1) NOT NULL,
		[CH0F02] [varchar](50) NULL,
		[CH0F03] [varchar](50) NULL,
		[CH0F05] [varchar](20) NULL,
		[CH0F06] [varchar](20) NULL,
		[CH0F07] [varchar](20) NULL,
		[CH0F08] [varchar](20) NULL,
		[CH0F09] [varchar](20) NULL,
		[CH0F10] [int] NULL,
		[CH0F11] [datetime] NULL,
		[CH0F12] [datetime] NULL,
		[UserCode] [varchar](20) NULL,
	 CONSTRAINT [PK_VsFreeze] PRIMARY KEY CLUSTERED 
	(
		[CH0F01] ASC
	) ON [PRIMARY]
	) ON [PRIMARY]

-- 病案号合号记录表
IF not exists (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[VsCombineCaseHistory]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
CREATE TABLE [VsCombineCaseHistory](
	[LastCHYear] [varchar](4) NOT NULL,
	[LastCH0A01] [varchar](50) NOT NULL,
	[CurrentCHYear] [varchar](4) NOT NULL,
	[CurrentCH0A01] [varchar](50) NOT NULL,
	[LastFileCode] [varchar](20) NOT NULL,
	[CurrentFileCode] [varchar](20) NOT NULL,
	[SearchFileCode] [varchar](20) NOT NULL,
	[UserCode] [varchar](50) NULL,
	[UserName] [varchar](50) NULL,
	[RecordDateTime] [datetime] NULL,
	[SortKey] [int] NULL,
 CONSTRAINT [PK_VsCombineCaseHistory] PRIMARY KEY CLUSTERED 
(
	[LastCHYear] ASC,
	[LastCH0A01] ASC,
	[CurrentCHYear] ASC,
	[CurrentCH0A01] ASC
) ON [PRIMARY]
) ON [PRIMARY]

-- 在字典表中增加医院用ICD与HQMS上报ICD对照功能
IF Col_Length('VsUseICD','BZICD') Is Null
   Alter Table VsUseICD Add BZICD VarChar(20)

IF Col_Length('VsUseICD','BZMC') Is Null
   Alter Table VsUseICD Add BZMC VarChar(100)


IF Col_Length('VsUseICCM','BZICCM') Is Null
   Alter Table VsUseICCM Add BZICCM VarChar(10)

IF Col_Length('VsUseICCM','BZSSMC') Is Null
   Alter Table VsUseICCM Add BZSSMC VarChar(100)

/*==============================================================*/
/* Drop Table VsZYCF 住院处方                                               */
/*==============================================================*/
if not exists (select 1 from  sysobjects where  id = object_id('VsZYCF') and   type = 'U')
create table VsZYCF (
   TjZYCFKB             varchar(20)          not null,
   TjZYCFRQ             datetime             not null,
   TjZYCF01             int                  null,
   TjZYCF02             int                  null,
   TjZYCF03             int                  null,
   TjZYCF04             int                  null,
   TjZYCF05             int                  null,
   TjZYCF06             int                  null,
   TjZYCF07             numeric(18,2)        null,
   TjZYCF08             numeric(18,2)        null,
   TjZYCF09             numeric(18,2)        null,
   TjZYCF10             numeric(18,2)        null,
   TjZYCF11             numeric(18,2)        null,
   TjZYCF12             numeric(18,2)        null,
   constraint PK_VSZYCF primary key (TjZYCFKB, TjZYCFRQ)
)
on [PRIMARY]


/*==============================================================*/
/* Drop Table VsMZCF 门诊处方                                               */
/*==============================================================*/
if not exists (select 1 from  sysobjects where  id = object_id('VsMZCF') and   type = 'U')
create table VsMZCF (
   TjCFKB               varchar(20)          not null,
   TjCFRQ               datetime             not null,
   TjCF01               int                  null,
   TjCF02               int                  null,
   TjCF03               int                  null,
   TjCF04               int                  null,
   TjCF05               int                  null,
   TjCF06               int                  null,
   TjCF07               numeric(18,2)        null,
   TjCF08               numeric(18,2)        null,
   TjCF09               numeric(18,2)        null,
   TjCF10               numeric(18,2)        null,
   TjCF11               numeric(18,2)        null,
   TjCF12               numeric(18,2)        null,
   constraint PK_VSMZCF primary key (TjCFKB, TjCFRQ)
)
on [PRIMARY]

-- 门诊预约人次
IF Col_Length('VsTjMz','TjMzYyrs') Is Null Alter Table VsTjMz Add [TjMzYyrs] [int] NULL  

-- 复印内容
IF Col_Length('VsDBaCopy','CIFYItem') Is Null Alter Table VsDBaCopy Add [CIFYItem] varchar(100) NULL  
-- 复印用途
IF Col_Length('VsDBaCopy','CIFYUseFor') Is Null Alter Table VsDBaCopy Add [CIFYUseFor] varchar(10) NULL 
 
-- 医院自定义型病人来源
IF Col_Length('VsCH0A','CH0ACJ') Is Null Alter Table VsCH0A Add [CH0ACJ] varchar(30) NULL
-- 医院自定义型病人来源_中间库
IF Col_Length('VsCH_PatientInfo','CH0MCJ') Is Null Alter Table VsCH_PatientInfo Add [CH0MCJ] varchar(30) NULL
-- 病人来源字典库
if not exists (select 1 from  sysobjects where  id = object_id('VsBRLYDMK') and   type = 'U')
create table VsBRLYDMK (
   Dm                   varchar(20)          not null,
   DmMc                 varchar(100)         null,
   IsStop               int                  null,
   PYM                  varchar(20)          null,
   WBM                  varchar(20)          null,
   constraint PK_VSBRLYDMK primary key (Dm)
)
IF Col_Length('VsBaSet','VsBsIsShowCH0ACJ') Is Null
   Alter Table VsBaSet Add VsBsIsShowCH0ACJ int

-- 病案接收运送人
IF Col_Length('VsCH_Patientinfo','CH0MSendPerson') Is Null
   Alter table VsCH_Patientinfo add CH0MSendPerson varchar(50) null


-- 为适应山西门诊数据上报 而扩充门诊明细表字段
      IF Col_Length('Vstjmz_mx','mzmxa1') Is Null     --医疗付款方式     
   Alter Table Vstjmz_mx Add [mzmxa1] [varchar](2) NULL 
      IF Col_Length('Vstjmz_mx','mzmxa2') Is Null     --身份证号     
   Alter Table Vstjmz_mx Add [mzmxa2] [varchar](20) NULL 
      IF Col_Length('Vstjmz_mx','mzmxa3') Is Null     --出生日期     
   Alter Table Vstjmz_mx Add [mzmxa3] [datetime] NULL 
      IF Col_Length('Vstjmz_mx','mzmxa4') Is Null     --年龄     
   Alter Table Vstjmz_mx Add [mzmxa4] [int] NULL 
	  IF Col_Length('Vstjmz_mx','mzmxa5') Is Null     --民族     
   Alter Table Vstjmz_mx Add [mzmxa5] [varchar](20) NULL 
      IF Col_Length('Vstjmz_mx','mzmxa6') Is Null  --职业        
   Alter Table Vstjmz_mx Add [mzmxa6] [varchar](2) NULL 
      IF Col_Length('Vstjmz_mx','mzmxa7') Is Null  --国籍        
   Alter Table Vstjmz_mx Add [mzmxa7] [varchar](40) NULL 
      IF Col_Length('Vstjmz_mx','mzmxa8') Is Null  --住址               
   Alter Table Vstjmz_mx Add [mzmxa8] [varchar](200) NULL 
      IF Col_Length('Vstjmz_mx','mzmxa9') Is Null  --联系电话        
   Alter Table Vstjmz_mx Add [mzmxa9] [varchar](20) NULL 
      IF Col_Length('Vstjmz_mx','mzmxaa') Is Null --就诊时间         
   Alter Table Vstjmz_mx Add [mzmxaa] [datetime] NULL 
      IF Col_Length('Vstjmz_mx','mzmxab') Is Null  --门诊医师职称        
   Alter Table Vstjmz_mx Add [mzmxab] [varchar](10) NULL 
      IF Col_Length('Vstjmz_mx','mzmxac') Is Null --是否复诊         
   Alter Table Vstjmz_mx Add [mzmxac] [int] NULL  
	  IF Col_Length('Vstjmz_mx','mzmxad') Is Null    --是否预约      
   Alter Table Vstjmz_mx Add [mzmxad] [int] NULL 
      IF Col_Length('Vstjmz_mx','mzmxae') Is Null    --预约方式      
   Alter Table Vstjmz_mx Add [mzmxae] [varchar](20) NULL 
      IF Col_Length('Vstjmz_mx','mzmxaf') Is Null   --是否死亡       
   Alter Table Vstjmz_mx Add [mzmxaf] [int] NULL 
      IF Col_Length('Vstjmz_mx','mzmxag') Is Null  --门诊诊断描述        
   Alter Table Vstjmz_mx Add [mzmxag] [varchar](200) NULL 
      IF Col_Length('Vstjmz_mx','mzmxah') Is Null  --门诊诊断编码               
   Alter Table Vstjmz_mx Add [mzmxah] [varchar](20) NULL 
      IF Col_Length('Vstjmz_mx','mzmxai') Is Null  --处方张数        
   Alter Table Vstjmz_mx Add [mzmxai] [int] NULL 
      IF Col_Length('Vstjmz_mx','mzmxf1') Is Null  --门诊总费用        
   Alter Table Vstjmz_mx Add [mzmxf1] [Numeric] (12,2) NULL 
      IF Col_Length('Vstjmz_mx','mzmxf2') Is Null  --其中：自付金额        
   Alter Table Vstjmz_mx Add [mzmxf2] [Numeric] (12,2) NULL 
      IF Col_Length('Vstjmz_mx','mzmxf3') Is Null  --西药费        
   Alter Table Vstjmz_mx Add [mzmxf3] [Numeric] (12,2) NULL  
      IF Col_Length('Vstjmz_mx','mzmxf4') Is Null  --其中：抗菌药费        
   Alter Table Vstjmz_mx Add [mzmxf4] [Numeric] (12,2) NULL 
      IF Col_Length('Vstjmz_mx','mzmxf5') Is Null  --中成药费    
   Alter Table Vstjmz_mx Add [mzmxf5] [Numeric] (12,2) NULL 
      IF Col_Length('Vstjmz_mx','mzmxf6') Is Null  --中草药费        
   Alter Table Vstjmz_mx Add [mzmxf6] [Numeric] (12,2) NULL  
      IF Col_Length('Vstjmz_mx','mzmxf7') Is Null  --检查费   
   Alter Table Vstjmz_mx Add [mzmxf7] [Numeric] (12,2) NULL 
      IF Col_Length('Vstjmz_mx','mzmxf8') Is Null  --其中：X光费      
   Alter Table Vstjmz_mx Add [mzmxf8] [Numeric] (12,2) NULL 
      IF Col_Length('Vstjmz_mx','mzmxf9') Is Null  --其中：CT费      
   Alter Table Vstjmz_mx Add [mzmxf9] [Numeric] (12,2) NULL  
      IF Col_Length('Vstjmz_mx','mzmxfa') Is Null  --  其中：MRI费      
   Alter Table Vstjmz_mx Add [mzmxfa] [Numeric] (12,2) NULL   
      IF Col_Length('Vstjmz_mx','mzmxfb') Is Null  --其它检查费      
   Alter Table Vstjmz_mx Add [mzmxfb] [Numeric] (12,2) NULL  
      IF Col_Length('Vstjmz_mx','mzmxfc') Is Null  --材料费   
   Alter Table Vstjmz_mx Add [mzmxfc] [Numeric] (12,2) NULL 
      IF Col_Length('Vstjmz_mx','mzmxfd') Is Null  --检验费    
   Alter Table Vstjmz_mx Add [mzmxfd] [Numeric] (12,2) NULL 
      IF Col_Length('Vstjmz_mx','mzmxfe') Is Null  --治疗费  
   Alter Table Vstjmz_mx Add [mzmxfe] [Numeric] (12,2) NULL 
      IF Col_Length('Vstjmz_mx','mzmxff') Is Null  --其它费      
   Alter Table Vstjmz_mx Add [mzmxff] [Numeric] (12,2) NULL

      if  Col_Length('Vstjmz_mx','TjMzKind') Is Null  --发现有数据库掉了这个字段加上      
   Alter Table Vstjmz_mx Add [TjMzKind] int NULL
      IF Col_Length('Vstjmz_mx','mzmxfg') Is Null  --检查费其中：超声费 -- 后来增加      
   Alter Table Vstjmz_mx Add [mzmxfg] [Numeric] (12,2) NULL 

-- 数据ETL Begin ----
if not exists (select 1 from  sysobjects where  id = object_id('EBK_SysInfo') and   type = 'U')
/*==============================================================*/
/* Drop Table EBK_SysInfo                                           */
/*==============================================================*/
create table EBK_SysInfo (
   XZQH                 varchar(6)           not null,
   JGDM                 varchar(10)          not null,
   HName                varchar(200)         null,
   HAddress             varchar(200)         null,
   HType                int                  null,
   Principal            varchar(50)          null,
   TjPrincipal          varchar(50)          null,
   constraint PK_EBK_SYSINFO primary key (XZQH, JGDM)
)

/*==============================================================*/
/* Drop Table EB_Dictionary                                         */
/*==============================================================*/
if not exists (select 1 from  sysobjects where  id = object_id('EB_Dictionary') and   type = 'U')
create table EB_Dictionary (
   Kind                 int                  not null,
   DM                   int                  not null,
   DMMC                 varchar(30)          null,
   constraint PK_EB_DICTIONARY primary key (DM, Kind)
)
if not exists (select 1 from  sysobjects where  id = object_id('EB_DBLink') and   type = 'U')
/*==============================================================*/
/* Drop Table EB_DBLink                                             */
/*==============================================================*/
create table EB_DBLink (
   LJXH                 int                  not null,
   LJLX                 int                  not null,
   SoftLX               int                  null,
   ConStr               varchar(2000)        null,
   DBKind               int                  null,
   Host                 varchar(128)         null,
   sDataBase            varchar(128)         null,
   UserName             varchar(128)         null,
   sPassWord            varchar(2000)        null,
   IsDBExpress          int                  null,
   Company              varchar(50)          null,
   Version              varchar(20)          null,
   DH                   varchar(30)          null,
   GCS                  varchar(30)          null,
   SJ                   varchar(30)          null,
   QQ                   varchar(30)          null,
   EMail                varchar(30)          null,
   YearBit              int                  null,
   MonthDayBit          int                  null,
   DateDelimiter        int                  null,
   Memo                 varchar(100)         null,
   constraint PK_EB_DBLINK primary key (LJXH, LJLX)
)

if not exists (select 1 from  sysobjects where  id = object_id('EBK_DBLink') and   type = 'U')
/*==============================================================*/
/* Drop Table EBK_DBLink                                             */
/*==============================================================*/
create table EBK_DBLink (
   XZQH                 varchar(6)           not null,
   JGDM                 varchar(10)          not null,
   LJXH                 int                  not null,
   LJLX                 int                  not null,
   SoftLX               int                  null,
   ConStr               varchar(2000)        null,
   DBKind               int                  null,
   Host                 varchar(128)         null,
   sDataBase            varchar(128)         null,
   UserName             varchar(128)         null,
   sPassWord            varchar(2000)        null,
   IsDBExpress          int                  null,
   Company              varchar(50)          null,
   Version              varchar(20)          null,
   DH                   varchar(30)          null,
   GCS                  varchar(30)          null,
   SJ                   varchar(30)          null,
   QQ                   varchar(30)          null,
   EMail                varchar(30)          null,
   YearBit              int                  null,
   MonthDayBit          int                  null,
   DateDelimiter        int                  null,
   Memo                 varchar(100)         null,
   constraint PK_EBK_DBLINK primary key (XZQH, JGDM, LJXH, LJLX)
)
if not exists (select 1 from  sysobjects where  id = object_id('EB_Dictionary') and   type = 'U')
/*==============================================================*/
/* Drop Table EB_Dictionary                                         */
/*==============================================================*/
create table EB_Dictionary (
   Kind                 int                  not null,
   DM                   int                  not null,
   DMMC                 varchar(30)          null,
   constraint PK_EB_DICTIONARY primary key (DM, Kind)
)

if not exists (select 1 from  sysobjects where  id = object_id('EB_FieldType') and   type = 'U')
/*==============================================================*/
/* Drop Table EB_FieldType                                          */
/*==============================================================*/
create table EB_FieldType (
   DM                   int                  not null,
   DMMC                 varchar(30)          null,
   Len                  int                  null,
   constraint PK_EB_FIELDTYPE primary key (DM)
)

if not exists (select 1 from  sysobjects where  id = object_id('EB_Function') and   type = 'U')
/*==============================================================*/
/* Drop Table EB_Function                                           */
/*==============================================================*/
create table EB_Function (
   FunKind              int                  not null,
   FunName              varchar(128)         not null,
   FunTemplet           varchar(500)         null,
   FunDict              varchar(500)         null,
   constraint PK_EB_FUNCTION primary key (FunKind, FunName)
)

if not exists (select 1 from  sysobjects where  id = object_id('EL_FieldConvert') and   type = 'U')
/*==============================================================*/
/* Drop Table EL_FieldConvert                                       */
/*==============================================================*/
create table EL_FieldConvert (
   CID                  varchar(50)          not null,
   XH                   int                  null,
   DFID                 varchar(50)          null,
   SFID                 varchar(50)          null,
   SourceValue          varchar(2000)        null,
   ConvertWay           varchar(50)          null,
   DestValue            varchar(2000)        null,
   ConvertKind          int                  null,
   CTime                datetime             null,
   constraint PK_EL_FIELDCONVERT primary key (CID)
)

if not exists (select 1 from  sysobjects where  id = object_id('EL_Error') and   type = 'U')
/*==============================================================*/
/* Drop Table EL_Error                                              */
/*==============================================================*/
create table EL_Error (
   EID                  varchar(50)          not null,
   BID                  varchar(50)          null,
   EUser                varchar(30)          null,
   ETime                datetime             null,
   EType                varchar(50)          null,
   ESQL                 varchar(8000)        null,
   EInfo                varchar(500)         null,
   constraint PK_EL_ERROR primary key (EID)
)

if not exists (select 1 from  sysobjects where  id = object_id('EL_Log') and   type = 'U')
/*==============================================================*/
/* Drop Table EL_Log                                                */
/*==============================================================*/
create table EL_Log (
   RID                  varchar(50)          not null,
   ZTID                 varchar(50)          null,
   RUser                varchar(30)          null,
   RSTime               datetime             null,
   RETime               datetime             null,
   RCount               int                  null,
   RSCount              int                  null,
   constraint PK_EL_LOG primary key (RID)
)

if not exists (select 1 from  sysobjects where  id = object_id('EL_SourceSQLLog') and   type = 'U')
/*==============================================================*/
/* Drop Table EL_SourceSQLLog                                       */
/*==============================================================*/
create table EL_SourceSQLLog (
   RID                  varchar(50)          not null,
   BID                  varchar(50)          null,
   ETLSQL               varchar(8000)        null,
   RUser                varchar(30)          null,
   ETLTime              datetime             null,
   constraint PK_EL_SOURCESQLLOG primary key (RID)
)

if not exists (select 1 from  sysobjects where  id = object_id('EL_TestLog') and   type = 'U')
/*==============================================================*/
/* Drop Table EL_TestLog                                            */
/*==============================================================*/
create table EL_TestLog (
   RID                  varchar(50)          not null,
   XH                   int                  null,
   BID                  varchar(50)          null,
   XM                   varchar(50)          null,
   RCount               int                  null,
   Tick                 int                  null,
   RQ                   datetime             null,
   RUser                varchar(30)          null,
   constraint PK_EL_TESTLOG primary key (RID)
)

if not exists (select 1 from  sysobjects where  id = object_id('EB_Theme') and   type = 'U')
/*==============================================================*/
/* Drop Table EB_Theme                                              */
/*==============================================================*/
create table EB_Theme (
   ZTID                 varchar(50)          not null,
   ZTMC                 varchar(100)         null,
   ZTMS                 varchar(500)         null,
   JLR                  varchar(30)          null,
   JLRQ                 datetime             null,
   Memo                 varchar(300)         null,
   constraint PK_EB_THEME primary key (ZTID)
)

if not exists (select 1 from  sysobjects where  id = object_id('EBK_Theme') and   type = 'U')
/*==============================================================*/
/* Drop Table EBK_Theme                                              */
/*==============================================================*/
create table EBK_Theme (
   XZQH                 varchar(6)           not null,
   JGDM                 varchar(10)          not null,
   ZTID                 varchar(50)          not null,
   ZTMC                 varchar(100)         null,
   ZTMS                 varchar(500)         null,
   JLR                  varchar(30)          null,
   JLRQ                 datetime             null,
   Memo                 varchar(300)         null,
   constraint PK_EBK_THEME primary key (XZQH, JGDM, ZTID)
)

if not exists (select 1 from  sysobjects where  id = object_id('ES_Tables') and   type = 'U')
/*==============================================================*/
/* Drop Table ES_Tables                                             */
/*==============================================================*/
create table ES_Tables (
   BID                  varchar(50)          not null,
   ZTID                 varchar(50)          null,
   XH                   int                  null,
   LJXH                 int                  null,
   BM                   varchar(50)          null,
   BMC                  varchar(50)          null,
   BKind                int                  null,
   BSM                  varchar(300)         null,
   Dm                   varchar(50)          null,
   DmMc                 varchar(50)          null,
   BSQL                 text                 null,
   IsFieldAddSign       int                  null,
   PYM                  varchar(10)          null,
   WBM                  varchar(10)          null,
   constraint PK_ES_TABLES primary key (BID)
)

if not exists (select 1 from  sysobjects where  id = object_id('ESK_Tables') and   type = 'U')
/*==============================================================*/
/* Drop Table ESK_Tables                                             */
/*==============================================================*/
create table ESK_Tables (
   XZQH                 varchar(6)           not null,
   JGDM                 varchar(10)          not null,
   BID                  varchar(50)          not null,
   ZTID                 varchar(50)          null,
   XH                   int                  null,
   LJXH                 int                  null,
   BM                   varchar(50)          null,
   BMC                  varchar(50)          null,
   BKind                int                  null,
   BSM                  varchar(300)         null,
   Dm                   varchar(50)          null,
   DmMc                 varchar(50)          null,
   BSQL                 text                 null,
   IsFieldAddSign       int                  null,
   PYM                  varchar(10)          null,
   WBM                  varchar(10)          null,
   constraint PK_ESK_TABLES primary key (XZQH, JGDM, BID)
)

if not exists (select 1 from  sysobjects where  id = object_id('ES_Fields') and   type = 'U')
/*==============================================================*/
/* Drop Table ES_Fields                                         */
/*==============================================================*/
create table ES_Fields (
   FID                  varchar(50)          not null,
   XH                   int                  null,
   BID                  varchar(50)          null,
   FMC                  varchar(50)          null,
   FSM                  varchar(50)          null,
   FType                int                  null,
   FLen                 int                  null,
   IsZYH                int                  null,
   IsZYCS               int                  null,
   IsCYRQ               int                  null,
   IsDM                 int                  null,
   IsDMMC               int                  null,
   FSQL                 varchar(2000)        null,
   PYM                  varchar(10)          null,
   WBM                  varchar(10)          null,
   constraint PK_ES_FIELDS primary key (FID)
)

if not exists (select 1 from  sysobjects where  id = object_id('ESK_Fields') and   type = 'U')
/*==============================================================*/
/* Drop Table ESK_Fields                                         */
/*==============================================================*/
create table ESK_Fields (
   XZQH                 varchar(6)           not null,
   JGDM                 varchar(10)          not null,
   FID                  varchar(50)          not null,
   XH                   int                  null,
   BID                  varchar(50)          null,
   FMC                  varchar(50)          null,
   FSM                  varchar(50)          null,
   FType                int                  null,
   FLen                 int                  null,
   IsZYH                int                  null,
   IsZYCS               int                  null,
   IsCYRQ               int                  null,
   IsDM                 int                  null,
   IsDMMC               int                  null,
   FSQL                 varchar(2000)        null,
   PYM                  varchar(10)          null,
   WBM                  varchar(10)          null,
   constraint PK_ESK_FIELDS primary key (XZQH, JGDM, FID)
)

if not exists (select 1 from  sysobjects where  id = object_id('ED_Tables') and   type = 'U')
/*==============================================================*/
/* Drop Table ED_Tables                                             */
/*==============================================================*/
create table ED_Tables (
   BID                  varchar(50)          not null,
   ZTID                 varchar(50)          null,
   XH                   int                  null,
   IsMarst              int                  null,
   LJXH                 int                  null,
   BM                   varchar(50)          null,
   BMC                  varchar(50)          null,
   BKind                int                  null,
   BSM                  varchar(300)         null,
   MasterSource         varchar(50)          null,
   Dm                   varchar(50)          null,
   DmMc                 varchar(50)          null,
   BSQL                 varchar(1000)        null,
   IsFieldAddSign       int                  null,
   PYM                  varchar(10)          null,
   WBM                  varchar(10)          null,
   LoadWay              int                  null,
   UpdateStep           int                  null,
   ProcName             varchar(128)         null,
   ProcText             text                 null,
   ETLFID               varchar(50)          null,
   ETLVStart            varchar(2000)        null,
   ETLVEnd              varchar(2000)        null,
   constraint PK_ED_TABLES primary key (BID)
)

if not exists (select 1 from  sysobjects where  id = object_id('EDK_Tables') and   type = 'U')
/*==============================================================*/
/* Drop Table EDK_Tables                                             */
/*==============================================================*/
create table EDK_Tables (
   XZQH                 varchar(6)           not null,
   JGDM                 varchar(10)          not null,
   BID                  varchar(50)          not null,
   ZTID                 varchar(50)          null,
   XH                   int                  null,
   IsMarst              int                  null,
   LJXH                 int                  null,
   BM                   varchar(50)          null,
   BMC                  varchar(50)          null,
   BKind                int                  null,
   BSM                  varchar(300)         null,
   MasterSource         varchar(50)          null,
   Dm                   varchar(50)          null,
   DmMc                 varchar(50)          null,
   BSQL                 varchar(1000)        null,
   IsFieldAddSign       int                  null,
   PYM                  varchar(10)          null,
   WBM                  varchar(10)          null,
   LoadWay              int                  null,
   UpdateStep           int                  null,
   ProcName             varchar(128)         null,
   ProcText             text                 null,
   ETLFID               varchar(50)          null,
   ETLVStart            varchar(2000)        null,
   ETLVEnd              varchar(2000)        null,
   constraint PK_EDK_TABLES primary key (XZQH, JGDM, BID)
)

if not exists (select 1 from  sysobjects where  id = object_id('ED_Fields') and   type = 'U')
/*==============================================================*/
/* Drop Table ED_Fields                                         */
/*==============================================================*/
create table ED_Fields (
   FID                  varchar(50)          not null,
   XH                   int                  null,
   BID                  varchar(50)          null,
   FMC                  varchar(50)          null,
   FSM                  varchar(50)          null,
   FType                int                  null,
   FLen                 int                  null,
   IsKey                int                  null,
   IsDM                 int                  null,
   IsDMMC               int                  null,
   [IsNull]             int                  null,
   IsDefault            int                  null,
   DlfValue             varchar(500)         null,
   ConvertWay           int                  null,
   ConvertWay1          int                  null,
   SField               varchar(50)          null,
   CalcWay              int                  null,
   FilterWay            int                  null,
   IsUpdate             int                  null,
   FSOther1             varchar(5000)        null,
   FSOther2             varchar(500)         null,
   FSOther3             varchar(500)         null,
   FSOther4             varchar(500)         null,
   FIOther1             int                  null,
   FIOther2             int                  null,
   FIOther3             int                  null,
   MapLLinkXH           int                  null,
   MapLLinkKind         int                  null,
   MapLLinkSQL          varchar(2000)        null,
   MapRLinkXH           int                  null,
   MapRLinkKind         int                  null,
   MapRLinkSQL          varchar(2000)        null,
   PYM                  varchar(10)          null,
   WBM                  varchar(10)          null,
   constraint PK_ED_FIELDS primary key (FID)
)

if not exists (select 1 from  sysobjects where  id = object_id('EDK_Fields') and   type = 'U')
/*==============================================================*/
/* Drop Table EDK_Fields                                         */
/*==============================================================*/
create table EDK_Fields (
   XZQH                 varchar(6)           not null,
   JGDM                 varchar(10)          not null,
   FID                  varchar(50)          not null,
   XH                   int                  null,
   BID                  varchar(50)          null,
   FMC                  varchar(50)          null,
   FSM                  varchar(50)          null,
   FType                int                  null,
   FLen                 int                  null,
   IsKey                int                  null,
   IsDM                 int                  null,
   IsDMMC               int                  null,
   [IsNull]             int                  null,
   IsDefault            int                  null,
   DlfValue             varchar(500)         null,
   ConvertWay           int                  null,
   ConvertWay1          int                  null,
   SField               varchar(50)          null,
   CalcWay              int                  null,
   FilterWay            int                  null,
   IsUpdate             int                  null,
   FSOther1             varchar(5000)        null,
   FSOther2             varchar(500)         null,
   FSOther3             varchar(500)         null,
   FSOther4             varchar(500)         null,
   FIOther1             int                  null,
   FIOther2             int                  null,
   FIOther3             int                  null,
   MapLLinkXH           int                  null,
   MapLLinkKind         int                  null,
   MapLLinkSQL          varchar(2000)        null,
   MapRLinkXH           int                  null,
   MapRLinkKind         int                  null,
   MapRLinkSQL          varchar(2000)        null,
   PYM                  varchar(10)          null,
   WBM                  varchar(10)          null,
   constraint PK_EDK_FIELDS primary key (XZQH, JGDM, FID)
)

if not exists (select 1 from  sysobjects where  id = object_id('ES_Where') and   type = 'U')
/*==============================================================*/
/* Drop Table ES_Where                                              */
/*==============================================================*/
create table ES_Where (
   GID                  varchar(50)          not null,
   DTable               varchar(50)          null,
   XH                   int                  null,
   L                    varchar(50)          null,
   LField               varchar(50)          null,
   Operation            int                  null,
   RValue               varchar(100)         null,
   R                    varchar(50)          null,
   Logic                int                  null,
   constraint PK_ES_WHERE primary key (GID)
)

if not exists (select 1 from  sysobjects where  id = object_id('ESK_Where') and   type = 'U')
/*==============================================================*/
/* Drop Table ESK_Where                                              */
/*==============================================================*/
create table ESK_Where (
   XZQH                 varchar(6)           not null,
   JGDM                 varchar(10)          not null,
   GID                  varchar(50)          not null,
   DTable               varchar(50)          null,
   XH                   int                  null,
   L                    varchar(50)          null,
   LField               varchar(50)          null,
   Operation            int                  null,
   RValue               varchar(100)         null,
   R                    varchar(50)          null,
   Logic                int                  null,
   constraint PK_ESK_WHERE primary key (XZQH, JGDM, GID)
)

if not exists (select 1 from  sysobjects where  id = object_id('ES_Map') and   type = 'U')
/*==============================================================*/
/* Drop Table ES_Map                                                */
/*==============================================================*/
create table ES_Map (
   MID                  varchar(50)          not null,
   MField               varchar(50)          null,
   DDM                  varchar(500)         null,
   SDM                  varchar(500)         null,
   DMemo                varchar(100)         null,
   SMemo                varchar(100)         null,
   MapWay               int                  null,
   IsMaped              int                  null,
   constraint PK_ES_MAP primary key (MID)
)


if not exists (select 1 from  sysobjects where  id = object_id('ESK_Map') and   type = 'U')
/*==============================================================*/
/* Drop Table ESK_Map                                                */
/*==============================================================*/
create table ESK_Map (
   XZQH                 varchar(6)           not null,
   JGDM                 varchar(10)          not null,
   MID                  varchar(50)          not null,
   MField               varchar(50)          null,
   DDM                  varchar(500)         null,
   SDM                  varchar(500)         null,
   DMemo                varchar(100)         null,
   SMemo                varchar(100)         null,
   MapWay               int                  null,
   IsMaped              int                  null,
   constraint PK_ESK_MAP primary key (XZQH, JGDM, MID)
)

if not exists (select 1 from  sysobjects where  id = object_id('ES_FyFields') and   type = 'U')
/*==============================================================*/
/* Drop Table ES_FyFields                                              */
/*==============================================================*/
create table ES_FyFields (
   FID                  varchar(50)          not null,
   DField               varchar(50)          null,
   SField               varchar(50)          null,
   constraint PK_ES_FYFIELDS primary key (FID)
)


if not exists (select 1 from  sysobjects where  id = object_id('ESK_FyFields') and   type = 'U')
/*==============================================================*/
/* Drop Table ESK_FyFields                                              */
/*==============================================================*/
create table ESK_FyFields (
   XZQH                 varchar(6)           not null,
   JGDM                 varchar(10)          not null,
   FID                  varchar(50)          not null,
   DField               varchar(50)          null,
   SField               varchar(50)          null,
   constraint PK_ESK_FYFIELDS primary key (XZQH, JGDM, FID)
)

if not exists (select 1 from  sysobjects where  id = object_id('ES_FieldCalc') and   type = 'U')
/*==============================================================*/
/* Drop Table ES_FieldCalc                                          */
/*==============================================================*/
create table ES_FieldCalc (
   CalcID               varchar(50)          not null,
   XH                   int                  null,
   DField               varchar(50)          null,
   SField               varchar(50)          null,
   constraint PK_ES_FIELDCALC primary key (CalcID)
)

if not exists (select 1 from  sysobjects where  id = object_id('ESK_FieldCalc') and   type = 'U')
/*==============================================================*/
/* Drop Table ESK_FieldCalc                                          */
/*==============================================================*/
create table ESK_FieldCalc (
   XZQH                 varchar(6)           not null,
   JGDM                 varchar(10)          not null,
   CalcID               varchar(50)          not null,
   XH                   int                  null,
   DField               varchar(50)          null,
   SField               varchar(50)          null,
   constraint PK_ESK_FIELDCALC primary key (XZQH, JGDM, CalcID)
)

if not exists (select 1 from  sysobjects where  id = object_id('ES_Filter') and   type = 'U')
/*==============================================================*/
/* Drop Table ES_Filter                                              */
/*==============================================================*/
create table ES_Filter (
   GID                  varchar(50)          not null,
   DField               varchar(50)          null,
   XH                   int                  null,
   L                    varchar(10)          null,
   LField               varchar(50)          null,
   Operation            int                  null,
   RValue               varchar(200)         null,
   R                    varchar(10)          null,
   Logic                int                  null,
   constraint PK_ES_FILTER primary key (GID)
)

if not exists (select 1 from  sysobjects where  id = object_id('ESK_Filter') and   type = 'U')
/*==============================================================*/
/* Drop Table ESK_Filter                                              */
/*==============================================================*/
create table ESK_Filter (
   XZQH                 varchar(6)           not null,
   JGDM                 varchar(10)          not null,
   GID                  varchar(50)          not null,
   DField               varchar(50)          null,
   XH                   int                  null,
   L                    varchar(10)          null,
   LField               varchar(50)          null,
   Operation            int                  null,
   RValue               varchar(200)         null,
   R                    varchar(10)          null,
   Logic                int                  null,
   constraint PK_ESK_FILTER primary key (XZQH, JGDM, GID)
)

if not exists (select 1 from  sysobjects where  id = object_id('ES_InHospitalWhere') and   type = 'U')
/*==============================================================*/
/* Drop Table ES_InHospitalWhere                                              */
/*==============================================================*/
create table ES_InHospitalWhere (
   GID                  varchar(50)          not null,
   ZTID                 varchar(50)          null,
   XH                   int                  null,
   L                    varchar(10)          null,
   LField               varchar(50)          null,
   Operation            int                  null,
   RValue               varchar(200)         null,
   R                    varchar(10)          null,
   Logic                int                  null,
   constraint PK_ES_INHOSPITALWHERE primary key (GID)
)

if not exists (select 1 from  sysobjects where  id = object_id('ESK_InHospitalWhere') and   type = 'U')
/*==============================================================*/
/* Drop Table ESK_InHospitalWhere                                              */
/*==============================================================*/
create table ESK_InHospitalWhere (
   XZQH                 varchar(6)           not null,
   JGDM                 varchar(10)          not null,
   GID                  varchar(50)          not null,
   ZTID                 varchar(50)          null,
   XH                   int                  null,
   L                    varchar(10)          null,
   LField               varchar(50)          null,
   Operation            int                  null,
   RValue               varchar(200)         null,
   R                    varchar(10)          null,
   Logic                int                  null,
   constraint PK_ESK_INHOSPITALWHERE primary key (XZQH, JGDM, GID)
)

if not exists (select 1 from  sysobjects where  id = object_id('ES_Wash') and   type = 'U')
/*==============================================================*/
/* Drop Table ES_Wash                                               */
/*==============================================================*/
create table ES_Wash (
   WID                  varchar(50)          not null,
   WXH                  int                  null,
   WField               varchar(50)          null,
   WWay                 int                  null,
   Memo                 varchar(100)         null,
   P1                   varchar(100)         null,
   P2                   varchar(100)         null,
   P3                   varchar(100)         null,
   P4                   varchar(100)         null,
   P5                   varchar(100)         null,
   constraint PK_ES_WASH primary key (WID)
)

if not exists (select 1 from  sysobjects where  id = object_id('ESK_Wash') and   type = 'U')
/*==============================================================*/
/* Drop Table ESK_Wash                                               */
/*==============================================================*/
create table ESK_Wash (
   XZQH                 varchar(6)           not null,
   JGDM                 varchar(10)          not null,
   WID                  varchar(50)          not null,
   WXH                  int                  null,
   WField               varchar(50)          null,
   WWay                 int                  null,
   Memo                 varchar(100)         null,
   P1                   varchar(100)         null,
   P2                   varchar(100)         null,
   P3                   varchar(100)         null,
   P4                   varchar(100)         null,
   P5                   varchar(100)         null,
   constraint PK_ESK_WASH primary key (XZQH, JGDM, WID)
)

if not exists (select 1 from  sysobjects where  id = object_id('ES_Union') and   type = 'U')
/*==============================================================*/
/* Drop Table ES_Union                                              */
/*==============================================================*/
create table ES_Union (
   UID                  varchar(50)          not null,
   LBID                 varchar(50)          null,
   RBID                 varchar(50)          null,
   UKind                int                  null,
   LValue               varchar(200)         null,
   RValue               varchar(200)         null,
   LKind                int                  null,
   RKind                int                  null,
   constraint PK_ES_UNION primary key (UID)
)

if not exists (select 1 from  sysobjects where  id = object_id('ESK_Union') and   type = 'U')
/*==============================================================*/
/* Drop Table ESK_Union                                              */
/*==============================================================*/
create table ESK_Union (
   XZQH                 varchar(6)           not null,
   JGDM                 varchar(10)          not null,
   UID                  varchar(50)          not null,
   LBID                 varchar(50)          null,
   RBID                 varchar(50)          null,
   UKind                int                  null,
   LValue               varchar(200)         null,
   RValue               varchar(200)         null,
   LKind                int                  null,
   RKind                int                  null,
   constraint PK_ESK_UNION primary key (XZQH, JGDM, UID)
)

if not exists (select 1 from  sysobjects where  id = object_id('EB_ETLConfig') and   type = 'U')
/*==============================================================*/
/* Drop Table EB_ETLConfig                                          */
/*==============================================================*/
create table EB_ETLConfig (
   FID                   varchar(50)          not null,
   ZTID                  varchar(50)          null,
   IsIntoCH0A            int                  null,
   IsIntoMid             int                  null,
   SYRangerMode          int                  null,
   ICDICCMMapType        int                  null,
   IsReadInHospital      int                  null,
   IsICDInsertToDataBase int                  null,
   ZYH                   varchar(50)          null,
   ZYCS                  varchar(5)           null, 
   BADateStart           datetime             null,
   BADateEnd             datetime             null,
   TJDateStart           datetime             null,
   TJDateEnd             datetime             null,
   AutoRunTime           datetime             null,
   AutoRunTS             int                  null,   
   constraint PK_EB_ETLCONFIG primary key (FID)
)

if not exists (select 1 from  sysobjects where  id = object_id('EB_ReadList_Dic') and   type = 'U')
/*==============================================================*/
/* Drop Table EB_ReadList_Dic                                       */
/*==============================================================*/
create table EB_ReadList_Dic (
   Mode                 int                  not null,
   Kind                 int                  null,
   ClassName            varchar(128)         null,
   TableName            varchar(128)         null,
   MTableName           varchar(128)         null,
   BAH_FN               varchar(128)         null,
   MBAH_FN              varchar(128)         null,
   Caption              varchar(128)         null,
   constraint PK_EB_READLIST_DIC primary key (Mode)
)


if not exists (select 1 from  sysobjects where  id = object_id('EB_ReadList') and   type = 'U')
/*==============================================================*/
/* Drop Table EB_ReadList                                            */
/*==============================================================*/
create table EB_ReadList (
   FID                  varchar(50)          not null,
   Mode                 int                  not null,
   IsRead               int                  null,
   constraint PK_EB_READLIST primary key (FID, Mode)
)

if not exists (select 1 from  sysobjects where  id = object_id('VsInhospital') and   type = 'U')
/*==============================================================*/
/* Drop Table VsInhospital                                             */
/*==============================================================*/
create table VsInhospital (
	[BRID] [varchar] (50)   NOT NULL ,
	[CH0A02] [varchar] (20)   NULL ,
	[CH0A03] [varchar] (1)    NULL ,
	[CH0A21] [varchar] (20)   NULL ,
	[CH0A23] [varchar] (20)   NULL ,
	[CH0A24] [datetime] NULL ,
	[CH0A27] [datetime] NULL ,
	[CH0ABA] [varchar] (20)   NULL ,
	[CH0ABC] [varchar] (20)   NULL ,
	[CH0ABD] [varchar] (20)   NULL ,
	[CH0ABE] [varchar] (20)   NULL , -- 入院诊疗组
	[CH0A34] [varchar] (30)   NULL ,
   constraint PK_VSINHOSPITAL primary key (BRID)
)


if not exists (select 1 from  sysobjects where  id = object_id('VsTjZK_12') and   type = 'U')
/*==============================================================*/
/* Drop Table VsTjZK_12                                             */
/*==============================================================*/
CREATE TABLE [VsTjZK_12](
	[BRID] [varchar](50) NOT NULL, -- 病人ID
	[CHZK01] [datetime] NOT NULL,    -- 转科日期
	[CHZK02] [varchar](50) NULL, -- 姓名
	[CHZK03] [int]     NULL ,  -- 性别
	[CHZK04] [varchar](20) NULL, -- 转出科室
	[CHZK05] [varchar](20) NULL, -- 转入科室
	[CHZK06] [varchar](20) NULL, -- 转出医师
	[CHZK07] [varchar](20) NULL, -- 转入医师
	[CHZK08] [varchar](20) NULL, -- 转出床位
	[CHZK09] [varchar](20) NULL, -- 转入床位
	[CHZK10] [varchar](20) NULL, -- 转出诊疗组
	[CHZK11] [varchar](20) NULL, -- 转入诊疗组
	[CHZK12] [varchar](20) NULL, -- 转出病区
	[CHZK13] [varchar](20) NULL, -- 转入病区
 CONSTRAINT [PK_VSTJZK_12] PRIMARY KEY ([BRID], [CHZK01])
) 

if not exists (select 1 from  sysobjects where  id = object_id('ES_FunFields') and   type = 'U')
CREATE TABLE [ES_FunFields](
	[FID] [varchar](50) NOT NULL,
	[DField] [varchar](50) NULL,
	[SField] [varchar](50) NULL,
 CONSTRAINT [PK_ES_FUNFIELDS] PRIMARY KEY ([FID])
)

if col_length('ES_Fields', 'IsMZID') Is Null
  Alter Table ES_Fields Add IsMZID int
if col_length('ES_Fields', 'IsJZRQ') Is Null
  Alter Table ES_Fields Add IsJZRQ int
if col_length('ESK_Fields', 'IsMZID') Is Null
  Alter Table ESK_Fields Add IsMZID int
if col_length('ESK_Fields', 'IsJZRQ') Is Null
  Alter Table ESK_Fields Add IsJZRQ int
if col_length('EB_ETLConfig', 'MZRangerMode') Is Null
  Alter Table EB_ETLConfig Add MZRangerMode int
if col_length('EB_ETLConfig', 'MZID') Is Null
  Alter Table EB_ETLConfig Add MZID varchar(50)


-- 数据ETL End ----

IF Col_Length('VsZHDM','JYET')<=4
   Alter Table VsZHDM Alter Column JYET VarChar(20)

-- 为完成从在院人数表中生成住院工作日志增下面字段
if Col_Length('VsInhospital', 'CHYear') Is Null
   Alter Table VsInhospital Add CHYear varchar(4)
if Col_Length('VsInhospital', 'CH0A01') Is Null
   Alter Table VsInhospital Add CH0A01 varchar(50)
if Col_Length('VsInhospital', 'CH0A29') Is Null
   Alter Table VsInhospital Add CH0A29 int
if Col_Length('VsInhospital', 'Ch0A41') Is Null
   Alter Table VsInhospital Add Ch0A41 int 
if Col_Length('VsInhospital', 'CH0A46') Is Null
   Alter Table VsInhospital Add CH0A46 int 
if Col_Length('VsInhospital', 'CH0A38') Is Null
   Alter Table VsInhospital Add CH0A38 varchar(20)
-- 是否销号（如果病历销号则不参加生成住院工作日志统计）
if Col_Length('VsInhospital', 'IsCancel') Is Null
   Alter Table VsInhospital Add IsCancel int
   
Alter Table VsSingleICD Alter Column STj VarChar(5000)
Alter Table VsSingleICD Alter Column SICD_UP VarChar(20)
Alter Table VsSingleICD Alter Column SICD_DOWN VarChar(20)
Alter Table VsSingleICD Alter Column SICCM_UP VarChar(20)
Alter Table VsSingleICD Alter Column SICCM_DOWN VarChar(20)  
 
if  Col_Length('Vstjmz_mx','mzmx07') Is Null
begin
	select * into tmp_Vstjmz_mx from vstjmz_mx
	drop table vstjmz_mx

	delete from tmp_Vstjmz_mx where mzmx01 in (select mzmx01 from tmp_Vstjmz_mx group by mzmx01 having count(*) > 1)

	CREATE TABLE [dbo].[Vstjmz_mx](
		[mzmxrq] [datetime] NOT NULL,				--门诊挂号日期
		[mzmx01] [varchar](20) NOT NULL,			--门诊ID	
		[mzmx02] [varchar](20) NULL,				--患者姓名
		[mzmx03] [int] NULL,						--性别
		[mzmx04] [varchar](4) NULL,					--科别
		[mzmx05] [varchar](20) NULL,				--医师
		[mzmx06] [varchar](20) NULL,				--挂号类别01门诊0101专科0102专家02急诊
		[mzmx07] [varchar](20) NULL,				--诊疗组
		[mzmxa1] [varchar](2) NULL,					--医疗付款方式 
		[mzmxa2] [varchar](20) NULL,				--身份证号   
		[mzmxa3] [datetime] NULL,					--出生日期
		[mzmxa4] [int] NULL,						--年龄    
		[mzmxa5] [varchar](20) NULL,				--民族   
		[mzmxa6] [varchar](2) NULL,					--职业 
		[mzmxa7] [varchar](40) NULL,				--国籍
		[mzmxa8] [varchar](200) NULL,				--住址
		[mzmxa9] [varchar](20) NULL,				--联系电话
		[mzmxaa] [datetime] NULL,					--就诊时间
		[mzmxab] [varchar](10) NULL,				--门诊医师职称
		[mzmxac] [int] NULL,						--是否复诊
		[mzmxad] [int] NULL,						--是否预约
		[mzmxae] [varchar](20) NULL,				--预约方式
		[mzmxaf] [int] NULL,						--是否死亡
		[mzmxag] [varchar](200) NULL,				--门诊诊断描述
		[mzmxah] [varchar](20) NULL,				--门诊诊断编码
		[mzmxai] [int] NULL,						--处方张数
		[mzmxf1] [numeric](12, 2) NULL,				--门诊总费用
		[mzmxf2] [numeric](12, 2) NULL,				--其中：自付金额
		[mzmxf3] [numeric](12, 2) NULL,				--西药费
		[mzmxf4] [numeric](12, 2) NULL,				--其中：抗菌药费
		[mzmxf5] [numeric](12, 2) NULL,				--中成药费
		[mzmxf6] [numeric](12, 2) NULL,				--中草药费
		[mzmxf7] [numeric](12, 2) NULL,				--检查费
		[mzmxf8] [numeric](12, 2) NULL,				--  其中：X光费
		[mzmxf9] [numeric](12, 2) NULL,				--  其中：CT费
		[mzmxfa] [numeric](12, 2) NULL,				--  其中：MRI费
		[mzmxfb] [numeric](12, 2) NULL,				--其它检查费
		[mzmxfc] [numeric](12, 2) NULL,				--材料费
		[mzmxfd] [numeric](12, 2) NULL,				--检验费
		[mzmxfe] [numeric](12, 2) NULL,				--治疗费
		[mzmxff] [numeric](12, 2) NULL,				--其它费
		[mzmxfg] [numeric](12, 2) NULL,				--检查费其中：超声费 -- 后来增加 
			CONSTRAINT PK_Vstjmz_mx PRIMARY KEY  CLUSTERED 
			 (
				mzmx01
			  )  ON [PRIMARY]
		) ON [PRIMARY]
    Exec (
	'insert into VSTJMZ_MX (mzmxrq, mzmx01, mzmx02, mzmx03, mzmx04, mzmx05, mzmx06, mzmxa1, mzmxa2, mzmxa3, mzmxa4,mzmxa5, 
							mzmxa6, mzmxa7, mzmxa8, mzmxa9, mzmxaa, mzmxab, mzmxac, mzmxad, mzmxae, mzmxaf, mzmxag, mzmxah, mzmxai, 
							mzmxf1, mzmxf2, mzmxf3, mzmxf4, mzmxf5, mzmxf6, mzmxf7, mzmxf8, mzmxf9, mzmxfa, mzmxfb, mzmxfc, mzmxfd, mzmxfe, mzmxff)
					select mzmxrq, mzmx01, mzmx02, mzmx03, mzmx04, mzmx05, mzmx06, mzmxa1, mzmxa2, mzmxa3, mzmxa4, mzmxa5, 
							mzmxa6, mzmxa7, mzmxa8, mzmxa9, mzmxaa, mzmxab, mzmxac, mzmxad, mzmxae, mzmxaf, mzmxag, mzmxah, mzmxai, 
							mzmxf1, mzmxf2, mzmxf3, mzmxf4, mzmxf5, mzmxf6, mzmxf7, mzmxf8, mzmxf9, mzmxfa, mzmxfb, mzmxfc, mzmxfd, mzmxfe, mzmxff 
							from tmp_Vstjmz_mx')					
						
	drop table tmp_Vstjmz_mx
end
 
if  not exists (select 1 from  sysobjects where  id = object_id('VsHolidays') and   type = 'U') begin
  Create table VsHolidays
    ([DATE] Datetime NOT NULL,
     sfsjjr int NULL,  
     [week] varchar(50) NULL,
   constraint PK_TETL_VsHolidays primary key ([DATE]))
  Exec ('if not Exists(Select 1 From VsHolidays) begin
          Declare @D Datetime, @W varchar(10)
          Set @D=''2000-01-01''
          while @D<=''2100-12-31'' begin
            Select @W=Case DATEPART(dw, @D) When 2 Then ''星期一'' When 3 Then  ''星期二'' When 4 Then  ''星期三''  When 5 Then  ''星期四''
                                          When 6 Then ''星期五'' When 7 Then  ''星期六'' When 1 Then  ''星期日'' End
            Insert VsHolidays([Date], sfsjjr, [Week])
              Select @D DD, (Case When @W=''星期日'' Then 1 Else 0 End) JR, @W WW
            Set @D=DateAdd(dd, 1, @D)
          end
        End')
end

 --添加是否启用病历回收，默认为不启用
IF Col_Length('VsBaSet','VsIsBLHS') is null Begin
   Alter Table VsBaSet Add VsIsBLHS int
   Exec('Update VsBaSet Set VsIsBLHS=0')
End  

-- 将ETL抽取配置中 是否读取到中间库，是否读取到正式库，ICD匹配模式，和ICD是否插入代码库 四个字段的保存位置 从 EB_ETLConfig 移到 EB_Theme
-- 修改ETL表
if col_length('EB_Theme', 'IsIntoCH0A') Is Null begin
  Alter Table EB_Theme Add IsIntoCH0A int 
  Exec('Update EB_Theme Set IsIntoCH0A=iValue From (Select ZTID, IsIntoCH0A iValue From EB_ETLConfig) T Where EB_Theme.ZTID=T.ZTID')
  Alter Table EB_ETLConfig Drop column IsIntoCH0A
end
if col_length('EB_Theme', 'IsIntoMid') Is Null begin
  Alter Table EB_Theme Add IsIntoMid int 
  Exec('Update EB_Theme Set IsIntoMid=iValue From (Select ZTID, IsIntoMid iValue From EB_ETLConfig) T Where EB_Theme.ZTID=T.ZTID')
  Alter Table EB_ETLConfig Drop column IsIntoMid
end
if col_length('EB_Theme', 'ICDICCMMapType') Is Null begin 
  Alter Table EB_Theme Add ICDICCMMapType int 
  Exec('Update EB_Theme Set ICDICCMMapType=iValue From (Select ZTID, ICDICCMMapType iValue From EB_ETLConfig) T Where EB_Theme.ZTID=T.ZTID')
  Alter Table EB_ETLConfig Drop column ICDICCMMapType
end
if col_length('EB_Theme', 'IsICDInsertToDataBase') Is Null begin 
  Alter Table EB_Theme Add IsICDInsertToDataBase int 
  Exec('Update EB_Theme Set IsICDInsertToDataBase=iValue From (Select ZTID, IsICDInsertToDataBase iValue From EB_ETLConfig) T Where EB_Theme.ZTID=T.ZTID')
  Alter Table EB_ETLConfig Drop column IsICDInsertToDataBase
end
-- 修改ETL表库
if col_length('EBK_Theme', 'IsIntoCH0A') Is Null
  Alter Table EBK_Theme Add IsIntoCH0A int 
if col_length('EBK_Theme', 'IsIntoMid') Is Null
  Alter Table EBK_Theme Add IsIntoMid int 
if col_length('EBK_Theme', 'ICDICCMMapType') Is Null
  Alter Table EBK_Theme Add ICDICCMMapType int 
if col_length('EBK_Theme', 'IsICDInsertToDataBase') Is Null
  Alter Table EBK_Theme Add IsICDInsertToDataBase int 

-- 增加抽取内容显示控制和工作日志直接读取
if col_length('EB_READLIST_DIC', 'IsShow') Is Null
  Alter Table EB_READLIST_DIC Add IsShow int
if col_length('EB_ETLConfig', 'TjMzKind') Is Null
  Alter Table EB_ETLConfig Add TjMzKind int
if col_length('EB_ETLConfig', 'TjZyKind') Is Null
  Alter Table EB_ETLConfig Add TjZyKind int

-- 增加首页调用主题设置
if col_length('EB_Theme', 'IsCH0AZT') Is Null
  Alter Table EB_Theme Add IsCH0AZT int 
if col_length('EBK_Theme', 'IsCH0AZT') Is Null
  Alter Table EBK_Theme Add IsCH0AZT int 

-- 病案示踪增加条形码
IF Col_Length('VSCH0A','CH0ABarcode') Is Null
	alter table VSCH0A	add CH0ABarcode varchar(20)
IF Col_Length('VsCh_Patientinfo','CH0MBarcode') Is Null
	alter table VsCh_Patientinfo add CH0MBarcode varchar(20)
IF Col_Length('VsBaSet','IsBarcode') Is Null Begin
   Alter Table VsBaSet Add IsBarcode int
   Exec('Update VsBaSet Set IsBarcode=0')
End

IF Col_Length('VsCH0E','CH0ESC00') Is Null Alter Table VsCH0E Add CH0ESC00 int NULL				--是否择期手术
IF Col_Length('VsCH0E','CH0ESC01') Is Null Alter Table VsCH0E Add CH0ESC01 int NULL				--术前准备时间——天
IF Col_Length('VsCH0E','CH0ESC02') Is Null Alter Table VsCH0E Add CH0ESC02 datetime NULL		--手术开始时间
IF Col_Length('VsCH0E','CH0ESC03') Is Null Alter Table VsCH0E Add CH0ESC03 datetime NULL		--手术结束时间
IF Col_Length('VsCH0E','CH0ESC04') Is Null Alter Table VsCH0E Add CH0ESC04 datetime NULL		--术前预防性抗菌药物给药时间
IF Col_Length('VsCH0E','CH0ESC05') Is Null Alter Table VsCH0E Add CH0ESC05 datetime NULL		--麻醉开始时间
IF Col_Length('VsCH0E','CH0ESC06') Is Null Alter Table VsCH0E Add CH0ESC06 int NULL				--有无重返手术室手术计划
IF Col_Length('VsCH0E','CH0ESC07') Is Null Alter Table VsCH0E Add CH0ESC07 varchar(200) NULL	--重返手术室目的
IF Col_Length('VsCH0E','CH0ESC08') Is Null Alter Table VsCH0E Add CH0ESC08 int NULL				--手术切口感染  有无
IF Col_Length('VsCH0E','CH0ESC09') Is Null Alter Table VsCH0E Add CH0ESC09 varchar(200) NULL	--手术切口感染—____
IF Col_Length('VsCH0E','CH0ESC10') Is Null Alter Table VsCH0E Add CH0ESC10 varchar(200) NULL	--手术并发症_____
-------------------------------------------------------------------------
IF Col_Length('VsCH_CH0E','CH0ESC00') Is Null Alter Table VsCH_CH0E Add CH0ESC00 int NULL				--是否择期手术
IF Col_Length('VsCH_CH0E','CH0ESC01') Is Null Alter Table VsCH_CH0E Add CH0ESC01 int NULL				--术前准备时间——天
IF Col_Length('VsCH_CH0E','CH0ESC02') Is Null Alter Table VsCH_CH0E Add CH0ESC02 datetime NULL		--手术开始时间
IF Col_Length('VsCH_CH0E','CH0ESC03') Is Null Alter Table VsCH_CH0E Add CH0ESC03 datetime NULL		--手术结束时间
IF Col_Length('VsCH_CH0E','CH0ESC04') Is Null Alter Table VsCH_CH0E Add CH0ESC04 datetime NULL		--术前预防性抗菌药物给药时间
IF Col_Length('VsCH_CH0E','CH0ESC05') Is Null Alter Table VsCH_CH0E Add CH0ESC05 datetime NULL		--麻醉开始时间
IF Col_Length('VsCH_CH0E','CH0ESC06') Is Null Alter Table VsCH_CH0E Add CH0ESC06 int NULL				--有无重返手术室手术计划
IF Col_Length('VsCH_CH0E','CH0ESC07') Is Null Alter Table VsCH_CH0E Add CH0ESC07 varchar(200) NULL	--重返手术室目的
IF Col_Length('VsCH_CH0E','CH0ESC08') Is Null Alter Table VsCH_CH0E Add CH0ESC08 int NULL				--手术切口感染  有无
IF Col_Length('VsCH_CH0E','CH0ESC09') Is Null Alter Table VsCH_CH0E Add CH0ESC09 varchar(200) NULL	--手术切口感染—____
IF Col_Length('VsCH_CH0E','CH0ESC10') Is Null Alter Table VsCH_CH0E Add CH0ESC10 varchar(200) NULL	--手术并发症_____
----------------------------------------------------------------
if not exists (select 1 from  sysobjects where  id = object_id('VsCh0Q') and   type = 'U')
Begin
	Create table VsCh0Q (
				CHYEAR	Varchar(4)          not null,
				CH0Q01	Varchar(50)         not null,
				CH0Q02	Varchar(20),	--1术者或I助      
				CH0Q03	Varchar(20),	--1 麻醉医师   
				CH0Q04	Varchar(20),	--2、术者或I助    
				CH0Q05	Varchar(20),	--2 麻醉医师
				CH0Q06	Varchar(20),	--3术者或I助 
				CH0Q07	Varchar(20),	--3麻醉医师
				CH0Q08	Varchar(20),	--4术者或I助
				CH0Q09	Varchar(20),	--4麻醉医师
				CH0Q10	Varchar(20),	--主诊医师
				CH0Q11	int,			--患者入住重症监护病房：□ 1.无   2.有
				CH0Q12	int,			--患者入住重症监护室期间器械使用情况：□ 1.无   2.有
				CH0Q13	int,			--医院感染情况：□1.有  2.无      
				CH0Q14	int,			--医院感染是否与手术相关：  是    否 
				CH0Q15	int,			--标本血液1
				CH0Q16	Varchar(20),	--血液病原学代码1
				CH0Q17	DateTime,		--血液标本时间1
				CH0Q18	int,			--标本尿液1
				CH0Q19	Varchar(20),	--尿液病原学代码1
				CH0Q20	DateTime,		--尿液标本时间1
				CH0Q21	int,			--标本粪便1
				CH0Q22	Varchar(20),	--粪便病原学代码1	
				CH0Q23	DateTime,		--粪便标本时间1
				CH0Q24	int,			--标本痰液1
				CH0Q25	Varchar(20),	--痰液病原学代码1
				CH0Q26	DateTime,		--痰液标本时间1
				CH0Q27	int,			--其他标本1	
				CH0Q28	Varchar(20),	--分泌物病原学代码1
				CH0Q29	DateTime,		--分泌物标本时间1	
				CH0Q30	int,			--标本血液2
				CH0Q31	Varchar(20),	--血液病原学代码2
				CH0Q32	DateTime,		--血液标本时间2
				CH0Q33	int,			--标本尿液2
				CH0Q34	Varchar(20),	--尿液病原学代码2
				CH0Q35	DateTime,		--尿液标本时间2
				CH0Q36	int,			--标本粪便2
				CH0Q37	Varchar(20),	--粪便病原学代码2	
				CH0Q38	DateTime,		--粪便标本时间2
				CH0Q39	int,			--标本痰液2
				CH0Q40	Varchar(20),	--痰液病原学代码2
				CH0Q41	DateTime,		--痰液标本时间2
				CH0Q42	int,			--其他标本2				
				CH0Q43	Varchar(20),	--分泌物病原学代码2
				CH0Q44	DateTime,		--分泌物标本时间2			
				CH0Q45	int,			--抗菌药物使用情况 □I种 □Ⅱ联□  □Ⅲ联   □Ⅳ联   □＞Ⅳ联  			
				CH0Q46	Varchar(100),	--引发输液反应药物——__
				CH0Q47	Varchar(200),	--输液反应临床表现			 
				CH0Q48	Varchar(20),	--离院时透析（血透、腹透）尿素氮值：
				CH0QSC01 Varchar(20),	--主诊医师
				CH0QSC02 decimal(18,6), --住院期间抗菌药物累积DDD数__ 
				CH0QSC03 int,			--会诊情况 □ 1.无  2.有
				CH0QSC04 int,			--院内会诊       次
				CH0QSC05 int,			--外院会诊(次)
				CH0QSC06 int,			--其他会诊
				CH0QSC07 int,			--CT
				CH0QSC08 int,			--PETCT
				CH0QSC09 int,			--双源CT
				CH0QSC10 int,			--X片
				CH0QSC11 int,			--B超
				CH0QSC12 int,			--超声心动图
				CH0QSC13 int,			--MRI
				CH0QSC14 int,			--同位素检查     1.阳性 2.阴性 3、未做
				CH0QSC15 int,           --  是否实施临床路径
				CH0Q49	 int,			--抗菌药物标志 1无2有
				CH0Q50	 int,			--分泌物标本1
				CH0Q51	 int,			--分泌物标本2
                CH0QK1   Varchar(100),	--抗菌药物1
				CH0QK2   Varchar(100),	--抗菌药物2
				CH0QK3   Varchar(100),	--抗菌药物3
				CH0QK4   Varchar(100),	--抗菌药物4
				CH0QK5   Varchar(100),	--抗菌药物5
				CH0QK6   Varchar(100),	--抗菌药物6
				   constraint PK_VsCh0Q primary key (CHYEAR,CH0Q01)
					)
End 
--------------------------------------------------------------------
if not exists (select 1 from  sysobjects where  id = object_id('VsCH_Ch0Q') and   type = 'U')
Begin
	Create table VsCH_Ch0Q (
				CHYEAR	Varchar(4)          not null,
				CH0Q01	Varchar(50)         not null,
				CH0Q02	Varchar(20),	--1术者或I助      
				CH0Q03	Varchar(20),	--1 麻醉医师   
				CH0Q04	Varchar(20),	--2、术者或I助    
				CH0Q05	Varchar(20),	--2 麻醉医师
				CH0Q06	Varchar(20),	--3术者或I助 
				CH0Q07	Varchar(20),	--3麻醉医师
				CH0Q08	Varchar(20),	--4术者或I助
				CH0Q09	Varchar(20),	--4麻醉医师
				CH0Q10	Varchar(20),	--主诊医师
				CH0Q11	int,			--患者入住重症监护病房：□ 1.无   2.有
				CH0Q12	int,			--患者入住重症监护室期间器械使用情况：□ 1.无   2.有
				CH0Q13	int,			--医院感染情况：□1.有  2.无      
				CH0Q14	int,			--医院感染是否与手术相关：  是    否 
				CH0Q15	int,			--标本血液1
				CH0Q16	Varchar(20),	--血液病原学代码1
				CH0Q17	DateTime,		--血液标本时间1
				CH0Q18	int,			--标本尿液1
				CH0Q19	Varchar(20),	--尿液病原学代码1
				CH0Q20	DateTime,		--尿液标本时间1
				CH0Q21	int,			--标本粪便1
				CH0Q22	Varchar(20),	--粪便病原学代码1	
				CH0Q23	DateTime,		--粪便标本时间1
				CH0Q24	int,			--标本痰液1
				CH0Q25	Varchar(20),	--痰液病原学代码1
				CH0Q26	DateTime,		--痰液标本时间1
				CH0Q27	int,			--其他标本1	
				CH0Q28	Varchar(20),	--分泌物病原学代码1
				CH0Q29	DateTime,		--分泌物标本时间1	
				CH0Q30	int,			--标本血液2
				CH0Q31	Varchar(20),	--血液病原学代码2
				CH0Q32	DateTime,		--血液标本时间2
				CH0Q33	int,			--标本尿液2
				CH0Q34	Varchar(20),	--尿液病原学代码2
				CH0Q35	DateTime,		--尿液标本时间2
				CH0Q36	int,			--标本粪便2
				CH0Q37	Varchar(20),	--粪便病原学代码2	
				CH0Q38	DateTime,		--粪便标本时间2
				CH0Q39	int,			--标本痰液2
				CH0Q40	Varchar(20),	--痰液病原学代码2
				CH0Q41	DateTime,		--痰液标本时间2
				CH0Q42	int,			--其他标本2				
				CH0Q43	Varchar(20),	--分泌物病原学代码2
				CH0Q44	DateTime,		--分泌物标本时间2			
				CH0Q45	int,			--抗菌药物使用情况 □I种 □Ⅱ联□  □Ⅲ联   □Ⅳ联   □＞Ⅳ联  			
				CH0Q46	Varchar(100),	--引发输液反应药物——__
				CH0Q47	Varchar(200),	--输液反应临床表现			 
				CH0Q48	Varchar(20),	--离院时透析（血透、腹透）尿素氮值：
				CH0QSC01 Varchar(20),	--主诊医师
				CH0QSC02 decimal(18,6), --住院期间抗菌药物累积DDD数__ 
				CH0QSC03 int,			--会诊情况 □ 1.无  2.有
				CH0QSC04 int,			--院内会诊       次
				CH0QSC05 int,			--外院会诊(次)
				CH0QSC06 int,			--其他会诊
				CH0QSC07 int,			--CT
				CH0QSC08 int,			--PETCT
				CH0QSC09 int,			--双源CT
				CH0QSC10 int,			--X片
				CH0QSC11 int,			--B超
				CH0QSC12 int,			--超声心动图
				CH0QSC13 int,			--MRI
				CH0QSC14 int,			--同位素检查     1.阳性 2.阴性 3、未做
                CH0QSC15 int,           --  是否实施临床路径				
				CH0Q49	 int,			--抗菌药物标志 1无2有
				CH0Q50	 int,			--分泌物标本1
				CH0Q51	 int,			--分泌物标本2
                CH0QK1   Varchar(100),	--抗菌药物1
				CH0QK2   Varchar(100),	--抗菌药物2
				CH0QK3   Varchar(100),	--抗菌药物3
				CH0QK4   Varchar(100),	--抗菌药物4
				CH0QK5   Varchar(100),	--抗菌药物5
				CH0QK6   Varchar(100),	--抗菌药物6
				   constraint PK_VsCH_Ch0Q primary key (CHYEAR,CH0Q01)
					)
End 
---------------------------------------------------------------------
--VSCH0R	患者入住重症监护室期间器械使用情况
if not exists (select 1 from  sysobjects where  id = object_id('VsCh0R') and   type = 'U')
Begin
	Create Table VSCH0R(
				CHYEAR	Varchar(4)	not null,
				CH0R01	Varchar(50)	not null,
				CH0R02	int	not null,	--序号
				CH0R03	int,			--ICU类型
				CH0R04	varchar(50),	--使用器械及导管类型
				CH0R05	DateTime,		--开始时间
				CH0R06	DateTime,		--结束使用时间
				CH0R07	int,			--是否发生器械或导管相关感染
				CH0R08	int,			--累计时间（单位小时：小时）
				CH0R09	int,			--累计时间（单位小时：分）
				   constraint PK_VsCh0R primary key (CHYEAR,CH0R01,CH0R02)
					)
End   
-------------------------------------------------------------------------
if not exists (select 1 from  sysobjects where  id = object_id('VSCH_CH0R') and   type = 'U')
Begin
	Create Table VSCH_CH0R(
				CHYEAR	Varchar(4)	not null,
				CH0R01	Varchar(50)	not null,
				CH0R02	int	not null,	--序号
				CH0R03	int,			--ICU类型
				CH0R04	varchar(50),	--使用器械及导管类型
				CH0R05	DateTime,		--开始时间
				CH0R06	DateTime,		--结束使用时间
				CH0R07	int,			--是否发生器械或导管相关感染
				CH0R08	int,			--累计时间（单位小时：小时）
				CH0R09	int,			--累计时间（单位小时：分）
				   constraint PK_VsCH_Ch0R primary key (CHYEAR,CH0R01,CH0R02)
					)
End  
  
------------------------------------------------------------------
--VSCH0S	患者入住重症监护病房_四川附页
if not exists (select 1 from  sysobjects where  id = object_id('VsCh0S') and   type = 'U')
Begin
	Create Table VSCH0S(
				CHYEAR	Varchar(4)	not null,
				CH0S01	Varchar(50)	not	null,
				CH0S02	Int not null,
				CH0S03	int,			--ICU类型
				CH0S04	DateTime,		--入住时间
				CH0S05	DateTime,		--转出时间
				CH0S06	int,			--再次入住ICU计划 无有
				CH0S07	Varchar(200),	--再次入住原因
				   constraint PK_VsCh0S primary key (CHYEAR,CH0S01,CH0S02)
					)
End
-------------------------------------------------------------------------
if not exists (select 1 from  sysobjects where  id = object_id('VSCH_CH0S') and   type = 'U')
Begin
	Create Table VSCH_CH0S(
				CHYEAR	Varchar(4)	not null,
				CH0S01	Varchar(50)	not	null,
				CH0S02	Int not null,
				CH0S03	int,			--ICU类型
				CH0S04	DateTime,		--入住时间
				CH0S05	DateTime,		--转出时间
				CH0S06	int,			--再次入住ICU计划 无有
				CH0S07	Varchar(200),	--再次入住原因
				   constraint PK_VsCH_Ch0S primary key (CHYEAR,CH0S01,CH0S02)
					)
End      			
-------------------------------------------------------------------------
----VSCH0T	四川附页感染
if not exists (select 1 from  sysobjects where  id = object_id('VSCH0T') and   type = 'U')
Begin
	Create Table VSCH0T(
				CHYEAR	Varchar(4)	not null,
				CH0T01	Varchar(50)	not	null,
				CH0T02	Int	not null,	--序号
				CH0T03	DateTime,		--感染确诊日期1
				CH0T04	Varchar(100),	--感染部位1
				CH0T05	Varchar(100),	--感染名称1
				   constraint PK_VSCH0T primary key (CHYEAR,CH0T01,CH0T02)
					)
End 
-------------------------------------------------------------------------
if not exists (select 1 from  sysobjects where  id = object_id('VSCH_CH0T') and   type = 'U')
Begin
	Create Table VSCH_CH0T(
				CHYEAR	Varchar(4)	not null,
				CH0T01	Varchar(50)	not	null,
				CH0T02	Int	not null,	--序号
				CH0T03	DateTime,		--感染确诊日期1
				CH0T04	Varchar(100),	--感染部位1
				CH0T05	Varchar(100),	--感染名称1
				   constraint PK_VSCH_CH0T primary key (CHYEAR,CH0T01,CH0T02)
					)
End

-------------------------------------------------------------------------

-- 病案复印表中的 病案号长度 由 10 改为 50
if Col_Length('VsDBaCopy','CIFYBa')=10 
Begin
	select * into #VsDBaCopy from VsDBaCopy
	drop table VsDBaCopy
	CREATE TABLE VsDBaCopy(
		CIFYYear varchar(4) NOT NULL,
		CIFYID int NOT NULL,
		CIBaYear varchar(4) NOT NULL,
		CIFYBa varchar(50) NOT NULL,
		CIFYBName varchar(20) ,
		CIFYBSex varchar(1) ,
		CIFYBCYRQ datetime ,
		CIFYBCYKB varchar(4) ,
		CIFYGDH varchar(20) ,
		CIFYZS int ,
		CIFYItem varchar(100) ,
		CIFYUseFor varchar(10) ,
		constraint PK_VsDBaCopy primary key (CIFYYear,CIFYID,CIBaYear,CIFYBa)
					)
	insert into VsDBaCopy select * from #VsDBaCopy 
	drop table #VsDBaCopy
End

-- 在院病人表增加 入院时间 和 出院时间 与A表保持一致
if col_length('VsInhospital', 'CH0A24_SJ') is null
  alter table VsInhospital add CH0A24_SJ varchar(5) null
if col_length('VsInhospital', 'CH0A27_SJ') is null
  alter table VsInhospital add CH0A27_SJ varchar(5) null
-- 增加中医TCD码对照  
if col_length('VsUseZYBZ', 'GBDM') Is Null
  Alter Table VsUseZYBZ Add GBDM VarChar(20)
if col_length('VsUseZYBZ', 'GBMC') Is Null
  Alter Table VsUseZYBZ Add GBMC VarChar(200)


-- 为增加读取速度，将Union语句拆分进行查询
if col_length('ES_Tables', 'IsUnion') Is Null
  Alter Table ES_Tables Add IsUnion int 
if col_length('ESK_Tables', 'IsUnion') Is Null
  Alter Table ESK_Tables Add IsUnion int

if not exists (select 1 from  sysobjects where  id = object_id('ES_Tables_Union') and   type = 'U')
/*==============================================================*/
/* Drop Table ES_Tables_Union                                   */
/*==============================================================*/
create table ES_Tables_Union (
   UID                  varchar(50)          not null,
   XH                   int                  null,
   BID                  varchar(50)          null,
   BSQL                 text                 null,
   Memo                 varchar(100)         null,
   constraint PK_ES_TABLES_Union primary key (UID)
)

if not exists (select 1 from  sysobjects where  id = object_id('ESK_Tables_Union') and   type = 'U')
/*=INT==========================================================*/
/* Drop Table ESK_Tables_Union                                             */
/*==============================================================*/
create table ESK_Tables_Union (
   XZQH                 varchar(6)           not null,
   JGDM                 varchar(10)          not null,
   UID                  varchar(50)          not null,
   XH                   int                  null,
   BID                  varchar(50)          null,
   BSQL                 text                 null,
   Memo                 varchar(100)         null,
   constraint PK_ESK_TABLES_Union primary key (XZQH, JGDM, UID)
)

-- 产科数据上报
if not exists (select 1 from sysobjects where id = object_id('VsWt47_1') and type = 'U')
Begin
create table VsWt47_1(
  CHYear varchar(4) not null,
  WT4701 varchar(50) not null primary key(chyear,WT4701),
  CF_BH varchar(64),
  CF_JDSJ DATETIME,--YYYYMMDD
  CF_YC INT null,  --孕次
  CF_CC INT null,  --产次
  CF_YFZC INT NULL, --孕周
  CF_GWYS char(1) null,--本次是否属于高危妊娠 1是,2否,9不清楚
  CF_FMDD char(1) null,--分娩地点 1医疗机构内,2医疗机构外
  CF_FMFS char(1) null,--分娩方式 1阴道产,2剖宫产
  CF_FMRQ DATETIME null,--分娩日期 YYYYMMDD
  FM_XB1 varchar(1) null,--第一胎性别 1男,2女,9性别不明
  FM_RSJJ1 varchar(1) null,--第一胎妊娠结局 1活产,2死胎死产
  FM_PF1 varchar(2) null, -- 第一胎Apgar评分
  FM_XB2 varchar(1),--1男,2女,9性别不明
  FM_RSJJ2 varchar(1),--1活产,2死胎死产
  FM_PF2 varchar(2),
  FM_XB3 varchar(1),--1男,2女,9性别不明
  FM_RSJJ3 varchar(1),--1活产,2死胎死产
  FM_PF3 varchar(2),
  FM_XB4 varchar(1),--1男,2女,9性别不明
  FM_RSJJ4 varchar(1),--1活产,2死胎死产
  FM_PF4 varchar(2),
  JG_TBR varchar(50) null,
  JG_BCRQ DATETIME null, -- 报出日期 YYYYMMDD
  CYRQ DATETIME -- 出院日期
)
END

if not exists (select 1 from sysobjects where id = object_id('VsCH_Wt47_1') and type = 'U')
Begin
create table VsCH_Wt47_1(
  CHYear varchar(4) not null,
  WT4701 varchar(50) not null primary key(chyear,WT4701),
  CF_BH varchar(64),
  CF_JDSJ DATETIME,--YYYYMMDD
  CF_YC INT null,  --孕次
  CF_CC INT null,  --产次
  CF_YFZC INT NULL, --孕周
  CF_GWYS char(1) null,--本次是否属于高危妊娠 1是,2否,9不清楚
  CF_FMDD char(1) null,--分娩地点 1医疗机构内,2医疗机构外
  CF_FMFS char(1) null,--分娩方式 1阴道产,2剖宫产
  CF_FMRQ DATETIME null,--分娩日期 YYYYMMDD
  FM_XB1 varchar(1) null,--第一胎性别 1男,2女,9性别不明
  FM_RSJJ1 varchar(1) null,--第一胎妊娠结局 1活产,2死胎死产
  FM_PF1 varchar(2) null, -- 第一胎Apgar评分
  FM_XB2 varchar(1),--1男,2女,9性别不明
  FM_RSJJ2 varchar(1),--1活产,2死胎死产
  FM_PF2 varchar(2),
  FM_XB3 varchar(1),--1男,2女,9性别不明
  FM_RSJJ3 varchar(1),--1活产,2死胎死产
  FM_PF3 varchar(2),
  FM_XB4 varchar(1),--1男,2女,9性别不明
  FM_RSJJ4 varchar(1),--1活产,2死胎死产
  FM_PF4 varchar(2),
  JG_TBR varchar(50) null,
  JG_BCRQ DATETIME null, -- 报出日期 YYYYMMDD
  CYRQ DATETIME -- 出院日期
)
END

-- 是否助产机构 （用于产科数据上报）
if col_length('VsSysInfo', 'VsIsZc') Is Null
  alter table VsSysInfo add VsIsZc char(1)
-- 产科数据上报联系人电话 （用于产科数据上报）
if col_length('VsSysInfo', 'VsCkLxdh') Is Null
  alter table VsSysInfo add VsCkLxdh varchar(50)  

-- 四川卫统四表上报联系电话
if col_length('VsSysInfo', 'VsWtbdh') Is Null
  alter table VsSysInfo add VsWtbdh varchar(20)
-- 四川卫统四表上报联系手机
if col_length('VsSysInfo', 'VsWtbSj') Is Null
  alter table VsSysInfo add VsWtbSj varchar(20)

-- 用于保存HL7机制消息（在海安县中医院开始使用）
IF NOT EXISTS(select * from sysobjects where id = object_id(N'[HL7Msg]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) BEGIN
  CREATE TABLE [HL7Msg]( --对方传送过来的消息先不作任何处理，直接保存到此表中
	[ID] [varchar](50) NOT NULL,
	[Msg] [text] NULL,
	[ReciveDate] [datetime] NULL,
	[Statue] [int] NULL) ON [PRIMARY]
     ALTER TABLE [HL7Msg] WITH NOCHECK ADD CONSTRAINT [PK_HL7Msg] PRIMARY KEY  CLUSTERED ([ID]) ON [PRIMARY] 
   END
   
IF NOT EXISTS(select * from sysobjects where id = object_id(N'[HL7FieldInfo]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
   Begin
CREATE TABLE [HL7FieldInfo](--此表保存对方消息解析后的数据库结构，在消息接收器（解析消息）中用到此表
	[TableName] [varchar](128) NOT NULL,
	[FieldName] [varchar](128) NOT NULL,
	[MaxLen] [int] NULL,
	[IsKey] [int] NULL,
	[Desc] [varchar](100) NULL,
	[sMemo] [varchar](100) NULL) ON [PRIMARY]
     ALTER TABLE [HL7FieldInfo] WITH NOCHECK ADD CONSTRAINT [PK_HL7FieldInfo] PRIMARY KEY  CLUSTERED ([TableName],[FieldName]) ON [PRIMARY] 
   END

--在VsCH0N表新增字段
if col_length('VsCH0N', 'CH0N35') Is Null
  ALTER TABLE VsCH0N ADD CH0N35 VARCHAR(10) --呼吸机使用时间
if col_length('VsCH0N', 'CH0N36') Is Null
  ALTER TABLE VsCH0N ADD CH0N36 INT --肺部感染
if col_length('VsCH0N', 'CH0N37') Is Null 
  ALTER TABLE VsCH0N ADD CH0N37 INT --输血反应
if col_length('VsCH0N', 'CH0N38') Is Null 
  ALTER TABLE VsCH0N ADD CH0N38 INT --是否有出院14天内再住院
if col_length('VsCH0N', 'CH0N39') Is Null 
  ALTER TABLE VsCH0N ADD CH0N39 INT --目的

--山西附页新加表
if not exists (select 1 from  sysobjects where  id = object_id('VsCH0P_FY') and   type = 'U')
   begin
     create table VsCH0P_FY(
       CHYear varchar(4) not null,
       CHFY01 varchar(50) not NULL primary key(CHYear,CHFY01),
       CHFY02 int,			--有无并发症
       CHFY03 varchar(50),	--并发症1
       CHFY04 varchar(50),	--并发症2
       CHFY05 varchar(50),	--并发症3
       CHFY06 int,			--完成临床路径
       CHFY07 int,			--出现变异
       CHFY08 int,			--使用三线抗菌药物
       CHFY09 int,			--临床路径相变异分析
       CHFY10 int,			--手术切口清洁程度
       CHFY11 int,			--麻醉等级ASA分级
       CHFY12 int,			--手术持续时间
       CHFY13 int,			--手术类别
       CHFY14 int,			--切口愈合与感染情况
       CHFY15 INT)			--手术
   end
if not exists (select 1 from  sysobjects where  id = object_id('VsCH_CH0P_FY') and   type = 'U')
   Exec('Select * Into VsCH_CH0P_FY From VsCH0P_FY Where 1=2')
if not exists (select 1 from  sysobjects where  id = object_id('VsCH_CH0N') and   type = 'U')
   Exec('Select * Into VsCH_CH0N From VsCH0N Where 1=2') 
--在菜单中增加菜单图标序号  从以前的放在 功能菜单中 移到此处
IF Col_Length('VsMenu','MenuImgIndex') Is Null
   Alter Table VsMenu Add MenuImgIndex Int
-- 在源表Union字表中增加 是否包含住院号字段 （主要为优化SQL）
if col_length('ES_Tables_Union', 'IsZYHInTable') Is NULL begin
  Alter Table ES_Tables_Union Add IsZYHInTable INT
  EXEC('Update ES_Tables_Union Set IsZYHInTable=0')
end
if col_length('ESK_Tables_Union', 'IsZYHInTable') Is Null begin
  Alter Table ESK_Tables_Union Add IsZYHInTable INT
  EXEC('Update ESK_Tables_Union Set IsZYHInTable=0')
end
if col_length('ES_Tables_Union', 'IsIncludeWhere') Is NULL begin
  Alter Table ES_Tables_Union Add IsIncludeWhere INT
  EXEC('Update ES_Tables_Union Set IsIncludeWhere=0')
end
if col_length('ESK_Tables_Union', 'IsIncludeWhere') Is NULL begin
  Alter Table ESK_Tables_Union Add IsIncludeWhere INT
  EXEC('Update ESK_Tables_Union Set IsIncludeWhere=0')
end
IF col_length('VsWt47_1', 'CF_YFZC') Is NULL
  Alter Table VsWt47_1 Add CF_YFZC INT
IF col_length('VsCH_Wt47_1', 'CF_YFZC') Is NULL
  Alter Table VsCH_Wt47_1 Add CF_YFZC INT
  
Select 'OKOKOK'


