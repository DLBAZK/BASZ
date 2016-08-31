 if not exists (select * from VsLib where LibCode ='500001')
	insert into VsLib(LibCode,LibName,LibDesc) values('500001','SzBaLz.dll','病案示踪')
	
 if not exists (select * from VsLib where LibCode ='400001')
	insert into VsLib(LibCode,LibName,LibDesc) values('400001','Sz_BaLz.dll','病案示踪中间库')	
	
if  exists (select * from VsMenu where MenuCode = '201')
begin
	delete from VsMenu where MenuCode = '201'
	insert into VsMenu (MenuCode,MenuICode,MenuPCode,MenuName,MenuEnd,MenuFormName,MenuLib,MenuSysCenter,MenuVisible,MenuImgIndex,MenuKind)
	values('201','01','','病案流转','0','','500001','1','1',null,'BASZ')
end
else
	insert into VsMenu (MenuCode,MenuICode,MenuPCode,MenuName,MenuEnd,MenuFormName,MenuLib,MenuSysCenter,MenuVisible,MenuImgIndex,MenuKind)
	values('201','01','','病案流转','0','','500001','1','1',null,'BASZ')
	
if  exists (select * from VsMenu where MenuCode = '20101')
begin
	delete from VsMenu where MenuCode = '20101'
	insert into VsMenu (MenuCode,MenuICode,MenuPCode,MenuName,MenuEnd,MenuFormName,MenuLib,MenuSysCenter,MenuVisible,MenuImgIndex,MenuKind)
	values('20101','01','201','&1.流转动作配置','1','TfrmActionCon','500001','1','1',null,'BASZ')
end
else
	insert into VsMenu (MenuCode,MenuICode,MenuPCode,MenuName,MenuEnd,MenuFormName,MenuLib,MenuSysCenter,MenuVisible,MenuImgIndex,MenuKind)
	values('20101','01','201','&1.流转动作配置','1','TfrmActionCon','500001','1','1',null,'BASZ')	

if  exists (select * from VsMenu where MenuCode = '20102')
begin
	delete from VsMenu where MenuCode = '20102'
	insert into VsMenu (MenuCode,MenuICode,MenuPCode,MenuName,MenuEnd,MenuFormName,MenuLib,MenuSysCenter,MenuVisible,MenuImgIndex,MenuKind)
	values('20102','02','201','&2.病案流转','1','TfrmActionMap','500001','1','1',null,'BASZ')
end
else
	insert into VsMenu (MenuCode,MenuICode,MenuPCode,MenuName,MenuEnd,MenuFormName,MenuLib,MenuSysCenter,MenuVisible,MenuImgIndex,MenuKind)
	values('20102','02','201','&2.病案流转','1','TfrmActionMap','500001','1','1',null,'BASZ')	
		
	if  exists (select * from VsMenu where MenuCode = '20103')
begin
	delete from VsMenu where MenuCode = '50007'
	insert into VsMenu (MenuCode,MenuICode,MenuPCode,MenuName,MenuEnd,MenuFormName,MenuLib,MenuSysCenter,MenuVisible,MenuImgIndex,MenuKind)
	values('20103','03','201','&3.病案注销','1','TfrmBACancel','500001','1','1',null,'BASZ')
end
else
	insert into VsMenu (MenuCode,MenuICode,MenuPCode,MenuName,MenuEnd,MenuFormName,MenuLib,MenuSysCenter,MenuVisible,MenuImgIndex,MenuKind)
	values('20103','03','201','&3.病案注销','1','TfrmBACancel','500001','1','1',null,'BASZ')	
	
	
	if  exists (select * from VsMenu where MenuCode = '20104')
begin
	delete from VsMenu where MenuCode = '20104'
	insert into VsMenu (MenuCode,MenuICode,MenuPCode,MenuName,MenuEnd,MenuFormName,MenuLib,MenuSysCenter,MenuVisible,MenuImgIndex,MenuKind)
	values('20104','04','201','&4.病案示踪','1','TfrmTracer','500001','1','1',null,'BASZ')
end
else
	insert into VsMenu (MenuCode,MenuICode,MenuPCode,MenuName,MenuEnd,MenuFormName,MenuLib,MenuSysCenter,MenuVisible,MenuImgIndex,MenuKind)
	values('20104','04','201','&4.病案示踪','1','TfrmTracer','500001','1','1',null,'BASZ')	
	
	
			
			
if  exists(select * from VsMidOper where MidOperCode ='5001')
begin
	delete from VsMidOper where MidOperCode = '5001'
	insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) 
     VALUES  (5001,'TSZActionCon','400001','EuSZActionCon','示踪流转动作配置中间层')	
end
else
  insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) 
     VALUES  (5001,'TSZActionCon','400001','EuSZActionCon','示踪流转动作配置中间层')	
 	
 if  exists(select * from VsMidOper where MidOperCode ='5002')
begin
	delete from VsMidOper where MidOperCode = '5002'
	insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) 
     VALUES  (5002,'TSZRevokeReason','400001','EuSZRevokeReason','示踪流转动作撤销原因配置中间层')	
end
else
  insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) 
     VALUES  (5002,'TSZRevokeReason','400001','EuSZRevokeReason','示踪流转动作撤销原因配置中间层')	
     
     
 if  exists(select * from VsMidOper where MidOperCode ='5003')
begin
	delete from VsMidOper where MidOperCode = '5003'
	insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) 
     VALUES  (5003,'TSZReclaim','400001','EuSZReclaim','病案回收中间层')	
end
else
  insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) 
     VALUES  (5003,'TSZReclaim','400001','EuSZReclaim','病案回收中间层')	
     

     
     
 INSERT INTO SZActionState values('1','签入')
 INSERT INTO SZActionState values('2','处理中')
 INSERT INTO SZActionState values('3','签出')
 INSERT INTO SZActionState values('-1','撤销签入')
 INSERT INTO SZActionState values('-2','撤销处理中')
 INSERT INTO SZActionState values('-3','撤销签出')
 
  INSERT INTO dbo.SZActionDic VALUES('101','接收')
  INSERT INTO dbo.SZActionDic VALUES('102','编目')
  INSERT INTO dbo.SZActionDic VALUES('103','质控')
  INSERT INTO dbo.SZActionDic VALUES('104','装订')
  INSERT INTO dbo.SZActionDic VALUES('105','上架')
  
  INSERT INTO SZSJZD ( DM, DMkind, DMMC, TYBZ, PYM, WBM ) VALUES  ( '0', 'CXYY', '撤销原因', 0,'', '')

 


 
 