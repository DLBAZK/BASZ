
USE [batj2005]
-------------------------������ҳ�ʿر�

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[VsBAsyzk](
	[CH0A01] [varchar](50) NOT NULL,
	[Subject] [varchar](10) NOT NULL,
	[Score] [int] NULL,
	[Person] [varchar](10) NULL,
	[PFSJ] [datetime] NOT NULL,
 CONSTRAINT [PK_VsBAsyzk] PRIMARY KEY CLUSTERED 
(
	[CH0A01] ASC,
	[Subject] ASC,
	[PFSJ] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
go

SET ANSI_PADDING OFF
GO
----------------------------������ҳ�ʿ���Ŀ��----------------------
if not exists (select 1 from sysobjects where id = object_id('Vssjpf') and type = 'U')
Begin
create table Vssjpf(
  xh varchar(4) not null,  --��Ŀ���
  dm varchar(4) not null primary key(dm),  --��Ŀ����
  dmmc varchar(100),  --��Ŀ����
  xmlx varchar(4),  --��Ŀ����
  xmfz int,  --��Ŀ��ֵ
  isTy int,  --ͣ�ñ�־
  sSql varchar(255) --����SQL
)
End
go
--------------------������Ŀ���ͱ�---------------------
if not exists (select 1 from sysobjects where id = object_id('Vsxmlx') and type = 'U')
Begin
create table Vsxmlx(
  dm varchar(4) not null primary key(dm),  --��Ŀ���ʹ���
  dmmc varchar(100),  --��Ŀ��������
  isTy int  --ͣ�ñ�־
)
End
go 

INSERT INTO Vsxmlx VALUES('1','A��','0')
INSERT INTO Vsxmlx VALUES('2','B��','0')
INSERT INTO Vsxmlx VALUES('3','C��','0')
INSERT INTO Vsxmlx VALUES('4','D��','0')
go
-----------------------------------��ĩ������Ŀ��-----------------------------------
if not exists (select 1 from sysobjects where id = object_id('Vszmzlpf') and type = 'U')
Begin
create table Vszmzlpf(
  code varchar(15) not null primary key(code),  --��Ŀ���
  itemCode varchar(15) not null,  --��Ŀ����
  codeName varchar(100),  --��Ŀ����
  xmlx varchar(4),  --��Ŀ����
  xmfz Numeric(3, 1),  --��Ŀ��ֵ
  isBj int, --�Ƿ������־
  upperCode varchar(10), --��ID
  isTy INT,  --ͣ�ñ�־
  zklb VARCHAR(4) --�ʿ����
)
End
GO
--------------------------------�ʿ�����--------------------------------------------------
if not exists (select 1 from sysobjects where id = object_id('Vszklb') and type = 'U')
Begin
create table Vszklb(
  dm varchar(4) not null primary key(dm),  --�ʿ�������
  dmmc varchar(100),  --�ʿ��������
  isChoice INT, --�Ƿ�ѡ��ȫ������
  isTy int  --ͣ�ñ�־
)
End

go
-------------------------------���������ȼ���---------------
CREATE TABLE [dbo].[VsZkRank](
	[ID] [int] NOT NULL,
	[LowScore] [varchar](10) NOT NULL,
	[HighScore] [varchar](10) NOT NULL,
	[rankcolor] [int] NULL,
 CONSTRAINT [PK_VsZkRank] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

------------------������ĩ�������ۼ�¼��

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[VsBAZmPj](
	[CH0A00] [varchar](50) NOT NULL,
	[Code] [varchar](50) NOT NULL,
	[Score] [numeric](5, 2) NULL,
	[Remark] [varchar](1000) NULL,
	[PFR] [varchar](10) NULL,
	[PFSJ] [datetime] NULL,
 CONSTRAINT [PK_VsBAZmPj] PRIMARY KEY CLUSTERED 
(
	[CH0A00] ASC,
	[Code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]


GO

SET ANSI_PADDING OFF
GO

---------------------	 ����ɸѡ��-----------------
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[VsPJBA0A](
	[CH0A00] [varchar](50) NOT NULL,
	[CH0A01] [varchar](50) NOT NULL,
	[CH0A02] [varchar](50) NULL,
	[CH0A03] [nchar](1) NULL,
	[zklb] [varchar](4) NOT NULL,
	[CH0A27] [datetime] NULL,
	[CH0ABarcode] [varchar](50) NULL,
 CONSTRAINT [PK_VsPJBA0A] PRIMARY KEY CLUSTERED 
(
	[CH0A00] ASC,
	[CH0A01] ASC,
	[zklb] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
-----------------------------------------������ҳ�ʿش洢����------------------------
GO
/****** Object:  StoredProcedure [dbo].[PBaSyZk]    Script Date: 06/02/2016 09:59:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[PBaSyZk]
 @StartDate DateTime,  ---��Ժ���ڿ�ʼ
 @EndDate DateTime,     ---��Ժ���ڽ�ֹ
 @UserName varchar(10)       -----������
 WITH RECOMPILE
AS
BEGIN
   
   declare @PFSJ datetime -----����ʱ��
   declare @historySql varchar(8000) ---�ʿ�������ʷ��¼���
   declare @SQLtext  varchar(2000)  ---���ؼ����
   declare @Ltext varchar(1000)  
   declare @PFSQL varchar(2000)      ---������ҳ��������
   declare @PFMC varchar(10)       ----������Ŀ
   declare @PFFZ int                ----��Ŀ��ֵ
   
   --��ȡ��ǰʱ��
   set @PFSJ=GetDate()
   
   
    ------��ȡ���ϳ�Ժ���ڲ�ѯ��Χ�Ĳ�����ҳ��Ϣ------------------------------------------------------------------------------------------
    Select VsCh0A.*,
         Ch0B83=IsNUll(Ch0B83,0),Ch0B84=IsNUll(Ch0B84,0),Ch0B85=IsNUll(Ch0B85,0),Ch0B86=IsNUll(Ch0B86,0),Ch0B87=IsNUll(Ch0B87,0),
		 Ch0B88=IsNUll(Ch0B88,0),Ch0B89=IsNUll(Ch0B89,0),Ch0B90=IsNUll(Ch0B90,0),Ch0B91=IsNUll(Ch0B91,0),Ch0B92=IsNUll(Ch0B92,0),
		 Ch0B93=IsNUll(Ch0B93,0),Ch0B94=IsNUll(Ch0B94,0),Ch0B95=IsNUll(Ch0B95,0),Ch0B96=IsNUll(Ch0B96,0),Ch0B97=IsNUll(Ch0B97,0),
		 Ch0B98=IsNUll(Ch0B98,0),Ch0B99=IsNUll(Ch0B99,0),Ch0BE2=IsNUll(Ch0BE2,0),Ch0BE3=IsNUll(Ch0BE3,0),Ch0BE4=IsNUll(Ch0BE4,0),
		 Ch0BE5=IsNUll(Ch0BE5,0),Ch0BE6=IsNUll(Ch0BE6,0),
		 Ch0BP1=IsNUll(Ch0BP1,0),Ch0BP2=IsNUll(Ch0BP2,0),Ch0BP3=IsNUll(Ch0BP3,0),Ch0BP4=IsNUll(Ch0BP4,0),Ch0BP5=IsNUll(Ch0BP5,0),
		 Ch0BP6=IsNUll(Ch0BP6,0),Ch0BP7=IsNUll(Ch0BP7,0),Ch0BP8=IsNUll(Ch0BP8,0),Ch0BP9=IsNUll(Ch0BP9,0),Ch0BPA=IsNUll(Ch0BPA,0),
		 Ch0BPB=IsNUll(Ch0BPB,0),Ch0BPC=IsNUll(Ch0BPC,0),Ch0BPD=IsNUll(Ch0BPD,0),Ch0BPE=IsNUll(Ch0BPE,0),Ch0BPF=IsNUll(Ch0BPF,0),
		 Ch0BPG=IsNUll(Ch0BPG,0),Ch0BPH=IsNUll(Ch0BPH,0),Ch0BPI=IsNUll(Ch0BPI,0),Ch0BPJ=IsNUll(Ch0BPJ,0),Ch0BPK=IsNUll(Ch0BPK,0),
		 Ch0BPL=IsNUll(Ch0BPL,0),Ch0BPM=IsNUll(Ch0BPM,0),Ch0BPN=IsNUll(Ch0BPN,0),Ch0BPO=IsNUll(Ch0BPO,0),Ch0BPP=IsNUll(Ch0BPP,0),
		 Ch0BPQ=IsNUll(Ch0BPQ,0),Ch0BPR=IsNUll(Ch0BPR,0),Ch0BPS=IsNUll(Ch0BPS,0),Ch0BPT=IsNUll(Ch0BPT,0),
		 Ch0BZ1=IsNUll(Ch0BZ1,0),Ch0BZ2=IsNUll(Ch0BZ2,0),Ch0BZ3=IsNUll(Ch0BZ3,0),Ch0BZ4=IsNUll(Ch0BZ4,0),Ch0BZ5=IsNUll(Ch0BZ5,0),
		 Ch0BZ6=IsNUll(Ch0BZ6,0),Ch0BZ7=IsNUll(Ch0BZ7,0),Ch0BZ8=IsNUll(Ch0BZ8,0),Ch0BZ9=IsNUll(Ch0BZ9,0),Ch0BZA=IsNUll(Ch0BZA,0),
		 Ch0BZB=IsNUll(Ch0BZB,0),Ch0BZC=IsNUll(Ch0BZC,0),Ch0BZD=IsNUll(Ch0BZD,0),
         BmICD MZZD
   Into #CH0A From VsCh0A  -----������ҳ
     Left Join VsCh0B  --  ������ҳסԺ����
	 on VsCh0A.ChYear=VsCh0B.ChYear And Ch0A01=Ch0B01
     Left Join (Select Bmm,(Case When ISNULL(BZICD,'')='' THEN BmMC  ELSE BZMC END)BmMC,(Case When ISNULL(BZICD,'')='' THEN BmICD  ELSE BZICD END)BmICD FROM VsUseICD)VsUseICD  ----�û����
	 on CH0A36=Bmm	 
   Where  Ch0A27 >=@StartDate And Ch0A27 <=@EndDate 
   

  
  --------------------���������ʿ����ݼ������---------------------------------
    Create Table #Result(
	  Ch0A01 VarChar(50),   ----������
	  Ch0A02 VarChar(50),   ----��������	 	 
	  Ch0ABE VarChar(50),-----¼��Ա
	  CH0A59 VarChar(50),  -----����Ա
	  Ch0A27 datetime,  -------��Ժ����
 	  Score VarChar(200))  ---�÷�
	  
	  -------------����������ҳ�ʿ���Ŀ�����ֵ����α�----------------------------------
	Declare a_Cursor cursor for
	
		select dm,xmfz,sSql from Vssjpf where isTy = 0  ---��ѯ���õ���������
		
	Open a_Cursor 
	FETCH NEXT FROM a_Cursor INTO @PFMC,@PFFZ,@PFSQL
	WHILE @@FETCH_STATUS = 0
	BEGIN
	    
		--------------------���������ֵ�� ��˲������ݣ���¼����VsBAsyzk-----------------------------
		set @historySql ='Insert  VsBAsyzk' 
						+' select Ch0A01,'''+@PFMC+''','+convert(varchar(10),@PFFZ)+','''+@UserName+''','''+Convert(varchar(100),@PFSJ,120)
						+''' from #CH0A A where '+@PFSQL				       
						
	    print(@historySql)
		Execute(@historySql)
		FETCH NEXT FROM a_Cursor INTO @PFMC,@PFFZ,@PFSQL
	END
	CLOSE a_Cursor
	DEALLOCATE a_Cursor

	------------������ҳ�ʿ��ܽ��¼����--------------------
	set @SQLtext=' insert into #Result '
			+' select A.Ch0A01,B.Ch0A02,B.Ch0ABE,B.CH0A59,B.Ch0A27,100-ISNULL(SUM(A.Score),0)  from VsBAsyzk A '
			+' right join #CH0A B on A.Ch0A01 = B.Ch0A01 where Convert(varchar(100),A.PFSJ,120) = '''
			+Convert(varchar(100),@PFSJ,120)
			+''' group by A.Ch0A01,B.Ch0A02,B.Ch0ABE,B.CH0A59,B.Ch0A27,A.PFSJ '
			
	Execute(@SQLtext)
		
	------------�������ݼ�----------------
	select * from #Result ORDER BY Ch0A01
	
  
END 

GO
	
--------------------------���²�����ĩ������Ŀ�����洢����--
GO
IF EXISTS (
  SELECT * 
    FROM INFORMATION_SCHEMA.ROUTINES 
   WHERE SPECIFIC_SCHEMA = N'dbo'
     AND SPECIFIC_NAME = N'Updatezmzlpj' 
)
   DROP PROCEDURE dbo.Updatezmzlpj
GO

create PROCEDURE dbo.Updatezmzlpj
@upperCode varchar(50)
as
begin
  declare @parentcode varchar(50)
 ---------�����ϼ�����
  update  a set a.xmfz =(select SUM(isnull(b.xmfz,0)) from Vszmzlpf b where b.upperCode=@upperCode ) from Vszmzlpf a where a.code=@upperCode
  
  select @parentcode=isnull(uppercode,'') from Vszmzlpf where code=@upperCode
  if @parentcode<>''
  begin
    update  a set a.xmfz =(select SUM(isnull(b.xmfz,0)) from Vszmzlpf b where b.upperCode=@parentcode ) from Vszmzlpf a where a.code=@parentcode 
  end
end
	 
	
------------------------������ĩ�������۴洢����-------------
GO
IF EXISTS (
  SELECT * 
    FROM INFORMATION_SCHEMA.ROUTINES 
   WHERE SPECIFIC_SCHEMA = N'dbo'
     AND SPECIFIC_NAME = N'PBAzmpj' 
)
   DROP PROCEDURE dbo.PBAzmpj
GO

create PROCEDURE dbo.PBAzmpj
	@CH0A00 varchar(20),
	@Zklb varchar(10)
WITH RECOMPILE	 
AS
BEGIN
  DECLARE @code varchar(15)      ---��Ŀ���
  DECLARE @codename varchar(100)  ---��Ŀ����
  DECLARE @uppercode varchar(15)  ---�ϼ���Ŀ��� 
  DECLARE @num int                ---���ݼ�����
  DECLARE @FZ int                  ---��Ŀ��ֵ
  DECLARE @xmfz varchar(10)  
  DECLARE @isbj int               ---������־      
  
 -- ----������Ŀ���ϱ�
  CREATE TABLE #ZLPJTmp(
	FcodeName varchar(100),
	ScodeName varchar(100),
	TcodeName varchar(100),
	Fcode varchar(15),
	Scode varchar(15),
	Tcode varchar(15),
	fxmfz Numeric(3, 1),
	sxmfz Numeric(3, 1),
	txmfz Numeric(3, 1),
	Score numeric(5,2) default 0,
	Remark varchar(1000),
	isbj int default 0
  )
 -----��ѯת��������Ŀ ��ʱ��--------------------------
   insert  into #ZLPJTmp(fcodename,Scodename,tcodename,fcode,scode,tcode,fxmfz,sxmfz,txmfz,Remark)
   select fcodename,Scodename,tcodename,fcode,scode,tcode,fxmfz,sxmfz,txmfz,'' from 
   (select a.code fcode,(case when a.isBj =1 then '*'+a.codeName+'('+CONVERT(varchar(4),a.xmfz)+'��)' else a.codeName+'('+CONVERT(varchar(4),a.xmfz)+'��)' end) fcodename, fxmfz=a.xmfz,
   b.code scode,(case when b.isBj=1 then '*'+b.codeName+'('+CONVERT(varchar(4),ISNULL(b.xmfz,0))+'��)' else b.codeName+'('+CONVERT(varchar(4),ISNULL(b.xmfz,0))+'��)' end) Scodename,
  sxmfz=b.xmfz,c.code tcode,
 (case when c.isBj=1 then '*'+ c.codeName+'('+CONVERT(varchar(4),ISNULL(c.xmfz,0))+'��)' else  c.codeName+'('+CONVERT(varchar(4),ISNULL(c.xmfz,0))+'��)' end) tcodename,
 isnull(c.xmfz,0) as txmfz from Vszmzlpf a 
 left join Vszmzlpf b on a.code=b.upperCode
 left join Vszmzlpf c on b.code =c.upperCode 
 where a.upperCode ='' and a.isTy =0 and a.zklb=@Zklb ) c
 
 
  -----------------------�ж��Ƿ���������
  if not exists(select 1 from VsBAZmPj where CH0A00 =@CH0A00)
  begin
    select a.FcodeName,a.ScodeName,a.TcodeName,FCode,SCode,TCode, fxmfz,sxmfz,txmfz,Score,remark 
    from #ZLPJTmp a order by Scode,Tcode 
    
  end
  else
  ----------------�������� ��ѯ����---------------
    select a.FcodeName,a.ScodeName,a.TcodeName,FCode,SCode,TCode , fxmfz,sxmfz,txmfz,ISNULL(b.score,0.0) Score,b.remark 
  from #ZLPJTmp a left join VsBAZmPj b on a.Fcode = b.code or a.Scode=b.code or a.Tcode=b.code  
  where b.CH0A00 =@CH0A00  order by Scode,Tcode 
	
	
END	
GO	 

---------------------------------�����˵���----------------------------------------------	
if not exists (select * from VsLib where LibCode ='100025')
	insert into VsLib(LibCode,LibName,LibDesc) values('100025','BaQuality.dll','�����ʿ�&����')
	
 
 if not exists (select * from VsLib where LibCode ='100026')
	insert into VsLib(LibCode,LibName,LibDesc) values('100026','BaQualityCfg.dll','�����ʿ�&��������')
	
if  exists (select * from VsMenu where MenuCode = '108')
begin
	delete from VsMenu where MenuCode = '108'
	insert into VsMenu (MenuCode,MenuICode,MenuPCode,MenuName,MenuEnd,MenuFormName,MenuLib,MenuSysCenter,MenuVisible,MenuImgIndex)
	values('108','01','','�����ʿ�','0','','100025','1','1',null)
end
else
	insert into VsMenu (MenuCode,MenuICode,MenuPCode,MenuName,MenuEnd,MenuFormName,MenuLib,MenuSysCenter,MenuVisible,MenuImgIndex)
	values('108','01','','�����ʿ�','0','','100025','1','1',null)

if  exists (select * from VsMenu where MenuCode = '10801')
begin
	delete from VsMenu where MenuCode = '10801'
	insert into VsMenu (MenuCode,MenuICode,MenuPCode,MenuName,MenuEnd,MenuFormName,MenuLib,MenuSysCenter,MenuVisible,MenuImgIndex)
	values('10801','01','108','&1.������ҳ�ʿ�','1','TFrmBaSy','100025','1','1',null)
end
else
	insert into VsMenu (MenuCode,MenuICode,MenuPCode,MenuName,MenuEnd,MenuFormName,MenuLib,MenuSysCenter,MenuVisible,MenuImgIndex)
	values('10801','01','108','&1.������ҳ�ʿ�','1','TFrmBaSy','100025','1','1',null)
	
if  exists (select * from VsMenu where MenuCode = '10802')
begin
	delete from VsMenu where MenuCode = '10802'
	insert into VsMenu (MenuCode,MenuICode,MenuPCode,MenuName,MenuEnd,MenuFormName,MenuLib,MenuSysCenter,MenuVisible,MenuImgIndex)
	values('10802','02','108','&2.������ҳ��������','0','','100025','1','1',null)
end

else
	insert into VsMenu (MenuCode,MenuICode,MenuPCode,MenuName,MenuEnd,MenuFormName,MenuLib,MenuSysCenter,MenuVisible,MenuImgIndex)
	values('10802','02','108','&2.������ҳ��������','0','','100025','1','1',null)

if  exists (select * from VsMenu where MenuCode = '1080201')
begin
    delete from VsMenu where MenuCode = '1080201'
	insert into VsMenu (MenuCode,MenuICode,MenuPCode,MenuName,MenuEnd,MenuFormName,MenuLib,MenuSysCenter,MenuVisible,MenuImgIndex)
	values('1080201','01','10802','&1.������ҳɸѡ','1','TFrmBaSx','100025','1','1',null)
end
else
	insert into VsMenu (MenuCode,MenuICode,MenuPCode,MenuName,MenuEnd,MenuFormName,MenuLib,MenuSysCenter,MenuVisible,MenuImgIndex)
	values('1080201','01','10802','&1.������ҳɸѡ','1','TFrmBaSx','100025','1','1',null)
	
if  exists (select * from VsMenu where MenuCode = '1080202')
begin
	delete from VsMenu where MenuCode = '1080202'
	insert into VsMenu (MenuCode,MenuICode,MenuPCode,MenuName,MenuEnd,MenuFormName,MenuLib,MenuSysCenter,MenuVisible,MenuImgIndex)
	values('1080202','02','10802','&2.������ҳ��������','1','TFrmBaPJ','100025','1','1',null)
end
else
	insert into VsMenu (MenuCode,MenuICode,MenuPCode,MenuName,MenuEnd,MenuFormName,MenuLib,MenuSysCenter,MenuVisible,MenuImgIndex)
	values('1080202','02','10802','&2.������ҳ��������','1','TFrmBaPJ','100025','1','1',null)
	
if not exists(select * from VsMenu where MenupCode ='10803')
  insert into VsMenu(MenuCode,MenuICode,MenuPCode,MenuName,MenuEnd,MenuFormName,MenuLib,MenuSysCenter,MenuVisible,MenuImgIndex)
     values('10803','03','108','&3.����������������','1','TfrmSjpf','100026','1','1',null)
     
if not exists(select * from VsMenu where MenuCode ='10804')
  insert into VsMenu(MenuCode,MenuICode,MenuPCode,MenuName,MenuEnd,MenuFormName,MenuLib,MenuSysCenter,MenuVisible,MenuImgIndex)
     values('10804','04','108','&4.������ĩ�����ȼ�����','1','TFrmZmzlpf','100026','1','1',null)
	 
if not exists(select * from VsMenu where MenuCode ='10805')
  insert into VsMenu(MenuCode,MenuICode,MenuPCode,MenuName,MenuEnd,MenuFormName,MenuLib,MenuSysCenter,MenuVisible,MenuImgIndex)
     values('10805','05','108','&5.�����������','1','TfrmLBSet','100026','1','1',null)

if not exists(select * from VsMenu where MenuCode ='10806')
  insert into VsMenu(MenuCode,MenuICode,MenuPCode,MenuName,MenuEnd,MenuFormName,MenuLib,MenuSysCenter,MenuVisible,MenuImgIndex)
     values('10806','06','108','&6.�����ȼ�����','1','TFrmRankSet','100026','1','1',null)		 

if not exists(select * from VsMenu where MenuCode ='10807')
  insert into VsMenu(MenuCode,MenuICode,MenuPCode,MenuName,MenuEnd,MenuFormName,MenuLib,MenuSysCenter,MenuVisible,MenuImgIndex)
     values('10807','07','108','&7.������Ŀ��������','1','TfrmXmLx','100026','1','1',null)		

---------------------------�����ʿ��м�ҵ���----------------------------

if  exists (select * from VsLib where LibCode ='200025')
begin
	delete from VsLib where LibCode='200025'
	insert into VsLib(LibCode,LibName,LibDesc) values('200025','M_BaQuality.dll','�����ʿ�&����')
end
else
	insert into VsLib(LibCode,LibName,LibDesc) values('200025','M_BaQuality.dll','�����ʿ�&����')
	
if  exists (select * from VsLib where LibCode ='200026')
begin
	delete from VsLib where LibCode='200026'
	insert into VsLib(LibCode,LibName,LibDesc) values('200026','M_BaQualityCfg.dll','�����ʿ�&����')
end
else
	insert into VsLib(LibCode,LibName,LibDesc) values('200026','M_BaQualityCfg.dll','�����ʿ�&����')
	
	
if  exists(select * from VsMidOper where MidOperCode ='402')
begin
	delete from VsMidOper where MidOperCode = '402'
	insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) 
     VALUES  (402,'TVsBaSyZk','200025','EuVsBaSy','������ҳ�ʿ��м��')	
end
else
  insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) 
     VALUES  (402,'TVsBaSyZk','200025','EuVsBaSy','������ҳ�ʿ��м��')	
 
 if  exists(select * from VsMidOper where MidOperCode ='403')
begin
	delete from VsMidOper where MidOperCode = '403'
	insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) 
     VALUES  (403,'TVsZkDetail','200025','EuVsZkDetail','������ҳ�ʿ���ϸ��Ϣ�м��')	
end
else
  insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) 
     VALUES  (403,'TVsZkDetail','200025','EuVsZkDetail','������ҳ�ʿ���ϸ��Ϣ�м��')	    
     
     
  if  exists(select * from VsMidOper where MidOperCode ='404')
begin
	delete from VsMidOper where MidOperCode = '404'
	insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) 
     VALUES  (404,'TVsBaSx','200025','EuVsBaSx','����ɸѡ�м��')	
end
else
  insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) 
     VALUES  (404,'TVsBaSx','200025','EuVsBaSx','����ɸѡ�м��')	    
 
if not exists(select * from VsMidOper where MidOperCode ='405')
  insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) 
     VALUES  (405,'TVsSjpf','200026','EuVsSjpf','�����������������м��')

if not exists(select * from VsMidOper where MidOperCode ='406')
  insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) 
     VALUES  (406,'TVsZmzlpf','200026','EuVsZmzlpf','������ĩ�����ȼ������м��')
	 
 if  exists(select * from VsMidOper where MidOperCode ='407')
begin
	delete from VsMidOper where MidOperCode = '407'
	insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) 
     VALUES  (407,'TVsBaZmPj','200025','EuVsBaZmPj','������ĩ�����м��')	
end
else
  insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) 
     VALUES  (407,'TVsBaZmPj','200025','EuVsBaZmPj','������ĩ�����м��')
	 
if not exists(select * from VsMidOper where MidOperCode ='408')
  insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) 
     VALUES  (408,'TVsBaLbSet','200026','EuVsBaLbSz','������������м��')
     
	 
if  exists(select * from VsMidOper where MidOperCode ='401')
begin
	delete from VsMidOper where MidOperCode = '401'
	insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) 
     VALUES  (401,'TVsRankSet','200026','EuVsRank','�������۵ȼ��м��')	
end
else
  insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) 
     VALUES  (401,'TVsRankSet','200026','EuVsRank','�������۵ȼ��м��')

if  exists(select * from VsMidOper where MidOperCode ='409')
begin
	delete from VsMidOper where MidOperCode = '409'
	insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) 
     VALUES  (409,'TVsXmLx','200026','EuVsXmLx','������Ŀ�����м��')	
end
else
  insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) 
     VALUES  (409,'TVsXmLx','200026','EuVsXmLx','������Ŀ�����м��')


insert into Vssjpf values('1','100','��������Ϊ��','1',10,0,'Isnull(CH0A02,'''')=''''')
insert into Vssjpf values('2','101','�Ա���Ϊ��','1',5,0,'Isnull(CH0A03,'''')=''''')
insert into Vssjpf values('3','102','ȱ��¼�򳬹�������Ժ��24Сʱ','1',15,0,'Isnull(CH0A14,'''')=''''')
insert into Vssjpf values('4','103','���淶','1',10,0,'Isnull(CH0ANB,'''')=''''')
insert into Vssjpf values('5','104','��������ʷ���淶','1',10,0,'Isnull(CH0A07,'''')=''''')
insert into Vssjpf values('6','105','�޳�Ժʱ��','1',10,0,'Isnull(CH0A27,'''')=''''')
insert into Vssjpf values('7','106','������¼�޼�¼����ԭ��','1',10,0,'Isnull(CH0ANC,'''')=''''')
insert into Vssjpf values('8','107','�����д���淶','1',5,0,'Isnull(CH0A37,'''')=''''')

insert into VsZkRank values(101,'90','100',32768)
insert into VsZkRank values(102,'70','90',15780518)
insert into VsZkRank values(103,'0','70',65535)

INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'10000', N'10000', N'���߻�����Ϣ', N'', CAST(18.0 AS Numeric(3, 1)), 0, N'', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1000010000', N'10000', N'��������Ժ����', N'1', CAST(4.0 AS Numeric(3, 1)), 0, N'10000', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1000010001', N'10001', N'��������������', N'1', CAST(4.0 AS Numeric(3, 1)), 0, N'10000', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1000010002', N'10002', N'������', N'2', CAST(2.0 AS Numeric(3, 1)), 0, N'10000', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1000010003', N'10003', N'�Ա�', N'3', CAST(1.0 AS Numeric(3, 1)), 0, N'10000', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1000010004', N'10004', N'��������', N'3', CAST(1.0 AS Numeric(3, 1)), 0, N'10000', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1000010005', N'10005', N'����', N'3', CAST(1.0 AS Numeric(3, 1)), 0, N'10000', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1000010006', N'10006', N'ҽ�Ƹ��ѷ�ʽ', N'3', CAST(1.0 AS Numeric(3, 1)), 0, N'10000', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1000010007', N'10007', N'��������', N'4', CAST(0.5 AS Numeric(3, 1)), 0, N'10000', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1000010008', N'10008', N'��������', N'4', CAST(0.5 AS Numeric(3, 1)), 0, N'10000', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1000010009', N'10009', N'������', N'4', CAST(0.5 AS Numeric(3, 1)), 0, N'10000', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1000010010', N'10010', N'����', N'4', CAST(0.5 AS Numeric(3, 1)), 0, N'10000', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1000010011', N'10011', N'����', N'4', CAST(0.5 AS Numeric(3, 1)), 0, N'10000', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1000010012', N'10012', N'���֤��', N'4', CAST(0.5 AS Numeric(3, 1)), 0, N'10000', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1000010013', N'10013', N'ְҵ', N'4', CAST(0.5 AS Numeric(3, 1)), 0, N'10000', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1000010014', N'10014', N'����״��', N'4', CAST(0.5 AS Numeric(3, 1)), 0, N'10000', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1000010015', N'10015', N'��סַ', N'4', CAST(0.5 AS Numeric(3, 1)), 0, N'10000', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1000010016', N'10016', N'�绰����', N'4', CAST(0.5 AS Numeric(3, 1)), 0, N'10000', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1000010017', N'10017', N'�ʱ�', N'4', CAST(0.5 AS Numeric(3, 1)), 0, N'10000', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1000010018', N'10018', N'���ڵ�ַ', N'4', CAST(0.5 AS Numeric(3, 1)), 0, N'10000', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1000010019', N'10019', N'�����ʱ�', N'4', CAST(0.5 AS Numeric(3, 1)), 0, N'10000', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1000010020', N'10020', N'������λ����ַ', N'4', CAST(0.5 AS Numeric(3, 1)), 0, N'10000', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1000010021', N'10021', N'��λ�绰', N'4', CAST(0.5 AS Numeric(3, 1)), 0, N'10000', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1000010022', N'10022', N'��λ�ʱ�', N'4', CAST(0.5 AS Numeric(3, 1)), 0, N'10000', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1000010023', N'10023', N'��ϵ������', N'4', CAST(0.5 AS Numeric(3, 1)), 0, N'10000', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1000010024', N'10024', N'��ϵ', N'4', CAST(0.5 AS Numeric(3, 1)), 0, N'10000', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1000010025', N'10025', N'��ַ', N'4', CAST(0.5 AS Numeric(3, 1)), 0, N'10000', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1000010026', N'10026', N'�绰����', N'4', CAST(0.5 AS Numeric(3, 1)), 0, N'10000', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'10001', N'10001', N'סԺ������Ϣ', NULL, CAST(26.0 AS Numeric(3, 1)), 0, N'', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1000110000', N'10000', N'��Ժ��ʽ', N'1', CAST(4.0 AS Numeric(3, 1)), 0, N'10001', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1000110001', N'10001', N'��Ժʱ��', N'2', CAST(2.0 AS Numeric(3, 1)), 0, N'10001', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1000110002', N'10002', N'��Ժʱ��', N'2', CAST(2.0 AS Numeric(3, 1)), 0, N'10001', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1000110003', N'10003', N'ʵ��סԺ����', N'2', CAST(2.0 AS Numeric(3, 1)), 0, N'10001', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1000110004', N'10004', N'��Ժ�Ʊ�', N'2', CAST(2.0 AS Numeric(3, 1)), 0, N'10001', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1000110005', N'10005', N'�Ƿ��� 31 ������סԺ�ƻ�', N'2', CAST(2.0 AS Numeric(3, 1)), 0, N'10001', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1000110006', N'10006', N'��Ժ;��', N'3', CAST(1.0 AS Numeric(3, 1)), 0, N'10001', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1000110007', N'10007', N'��Ժ�Ʊ�', N'3', CAST(1.0 AS Numeric(3, 1)), 0, N'10001', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1000110008', N'10008', N'ת�ƿƱ�', N'3', CAST(1.0 AS Numeric(3, 1)), 0, N'10001', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'10002', N'10002', N'������Ϣ', NULL, CAST(50.0 AS Numeric(3, 1)), 0, N'', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1000210000', N'10000', N'��Ժ��Ҫ���', N'1', CAST(4.0 AS Numeric(3, 1)), 0, N'10002', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1000210001', N'10001', N'��Ҫ��ϱ���', N'1', CAST(4.0 AS Numeric(3, 1)), 0, N'10002', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1000210002', N'10002', N'�������', N'1', CAST(4.0 AS Numeric(3, 1)), 0, N'10002', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1000210003', N'10003', N'������ϱ���', N'1', CAST(4.0 AS Numeric(3, 1)), 0, N'10002', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1000210004', N'10004', N'��Ҫ�������������', N'1', CAST(4.0 AS Numeric(3, 1)), 0, N'10002', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1000210005', N'10005', N'��Ҫ�������������', N'1', CAST(4.0 AS Numeric(3, 1)), 0, N'10002', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1000210006', N'10006', N'��Ժ����', N'2', CAST(2.0 AS Numeric(3, 1)), 0, N'10002', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1000210007', N'10007', N'�������', N'2', CAST(2.0 AS Numeric(3, 1)), 0, N'10002', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1000210008', N'10008', N'������ϱ���', N'2', CAST(2.0 AS Numeric(3, 1)), 0, N'10002', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1000210009', N'10009', N'�п����ϵȼ�', N'2', CAST(2.0 AS Numeric(3, 1)), 0, N'10002', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1000210010', N'10010', N'­�����˻��߻���ʱ��', N'2', CAST(2.0 AS Numeric(3, 1)), 0, N'10002', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1000210011', N'10011', N'�����������������', N'2', CAST(2.0 AS Numeric(3, 1)), 0, N'10002', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1000210012', N'10012', N'�����������������', N'2', CAST(2.0 AS Numeric(3, 1)), 0, N'10002', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1000210013', N'10013', N'��������������', N'2', CAST(2.0 AS Numeric(3, 1)), 0, N'10002', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1000210014', N'10014', N'�ţ����������', N'3', CAST(1.0 AS Numeric(3, 1)), 0, N'10002', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1000210015', N'10015', N'�ţ���������ϼ�������', N'3', CAST(1.0 AS Numeric(3, 1)), 0, N'10002', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1000210016', N'10016', N'����ʽ', N'3', CAST(1.0 AS Numeric(3, 1)), 0, N'10002', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1000210017', N'10017', N'���ˣ��ж����ⲿԭ��', N'4', CAST(0.5 AS Numeric(3, 1)), 0, N'10002', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1000210018', N'10018', N'��������', N'4', CAST(0.5 AS Numeric(3, 1)), 0, N'10002', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1000210019', N'10019', N'�������', N'4', CAST(0.5 AS Numeric(3, 1)), 0, N'10002', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1000210020', N'10020', N'������ϱ���', N'4', CAST(0.5 AS Numeric(3, 1)), 0, N'10002', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1000210021', N'10021', N'������', N'4', CAST(0.5 AS Numeric(3, 1)), 0, N'10002', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1000210022', N'10022', N'ҩ�����ʷ', N'4', CAST(0.5 AS Numeric(3, 1)), 0, N'10002', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1000210023', N'10023', N'ʬ���¼', N'4', CAST(0.5 AS Numeric(3, 1)), 0, N'10002', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1000210024', N'10024', N'Ѫ��', N'4', CAST(0.5 AS Numeric(3, 1)), 0, N'10002', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1000210025', N'10025', N' Rh��ʶ', N'4', CAST(0.5 AS Numeric(3, 1)), 0, N'10002', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1000210026', N'10026', N'��������', N'4', CAST(0.5 AS Numeric(3, 1)), 0, N'10002', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1000210027', N'10027', N'����', N'4', CAST(0.5 AS Numeric(3, 1)), 0, N'10002', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1000210028', N'10028', N'��һ����', N'4', CAST(0.5 AS Numeric(3, 1)), 0, N'10002', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'10003', N'10003', N'������Ϣ', NULL, CAST(6.0 AS Numeric(3, 1)), 0, N'', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1000310000', N'10000', N'�ܷ���', N'1', CAST(4.0 AS Numeric(3, 1)), 0, N'10003', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1000310001', N'10001', N'�ۺ�ҽ�Ʒ�����', N'4', CAST(0.5 AS Numeric(3, 1)), 0, N'10003', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1000310002', N'10002', N'�����', N'4', CAST(0.5 AS Numeric(3, 1)), 0, N'10003', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1000310003', N'10003', N'������', N'4', CAST(0.5 AS Numeric(3, 1)), 0, N'10003', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1000310004', N'10004', N'������', N'4', CAST(0.5 AS Numeric(3, 1)), 0, N'10003', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1000310005', N'10005', N'��ҽ ��', N'4', CAST(0.5 AS Numeric(3, 1)), 0, N'10003', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1000310006', N'10006', N'��ҩ��', N'4', CAST(0.5 AS Numeric(3, 1)), 0, N'10003', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1000310007', N'10007', N'��ҩ��', N'4', CAST(0.5 AS Numeric(3, 1)), 0, N'10003', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1000310008', N'10008', N'ѪҺ��Ѫ��Ʒ��', N'4', CAST(0.5 AS Numeric(3, 1)), 0, N'10003', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1000310009', N'10009', N'�Ĳ���', N'4', CAST(0.5 AS Numeric(3, 1)), 0, N'10003', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1000310010', N'10010', N'������', N'4', CAST(0.5 AS Numeric(3, 1)), 0, N'10003', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'20000', N'20000', N'���߻�����Ϣ', N'', CAST(18.0 AS Numeric(3, 1)), 0, N'', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2000010000', N'10000', N'��������Ժ����', N'1', CAST(4.0 AS Numeric(3, 1)), 0, N'20000', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2000010001', N'10001', N'��������������', N'1', CAST(4.0 AS Numeric(3, 1)), 0, N'20000', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2000010002', N'10002', N'������', N'2', CAST(2.0 AS Numeric(3, 1)), 0, N'20000', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2000010003', N'10003', N'�Ա�', N'3', CAST(1.0 AS Numeric(3, 1)), 0, N'20000', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2000010004', N'10004', N'��������', N'3', CAST(1.0 AS Numeric(3, 1)), 0, N'20000', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2000010005', N'10005', N'����', N'3', CAST(1.0 AS Numeric(3, 1)), 0, N'20000', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2000010006', N'10006', N'ҽ�Ƹ��ѷ�ʽ', N'3', CAST(1.0 AS Numeric(3, 1)), 0, N'20000', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2000010007', N'10007', N'��������', N'4', CAST(0.5 AS Numeric(3, 1)), 0, N'20000', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2000010008', N'10008', N'��������', N'4', CAST(0.5 AS Numeric(3, 1)), 0, N'20000', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2000010009', N'10009', N'������', N'4', CAST(0.5 AS Numeric(3, 1)), 0, N'20000', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2000010010', N'10010', N'����', N'4', CAST(0.5 AS Numeric(3, 1)), 0, N'20000', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2000010011', N'10011', N'����', N'4', CAST(0.5 AS Numeric(3, 1)), 0, N'20000', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2000010012', N'10012', N'���֤��', N'4', CAST(0.5 AS Numeric(3, 1)), 0, N'20000', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2000010013', N'10013', N'ְҵ', N'4', CAST(0.5 AS Numeric(3, 1)), 0, N'20000', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2000010014', N'10014', N'����״��', N'4', CAST(0.5 AS Numeric(3, 1)), 0, N'20000', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2000010015', N'10015', N'��סַ', N'4', CAST(0.5 AS Numeric(3, 1)), 0, N'20000', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2000010016', N'10016', N'�绰����', N'4', CAST(0.5 AS Numeric(3, 1)), 0, N'20000', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2000010017', N'10017', N'�ʱ�', N'4', CAST(0.5 AS Numeric(3, 1)), 0, N'20000', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2000010018', N'10018', N'���ڵ�ַ', N'4', CAST(0.5 AS Numeric(3, 1)), 0, N'20000', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2000010019', N'10019', N'�����ʱ�', N'4', CAST(0.5 AS Numeric(3, 1)), 0, N'20000', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2000010020', N'10020', N'������λ����ַ', N'4', CAST(0.5 AS Numeric(3, 1)), 0, N'20000', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2000010021', N'10021', N'��λ�绰', N'4', CAST(0.5 AS Numeric(3, 1)), 0, N'20000', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2000010022', N'10022', N'��λ�ʱ�', N'4', CAST(0.5 AS Numeric(3, 1)), 0, N'20000', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2000010023', N'10023', N'��ϵ������', N'4', CAST(0.5 AS Numeric(3, 1)), 0, N'20000', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2000010024', N'10024', N'��ϵ', N'4', CAST(0.5 AS Numeric(3, 1)), 0, N'20000', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2000010025', N'10025', N'��ַ', N'4', CAST(0.5 AS Numeric(3, 1)), 0, N'20000', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2000010026', N'10026', N'�绰����', N'4', CAST(0.5 AS Numeric(3, 1)), 0, N'20000', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'20001', N'20001', N'סԺ������Ϣ', NULL, CAST(26.0 AS Numeric(3, 1)), 0, N'', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2000110000', N'10000', N'��Ժ��ʽ', N'1', CAST(4.0 AS Numeric(3, 1)), 0, N'20001', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2000110001', N'10001', N'��Ժʱ��', N'2', CAST(2.0 AS Numeric(3, 1)), 0, N'20001', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2000110002', N'10002', N'��Ժʱ��', N'2', CAST(2.0 AS Numeric(3, 1)), 0, N'20001', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2000110003', N'10003', N'ʵ��סԺ����', N'2', CAST(2.0 AS Numeric(3, 1)), 0, N'20001', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2000110004', N'10004', N'��Ժ�Ʊ�', N'2', CAST(2.0 AS Numeric(3, 1)), 0, N'20001', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2000110005', N'10005', N'�Ƿ��� 31 ������סԺ�ƻ�', N'2', CAST(2.0 AS Numeric(3, 1)), 0, N'20001', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2000110006', N'10006', N'��Ժ;��', N'3', CAST(1.0 AS Numeric(3, 1)), 0, N'20001', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2000110007', N'10007', N'��Ժ�Ʊ�', N'3', CAST(1.0 AS Numeric(3, 1)), 0, N'20001', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2000110008', N'10008', N'ת�ƿƱ�', N'3', CAST(1.0 AS Numeric(3, 1)), 0, N'20001', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'20002', N'20002', N'������Ϣ', NULL, CAST(50.0 AS Numeric(3, 1)), 0, N'', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2000210000', N'10000', N'��Ժ��Ҫ���', N'1', CAST(4.0 AS Numeric(3, 1)), 0, N'20002', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2000210001', N'10001', N'��Ҫ��ϱ���', N'1', CAST(4.0 AS Numeric(3, 1)), 0, N'20002', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2000210002', N'10002', N'�������', N'1', CAST(4.0 AS Numeric(3, 1)), 0, N'20002', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2000210003', N'10003', N'������ϱ���', N'1', CAST(4.0 AS Numeric(3, 1)), 0, N'20002', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2000210004', N'10004', N'��Ҫ�������������', N'1', CAST(4.0 AS Numeric(3, 1)), 0, N'20002', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2000210005', N'10005', N'��Ҫ�������������', N'1', CAST(4.0 AS Numeric(3, 1)), 0, N'20002', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2000210006', N'10006', N'��Ժ����', N'2', CAST(2.0 AS Numeric(3, 1)), 0, N'20002', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2000210007', N'10007', N'�������', N'2', CAST(2.0 AS Numeric(3, 1)), 0, N'20002', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2000210008', N'10008', N'������ϱ���', N'2', CAST(2.0 AS Numeric(3, 1)), 0, N'20002', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2000210009', N'10009', N'�п����ϵȼ�', N'2', CAST(2.0 AS Numeric(3, 1)), 0, N'20002', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2000210010', N'10010', N'­�����˻��߻���ʱ��', N'2', CAST(2.0 AS Numeric(3, 1)), 0, N'20002', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2000210011', N'10011', N'�����������������', N'2', CAST(2.0 AS Numeric(3, 1)), 0, N'20002', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2000210012', N'10012', N'�����������������', N'2', CAST(2.0 AS Numeric(3, 1)), 0, N'20002', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2000210013', N'10013', N'��������������', N'2', CAST(2.0 AS Numeric(3, 1)), 0, N'20002', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2000210014', N'10014', N'�ţ����������', N'3', CAST(1.0 AS Numeric(3, 1)), 0, N'20002', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2000210015', N'10015', N'�ţ���������ϼ�������', N'3', CAST(1.0 AS Numeric(3, 1)), 0, N'20002', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2000210016', N'10016', N'����ʽ', N'3', CAST(1.0 AS Numeric(3, 1)), 0, N'20002', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2000210017', N'10017', N'���ˣ��ж����ⲿԭ��', N'4', CAST(0.5 AS Numeric(3, 1)), 0, N'20002', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2000210018', N'10018', N'��������', N'4', CAST(0.5 AS Numeric(3, 1)), 0, N'20002', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2000210019', N'10019', N'�������', N'4', CAST(0.5 AS Numeric(3, 1)), 0, N'20002', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2000210020', N'10020', N'������ϱ���', N'4', CAST(0.5 AS Numeric(3, 1)), 0, N'20002', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2000210021', N'10021', N'������', N'4', CAST(0.5 AS Numeric(3, 1)), 0, N'20002', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2000210022', N'10022', N'ҩ�����ʷ', N'4', CAST(0.5 AS Numeric(3, 1)), 0, N'20002', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2000210023', N'10023', N'ʬ���¼', N'4', CAST(0.5 AS Numeric(3, 1)), 0, N'20002', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2000210024', N'10024', N'Ѫ��', N'4', CAST(0.5 AS Numeric(3, 1)), 0, N'20002', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2000210025', N'10025', N' Rh��ʶ', N'4', CAST(0.5 AS Numeric(3, 1)), 0, N'20002', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2000210026', N'10026', N'��������', N'4', CAST(0.5 AS Numeric(3, 1)), 0, N'20002', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2000210027', N'10027', N'����', N'4', CAST(0.5 AS Numeric(3, 1)), 0, N'20002', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2000210028', N'10028', N'��һ����', N'4', CAST(0.5 AS Numeric(3, 1)), 0, N'20002', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'20003', N'20003', N'������Ϣ', NULL, CAST(6.0 AS Numeric(3, 1)), 0, N'', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2000310000', N'10000', N'�ܷ���', N'1', CAST(4.0 AS Numeric(3, 1)), 0, N'20003', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2000310001', N'10001', N'�ۺ�ҽ�Ʒ�����', N'4', CAST(0.5 AS Numeric(3, 1)), 0, N'20003', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2000310002', N'10002', N'�����', N'4', CAST(0.5 AS Numeric(3, 1)), 0, N'20003', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2000310003', N'10003', N'������', N'4', CAST(0.5 AS Numeric(3, 1)), 0, N'20003', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2000310004', N'10004', N'������', N'4', CAST(0.5 AS Numeric(3, 1)), 0, N'20003', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2000310005', N'10005', N'��ҽ ��', N'4', CAST(0.5 AS Numeric(3, 1)), 0, N'20003', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2000310006', N'10006', N'��ҩ��', N'4', CAST(0.5 AS Numeric(3, 1)), 0, N'20003', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2000310007', N'10007', N'��ҩ��', N'4', CAST(0.5 AS Numeric(3, 1)), 0, N'20003', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2000310008', N'10008', N'ѪҺ��Ѫ��Ʒ��', N'4', CAST(0.5 AS Numeric(3, 1)), 0, N'20003', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2000310009', N'10009', N'�Ĳ���', N'4', CAST(0.5 AS Numeric(3, 1)), 0, N'20003', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2000310010', N'10010', N'������', N'4', CAST(0.5 AS Numeric(3, 1)), 0, N'20003', 0, N'1001')

INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'11700', N'11700', N'1.������ҳ', N'1', 4, 0, N'', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1170000001', N'00001', N'1.1ȱ��ҳ����ҳ�հ�.', N'1', 1, 0, N'11700', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1170000002', N'00002', N'1.2��дȱ��򲻹淶������', N'1', 1, 0, N'11700', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1170000003', N'00003', N'1.3�����д�������淶.', N'1', 1, 0, N'11700', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1170000004', N'00004', N'1.4ǩ������.', N'1', 1, 0, N'11700', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'11701', N'11701', N'2.��Ժ/������¼', N'1', 8, 0, N'', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1170100001', N'00001', N'2.1��Ժ/������¼', N'1', 6, 0, N'11701', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'117010000100001', N'00001', N'2.1.1ȱ��¼��δ�ڻ��߳�Ժ������������24Сʱ�����', N'1', 2, 0, N'1170100001', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'117010000100002', N'00002', N'2.1.2ȱ����¼��ȱ�ݡ�', N'1', 1, 0, N'1170100001', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'117010000100003', N'00003', N'2.1.3ȱҽʦǩ����', N'1', 2, 0, N'1170100001', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'117010000100004', N'00004', N'2.1.4������¼������ԭ������ʱ�䡣', N'1', 1, 0, N'1170100001', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1170100002', N'00002', N'2.2�����������ۼ�¼', N'1', 2, 0, N'11701', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'117010000200001', N'00001', N'2.2.1ȱ��¼��', N'1', 1, 0, N'1170100002', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'117010000200002', N'00002', N'2.2.2��¼���淶��', N'1', 1, 0, N'1170100002', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'11702', N'11702', N'3.��Ժ��¼/�ٴ���Ժ��¼', N'1', 30, 0, N'', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1170200001', N'00001', N'3.1����Ҫ��', N'1', 3, 0, N'11702', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'117020000100001', N'00001', N'3.1.1ȱ��¼�򳬹�������Ժ��24Сʱ��', N'1', 1, 0, N'1170200001', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'117020000100002', N'00002', N'3.1.2��ִҵҽʦ������Ա��д�Ĳ���δ��72h�ھ���Ժҽʦ��ǩ;', N'1', 2, 0, N'1170200001', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1170200002', N'00002', N'3.2һ����Ŀ', N'1', 1, 0, N'11702', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'117020000200001', N'00001', N'3.2.1ȱ������򲻹淶', N'1', 1, 0, N'1170200002', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1170200003', N'00003', N'3.3����', N'1', 3, 0, N'11702', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'117020000300001', N'00001', N'3.3.1����20���֡�δ������һ��ϡ�', N'1', 2, 0, N'1170200003', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'117020000300002', N'00002', N'3.3.2���淶����������ƴ��档', N'1', 1, 0, N'1170200003', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1170200004', N'00004', N'3.4�ֲ�ʷ', N'1', 5, 0, N'11702', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'117020000400001', N'00001', N'3.4.1�����߲���ء��������', N'1', 2, 0, N'1170200004', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'117020000400002', N'00002', N'3.4.2��ʱ��������׼ȷ��δд����ԭ�������', N'1', 1, 0, N'1170200004', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'117020000400003', N'00003', N'3.4.3��λ��ʱ�䡢���ʡ��̶ȼ�����֢״�����������', N'1', 1, 0, N'1170200004', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'117020000400004', N'00004', N'3.4.4ȱ�м�������������Ҫ����֢״��������', N'1', 1, 0, N'1170200004', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'117020000400005', N'00005', N'3.4.5һ�����δ������������ȫ��', N'1', 1, 0, N'1170200004', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'117020000400006', N'00006', N'3.4.6��Ժǰ�ļ�鼰���ξ���δ������������ȱ�ݡ�', N'1', 1, 0, N'1170200004', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1170200005', N'00005', N'3.5����ʷ', N'1', 3, 0, N'11702', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'117020000500001', N'00001', N'3.5.1ȱ��Ҫ������������������صļ���ʷ��', N'1', 1, 0, N'1170200005', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'117020000500002', N'00002', N'3.5.2ȱ��Ⱦ��ʷ��Ԥ������ʷ����������ʷ����Ѫʷ��', N'1', 1, 0, N'1170200005', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'117020000500003', N'00003', N'3.5.3ȱҩ�ʳ��ȹ���ʷ��������ȱ�ݡ�������ҳ����', N'1', 1, 0, N'1170200005', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1170200006', N'00006', N'3.6����ʷ', N'1', 2, 0, N'11702', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'117020000600001', N'00001', N'3.6.1ȱ����ʷ������©������صĸ���ʷ', N'1', 1, 0, N'1170200006', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'117020000600002', N'00002', N'3.6.2�������¾�������ʷȱ��򲻹淶��', N'1', 1, 0, N'1170200006', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1170200007', N'00007', N'3.7����ʷ', N'1', 2, 0, N'11702', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'117020000700001', N'00001', N'3.7.1ȱ�Ŵ�ʷ��', N'1', 1, 0, N'1170200007', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'117020000700002', N'00002', N'3.7.2�������������ߣ�����δ��������δ��¼��ĸ���', N'1', 1, 0, N'1170200007', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1170200008', N'00008', N'3.8������ǩ��', N'1', 3, 0, N'11702', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'117020000800001', N'00001', N'3.8.1ȱ������ǩ����һ�¡�', N'1', 2, 0, N'1170200008', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'117020000800002', N'00002', N'3.8.2δע��ǩ��ʱ�䡣', N'1', 1, 0, N'1170200008', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1170200009', N'00009', N'3.9�����', N'1', 5, 0, N'11702', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'117020000900001', N'00001', N'3.9.1����ȫ����д�����������淶��', N'1', 1, 0, N'1170200009', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'117020000900002', N'00002', N'3.9.2ר�Ƽ�鲻ȫ�棻Ӧ�еļ����������δ��¼���¼��ȫ��', N'1', 2, 0, N'1170200009', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1170200010', N'00010', N'3.10�������', N'1', 1, 0, N'11702', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'117020001000001', N'00001', N'3.10.1���δ��¼���¼��ȱ�ݣ�ȱ��Ժ���ҽԺ���Ƽ�����š�', N'1', 1, 0, N'1170200010', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1170200011', N'00011', N'3.11��ʷС��', N'1', 1, 0, N'11702', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'117020001100001', N'00001', N'3.11.1ȱ��ʷС�ᡣ', N'1', 1, 0, N'1170200011', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1170200012', N'00012', N'3.12�������', N'1', 1, 0, N'11702', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'117020001200001', N'00001', N'3.12.1ȱ������ϡ�', N'1', 1, 0, N'1170200012', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'11703', N'11703', N'4.���̼�¼', N'1', 35, 0, N'', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1170300001', N'00001', N'4.1�״β��̼�¼', N'1', 7, 0, N'11703', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'117030000100001', N'00001', N'4.1.1ȱ��¼��δ�ڻ�����Ժ��8Сʱ�����', N'1', 1, 0, N'1170300001', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'117030000100002', N'00002', N'4.1.2δ���������������壬�հ���Ժ��ʷ����켰������顣', N'1', 2, 0, N'1170300001', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'117030000100003', N'00003', N'4.1.3ȱ�������ۡ��ޱ��������ϡ�', N'1', 2, 0, N'1170300001', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'117030000100004', N'00004', N'4.1.4���Ƽƻ����׻���������Ի��������', N'1', 2, 0, N'1170300001', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1170300002', N'00002', N'4.2�ϼ�ҽʦ�״β鷿��¼', N'1', 5, 0, N'11703', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'117030000200001', N'00001', N'4.2.1ȱ��¼�򳬹�������Ժ��48Сʱ��', N'1', 10, 0, N'1170300002', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'117030000200002', N'00002', N'4.2.2ȱ�������ۡ�ȱ������ϡ�', N'1', 2, 0, N'1170300002', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'117030000200003', N'00003', N'4.2.3�������۲����������״β��̼�¼�е�������ͬ��', N'1', 2, 0, N'1170300002', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1170300003', N'00003', N'4.3�ϼ�ҽʦ�ճ��鷿��¼', N'1', 8, 0, N'11703', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'117030000300001', N'00001', N'4.3.1����ҽʦ�ճ��鷿�����ݡ��޷������޴������������ȱ�ݡ�', N'1', 3, 0, N'1170300003', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'117030000300002', N'00002', N'4.3.2����������ҽʦ�鷿�޷�����ָ���������', N'1', 3, 0, N'1170300003', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'117030000300003', N'00003', N'4.3.3ȱ�ϼ�ҽʦ�鷿��', N'1', 1, 0, N'1170300003', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1170300004', N'00004', N'4.4�ճ����̼�¼', N'1', 15, 0, N'11703', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'117030000400001', N'00001', N'4.4.1δ��ʱ��¼���߲���仯���۲��¼������ԡ����·��ֵ������޷����������ʩ�ȡ�', N'1', 1, 0, N'1170300004', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'117030000400002', N'00002', N'4.4.2δ���涨��¼���̼�¼����Σ��ʱ������ÿ��1�Σ���������ÿ2��1�Σ������ȶ�����ÿ3��1�Σ���', N'1', 1, 0, N'1170300004', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'117030000400003', N'00003', N'4.4.3δ��¼Ӱ�����ε��쳣����������޷������жϡ������¼', N'1', 1, 0, N'1170300004', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'117030000400004', N'00004', N'4.4.4δ��¼��Ҫ���ƴ�ʩ��δ�Ը��ĵ�ҩ����Ʒ�������˵��', N'1', 1, 0, N'1170300004', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'117030000400005', N'00005', N'4.4.5�Բ���Σ�ػ��ߣ�������δ��¼���߽�������֪��������', N'1', 2, 0, N'1170300004', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'117030000400006', N'00006', N'4.4.6ȱ����������������48h��δ��ɣ�������δ��10min����ɡ�', N'1', 2, 0, N'1170300004', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'117030000400007', N'00007', N'4.4.7�����¼��ȱ�����������ɼ�Ŀ�ġ��������������¼��ȱ��', N'1', 1, 0, N'1170300004', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'117030000400008', N'00008', N'4.4.8���̼�¼��ȱ���������ִ�������', N'1', 1, 0, N'1170300004', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'117030000400009', N'00009', N'4.4.9ȱ�д����Ʋ�����¼��δ�ڲ��������󼴿���д��', N'1', 10, 0, N'1170300004', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'117030000400010', N'00010', N'4.4.10�д����Ʋ�����¼ȱ�������̡�������Ӧ��ע����������ߡ�', N'1', 1, 0, N'1170300004', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'117030000400011', N'00011', N'4.4.11��Ѫ��ʹ��ѪҺ��Ʒ���첡�����޼�¼���¼��ȱ��', N'1', 1, 0, N'1170300004', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'117030000400012', N'00012', N'4.4.12ȱ���ȼ�¼������ҽ��δ�����Ƚ�����6h�����', N'1', 3, 0, N'1170300004', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'117030000400013', N'00013', N'4.4.13���ȼ�¼������ȱ�ݡ�', N'1', 1, 0, N'1170300004', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'117030000400014', N'00014', N'4.4.14����ҽ�������ȼ�¼���ݲ�һ�¡�', N'1', 2, 0, N'1170300004', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'117030000400015', N'00015', N'4.4.15ȱ�����Ӱ��¼��ת�Ƽ�¼���׶�С�ᡣ', N'1', 3, 0, N'1170300004', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'117030000400016', N'00016', N'4.4.16δ�ڹ涨ʱ������ɽ����Ӱ��¼��ת�Ƽ�¼���׶�С��', N'1', 2, 0, N'1170300004', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'117030000400017', N'00017', N'4.4.17������Ӱ��¼��ת����ת���¼��ͬ��', N'1', 2, 0, N'1170300004', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'117030000400018', N'00018', N'4.4.18ȱ��Ժ���̼�¼��', N'1', 2, 0, N'1170300004', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'117030000400019', N'00019', N'4.4.19������д������ȱ�ݡ�ȱ�©�', N'1', 1, 0, N'1170300004', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'11704', N'11704', N'5.֪��ͬ�⼰��Ȩί��', N'1', 23, 0, N'', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1170400001', N'00001', N'5.1�����������顢�����޻���/������ǩ����֪��ͬ���顣', N'1', 5, 0, N'11704', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1170400002', N'00002', N'5.2֪��ͬ����ȱ�����򲻹淶��', N'1', 5, 0, N'11704', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1170400003', N'00003', N'5.3ʹ���Է���Ŀȱ����ǩ����֪��ͬ����', N'1', 1, 0, N'11704', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1170400004', N'00004', N'5.4��������ʱ��ȱ���߽�����ǩ�������ǩ����ҽ������', N'1', 1, 0, N'11704', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1170400005', N'00005', N'5.5�ǻ���ǩ��ȱ��Ȩί����', N'1', 5, 0, N'11704', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1170400006', N'00006', N'5.6����Ȩί���˴�����ǩ���֪��ͬ����', N'1', 5, 0, N'11704', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1170400007', N'00007', N'5.7��Ȩί������д���ݼ������������ǩ�����ݼ���������', N'1', 1, 0, N'11704', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'11705', N'11705', N'6.ҽ�������������', N'1', 8, 0, N'', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1170500001', N'00001', N'6.1ҽ����', N'1', 3, 0, N'11705', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'117050000100001', N'00001', N'6.1.1ҽ�����ߡ�ֹͣ��ȡ�����淶��', N'1', 1, 0, N'1170500001', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'117050000100002', N'00002', N'6.1.2ҽ�����ݲ��淶���з�ҽ�����ݡ�', N'1', 1, 0, N'1170500001', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'117050000100003', N'00003', N'6.1.3ҽ����ִҵע��ҽʦǩ�����ǩ��', N'1', 1, 0, N'1170500001', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1170500002', N'00002', N'6.2�������', N'1', 5, 0, N'11705', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'117050000200001', N'00001', N'6.2.1סԺ48h����ȱѪ�򳣹滯������Ҳδת�����ﻯ����', N'1', 1, 0, N'1170500002', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'117050000200002', N'00002', N'6.2.2ȱ��Ѫǰ9����鱨�浥��������¼����ȱ�ܾ�ʱ���߻�ί����ǩ�֡�', N'1', 2, 0, N'1170500002', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'117050000200003', N'00003', N'6.2.3δ�����ǰ�����顣', N'1', 1, 0, N'1170500002', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'117050000200004', N'00004', N'6.2.4������鱨�浥��ȫ��ʧ��', N'1', 1, 0, N'1170500002', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'11706', N'11706', N'7.��д����ԭ��', N'1', 20, 0, N'', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1170600001', N'00001', N'7.1��Ϳ�Ļ�α�첡������Ϊ��', N'1', 1, 0, N'11706', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1170600002', N'00002', N'7.2�޸Ĳ��淶��', N'1', 1, 0, N'11706', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1170600003', N'00003', N'7.3���ں�ʱ��δʹ�ð��������ֺ�24Сʱ�Ƽ�¼��', N'1', 1, 0, N'11706', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1170600004', N'00004', N'7.4ȱ��¼ҽʦ�ĵ���ǩ������дǩ����', N'1', 1, 0, N'11706', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1170600005', N'00005', N'7.5ҽʦǩ����ǩ', N'1', 3, 0, N'11706', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1170600006', N'00006', N'7.6�����¼�������д����������Ϣ��¼����', N'1', 1, 0, N'11706', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1170600007', N'00007', N'7.7�����м�¼�����໥ì�ܡ�', N'1', 2, 0, N'11706', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1170600008', N'00008', N'7.8ϵ������Ϊ���µ����ش���', N'1', 10, 0, N'11706', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'11707', N'11707', N'ҽ������', N'1', 8, 0, N'', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1170700001', N'00001', N'1.1������鱨�浥������Ʊ��浥���⣩δʹ��A4ֽ�Ŵ�ӡ��', N'1', 1, 0, N'11707', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1170700002', N'00002', N'1.2������鱨�浥�޸Ĳ��淶��', N'1', 1, 0, N'11707', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1170700003', N'00003', N'1.3���鱨�浥����Ѫ������Ѫ��δ˫ǩ��ֵ��ʱ����⣩��', N'1', 1, 0, N'11707', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1170700004', N'00004', N'1.4ȱ��������������֪��ͬ�����ȱ���ȱ����Ȩ��', N'1', 2, 0, N'11707', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1170700005', N'00005', N'1.5������ȫ�˲��������ȱ�������������������ּ���¼ȱ��', N'1', 2, 0, N'11707', 0, N'1000')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'1170700006', N'00006', N'1.6������������������������������������ʱ��ȱ�', N'1', 1, 0, N'11707', 0, N'1000')

INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'21700', N'21700', N'1.������ҳ', N'1', 4, 0, N'', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2170000001', N'00001', N'1.1ȱ��ҳ����ҳ�հ�.', N'1', 1, 0, N'21700', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2170000002', N'00002', N'1.2��дȱ��򲻹淶������', N'1', 1, 0, N'21700', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2170000003', N'00003', N'1.3�����д�������淶.', N'1', 1, 0, N'21700', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2170000004', N'00004', N'1.4ǩ������.', N'1', 1, 0, N'21700', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'21701', N'21701', N'2.��Ժ/������¼', N'1', 8, 0, N'', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2170100001', N'00001', N'2.1��Ժ/������¼', N'1', 6, 0, N'21701', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'217010000100001', N'00001', N'2.1.1ȱ��¼��δ�ڻ��߳�Ժ������������24Сʱ�����', N'1', 2, 0, N'2170100001', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'217010000100002', N'00002', N'2.1.2ȱ����¼��ȱ�ݡ�', N'1', 1, 0, N'2170100001', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'217010000100003', N'00003', N'2.1.3ȱҽʦǩ����', N'1', 2, 0, N'2170100001', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'217010000100004', N'00004', N'2.1.4������¼������ԭ������ʱ�䡣', N'1', 1, 0, N'2170100001', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2170100002', N'00002', N'2.2�����������ۼ�¼', N'1', 2, 0, N'21701', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'217010000200001', N'00001', N'2.2.1ȱ��¼��', N'1', 1, 0, N'2170100002', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'217010000200002', N'00002', N'2.2.2��¼���淶��', N'1', 1, 0, N'2170100002', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'21702', N'21702', N'3.��Ժ��¼/�ٴ���Ժ��¼', N'1', 30, 0, N'', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2170200001', N'00001', N'3.1����Ҫ��', N'1', 3, 0, N'21702', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'217020000100001', N'00001', N'3.1.1ȱ��¼�򳬹�������Ժ��24Сʱ��', N'1', 1, 0, N'2170200001', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'217020000100002', N'00002', N'3.1.2��ִҵҽʦ������Ա��д�Ĳ���δ��72h�ھ���Ժҽʦ��ǩ;', N'1', 2, 0, N'2170200001', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2170200002', N'00002', N'3.2һ����Ŀ', N'1', 1, 0, N'21702', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'217020000200001', N'00001', N'3.2.1ȱ������򲻹淶', N'1', 1, 0, N'2170200002', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2170200003', N'00003', N'3.3����', N'1', 3, 0, N'21702', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'217020000300001', N'00001', N'3.3.1����20���֡�δ������һ��ϡ�', N'1', 2, 0, N'2170200003', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'217020000300002', N'00002', N'3.3.2���淶����������ƴ��档', N'1', 1, 0, N'2170200003', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2170200004', N'00004', N'3.4�ֲ�ʷ', N'1', 5, 0, N'21702', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'217020000400001', N'00001', N'3.4.1�����߲���ء��������', N'1', 2, 0, N'2170200004', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'217020000400002', N'00002', N'3.4.2��ʱ��������׼ȷ��δд����ԭ�������', N'1', 1, 0, N'2170200004', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'217020000400003', N'00003', N'3.4.3��λ��ʱ�䡢���ʡ��̶ȼ�����֢״�����������', N'1', 1, 0, N'2170200004', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'217020000400004', N'00004', N'3.4.4ȱ�м�������������Ҫ����֢״��������', N'1', 1, 0, N'2170200004', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'217020000400005', N'00005', N'3.4.5һ�����δ������������ȫ��', N'1', 1, 0, N'2170200004', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'217020000400006', N'00006', N'3.4.6��Ժǰ�ļ�鼰���ξ���δ������������ȱ�ݡ�', N'1', 1, 0, N'2170200004', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2170200005', N'00005', N'3.5����ʷ', N'1', 3, 0, N'21702', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'217020000500001', N'00001', N'3.5.1ȱ��Ҫ������������������صļ���ʷ��', N'1', 1, 0, N'2170200005', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'217020000500002', N'00002', N'3.5.2ȱ��Ⱦ��ʷ��Ԥ������ʷ����������ʷ����Ѫʷ��', N'1', 1, 0, N'2170200005', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'217020000500003', N'00003', N'3.5.3ȱҩ�ʳ��ȹ���ʷ��������ȱ�ݡ�������ҳ����', N'1', 1, 0, N'2170200005', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2170200006', N'00006', N'3.6����ʷ', N'1', 2, 0, N'21702', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'217020000600001', N'00001', N'3.6.1ȱ����ʷ������©������صĸ���ʷ', N'1', 1, 0, N'2170200006', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'217020000600002', N'00002', N'3.6.2�������¾�������ʷȱ��򲻹淶��', N'1', 1, 0, N'2170200006', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2170200007', N'00007', N'3.7����ʷ', N'1', 2, 0, N'21702', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'217020000700001', N'00001', N'3.7.1ȱ�Ŵ�ʷ��', N'1', 1, 0, N'2170200007', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'217020000700002', N'00002', N'3.7.2�������������ߣ�����δ��������δ��¼��ĸ���', N'1', 1, 0, N'2170200007', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2170200008', N'00008', N'3.8������ǩ��', N'1', 3, 0, N'21702', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'217020000800001', N'00001', N'3.8.1ȱ������ǩ����һ�¡�', N'1', 2, 0, N'2170200008', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'217020000800002', N'00002', N'3.8.2δע��ǩ��ʱ�䡣', N'1', 1, 0, N'2170200008', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2170200009', N'00009', N'3.9�����', N'1', 5, 0, N'21702', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'217020000900001', N'00001', N'3.9.1����ȫ����д�����������淶��', N'1', 1, 0, N'2170200009', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'217020000900002', N'00002', N'3.9.2ר�Ƽ�鲻ȫ�棻Ӧ�еļ����������δ��¼���¼��ȫ��', N'1', 2, 0, N'2170200009', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2170200010', N'00010', N'3.10�������', N'1', 1, 0, N'21702', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'217020001000001', N'00001', N'3.10.1���δ��¼���¼��ȱ�ݣ�ȱ��Ժ���ҽԺ���Ƽ�����š�', N'1', 1, 0, N'2170200010', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2170200011', N'00011', N'3.11��ʷС��', N'1', 1, 0, N'21702', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'217020001100001', N'00001', N'3.11.1ȱ��ʷС�ᡣ', N'1', 1, 0, N'2170200011', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2170200012', N'00012', N'3.12�������', N'1', 1, 0, N'21702', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'217020001200001', N'00001', N'3.12.1ȱ������ϡ�', N'1', 1, 0, N'2170200012', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'21703', N'21703', N'4.���̼�¼', N'1', 35, 0, N'', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2170300001', N'00001', N'4.1�״β��̼�¼', N'1', 7, 0, N'21703', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'217030000100001', N'00001', N'4.1.1ȱ��¼��δ�ڻ�����Ժ��8Сʱ�����', N'1', 1, 0, N'2170300001', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'217030000100002', N'00002', N'4.1.2δ���������������壬�հ���Ժ��ʷ����켰������顣', N'1', 2, 0, N'2170300001', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'217030000100003', N'00003', N'4.1.3ȱ�������ۡ��ޱ��������ϡ�', N'1', 2, 0, N'2170300001', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'217030000100004', N'00004', N'4.1.4���Ƽƻ����׻���������Ի��������', N'1', 2, 0, N'2170300001', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2170300002', N'00002', N'4.2�ϼ�ҽʦ�״β鷿��¼', N'1', 5, 0, N'21703', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'217030000200001', N'00001', N'4.2.1ȱ��¼�򳬹�������Ժ��48Сʱ��', N'1', 10, 0, N'2170300002', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'217030000200002', N'00002', N'4.2.2ȱ�������ۡ�ȱ������ϡ�', N'1', 2, 0, N'2170300002', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'217030000200003', N'00003', N'4.2.3�������۲����������״β��̼�¼�е�������ͬ��', N'1', 2, 0, N'2170300002', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2170300003', N'00003', N'4.3�ϼ�ҽʦ�ճ��鷿��¼', N'1', 8, 0, N'21703', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'217030000300001', N'00001', N'4.3.1����ҽʦ�ճ��鷿�����ݡ��޷������޴������������ȱ�ݡ�', N'1', 3, 0, N'2170300003', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'217030000300002', N'00002', N'4.3.2����������ҽʦ�鷿�޷�����ָ���������', N'1', 3, 0, N'2170300003', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'217030000300003', N'00003', N'4.3.3ȱ�ϼ�ҽʦ�鷿��', N'1', 1, 0, N'2170300003', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2170300004', N'00004', N'4.4�ճ����̼�¼', N'1', 15, 0, N'21703', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'217030000400001', N'00001', N'4.4.1δ��ʱ��¼���߲���仯���۲��¼������ԡ����·��ֵ������޷����������ʩ�ȡ�', N'1', 1, 0, N'2170300004', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'217030000400002', N'00002', N'4.4.2δ���涨��¼���̼�¼����Σ��ʱ������ÿ��1�Σ���������ÿ2��1�Σ������ȶ�����ÿ3��1�Σ���', N'1', 1, 0, N'2170300004', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'217030000400003', N'00003', N'4.4.3δ��¼Ӱ�����ε��쳣����������޷������жϡ������¼', N'1', 1, 0, N'2170300004', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'217030000400004', N'00004', N'4.4.4δ��¼��Ҫ���ƴ�ʩ��δ�Ը��ĵ�ҩ����Ʒ�������˵��', N'1', 1, 0, N'2170300004', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'217030000400005', N'00005', N'4.4.5�Բ���Σ�ػ��ߣ�������δ��¼���߽�������֪��������', N'1', 2, 0, N'2170300004', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'217030000400006', N'00006', N'4.4.6ȱ����������������48h��δ��ɣ�������δ��10min����ɡ�', N'1', 2, 0, N'2170300004', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'217030000400007', N'00007', N'4.4.7�����¼��ȱ�����������ɼ�Ŀ�ġ��������������¼��ȱ��', N'1', 1, 0, N'2170300004', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'217030000400008', N'00008', N'4.4.8���̼�¼��ȱ���������ִ�������', N'1', 1, 0, N'2170300004', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'217030000400009', N'00009', N'4.4.9ȱ�д����Ʋ�����¼��δ�ڲ��������󼴿���д��', N'1', 10, 0, N'2170300004', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'217030000400010', N'00010', N'4.4.10�д����Ʋ�����¼ȱ�������̡�������Ӧ��ע����������ߡ�', N'1', 1, 0, N'2170300004', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'217030000400011', N'00011', N'4.4.11��Ѫ��ʹ��ѪҺ��Ʒ���첡�����޼�¼���¼��ȱ��', N'1', 1, 0, N'2170300004', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'217030000400012', N'00012', N'4.4.12ȱ���ȼ�¼������ҽ��δ�����Ƚ�����6h�����', N'1', 3, 0, N'2170300004', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'217030000400013', N'00013', N'4.4.13���ȼ�¼������ȱ�ݡ�', N'1', 1, 0, N'2170300004', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'217030000400014', N'00014', N'4.4.14����ҽ�������ȼ�¼���ݲ�һ�¡�', N'1', 2, 0, N'2170300004', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'217030000400015', N'00015', N'4.4.15ȱ�����Ӱ��¼��ת�Ƽ�¼���׶�С�ᡣ', N'1', 3, 0, N'2170300004', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'217030000400016', N'00016', N'4.4.16δ�ڹ涨ʱ������ɽ����Ӱ��¼��ת�Ƽ�¼���׶�С��', N'1', 2, 0, N'2170300004', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'217030000400017', N'00017', N'4.4.17������Ӱ��¼��ת����ת���¼��ͬ��', N'1', 2, 0, N'2170300004', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'217030000400018', N'00018', N'4.4.18ȱ��Ժ���̼�¼��', N'1', 2, 0, N'2170300004', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'217030000400019', N'00019', N'4.4.19������д������ȱ�ݡ�ȱ�©�', N'1', 1, 0, N'2170300004', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'21704', N'21704', N'5.֪��ͬ�⼰��Ȩί��', N'1', 23, 0, N'', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2170400001', N'00001', N'5.1�����������顢�����޻���/������ǩ����֪��ͬ���顣', N'1', 5, 0, N'21704', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2170400002', N'00002', N'5.2֪��ͬ����ȱ�����򲻹淶��', N'1', 5, 0, N'21704', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2170400003', N'00003', N'5.3ʹ���Է���Ŀȱ����ǩ����֪��ͬ����', N'1', 1, 0, N'21704', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2170400004', N'00004', N'5.4��������ʱ��ȱ���߽�����ǩ�������ǩ����ҽ������', N'1', 1, 0, N'21704', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2170400005', N'00005', N'5.5�ǻ���ǩ��ȱ��Ȩί����', N'1', 5, 0, N'21704', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2170400006', N'00006', N'5.6����Ȩί���˴�����ǩ���֪��ͬ����', N'1', 5, 0, N'21704', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2170400007', N'00007', N'5.7��Ȩί������д���ݼ������������ǩ�����ݼ���������', N'1', 1, 0, N'21704', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'21705', N'21705', N'6.ҽ�������������', N'1', 8, 0, N'', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2170500001', N'00001', N'6.1ҽ����', N'1', 3, 0, N'21705', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'217050000100001', N'00001', N'6.1.1ҽ�����ߡ�ֹͣ��ȡ�����淶��', N'1', 1, 0, N'2170500001', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'217050000100002', N'00002', N'6.1.2ҽ�����ݲ��淶���з�ҽ�����ݡ�', N'1', 1, 0, N'2170500001', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'217050000100003', N'00003', N'6.1.3ҽ����ִҵע��ҽʦǩ�����ǩ��', N'1', 1, 0, N'2170500001', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2170500002', N'00002', N'6.2�������', N'1', 5, 0, N'21705', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'217050000200001', N'00001', N'6.2.1סԺ48h����ȱѪ�򳣹滯������Ҳδת�����ﻯ����', N'1', 1, 0, N'2170500002', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'217050000200002', N'00002', N'6.2.2ȱ��Ѫǰ9����鱨�浥��������¼����ȱ�ܾ�ʱ���߻�ί����ǩ�֡�', N'1', 2, 0, N'2170500002', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'217050000200003', N'00003', N'6.2.3δ�����ǰ�����顣', N'1', 1, 0, N'2170500002', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'217050000200004', N'00004', N'6.2.4������鱨�浥��ȫ��ʧ��', N'1', 1, 0, N'2170500002', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'21706', N'21706', N'7.��д����ԭ��', N'1', 20, 0, N'', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2170600001', N'00001', N'7.1��Ϳ�Ļ�α�첡������Ϊ��', N'1', 1, 0, N'21706', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2170600002', N'00002', N'7.2�޸Ĳ��淶��', N'1', 1, 0, N'21706', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2170600003', N'00003', N'7.3���ں�ʱ��δʹ�ð��������ֺ�24Сʱ�Ƽ�¼��', N'1', 1, 0, N'21706', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2170600004', N'00004', N'7.4ȱ��¼ҽʦ�ĵ���ǩ������дǩ����', N'1', 1, 0, N'21706', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2170600005', N'00005', N'7.5ҽʦǩ����ǩ', N'1', 3, 0, N'21706', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2170600006', N'00006', N'7.6�����¼�������д����������Ϣ��¼����', N'1', 1, 0, N'21706', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2170600007', N'00007', N'7.7�����м�¼�����໥ì�ܡ�', N'1', 2, 0, N'21706', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2170600008', N'00008', N'7.8ϵ������Ϊ���µ����ش���', N'1', 10, 0, N'21706', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'21707', N'21707', N'ҽ������', N'1', 8, 0, N'', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2170700001', N'00001', N'1.1������鱨�浥������Ʊ��浥���⣩δʹ��A4ֽ�Ŵ�ӡ��', N'1', 1, 0, N'21707', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2170700002', N'00002', N'1.2������鱨�浥�޸Ĳ��淶��', N'1', 1, 0, N'21707', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2170700003', N'00003', N'1.3���鱨�浥����Ѫ������Ѫ��δ˫ǩ��ֵ��ʱ����⣩��', N'1', 1, 0, N'21707', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2170700004', N'00004', N'1.4ȱ��������������֪��ͬ�����ȱ���ȱ����Ȩ��', N'1', 2, 0, N'21707', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2170700005', N'00005', N'1.5������ȫ�˲��������ȱ�������������������ּ���¼ȱ��', N'1', 2, 0, N'21707', 0, N'1001')
INSERT [dbo].[Vszmzlpf] ([code], [itemCode], [codeName], [xmlx], [xmfz], [isBj], [upperCode], [isTy], [zklb]) VALUES (N'2170700006', N'00006', N'1.6������������������������������������ʱ��ȱ�', N'1', 1, 0, N'21707', 0, N'1001')
