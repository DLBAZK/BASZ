 if not exists (select * from VsLib where LibCode ='100029')
	insert into VsLib(LibCode,LibName,LibDesc) values('100029','BASZ.dll','病案示踪')
	
 if not exists (select * from VsLib where LibCode ='200029')
	insert into VsLib(LibCode,LibName,LibDesc) values('200029','M_BASZ.dll','病案示踪中间库')	
	
if  exists (select * from VsMenu where MenuCode = '500')
begin
	delete from VsMenu where MenuCode = '500'
	insert into VsMenu (MenuCode,MenuICode,MenuPCode,MenuName,MenuEnd,MenuFormName,MenuLib,MenuSysCenter,MenuVisible,MenuImgIndex)
	values('500','01','','病案示踪','0','','100029','1','1',null)
end
else
	insert into VsMenu (MenuCode,MenuICode,MenuPCode,MenuName,MenuEnd,MenuFormName,MenuLib,MenuSysCenter,MenuVisible,MenuImgIndex)
	values('500','01','','病案示踪','0','','100029','1','1',null)
	
if  exists (select * from VsMenu where MenuCode = '50001')
begin
	delete from VsMenu where MenuCode = '50001'
	insert into VsMenu (MenuCode,MenuICode,MenuPCode,MenuName,MenuEnd,MenuFormName,MenuLib,MenuSysCenter,MenuVisible,MenuImgIndex)
	values('50001','01','500','&1.流转动作配置','1','TfrmActionCon','100029','1','1',null)
end
else
	insert into VsMenu (MenuCode,MenuICode,MenuPCode,MenuName,MenuEnd,MenuFormName,MenuLib,MenuSysCenter,MenuVisible,MenuImgIndex)
	values('50001','01','500','&1.流转动作配置','1','TfrmActionCon','100029','1','1',null)	
	
	
if  exists (select * from VsMenu where MenuCode = '50002')
begin
	delete from VsMenu where MenuCode = '50002'
	insert into VsMenu (MenuCode,MenuICode,MenuPCode,MenuName,MenuEnd,MenuFormName,MenuLib,MenuSysCenter,MenuVisible,MenuImgIndex)
	values('50002','02','500','&2.撤销原因配置','1','TfrmRevokeReason','100029','1','1',null)
end
else
	insert into VsMenu (MenuCode,MenuICode,MenuPCode,MenuName,MenuEnd,MenuFormName,MenuLib,MenuSysCenter,MenuVisible,MenuImgIndex)
	values('50002','02','500','&2.撤销原因配置','1','TfrmRevokeReason','100029','1','1',null)
		
if  exists (select * from VsMenu where MenuCode = '50003')
begin
	delete from VsMenu where MenuCode = '50003'
	insert into VsMenu (MenuCode,MenuICode,MenuPCode,MenuName,MenuEnd,MenuFormName,MenuLib,MenuSysCenter,MenuVisible,MenuImgIndex)
	values('50003','03','500','&3.病案回收','1','TfrmReclaim','100029','1','1',null)
end
else
	insert into VsMenu (MenuCode,MenuICode,MenuPCode,MenuName,MenuEnd,MenuFormName,MenuLib,MenuSysCenter,MenuVisible,MenuImgIndex)
	values('50003','03','500','&3.病案回收','1','TfrmReclaim','100029','1','1',null)	
	
	
if  exists (select * from VsMenu where MenuCode = '50004')
begin
	delete from VsMenu where MenuCode = '50004'
	insert into VsMenu (MenuCode,MenuICode,MenuPCode,MenuName,MenuEnd,MenuFormName,MenuLib,MenuSysCenter,MenuVisible,MenuImgIndex)
	values('50004','04','500','&4.病案质控','0','','100029','1','1',null)
end
else
	insert into VsMenu (MenuCode,MenuICode,MenuPCode,MenuName,MenuEnd,MenuFormName,MenuLib,MenuSysCenter,MenuVisible,MenuImgIndex)
	values('50004','04','500','&4.病案质控','0','','100029','1','1',null)

if  exists (select * from VsMenu where MenuCode = '5000401')
begin
	delete from VsMenu where MenuCode = '5000401'
	insert into VsMenu (MenuCode,MenuICode,MenuPCode,MenuName,MenuEnd,MenuFormName,MenuLib,MenuSysCenter,MenuVisible,MenuImgIndex)
	values('5000401','01','50004','&1.签入','1','TfrmzkCheckIn','100029','1','1',null)
end
else
	insert into VsMenu (MenuCode,MenuICode,MenuPCode,MenuName,MenuEnd,MenuFormName,MenuLib,MenuSysCenter,MenuVisible,MenuImgIndex)
	values('5000401','01','50004','&1.签入','1','TfrmzkCheckIn','100029','1','1',null)
	
if  exists (select * from VsMenu where MenuCode = '5000402')
begin
	delete from VsMenu where MenuCode = '5000402'
	insert into VsMenu (MenuCode,MenuICode,MenuPCode,MenuName,MenuEnd,MenuFormName,MenuLib,MenuSysCenter,MenuVisible,MenuImgIndex)
	values('5000402','02','50004','&2.签出','1','TfrmZKCheckOut','100029','1','1',null)
end
else
	insert into VsMenu (MenuCode,MenuICode,MenuPCode,MenuName,MenuEnd,MenuFormName,MenuLib,MenuSysCenter,MenuVisible,MenuImgIndex)
	values('5000402','02','50004','&2.签出','1','TfrmZKCheckOut','100029','1','1',null)	

if  exists (select * from VsMenu where MenuCode = '5000403')
begin
	delete from VsMenu where MenuCode = '5000403'
	insert into VsMenu (MenuCode,MenuICode,MenuPCode,MenuName,MenuEnd,MenuFormName,MenuLib,MenuSysCenter,MenuVisible,MenuImgIndex)
	values('5000403','03','50004','&3.撤销','1','TfrmZKRevoke','100029','1','1',null)
end
else
	insert into VsMenu (MenuCode,MenuICode,MenuPCode,MenuName,MenuEnd,MenuFormName,MenuLib,MenuSysCenter,MenuVisible,MenuImgIndex)
	values('5000403','03','50004','&3.撤销','1','TfrmZKRevoke','100029','1','1',null)	




		
		
if  exists (select * from VsMenu where MenuCode = '50005')
begin
	delete from VsMenu where MenuCode = '50005'
	insert into VsMenu (MenuCode,MenuICode,MenuPCode,MenuName,MenuEnd,MenuFormName,MenuLib,MenuSysCenter,MenuVisible,MenuImgIndex)
	values('50005','05','500','&5.病案编目','0','','100029','1','1',null)
end
else
	insert into VsMenu (MenuCode,MenuICode,MenuPCode,MenuName,MenuEnd,MenuFormName,MenuLib,MenuSysCenter,MenuVisible,MenuImgIndex)
	values('50005','05','500','&5.病案编目','0','','100029','1','1',null)

if  exists (select * from VsMenu where MenuCode = '5000501')
begin
	delete from VsMenu where MenuCode = '5000501'
	insert into VsMenu (MenuCode,MenuICode,MenuPCode,MenuName,MenuEnd,MenuFormName,MenuLib,MenuSysCenter,MenuVisible,MenuImgIndex)
	values('5000501','01','50005','&1.签入','1','TfrmFrmCatalogue','100029','1','1',null)
end
else
	insert into VsMenu (MenuCode,MenuICode,MenuPCode,MenuName,MenuEnd,MenuFormName,MenuLib,MenuSysCenter,MenuVisible,MenuImgIndex)
	values('5000501','01','50005','&1.签入','1','TfrmFrmCatalogue','100029','1','1',null)
	
if  exists (select * from VsMenu where MenuCode = '5000502')
begin
	delete from VsMenu where MenuCode = '5000502'
	insert into VsMenu (MenuCode,MenuICode,MenuPCode,MenuName,MenuEnd,MenuFormName,MenuLib,MenuSysCenter,MenuVisible,MenuImgIndex)
	values('5000502','02','50005','&2.签出','1','TfrmCatalOut','100029','1','1',null)
end
else
	insert into VsMenu (MenuCode,MenuICode,MenuPCode,MenuName,MenuEnd,MenuFormName,MenuLib,MenuSysCenter,MenuVisible,MenuImgIndex)
	values('5000502','02','50005','&2.签出','1','TfrmCatalOut','100029','1','1',null)	
	
	
if  exists (select * from VsMenu where MenuCode = '5000503')
begin
	delete from VsMenu where MenuCode = '5000503'
	insert into VsMenu (MenuCode,MenuICode,MenuPCode,MenuName,MenuEnd,MenuFormName,MenuLib,MenuSysCenter,MenuVisible,MenuImgIndex)
	values('5000503','03','50005','&3.撤销','1','TfrmCataloRevoke','100029','1','1',null)
end
else
	insert into VsMenu (MenuCode,MenuICode,MenuPCode,MenuName,MenuEnd,MenuFormName,MenuLib,MenuSysCenter,MenuVisible,MenuImgIndex)
	values('5000503','03','50005','&3.撤销','1','TfrmCataloRevoke','100029','1','1',null)	
	

if  exists (select * from VsMenu where MenuCode = '50006')
begin
	delete from VsMenu where MenuCode = '50006'
	insert into VsMenu (MenuCode,MenuICode,MenuPCode,MenuName,MenuEnd,MenuFormName,MenuLib,MenuSysCenter,MenuVisible,MenuImgIndex)
	values('50006','06','500','&6.病案装订','0','','100029','1','1',null)
end
else
	insert into VsMenu (MenuCode,MenuICode,MenuPCode,MenuName,MenuEnd,MenuFormName,MenuLib,MenuSysCenter,MenuVisible,MenuImgIndex)
	values('50006','06','500','&6.病案装订','0','','100029','1','1',null)

if  exists (select * from VsMenu where MenuCode = '5000601')
begin
	delete from VsMenu where MenuCode = '5000601'
	insert into VsMenu (MenuCode,MenuICode,MenuPCode,MenuName,MenuEnd,MenuFormName,MenuLib,MenuSysCenter,MenuVisible,MenuImgIndex)
	values('5000601','01','50006','&1.签入','1','TfrmBoundIn','100029','1','1',null)
end
else
	insert into VsMenu (MenuCode,MenuICode,MenuPCode,MenuName,MenuEnd,MenuFormName,MenuLib,MenuSysCenter,MenuVisible,MenuImgIndex)
	values('5000601','01','50006','&1.签入','1','TfrmBoundIn','100029','1','1',null)
	
if  exists (select * from VsMenu where MenuCode = '5000602')
begin
	delete from VsMenu where MenuCode = '5000602'
	insert into VsMenu (MenuCode,MenuICode,MenuPCode,MenuName,MenuEnd,MenuFormName,MenuLib,MenuSysCenter,MenuVisible,MenuImgIndex)
	values('5000602','02','50006','&2.签出','1','TfrmBoundOut','100029','1','1',null)
end
else
	insert into VsMenu (MenuCode,MenuICode,MenuPCode,MenuName,MenuEnd,MenuFormName,MenuLib,MenuSysCenter,MenuVisible,MenuImgIndex)
	values('5000602','02','50006','&2.签出','1','TfrmBoundOut','100029','1','1',null)	
	
	
	
if  exists (select * from VsMenu where MenuCode = '5000603')
begin
	delete from VsMenu where MenuCode = '5000603'
	insert into VsMenu (MenuCode,MenuICode,MenuPCode,MenuName,MenuEnd,MenuFormName,MenuLib,MenuSysCenter,MenuVisible,MenuImgIndex)
	values('5000603','03','50006','&3.撤销','1','TfrmBoundRevoke','100029','1','1',null)
end
else
	insert into VsMenu (MenuCode,MenuICode,MenuPCode,MenuName,MenuEnd,MenuFormName,MenuLib,MenuSysCenter,MenuVisible,MenuImgIndex)
	values('5000603','03','50006','&3.撤销','1','TfrmBoundRevoke','100029','1','1',null)
	
	
	if  exists (select * from VsMenu where MenuCode = '50007')
begin
	delete from VsMenu where MenuCode = '50007'
	insert into VsMenu (MenuCode,MenuICode,MenuPCode,MenuName,MenuEnd,MenuFormName,MenuLib,MenuSysCenter,MenuVisible,MenuImgIndex)
	values('50007','07','500','&7.病案注销','1','TfrmBACancel','100029','1','1',null)
end
else
	insert into VsMenu (MenuCode,MenuICode,MenuPCode,MenuName,MenuEnd,MenuFormName,MenuLib,MenuSysCenter,MenuVisible,MenuImgIndex)
	values('50007','07','500','&7.病案注销','1','TfrmBACancel','100029','1','1',null)
	
	if  exists (select * from VsMenu where MenuCode = '50008')
begin
	delete from VsMenu where MenuCode = '50008'
	insert into VsMenu (MenuCode,MenuICode,MenuPCode,MenuName,MenuEnd,MenuFormName,MenuLib,MenuSysCenter,MenuVisible,MenuImgIndex)
	values('50008','08','500','&8.病案流转','1','TfrmActionMap','100029','1','1',null)
end
else
	insert into VsMenu (MenuCode,MenuICode,MenuPCode,MenuName,MenuEnd,MenuFormName,MenuLib,MenuSysCenter,MenuVisible,MenuImgIndex)
	values('50008','08','500','&8.病案流转','1','TfrmActionMap','100029','1','1',null)	


	if  exists (select * from VsMenu where MenuCode = '50009')
begin
	delete from VsMenu where MenuCode = '50009'
	insert into VsMenu (MenuCode,MenuICode,MenuPCode,MenuName,MenuEnd,MenuFormName,MenuLib,MenuSysCenter,MenuVisible,MenuImgIndex)
	values('50009','09','500','&9.病案示踪','1','TfrmTracer','100029','1','1',null)
end
else
	insert into VsMenu (MenuCode,MenuICode,MenuPCode,MenuName,MenuEnd,MenuFormName,MenuLib,MenuSysCenter,MenuVisible,MenuImgIndex)
	values('50009','09','500','&9.病案示踪','1','TfrmTracer','100029','1','1',null)	
	
				
			
if  exists(select * from VsMidOper where MidOperCode ='5001')
begin
	delete from VsMidOper where MidOperCode = '5001'
	insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) 
     VALUES  (5001,'TSZActionCon','200029','EuSZActionCon','示踪流转动作配置中间层')	
end
else
  insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) 
     VALUES  (5001,'TSZActionCon','200029','EuSZActionCon','示踪流转动作配置中间层')	
 	
 if  exists(select * from VsMidOper where MidOperCode ='5002')
begin
	delete from VsMidOper where MidOperCode = '5002'
	insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) 
     VALUES  (5002,'TSZRevokeReason','200029','EuSZRevokeReason','示踪流转动作撤销原因配置中间层')	
end
else
  insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) 
     VALUES  (5002,'TSZRevokeReason','200029','EuSZRevokeReason','示踪流转动作撤销原因配置中间层')	
     
     
 if  exists(select * from VsMidOper where MidOperCode ='5003')
begin
	delete from VsMidOper where MidOperCode = '5003'
	insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) 
     VALUES  (5003,'TSZReclaim','200029','EuSZReclaim','病案回收中间层')	
end
else
  insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) 
     VALUES  (5003,'TSZReclaim','200029','EuSZReclaim','病案回收中间层')	
     
         
     
     
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
  
  
 SELECT * FROM dbo.SZActionCon
 SELECT * FROM dbo.SZActionDic

 


 
 