 if not exists (select * from VsLib where LibCode ='100029')
	insert into VsLib(LibCode,LibName,LibDesc) values('100029','BASZ.dll','����ʾ��')
	
 if not exists (select * from VsLib where LibCode ='200029')
	insert into VsLib(LibCode,LibName,LibDesc) values('200029','M_BASZ.dll','����ʾ���м��')	
	
if  exists (select * from VsMenu where MenuCode = '500')
begin
	delete from VsMenu where MenuCode = '500'
	insert into VsMenu (MenuCode,MenuICode,MenuPCode,MenuName,MenuEnd,MenuFormName,MenuLib,MenuSysCenter,MenuVisible,MenuImgIndex)
	values('500','01','','����ʾ��','0','','100029','1','1',null)
end
else
	insert into VsMenu (MenuCode,MenuICode,MenuPCode,MenuName,MenuEnd,MenuFormName,MenuLib,MenuSysCenter,MenuVisible,MenuImgIndex)
	values('500','01','','����ʾ��','0','','100029','1','1',null)
	
if  exists (select * from VsMenu where MenuCode = '50001')
begin
	delete from VsMenu where MenuCode = '50001'
	insert into VsMenu (MenuCode,MenuICode,MenuPCode,MenuName,MenuEnd,MenuFormName,MenuLib,MenuSysCenter,MenuVisible,MenuImgIndex)
	values('50001','01','500','&1.��ת��������','1','TfrmActionCon','100029','1','1',null)
end
else
	insert into VsMenu (MenuCode,MenuICode,MenuPCode,MenuName,MenuEnd,MenuFormName,MenuLib,MenuSysCenter,MenuVisible,MenuImgIndex)
	values('50001','01','500','&1.��ת��������','1','TfrmActionCon','100029','1','1',null)	
	
	
if  exists(select * from VsMidOper where MidOperCode ='501')
begin
	delete from VsMidOper where MidOperCode = '501'
	insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) 
     VALUES  (501,'TSZActionCon','200029','EuSZActionCon','ʾ����ת���������м��')	
end
else
  insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) 
     VALUES  (501,'TSZActionCon','200029','EuSZActionCon','ʾ����ת���������м��')	
 	
SELECT * from vsmenu WHERE LEFT(menucode,3)	=500