if Exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[VsMidOper]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
   Begin
     TRUNCATE TABLE VsMidOper
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(1,'TVsKssz','200003','EuVsKssz','科室设置中间层')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(2,'TVsEtPW','200003','EuVsEtPW','用户密码设置')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(3,'TVsSysSet','200003','EuVsSysSet','系统参数设置')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(4,'TVsBaSet','200001','EuVsBaSet','病案模块参数设置')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(5,'TVsUserLog','200003','EuVsUserLog','浏览操作日志')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(6,'TVsRight','200003','EuVsRight','权限分配')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(7,'TVsUser','200003','EuVsUser','用户管理')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(8,'TVsBQ','200003','EuVsBQ','病区设置')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(9,'TVsDoctor','200003','EuVsDoctor','人员设置')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(10,'TVsAddress','200003','EuVsAddress','单位地址维护')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(11,'TVsXZQH','200003','EuVsXZQh','行政区划维护')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(12,'TVSKM','200003','EuVsKM','诊疗科目维护')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(13,'TVsSensitivity','200003','EuVsSensitivity','过敏药物维护')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(14,'TVsNarcosis','200003','EuVsNarcosis','麻醉方式维护')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(15,'TVsFetus','200003','EuVsFetus','胎儿方位代码维护')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(16,'TVsPathology','200003','EuVsPathology','病理诊断代码维护')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(17,'TVsTjmz','200002','EuVsTjmz','门诊工作日志编辑')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(18,'TVsTjGcs','200002','EuVsTjGcs','观察室工作日志编辑')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(19,'TVsCheckIn','200005','EuVsCheckIn','病案借阅登记')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(20,'TVsMedical','200003','EuVsMedical','医技项目设置')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(21,'TVsTjyj','200002','EuVsTjyt','医技工作日志编辑')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(22,'TVsUseICD','200003','EuVsUseICD','西医诊码病名码维护')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(23,'TVsUseICCM','200003','EuVsUseICCM','手术码维护')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(24,'TVsTjzy','200002','EuVsTjzy','住院工作日志编辑')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(25,'TVsTjSet','200002','EuVsTjSet','统计模块设置')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(26,'TVsCh0A','200001','EuVsCh0A','病案录入基本信息[西医]')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(28,'TVsCh0B','200001','EuVsCh0B','病案录入费用信息[西医]')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(29,'TVsCalendar','200002','EuVsCalendar','工作日设置')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(30,'TVsWt1','200007','EuVsWt1','卫生机构基本情况调查表')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(31,'TVsWt2','200007','EuVsWt2','卫生机构人力资源情况调查表')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(32,'TVsWt3','200007','EuVsWt3','部份卫生机构设备调查表')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(33,'TVsJtbc','200002','EuVsJtbc','家庭病床工作日志登记')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(34,'TVsWt4','200007','EuVsWt4','医疗机构运营情况调查表')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(35,'TVsCheckIn_D','200005','EuVsCheckIn_D','借阅登记从表')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(36,'TVsCh0E','200001','EuVsCh0E','手术情况录入')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(37,'TVsCh0H','200001','EuVsCh0H',' 输血输液情况')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(38,'TVsCH0D','200001','EuVsCh0D','医技病理诊断')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(39,'TVsCh0G','200001','EuVsCh0G','过敏药物')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(40,'TVsCH0C','200001','EuVsCh0c','次诊断信息')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(41,'TVsCh0F','200001','EuVsCh0F','死因情况')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(42,'TVsCh0I','200001','EuVsCh0I','新生儿信息')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(43,'TVsCh0K','200001','EuVsCh0K','中医诊断信息')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(44,'TVsUseZybz','200003','EuVsUseZybz','中医病症代码维护')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(45,'TVsSingleICD','200003','EuVsSingleICD','单病种设置')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(46,'TVsTjzyBrief','200002','EuVsTjzyBrief','出院病人简况编辑')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(47,'TVsWt9','200007','EuVsWt9','卫统九表')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(48,'TVsYlfw','200007','EuVsYlfw','医疗服务信息报表[安徽]')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(49,'TVsChQWhere','200004','EuVsChQWhere','病案首页高级查询[条件设置]')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(50,'TVsChQPrint','200004','EuVsChQPrint','病案首页高级查询[输出设置]')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(51,'TVsTjGroup','200003','EuVsTjGroup','科室归口设置')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(52,'TVsCh_PatientInfo','200001','EuVsCh_PatientInfo','入院基本信息')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(53,'TVsFollowHistory','200001','EuVsFollowHistory','随诊记录')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(54,'TVsFollowHistoryDict','200003','EuVsFollowHistoryDict','随诊结果')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(55,'TVsCard_Enrol','200002','EuVsCard_Enrol','出院卡片登记')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(56,'TVsCard_LogOut','200001','EuVsCard_LogOut','病案销号登记')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(57,'TVsHis_Tj_ItemTally','200009','EuVsHis_Tj_ItemTally','出院病人简况编辑')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(58,'TVsWt4_Nt','200007','EuVsWt4_Nt','南通市医疗机构运营情况统计表')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(59,'TVsCh0L','200001','EuVsCh0L','特殊检查治疗情况')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(60,'TVsTjJktj','200002','EuVsTjJktj','健康检查工作日志编辑')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(61,'TVsBaHSet','200001','EuVsBaHSet','病案号生成设置')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(62, 'TVsCatalogSet', '200010', 'EuVsCatalogSet', '病历目录设置')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(67,'TVsWt2_08','200007','EuVsWt2_08','卫生机构人力资源情况调查表_08')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(68,'TVsWt3_08','200007','EuVsWt3_08','部份卫生机构设备情况调查表_08')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(69,'TVsCopy','200005','EuVsCopy','病案复印管理')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(70,'TVSCopy_D','200005','EuVsCopy_D','病案复印管理从表')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(71,'TVSLost','200005','EuVsLost','病案挂失登记')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(72,'TVSUnLost','200005','EuVsUnLost','病案寻回登记')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(73, 'TVsCaseScan', '200010', 'EuVsCaseScan', '病历扫描')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(74,'TVsUserToolsBar','200003','EuVsUserToolsBar','用户快捷工具栏')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(75,'TVsTjzy3','200002','EuVsTjzy3','住院病区工作日志编辑(按科室)')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(76,'TVsDqbasj','200002','EuVsDqbasj','读取病案数据(按科室)')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(77,'TVsSCFSNR','200016','EuVsSCFSNR','首次访视内容(随诊随访)')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(78,'TVsEXZLBLSFK','200016','EuVsEXZLBLSFK','恶性肿瘤病例随访卡')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(79,'TVsTLBHZSFB','200016','EuVsTLBHZSFB','糖尿病患者随访表')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(80,'TVsGXYHZSFB','200016','EuVsGXYHZSFB','高血压患者随访表')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(81,'TVsJSFLZHZSFB','200016','EuVsJSFLZHZSFB','精神分裂症患者随访表')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(82,'TVsQTLBSFB','200016','EuVsQTLBSFB','其他类别随访表')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(83,'TVsBRSZZT','200016','EuVsBRSZZT','病人随诊状态')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(84,'TVsMzghrctj_Sxtg_Edt','200002','EuVsMzghrctj_Sxtg_Edt','门诊挂号人次统计_录入')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(85,'TVsYlywsryzc','200002','EuVsYlywsryzc','医疗业务收入与支出__编辑')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(86,'TVsTjZk','200002','EuVsTjZk','住院日志中的转科病人详细信息')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(87,'TVsTjMz_ZLZ','200002','EuVsTjMz_ZLZ','诊疗组门诊工作日志')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(88,'TVsTjZy_BQ','200002','EuVsTjZy_BQ','病区住院工作日志')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(89,'TVsTjZy_ZLZ','200002','EuVsTjZy_ZLZ','诊疗组住院工作日志')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(90,'TVsZLGroup','200003','EuVsZLGroup','诊疗组设置')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(91,'TVszlglsy','200018','EuVszlglsy','肿瘤随访管理')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(92,'TVsSFJL','200018','EuVsSFJL','治疗详细记录')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(93,'TVsXXZLXX','200018','EuVsXXZLXX','随访详细记录')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(94,'TVsZyzlfswf','200018','EuVsZyzlfswf','中医治疗方式维护')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(95,'TVsSszlfswf','200018','EuVsSszlfswf','手术治疗方式维护')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(96,'TVsDffywf','200018','EuVsDffywf','毒副反应维护')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(97,'TVsRobsonfqwf','200018','EuVsRobsonfqwf','Robson分期')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(98,'TVsHxzlfawf','200018','EuVsHxzlfawf','化学治疗方案')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(99,'TVsHxzlywwf','200018','EuVsHxzlywwf','化学治疗药物')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(100,'TVsBwdmwf','200018','EuVsBwdmwf','部位代码维护')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(101,'TVsXgbswf','200018','EuVsXgbswf','相关病史维护')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(102,'TVsSzyywf','200018','EuVsSzyywf','首诊医院')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(103,'TVsSzyxwf','200018','EuVsSzyxwf','首诊印象')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(104,'TVsBlzdmwf','200018','EuVsBlzdmwf','病理诊断码维护')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(105,'TVsTNMfqwf','200018','EuVsTNMfqwf','TNM分期')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(106,'TVsQzyjwf','200018','EuVsQzyjwf','确诊依据')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(107,'TVsFszlffwf','200018','EuVsFszlffwf','放射治疗方法')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(108,'TVsHxzlfswf','200018','EuVsHxzlfswf','化学治疗方式')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(109,'TVsFfzydmwf','200018','EuVsFfzydmwf','复发转移')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(110,'TVsZLBZ','200016','EuVsZLBZ','肿瘤随访病种')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(111,'TVsZLZKQK','200016','EuVsZLZKQK','肿瘤病种专科情况')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(112,'TVsZLZKQKXM','200016','EuVsZLZKQKXM','肿瘤病种专科情况项目')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(113,'TVsSZBREdit_ZL','200016','EuVsSZBREdit_ZL','肿瘤随诊病人编辑')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(114,'TVsSZBREdit_Otr','200016','EuVsSZBREdit_Otr','其他随诊病人编辑')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(116,'TVsJcA_2yljsz','200007','EuVsJcA_2yljsz','A_2监测医疗服务提供及收支情况调查')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(117,'TVsCjbzZybl','200007','EuVsCjbzZybl','常见病种住院病历')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(118,'TVsJslypwf','200007','EuVsJslypwf','激素类药品维护')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(119,'TVsYylypwf','200007','EuVsYylypwf','营养类药品维护')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(120,'TVsYysbxmwf','200007','EuVsYysbxmwf','医用设备检查项目名称')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(122,'TVsCh_CH0C','200009','EuVsCh_CH0C','次诊断信息_HIS中间库')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(123,'TVsCh_CH0D','200009','EuVsCh_CH0D','技病理诊断_HIS中间库')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(124,'TVsCh_CH0E','200009','EuVsCh_CH0E','手术信息_HIS中间库')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(125,'TVsCh_CH0F','200009','EuVsCh_CH0F','死因信息_HIS中间库')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(126,'TVsCh_CH0G','200009','EuVsCh_CH0G','过敏药物_HIS中间库')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(127,'TVsCh_CH0H','200009','EuVsCh_CH0H','输血输液情况_HIS中间库')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(128,'TVsCh_CH0I','200009','EuVsCh_CH0I','新生儿信息_HIS中间库')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(129,'TVsCh_CH0K','200009','EuVsCh_CH0K','中医诊断信息_HIS中间库')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(130,'TVsCh_CH0L','200009','EuVsCh_CH0L','特殊检查治疗情况_HIS中间库')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(131, 'TVsBbgl_BbWz', '200019', 'EuVsBbgl_BbWz', '标本物位置管理')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(132, 'TVsBbgl_Wz', '200019', 'EuVsBbgl_Wz', '标本物位置维护')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(133, 'TVsBbgl_Zd', '200019', 'EuVsBbgl_Zd', '标本物相关代码维护')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(134, 'TVsBbgl_Bbzl', '200019', 'EuVsBbgl_Bbzl', '标本物资料')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(135, 'TVsBbgl_img', '200019', 'EuVsBbgl_img', '标本图片保存')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(136, 'TVsBbgl_CKA', '200019', 'EuVsBbgl_CKA', '标本其它资料提交')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(137, 'TVsBbgl_CKB', '200019', 'EuVsBbgl_CKB', '标本其它资料提交')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(138, 'TVsBbgl_CKC', '200019', 'EuVsBbgl_CKC', '标本其它资料提交')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(139, 'TVsBbgl_WzB', '200019', 'EuVsBbgl_WzB', '标本其它资料提交')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(140, 'TVsWtZg_02', '200020', 'EuVsWtZg_02', '卫统二表')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(141, 'TVsWtZg_03', '200020', 'EuVsWtZg_03', '卫统三表')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(142, 'TVsWtZgTcq', '200020', 'EuVsWtZgTcq', '调查期中间层')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(145, 'TVsJSSJYY_GZXL','200007','EuVsJSSJYY_GZXL','医院工作效率及医疗质量情况编辑')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(146, 'TVsSZHDPeriod','200016','EuVsSZHDPeriod','随诊行风函调期间设置')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(147, 'TVsTjmz_XJ_CJ','200002','EuVsTjmz_XJ_CJ','门诊医师工作量编辑——新疆昌吉')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(148, 'TVsCharacter','200003','EuVsCharacter','角色管理')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(149, 'TVsCaseAudit','200010','EuVsCaseAudit','电子病历查询审核')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(150, 'TVsCatalogStruc','200010','EuVsCatalogStruc','电子病历大项维护')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(151, 'TVsCH0N','200001','EuVsCH0N','医疗质量安全监测指标')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(152, 'TVsJSSJYY_GZXL_Item','200007','EuVsJSSJYY_GZXL_Item','江苏省三级医院统计报表——报表输出项目设置')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(153, 'TVsYYJJQK_Edit_CZ','200007','EuVsYYJJQK_Edit_CZ','常州市医院经济情况编辑')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(154, 'TVsUnitBranch','200003','EuVsUnitBranch','分支机构设置')
     insert into VSMIDOPER (MidOperCode, MidOperName, MidOperLib, MidOperEnu, MidOperDes) values(155, 'TVsXzqh_12', '200003', 'EuVsXzqh_12', '2012版行政区划')
     insert into VSMIDOPER (MidOperCode, MidOperName, MidOperLib, MidOperEnu, MidOperDes) values(156, 'TVsYLJG', '200003', 'EuVsYLJG', '拟接收医疗机构名称')
     insert into VSMIDOPER (MidOperCode, MidOperName, MidOperLib, MidOperEnu, MidOperDes) values(157, 'TVsZCZYMD', '200003', 'EuVsZCZYMD', '再次住院目的')
     insert into VSMIDOPER (MidOperCode, MidOperName, MidOperLib, MidOperEnu, MidOperDes) values(158, 'TVsBZRanger', '200004', 'EuVsBZRanger', '自定义病种条件设置')
     insert into VSMIDOPER (MidOperCode, MidOperName, MidOperLib, MidOperEnu, MidOperDes) values(159, 'TVsCH0P', '200001','EuVsCh0P','山西首页附加项')
     insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) values(160,'TVsBFZK','200003','EuBFZK','病发症库')
     insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) values(161,'TVsDBZK','200003','EuDBZK','单病种库')
     insert into VsMidOper (MidOperCode ,MidOperName ,MidoperLib,MidOperEnu,MidOperDes)values (164,'TVsTjmzBrief','200002','EuVsTjmzBrief','门诊病人明细')
     insert into VsMidOper (MidOperCode ,MidOperName ,MidoperLib,MidOperEnu,MidOperDes)values (165,'TVsTjmzcf','200002','EuVsTjmzcf','门诊处方工作量日志编辑')
     insert into VsMidOper (MidOperCode ,MidOperName ,MidoperLib,MidOperEnu,MidOperDes)values (166,'TVsTjzycf','200002','EuVsTJzycf','住院处方工作量日志编辑')


--  医嘱 begin
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(500,'TVsYZPL','200021','EuYZ_YZPL','医嘱频率')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(600,'TVsYZZD','200021','EuYZ_YZZD','医嘱字典')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(601,'TVsPCYZ','200021','EuYZ_PCYZ','排斥医嘱字典')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(602,'TVsGYFS','200021','EuYZ_GYFS','给药方式字典')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(603,'TVsYZSFXM','200021','EuYZ_YZSFXM','医嘱收费项目')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(604,'TVsYZLXZD','200021','EuYZ_YZLXZD','医嘱类型字典')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(605,'TVsGYFSFL','200021','EuYZ_GYFSFL','给药方式分类字典')
--  end 医嘱

     INSERT INTO VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) VALUES(700,'TVsSxsy','200001','EuVsSXSYFY','山西首页附加项')
     insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) values(701,'TVsHqmsFy','200022','EuHqmsFy','HQMS附页中间层')
     insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) values(702,'TVsHqmsFy_Ss','200022','EuHqmsFy_Ss','HQMS附页手术中间层')
     insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) values(703,'TVsHqmsFy_Bl','200022','EuHqmsFy_Bl','HQMS附页病理中间层')
     insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) values(704,'TVsHqmsFy_Zz','200022','EuHqmsFy_Zz','HQMS附页重症中间层')
     insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) values(705,'TVsHqmsFyPnlVis','200022','EuHqmsVis','HQMS附页数据可见项')

-- 病案ETL Begin
     INSERT INTO VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) VALUES(801,'TVsEB_DBLink','200023','EuEB_DBLink','ETL连接管理中间层')
     INSERT INTO VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) VALUES(802,'TVsEB_Theme','200023','EuEB_Theme','ETL抽取方案中间层')
     INSERT INTO VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) VALUES(803,'TVsED_Tables','200023','EuED_Tables','抽取表列表中间层')
     INSERT INTO VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) VALUES(804,'TVsED_Fields','200023','EuED_Fields','抽取字段列表中间层')
     INSERT INTO VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) VALUES(805,'TVsES_Tables','200023','EuES_Tables','抽取表列表中间层')
     INSERT INTO VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) VALUES(806,'TVsES_Fields','200023','EuES_Fields','抽取字段列表中间层')
     INSERT INTO VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) VALUES(807,'TVsES_UnionInfo','200023','EuES_UnionInfo','源数据表关联关系中间层')
     INSERT INTO VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) VALUES(808,'TVsES_Where','200023','EuES_Where','取数据条件设置中间层')
     INSERT INTO VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) VALUES(809,'TVsES_Map','200023','EuES_Map','对照表中间层')
     INSERT INTO VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) VALUES(810,'TVsES_Wash','200023','EuES_Wash','数据清洗中间层')
     INSERT INTO VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) VALUES(811,'TVsES_FieldCalc','200023','EuES_FieldCalc','字段计算中间层')
     INSERT INTO VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) VALUES(812,'TVsES_Filter','200023','EuES_Filter','字段分组中间层')
     INSERT INTO VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) VALUES(813,'TVsEB_ETLConfig','200023','EuEB_ETLConfig','抽取方案配置')
     INSERT INTO VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) VALUES(814,'TVsES_InHospitalWhere','200023','EuES_InHospitalWhere','在院病人条件')
     INSERT INTO VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) VALUES(815,'TVsED_Fields_FY','200023','EuED_Fields_FY','费用对照设置中间层')
     INSERT INTO VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) VALUES(816,'TVsES_Tables_Union','200023','EuES_Tables_Union','抽取表列表中间层Union子SQL')
-- 病案ETL End
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(902,'TVsCH0Q','200001','EuTVsCH0Q','四川首页中间层')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(903,'TVsCH0R','200001','EuTVsCH0R','四川ICU器械中间层')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(904,'TVsCH0S','200001','EuTVsCH0S','四川ICU中间层')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(905,'TVsCH0T','200001','EuTVsCH0T','四川感染中间层')
     insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) VALUES(906,'TVsWt47','200001','EuVsWt47','产妇分娩信息录入中间层')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(907,'TVsSxFY','200001','EuVsSxFY','山西附页_大同五院')
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(908,'TVsTYCH0E','200001','EuTYVsCH0E','天佑首页附页手术')
	 Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(909,'TVsTYCH0R','200001','EuTYVsCH0R','天佑首页附页ICU重症')
	 Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(910,'TVsCHTYWt47','200001','EuTYVsWt47','天佑首页附页新生儿')
	 
     Insert into VsMidOper(MidOperCode,MidOperName,MidOperLib,MidOperEnu,MidOperDes) Values(999,'TvsGenPym','200003','EuVsGenPym','生成拼音码的工具')
   End

Select * From VsMidOper 

