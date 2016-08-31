 if not exists (select * from VsLib where LibCode ='500001')
	insert into VsLib(LibCode,LibName,LibDesc) values('500001','SzBaLz.dll','����ʾ��')
	
 if not exists (select * from VsLib where LibCode ='400001')
	insert into VsLib(LibCode,LibName,LibDesc) values('400001','Sz_BaLz.dll','����ʾ���м��')	
	
if  exists (select * from VsMenu where MenuCode = '201')
begin
	delete from VsMenu where MenuCode = '201'
	insert into VsMenu (MenuCode,MenuICode,MenuPCode,MenuName,MenuEnd,MenuFormName,MenuLib,MenuSysCenter,MenuVisible,MenuImgIndex,MenuKind)
	values('201','01','','������ת','0','','500001','1','1',null,'BASZ')
end
else
	insert into VsMenu (MenuCode,MenuICode,MenuPCode,MenuName,MenuEnd,MenuFormName,MenuLib,MenuSysCenter,MenuVisible,MenuImgIndex,MenuKind)
	values('201','01','','������ת','0','','500001','1','1',null,'BASZ')
	
if  exists (select * from VsMenu where MenuCode = '20101')
begin
	delete from VsMenu where MenuCode = '20101'
	insert into VsMenu (MenuCode,MenuICode,MenuPCode,MenuName,MenuEnd,MenuFormName,MenuLib,MenuSysCenter,MenuVisible,MenuImgIndex,MenuKind)
	values('20101','01','201','&1.��ת��������','1','TfrmActionCon','500001','1','1',null,'BASZ')
end
else
	insert into VsMenu (MenuCode,MenuICode,MenuPCode,MenuName,MenuEnd,MenuFormName,MenuLib,MenuSysCenter,MenuVisible,MenuImgIndex,MenuKind)
	values('20101','01','201','&1.��ת��������','1','TfrmActionCon','500001','1','1',null,'BASZ')	

if  exists (select * from VsMenu where MenuCode = '20102')
begin
	delete from VsMenu where MenuCode = '20102'
	insert into VsMenu (MenuCode,MenuICode,MenuPCode,MenuName,MenuEnd,MenuFormName,MenuLib,MenuSysCenter,MenuVisible,MenuImgIndex,MenuKind)
	values('20102','02','201','&2.������ת','1','TfrmActionMap','500001','1','1',null,'BASZ')
end
else
	insert into VsMenu (MenuCode,MenuICode,MenuPCode,MenuName,MenuEnd,MenuFormName,MenuLib,MenuSysCenter,MenuVisible,MenuImgIndex,MenuKind)
	values('20102','02','201','&2.������ת','1','TfrmActionMap','500001','1','1',null,'BASZ')	
		
	if  exists (select * from VsMenu where MenuCode = '20103')
begin
	delete from VsMenu where MenuCode = '50007'
	insert into VsMenu (MenuCode,MenuICode,MenuPCode,MenuName,MenuEnd,MenuFormName,MenuLib,MenuSysCenter,MenuVisible,MenuImgIndex,MenuKind)
	values('20103','03','201','&3.����ע��','1','TfrmBACancel','500001','1','1',null,'BASZ')
end
else
	insert into VsMenu (MenuCode,MenuICode,MenuPCode,MenuName,MenuEnd,MenuFormName,MenuLib,MenuSysCenter,MenuVisible,MenuImgIndex,MenuKind)
	values('20103','03','201','&3.����ע��','1','TfrmBACancel','500001','1','1',null,'BASZ')	
	
	
	if  exists (select * from VsMenu where MenuCode = '20104')
begin
	delete from VsMenu where MenuCode = '20104'
	insert into VsMenu (MenuCode,MenuICode,MenuPCode,MenuName,MenuEnd,MenuFormName,MenuLib,MenuSysCenter,MenuVisible,MenuImgIndex,MenuKind)
	values('20104','04','201','&4.����ʾ��','1','TfrmTracer','500001','1','1',null,'BASZ')
end
else
	insert into VsMenu (MenuCode,MenuICode,MenuPCode,MenuName,MenuEnd,MenuFormName,MenuLib,MenuSysCenter,MenuVisible,MenuImgIndex,MenuKind)
	values('20104','04','201','&4.����ʾ��','1','TfrmTracer','500001','1','1',null,'BASZ')	
	
	
			
			
if  exists(select * from VsMidOper where MidOperCode ='5001')
begin
	delete from VsMidOper where MidOperCode = '5001'
	insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) 
     VALUES  (5001,'TSZActionCon','400001','EuSZActionCon','ʾ����ת���������м��')	
end
else
  insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) 
     VALUES  (5001,'TSZActionCon','400001','EuSZActionCon','ʾ����ת���������м��')	
 	
 if  exists(select * from VsMidOper where MidOperCode ='5002')
begin
	delete from VsMidOper where MidOperCode = '5002'
	insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) 
     VALUES  (5002,'TSZRevokeReason','400001','EuSZRevokeReason','ʾ����ת��������ԭ�������м��')	
end
else
  insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) 
     VALUES  (5002,'TSZRevokeReason','400001','EuSZRevokeReason','ʾ����ת��������ԭ�������м��')	
     
     
 if  exists(select * from VsMidOper where MidOperCode ='5003')
begin
	delete from VsMidOper where MidOperCode = '5003'
	insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) 
     VALUES  (5003,'TSZReclaim','400001','EuSZReclaim','���������м��')	
end
else
  insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) 
     VALUES  (5003,'TSZReclaim','400001','EuSZReclaim','���������м��')	
     

     
     
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
  
  INSERT INTO SZSJZD ( DM, DMkind, DMMC, TYBZ, PYM, WBM ) VALUES  ( '0', 'CXYY', '����ԭ��', 0,'', '')

 


 
 