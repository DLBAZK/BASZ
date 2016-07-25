unit UPVar;

interface

uses
  Windows;

const
//  sSendMsg='<?xml version="1.0" encoding=\"UTF-8\"?>'+
//           '<soap:Envelope xmlns:soap=\"http:schemas.xmlsoap.orgsoapenvelope\"'+
//           '  soap:encodingStyle=\"http:schemas.xmlsoap.orgsoapencoding\">'+
//           '<soap:Header>'+
//           '<in:system xmlns:in=\"http:www.tyswjw.gov.cn\">'+
//           '<para user=\"ty4yy\" />' + 'para pswd=\"ty4yy2014\" />'+
//           '<para serviceid=\"admMedPhMainYLFWService\" />'+
//           '<para mehtodname=\"insertMedPh\" />' + '</in:system>'+
//           '</soap:Header>' + '<soap:Body>'+
//           '<in:business  xmlns:in=\"http:www.tyswjw.gov.cn\">'+
//           '<para no_id=\"100000233826\"/>'+
//           '<para org_code=\"1401061350932\"/>'+
//           '</in:business>' + '</soap:Body>' + '</soap:Envelope>';

  sSendMsg='<?xml version="1.0" encoding="UTF-8"?>'+
           '<soap:Envelope xmlns:soap="http:schemas.xmlsoap.orgsoapenvelope"'+
           '    soap:encodingStyle="http:schemas.xmlsoap.orgsoapencoding">'+
           '    <soap:Header>'+
           '        <in:system xmlns:in="http:www.tyswjw.gov.cn">'+
           '            <para user="%s" />'+
           '            <para pswd="%s" />'+
           '            <para serviceid="admMedPhMainYLFWService" />'+
           '            <para mehtodname="%s" />'+
           '        </in:system>'+
           '    </soap:Header>'+
           '    <soap:Body>'+
           '        <in:business xmlns:in="http:www.tyswjw.gov.cn">'+
           '           %s '+                 // <para param1="N888888888" />
           '        </in:business>'+
           '    </soap:Body>'+
           '</soap:Envelope>';

  sCH0ASQL='select CH0A01 adm_id,'+					//住院就诊号
           '	   CH0A82 as med_pay_type,'+		//医疗付费方式
           '	   CH0A81 health_record_index,'+		//健康档案主索引
           '	   RIGHT(CH0A01,2) adm_count,'+		//住院次数
           '	   Case When IsNull(CH0A00,^^)=^^ Then Left(CH0A01,Len(CH0A01)-2) Else CH0A00 End med_id,'+					//-病案号
           '	   CH0A02 name,'+						//-姓名
           '	   CH0A03 sex,'+						//-性别
           '	   replace(CONVERT(VARCHAR(10),CH0A04,120),^-^,^^) birthday,'+    ////出生日期
           '	   case when CH0AA1=^Y^ then CONVERT(varchar(3),CH0A06) else 0 end age_year,'+  //年龄(年)
           '	   Ch0AN1 age_month,'+                  //年龄
           '	   CH0AA2 nationality,'+				//-国籍
           '	   CH0AN2 birth_weight,'+				//-新生儿出生体重
           '	   CH0AN3 birth_adm_weight,'+			//-新生儿入院体重
           '	   ^^ Weight,'+						////-患者体重
           '	   ISNULL(X1.Sheng,^^) birthplace_province,'+////出生地-省
           '	   ISNULL(X1.Shi,^^) birthplace_city,'+	////出生地-市
           '	   ISNULL(X1.Xian,^^) birthplace_county,'+	////出生地-县
           '	   ^^ birthplace_town,'+						//-出生地-乡
           '	   ^^ birthplace_country,'+				////-出生地-村
           '	   ^^ birthplace_door,'+					////-出生地-门牌号码
           '	   ^^ birthplace_detail,'+			   ////-出生详细地址
           '	   ISNULL(X2.Sheng,^^) native_place_province,'+////籍贯-省
           '	   ISNULL(X2.Shi,^^) native_place_city,'+	////籍贯-市
           '	   ISNULL(X2.Xian,^^) native_place_county,'+	////籍贯-县
           '	   ^^ native_place_town,'+						//-籍贯-乡
           '	   ^^ native_place_country,'+				////-籍贯-村
           '	   ^^ native_place_door,'+					////-籍贯-门牌号码
           '	   ^^ native_place_detail,'+			   ////-籍贯详细地址
           '	   CH0A10 nation,'+						////-民族
           '	   CH0A05 person_id,'+					//////身份证号
           '	   CH0A08 occup,'+						//////职业
           '	   CH0A07 marital_status,'+				//////婚姻状况
           '	   ISNULL(X3.Sheng,^^) present_add_province,'+////现住址-省
           '	   ISNULL(X3.Shi,^^) present_add_city,'+	////现住址-市
           '	   ISNULL(X3.Xian,^^) present_add_county,'+	////现住址-县
           '	   ^^ present_add_town,'+						//-现住址-乡
           '	   ^^ present_add_country,'+				////-现住址-村 
           '	   ^^ present_add_door,'+					////-现住址-门牌号码
           '	   ^^ present_add_detail,'+			   ////-现住址详细地址
           '	   Ch0AN7 phone,'+						////-联系电话
           '	   Ch0AN8 present_add_postcode,'+			////-现住址邮编
           '	   ISNULL(X4.Sheng,^^) household_addr_province,'+////户口地址-省
           '	   ISNULL(X4.Shi,^^) household_addr_city,'+	////户口住址-市
           '	   ISNULL(X4.Xian,^^) household_addr_county,'+	////户口住址-县
           '	   ^^ household_addr_town,'+						//-户口住址-乡
           '	   ^^ household_addr_country,'+				////-户口住址-村
           '	   ^^ household_addr_door,'+					////-户口住址-门牌号码
           '	   ^^ household_addr_detail,'+			   ////-户口住址详细地址
           '	   CH0A14 Household_add_postcode,'+			////户口地址邮编
           '	   CH0AA3 job_unit,'+							////-工作单位
           '	   ^^ job_unit_addr_province,'+				//-工作单位地址-省
           '	   ^^  job_unit_addr_city,'+					//-工作单位地址-市
           '	   ^^  job_unit_addr_county,'+				//-工作单位地址-县
           '	   ^^  job_unit_addr_town,'+					//-工作单位地址-乡
           '	   ^^  job_unit_addr_country,'+				//-工作单位地址-村
           '	   ^^  job_unit_addr_door,'+					//-工作单位地址-门牌号码
           '	   CH0AA3  job_unit_addr_detail,'+			//-工作单位详细地址
           '	   CH0AA5 job_phone,'+						//-工作单位电话
           '	   CH0AA4 unit_postcode,'+					//-工作单位邮编
           '	   CH0A15 linkman_name,'+						//-联系人姓名
           '	   CASE WHEN CH0A16=9 THEN 8 ELSE ch0A16 END linkman_rel,'+						//-联系人关系
           '	   CH0A19 linkman_phone,'+					//-联系人电话
           '	   ISNULL(X5.Sheng,^^) linkman_mail_addr_province,'+////联系人地址-省
           '	   ISNULL(X5.Shi,^^) linkman_mail_addr_city,'+	////联系人住址-市
           '	   ISNULL(X5.Xian,^^) linkman_mail_addr_county,'+	////联系人住址-县
           '	   ^^ linkman_mail_addr_town,'+					////联系人地址-乡
           '	   ^^ linkman_mail_addr_country,'+				//// 联系人地址-村
           '	   ^^ linkman_mail_addr_door,'+					////-联系人地址-门牌号
           '	   CH0A17 linkman_mail_addr_detail,'+                 ////-联系人详细地址
           '	   CH0A56 adm_way,'+								////入院途径
           '	   replace(replace(CONVERT(VARCHAR(20),Ch0A24,120),^-^,^^),^:^,^^) adm_time,'+	////入院时间
           '	   replace(replace(CONVERT(VARCHAR(20),Ch0A27,120),^-^,^^),^:^,^^) leave_time,'+////出院时间
           '	   CH0A21  adm_dep_id,'+							////入院科室编码
           '	   Ks1.SoKm adm_dep_name,'+						////-入院科室名称
           '	   CH0ANA adm_sickroom,'+							////-入院病房
           '	   CH0A23 leave_dep_id,'+							////-出院科室编码
           '	   Ks2.SoKm  leave_dep_name,'+					////-出院科室名称
           '	   CH0ANB leave_sickroom,'+						////-出院病房
           '	   Ks3.SoKm transfer_level,'+							////-转入科别      111111111111111
           '	   CH0A29 reality_adm_day,'+						////-实际住院天数
           '	   ZD1.BmMc  diag,'+								////-门（急）诊诊断
           '	   ZD1.BmICD diag_dise,'+							////-门（急）诊断疾病
           '	   CH0A79  harm_toxic_external,'+					////-损伤中毒的外部原因
           '	   sszd1.ICD10 external_reason_cc,'+				////-外部原因疾病分类
           '	   LEFT(D.Ch0D03,300) pathology_diagnosis,'+		////-病理诊断
           '	   Ch0D07 pathology_diagnosis_cc,'+				////-病理诊断疾病分类
           '	   Ch0D02 pathology_id,'+							////-病理号
           '	   ^^ drug_allergy_flag,'+					////-药物过敏标志
           '	   CH0A52 drug_allergy,'+							////-过敏药物
           '	   CH0ANC die_patient_atuopsy,'+					////- 死亡患者尸检
           '	   CH0A45 blood_type,'+							//////血型
           '	   CH0AC5 rh,'+									//////-RH
           '	   ^^ Subf_staff_id,'+							//////-科主任编码
           '	   CH0AB1 Subf_staff_name,'+						//////-科主任名称
           '	   ^^ archiater_id,'+								//////-主任医师编码
           '	   CH0A32 archiater_name,'+						//////主任医师姓名
           '	   ^^ visit_staff_id,'+							//////-主治医师编码
           '	   CH0A33 visit_staff_name,'+						//////主治医师姓名
           '	   ^^ resident_doctor_id,'+						//////住院医师编码
           '	   CH0A34 resident_doctor_name,'+					//////-住院医师姓名
           '	   ^^ primary_nurse_id,'+							////////责任护士编码
           '	   CH0AND primary_nurse_name,'+					////////责任护士姓名
           '	   ^^ advance_doctor_id,'+						////////-进修医师编码
           '	   CH0AB2 advance_doctor_name,'+					////////-进修医师姓名
           '	   ^^  practice_doctor_id,'+						////////实习医师编码
           '	   CH0AB4 practice_doctor_name,'+					////////实习医师姓名
           '	   ^^ encoder_id,'+								////////编码员编码
           '	   CH0A59 encoder_name,'+							//////-编码员姓名
           '	   CH0A51 med_quality,'+							//////-病案质量
           '	   ^^ QC_doc_id ,'+								//////质控医师编码
           '	   CH0AB5 QC_doc_name,'+							//////-质控医师姓名
           '	   ^^ QC_nurse_id,'+							    //////-质控护士编码
           '	   CH0A69 QC_nurse_name,'+						//////-质控护士姓名
           '	   replace(replace(Convert(VarChar(20), CH0AB6, 120),^-^,^^),^:^,^^) QC_date,'+    ////////质控日期
           '	   CASE CH0A41 WHEN 3 THEN 6 WHEN 4 THEN 5 ELSE CH0A41 END cure_condition,'+						//////治愈情况
           '	   Ch0ANE leave_way,'+							//////离院方式
           '	   Ch0ANF accept_org_name,'+						//////接受医疗机构名称
           '	   Ch0ANG adm_again_mark,'+						//////-出院31天再住院的标志
           '	   Ch0ANH adm_again_reason,'+						//////出院31天再住院的目的
           '	   Ch0ANI head_injure_pta_coma_d,'+				////-入院前颅脑损伤患者昏迷天数
           '	   Ch0ANJ head_injure_pta_coma_h,'+				////-入院前颅脑损伤患者昏迷小时
           '	   Ch0ANK head_injure_pta_coma_min,'+			    ////-入院前颅脑损伤患者昏迷分钟数
           '	   Ch0ANL head_injure_ata_coma_d,'+				////-入院后颅脑损伤患者昏迷天数
           '	   Ch0ANM head_injure_ata_coma_h,'+				////-入院后颅脑损伤患者昏迷小时
           '	   Ch0ANN head_injure_ata_coma_min,'+			    ////-入院后颅脑损伤患者昏迷分钟数
           '	   Ch0F02 die_primary_cause,'+				     ////-死亡根本原因
           '	   replace(replace(CONVERT(VARCHAR(20),Ch0F07,120),^-^,^^),^:^,^^) die_time,'+////死亡时间
           '	   IsNull(CH0B83,0) adm_all_cost,'+				////-住院总费用
           '	   IsNull(CH0BP1,0) self_pay_cost,'+				////-自费
           '	   IsNull(CH0BP2,0) com_med_ser_cost,'+			////-一般医疗服务费
           '	   IsNull(CH0BP3,0) com_cure_ser_cost,'+			////-一般治疗操作费
           '	   IsNull(CH0BP4,0) nurse_ser_cost,'+				////-护理费
           '	   IsNull(CH0BP5,0) other_ser_cost,'+				//////其他服务费用
           '	   IsNull(CH0BP6,0) path_diag_class_cost,'+		////-病理诊断费
           '	   IsNull(CH0BP7,0) lab_diag_class_cost,'+		//////实验室诊断费
           '	   IsNull(CH0BP8,0) img_diag_class_cost,'+		//////影像学诊断费
           '	   IsNull(CH0BP9,0) cli_diag_class_cost,'+		////-临床诊断项目费
           '	   IsNull(CH0BPA,0) unops_cure_class_cost,'+         ////-非手术治疗项目费
           '	   IsNull(CH0BPB,0) cli_phy_cure_class_cost,'+	//////临床物理治疗费
           '	   IsNull(CH0BPC,0) ops_cure_class_cost,'+		//////手术治疗费
           '	   IsNull(CH0BPD,0) anesth_cost,'+				//////麻醉费
           '	   IsNull(CH0BPE,0) ops_cost,'+				    //////手术费
           '	   IsNull(CH0BPF,0)	rec_cost,'+					//////-康复费
           '	   IsNull(CH0BPG,0)	med_cost,'+					//////中医治疗费
           '	   IsNull(CH0BPH,0) west_med_cost,'+				//////西药费
           '	   IsNull(CH0BPI,0)	ant_agents_cost,'+			//////抗菌药物费用
           '	   IsNull(CH0BPJ,0)	tcpm_cost,'+					//////中成药费
           '	   IsNull(CH0BPK,0)	tchm_cost,'+					//////中草药费
           '	   IsNull(CH0BPL,0)	blood_cost,'+					//////血费
           '	   IsNull(CH0BPM,0) albumin_pdt_cost,'+			//////白蛋白类制品费
           '	   IsNull(CH0BPN,0) globin_pdt_cost,'+			//////球蛋白类制品费
           '	   IsNull(CH0BPO,0) cruor_factor_pdt_cost,'+		//////凝血因子类制品费
           '	   IsNull(CH0BPP,0) cell_factor_pdt_cost,'+		//////细胞因子类制品费
           '	   IsNull(CH0BPQ,0) ins_cons_class_cost,'+		//////检查用一次性医用材料费
           '	   IsNull(CH0BPR,0) cure_cons_class_cost,'+		//////治疗用一次性医用材料费
           '	   IsNull(CH0BPS,0)	ops_cons_class_cost,'+		//////手术用一次性医用材料费
           '	   IsNull(CH0BPT,0)	other_cost,'+					//////其他费
           '	   CH0A20 adm_case,	'+							//////入院情况
           '	   replace(replace(CONVERT(varchar(20),CH0A30,120),^-^,^^),^:^,^^) adm_diagnosis_date,'+ //////入院后确诊日期
           '	   CASE WHEN CH0A41 =9 THEN 5 ELSE CH0A41 END  primary_diagnosis_discharge,'+			//////主要诊断出院时情况
           '	   CASE WHEN CH0A54=2 THEN CH0A54 ELSE 1 END Hospital_infection_tatus,'+				//////医院感染情况
           '	   C.CH0C07 infection_name,'+							////-感染名称
           '	   CH0A43  cli_adm_diagnose,'+               //////- 门诊与出院诊断符合编码
           '	   CH0A44  in_out_adm_diagnose,'+            //////- 入院与出院诊断符合编码
           '	   CH0ACD  pre_postoperation_diagnose,'+     //////- 术前与术后诊断符合编码
           '	   CH0AC1  cli_pathology_diagnose,'+         //////- 临床与病理诊断符合编码
           '	   Ch0AQ6  oper_froz_paraffin_pathology,'+   //////- 手术冻结与石蜡病理诊断符合编码
           '	   CH0AC2  radiate_apathology_diagnose,'+    //////- 放射与病理诊断符合编码
           '	   ISNULL(Ch0ANQ,2) cli_pathway,'+               //////-实施临床路径
           '       CH0P05 cli_pathway_dise_name,'+     //////-临床路径病种名称
           '       ISNULL(CH0P06,2) Single_disease,'+            //////-单病种
           '       ISNULL(CH0P07,3) critically_ill_patients,'+   //////-危重病人
           '       CH0A46 rescue_time,'+               //////-抢救次数
           '       CH0A47 success_time,'+              //////-成功次数
           '       ISNULL(CH0P08,1) case_discuss,'+              //////-病例讨论
           '       ^^   case_discuss_content,'+        //////-病例讨论内容
           '       ISNULL(CH0P09,1) pressure_ulcer,'+  ////-住院患者压疮
           '       CASE WHEN ISNULL(H.Ch0H08,0)>0 THEN 2 ELSE 1 END blood_trans_reaction,'+////-输血反应
           '       CASE WHEN ISNULL(H.Ch0H10,0)>0 THEN 2 ELSE 1 END infusion_reaction,'+////-输血反应 
           '       ISNULL(CH0P10,1) Oper_foreign_body_leave,'+  ////////术中异物遗留
           '       ISNULL(CH0P11,1) iatrog_pneumoth,'+		     //////医源性气胸
           '       ISNULL(CH0P12,1)  iatrog_puncture_wounds,'+      ////////- 医源性意外穿刺伤
           '       ISNULL(CH0P13,1)  iatrog_accident_laceration,'+  ////////- 医源性意外撕裂伤
           '       ISNULL(CH0P16,1)  hospital_tumble,'+             ////////- 医院内跌倒
           '       ISNULL(CH0P15,1)  hospital_drop_bed,'+           ////////- 医院内坠床
           '       ISNULL(CH0P14,1) birth_injury,'+						//////////新生儿产伤
           '       ISNULL(CH0P17,1) vagina_delivery_injury,'+			//////////阴道分娩产妇产伤
           '       ISNULL(CH0P18,1) oper_narcosis_complicate,'+    ////////-手术及麻醉并发症
           '       ISNULL(CH0P19,1) complicate_name,'+			   ////////-并发症名称
           '       ^0^ secret_level,'+						////////-密级
           '       ^0^ cancel_flag'+						////////作废标志
           '	   from VsCH0A A '+
           '	   Left Join VsNationality N on A.CH0AA2=N.Dm'+
           '	   Left Join VsXzqh_12 X1 on A.CH0A09=X1.Dm'+
           '	   LEFT JOIN VSXZQH_12 X2 ON A.CH0AN4=X2.DM'+
           '       LEFT JOIN VSXZQH_12 X3 ON A.CH0AN5=X3.DM'+
           '       LEFT JOIN VSXZQH_12 X4 ON A.CH0A12=X4.DM'+
           '       LEFT JOIN VSXZQH_12 X5 ON A.CH0A17=X5.DM'+
           '       Left Join VsSOffice Ks1 on A.CH0A21=Ks1.SoDm'+
           '       Left Join VsSOffice Ks2 on A.CH0A23=Ks2.SoDm'+
           '	   Left Join VsSOffice Ks3 on Left(A.CH0A22,4)=Ks3.SoDm'+
           '	   Left Join VsUseICD ZD1 on A.CH0A36=ZD1.Bmm'+
           '       Left Join VsSSzd_ALL sszd1 on sszd1.ICD10= A.CH0A79'+
           '	   Left Join VsCH0D D on  A.CHYear=D.CHYear and A.CH0A01=D.CH0D01 and CH0D05=^L^'+
           '	   Left Join VsCh0F F on A.CHYear=F.CHYear and A.CH0A01=F.CH0F01'+
           '	   Left Join VsCh0B B on A.CHYear=B.CHYear and A.CH0A01=B.CH0B01'+
           '       Left Join VsCh0C C on A.CHYear=C.CHYear and A.CH0A01=C.CH0C01 AND CH0C02=22 and C.CH0C06 =1'+ ////医院感染标志
           '	   LEFT JOIN VsCh0H H ON A.CHYear = H.ChYear AND A.CH0A01=H.Ch0H01 '+
           '	   LEFT JOIN VsCh0E E ON A.CHYear = E.ChYear AND A.CH0A01=E.Ch0E01 and CH0E07=1'+
           '	   LEFT JOIN VsCh0P P ON A.CHYear = P.ChYear AND A.CH0A01=P.Ch0P01'+
           '	   Where CH0A27>=^%s^ and CH0A27<=^%s^';
  sCH0CSQL='SELECT CH0A01+^_1^ diag_id,'+												////-诊断流水号
           '		Case When IsNull(CH0A00,^^)=^^ Then Left(CH0A01,Len(CH0A01)-2) Else CH0A00 End adm_id,'+									////-住院就诊号
           '		^^	dise_clinical_diag,'+									////-疾病临床诊断
           '		ISNULL(D2.BmMc,^^) dise_diag_class_name,'+					//////疾病诊断分类名称
           '		ISNULL(D2.BmICD,^^) dise_diag_class_id,'+					////疾病诊断分类编码
           '		ISNULL(Ch0ANO,^^)   adm_patient_condition,'+				//////入院病情
           '		^1^ diagnoisi_cate,'+										//////诊断类别
           '		^0^	secret_level,'+											//////密级
           '		^0^ cancel_flag '+ 											//////-作废标志
           'FROM dbo.VsCH0A A LEFT JOIN dbo.VsUseICD  D2 ON A.CH0A38=D2.Bmm '+
           'where A.CH0A27>=^%0:s^ and A.CH0A27<=^%1:s^ '+
           'UNION ALL '+
           'SELECT CH0A01+^_^+CONVERT(VARCHAR(5),CH0C02+1) diag_id,'+						////-诊断流水号
           '	   	Case When IsNull(CH0A00,^^)=^^ Then Left(CH0A01,Len(CH0A01)-2) Else CH0A00 End adm_id,'+									////-住院就诊号
           '	   	^^	dise_clinical_diag,'+									////-疾病临床诊断
           '	   	ISNULL(D1.BmMc,^^) dise_diag_class_name,'+					//////疾病诊断分类名称
           '	   	ISNULL(D1.BmICD,^^) dise_diag_class_id,'+					//////疾病诊断分类编码
           '	   	ISNULL(Ch0CN1,^1^)   adm_patient_condition,'+	    		//////入院病情
           '	   	^2^ diagnoisi_cate,'+										//////诊断类别
           '	   	^0^	secret_level,'+											//////密级
           '	   	^0^ cancel_flag	'+											////-作废标志
           'FROM VsCH0C C INNER JOIN dbo.VsCH0A A ON A.CHYear=C.CHYear AND CH0A01=CH0C01 '+
           'LEFT JOIN dbo.VsUseICD D1  ON C.CH0C03=D1.Bmm	'+
           'where A.CH0A27>=^%0:s^ and A.CH0A27<=^%1:s^';

  sCH0ESQL='SELECT CH0A01+^_^+Convert(varchar(10),CH0E07) ope_rec_id ,'+		//手术记录流水号
           '       Case When IsNull(CH0A00,^^)=^^ Then Left(CH0A01,Len(CH0A01)-2) Else CH0A00 End adm_id,'+			//-住院就诊号
           '		ISNULL(CH0E05,^^) OPe_tech_id,'+		//手术操作编码
           '		ISNULL(Ssmc,^^)   OPe_name,'+           //手术及操作名称
           '		CONVERT(varchar(20),CH0E11,112)+^ ^+REPLACE(CONVERT(VARCHAR(20),CH0E11,108),^:^,^^) OPe_date,'+           //手术操作日期
           '		CASE WHEN ISNULL(CH0E04,^^)=^^ THEN ^1^ ELSE (CASE ch0E04  WHEN ^^ THEN ^1^ ELSE ch0E04 END) END  OPe_level,'+   //手术级别
           '		^^                 OPe_doc_id,'+         //手术医师编码
           '		ISNULL(Ch0E09,^^)  OPe_doc_name,'+       //手术医师姓名
           '		^^                 OPe_one_id,'+         //手术Ⅰ助编码
           '		ISNULL(CH0E14,^^)  OPe_one_name,'+       //手术Ⅰ助姓名
           '		^^                 OPe_two_id, '+        //手术Ⅱ助编码
           '		ISNULL(CH0E15,^^)  OPe_two_name,'+       //手术Ⅱ助姓名
           '		Cast(CH0E12 as int)+1  Ope_cut_level,'+      //手术切口类别代码
           '		Case WHEN CH0E13 =9 then ^4^ else (CASE WHEN ISNULL(ch0E13,^^)=^^ THEN ^1^ ELSE(CASE ch0E13 WHEN ^^ THEN ^1^ ELSE ch0E13 end)end)end  wound_healing_level,'+//切口愈合等级
           '		ISNULL(N.WTMZM ,^-^)  anesth_way,'+         //麻醉方式
           '		^^                   cli_doc_id,'+         //麻醉医师编码
           '		ISNULL(CH0E16,^^)    cli_doc_name,'+       //麻醉医师姓名
           '		^0^                   secret_level,'+       //密级
           '		^0^                   cancel_flag '+        //作废标志
           'FROM VsCH0E E  '+
           'LEFT JOIN VsCH0A A ON A.CHYear=e.ChYear AND CH0A01=Ch0E01 '+
           'LEFT JOIN VsUseICCM I ON e.CH0E08 =I.Ssm '+
           'LEFT JOIN VsNarcosis N ON E.Ch0E10=n.Dm '+
           'Where A.CH0A27>=^%0:s^ and A.CH0A27<=^%1:s^ ';

implementation

end.
  
  
  
  
  
  
  
  
  

