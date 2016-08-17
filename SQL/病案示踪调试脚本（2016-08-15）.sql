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
	delete from VsMenu where MenuCode = '50001'
	insert into VsMenu (MenuCode,MenuICode,MenuPCode,MenuName,MenuEnd,MenuFormName,MenuLib,MenuSysCenter,MenuVisible,MenuImgIndex)
	values('50003','03','500','&3.病案回收','1','TfrmReclaim','100029','1','1',null)
end
else
	insert into VsMenu (MenuCode,MenuICode,MenuPCode,MenuName,MenuEnd,MenuFormName,MenuLib,MenuSysCenter,MenuVisible,MenuImgIndex)
	values('50003','03','500','&3.病案回收','1','TfrmReclaim','100029','1','1',null)		
		
if  exists(select * from VsMidOper where MidOperCode ='501')
begin
	delete from VsMidOper where MidOperCode = '501'
	insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) 
     VALUES  (501,'TSZActionCon','200029','EuSZActionCon','示踪流转动作配置中间层')	
end
else
  insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) 
     VALUES  (501,'TSZActionCon','200029','EuSZActionCon','示踪流转动作配置中间层')	
 	
 if  exists(select * from VsMidOper where MidOperCode ='502')
begin
	delete from VsMidOper where MidOperCode = '502'
	insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) 
     VALUES  (502,'TSZRevokeReason','200029','EuSZRevokeReason','示踪流转动作撤销原因配置中间层')	
end
else
  insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) 
     VALUES  (502,'TSZRevokeReason','200029','EuSZRevokeReason','示踪流转动作撤销原因配置中间层')	
     
     
 if  exists(select * from VsMidOper where MidOperCode ='503')
begin
	delete from VsMidOper where MidOperCode = '503'
	insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) 
     VALUES  (503,'TSZReclaim','200029','EuSZReclaim','病案回收中间层')	
end
else
  insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) 
     VALUES  (503,'TSZReclaim','200029','EuSZReclaim','病案回收中间层')	