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
	
	
if  exists (select * from VsMenu where MenuCode = '50002')
begin
	delete from VsMenu where MenuCode = '50002'
	insert into VsMenu (MenuCode,MenuICode,MenuPCode,MenuName,MenuEnd,MenuFormName,MenuLib,MenuSysCenter,MenuVisible,MenuImgIndex)
	values('50002','02','500','&2.����ԭ������','1','TfrmRevokeReason','100029','1','1',null)
end
else
	insert into VsMenu (MenuCode,MenuICode,MenuPCode,MenuName,MenuEnd,MenuFormName,MenuLib,MenuSysCenter,MenuVisible,MenuImgIndex)
	values('50002','02','500','&2.����ԭ������','1','TfrmRevokeReason','100029','1','1',null)
		
if  exists (select * from VsMenu where MenuCode = '50003')
begin
	delete from VsMenu where MenuCode = '50003'
	insert into VsMenu (MenuCode,MenuICode,MenuPCode,MenuName,MenuEnd,MenuFormName,MenuLib,MenuSysCenter,MenuVisible,MenuImgIndex)
	values('50003','03','500','&3.��������','1','TfrmReclaim','100029','1','1',null)
end
else
	insert into VsMenu (MenuCode,MenuICode,MenuPCode,MenuName,MenuEnd,MenuFormName,MenuLib,MenuSysCenter,MenuVisible,MenuImgIndex)
	values('50003','03','500','&3.��������','1','TfrmReclaim','100029','1','1',null)	
	
	
if  exists (select * from VsMenu where MenuCode = '50004')
begin
	delete from VsMenu where MenuCode = '50004'
	insert into VsMenu (MenuCode,MenuICode,MenuPCode,MenuName,MenuEnd,MenuFormName,MenuLib,MenuSysCenter,MenuVisible,MenuImgIndex)
	values('50004','04','500','&4.�����ʿ�','0','','100029','1','1',null)
end
else
	insert into VsMenu (MenuCode,MenuICode,MenuPCode,MenuName,MenuEnd,MenuFormName,MenuLib,MenuSysCenter,MenuVisible,MenuImgIndex)
	values('50004','04','500','&4.�����ʿ�','0','','100029','1','1',null)

if  exists (select * from VsMenu where MenuCode = '5000401')
begin
	delete from VsMenu where MenuCode = '5000401'
	insert into VsMenu (MenuCode,MenuICode,MenuPCode,MenuName,MenuEnd,MenuFormName,MenuLib,MenuSysCenter,MenuVisible,MenuImgIndex)
	values('5000401','01','50004','&1.ǩ��','1','TfrmzkCheckIn','100029','1','1',null)
end
else
	insert into VsMenu (MenuCode,MenuICode,MenuPCode,MenuName,MenuEnd,MenuFormName,MenuLib,MenuSysCenter,MenuVisible,MenuImgIndex)
	values('5000401','01','50004','&1.ǩ��','1','TfrmzkCheckIn','100029','1','1',null)
	
if  exists (select * from VsMenu where MenuCode = '5000402')
begin
	delete from VsMenu where MenuCode = '5000402'
	insert into VsMenu (MenuCode,MenuICode,MenuPCode,MenuName,MenuEnd,MenuFormName,MenuLib,MenuSysCenter,MenuVisible,MenuImgIndex)
	values('5000402','02','50004','&2.ǩ��','1','TfrmZKCheckOut','100029','1','1',null)
end
else
	insert into VsMenu (MenuCode,MenuICode,MenuPCode,MenuName,MenuEnd,MenuFormName,MenuLib,MenuSysCenter,MenuVisible,MenuImgIndex)
	values('5000402','02','50004','&2.ǩ��','1','TfrmZKCheckOut','100029','1','1',null)	

if  exists (select * from VsMenu where MenuCode = '5000403')
begin
	delete from VsMenu where MenuCode = '5000403'
	insert into VsMenu (MenuCode,MenuICode,MenuPCode,MenuName,MenuEnd,MenuFormName,MenuLib,MenuSysCenter,MenuVisible,MenuImgIndex)
	values('5000403','03','50004','&3.����','1','TfrmZKRevoke','100029','1','1',null)
end
else
	insert into VsMenu (MenuCode,MenuICode,MenuPCode,MenuName,MenuEnd,MenuFormName,MenuLib,MenuSysCenter,MenuVisible,MenuImgIndex)
	values('5000403','03','50004','&3.����','1','TfrmZKRevoke','100029','1','1',null)	




		
		
if  exists (select * from VsMenu where MenuCode = '50005')
begin
	delete from VsMenu where MenuCode = '50005'
	insert into VsMenu (MenuCode,MenuICode,MenuPCode,MenuName,MenuEnd,MenuFormName,MenuLib,MenuSysCenter,MenuVisible,MenuImgIndex)
	values('50005','05','500','&5.������Ŀ','0','','100029','1','1',null)
end
else
	insert into VsMenu (MenuCode,MenuICode,MenuPCode,MenuName,MenuEnd,MenuFormName,MenuLib,MenuSysCenter,MenuVisible,MenuImgIndex)
	values('50005','05','500','&5.������Ŀ','0','','100029','1','1',null)

if  exists (select * from VsMenu where MenuCode = '5000501')
begin
	delete from VsMenu where MenuCode = '5000501'
	insert into VsMenu (MenuCode,MenuICode,MenuPCode,MenuName,MenuEnd,MenuFormName,MenuLib,MenuSysCenter,MenuVisible,MenuImgIndex)
	values('5000501','01','50005','&1.ǩ��','1','TfrmFrmCatalogue','100029','1','1',null)
end
else
	insert into VsMenu (MenuCode,MenuICode,MenuPCode,MenuName,MenuEnd,MenuFormName,MenuLib,MenuSysCenter,MenuVisible,MenuImgIndex)
	values('5000501','01','50005','&1.ǩ��','1','TfrmFrmCatalogue','100029','1','1',null)
	
if  exists (select * from VsMenu where MenuCode = '5000502')
begin
	delete from VsMenu where MenuCode = '5000502'
	insert into VsMenu (MenuCode,MenuICode,MenuPCode,MenuName,MenuEnd,MenuFormName,MenuLib,MenuSysCenter,MenuVisible,MenuImgIndex)
	values('5000502','02','50005','&2.ǩ��','1','TfrmCatalOut','100029','1','1',null)
end
else
	insert into VsMenu (MenuCode,MenuICode,MenuPCode,MenuName,MenuEnd,MenuFormName,MenuLib,MenuSysCenter,MenuVisible,MenuImgIndex)
	values('5000502','02','50005','&2.ǩ��','1','TfrmCatalOut','100029','1','1',null)	
	
	
if  exists (select * from VsMenu where MenuCode = '5000503')
begin
	delete from VsMenu where MenuCode = '5000503'
	insert into VsMenu (MenuCode,MenuICode,MenuPCode,MenuName,MenuEnd,MenuFormName,MenuLib,MenuSysCenter,MenuVisible,MenuImgIndex)
	values('5000503','03','50005','&3.����','1','TfrmCataloRevoke','100029','1','1',null)
end
else
	insert into VsMenu (MenuCode,MenuICode,MenuPCode,MenuName,MenuEnd,MenuFormName,MenuLib,MenuSysCenter,MenuVisible,MenuImgIndex)
	values('5000503','03','50005','&3.����','1','TfrmCataloRevoke','100029','1','1',null)	
	

if  exists (select * from VsMenu where MenuCode = '50006')
begin
	delete from VsMenu where MenuCode = '50006'
	insert into VsMenu (MenuCode,MenuICode,MenuPCode,MenuName,MenuEnd,MenuFormName,MenuLib,MenuSysCenter,MenuVisible,MenuImgIndex)
	values('50006','06','500','&6.����װ��','0','','100029','1','1',null)
end
else
	insert into VsMenu (MenuCode,MenuICode,MenuPCode,MenuName,MenuEnd,MenuFormName,MenuLib,MenuSysCenter,MenuVisible,MenuImgIndex)
	values('50006','06','500','&6.����װ��','0','','100029','1','1',null)

if  exists (select * from VsMenu where MenuCode = '5000601')
begin
	delete from VsMenu where MenuCode = '5000601'
	insert into VsMenu (MenuCode,MenuICode,MenuPCode,MenuName,MenuEnd,MenuFormName,MenuLib,MenuSysCenter,MenuVisible,MenuImgIndex)
	values('5000601','01','50006','&1.ǩ��','1','TfrmBoundIn','100029','1','1',null)
end
else
	insert into VsMenu (MenuCode,MenuICode,MenuPCode,MenuName,MenuEnd,MenuFormName,MenuLib,MenuSysCenter,MenuVisible,MenuImgIndex)
	values('5000601','01','50006','&1.ǩ��','1','TfrmBoundIn','100029','1','1',null)
	
if  exists (select * from VsMenu where MenuCode = '5000602')
begin
	delete from VsMenu where MenuCode = '5000602'
	insert into VsMenu (MenuCode,MenuICode,MenuPCode,MenuName,MenuEnd,MenuFormName,MenuLib,MenuSysCenter,MenuVisible,MenuImgIndex)
	values('5000602','02','50006','&2.ǩ��','1','TfrmBoundOut','100029','1','1',null)
end
else
	insert into VsMenu (MenuCode,MenuICode,MenuPCode,MenuName,MenuEnd,MenuFormName,MenuLib,MenuSysCenter,MenuVisible,MenuImgIndex)
	values('5000602','02','50006','&2.ǩ��','1','TfrmBoundOut','100029','1','1',null)	
	
	
	
if  exists (select * from VsMenu where MenuCode = '5000603')
begin
	delete from VsMenu where MenuCode = '5000603'
	insert into VsMenu (MenuCode,MenuICode,MenuPCode,MenuName,MenuEnd,MenuFormName,MenuLib,MenuSysCenter,MenuVisible,MenuImgIndex)
	values('5000603','03','50006','&3.����','1','TfrmBoundRevoke','100029','1','1',null)
end
else
	insert into VsMenu (MenuCode,MenuICode,MenuPCode,MenuName,MenuEnd,MenuFormName,MenuLib,MenuSysCenter,MenuVisible,MenuImgIndex)
	values('5000603','03','50006','&3.����','1','TfrmBoundRevoke','100029','1','1',null)
	
	
	if  exists (select * from VsMenu where MenuCode = '50007')
begin
	delete from VsMenu where MenuCode = '50007'
	insert into VsMenu (MenuCode,MenuICode,MenuPCode,MenuName,MenuEnd,MenuFormName,MenuLib,MenuSysCenter,MenuVisible,MenuImgIndex)
	values('50007','07','500','&7.����ע��','1','TfrmBACancel','100029','1','1',null)
end
else
	insert into VsMenu (MenuCode,MenuICode,MenuPCode,MenuName,MenuEnd,MenuFormName,MenuLib,MenuSysCenter,MenuVisible,MenuImgIndex)
	values('50007','07','500','&7.����ע��','1','TfrmBACancel','100029','1','1',null)
	
	if  exists (select * from VsMenu where MenuCode = '50008')
begin
	delete from VsMenu where MenuCode = '50008'
	insert into VsMenu (MenuCode,MenuICode,MenuPCode,MenuName,MenuEnd,MenuFormName,MenuLib,MenuSysCenter,MenuVisible,MenuImgIndex)
	values('50008','08','500','&8.������ת','1','TfrmActionMap','100029','1','1',null)
end
else
	insert into VsMenu (MenuCode,MenuICode,MenuPCode,MenuName,MenuEnd,MenuFormName,MenuLib,MenuSysCenter,MenuVisible,MenuImgIndex)
	values('50008','08','500','&8.������ת','1','TfrmActionMap','100029','1','1',null)	


	if  exists (select * from VsMenu where MenuCode = '50009')
begin
	delete from VsMenu where MenuCode = '50009'
	insert into VsMenu (MenuCode,MenuICode,MenuPCode,MenuName,MenuEnd,MenuFormName,MenuLib,MenuSysCenter,MenuVisible,MenuImgIndex)
	values('50009','09','500','&9.����ʾ��','1','TfrmTracer','100029','1','1',null)
end
else
	insert into VsMenu (MenuCode,MenuICode,MenuPCode,MenuName,MenuEnd,MenuFormName,MenuLib,MenuSysCenter,MenuVisible,MenuImgIndex)
	values('50009','09','500','&9.����ʾ��','1','TfrmTracer','100029','1','1',null)	
	
				
			
if  exists(select * from VsMidOper where MidOperCode ='5001')
begin
	delete from VsMidOper where MidOperCode = '5001'
	insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) 
     VALUES  (5001,'TSZActionCon','200029','EuSZActionCon','ʾ����ת���������м��')	
end
else
  insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) 
     VALUES  (5001,'TSZActionCon','200029','EuSZActionCon','ʾ����ת���������м��')	
 	
 if  exists(select * from VsMidOper where MidOperCode ='5002')
begin
	delete from VsMidOper where MidOperCode = '5002'
	insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) 
     VALUES  (5002,'TSZRevokeReason','200029','EuSZRevokeReason','ʾ����ת��������ԭ�������м��')	
end
else
  insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) 
     VALUES  (5002,'TSZRevokeReason','200029','EuSZRevokeReason','ʾ����ת��������ԭ�������м��')	
     
     
 if  exists(select * from VsMidOper where MidOperCode ='5003')
begin
	delete from VsMidOper where MidOperCode = '5003'
	insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) 
     VALUES  (5003,'TSZReclaim','200029','EuSZReclaim','���������м��')	
end
else
  insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) 
     VALUES  (5003,'TSZReclaim','200029','EuSZReclaim','���������м��')	
     
         
     
     
 INSERT INTO SZActionState values('1','ǩ��')
 INSERT INTO SZActionState values('2','������')
 INSERT INTO SZActionState values('3','ǩ��')
 INSERT INTO SZActionState values('-1','����ǩ��')
 INSERT INTO SZActionState values('-2','����������')
 INSERT INTO SZActionState values('-3','����ǩ��')
 
  INSERT INTO dbo.SZActionDic VALUES('101','����')
  INSERT INTO dbo.SZActionDic VALUES('102','��Ŀ')
  INSERT INTO dbo.SZActionDic VALUES('103','�ʿ�')
  INSERT INTO dbo.SZActionDic VALUES('104','װ��')
  INSERT INTO dbo.SZActionDic VALUES('105','�ϼ�')
  
  
 SELECT * FROM dbo.SZActionCon
 SELECT * FROM dbo.SZActionDic

 


 
 