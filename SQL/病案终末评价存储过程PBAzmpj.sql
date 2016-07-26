USE [batj2005]
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
	fxmfz NUMERIC(3,1),
	sxmfz NUMERIC(3,1),
	txmfz NUMERIC(3,1),
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