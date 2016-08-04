----------------------------------武汉科技大学附属天佑医院病案附页--------------------------------------------------------------------
-----------A表
IF Col_Length('VsCH0A','CH0ATY01') Is Null Alter Table VsCH0A Add [CH0ATY01] [int] NULL  --抗菌药物患者病原学检查送检
IF Col_Length('VsCH0A','CH0ATY02') Is Null Alter Table VsCH0A Add [CH0ATY02] [int] NULL  --清洁手术前0.5-2小时内给药
IF Col_Length('VsCH0A','CH0ATY03') Is Null Alter Table VsCH0A Add [CH0ATY03] [int] NULL  --联合用药
IF Col_Length('VsCH0A','CH0ATY04') Is Null Alter Table VsCH0A Add [CH0ATY04] [int] NULL  --髋关节置换术前0.5-2小时内给药
IF Col_Length('VsCH0A','CH0ATY05') Is Null Alter Table VsCH0A Add [CH0ATY05] [int] NULL  --膝关节置换术前0.5-2小时内给药
IF Col_Length('VsCH0A','CH0ATY06') Is Null Alter Table VsCH0A Add [CH0ATY06] [int] NULL  --子宫肌瘤切除术前0.5-2小时内给药
IF col_length('VsCH0A','CH0ATY07') Is NULL ALTER TABLE VsCH0A ADD[CH0ATY07]  [Int] NULL  --手术相关医院感染
IF col_length('VsCH0A','CH0ATY08') Is NULL ALTER TABLE VsCH0A ADD[CH0ATY08]  [Int] NULL  --血液透析
IF col_length('VsCH0A','CH0ATY09') Is NULL ALTER TABLE VsCH0A ADD[CH0ATY09]  [Int] NULL  --与血液透析相关感染
IF col_length('VsCH0A','CH0ATY10') Is NULL ALTER TABLE VsCH0A ADD[CH0ATY10]  [Int] NULL  --单病种质量管理与费用控制病种
IF col_length('VsCH0A','CH0ATY11') Is NULL ALTER TABLE VsCH0A ADD[CH0ATY11]  [Int] NULL  --纳入质控
IF col_length('VsCH0A','CH0ATY12') Is NULL ALTER TABLE VsCH0A ADD[CH0ATY12]  [varchar](50) NULL              --未纳入原因
IF col_length('VsCH0A','CH0ATY13') Is NULL ALTER TABLE VsCH0A ADD[CH0ATY13]  [Int] NULL    --是否发生围术期死亡
IF col_length('VsCH0A','CH0ATY14') Is NULL ALTER TABLE VsCH0A ADD[CH0ATY14]  [Int] NULL    --是否发生术后猝死
IF col_length('VsCH0A','CH0ATY15') Is NULL ALTER TABLE VsCH0A ADD[CH0ATY15]  [Int] NULL    --输血反应
IF col_length('VsCH0A','CH0ATY16') Is NULL ALTER TABLE VsCH0A ADD[CH0ATY16]  [Int] NULL    --输液反应 
IF col_length('VsCH0A','CH0ATY17') Is NULL ALTER TABLE VsCH0A ADD[CH0ATY17]  [Int] NULL    --肺部感染 
IF col_length('VsCH0A','CH0ATY18') Is NULL ALTER TABLE VsCH0A ADD[CH0ATY18]  [Int] NULL    --距上一次住本院时间 
IF col_length('VsCH0A','CH0ATY19') Is NULL ALTER TABLE VsCH0A ADD[CH0ATY19]  [Int] NULL    --上一次住本院与本次住院是否因同一疾病(主要诊断) 
IF col_length('VsCH0A','CH0ATY20') Is NULL ALTER TABLE VsCH0A ADD[CH0ATY20]  [Int] NULL    ---发生医源性气胸
IF col_length('VsCH0A','CH0ATY21') Is NULL ALTER TABLE VsCH0A ADD[CH0ATY21]  [Int] NULL    ---发生医源性意外穿刺伤或撕裂伤
IF col_length('VsCH0A','CH0ATY22') Is NULL ALTER TABLE VsCH0A ADD[CH0ATY22]  [Int] NULL    ---手术部位感染
IF col_length('VsCH0A','CH0ATY23') Is NULL ALTER TABLE VsCH0A ADD[CH0ATY23]  [Int] NULL    ---重返手术室再手术
IF col_length('VsCH0A','CH0ATY24') Is NULL ALTER TABLE VsCH0A ADD[CH0ATY24]  [Int] NULL    ---再手术死亡
IF col_length('VsCH0A','CH0ATY25') Is NULL ALTER TABLE VsCH0A ADD[CH0ATY25]  [Int] NULL    ---是否择期手术
IF col_length('VsCH0A','CH0ATY26') Is NULL ALTER TABLE VsCH0A ADD[CH0ATY26]  [Int] NULL    ---进行PCI
IF col_length('VsCH0A','CH0ATY27') Is NULL ALTER TABLE VsCH0A ADD[CH0ATY27]  [Int] NULL    ---进行PCI后同一天进行CABG手术
IF col_length('VsCH0A','CH0ATY28') Is NULL ALTER TABLE VsCH0A ADD[CH0ATY28]  [Int] NULL    ---手术过程遗留物
IF Col_Length('VsCH0A','CH0AYNB2') Is NOT Null Alter Table VsCH0A ALTER COLUMN [CH0AYNB2] [VARCHAR](100) NULL              --跌倒或坠床的原因
----------中间表
IF Col_Length('VsCH_PatientInfo','CH0MTY01') Is Null  Alter Table VsCH_PatientInfo Add [CH0MTY01] [int] NULL --抗菌药物患者病原学检查送检
IF Col_Length('VsCH_PatientInfo','CH0MTY02') Is Null  Alter Table VsCH_PatientInfo Add [CH0MTY02] [int] NULL --清洁手术前0.5-2小时内给药
IF Col_Length('VsCH_PatientInfo','CH0MTY03') Is Null  Alter Table VsCH_PatientInfo Add [CH0MTY03] [int] NULL --联合用药
IF Col_Length('VsCH_PatientInfo','CH0MTY04') Is Null  Alter Table VsCH_PatientInfo Add [CH0MTY04] [int] NULL --髋关节置换术前0.5-2小时内给药
IF Col_Length('VsCH_PatientInfo','CH0MTY05') Is Null  Alter Table VsCH_PatientInfo Add [CH0MTY05] [int] NULL --膝关节置换术前0.5-2小时内给药
IF Col_Length('VsCH_PatientInfo','CH0MTY06') Is Null  Alter Table VsCH_PatientInfo Add [CH0MTY06] [int] NULL --子宫肌瘤切除术前0.5-2小时内给药
IF Col_Length('VsCH_PatientInfo','CH0MTY07') Is Null  Alter Table VsCH_PatientInfo Add [CH0MTY07] [int] NULL --手术相关医院感染
IF Col_Length('VsCH_PatientInfo','CH0MTY08') Is Null  Alter Table VsCH_PatientInfo Add [CH0MTY08] [int] NULL --血液透析
IF Col_Length('VsCH_PatientInfo','CH0MTY09') Is Null  Alter Table VsCH_PatientInfo Add [CH0MTY09] [int] NULL --与血液透析相关感染
IF Col_Length('VsCH_PatientInfo','CH0MTY10') Is Null  Alter Table VsCH_PatientInfo Add [CH0MTY10] [int] NULL --单病种质量管理与费用控制病种
IF Col_Length('VsCH_PatientInfo','CH0MTY11') Is Null  Alter Table VsCH_PatientInfo Add [CH0MTY11] [int] NULL --纳入质控
IF Col_Length('VsCH_PatientInfo','CH0MTY12') Is Null  Alter Table VsCH_PatientInfo Add [CH0MTY12] [varchar](50) NULL --未纳入原因
IF Col_Length('VsCH_PatientInfo','CH0MTY13') Is Null  Alter Table VsCH_PatientInfo Add [CH0MTY13] [int] NULL --是否发生围术期死亡
IF Col_Length('VsCH_PatientInfo','CH0MTY14') Is Null  Alter Table VsCH_PatientInfo Add [CH0MTY14] [int] NULL --是否发生术后猝死
IF Col_Length('VsCH_PatientInfo','CH0MTY15') Is Null  Alter Table VsCH_PatientInfo Add [CH0MTY15] [int] NULL --输血反应
IF Col_Length('VsCH_PatientInfo','CH0MTY16') Is Null  Alter Table VsCH_PatientInfo Add [CH0MTY16] [int] NULL --输液反应 
IF Col_Length('VsCH_PatientInfo','CH0MTY17') Is Null  Alter Table VsCH_PatientInfo Add [CH0MTY17] [int] NULL --肺部感染
IF Col_Length('VsCH_PatientInfo','CH0MTY18') Is Null  Alter Table VsCH_PatientInfo Add [CH0MTY18] [int] NULL --距上一次住本院时间 
IF Col_Length('VsCH_PatientInfo','CH0MTY19') Is Null  Alter Table VsCH_PatientInfo Add [CH0MTY19] [int] NULL --上一次住本院与本次住院是否因同一疾病(主要诊断) 
IF Col_Length('VsCH_PatientInfo','CH0MTY20') Is Null  Alter Table VsCH_PatientInfo Add [CH0MTY20] [int] NULL --发生医源性气胸  
IF Col_Length('VsCH_PatientInfo','CH0MTY21') Is Null  Alter Table VsCH_PatientInfo Add [CH0MTY21] [int] NULL --发生医源性意外穿刺伤或撕裂伤  
IF Col_Length('VsCH_PatientInfo','CH0MTY22') Is Null  Alter Table VsCH_PatientInfo Add [CH0MTY22] [int] NULL --手术部位感染 
IF col_length('VsCH_PatientInfo','CH0MTY23') Is NULL ALTER TABLE  VsCH_PatientInfo ADD [CH0MTY23]  [Int] NULL    ---重返手术室再手术
IF col_length('VsCH_PatientInfo','CH0MTY24') Is NULL ALTER TABLE  VsCH_PatientInfo ADD [CH0MTY24]  [Int] NULL    ---再手术死亡
IF col_length('VsCH_PatientInfo','CH0MTY25') Is NULL ALTER TABLE  VsCH_PatientInfo ADD [CH0MTY25]  [Int] NULL    ---是否择期手术
IF col_length('VsCH_PatientInfo','CH0MTY26') Is NULL ALTER TABLE  VsCH_PatientInfo ADD [CH0MTY26]  [Int] NULL    ---进行PCI
IF col_length('VsCH_PatientInfo','CH0MTY27') Is NULL ALTER TABLE  VsCH_PatientInfo ADD [CH0MTY27]  [Int] NULL    ---进行PCI后同一天进行CABG手术
IF col_length('VsCH_PatientInfo','CH0MTY28') Is NULL ALTER TABLE  VsCH_PatientInfo ADD [CH0MTY28]  [Int] NULL    -----手术过程遗留物
-----------E表
IF Col_Length('VsCH0E','CH0EZ13') Is Null Alter Table VsCH0E Add [CH0EZ13] [int] NULL              --是否为重返手术室再手术
IF Col_Length('VsCH0E','CH0EZ14') Is Null Alter Table VsCH0E Add [CH0EZ14] [int] NULL              --再手术死亡
IF Col_Length('VsCH0E','CH0EZ15') Is Null Alter Table VsCH0E Add [CH0EZ15] [int] NULL              --进行PCI后同一天进行CABG手术
IF Col_Length('VsCH0E','CH0EZ16') Is Null Alter Table VsCH0E Add [CH0EZ16] [int] NULL              --术后骨折
IF Col_Length('VsCH0E','CH0EZ17') Is Null Alter Table VsCH0E Add [CH0EZ17] [int] NULL              --术后肺部感染
IF Col_Length('VsCH0E','CH0EZ18') Is Null Alter Table VsCH0E Add [CH0EZ18] [int] NULL              --术后人工气道脱出
IF Col_Length('VsCH0E','CH0EZ19') Is Null Alter Table VsCH0E Add [CH0EZ19] [int] NULL              --进行PCI
IF Col_Length('VsCH0E','CH0EE7') IS NOT NULL ALTER TABLE VsCH0E ALTER COLUMN [CH0EE7] [VARCHAR](50)  --清洁手术围术期预防用抗菌药天数
----中间表                                                                                       
IF Col_Length('VsCH_CH0E','CH0EZ13') Is Null Alter Table VsCH_CH0E Add CH0EZ13 int NULL			   --是否为重返手术室再手术
IF Col_Length('VsCH_CH0E','CH0EZ14') Is Null Alter Table VsCH_CH0E Add CH0EZ14 int NULL			   --再手术死亡
IF Col_Length('VsCH_CH0E','CH0EZ15') Is Null Alter Table VsCH_CH0E Add CH0EZ15 int NULL			   --进行PCI后同一天进行CABG手术
IF Col_Length('VsCH_CH0E','CH0EZ16') Is Null Alter Table VsCH_CH0E Add CH0EZ16 int NULL			   --术后骨折
IF Col_Length('VsCH_CH0E','CH0EZ17') Is Null Alter Table VsCH_CH0E Add CH0EZ17 int NULL			   --术后肺部感染
IF Col_Length('VsCH_CH0E','CH0EZ18') Is Null Alter Table VsCH_CH0E Add CH0EZ18 int NULL			   --术后人工气道脱出
IF Col_Length('VsCH_CH0E','CH0EZ19') Is Null Alter Table VsCH_CH0E Add CH0EZ19 int NULL			   --进行PCI
IF Col_Length('VsCH_CH0E','CH0EE5') Is Null Alter Table VsCH_CH0E Add [CH0EE5] [int] NULL  --手术风险（NNIS）分级
IF Col_Length('VsCH_CH0E','CH0EE6') Is Null Alter Table VsCH_CH0E Add [CH0EE6] [int] NULL  --是否术前0.5-2小时内预防用抗菌药
IF Col_Length('VsCH_CH0E','CH0EE7') Is Null Alter Table VsCH_CH0E Add [CH0EE7] [varchar](50) NULL  --清洁手术围术期预防用抗菌药天数

IF Col_Length('VsCH_CH0E','CH0EE8') Is Null Alter Table VsCH_CH0E Add [CH0EE8] [int] NULL  --手术属于4个手术的第几列

IF Col_Length('VsCH_CH0E','CH0EZ01') Is Null Alter Table VsCH_CH0E Add [CH0EZ01] [int] NULL  --手后重症01 非预期的二次手术
IF Col_Length('VsCH_CH0E','CH0EZ02') Is Null Alter Table VsCH_CH0E Add [CH0EZ02] [int] NULL  --手后重症02 麻醉并发症
IF Col_Length('VsCH_CH0E','CH0EZ03') Is Null Alter Table VsCH_CH0E Add [CH0EZ03] [int] NULL  --手后重症03 术中异物遗留
IF Col_Length('VsCH_CH0E','CH0EZ04') Is Null Alter Table VsCH_CH0E Add [CH0EZ04] [int] NULL  --手后重症04 手术并发症
IF Col_Length('VsCH_CH0E','CH0EZ05') Is Null Alter Table VsCH_CH0E Add [CH0EZ05] [int] NULL  --手后重症05   术后出血或血肿
IF Col_Length('VsCH_CH0E','CH0EZ06') Is Null Alter Table VsCH_CH0E Add [CH0EZ06] [int] NULL  --手后重症06   手术伤口裂开
IF Col_Length('VsCH_CH0E','CH0EZ07') Is Null Alter Table VsCH_CH0E Add [CH0EZ07] [int] NULL  --手后重症07   术后深静脉血栓
IF Col_Length('VsCH_CH0E','CH0EZ08') Is Null Alter Table VsCH_CH0E Add [CH0EZ08] [int] NULL  --手后重症08   术后生理/代谢紊乱
IF Col_Length('VsCH_CH0E','CH0EZ09') Is Null Alter Table VsCH_CH0E Add [CH0EZ09] [int] NULL  --手后重症09   术后呼吸衰竭
IF Col_Length('VsCH_CH0E','CH0EZ10') Is Null Alter Table VsCH_CH0E Add [CH0EZ10] [int] NULL  --手后重症10   术后肺栓塞
IF Col_Length('VsCH_CH0E','CH0EZ11') Is Null Alter Table VsCH_CH0E Add [CH0EZ11] [int] NULL  --手后重症11   术后败血症
IF Col_Length('VsCH_CH0E','CH0EZ12') Is Null Alter Table VsCH_CH0E Add [CH0EZ12] [int] NULL  --手后重症12   术后髋关节骨折

-----VsCh0R表
IF Col_Length('VsCh0R','CH0R10') Is Null Alter Table VsCh0R Add [CH0R10] [int] NULL                --是否发生人工气道脱出
IF Col_Length('VsCh0R','CH0R11') Is Null Alter Table VsCh0R Add [CH0R11] [int] NULL                --是否非预期的重返重症医学科
IF Col_Length('VsCh0R','CH0R12') Is Null Alter Table VsCh0R Add [CH0R12] [int] NULL                --重返间隔时间
IF Col_Length('VsCh0R','CH0R13') Is Null Alter Table VsCh0R Add [CH0R13] [int] NULL                --ICU死亡
IF Col_Length('VsCh0R','CH0R14') Is Null Alter Table VsCh0R Add [CH0R14] [int] NULL                --使用中静脉导管日数
IF Col_Length('VsCh0R','CH0R15') Is Null Alter Table VsCh0R Add [CH0R15] [int] NULL                --是否发生与中心静脉置管相关血液感染
IF Col_Length('VsCh0R','CH0R16') Is Null Alter Table VsCh0R Add [CH0R16] [int] NULL                --使用呼吸机日数
IF Col_Length('VsCh0R','CH0R17') Is Null Alter Table VsCh0R Add [CH0R17] [int] NULL                --是否发生与呼吸机相关肺炎感染
IF Col_Length('VsCh0R','CH0R18') Is Null Alter Table VsCh0R Add [CH0R18] [int] NULL                --使用留置导尿管日数
IF Col_Length('VsCh0R','CH0R19') Is Null Alter Table VsCh0R Add [CH0R19] [int] NULL                --是否发生与留置导尿管相关泌尿系统感染


-----中间表
IF Col_Length('VSCH_CH0R','CH0R10') Is NULL ALTER TABLE VSCH_CH0R ADD [CH0R10] [Int] NULL        --是否发生人工气道脱出
IF Col_Length('VSCH_CH0R','CH0R11') Is NULL ALTER TABLE VSCH_CH0R ADD [CH0R11] [Int] NULL        --是否非预期的重返重症医学科
IF Col_Length('VSCH_CH0R','CH0R12') Is NULL ALTER TABLE VSCH_CH0R ADD [CH0R12] [Int] NULL        --重返间隔时间
IF Col_Length('VSCH_CH0R','CH0R13') Is NULL ALTER TABLE VSCH_CH0R ADD [CH0R13] [Int] NULL        --ICU死亡
IF Col_Length('VSCH_CH0R','CH0R14') Is NULL ALTER TABLE VSCH_CH0R ADD [CH0R14] [Int] NULL        --使用中静脉导管日数
IF Col_Length('VSCH_CH0R','CH0R15') Is NULL ALTER TABLE VSCH_CH0R ADD [CH0R15] [Int] NULL        --是否发生与中心静脉置管相关血液感染
IF Col_Length('VSCH_CH0R','CH0R16') Is NULL ALTER TABLE VSCH_CH0R ADD [CH0R16] [Int] NULL        --使用呼吸机日数
IF Col_Length('VSCH_CH0R','CH0R17') Is NULL ALTER TABLE VSCH_CH0R ADD [CH0R17] [Int] NULL        --是否发生与呼吸机相关肺炎感染
IF Col_Length('VSCH_CH0R','CH0R18') Is NULL ALTER TABLE VSCH_CH0R ADD [CH0R18] [Int] NULL        --使用留置导尿管日数
IF Col_Length('VSCH_CH0R','CH0R19') Is NULL ALTER TABLE VSCH_CH0R ADD [CH0R19] [Int] NULL        --是否发生与留置导尿管相关泌尿系统感染

-------------------------------------新生儿-------------------------------
IF Col_Length('VsWt47_1','FM_SC1') Is NULL ALTER TABLE VsWt47_1 ADD [FM_SC1] [Int] NULL        --身长
IF Col_Length('VsWt47_1','FM_Weight1') Is NULL ALTER TABLE VsWt47_1 ADD [FM_Weight1] [Int] NULL        --体重
IF Col_Length('VsWt47_1','FM_JB1') Is NULL ALTER TABLE VsWt47_1 ADD [FM_JB1] [varchar](20) NULL        --疾病
IF Col_Length('VsWt47_1','FM_SWRQ1') Is NULL ALTER TABLE VsWt47_1 ADD [FM_SWRQ1] [datetime] NULL        --死亡日期
IF Col_Length('VsWt47_1','FM_SWYY1') Is NULL ALTER TABLE VsWt47_1 ADD [FM_SWYY1] [VARCHAR](50) NULL        --死亡原因
IF Col_Length('VsWt47_1','FM_YYGR1') Is NULL ALTER TABLE VsWt47_1 ADD [FM_YYGR1] [Int] NULL        --是否发生医院感染
IF Col_Length('VsWt47_1','FM_CYQK1') Is NULL ALTER TABLE VsWt47_1 ADD [FM_CYQK1] [varchar](50) NULL        --出院情况
IF Col_Length('VsWt47_1','FM_CSRQ1') Is NULL ALTER TABLE VsWt47_1 ADD [FM_CSRQ1] [DATETIME] NULL        --出生日期

IF Col_Length('VsWt47_1','FM_SC2') Is NULL ALTER TABLE VsWt47_1 ADD [FM_SC2] [Int] NULL        --身长
IF Col_Length('VsWt47_1','FM_Weight2') Is NULL ALTER TABLE VsWt47_1 ADD [FM_Weight2] [Int] NULL        --体重
IF Col_Length('VsWt47_1','FM_JB2') Is NULL ALTER TABLE VsWt47_1 ADD [FM_JB2] [varchar](20) NULL        --疾病
IF Col_Length('VsWt47_1','FM_SWRQ2') Is NULL ALTER TABLE VsWt47_1 ADD [FM_SWRQ2] [datetime] NULL        --死亡日期
IF Col_Length('VsWt47_1','FM_SWYY2') Is NULL ALTER TABLE VsWt47_1 ADD [FM_SWYY2] [VARCHAR](50) NULL        --死亡原因
IF Col_Length('VsWt47_1','FM_YYGR2') Is NULL ALTER TABLE VsWt47_1 ADD [FM_YYGR2] [Int] NULL        --是否发生医院感染
IF Col_Length('VsWt47_1','FM_CYQK2') Is NULL ALTER TABLE VsWt47_1 ADD [FM_CYQK2] [varchar](50) NULL        --出院情况
IF Col_Length('VsWt47_1','FM_CSRQ2') Is NULL ALTER TABLE VsWt47_1 ADD [FM_CSRQ2] [DATETIME] NULL        --出生日期

IF Col_Length('VsWt47_1','FM_SC3') Is NULL ALTER TABLE VsWt47_1 ADD [FM_SC3] [Int] NULL        --身长
IF Col_Length('VsWt47_1','FM_Weight3') Is NULL ALTER TABLE VsWt47_1 ADD [FM_Weight3] [Int] NULL        --体重
IF Col_Length('VsWt47_1','FM_JB3') Is NULL ALTER TABLE VsWt47_1 ADD [FM_JB3] [varchar](20) NULL        --疾病
IF Col_Length('VsWt47_1','FM_SWRQ3') Is NULL ALTER TABLE VsWt47_1 ADD [FM_SWRQ3] [datetime] NULL        --死亡日期
IF Col_Length('VsWt47_1','FM_SWYY3') Is NULL ALTER TABLE VsWt47_1 ADD [FM_SWYY3] [VARCHAR](50) NULL        --死亡原因
IF Col_Length('VsWt47_1','FM_YYGR3') Is NULL ALTER TABLE VsWt47_1 ADD [FM_YYGR3] [Int] NULL        --是否发生医院感染
IF Col_Length('VsWt47_1','FM_CYQK3') Is NULL ALTER TABLE VsWt47_1 ADD [FM_CYQK3] [varchar](50) NULL        --出院情况
IF Col_Length('VsWt47_1','FM_CSRQ3') Is NULL ALTER TABLE VsWt47_1 ADD [FM_CSRQ3] [DATETIME] NULL        --出生日期

IF Col_Length('VsWt47_1','FM_SC4') Is NULL ALTER TABLE VsWt47_1 ADD [FM_SC4] [Int] NULL        --身长
IF Col_Length('VsWt47_1','FM_Weight4') Is NULL ALTER TABLE VsWt47_1 ADD [FM_Weight4] [Int] NULL        --体重
IF Col_Length('VsWt47_1','FM_JB4') Is NULL ALTER TABLE VsWt47_1 ADD [FM_JB4] [varchar](20) NULL        --疾病
IF Col_Length('VsWt47_1','FM_SWRQ4') Is NULL ALTER TABLE VsWt47_1 ADD [FM_SWRQ4] [datetime] NULL        --死亡日期
IF Col_Length('VsWt47_1','FM_SWYY4') Is NULL ALTER TABLE VsWt47_1 ADD [FM_SWYY4] [VARCHAR](50) NULL        --死亡原因
IF Col_Length('VsWt47_1','FM_YYGR4') Is NULL ALTER TABLE VsWt47_1 ADD [FM_YYGR4] [Int] NULL        --是否发生医院感染
IF Col_Length('VsWt47_1','FM_CYQK4') Is NULL ALTER TABLE VsWt47_1 ADD [FM_CYQK4] [varchar](50) NULL        --出院情况
IF Col_Length('VsWt47_1','FM_CSRQ4') Is NULL ALTER TABLE VsWt47_1 ADD [FM_CSRQ4] [DATETIME] NULL        --出生日期

-----------中间表 
IF Col_Length('VsCH_Wt47_1','FM_SC1') Is NULL ALTER TABLE VsCH_Wt47_1 ADD [FM_SC1] [Int] NULL        --身长
IF Col_Length('VsCH_Wt47_1','FM_Weight1') Is NULL ALTER TABLE VsCH_Wt47_1 ADD [FM_Weight1] [Int] NULL        --体重
IF Col_Length('VsCH_Wt47_1','FM_JB1') Is NULL ALTER TABLE VsCH_Wt47_1 ADD [FM_JB1] [varchar](20) NULL        --疾病
IF Col_Length('VsCH_Wt47_1','FM_SWRQ1') Is NULL ALTER TABLE VsCH_Wt47_1 ADD [FM_SWRQ1] [datetime] NULL        --死亡日期
IF Col_Length('VsCH_Wt47_1','FM_SWYY1') Is NULL ALTER TABLE VsCH_Wt47_1 ADD [FM_SWYY1] [VARCHAR](50) NULL        --死亡原因
IF Col_Length('VsCH_Wt47_1','FM_YYGR1') Is NULL ALTER TABLE VsCH_Wt47_1 ADD [FM_YYGR1] [Int] NULL        --是否发生医院感染
IF Col_Length('VsCH_Wt47_1','FM_CYQK1') Is NULL ALTER TABLE VsCH_Wt47_1 ADD [FM_CYQK1] [VARCHAR](50) NULL        --出院情况
IF Col_Length('VsCH_Wt47_1','FM_CSRQ1') Is NULL ALTER TABLE VsCH_Wt47_1 ADD [FM_CSRQ1] [DATETIME] NULL        --出生日期

IF Col_Length('VsCH_Wt47_1','FM_SC2') Is NULL ALTER TABLE VsCH_Wt47_1 ADD [FM_SC2] [Int] NULL        --身长
IF Col_Length('VsCH_Wt47_1','FM_Weight2') Is NULL ALTER TABLE VsCH_Wt47_1 ADD [FM_Weight2] [Int] NULL        --体重
IF Col_Length('VsCH_Wt47_1','FM_JB2') Is NULL ALTER TABLE VsCH_Wt47_1 ADD [FM_JB2] [varchar](20) NULL        --疾病
IF Col_Length('VsCH_Wt47_1','FM_SWRQ2') Is NULL ALTER TABLE VsCH_Wt47_1 ADD [FM_SWRQ2] [datetime] NULL        --死亡日期
IF Col_Length('VsCH_Wt47_1','FM_SWYY2') Is NULL ALTER TABLE VsCH_Wt47_1 ADD [FM_SWYY2] [VARCHAR](50) NULL        --死亡原因
IF Col_Length('VsCH_Wt47_1','FM_YYGR2') Is NULL ALTER TABLE VsCH_Wt47_1 ADD [FM_YYGR2] [Int] NULL        --是否发生医院感染
IF Col_Length('VsCH_Wt47_1','FM_CYQK2') Is NULL ALTER TABLE VsCH_Wt47_1 ADD [FM_CYQK2] [VARCHAR](50) NULL        --出院情况
IF Col_Length('VsCH_Wt47_1','FM_CSRQ2') Is NULL ALTER TABLE VsCH_Wt47_1 ADD [FM_CSRQ2] [DATETIME] NULL        --出生日期

IF Col_Length('VsCH_Wt47_1','FM_SC3') Is NULL ALTER TABLE VsCH_Wt47_1 ADD [FM_SC3] [Int] NULL        --身长
IF Col_Length('VsCH_Wt47_1','FM_Weight3') Is NULL ALTER TABLE VsCH_Wt47_1 ADD [FM_Weight3] [Int] NULL        --体重
IF Col_Length('VsCH_Wt47_1','FM_JB3') Is NULL ALTER TABLE VsCH_Wt47_1 ADD [FM_JB3] [varchar](20) NULL        --疾病
IF Col_Length('VsCH_Wt47_1','FM_SWRQ3') Is NULL ALTER TABLE VsCH_Wt47_1 ADD [FM_SWRQ3] [datetime] NULL        --死亡日期
IF Col_Length('VsCH_Wt47_1','FM_SWYY3') Is NULL ALTER TABLE VsCH_Wt47_1 ADD [FM_SWYY3] [VARCHAR](50) NULL        --死亡原因
IF Col_Length('VsCH_Wt47_1','FM_YYGR3') Is NULL ALTER TABLE VsCH_Wt47_1 ADD [FM_YYGR3] [Int] NULL        --是否发生医院感染
IF Col_Length('VsCH_Wt47_1','FM_CYQK3') Is NULL ALTER TABLE VsCH_Wt47_1 ADD [FM_CYQK3] [VARCHAR](50) NULL        --出院情况
IF Col_Length('VsCH_Wt47_1','FM_CSRQ3') Is NULL ALTER TABLE VsCH_Wt47_1 ADD [FM_CSRQ3] [DATETIME] NULL        --出生日期

IF Col_Length('VsCH_Wt47_1','FM_SC4') Is NULL ALTER TABLE VsCH_Wt47_1 ADD [FM_SC4] [Int] NULL        --身长
IF Col_Length('VsCH_Wt47_1','FM_Weight4') Is NULL ALTER TABLE VsCH_Wt47_1 ADD [FM_Weight4] [Int] NULL        --体重
IF Col_Length('VsCH_Wt47_1','FM_JB4') Is NULL ALTER TABLE VsCH_Wt47_1 ADD [FM_JB4] [varchar](20) NULL        --疾病
IF Col_Length('VsCH_Wt47_1','FM_SWRQ4') Is NULL ALTER TABLE VsCH_Wt47_1 ADD [FM_SWRQ4] [datetime] NULL        --死亡日期
IF Col_Length('VsCH_Wt47_1','FM_SWYY4') Is NULL ALTER TABLE VsCH_Wt47_1 ADD [FM_SWYY4] [VARCHAR](50) NULL        --死亡原因
IF Col_Length('VsCH_Wt47_1','FM_YYGR4') Is NULL ALTER TABLE VsCH_Wt47_1 ADD [FM_YYGR4] [Int] NULL        --是否发生医院感染
IF Col_Length('VsCH_Wt47_1','FM_CYQK4') Is NULL ALTER TABLE VsCH_Wt47_1 ADD [FM_CYQK4] [VARCHAR](50) NULL        --出院情况
IF Col_Length('VsCH_Wt47_1','FM_CSRQ4') Is NULL ALTER TABLE VsCH_Wt47_1 ADD [FM_CSRQ4] [DATETIME] NULL        --出生日期



IF Col_Length('VsCH_PatientInfo','CH0MYN01') Is Null Alter Table VsCH_PatientInfo Add [CH0MYN01] [int] NULL              --I类手术切口预防性应用抗菌药物
IF Col_Length('VsCH_PatientInfo','CH0MYN02') Is Null Alter Table VsCH_PatientInfo Add [CH0MYN02] [decimal](18, 1) NULL   --I类手术抗菌药物使用持续时间(小时）
IF Col_Length('VsCH_PatientInfo','CH0MYN03') Is Null Alter Table VsCH_PatientInfo Add [CH0MYN03] [int] NULL              --联合用药
IF Col_Length('VsCH_PatientInfo','CH0MYN04') Is Null Alter Table VsCH_PatientInfo Add [CH0MYN04] [int] NULL              --住院期间是否应用抗菌药物
IF Col_Length('VsCH_PatientInfo','CH0MYN05') Is Null Alter Table VsCH_PatientInfo Add [CH0MYN05] [decimal](18, 1) NULL   --住院期间抗菌药物使用持续时间(小时）
IF Col_Length('VsCH_PatientInfo','CH0MYN06') Is Null Alter Table VsCH_PatientInfo Add [CH0MYN06] [int] NULL              --联合用药
IF Col_Length('VsCH_PatientInfo','CH0MYN07') Is Null Alter Table VsCH_PatientInfo Add [CH0MYN07] [int] NULL              --是否完成临床路径
IF Col_Length('VsCH_PatientInfo','CH0MYN08') Is Null Alter Table VsCH_PatientInfo Add [CH0MYN08] [varchar](50) NULL      --退出原因
IF Col_Length('VsCH_PatientInfo','CH0MYN09') Is Null Alter Table VsCH_PatientInfo Add [CH0MYN09] [int] NULL              --是否变异
IF Col_Length('VsCH_PatientInfo','CH0MYNAA') Is Null Alter Table VsCH_PatientInfo Add [CH0MYNAA] [varchar](50) NULL      --变异原因
IF Col_Length('VsCH_PatientInfo','CH0MYNA0') Is Null Alter Table VsCH_PatientInfo Add [CH0MYNA0] [int] NULL              --住院期间是否出现危重
IF Col_Length('VsCH_PatientInfo','CH0MYNA1') Is Null Alter Table VsCH_PatientInfo Add [CH0MYNA1] [int] NULL              --距上一次住本院的时间
IF Col_Length('VsCH_PatientInfo','CH0MYNA2') Is Null Alter Table VsCH_PatientInfo Add [CH0MYNA2] [int] NULL              --上一次住本院与本次住院是否因同一疾病(主要诊断)
IF Col_Length('VsCH_PatientInfo','CH0MYNA7') Is Null Alter Table VsCH_PatientInfo Add [CH0MYNA7] [int] NULL              --是否有压疮
IF Col_Length('VsCH_PatientInfo','CH0MYNA8') Is Null Alter Table VsCH_PatientInfo Add [CH0MYNA8] [int] NULL              --压疮发生时间
IF Col_Length('VsCH_PatientInfo','CH0MYNA9') Is Null Alter Table VsCH_PatientInfo Add [CH0MYNA9] [int] NULL              --压疮分期 
IF Col_Length('VsCH_PatientInfo','CH0MYNB0') Is Null Alter Table VsCH_PatientInfo Add [CH0MYNB0] [int] NULL              --住院期间是否发生跌倒或坠床
IF Col_Length('VsCH_PatientInfo','CH0MYNB1') Is Null Alter Table VsCH_PatientInfo Add [CH0MYNB1] [int] NULL              --住院期间跌倒或坠床的伤害程度
IF Col_Length('VsCH_PatientInfo','CH0MYNB2') Is Null Alter Table VsCH_PatientInfo Add [CH0MYNB2] [int] NULL              --跌倒或坠床的原因
IF Col_Length('VsCH_PatientInfo','CH0MYNB3') Is Null Alter Table VsCH_PatientInfo Add [CH0MYNB3] [int] NULL              --住院期间是否使用物理约束
IF Col_Length('VsCH_PatientInfo','CH0MYNB4') Is Null Alter Table VsCH_PatientInfo Add [CH0MYNB4] [decimal](18, 1) NULL   --约束总时间
IF Col_Length('VsCH_PatientInfo','CH0MYNB5') Is Null Alter Table VsCH_PatientInfo Add [CH0MYNB5] [int] NULL              --约束方式
IF Col_Length('VsCH_PatientInfo','CH0MYNB6') Is Null Alter Table VsCH_PatientInfo Add [CH0MYNB6] [int] NULL              --约束工具 
IF Col_Length('VsCH_PatientInfo','CH0MYNB7') Is Null Alter Table VsCH_PatientInfo Add [CH0MYNB7] [int] NULL              --约束原因
IF Col_Length('VsCH_PatientInfo','CH0MYNB8') Is Null Alter Table VsCH_PatientInfo Add [CH0MYNB8] [int] NULL              --产科新生儿情况：离院方式
IF Col_Length('VsCH_PatientInfo','CH0MYNB9') Is Null Alter Table VsCH_PatientInfo Add [CH0MYNB9] [varchar](50) NULL      --重症监护室名称
IF Col_Length('VsCH_PatientInfo','CH0MYNBA') Is Null Alter Table VsCH_PatientInfo Add [CH0MYNBA] [int] NULL              --是否发生人工气道脱出
IF Col_Length('VsCH_PatientInfo','CH0MYNC0') Is Null Alter Table VsCH_PatientInfo Add [CH0MYNC0] [int] NULL              --是否非预期的重返重症医学科
IF Col_Length('VsCH_PatientInfo','CH0MYNC1') Is Null Alter Table VsCH_PatientInfo Add [CH0MYNC1] [int] NULL              --重返间隔时间
IF Col_Length('VsCH_PatientInfo','CH0MYNC2') Is Null Alter Table VsCH_PatientInfo Add [CH0MYNC2] [int] NULL              --手术及操作相关情况：是否发生围术期死亡
IF Col_Length('VsCH_PatientInfo','CH0MYNC3') Is Null Alter Table VsCH_PatientInfo Add [CH0MYNC3] [int] NULL              --是否发生术后猝死



----------字典表-------------------
IF Col_Length('VsZhdm_12','CYQK') Is Null    
begin
  Alter Table VsZhdm_12 Add [CYQK] [varchar](20) NULL    ---新生儿出院情况
  --1.正常 2.有病 3.感染 4.死亡 5.转科 6.其他
 Exec('update  VsZhdm_12 set CYQK=''正常'' where  id=1')
 Exec('update  VsZhdm_12 set CYQK=''有病'' where  id=2')
 Exec('update  VsZhdm_12 set CYQK=''感染'' where  id=3')
 Exec('update  VsZhdm_12 set CYQK=''死亡'' where  id=4')
 Exec('update  VsZhdm_12 set CYQK=''转科'' where  id=5')
 Exec('update  VsZhdm_12 set CYQK=''其他'' where  id=6')
end


Exec('update  VsZhdm set ckmc=''其他'' where  dm=5')


IF Col_Length('VsZhdm_12','zysftyjb') Is Null    
begin
  Alter Table VsZhdm_12 Add [zysftyjb] [varchar](20) NULL    
  
 Exec('update  VsZhdm_12 set zysftyjb=''第一次住院'' where  id=0')
 Exec('update  VsZhdm_12 set zysftyjb=''否'' where  id=1')
 Exec('update  VsZhdm_12 set zysftyjb=''是'' where  id=2')

END

IF Col_Length('VsZhdm_12','ycfq') Is Null    
begin
  Alter Table VsZhdm_12 Add [ycfq] [varchar](20) NULL    --压疮分期
  ----Ⅰ期 2.Ⅱ期 3.Ⅲ期 4.Ⅳ期 5.不可分期的压疮
  Exec('update  VsZhdm_12 set ycfq=''Ⅰ期'' where  id=1')
  Exec('update  VsZhdm_12 set ycfq=''Ⅱ期'' where  id=2')
  Exec('update  VsZhdm_12 set ycfq=''Ⅲ期'' where  id=3')
  Exec('update  VsZhdm_12 set ycfq=''Ⅳ期'' where  id=4')
  Exec('update  VsZhdm_12 set ycfq=''不可分期的压疮'' where  id=5')

END


