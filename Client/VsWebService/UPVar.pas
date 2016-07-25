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

  sCH0ASQL='select CH0A01 adm_id,'+					//סԺ�����
           '	   CH0A82 as med_pay_type,'+		//ҽ�Ƹ��ѷ�ʽ
           '	   CH0A81 health_record_index,'+		//��������������
           '	   RIGHT(CH0A01,2) adm_count,'+		//סԺ����
           '	   Case When IsNull(CH0A00,^^)=^^ Then Left(CH0A01,Len(CH0A01)-2) Else CH0A00 End med_id,'+					//-������
           '	   CH0A02 name,'+						//-����
           '	   CH0A03 sex,'+						//-�Ա�
           '	   replace(CONVERT(VARCHAR(10),CH0A04,120),^-^,^^) birthday,'+    ////��������
           '	   case when CH0AA1=^Y^ then CONVERT(varchar(3),CH0A06) else 0 end age_year,'+  //����(��)
           '	   Ch0AN1 age_month,'+                  //����
           '	   CH0AA2 nationality,'+				//-����
           '	   CH0AN2 birth_weight,'+				//-��������������
           '	   CH0AN3 birth_adm_weight,'+			//-��������Ժ����
           '	   ^^ Weight,'+						////-��������
           '	   ISNULL(X1.Sheng,^^) birthplace_province,'+////������-ʡ
           '	   ISNULL(X1.Shi,^^) birthplace_city,'+	////������-��
           '	   ISNULL(X1.Xian,^^) birthplace_county,'+	////������-��
           '	   ^^ birthplace_town,'+						//-������-��
           '	   ^^ birthplace_country,'+				////-������-��
           '	   ^^ birthplace_door,'+					////-������-���ƺ���
           '	   ^^ birthplace_detail,'+			   ////-������ϸ��ַ
           '	   ISNULL(X2.Sheng,^^) native_place_province,'+////����-ʡ
           '	   ISNULL(X2.Shi,^^) native_place_city,'+	////����-��
           '	   ISNULL(X2.Xian,^^) native_place_county,'+	////����-��
           '	   ^^ native_place_town,'+						//-����-��
           '	   ^^ native_place_country,'+				////-����-��
           '	   ^^ native_place_door,'+					////-����-���ƺ���
           '	   ^^ native_place_detail,'+			   ////-������ϸ��ַ
           '	   CH0A10 nation,'+						////-����
           '	   CH0A05 person_id,'+					//////���֤��
           '	   CH0A08 occup,'+						//////ְҵ
           '	   CH0A07 marital_status,'+				//////����״��
           '	   ISNULL(X3.Sheng,^^) present_add_province,'+////��סַ-ʡ
           '	   ISNULL(X3.Shi,^^) present_add_city,'+	////��סַ-��
           '	   ISNULL(X3.Xian,^^) present_add_county,'+	////��סַ-��
           '	   ^^ present_add_town,'+						//-��סַ-��
           '	   ^^ present_add_country,'+				////-��סַ-�� 
           '	   ^^ present_add_door,'+					////-��סַ-���ƺ���
           '	   ^^ present_add_detail,'+			   ////-��סַ��ϸ��ַ
           '	   Ch0AN7 phone,'+						////-��ϵ�绰
           '	   Ch0AN8 present_add_postcode,'+			////-��סַ�ʱ�
           '	   ISNULL(X4.Sheng,^^) household_addr_province,'+////���ڵ�ַ-ʡ
           '	   ISNULL(X4.Shi,^^) household_addr_city,'+	////����סַ-��
           '	   ISNULL(X4.Xian,^^) household_addr_county,'+	////����סַ-��
           '	   ^^ household_addr_town,'+						//-����סַ-��
           '	   ^^ household_addr_country,'+				////-����סַ-��
           '	   ^^ household_addr_door,'+					////-����סַ-���ƺ���
           '	   ^^ household_addr_detail,'+			   ////-����סַ��ϸ��ַ
           '	   CH0A14 Household_add_postcode,'+			////���ڵ�ַ�ʱ�
           '	   CH0AA3 job_unit,'+							////-������λ
           '	   ^^ job_unit_addr_province,'+				//-������λ��ַ-ʡ
           '	   ^^  job_unit_addr_city,'+					//-������λ��ַ-��
           '	   ^^  job_unit_addr_county,'+				//-������λ��ַ-��
           '	   ^^  job_unit_addr_town,'+					//-������λ��ַ-��
           '	   ^^  job_unit_addr_country,'+				//-������λ��ַ-��
           '	   ^^  job_unit_addr_door,'+					//-������λ��ַ-���ƺ���
           '	   CH0AA3  job_unit_addr_detail,'+			//-������λ��ϸ��ַ
           '	   CH0AA5 job_phone,'+						//-������λ�绰
           '	   CH0AA4 unit_postcode,'+					//-������λ�ʱ�
           '	   CH0A15 linkman_name,'+						//-��ϵ������
           '	   CASE WHEN CH0A16=9 THEN 8 ELSE ch0A16 END linkman_rel,'+						//-��ϵ�˹�ϵ
           '	   CH0A19 linkman_phone,'+					//-��ϵ�˵绰
           '	   ISNULL(X5.Sheng,^^) linkman_mail_addr_province,'+////��ϵ�˵�ַ-ʡ
           '	   ISNULL(X5.Shi,^^) linkman_mail_addr_city,'+	////��ϵ��סַ-��
           '	   ISNULL(X5.Xian,^^) linkman_mail_addr_county,'+	////��ϵ��סַ-��
           '	   ^^ linkman_mail_addr_town,'+					////��ϵ�˵�ַ-��
           '	   ^^ linkman_mail_addr_country,'+				//// ��ϵ�˵�ַ-��
           '	   ^^ linkman_mail_addr_door,'+					////-��ϵ�˵�ַ-���ƺ�
           '	   CH0A17 linkman_mail_addr_detail,'+                 ////-��ϵ����ϸ��ַ
           '	   CH0A56 adm_way,'+								////��Ժ;��
           '	   replace(replace(CONVERT(VARCHAR(20),Ch0A24,120),^-^,^^),^:^,^^) adm_time,'+	////��Ժʱ��
           '	   replace(replace(CONVERT(VARCHAR(20),Ch0A27,120),^-^,^^),^:^,^^) leave_time,'+////��Ժʱ��
           '	   CH0A21  adm_dep_id,'+							////��Ժ���ұ���
           '	   Ks1.SoKm adm_dep_name,'+						////-��Ժ��������
           '	   CH0ANA adm_sickroom,'+							////-��Ժ����
           '	   CH0A23 leave_dep_id,'+							////-��Ժ���ұ���
           '	   Ks2.SoKm  leave_dep_name,'+					////-��Ժ��������
           '	   CH0ANB leave_sickroom,'+						////-��Ժ����
           '	   Ks3.SoKm transfer_level,'+							////-ת��Ʊ�      111111111111111
           '	   CH0A29 reality_adm_day,'+						////-ʵ��סԺ����
           '	   ZD1.BmMc  diag,'+								////-�ţ����������
           '	   ZD1.BmICD diag_dise,'+							////-�ţ�������ϼ���
           '	   CH0A79  harm_toxic_external,'+					////-�����ж����ⲿԭ��
           '	   sszd1.ICD10 external_reason_cc,'+				////-�ⲿԭ�򼲲�����
           '	   LEFT(D.Ch0D03,300) pathology_diagnosis,'+		////-�������
           '	   Ch0D07 pathology_diagnosis_cc,'+				////-������ϼ�������
           '	   Ch0D02 pathology_id,'+							////-�����
           '	   ^^ drug_allergy_flag,'+					////-ҩ�������־
           '	   CH0A52 drug_allergy,'+							////-����ҩ��
           '	   CH0ANC die_patient_atuopsy,'+					////- ��������ʬ��
           '	   CH0A45 blood_type,'+							//////Ѫ��
           '	   CH0AC5 rh,'+									//////-RH
           '	   ^^ Subf_staff_id,'+							//////-�����α���
           '	   CH0AB1 Subf_staff_name,'+						//////-����������
           '	   ^^ archiater_id,'+								//////-����ҽʦ����
           '	   CH0A32 archiater_name,'+						//////����ҽʦ����
           '	   ^^ visit_staff_id,'+							//////-����ҽʦ����
           '	   CH0A33 visit_staff_name,'+						//////����ҽʦ����
           '	   ^^ resident_doctor_id,'+						//////סԺҽʦ����
           '	   CH0A34 resident_doctor_name,'+					//////-סԺҽʦ����
           '	   ^^ primary_nurse_id,'+							////////���λ�ʿ����
           '	   CH0AND primary_nurse_name,'+					////////���λ�ʿ����
           '	   ^^ advance_doctor_id,'+						////////-����ҽʦ����
           '	   CH0AB2 advance_doctor_name,'+					////////-����ҽʦ����
           '	   ^^  practice_doctor_id,'+						////////ʵϰҽʦ����
           '	   CH0AB4 practice_doctor_name,'+					////////ʵϰҽʦ����
           '	   ^^ encoder_id,'+								////////����Ա����
           '	   CH0A59 encoder_name,'+							//////-����Ա����
           '	   CH0A51 med_quality,'+							//////-��������
           '	   ^^ QC_doc_id ,'+								//////�ʿ�ҽʦ����
           '	   CH0AB5 QC_doc_name,'+							//////-�ʿ�ҽʦ����
           '	   ^^ QC_nurse_id,'+							    //////-�ʿػ�ʿ����
           '	   CH0A69 QC_nurse_name,'+						//////-�ʿػ�ʿ����
           '	   replace(replace(Convert(VarChar(20), CH0AB6, 120),^-^,^^),^:^,^^) QC_date,'+    ////////�ʿ�����
           '	   CASE CH0A41 WHEN 3 THEN 6 WHEN 4 THEN 5 ELSE CH0A41 END cure_condition,'+						//////�������
           '	   Ch0ANE leave_way,'+							//////��Ժ��ʽ
           '	   Ch0ANF accept_org_name,'+						//////����ҽ�ƻ�������
           '	   Ch0ANG adm_again_mark,'+						//////-��Ժ31����סԺ�ı�־
           '	   Ch0ANH adm_again_reason,'+						//////��Ժ31����סԺ��Ŀ��
           '	   Ch0ANI head_injure_pta_coma_d,'+				////-��Ժǰ­�����˻��߻�������
           '	   Ch0ANJ head_injure_pta_coma_h,'+				////-��Ժǰ­�����˻��߻���Сʱ
           '	   Ch0ANK head_injure_pta_coma_min,'+			    ////-��Ժǰ­�����˻��߻��Է�����
           '	   Ch0ANL head_injure_ata_coma_d,'+				////-��Ժ��­�����˻��߻�������
           '	   Ch0ANM head_injure_ata_coma_h,'+				////-��Ժ��­�����˻��߻���Сʱ
           '	   Ch0ANN head_injure_ata_coma_min,'+			    ////-��Ժ��­�����˻��߻��Է�����
           '	   Ch0F02 die_primary_cause,'+				     ////-��������ԭ��
           '	   replace(replace(CONVERT(VARCHAR(20),Ch0F07,120),^-^,^^),^:^,^^) die_time,'+////����ʱ��
           '	   IsNull(CH0B83,0) adm_all_cost,'+				////-סԺ�ܷ���
           '	   IsNull(CH0BP1,0) self_pay_cost,'+				////-�Է�
           '	   IsNull(CH0BP2,0) com_med_ser_cost,'+			////-һ��ҽ�Ʒ����
           '	   IsNull(CH0BP3,0) com_cure_ser_cost,'+			////-һ�����Ʋ�����
           '	   IsNull(CH0BP4,0) nurse_ser_cost,'+				////-�����
           '	   IsNull(CH0BP5,0) other_ser_cost,'+				//////�����������
           '	   IsNull(CH0BP6,0) path_diag_class_cost,'+		////-������Ϸ�
           '	   IsNull(CH0BP7,0) lab_diag_class_cost,'+		//////ʵ������Ϸ�
           '	   IsNull(CH0BP8,0) img_diag_class_cost,'+		//////Ӱ��ѧ��Ϸ�
           '	   IsNull(CH0BP9,0) cli_diag_class_cost,'+		////-�ٴ������Ŀ��
           '	   IsNull(CH0BPA,0) unops_cure_class_cost,'+         ////-������������Ŀ��
           '	   IsNull(CH0BPB,0) cli_phy_cure_class_cost,'+	//////�ٴ��������Ʒ�
           '	   IsNull(CH0BPC,0) ops_cure_class_cost,'+		//////�������Ʒ�
           '	   IsNull(CH0BPD,0) anesth_cost,'+				//////�����
           '	   IsNull(CH0BPE,0) ops_cost,'+				    //////������
           '	   IsNull(CH0BPF,0)	rec_cost,'+					//////-������
           '	   IsNull(CH0BPG,0)	med_cost,'+					//////��ҽ���Ʒ�
           '	   IsNull(CH0BPH,0) west_med_cost,'+				//////��ҩ��
           '	   IsNull(CH0BPI,0)	ant_agents_cost,'+			//////����ҩ�����
           '	   IsNull(CH0BPJ,0)	tcpm_cost,'+					//////�г�ҩ��
           '	   IsNull(CH0BPK,0)	tchm_cost,'+					//////�в�ҩ��
           '	   IsNull(CH0BPL,0)	blood_cost,'+					//////Ѫ��
           '	   IsNull(CH0BPM,0) albumin_pdt_cost,'+			//////�׵�������Ʒ��
           '	   IsNull(CH0BPN,0) globin_pdt_cost,'+			//////�򵰰�����Ʒ��
           '	   IsNull(CH0BPO,0) cruor_factor_pdt_cost,'+		//////��Ѫ��������Ʒ��
           '	   IsNull(CH0BPP,0) cell_factor_pdt_cost,'+		//////ϸ����������Ʒ��
           '	   IsNull(CH0BPQ,0) ins_cons_class_cost,'+		//////�����һ����ҽ�ò��Ϸ�
           '	   IsNull(CH0BPR,0) cure_cons_class_cost,'+		//////������һ����ҽ�ò��Ϸ�
           '	   IsNull(CH0BPS,0)	ops_cons_class_cost,'+		//////������һ����ҽ�ò��Ϸ�
           '	   IsNull(CH0BPT,0)	other_cost,'+					//////������
           '	   CH0A20 adm_case,	'+							//////��Ժ���
           '	   replace(replace(CONVERT(varchar(20),CH0A30,120),^-^,^^),^:^,^^) adm_diagnosis_date,'+ //////��Ժ��ȷ������
           '	   CASE WHEN CH0A41 =9 THEN 5 ELSE CH0A41 END  primary_diagnosis_discharge,'+			//////��Ҫ��ϳ�Ժʱ���
           '	   CASE WHEN CH0A54=2 THEN CH0A54 ELSE 1 END Hospital_infection_tatus,'+				//////ҽԺ��Ⱦ���
           '	   C.CH0C07 infection_name,'+							////-��Ⱦ����
           '	   CH0A43  cli_adm_diagnose,'+               //////- �������Ժ��Ϸ��ϱ���
           '	   CH0A44  in_out_adm_diagnose,'+            //////- ��Ժ���Ժ��Ϸ��ϱ���
           '	   CH0ACD  pre_postoperation_diagnose,'+     //////- ��ǰ��������Ϸ��ϱ���
           '	   CH0AC1  cli_pathology_diagnose,'+         //////- �ٴ��벡����Ϸ��ϱ���
           '	   Ch0AQ6  oper_froz_paraffin_pathology,'+   //////- ����������ʯ��������Ϸ��ϱ���
           '	   CH0AC2  radiate_apathology_diagnose,'+    //////- �����벡����Ϸ��ϱ���
           '	   ISNULL(Ch0ANQ,2) cli_pathway,'+               //////-ʵʩ�ٴ�·��
           '       CH0P05 cli_pathway_dise_name,'+     //////-�ٴ�·����������
           '       ISNULL(CH0P06,2) Single_disease,'+            //////-������
           '       ISNULL(CH0P07,3) critically_ill_patients,'+   //////-Σ�ز���
           '       CH0A46 rescue_time,'+               //////-���ȴ���
           '       CH0A47 success_time,'+              //////-�ɹ�����
           '       ISNULL(CH0P08,1) case_discuss,'+              //////-��������
           '       ^^   case_discuss_content,'+        //////-������������
           '       ISNULL(CH0P09,1) pressure_ulcer,'+  ////-סԺ����ѹ��
           '       CASE WHEN ISNULL(H.Ch0H08,0)>0 THEN 2 ELSE 1 END blood_trans_reaction,'+////-��Ѫ��Ӧ
           '       CASE WHEN ISNULL(H.Ch0H10,0)>0 THEN 2 ELSE 1 END infusion_reaction,'+////-��Ѫ��Ӧ 
           '       ISNULL(CH0P10,1) Oper_foreign_body_leave,'+  ////////������������
           '       ISNULL(CH0P11,1) iatrog_pneumoth,'+		     //////ҽԴ������
           '       ISNULL(CH0P12,1)  iatrog_puncture_wounds,'+      ////////- ҽԴ�����⴩����
           '       ISNULL(CH0P13,1)  iatrog_accident_laceration,'+  ////////- ҽԴ������˺����
           '       ISNULL(CH0P16,1)  hospital_tumble,'+             ////////- ҽԺ�ڵ���
           '       ISNULL(CH0P15,1)  hospital_drop_bed,'+           ////////- ҽԺ��׹��
           '       ISNULL(CH0P14,1) birth_injury,'+						//////////����������
           '       ISNULL(CH0P17,1) vagina_delivery_injury,'+			//////////���������������
           '       ISNULL(CH0P18,1) oper_narcosis_complicate,'+    ////////-������������֢
           '       ISNULL(CH0P19,1) complicate_name,'+			   ////////-����֢����
           '       ^0^ secret_level,'+						////////-�ܼ�
           '       ^0^ cancel_flag'+						////////���ϱ�־
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
           '       Left Join VsCh0C C on A.CHYear=C.CHYear and A.CH0A01=C.CH0C01 AND CH0C02=22 and C.CH0C06 =1'+ ////ҽԺ��Ⱦ��־
           '	   LEFT JOIN VsCh0H H ON A.CHYear = H.ChYear AND A.CH0A01=H.Ch0H01 '+
           '	   LEFT JOIN VsCh0E E ON A.CHYear = E.ChYear AND A.CH0A01=E.Ch0E01 and CH0E07=1'+
           '	   LEFT JOIN VsCh0P P ON A.CHYear = P.ChYear AND A.CH0A01=P.Ch0P01'+
           '	   Where CH0A27>=^%s^ and CH0A27<=^%s^';
  sCH0CSQL='SELECT CH0A01+^_1^ diag_id,'+												////-�����ˮ��
           '		Case When IsNull(CH0A00,^^)=^^ Then Left(CH0A01,Len(CH0A01)-2) Else CH0A00 End adm_id,'+									////-סԺ�����
           '		^^	dise_clinical_diag,'+									////-�����ٴ����
           '		ISNULL(D2.BmMc,^^) dise_diag_class_name,'+					//////������Ϸ�������
           '		ISNULL(D2.BmICD,^^) dise_diag_class_id,'+					////������Ϸ������
           '		ISNULL(Ch0ANO,^^)   adm_patient_condition,'+				//////��Ժ����
           '		^1^ diagnoisi_cate,'+										//////������
           '		^0^	secret_level,'+											//////�ܼ�
           '		^0^ cancel_flag '+ 											//////-���ϱ�־
           'FROM dbo.VsCH0A A LEFT JOIN dbo.VsUseICD  D2 ON A.CH0A38=D2.Bmm '+
           'where A.CH0A27>=^%0:s^ and A.CH0A27<=^%1:s^ '+
           'UNION ALL '+
           'SELECT CH0A01+^_^+CONVERT(VARCHAR(5),CH0C02+1) diag_id,'+						////-�����ˮ��
           '	   	Case When IsNull(CH0A00,^^)=^^ Then Left(CH0A01,Len(CH0A01)-2) Else CH0A00 End adm_id,'+									////-סԺ�����
           '	   	^^	dise_clinical_diag,'+									////-�����ٴ����
           '	   	ISNULL(D1.BmMc,^^) dise_diag_class_name,'+					//////������Ϸ�������
           '	   	ISNULL(D1.BmICD,^^) dise_diag_class_id,'+					//////������Ϸ������
           '	   	ISNULL(Ch0CN1,^1^)   adm_patient_condition,'+	    		//////��Ժ����
           '	   	^2^ diagnoisi_cate,'+										//////������
           '	   	^0^	secret_level,'+											//////�ܼ�
           '	   	^0^ cancel_flag	'+											////-���ϱ�־
           'FROM VsCH0C C INNER JOIN dbo.VsCH0A A ON A.CHYear=C.CHYear AND CH0A01=CH0C01 '+
           'LEFT JOIN dbo.VsUseICD D1  ON C.CH0C03=D1.Bmm	'+
           'where A.CH0A27>=^%0:s^ and A.CH0A27<=^%1:s^';

  sCH0ESQL='SELECT CH0A01+^_^+Convert(varchar(10),CH0E07) ope_rec_id ,'+		//������¼��ˮ��
           '       Case When IsNull(CH0A00,^^)=^^ Then Left(CH0A01,Len(CH0A01)-2) Else CH0A00 End adm_id,'+			//-סԺ�����
           '		ISNULL(CH0E05,^^) OPe_tech_id,'+		//������������
           '		ISNULL(Ssmc,^^)   OPe_name,'+           //��������������
           '		CONVERT(varchar(20),CH0E11,112)+^ ^+REPLACE(CONVERT(VARCHAR(20),CH0E11,108),^:^,^^) OPe_date,'+           //������������
           '		CASE WHEN ISNULL(CH0E04,^^)=^^ THEN ^1^ ELSE (CASE ch0E04  WHEN ^^ THEN ^1^ ELSE ch0E04 END) END  OPe_level,'+   //��������
           '		^^                 OPe_doc_id,'+         //����ҽʦ����
           '		ISNULL(Ch0E09,^^)  OPe_doc_name,'+       //����ҽʦ����
           '		^^                 OPe_one_id,'+         //������������
           '		ISNULL(CH0E14,^^)  OPe_one_name,'+       //������������
           '		^^                 OPe_two_id, '+        //������������
           '		ISNULL(CH0E15,^^)  OPe_two_name,'+       //������������
           '		Cast(CH0E12 as int)+1  Ope_cut_level,'+      //�����п�������
           '		Case WHEN CH0E13 =9 then ^4^ else (CASE WHEN ISNULL(ch0E13,^^)=^^ THEN ^1^ ELSE(CASE ch0E13 WHEN ^^ THEN ^1^ ELSE ch0E13 end)end)end  wound_healing_level,'+//�п����ϵȼ�
           '		ISNULL(N.WTMZM ,^-^)  anesth_way,'+         //����ʽ
           '		^^                   cli_doc_id,'+         //����ҽʦ����
           '		ISNULL(CH0E16,^^)    cli_doc_name,'+       //����ҽʦ����
           '		^0^                   secret_level,'+       //�ܼ�
           '		^0^                   cancel_flag '+        //���ϱ�־
           'FROM VsCH0E E  '+
           'LEFT JOIN VsCH0A A ON A.CHYear=e.ChYear AND CH0A01=Ch0E01 '+
           'LEFT JOIN VsUseICCM I ON e.CH0E08 =I.Ssm '+
           'LEFT JOIN VsNarcosis N ON E.Ch0E10=n.Dm '+
           'Where A.CH0A27>=^%0:s^ and A.CH0A27<=^%1:s^ ';

implementation

end.
  
  
  
  
  
  
  
  
  

