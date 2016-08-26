/// <summary>
/// 中间层业务类枚举列表
/// </summary>
/// <author> 杜磊_DL </author>
/// <date> 2005-02-03 </date>
unit UVsMidClassList;

interface

Type
  EuMidClassName=(
    EuVsKssz=1,             //科室代码维护
    EuVsEtPW=2,             //用户密码设置
    EuVsSysSet=3,           //系统参数设置
    EuVsBaSet=4,            //病案模块设置
    EuVsUserLog=5,          //浏览工作日志
    EuVsRight=6,            //用户权限设置
    EuVsUser=7,             //用户管理
    EuVsBQ=8,               //病区设置
    EuVsDoctor=9,           //人员设置
    EuVsAddress=10,         //单位地址维护
    EuVsXZQH=11,            //行政区划维护
    EuVsKm=12,              //诊疗科目维护
    EuVsSensitivity=13,     //过敏药物维护
    EuVsNarcosis=14,        //麻醉方式维护
    EuVsFetus=15,           //胎儿方位代码维护
    EuVsPathology=16,       //重点医技检查方法维护
    EuVsTjmz=17,           //门诊工作日志编辑
    EuVsTjGcs=18,          //观察室工作日志编辑
    EuVsCheckIn=19,        //病案借阅登记
    EuVsMedical=20,        //医技项目维护
    EuVsTjyj=21,           //医技工作日志登记
    EuVsUseICD=22,         //西医诊断码维护
    EuVsUseICCM=23,        //手术编码维护
    EuVsTjzy=24,           //住院病区工作日志编辑(按日期)
    EuVsTjSet=25,          //统计模块设置
    EuVsCh0A=26,        //病案录入基本信息[西医]
    EuVsCh0B=28,        //病案录入费用信息[西医]
    EuVsCalendar=29,       //统计工作期间工作日
    EuVsWt1=30,            //卫生机构基本情况调查表
    EuVsWt2=31,            //卫生机构人力资源情况调查表
    EuVsWt3=32,            //部份卫生机构设备情况调查表
    EuVsJtbc=33,           //家庭病床工作日志登记
    EuVsWt4=34,            //医疗机构运营情况调查表
    EuVsCheckIn_D=35,      //借阅从表
    EuVsCh0E=36,           //手术情况
    EuVsCh0H=37,           //输血输液情况
    EuVsCh0D=38,           //医技病理诊断
    EuVsCh0G=39,           //过敏药物
    EuVsCh0C=40,           //次诊断信息
    EuVsCh0F=41,           //死因信息
    EuVsCh0I=42,           //新生儿信息
    EuVsCh0K=43,           //中医诊断信息
    EuVsUseZybz=44,        //中医病症维护
    EuVsSingleICD=45,      //单病种设置
    EuVsTjzyBrief=46,      //出院病人简况编辑 
    EuVsWT9=47,            //卫统九表
    EuVsYlfw=48,           //医疗服务信息报表[安徽]
    EuVsChQWhere=49,       //病案首页高级查询[条件设置]
    EuVsChQPrint=50,       //病案首页高级查询[输出设置]
    EuVsTjGroup=51,        //科室归口设置
    EuVsCh_PatientInfo=52, //入院基本信息
    EuVsFollowHistory=53,  //随诊记录
    EuVsFollowHistoryDict=54,//随诊结果
    EuVsCard_Enrol=55,     //卡片登记
    EuVsCard_LogOut=56,    //病案销号登记
    EuVsHis_Tj_ItemTally=57,//HIS项目对照设置
    EuVsWt4_Nt=58,          //南通市医疗机构运营情况统计表
    EuVsCh0L=59,            //特殊检查、治疗项目信息编辑
    EuVsTjJktj=60,          //健康检查工作日志编辑
    EuVsBaHset=61,          //病案号生成
    EuVsCatalogSet=62,      //病历目录设置
    EuVsICDSortKind=63,     //病种分类代码表
    EuVsICDSet=64,          //病种设置
    EuVsSortKind=65,        //分型类别设置
    EuVsCaseSort=66,        //病例分型
    EuVsWt2_08=67,          //卫生机构人力资源情况调查表_08
    EuVsWt3_08=68,          //部份卫生机构设备情况调查表_08
    EuVsCOpy=69,            //病案复印管理
    EuVsCOpy_D=70,          //病案复印管理从表
    EuVsLost=71,            //病案挂失登记
    EuVsUnLost=72,          //病案寻回登记
    EuVsCaseScan=73,        //病历扫描
    EuVsUserToolsBar=74,    //用户快捷工具栏  
    EuVsTjzy3=75,           //住院病区工作日志编辑(按科室)
    EuVsDqbasj=76,          //读取病案数据
    EuVsSCFSNR=77,          //首次访视内容(随诊随访)
    EuVsEXZLBLSFK=78,       //恶性肿瘤病例随访卡         
    EuVsTLBHZSFB=79,        //糖尿病患者随访表           
    EuVsGXYHZSFB=80,        //高血压患者随访表            
    EuVsJSFLZHZSFB=81,      //精神分裂症患者随访表
    EuVsQTLBSFB=82,         //其他类别随访表
    EuVsBRSZZT=83,          //病人随诊状态     
    EuVsMzghrctj_Sxtg_Edt=84,  //门诊挂号人次统计_录入
    EuVsYlywsryzc=85,          //医疗业务收入与支出_录入
    EuVsTjZk=86,            //住院日志中的转科病人详细信息
    EuVsTjMz_ZLZ=87,            // 诊疗组门诊工作日志
    EuVsTjZy_BQ=88,            // 病区住院工作日志
    EuVsTjZy_ZLZ=89,            // 诊疗组住院工作日志
    EuVsZLGroup=90,            // 诊疗组设置
    EuVszlglsy=91,            // 肿瘤随访管理
    EuVsSFJL=92,             // 随访记录
    EuVsXXZLXX=93,            // 肿瘤详细信息
    EuVsZyzlfswf=94,       //中医治疗方式
    EuVsSszlfswf=95,       //手术治疗方式
    EuVsDffywf=96,        //毒副反应维护
    EuVsRobsonfqwf=97,      //RobSon分期维护
    EuVsHxzlfawf=98,         //化学治疗方案
    EuVsHxzlywwf=99,         //化学治疗药物
    EuVsBwdmwf=100,        //肿瘤部位码维护
    EuVsXgbswf=101,            //相关病史
    EuVsSzyywf=102,          //首诊医院维护
    EuVsSzyxwf=103,         //首诊印象维护
    EuVsBlzdmwf=104,           //病理诊断码维护
    EuVsTNMfqwf=105,           //TNM分期维护
    EuVsQzyjwf=106,             //确诊依据
    EuVsFszlffwf=107,         //放射治疗方法
    EuVsHxzlfswf=108,         //化学治疗方式
    EuVsFfzydmwf=109,         //复发转移
    EuVsZLBZ=110,         //  肿瘤病种
    EuVsZLZKQK=111,         //肿瘤专科情况
    EuVsZLZKQKXM=112,         //肿瘤专科情况项目
    EuVsSZBREdit_ZL=113,         //肿瘤随诊病人编辑    
    EuVsSZBREdit_Otr=114,         //其他随诊病人编辑

    EuVsJcA_2yljsz=116,         //A_2监测医疗服务提供及收支情况调查
    EuVsCjbzZybl=117,         //常见病种住院病历(C-3-2)
    EuVsJslypwf=118,          //激素类药品维护
    EuVsYylypwf=119,          //营养类药品维护
    EuVsYysbxmwf=120,         //医用设备检查项目名称   
    EuVssqlScgj=121,          //SQL生成工具
    EuVsCh_CH0C=122,        //次诊断信息_HIS中间库
    EuVsCh_Ch0D=123,        //医技病理诊断_HIS中间库
    EuVsCh_Ch0E=124,        //手术信息_HIS中间库
    EuVsCh_Ch0F=125,        //死因信息_HIS中间库
    EuVsCh_Ch0G=126,        //过敏药物_HIS中间库
    EuVsCh_Ch0H=127,        //输血输液情况_HIS中间库
    EuVsCh_Ch0I=128,        //新生儿信息_HIS中间库
    EuVsCh_Ch0K=129,        //中医诊断信息_HIS中间库
    EuVsCh_Ch0L=130,        //特殊检查治疗情况_HIS中间库
    EuVsBbgl_BbWz=131,     // 标本物位置管理
    EuVsBbgl_Wz=132,      // 标本物位置维护
    EuVsBbgl_Zd=133,      // 标本物相关代码维护
    EuVsBbgl_Bbzl=134,      // 标本物资料
    EuVsBbgl_img=135,      // 标本图片保存
    EuVsBbgl_CKA=136,      // 标本其它资料提交
    EuVsBbgl_CKB=137,      // 标本其它资料提交
    EuVsBbgl_CKC=138,      // 标本其它资料提交
    EuVsBbgl_WzB=139,      //标本物组名称
    EuVsWtZg_02 =140,      //卫统二表
    EuVsWtZg_03 =141,      //卫统三表
    EuVsWtZgTcq =142,      //调查期中间层
    EuVsWtZg_01 =143,      //卫统一表
    EuVsJSSJYY_GZXL=145,        //江苏省三级医院统计报表_医院工作效率及医疗质量情况  
    EuVsSZHDPeriod=146,        //随诊行风函调期间设置
    EuVsTjmz_XJ_CJ=147,         //新疆昌吉门诊医师工作量编辑   
    EuVsCharacter=148,         //角色管理                   
    EuVsCaseAudit=149,         //电子病历查询审核             
    EuVsCatalogStruc=150,         //电子病历大项维护            
    EuVsCh0N=151,             // 医疗质量安全监测指标
    EuVsJSSJYY_GZXL_Item=152,   //江苏省三级医院统计报表——报表输出项目设置
    EuVsYYJJQK_Edit_CZ=153,   //江苏省三级医院统计报表——报表输出项目设置
    EuVsUnitBranch=154,       //分支机构设置
    EuVsXzqh_12=155,            //2012版行政区划
    EuVsYLJG=156,              //拟接收医疗机构名称
    EuVsZCZYMD=157,            //再次住院目的      
    EuVsBZRanger=158,            // 病种条件设置              
    EuVsCh0P=159,              // 山西版附页         
    EuBFZK =160,                 // 病发症库
    EuDBZK =161,                 // 单病种库
    EuYunNanFy_Operation = 162,  //HQMS云南附页手术中间层
    EuYunNanFy_Symptom = 163,    //HQMS云南附页手术重症中间层
    EuVsTjmzBrief=164,         // 门诊病人明细
    EuVsTjmzcf=165,         // 门诊处方工作量日志编辑  
    EuVsTJzycf=166,         // 住院处方工作量日志编辑
    EuVsKSxxlr=167,        // 门诊病人明细录入      
    EuVsWt47=168,          // 产妇分娩信息录入中间层
    EuVsSxFY=169,          // 山西附页_大同五院
    EuVsZYZKKM=170,         //中医专科科目维护
    
    EuEB_DBLink=801, // 连接管理中间层    
    EuEB_Theme=802,  //抽取方案中间层
    EuED_Tables=803,  //抽取表列表中间层
    EuED_Fields=804,  //抽取字段列表中间层
    EuES_Tables=805,  //源数据基础表列表中间层
    EuES_Fields=806,  //源数据基础字段列表中间层
    EuES_UnionInfo=807,  //源数据基础表关联关系中间层
    EuES_Where=808,  //取数据条件设置中间层
    EuES_Map=809,  //对照表中间层
    EuES_Wash=810,  //清洗表中间层   
    EuES_FieldCalc=811,  //字段计算中间层  
    EuES_Filter=812,  //字段分组中间层
    EuEB_ETLConfig=813, // 抽取方案配置   
    EuES_InHospitalWhere=814,  // 在院病人条件 
    EuED_Fields_FY=815,  //抽取字段列表中间层_费用对照设置 
    EuED_Tables_Union=816,  //抽取表列表中间层Union子SQL

    EuYZ_YZLR=501,          //医嘱录入
    EuYZ_YZPL=500,          // 医嘱频率设置
    EuYZ_YZZD=600,          // 医嘱字典设置
    EuYZ_PCYZ=601,          // 排斥医嘱字典设置
    EuYZ_GYFS=602,          // 给药方式字典设置
    EuYZ_YZSFXM=603,          // 医嘱收费项目设置
    EuYZ_YZLXZD=604,          // 医嘱类型字典设置  
    EuYZ_GYFSFL=605,          // 给药方式分类字典设置
    EuYZ_CZYZ=606,            //成组医嘱设置

    EuHqmsFy=701,             //HQMS附页中间层
    EuHqmsFy_Ss=702,            //HQMS附页手术中间层
    EuHqmsFy_Bl=703,            //HQMS附页病理中间层
    EuHqmsFy_Zz=704,            //HQMS附页重症中间层
    EuHqmsFy_Vis =705,                 //HQMS数据可见项

    EuVsCH0Q =902,          //四川首页
    EuVsCH0R =903,
    EuVsCH0S =904,
    EuVsCH0T =905,
    EuTYVsCH0E = 908,       //天佑医院附页
    EuTYVsCH0R=909,
    EuTYVsWt47=910,



    EuVsRank=401,             //质控排名等级
    EuVsBaSy=402,            //病案首页质控
    EuVsZkDetail=403,        //病案首页质控详细记录
    EuVsBaSx=404,            //病案筛选
    EuVsSjpf = 405,          
    EuVsZmzlpf = 406,
    EuVsBaZmPj=407,          //病案终末评价
    EuVsBaLbSz=408,         //病案类别设置
    EuVsXmLx=409,           //项目类型
    EuVsDBF=410,            //DBF导出配置
    EuVsDBFRel=412,         //DBF源表设置
    EuVsDBFThem=413,         //DBF方案
    EuVsDBFMB=414,          //DBF上报规范模板
    EuVsDBFField=415,       //DBF上报字段
    EuVsWebService=411,     //平台数据交换



    EuSZActionCon=5001,    //病案示踪流转动作自定义模块
    EuSZRevokeReason=5002,  //动作撤销原因
    EuSZReclaim=5003,       //病案回收
    EuSZBACancel=5004,     //病案注销
    EuVSGenPym=999         //生成拼音码功能[此功能不发布]
    );

implementation

end.
