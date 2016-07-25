unit UFrmTYFY;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ExtCtrls, StdCtrls, AdvGroupBox, DBGridEhGrouping, GridsEh, DBGridEh,
  DB, DBClient, UDlClientDataset,UGFun,UGVar,UVsMidClassList,UCommon,
  AdvFontCombo;

type
  TFrmTYFY = class(TFrame)
    ScrollBox1: TScrollBox;
    AdvGroupBox1: TAdvGroupBox;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    bvl1: TBevel;
    lblName: TLabel;
    bvl2: TBevel;
    lbl4: TLabel;
    lblNL: TLabel;
    bvl3: TBevel;
    lbl6: TLabel;
    lblXB: TLabel;
    bvl4: TBevel;
    lbl5: TLabel;
    lblKB: TLabel;
    lbl7: TLabel;
    lblZYH: TLabel;
    bvl5: TBevel;
    AdvGroupBox2: TAdvGroupBox;
    dbgrdhSS: TDBGridEh;
    ds1: TDataSource;
    AdvGroupBox3: TAdvGroupBox;
    lbl8: TLabel;
    edtCH0ATY18: TEdit;
    lbl9: TLabel;
    lbl10: TLabel;
    edtCH0ATY19: TEdit;
    lbl11: TLabel;
    lbl12: TLabel;
    edtCH0EZ13: TEdit;
    lbl13: TLabel;
    lbl14: TLabel;
    edtCH0EZ14: TEdit;
    lbl15: TLabel;
    lbl16: TLabel;
    edtCH0ESC00: TEdit;
    lbl17: TLabel;
    lbl18: TLabel;
    edtCH0EZ19: TEdit;
    lbl19: TLabel;
    lbl20: TLabel;
    edtCH0EZ15: TEdit;
    lbl21: TLabel;
    AdvGroupBox4: TAdvGroupBox;
    dbgrdhICU: TDBGridEh;
    AdvGroupBox5: TAdvGroupBox;
    lbl22: TLabel;
    edtCH0AYN04: TEdit;
    lbl23: TLabel;
    lbl24: TLabel;
    lbl26: TLabel;
    edtCH0AYN01: TEdit;
    lbl27: TLabel;
    lbl28: TLabel;
    edtCH0AYN06: TEdit;
    lbl29: TLabel;
    edtCH0AYN05: TEdit;
    lbl25: TLabel;
    lbl30: TLabel;
    edtCH0AYN02: TEdit;
    lbl31: TLabel;
    lbl32: TLabel;
    edtCH0AYN03: TEdit;
    lbl33: TLabel;
    lbl34: TLabel;
    lbl35: TLabel;
    edtCH0ATY01: TEdit;
    lbl36: TLabel;
    lbl37: TLabel;
    edtCH0ATY02: TEdit;
    lbl38: TLabel;
    lbl39: TLabel;
    edtCH0ATY04: TEdit;
    lbl40: TLabel;
    lbl41: TLabel;
    edtCH0ATY06: TEdit;
    lbl42: TLabel;
    lbl43: TLabel;
    edtCH0ATY05: TEdit;
    AdvGroupBox6: TAdvGroupBox;
    lbl44: TLabel;
    edtCh0EZ03: TEdit;
    lbl45: TLabel;
    lbl46: TLabel;
    edtCH0AYNA7: TEdit;
    lbl47: TLabel;
    lbl48: TLabel;
    edtCH0AYNA8: TEdit;
    lbl49: TLabel;
    lbl50: TLabel;
    edtCH0AYNA9: TEdit;
    lbl51: TLabel;
    lbl52: TLabel;
    edtCH0AYNB0: TEdit;
    lbl53: TLabel;
    lbl54: TLabel;
    edtCH0AYNB1: TEdit;
    lbl55: TLabel;
    lbl56: TLabel;
    lbl57: TLabel;
    lbl58: TLabel;
    edtCH0P11: TEdit;
    lbl59: TLabel;
    edtCH0P13: TEdit;
    lbl60: TLabel;
    lbl61: TLabel;
    edtCH0A57: TEdit;
    lbl62: TLabel;
    lbl63: TLabel;
    edtCH0ATY15: TEdit;
    lbl65: TLabel;
    edtCH0A58: TEdit;
    lbl67: TLabel;
    edtCH0ATY16: TEdit;
    lbl64: TLabel;
    lbl66: TLabel;
    lbl68: TLabel;
    AdvGroupBox7: TAdvGroupBox;
    lbl69: TLabel;
    edtCH0A54: TEdit;
    lbl70: TLabel;
    lbl71: TLabel;
    edtCH0AQ1: TEdit;
    lbl72: TLabel;
    lbl73: TLabel;
    edtCH0ATY07: TEdit;
    lbl74: TLabel;
    lbl75: TLabel;
    edtCH0ATY17: TEdit;
    lbl76: TLabel;
    lbl77: TLabel;
    lbl78: TLabel;
    edtCH0AQ5: TEdit;
    lbl79: TLabel;
    edtCH0ATY08: TEdit;
    lbl80: TLabel;
    lbl81: TLabel;
    edtCH0ATY09: TEdit;
    lbl82: TLabel;
    AdvGroupBox8: TAdvGroupBox;
    lbl83: TLabel;
    edtCh0ANQ: TEdit;
    lbl84: TLabel;
    lbl85: TLabel;
    edtCH0AYN07: TEdit;
    lbl86: TLabel;
    lbl87: TLabel;
    edtCH0AYN08: TEdit;
    lbl88: TLabel;
    edtCH0AYN09: TEdit;
    lbl89: TLabel;
    lbl90: TLabel;
    edtCH0AYNAA: TEdit;
    AdvGroupBox9: TAdvGroupBox;
    lbl91: TLabel;
    lbl92: TLabel;
    edtqj: TEdit;
    lbl93: TLabel;
    edttCH0A46: TEdit;
    lbl94: TLabel;
    lbl95: TLabel;
    edttCH0A47: TEdit;
    lbl96: TLabel;
    lbl97: TLabel;
    lbl98: TLabel;
    edtCH0A43: TEdit;
    edtCH0A44: TEdit;
    lbl99: TLabel;
    lbl100: TLabel;
    edtCH0AC1: TEdit;
    lbl101: TLabel;
    edtCH0AC2: TEdit;
    lbl102: TLabel;
    lbl103: TLabel;
    edtCh0AQ6: TEdit;
    lbl104: TLabel;
    edtCH0ACD: TEdit;
    lbl105: TLabel;
    lbl106: TLabel;
    lbl107: TLabel;
    lbl108: TLabel;
    edtCH0ATY10: TEdit;
    lbl109: TLabel;
    edtCH0ATY11: TEdit;
    lbl110: TLabel;
    lbl111: TLabel;
    edtCH0ATY12: TEdit;
    lbl112: TLabel;
    edtCH0ATY13: TEdit;
    lbl113: TLabel;
    lbl114: TLabel;
    edtCH0ATY14: TEdit;
    lbl115: TLabel;
    AdvGroupBox10: TAdvGroupBox;
    dsss: TDataSource;
    clientdtDLCDS: TClientDataSet;
    dsICU: TDataSource;
    cbbCH0AYNB2: TAdvOfficeComboBox;
    dldtXSER: TDlClientDataset;
    dsXSER: TDataSource;
    dldtSS: TDlClientDataset;
    clientdtXSER: TClientDataSet;
    dbgrdhXSE: TDBGridEh;
    procedure dbgrdhICUKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgrdhSSKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgrdhXSEKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCH0AYN04KeyPress(Sender: TObject; var Key: Char);
    procedure edtCH0A43KeyPress(Sender: TObject; var Key: Char);
    procedure edtCH0AYNA9KeyPress(Sender: TObject; var Key: Char);
    procedure edtCH0AYNB1KeyPress(Sender: TObject; var Key: Char);
    procedure edtCH0ATY18KeyPress(Sender: TObject; var Key: Char);
    procedure dsICUStateChange(Sender: TObject);
  private
    { Private declarations }
    FBaSetInfo: TBaSetInfo;
    FChYear,FCh0A01,FCh0A00:String;
    FIsAppend:Boolean;
    FSetControlHint:TSetSbSimpleText;
    FCDSCh0A,FCDSCh0E,FCDSCh0R,FCDSChWT47:TDlClientDataset;
  public
    { Public declarations }
    Constructor Create(Aowner:TComponent);Override;
    procedure SetBaSetInfo(aBaSetInfo:TBaSetInfo);
    procedure GetValueByCh0P01(Chyear,Ch0A01,Ch0A00:string;SetControlHint: TSetSbSimpleText;IsAppend:Boolean;CDSCh0A,DLCH0E,DLCH0R,DLWT47:TDlClientDataset);
    Procedure SaveValue;
    Property SetControlHint:TSetSbSimpleText Read FSetControlHint Write FSetControlHint;
  end;

implementation
   uses UMidProxy,UgShare;

{$R *.dfm}

{ TFrmTYFY }

constructor TFrmTYFY.Create(Aowner: TComponent);
begin
  inherited;

  FillCombobox('Select id,FallBedReason From VsZhdm_12 Where ISNULL(FallBedReason,^^)<>^^','ID','FallBedReason',cbbCH0AYNB2);

  FillDBGridEHCombobox('Select id,sf From VsZhdm_12 Where IsNull(sf,^^)<>^^',dbgrdhSS,'CH0ESC00','id','sf');
  FillDBGridEHCombobox('Select id,sf From VsZhdm_12 Where IsNull(sf,^^)<>^^',dbgrdhSS,'CH0EE6','id','sf');
  FillDBGridEHCombobox('Select id,sf From VsZhdm_12 Where IsNull(sf,^^)<>^^',dbgrdhSS,'CH0EZ13','id','sf');
  FillDBGridEHCombobox('Select id,sf From VsZhdm_12 Where IsNull(sf,^^)<>^^',dbgrdhSS,'CH0ESC00','id','sf');
  FillDBGridEHCombobox('Select id,NNIS From VsZhdm_12 Where IsNull(NNIS,^^)<>^^',dbgrdhSS,'CH0EE5','id','NNIS'); //手术NNIS分级
  FillDBGridEHCombobox('Select id,yw From VsZhdm_12 Where IsNull(yw,^^)<>^^',dbgrdhSS,'CH0EZ02','id','yw');  //麻醉并发症
  FillDBGridEHCombobox('Select id,yw From VsZhdm_12 Where IsNull(yw,^^)<>^^',dbgrdhSS,'CH0EZ03','id','yw');  //术中遗留物
  FillDBGridEHCombobox('Select id,yw From VsZhdm_12 Where IsNull(yw,^^)<>^^',dbgrdhSS,'CH0EZ04','id','yw');  // 术中并发症
  FillDBGridEHCombobox('Select id,yw From VsZhdm_12 Where IsNull(yw,^^)<>^^',dbgrdhSS,'CH0EZ05','id','yw');   //术后出血或血肿
  FillDBGridEHCombobox('Select id,yw From VsZhdm_12 Where IsNull(yw,^^)<>^^',dbgrdhSS,'CH0EZ06','id','yw');   //手术伤口裂开
  FillDBGridEHCombobox('Select id,yw From VsZhdm_12 Where IsNull(yw,^^)<>^^',dbgrdhSS,'CH0EZ07','id','yw');  //术后深静脉血栓
  FillDBGridEHCombobox('Select id,yw From VsZhdm_12 Where IsNull(yw,^^)<>^^',dbgrdhSS,'CH0EZ08','id','yw');  //术后生理/代谢紊乱
  FillDBGridEHCombobox('Select id,yw From VsZhdm_12 Where IsNull(yw,^^)<>^^',dbgrdhSS,'CH0EZ09','id','yw');   //术后呼吸衰竭
  FillDBGridEHCombobox('Select id,yw From VsZhdm_12 Where IsNull(yw,^^)<>^^',dbgrdhSS,'CH0EZ10','id','yw');   //术后肺部栓塞
  FillDBGridEHCombobox('Select id,yw From VsZhdm_12 Where IsNull(yw,^^)<>^^',dbgrdhSS,'CH0EZ17','id','yw');   //术后肺部感染
  FillDBGridEHCombobox('Select id,yw From VsZhdm_12 Where IsNull(yw,^^)<>^^',dbgrdhSS,'CH0EZ11','id','yw');  //术后败血症
  FillDBGridEHCombobox('Select id,yw From VsZhdm_12 Where IsNull(yw,^^)<>^^',dbgrdhSS,'CH0EZ16','id','yw');  //术后骨折
  FillDBGridEHCombobox('Select id,yw From VsZhdm_12 Where IsNull(yw,^^)<>^^',dbgrdhSS,'CH0EZ12','id','yw');   //术后髋关节骨折
  FillDBGridEHCombobox('Select id,yw From VsZhdm_12 Where IsNull(yw,^^)<>^^',dbgrdhSS,'CH0EZ18','id','yw');  //术后人工气道意外脱出

  FillDBGridEHCombobox('select dm ,dmmc ICUMC from VsSJZD Where DMKind=^ZZKS^',dbgrdhICU,'CH0R03','dm','ICUMC'); //重症室名称
  FillDBGridEHCombobox('Select id,sf From VsZhdm_12 Where IsNull(sf,^^)<>^^',dbgrdhICU,'CH0R10','id','sf');      //是否发生人工气道脱出
  FillDBGridEHCombobox('Select id,sf From VsZhdm_12 Where IsNull(sf,^^)<>^^',dbgrdhICU,'CH0R11','id','sf');      //是否非预期的重返重症医学科
  FillDBGridEHCombobox('Select id,sf From VsZhdm_12 Where IsNull(sf,^^)<>^^',dbgrdhICU,'CH0R13','id','sf');      //ICU死亡
  FillDBGridEHCombobox('Select id,sf From VsZhdm_12 Where IsNull(sf,^^)<>^^',dbgrdhICU,'CH0R15','id','sf');      //是否发生与中心静脉置管相关血液感染
  FillDBGridEHCombobox('Select id,sf From VsZhdm_12 Where IsNull(sf,^^)<>^^',dbgrdhICU,'CH0R17','id','sf');      //是否发生与呼吸机相关肺炎感染
  FillDBGridEHCombobox('Select id,sf From VsZhdm_12 Where IsNull(sf,^^)<>^^',dbgrdhICU,'CH0R19','id','sf');      //是否发生与留置导尿管相关泌尿系统感染

  FillDBGridEHCombobox('Select dm,xbmc From VsZhdm where IsNull(xbmc,^^)<>^^',dbgrdhXSE,'XB','dm','xbmc');     //新生儿性别
  FillDBGridEHCombobox('Select dm,ckmc From VsZhdm where IsNull(ckmc,^^)<>^^',dbgrdhXSE,'CCQK','dm','ckmc');     //产出情况
  FillDBGridEHCombobox('Select id,CYQK From VsZhdm_12 where IsNull(CYQK,^^)<>^^',dbgrdhXSE,'CYQK','id','CYQK');     //出院情况
  FillDBGridEHCombobox('select BmICD,BmMc from VsUseICD',dbgrdhXSE,'JB','BmICD','BmMc');     //疾病
  FillDBGridEHCombobox('Select id,sf From VsZhdm_12 Where IsNull(sf,^^)<>^^',dbgrdhXSE,'YYGR','id','sf');     //是否发生医院感染

end;

procedure TFrmTYFY.dbgrdhICUKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  //添加新行
  if Key = VK_INSERT then
  begin
    if FCDSCh0R.State in [dsInsert,dsEdit] then
      FCDSCh0R.Post;
      
    FCDSCh0R.Append;
    FCDSCh0R.FieldByName('CH0R01').AsString := FCh0A01;
    FCDSCh0R.FieldByName('CHYear').AsString := FChYear;

  end
  else if Key=VK_DELETE then  //删除
  begin
    if FCDSCh0R.IsEmpty then Exit;
    FCDSCh0R.Delete;
  end;


end;

procedure TFrmTYFY.dbgrdhSSKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  if Key=VK_INSERT then
  begin
    if FCDSCh0E.IsEmpty then
    begin
      FCDSCh0E.Insert;
    end
    else
      FCDSCh0E.Append;

    FCDSCh0E.FieldByName('CH0E01').AsString:=FCh0A01;
    FCDSCh0E.FieldByName('CHYear').AsString := FChYear;
    
  end
  else if Key=VK_DELETE then
  begin
    if FCDSCh0E.IsEmpty then
      Exit;
    FCDSCh0E.Delete;
  end;
end;

procedure TFrmTYFY.dbgrdhXSEKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  var
   i,xh:Integer;
   xhtotal,xhhas,xhs:set of 1..4;
begin
  xhtotal := [1..4];
  xhhas := [];

  if Key=VK_INSERT then
  begin
    if clientdtXSER.IsEmpty then
      xh := 1
    else
    begin
      with clientdtXSER do
      begin
        First;
        while not Eof do
        begin
          Include(xhhas,clientdtXSER.FieldByName('xh').AsInteger);
          Next;
        end;
      end;
      xhs := xhtotal-xhhas;
      for I := 1 to 4 do
      begin
        if i in xhs then
        begin
          xh := i;
          Break;
        end;
      end;
    end;
    clientdtXSER.Append;
    clientdtXSER.FieldByName('xh').AsString :=IntToStr(xh);

  end
  else if Key=VK_DELETE then
  begin
    clientdtXSER.Delete;
  end;
end;

procedure TFrmTYFY.dsICUStateChange(Sender: TObject);
begin
  if FCDSCh0R.State in [dsInsert,dsEdit] then
  begin
    if FCDSCh0R.FieldByName('CH0R02').AsString ='' then
    begin
      FCDSCh0R.FieldByName('CH0R02').AsInteger := FCDSCh0R.RecordCount;
    end;
    FCDSCh0R.FieldByName('CH0R01').AsString := FCh0A01;
    FCDSCh0R.FieldByName('CHYear').AsString := FChYear;
  end;


end;

procedure TFrmTYFY.edtCH0A43KeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['1'..'4']) then
    Key := #0
end;

procedure TFrmTYFY.edtCH0ATY18KeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'4']) then
    Key := #0
end;

procedure TFrmTYFY.edtCH0AYN04KeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'2']) then
    Key := #0
end;

procedure TFrmTYFY.edtCH0AYNA9KeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'5']) then
  Key := #0
end;

procedure TFrmTYFY.edtCH0AYNB1KeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'3']) then
    Key := #0
end;

procedure TFrmTYFY.GetValueByCh0P01(Chyear, Ch0A01, Ch0A00: string;
  SetControlHint: TSetSbSimpleText; IsAppend: Boolean; CDSCh0A,
  DLCH0E,DLCH0R,DLWT47: TDlClientDataset);
  const
    SQLCH0E='Select *,QkYh=(Select Qkmc From VsZhdm Where Dm=CH0E12)+^/^+'+
                              '              (Select YhQk From VsZhdm Where Dm=CH0E13),'+
                              '       Mzmc,SsMc,VSZD_SSBW.DMMC CH0EE4_MC,VsSJZD.Dmmc CH0ESC10_MC '+
                              '  From VsCh0E '+
                              '       Left Join VsNarcosis On CH0E10=VsNarcosis.Dm'+
                              '       Left Join VsUseIccm On Ch0E08=VsUseIccm.SSm '+
                              '       Left Join VSZD_SSBW On CH0EE4=VSZD_SSBW.DM '+
                              '       Left Join VsSJZD On DMKind=^SSBF^ And CH0ESC10=VsSJZD.Dm '+
                              ' Where ChYear=^%1:s^ And Ch0E01=^%0:s^';
var
  clientdtTemp,cdttemp:TClientDataSet;
  xm,xb,kb:string;
  Age:Integer;
  sqltext:string;
  i:Integer;

   procedure _GetMidData(CDS:TClientDataSet;MIDDataSQL:string);
  var
    I:Integer;
    MidData:TClientDataSet;
  begin
    if IsAppend And (CDS.RecordCount=0) then
       begin
         MidData:=TClientDataSet.Create(nil);
         AutoFree(MidData);
         TMidProxy.SqlOpen(Format(MIDDataSQL,[Chyear,Ch0A01]),MidData);
         MidData.First;
         if MidData.RecordCount>0 then
            With MidData do While Not Eof Do Begin
              CDS.Append;
              for I := 0 to FieldCount - 1 do
                 CDS.FieldByName(Fields[I].FieldName).Value:=Fields[I].Value;
              Next;
            End;
       end;
  end;
  Function _GetMidDataSQL(TableName,BAHFieldName:String):string;
  Var
    SQLStr:String;
  begin
    SQLStr:=Format('Select * from %0:s'+
                   ' Where Exists(Select 1 From VsCh_PatientInfo'+
                   '               Where %0:s.CHYear=VsCh_PatientInfo.ChYear And %1:s=Ch0M01 And '+
                   '                     VsCh_PatientInfo.CHYear=^%2s^ and ',[TableName,BAHFieldName,CHYear]);
    IF FBaSetInfo.VsBsCh0A01Rule=EuBahRuleType(0) Then
       SQLStr:=SQLStr+Format('Ch0M01=^%s^)',[FCH0A01])
    Else
       SQLStr:=SQLStr+Format('Ch0M00=^%s^)',[Ch0A00]);
    Result:=SQLStr;
  end;

begin
  FCh0A01 :=Ch0A01;
  FChYear := Chyear;
  FCh0A00 := Ch0A00;
  FIsAppend:=IsAppend;
  FSetControlHint:=SetControlHint;
  FCDSCh0A := CDSCh0A;
  FCDSCh0E := DLCH0E;
  FCDSChWT47 := DLWT47;
  FCDSCh0R := DLCH0R;

  dsss.DataSet := FCDSCh0E;
  dsICU.DataSet := FCDSCh0R;
  dsXSER.DataSet := FCDSChWT47;

  clientdtTemp :=TClientDataSet.Create(nil);
  autofree(clientdtTemp);
  //查询患者基本信息
  TMidProxy.SqlOpen(Format('select somc,xb,CH0A02,CH0A06 from VsCH0A a inner join'
      +' VsSOffice b  on a.CH0A21 = b.SODM inner join VsZhdm_12 c on a.CH0A03=c.id where CH0A01=^%s^ and ChYear=^%s^ ',[Ch0A01,Chyear]),clientdtTemp);
  if not clientdtTemp.IsEmpty then
  begin
    xm := clientdtTemp.FieldByName('CH0A02').AsString;
    xb :=clientdtTemp.FieldByName('xb').AsString;
    kb := clientdtTemp.FieldByName('somc').AsString;
    Age := clientdtTemp.FieldByName('ch0A06').AsInteger;
    lblName.Caption := xm;
    lblXB.Caption := xb;
    lblNL.Caption := IntToStr(Age);
    lblKB.Caption := kb;
    lblZYH.Caption :=Ch0A00;
  end;

  //查询手术信息

//  FCDSCh0E.Mid_Open(Format(SQLCH0E,[Ch0A01,Chyear]));
//  _GetMidData(FCDSCh0E,_GetMidDataSQL('VSCH_CH0E','CH0E01'));
  if not FCDSCh0E.IsEmpty then
  begin
    edtCH0EZ13.Text :=IntToStr(FCDSCh0E.FieldByName('CH0EZ13').AsInteger);
    edtCH0EZ14.Text :=IntToStr(FCDSCh0E.FieldByName('CH0EZ14').AsInteger);
    edtCH0ESC00.Text :=IntToStr(FCDSCh0E.FieldByName('CH0ESC00').AsInteger);
    edtCH0EZ19.Text :=IntToStr(FCDSCh0E.FieldByName('CH0EZ19').AsInteger);
    edtCH0EZ15.Text :=IntToStr(FCDSCh0E.FieldByName('CH0EZ15').AsInteger);
    edtCh0EZ03.Text := IIF(FCDSCh0E.FieldByName('CH0EZ03').AsInteger=0,'1',FCDSCh0E.FieldByName('CH0EZ03').AsString);

  end;
    //查询ICU信息
//  DLCH0R.Mid_Open(Format('select * from VsCh0R where Ch0R01=^%s^ and CHYear=^%s^',[Ch0A01,Chyear]));
//  _GetMidData(DLCH0R,_GetMidDataSQL('VSCH_CH0R','Ch0R01'));

  if not FCDSCh0A.IsEmpty then
  begin
  //合理用药
    edtCH0ATY18.Text := IntToStr(FCDSCh0A.FieldByName('CH0ATY18').AsInteger);
    edtCH0ATY19.Text := IntToStr(FCDSCh0A.FieldByName('CH0ATY19').AsInteger);
    edtCH0AYN04.Text := IntToStr(FCDSCh0A.FieldByName('CH0AYN04').AsInteger);
    edtCH0AYN05.Text := IntToStr(FCDSCh0A.FieldByName('CH0AYN05').AsInteger);
    edtCH0AYN06.Text := IntToStr(FCDSCh0A.FieldByName('CH0AYN06').AsInteger);
    edtCH0AYN01.Text := IntToStr(FCDSCh0A.FieldByName('CH0AYN01').AsInteger);
    edtCH0AYN02.Text := IntToStr(FCDSCh0A.FieldByName('CH0AYN02').AsInteger);
    edtCH0AYN03.Text := IntToStr(FCDSCh0A.FieldByName('CH0AYN03').AsInteger);
    edtCH0ATY01.Text := IntToStr(FCDSCh0A.FieldByName('CH0ATY01').AsInteger);
    edtCH0ATY02.Text := IntToStr(FCDSCh0A.FieldByName('CH0ATY02').AsInteger);
    edtCH0ATY04.Text := IntToStr(FCDSCh0A.FieldByName('CH0ATY04').AsInteger);
    edtCH0ATY05.Text := IntToStr(FCDSCh0A.FieldByName('CH0ATY05').AsInteger);
    edtCH0ATY06.Text := IntToStr(FCDSCh0A.FieldByName('CH0ATY06').AsInteger);
     //患者安全
    edtCH0AYNA7.Text := FCDSCh0A.FieldByName('CH0AYNA7').AsString;
    edtCH0AYNA8.Text := FCDSCh0A.FieldByName('CH0AYNA8').AsString;
    edtCH0AYNA9.Text := FCDSCh0A.FieldByName('CH0AYNA9').AsString;
    edtCH0AYNB0.Text := FCDSCh0A.FieldByName('CH0AYNB0').AsString;
    edtCH0AYNB1.Text := FCDSCh0A.FieldByName('CH0AYNB1').AsString;
    cbbCH0AYNB2.ItemIndex := GetDmIndexOFCombobox(FCDSCh0A.FieldByName('CH0AYNB2').AsString,cbbCH0AYNB2) ;
    edtCH0ATY15.Text := FCDSCh0A.FieldByName('CH0ATY15').AsString;
    edtCH0ATY16.Text := FCDSCh0A.FieldByName('CH0ATY16').AsString;
    edtCH0A57.Text   :=   FCDSCh0A.FieldByName('CH0A57').AsString;
    edtCH0A58.Text    :=   FCDSCh0A.FieldByName('CH0A58').AsString;
    edtCH0P11.Text := FCDSCh0A.FieldByName('CH0ATY20').AsString;
    edtCH0P13.Text :=FCDSCh0A.FieldByName('CH0ATY21').AsString;

    //医院感染
    edtCH0A54.Text    :=   FCDSCh0A.FieldByName('ch0A54').AsString;
    edtCH0AQ1.Text     :=   FCDSCh0A.FieldByName('CH0AQ1').AsString;
    edtCH0ATY07.Text   := FCDSCh0A.FieldByName('CH0ATY07').AsString;
    edtCH0ATY17.Text   := FCDSCh0A.FieldByName('CH0ATY17').AsString;
    edtCH0AQ5.Text    :=   FCDSCh0A.FieldByName('CH0AQ5').AsString;
    edtCH0ATY08.Text  := FCDSCh0A.FieldByName('CH0ATY08').AsString;
    edtCH0ATY09.Text := FCDSCh0A.FieldByName('CH0ATY09').AsString;

    //临床路径
    edtCh0ANQ.Text := FCDSCh0A.FieldByName('CH0ANQ').AsString;
    edtCH0AYN07.Text := FCDSCh0A.FieldByName('CH0AYN07').AsString;
    edtCH0AYN08.Text := FCDSCh0A.FieldByName('CH0AYN08').AsString;
    edtCH0AYN09.Text := FCDSCh0A.FieldByName('CH0AYN09').AsString;
    edtCH0AYNAA.Text := FCDSCh0A.FieldByName('CH0AYNAA').AsString;

    //其他
    if FCDSCh0A.FieldByName('CH0A46').AsInteger =0 then
    begin
      edtqj.Text := '1';
      edttCH0A46.Text := '0';
      edttCH0A47.Text :='0';
    end
    else
    begin
      edtqj.Text := '2';
      edttCH0A46.Text := FCDSCh0A.FieldByName('CH0A46').AsString;
      edttCH0A47.Text := FCDSCh0A.FieldByName('CH0A47').AsString;
    end;
    edtCH0A43.Text := FCDSCh0A.FieldByName('CH0A43').AsString;
    edtCH0A44.Text := FCDSCh0A.FieldByName('CH0A44').AsString;
    edtCH0ACD.Text := FCDSCh0A.FieldByName('CH0ACD').AsString;
    edtCH0AC1.Text := FCDSCh0A.FieldByName('CH0AC1').AsString;
    edtCH0AC2.Text := FCDSCh0A.FieldByName('CH0AC2').AsString;
    edtCh0AQ6.Text := FCDSCh0A.FieldByName('Ch0AQ6').AsString;
    edtCH0ATY10.Text := FCDSCh0A.FieldByName('CH0ATY10').AsString;
    edtCH0ATY11.Text := FCDSCh0A.FieldByName('CH0ATY11').AsString;
    edtCH0ATY12.Text := FCDSCh0A.FieldByName('CH0ATY12').AsString;
    edtCH0ATY13.Text := FCDSCh0A.FieldByName('CH0ATY13').AsString;
    edtCH0ATY14.Text := FCDSCh0A.FieldByName('CH0ATY14').AsString;
  end;


  //新生儿
  {sqltext := 'select * from %0:s where CHYear=^%1:s^ and WT4701 =^%2:s^';
  DLWT47.Mid_Open(Format(sqltext,['VsWt47_1',Chyear,Ch0A01]));
  if DLWT47.IsEmpty then
  begin
    cdttemp := TClientDataSet.Create(nil);
    AutoFree(cdttemp);
    TMidProxy.SqlOpen(Format(sqltext,['VsCH_Wt47_1',Chyear,Ch0A01]),cdttemp);
    if not cdttemp.IsEmpty then
    begin
      for I := 0 to DLWT47.Fields.Count - 1 do
      begin
        DLWT47.Edit;
         if DLWT47.FieldDefList[i].Name = 'WT4701' then
          DLWT47.FieldByName(DLWT47.FieldDefList[i].Name).AsString := Ch0A01
        else
          DLWT47.FieldByName(DLWT47.FieldDefList[i].Name).AsString := cdttemp.FieldByName(DLWT47.FieldDefList[i].Name).AsString;
        DLWT47.Post;
      end;

    end;
  end; }  {FROM %s WHERE CHYEAR=^%s^ AND WT4701=^%s^ ,'VsWt47_1',Chyear,Ch0A01}
  sqltext := '';
  for I := 1 to 4 do
  begin
    if FCDSChWT47.IsEmpty then
    begin
      sqltext := sqltext+format('select %d xh,3 XB,0 PF,0 SC,0 TZ,0 CCQK,0 CYQK,CONVERT(DATETIME,^^,120) CSSJ,CONVERT(varchar(20),^^) JB,CONVERT(DATETIME,^^,120) SWSJ,CONVERT(varchar(50),^^) SWYY,^^ YYGR',[i]);

    end
    else
    begin
       sqltext := sqltext+format('select %d xh,^%s^ XB,^%s^ PF,%d SC,%d TZ,^%s^ CCQK,IsNull(^%s^,0) CYQK,CONVERT(DATETIME,IsNull(^%s^,^2015-01-01^),120) CSSJ,CONVERT(varchar(20),^%s^) JB,CONVERT(DATETIME,^%s^,120) SWSJ,CONVERT(varchar(50),^%s^) SWYY,^%s^ YYGR'
       ,[i,FCDSChWT47.FieldByName('FM_XB'+inttostr(i)).AsString,FCDSChWT47.FieldByName('FM_PF'+inttostr(i)).AsString,FCDSChWT47.FieldByName('FM_SC'+inttostr(i)).AsInteger,
       FCDSChWT47.FieldByName('FM_Weight'+inttostr(i)).AsInteger,FCDSChWT47.FieldByName('FM_RSJJ'+inttostr(i)).AsString,FCDSChWT47.FieldByName('FM_CYQK'+inttostr(i)).AsString,
       FCDSChWT47.FieldByName('FM_CSRQ'+inttostr(i)).AsString,FCDSChWT47.FieldByName('FM_JB'+inttostr(i)).AsString,FCDSChWT47.FieldByName('FM_SWRQ'+inttostr(i)).AsString,
       FCDSChWT47.FieldByName('FM_SWYY'+inttostr(i)).AsString,FCDSChWT47.FieldByName('FM_YYGR'+inttostr(i)).AsString]);
    end;

    if i<4 then
     sqltext := sqltext +' union ';
  end;
  TMidProxy.SqlOpen(sqltext,clientdtXSER);
  dsXSER.DataSet := clientdtXSER;
end;

procedure TFrmTYFY.SaveValue;

  procedure aSaveCDS(CDS: TDLClientDataSet);
  begin
    inherited;
    //修改记录时Modified标志没有自动记为true,必须改变状态才能post
    if CDS.state in [DB.dsEdit,DB.dsInsert] then
       CDS.Post;
    if CDS.ChangeCount>0 then
       CDS.ApplyUpdates(CMaxErrors);
  end;
var
  xh:string;
begin
  if FCDSCh0E.Active then
  begin
     //更新手术信息
    FCDSCh0E.Edit;
    FCDSCh0E.FieldByName('CH0EZ13').AsString  :=   edtCH0EZ13.Text;
    FCDSCh0E.FieldByName('CH0EZ14').AsString  :=  edtCH0EZ14.Text;
    FCDSCh0E.FieldByName('CH0ESC00').AsString  :=  edtCH0ESC00.Text;
    FCDSCh0E.FieldByName('CH0EZ19').AsString   :=  edtCH0EZ19.Text;
    FCDSCh0E.FieldByName('CH0EZ15').AsString  := edtCH0EZ15.Text;
    FCDSCh0E.FieldByName('CH0EZ03').AsString  :=  edtCh0EZ03.Text;
    FCDSCh0E.Post;
  end;


  //病案首页
   //合理用药
  FCDSCh0A.Edit;
  FCDSCh0A.FieldByName('CH0ATY18').AsString :=edtCH0ATY18.Text ;
  FCDSCh0A.FieldByName('CH0ATY19').AsString :=edtCH0ATY19.Text ;
  FCDSCh0A.FieldByName('CH0AYN04').AsString :=edtCH0AYN04.Text ;
  FCDSCh0A.FieldByName('CH0AYN05').AsString :=edtCH0AYN05.Text ;
  FCDSCh0A.FieldByName('CH0AYN06').AsString :=edtCH0AYN06.Text ;
  FCDSCh0A.FieldByName('CH0AYN01').AsString :=edtCH0AYN01.Text ;
  FCDSCh0A.FieldByName('CH0AYN02').AsString :=edtCH0AYN02.Text ;
  FCDSCh0A.FieldByName('CH0AYN03').AsString :=edtCH0AYN03.Text ;
  FCDSCh0A.FieldByName('CH0ATY01').AsString :=edtCH0ATY01.Text ;
  FCDSCh0A.FieldByName('CH0ATY02').AsString :=edtCH0ATY02.Text ;
  FCDSCh0A.FieldByName('CH0ATY04').AsString :=edtCH0ATY04.Text ;
  FCDSCh0A.FieldByName('CH0ATY05').AsString :=edtCH0ATY05.Text ;
  FCDSCh0A.FieldByName('CH0ATY06').AsString :=edtCH0ATY06.Text ;
  //患者安全

  FCDSCh0A.FieldByName('CH0AYNA7').AsString:=edtCH0AYNA7.Text ;
  FCDSCh0A.FieldByName('CH0AYNA8').AsString:=edtCH0AYNA8.Text ;
  FCDSCh0A.FieldByName('CH0AYNA9').AsString:=edtCH0AYNA9.Text ;
  FCDSCh0A.FieldByName('CH0AYNB0').AsString:=edtCH0AYNB0.Text ;
  FCDSCh0A.FieldByName('CH0AYNB1').AsString:=edtCH0AYNB1.Text ;
  FCDSCh0A.FieldByName('CH0AYNB2').AsString := GetDmOFCombobox(cbbCH0AYNB2);
  FCDSCh0A.FieldByName('CH0ATY15').AsString :=edtCH0ATY15.Text  ;
  FCDSCh0A.FieldByName('CH0ATY16').AsString:= edtCH0ATY16.Text ;
  FCDSCh0A.FieldByName('CH0A57').AsString:=   edtCH0A57.Text  ;
  FCDSCh0A.FieldByName('CH0A58').AsString:=   edtCH0A58.Text  ;
  //医院感染
  FCDSCh0A.FieldByName('ch0A54').AsString :=edtCH0A54.Text;
  FCDSCh0A.FieldByName('CH0AQ1').AsString :=edtCH0AQ1.Text;   
  FCDSCh0A.FieldByName('CH0ATY07').AsString :=edtCH0ATY07.Text ;
  FCDSCh0A.FieldByName('CH0ATY17').AsString :=edtCH0ATY17.Text;
  FCDSCh0A.FieldByName('CH0AQ5').AsString :=edtCH0AQ5.Text ;
  FCDSCh0A.FieldByName('CH0ATY08').AsString :=edtCH0ATY08.Text ;
  FCDSCh0A.FieldByName('CH0ATY09').AsString :=edtCH0ATY09.Text;

  // 临床路径
  FCDSCh0A.FieldByName('CH0ANQ').AsString :=   edtCh0ANQ.Text;
  FCDSCh0A.FieldByName('CH0AYN07').AsString:= edtCH0AYN07.Text;
  FCDSCh0A.FieldByName('CH0AYN08').AsString:=  edtCH0AYN08.Text;
  FCDSCh0A.FieldByName('CH0AYN09').AsString:=  edtCH0AYN09.Text;
  FCDSCh0A.FieldByName('CH0AYNAA').AsString:= edtCH0AYNAA.Text;

  //其他
  FCDSCh0A.FieldByName('CH0A46').AsString := edttCH0A46.Text ;
  FCDSCh0A.FieldByName('CH0A47').AsString := edttCH0A47.Text;
  FCDSCh0A.FieldByName('CH0A43').AsString :=edtCH0A43.Text ;
  FCDSCh0A.FieldByName('CH0A44').AsString :=edtCH0A44.Text ;
  FCDSCh0A.FieldByName('CH0ACD').AsString :=edtCH0ACD.Text ;
  FCDSCh0A.FieldByName('CH0AC1').AsString :=edtCH0AC1.Text ;
  FCDSCh0A.FieldByName('CH0AC2').AsString :=edtCH0AC2.Text ;
  FCDSCh0A.FieldByName('Ch0AQ6').AsString :=edtCh0AQ6.Text ;
  FCDSCh0A.FieldByName('CH0ATY10').AsString :=edtCH0ATY10.Text ;
  FCDSCh0A.FieldByName('CH0ATY11').AsString :=edtCH0ATY11.Text;
  FCDSCh0A.FieldByName('CH0ATY12').AsString :=edtCH0ATY12.Text ;
  FCDSCh0A.FieldByName('CH0ATY13').AsString :=edtCH0ATY13.Text ;
  FCDSCh0A.FieldByName('CH0ATY14').AsString :=edtCH0ATY14.Text ;
  FCDSCh0A.FieldByName('CH0ATY20').AsString :=  edtCH0P11.Text;
  FCDSCh0A.FieldByName('CH0ATY21').AsString := edtCH0P13.Text ;
  
  FCDSCh0A.Post;

  //新生儿
  if FCDSChWT47.RecordCount =0 then
    FCDSChWT47.Append
  else
    FCDSChWT47.Edit;
  FCDSChWT47.FieldByName('CHYear').AsString := FChYear;
  FCDSChWT47.FieldByName('WT4701').AsString := FCh0A01;
  with clientdtXSER do
  begin
    First;
    while not Eof do
    begin
      xh := clientdtXSER.FieldByName('xh').AsString;
      FCDSChWT47.Edit;
      FCDSChWT47.FieldByName('FM_XB'+xh).AsString := FieldByName('XB').AsString;
      FCDSChWT47.FieldByName('FM_PF'+xh).AsString := FieldByName('PF').AsString;
      FCDSChWT47.FieldByName('FM_SC'+xh).AsString := FieldByName('SC').AsString;
      FCDSChWT47.FieldByName('FM_Weight'+xh).AsString := FieldByName('TZ').AsString;
      FCDSChWT47.FieldByName('FM_RSJJ'+xh).AsString := FieldByName('CCQK').AsString;
      FCDSChWT47.FieldByName('FM_CYQK'+xh).AsString := FieldByName('CYQK').AsString;
      FCDSChWT47.FieldByName('FM_CSRQ'+xh).AsString := FieldByName('CSSJ').AsString;
      FCDSChWT47.FieldByName('FM_SWRQ'+xh).AsString := FieldByName('SWSJ').AsString;
      FCDSChWT47.FieldByName('FM_SWYY'+xh).AsString := FieldByName('SWYY').AsString;
      FCDSChWT47.FieldByName('FM_YYGR'+xh).AsString := FieldByName('YYGR').AsString;
      FCDSChWT47.FieldByName('FM_JB'+xh).AsString := FieldByName('JB').AsString;
      Next;
    end;
  end;
  FCDSCh0E.Edit;
  FCDSCh0E.FieldByName('CHYear').AsString := FChYear;
  FCDSCh0E.FieldByName('CH0E01').AsString := FCh0A01;
  FCDSCh0R.Edit;
  FCDSCh0R.FieldByName('CHYear').AsString := FChYear;
  FCDSCh0R.FieldByName('CH0R01').AsString := FCh0A01;


  FCDSChWT47.Edit;
  FCDSChWT47.FieldByName('CHYear').AsString := FChYear;
  FCDSChWT47.FieldByName('WT4701').AsString := FCh0A01;

  aSaveCDS(FCDSCh0A);
  aSaveCDS(FCDSCh0E);
  aSaveCDS(FCDSCh0R);
  aSaveCDS(FCDSChWT47);
  FIsAppend := False;
end;

procedure TFrmTYFY.SetBaSetInfo(aBaSetInfo: TBaSetInfo);
begin
  FBaSetInfo := aBaSetInfo;
end;

end.
