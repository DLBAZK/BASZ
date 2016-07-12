IF EXISTS(SELECT 1 FROM sys.objects WHERE name='VsCHDBFWhere' AND type='U')
  DROP TABLE VsCHDBFWhere
-----DBF字段表
CREATE TABLE VsCHDBFWhere(
  DBFName VARCHAR(100),     ------------DBF名称
  DBFByID INT,				------------DBF字段序号
  DBFField VARCHAR(20),		------------DBF字段名称
  DBFFieldMC VARCHAR(50),   ------------DBF字段显示名称
  DBFFieldType VARCHAR(10), ------------DBF字段类型
  DBFCField VARCHAR(20),	------------DBF自定义字段	
  DBFFJTJ VARCHAR(20),		------------DBF附加条件	
  DBFFJTJMC VARCHAR(20),		------------DBF附加条件名称	
  DBFOperate VARCHAR(10),   ------------DBF附加条件操作符
  DBFFJValue VARCHAR(10),   ------------DBF附加条件值
  DBFCSql VARCHAR(200),      ------------DBF自定义SQL
  DBFTable varchar(50),		------------DBF字段来源表
  CONSTRAINT  con1 PRIMARY KEY (DBFName,DBFByID)     
) 


if not exists(select * from VsMenu where MenuCode ='10313')
   insert into VsMenu(MenuCode,MenuICode,MenuPCode,MenuName,MenuEnd,MenuFormName,MenuLib,MenuSysCenter,MenuVisible) 
 Values('10313','13','103','&9.DBF上报设置',1,'TFrmExportDBF','100004',1,1)
 
 if not exists(select * from VsMidOper where MidOperCode ='410')
   insert into VSMIDOPER (MidOperCode, MidOperName, MidOperLib, MidOperEnu, MidOperDes) 
values(410, 'TVsCHDBF', '200004', 'EuVsDBF', 'DBF上报设置')