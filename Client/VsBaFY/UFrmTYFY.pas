unit UFrmTYFY;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, AdvGroupBox, DBGridEhGrouping, GridsEh, DBGridEh,
  DB, DBClient, UDlClientDataset,UGFun,UGVar,UVsMidClassList,UCommon,
  AdvFontCombo,UPVar,StrUtils;

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
    lbl10: TLabel;
    lbl12: TLabel;
    lbl14: TLabel;
    lbl16: TLabel;
    lbl18: TLabel;
    lbl20: TLabel;
    AdvGroupBox4: TAdvGroupBox;
    dbgrdhICU: TDBGridEh;
    AdvGroupBox5: TAdvGroupBox;
    lbl22: TLabel;
    lbl24: TLabel;
    lbl26: TLabel;
    lbl28: TLabel;
    edtCH0AYN05: TEdit;
    lbl25: TLabel;
    lbl30: TLabel;
    edtCH0AYN02: TEdit;
    lbl31: TLabel;
    lbl32: TLabel;
    lbl34: TLabel;
    lbl36: TLabel;
    lbl38: TLabel;
    lbl40: TLabel;
    lbl42: TLabel;
    AdvGroupBox6: TAdvGroupBox;
    lbl44: TLabel;
    lbl46: TLabel;
    lbl48: TLabel;
    lbl50: TLabel;
    lbl52: TLabel;
    lbl54: TLabel;
    lbl56: TLabel;
    lbl57: TLabel;
    lbl59: TLabel;
    lbl61: TLabel;
    lbl63: TLabel;
    lbl65: TLabel;
    lbl67: TLabel;
    AdvGroupBox7: TAdvGroupBox;
    lbl69: TLabel;
    lbl71: TLabel;
    edtCH0AQ1: TEdit;
    lbl72: TLabel;
    lbl73: TLabel;
    lbl75: TLabel;
    lbl77: TLabel;
    lbl79: TLabel;
    lbl81: TLabel;
    AdvGroupBox8: TAdvGroupBox;
    lbl83: TLabel;
    lbl85: TLabel;
    lbl87: TLabel;
    edtCH0AYN08: TEdit;
    lbl88: TLabel;
    lbl90: TLabel;
    edtCH0AYNAA: TEdit;
    AdvGroupBox9: TAdvGroupBox;
    lbl91: TLabel;
    lbl93: TLabel;
    edttCH0A46: TEdit;
    lbl94: TLabel;
    lbl95: TLabel;
    edttCH0A47: TEdit;
    lbl96: TLabel;
    lbl97: TLabel;
    lbl98: TLabel;
    lbl99: TLabel;
    lbl100: TLabel;
    lbl101: TLabel;
    lbl102: TLabel;
    lbl103: TLabel;
    lbl104: TLabel;
    lbl105: TLabel;
    lbl107: TLabel;
    lbl109: TLabel;
    lbl111: TLabel;
    edtCH0ATY12: TEdit;
    lbl112: TLabel;
    lbl114: TLabel;
    AdvGroupBox10: TAdvGroupBox;
    dsss: TDataSource;
    clientdtDLCDS: TClientDataSet;
    dsICU: TDataSource;
    cbbCH0AYNB2: TAdvOfficeComboBox;
    dldtXSER: TDlClientDataset;
    dsXSER: TDataSource;
    dldtSS: TDlClientDataset;
    dbgrdhXSE: TDBGridEh;
    clientdtXSER: TClientDataSet;
    cbbCH0ATY18: TAdvOfficeComboBox;
    cbbCH0ATY19: TAdvOfficeComboBox;
    cbbCH0EZ13: TAdvOfficeComboBox;
    cbbCH0ESC00: TAdvOfficeComboBox;
    cbbCH0EZ14: TAdvOfficeComboBox;
    cbbCH0EZ19: TAdvOfficeComboBox;
    cbbCH0EZ15: TAdvOfficeComboBox;
    cbbCH0ATY01: TAdvOfficeComboBox;
    cbbCH0AYN01: TAdvOfficeComboBox;
    cbbCH0AYN04: TAdvOfficeComboBox;
    cbbCH0ATY04: TAdvOfficeComboBox;
    cbbCH0ATY05: TAdvOfficeComboBox;
    cbbCH0AYN06: TAdvOfficeComboBox;
    cbbCH0AYN03: TAdvOfficeComboBox;
    cbbCH0ATY02: TAdvOfficeComboBox;
    cbbCH0ATY06: TAdvOfficeComboBox;
    cbbCh0EZ03: TAdvOfficeComboBox;
    cbbCH0AYNA8: TAdvOfficeComboBox;
    cbbCH0AYNA7: TAdvOfficeComboBox;
    cbbCH0AYNB0: TAdvOfficeComboBox;
    cbbCH0ATY20: TAdvOfficeComboBox;
    cbbCH0ATY21: TAdvOfficeComboBox;
    cbbCh0ANQ: TAdvOfficeComboBox;
    cbbCH0AYN07: TAdvOfficeComboBox;
    cbbCH0AYN09: TAdvOfficeComboBox;
    cbbCH0ATY10: TAdvOfficeComboBox;
    cbbCH0ATY11: TAdvOfficeComboBox;
    cbbCH0ATY13: TAdvOfficeComboBox;
    cbbCH0ATY14: TAdvOfficeComboBox;
    cbbCH0ATY09: TAdvOfficeComboBox;
    cbbCH0ATY22: TAdvOfficeComboBox;
    cbbCH0ATY08: TAdvOfficeComboBox;
    cbbCH0ATY07: TAdvOfficeComboBox;
    cbbCH0ATY17: TAdvOfficeComboBox;
    cbbCH0A54: TAdvOfficeComboBox;
    cbbCH0A57: TAdvOfficeComboBox;
    cbbCH0ATY15: TAdvOfficeComboBox;
    cbbCH0A58: TAdvOfficeComboBox;
    cbbCH0ATY16: TAdvOfficeComboBox;
    cbbCH0AYNA9: TAdvOfficeComboBox;
    cbbCH0AYNB1: TAdvOfficeComboBox;
    cbbCH0A43: TAdvOfficeComboBox;
    cbbCH0A44: TAdvOfficeComboBox;
    cbbCH0ACD: TAdvOfficeComboBox;
    cbbCH0AC1: TAdvOfficeComboBox;
    cbbCH0AC2: TAdvOfficeComboBox;
    cbbCh0AQ6: TAdvOfficeComboBox;
    cbbqj: TAdvOfficeComboBox;
    procedure dbgrdhICUKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgrdhSSKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgrdhXSEKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dsICUStateChange(Sender: TObject);
    procedure dbgrdhXSEColumns7UpdateData(Sender: TObject; var Text: string;
      var Value: Variant; var UseText, Handled: Boolean);
    procedure dbgrdhXSEColumns9UpdateData(Sender: TObject; var Text: string;
      var Value: Variant; var UseText, Handled: Boolean);
    procedure cbbqjChange(Sender: TObject);
    procedure cbbCH0AYN04Change(Sender: TObject);
    procedure cbbCH0AYN01Change(Sender: TObject);
    procedure cbbCH0AYNA8Change(Sender: TObject);
    procedure cbbCH0AYNB0Change(Sender: TObject);
    procedure cbbCH0A57Change(Sender: TObject);
    procedure cbbCH0A58Change(Sender: TObject);
    procedure cbbCH0A54Change(Sender: TObject);
    procedure cbbCH0ATY08Change(Sender: TObject);
    procedure cbbCh0ANQChange(Sender: TObject);
    procedure cbbCH0AYN07Change(Sender: TObject);
    procedure cbbCH0AYN09Change(Sender: TObject);
    procedure cbbCH0ATY11Change(Sender: TObject);
  private
    { Private declarations }
    FBaSetInfo: TBaSetInfo;
    FChYear,FCh0A01,FCh0A00:String;
    FIsAppend:Boolean;
    FSetControlHint:TSetSbSimpleText;
    FCDSCh0A,FCDSCh0E,FCDSCh0R,FCDSChWT47:TDlClientDataset;
    OperaXSE:Boolean; //可以操作新生儿
    ///校验时间
    function CheckSJ(const SJ:TDateTime):Boolean;
    procedure BindCmbItemIndex(const Flag:Integer=0);
    function SetEnable(compent: TAdvOfficeComboBox):Boolean;
  public
    { Public declarations }
    Constructor Create(Aowner:TComponent);Override;
    procedure SetBaSetInfo(aBaSetInfo:TBaSetInfo);
    procedure GetValueByCh0P01(Chyear,Ch0A01,Ch0A00:string;SetControlHint: TSetSbSimpleText;IsAppend:Boolean;CDSCh0A,DLCH0E,DLCH0R:TDlClientDataset);
    Procedure SaveValue;
    Property  SetControlHint:TSetSbSimpleText Read FSetControlHint Write FSetControlHint;
    /// <summary>
    /// 判断新生儿列表是否操作
    /// </summary>
    function SetXSEState:Boolean;

  end;

implementation
   uses UMidProxy,UgShare;

{$R *.dfm}

{ TFrmTYFY }

procedure TFrmTYFY.BindCmbItemIndex(const Flag:Integer=0);
   procedure getAndSet(dlclient:TDlClientDataset;cbbtmp:TAdvOfficeComboBox;Flag:Integer=0);
   var
     FieldName:string;
     itemindex:Integer;
     FieldDM:string;
     itemValue:string;
   begin
     FieldName := Copy(cbbtmp.Name,4,Length(cbbtmp.Name)-3);
     if dlclient.IsEmpty then
       Exit;
     case Flag of
       0: //赋值
       begin
         if not dlclient.Active  then Exit;

         if cbbtmp.Tag =9 then
         begin
           if dlclient.FieldByName(FieldName).AsString <>'' then
           begin
              if dlclient.FieldByName(FieldName).AsString='2' then
                FieldDM := '1'
              else
                FieldDM := '2';
             itemindex := GetDmIndexOFCombobox(FieldDM,cbbtmp);
           end
           else
             itemindex := -1;
         end
         else
          itemindex:=GetDmIndexOFCombobox(dlclient.FieldByName(FieldName).AsString,cbbtmp);
         cbbtmp.ItemIndex := itemindex;

       end;
       1: //取值
       begin
         try
           if cbbtmp.Tag =9 then  //是否情况
           begin
             itemValue := GetDmOFCombobox(cbbtmp);
             if itemValue ='2' then
                itemValue := '1'
             else if itemValue ='1' then
                itemValue := '2';

           end
           else
             itemValue := GetDmOFCombobox(cbbtmp);
           dlclient.Edit;
           dlclient.FieldByName(FieldName).AsString := itemValue;
         except
           on ex:Exception do
           begin
             WriteErrorLog(ex.Message);
           end;

         end;
       end;  
     end;

   end;
var
  i,j:Integer;
  cbbField:TAdvOfficeComboBox;
  FieldName:string;
begin
  for I := 0 to ScrollBox1.ControlCount - 1 do
  begin
    if ScrollBox1.Controls[i] is TAdvGroupBox then
    begin
      for j := 0 to (ScrollBox1.Controls[i] as TAdvGroupBox).ControlCount - 1 do
      begin
        if (ScrollBox1.Controls[i] as TAdvGroupBox).Controls[j] is TAdvOfficeComboBox then
        begin
          cbbField := (ScrollBox1.Controls[i] as TAdvGroupBox).Controls[j] as TAdvOfficeComboBox;
          FieldName := Copy(cbbField.Name,4,Length(cbbField.Name)-3);
          case Flag of
             0:  //赋值
             begin
                if Assigned(FCDSCh0A.FindField(FieldName)) then
                begin
                  getAndSet(FCDSCh0A,cbbField);
                end
                else if Assigned(FCDSCh0E.FindField(FieldName)) then
                begin
                  getAndSet(FCDSCh0E,cbbField);
                end
                else if  Assigned(FCDSCh0R.FindField(FieldName)) then
                begin
                  getAndSet(FCDSCh0R,cbbField);
                end;
             end;
             1: //取值
             begin
                WriteDeBug(FieldName);
                if Assigned(FCDSCh0A.FindField(FieldName)) then
                begin
                  getAndSet(FCDSCh0A,cbbField,1);
                end
                else if Assigned(FCDSCh0E.FindField(FieldName)) then
                begin
                  getAndSet(FCDSCh0E,cbbField,1);
                end
                else if  Assigned(FCDSCh0R.FindField(FieldName)) then
                begin
                  getAndSet(FCDSCh0R,cbbField,1);
                end;
             end;  
          end;

        end;

      end;
    end;
  end;
end;

procedure TFrmTYFY.cbbCH0A54Change(Sender: TObject);
begin
  if not SetEnable(cbbCH0A54) then
  begin
    edtCH0AQ1.Text := '';
    edtCH0AQ1.Enabled := False;
  end
  else
    edtCH0AQ1.Enabled := True;
end;

procedure TFrmTYFY.cbbCH0A57Change(Sender: TObject);
begin
  if not SetEnable(cbbCH0A57) then
  begin
    cbbCH0ATY15.Enabled := False;
  end
  else
    cbbCH0ATY15.Enabled := True;
end;

procedure TFrmTYFY.cbbCH0A58Change(Sender: TObject);
begin
  if not SetEnable(cbbCH0A58) then
  begin
    cbbCH0ATY16.ItemIndex := -1;
    cbbCH0ATY16.Enabled := False;
  end
  else
    cbbCH0ATY16.Enabled := True;
end;

procedure TFrmTYFY.cbbCh0ANQChange(Sender: TObject);
begin

  if not SetEnable(cbbCh0ANQ) then
  begin
    cbbCH0AYN07.ItemIndex := -1;
    cbbCH0AYN07.Enabled := False;
  end
  else
    cbbCH0AYN07.Enabled := True;
end;

procedure TFrmTYFY.cbbCH0ATY08Change(Sender: TObject);
begin
  if not SetEnable(cbbCH0ATY08) then
  begin
     cbbCH0ATY09.ItemIndex := -1;
     cbbCH0ATY09.Enabled := False;
  end
  else
    cbbCH0ATY09.Enabled := True;
end;

procedure TFrmTYFY.cbbCH0ATY11Change(Sender: TObject);
begin
  if SetEnable(cbbCH0ATY11) then
  begin
    edtCH0ATY12.Text:='';
    edtCH0ATY12.Enabled :=False;
  end
  else
    edtCH0ATY12.Enabled :=True;
end;

procedure TFrmTYFY.cbbCH0AYN01Change(Sender: TObject);
begin
  if not SetEnable(cbbCH0AYN01) then
  begin
    edtCH0AYN02.Text := '';
    cbbCH0AYN03.ItemIndex := -1;
    edtCH0AYN02.Enabled := False;
    cbbCH0AYN03.Enabled := False;
  end
  else
  begin
    edtCH0AYN02.Enabled := True;
    cbbCH0AYN03.Enabled := True;
  end;
end;

procedure TFrmTYFY.cbbCH0AYN04Change(Sender: TObject);
begin
  if not SetEnable(cbbCH0AYN04) then
  begin
    edtCH0AYN05.Text := '';
    cbbCH0AYN06.ItemIndex := -1;
    edtCH0AYN05.Enabled := False;
    cbbCH0AYN06.Enabled := False;
  end
  else
  begin
    edtCH0AYN05.Enabled := True;
    cbbCH0AYN06.Enabled := True;
  end;
end;

procedure TFrmTYFY.cbbCH0AYN07Change(Sender: TObject);
begin
  if SetEnable(cbbCH0AYN07) then
  begin
    edtCH0AYN08.Text := '';
    edtCH0AYN08.Enabled :=False;
  end
  else
    edtCH0AYN08.Enabled :=true;
end;

procedure TFrmTYFY.cbbCH0AYN09Change(Sender: TObject);
begin
  if not SetEnable(cbbCH0AYN09) then
  begin
    edtCH0AYNAA.Text :='';
    edtCH0AYNAA.Enabled :=False;
  end
  else
    edtCH0AYNAA.Enabled := True;
end;

procedure TFrmTYFY.cbbCH0AYNA8Change(Sender: TObject);
begin
  if not SetEnable(cbbCH0AYNA8) then
  begin
    cbbCH0AYNA9.ItemIndex := -1;
    cbbCH0AYNA9.Enabled := False;
  end
  else
    cbbCH0AYNA9.Enabled := True;
end;

procedure TFrmTYFY.cbbCH0AYNB0Change(Sender: TObject);
begin
  if not SetEnable(cbbCH0AYNB0) then
  begin
    cbbCH0AYNB1.ItemIndex := -1;
    cbbCH0AYNB1.Enabled := False;
    cbbCH0AYNB2.Text := '';
    cbbCH0AYNB2.Enabled := False;
  end
  else
  begin
    cbbCH0AYNB1.Enabled := True;
    cbbCH0AYNB2.Enabled := True;
  end;

end;

procedure TFrmTYFY.cbbqjChange(Sender: TObject);
begin
  if cbbqj.ItemIndex =0 then      //无
  begin
    edttCH0A46.Text :='';
    edttCH0A46.Enabled := False;
    edttCH0A47.Text := '';
    edttCH0A47.Enabled := False;
     
  end
  else if  cbbqj.ItemIndex =1 then
  begin
    edttCH0A46.Enabled := True;
    edttCH0A47.Enabled := True;
  end;
end;

function TFrmTYFY.CheckSJ(const SJ:TDateTime): Boolean;
var
  ryrq,cyrq:TDateTime;
begin
  Result := False;
  ryrq := StrToDateTime(Format('%s %s',[FCDSCh0A.FieldByName('CH0A24').AsString,
            FCDSCh0A.FieldByName('CH0A24_SJ').AsString]));
  cyrq := StrToDateTime(Format('%s %s',[FCDSCh0A.FieldByName('CH0A27').AsString,
            FCDSCh0A.FieldByName('CH0A27_SJ').AsString]));
  if (SJ < ryrq) or (SJ > cyrq) then
  begin
    Result :=True;
  end;
end;
/// <summary>
/// 填充有无、是否combobox
/// </summary>
/// <param name="Compent">控件</param>
/// <param name="Flag">字段标识，默认是否</param>
procedure FillSFCombobox(const Compent:TAdvOfficeComboBox;Flag:Integer=0);
var
  field:string;
begin
  case Flag of
     0:     //是否
     begin
       field := 'CASE WHEN id=2 THEN 1 ELSE 2 END id,sf';
     end;
     1:  //有无
     begin
       field := 'id,yw';
     end;
  end;
  FillCombobox(Format('Select %s From VsZhdm_12 Where ISNULL(sf,^^)<>^^ ORDER BY id ',[field]),'ID',Copy(field,Pos(',',field)+1,2),Compent);
  Compent.ItemIndex := -1;
end;

constructor TFrmTYFY.Create(Aowner: TComponent);
begin
  inherited;
  FillCombobox('Select id,FallBedReason From VsZhdm_12 Where ISNULL(FallBedReason,^^)<>^^','ID','FallBedReason',cbbCH0AYNB2);
  FillCombobox('Select id,Jsyczbysj From VsZhdm_12 Where ISNULL(Jsyczbysj,^^)<>^^','ID','Jsyczbysj',cbbCH0ATY18);
  FillCombobox('Select id,zysftyjb From VsZhdm_12 Where ISNULL(zysftyjb,^^)<>^^','ID','zysftyjb',cbbCH0ATY19);
  FillCombobox('select id,ycfq from VsZhdm_12 Where ISNULL(ycfq,^^)<>^^','ID','ycfq',cbbCH0AYNA9);     //压疮分期
  FillCombobox('select id,BedSH from VsZhdm_12 Where ISNULL(BedSH,^^)<>^^ and id >0','id','BedSH',cbbCH0AYNB1);  //跌倒伤害
  FillCombobox('select dm,fhmc from VsZhdm Where ISNULL(fhmc,^^)<>^^','dm','fhmc',cbbCH0A43);
  FillCombobox('select dm,fhmc from VsZhdm Where ISNULL(fhmc,^^)<>^^','dm','fhmc',cbbCH0A44);
  FillCombobox('select dm,fhmc from VsZhdm Where ISNULL(fhmc,^^)<>^^','dm','fhmc',cbbCH0AC1);
  FillCombobox('select dm,fhmc from VsZhdm Where ISNULL(fhmc,^^)<>^^','dm','fhmc',cbbCh0AQ6);
  FillCombobox('select dm,fhmc from VsZhdm Where ISNULL(fhmc,^^)<>^^','dm','fhmc',cbbCH0ACD);
  FillCombobox('select dm,fhmc from VsZhdm Where ISNULL(fhmc,^^)<>^^','dm','fhmc',cbbCH0AC2);
  cbbCH0AYNB2.ItemIndex :=-1;
  cbbCH0ATY18.ItemIndex := -1;
  cbbCH0ATY19.ItemIndex := -1;
  cbbCH0AYNA9.ItemIndex := -1;
  cbbCH0AYNB1.ItemIndex := -1;
  cbbCH0A43.ItemIndex :=-1;
  cbbCH0A44.ItemIndex := -1;
  cbbCH0AC1.ItemIndex := -1;
  cbbCh0AQ6.ItemIndex := -1;
  cbbCH0ACD.ItemIndex := -1;
  cbbCH0AC2.ItemIndex := -1;
  FillSFCombobox(cbbCH0ESC00);
  FillSFCombobox(cbbCH0EZ14);
  FillSFCombobox(cbbCH0ATY01);
  FillSFCombobox(cbbCH0AYN01);
  FillSFCombobox(cbbCH0ATY04);
  FillSFCombobox(cbbCH0ATY05);
  FillSFCombobox(cbbCH0AYN06);
  FillSFCombobox(cbbCH0AYN03);
  FillSFCombobox(cbbCH0ATY02);
  FillSFCombobox(cbbCH0ATY06);
  FillSFCombobox(cbbCh0EZ03);
  FillSFCombobox(cbbCH0AYNA8);
  FillSFCombobox(cbbCH0AYNA7);
  FillSFCombobox(cbbCH0AYNB0);
  FillSFCombobox(cbbCH0ATY20);
  FillSFCombobox(cbbCH0ATY21);
  FillSFCombobox(cbbCh0ANQ);
  FillSFCombobox(cbbCH0AYN04);
  FillSFCombobox(cbbCH0AYN07);
  FillSFCombobox(cbbCH0AYN09);
  FillSFCombobox(cbbCH0ATY10);
  FillSFCombobox(cbbCH0ATY11);
  FillSFCombobox(cbbCH0ATY13);
  FillSFCombobox(cbbCH0ATY14);
  FillSFCombobox(cbbCH0EZ13);
  FillSFCombobox(cbbCH0EZ19,1);
  FillSFCombobox(cbbCH0EZ15,1);
  FillSFCombobox(cbbCH0A57,1);
  FillSFCombobox(cbbCH0ATY15,1);
  FillSFCombobox(cbbCH0A58,1);
  FillSFCombobox(cbbCH0ATY16,1);
  FillSFCombobox(cbbCH0ATY09,1);
  FillSFCombobox(cbbCH0ATY22,1);
  FillSFCombobox(cbbCH0ATY08,1);
  FillSFCombobox(cbbCH0ATY07,1);
  FillSFCombobox(cbbCH0ATY17,1);
  FillSFCombobox(cbbCH0A54,1);
  FillSFCombobox(cbbqj,1);

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

procedure TFrmTYFY.dbgrdhXSEColumns7UpdateData(Sender: TObject;
  var Text: string; var Value: Variant; var UseText, Handled: Boolean);
begin
  if CheckSJ(VarToDateTime(Value)) then
  begin
    ShowMsgSure('出生时间只能在入院时间和出院时间之内');
    Handled :=True;
  end;
end;

procedure TFrmTYFY.dbgrdhXSEColumns9UpdateData(Sender: TObject;
  var Text: string; var Value: Variant; var UseText, Handled: Boolean);
begin
  if CheckSJ(VarToDateTime(Value)) then
  begin
    ShowMsgSure('死亡时间只能在入院时间和出院时间之内');
    Handled := True;
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



procedure TFrmTYFY.GetValueByCh0P01(Chyear, Ch0A01, Ch0A00: string;
  SetControlHint: TSetSbSimpleText; IsAppend: Boolean; CDSCh0A,
  DLCH0E,DLCH0R: TDlClientDataset);
//  const
//    SQLCH0E='Select *,QkYh=(Select Qkmc From VsZhdm Where Dm=CH0E12)+^/^+'+
//                              '              (Select YhQk From VsZhdm Where Dm=CH0E13),'+
//                              '       Mzmc,SsMc,VSZD_SSBW.DMMC CH0EE4_MC,VsSJZD.Dmmc CH0ESC10_MC '+
//                              '  From VsCh0E '+
//                              '       Left Join VsNarcosis On CH0E10=VsNarcosis.Dm'+
//                              '       Left Join VsUseIccm On Ch0E08=VsUseIccm.SSm '+
//                              '       Left Join VSZD_SSBW On CH0EE4=VSZD_SSBW.DM '+
//                              '       Left Join VsSJZD On DMKind=^SSBF^ And CH0ESC10=VsSJZD.Dm '+
//                              ' Where ChYear=^%1:s^ And Ch0E01=^%0:s^';
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
  BindCmbItemIndex;

  
  if not FCDSCh0A.IsEmpty then
  begin
  //合理用药
    edtCH0AYN05.Text := IntToStr(FCDSCh0A.FieldByName('CH0AYN05').AsInteger);
    edtCH0AYN02.Text := IntToStr(FCDSCh0A.FieldByName('CH0AYN02').AsInteger);

    //医院感染
    edtCH0AQ1.Text     :=   FCDSCh0A.FieldByName('CH0AQ1').AsString;

    //临床路径
    edtCH0AYN08.Text := FCDSCh0A.FieldByName('CH0AYN08').AsString;
    edtCH0AYNAA.Text := FCDSCh0A.FieldByName('CH0AYNAA').AsString;

    //其他
    if FCDSCh0A.FieldByName('CH0A46').AsInteger =0 then
    begin
       cbbqj.ItemIndex := 0;
      edttCH0A46.Text := '0';
      edttCH0A47.Text :='0';
    end
    else
    begin
      cbbqj.ItemIndex := 1;
      edttCH0A46.Text := FCDSCh0A.FieldByName('CH0A46').AsString;
      edttCH0A47.Text := FCDSCh0A.FieldByName('CH0A47').AsString;
    end;
    edtCH0ATY12.Text := FCDSCh0A.FieldByName('CH0ATY12').AsString;
  end;

  cbbCH0AYN04Change(nil);
  cbbCH0AYN01Change(nil);
  cbbCH0AYNA8Change(nil);
  cbbCH0AYNB0Change(nil);
  cbbCH0A57Change(nil);
  cbbCH0A58Change(nil);
  cbbCH0A54Change(nil);
  cbbCH0ATY08Change(nil);
  cbbCh0ANQChange(nil);
  cbbCH0AYN07Change(nil);
  cbbCH0AYN09Change(nil);
  cbbCH0ATY11Change(nil);

  //新生儿
  OperaXSE := SetXSEState;
  if not OperaXSE then Exit;
  sqltext := 'select * from %0:s where CHYear=^%1:s^ and WT4701 =^%2:s^';
  FCDSChWT47 :=TDlClientDataset.Create(nil);
  FCDSChWT47.MidClassName :=EuVsWt47;
  FCDSChWT47.Mid_Open(Format(sqltext,['VsWt47_1',Chyear,Ch0A01]));
  if FCDSChWT47.IsEmpty then
  begin
    cdttemp := TClientDataSet.Create(nil);
    AutoFree(cdttemp);
    TMidProxy.SqlOpen(Format(sqltext,['VsCH_Wt47_1',Chyear,Ch0A01]),cdttemp);
    if not cdttemp.IsEmpty then
    begin
      for I := 0 to FCDSChWT47.Fields.Count - 1 do
      begin
        FCDSChWT47.Edit;
         if FCDSChWT47.FieldDefList[i].Name = 'WT4701' then
          FCDSChWT47.FieldByName(FCDSChWT47.FieldDefList[i].Name).AsString := Ch0A01
        else
          FCDSChWT47.FieldByName(FCDSChWT47.FieldDefList[i].Name).AsString := cdttemp.FieldByName(FCDSChWT47.FieldDefList[i].Name).AsString;
        FCDSChWT47.Post;
      end;

    end;
  end;   
  sqltext := '';

  for I := 1 to 4 do
  begin
     sqltext := sqltext+format('select %d xh,^%s^ XB,CONVERT(int,IsNull(^%s^,0)) '
       +'PF,CONVERT(int,IsNull(^%s^,0)) SC,CONVERT(int,IsNull(^%s^,0)) TZ,^%s^ CCQK,'
       +'CONVERT(int,IsNull(^%s^,0)) CYQK,CONVERT(DATETIME,IsNull(^%s^,^2015-01-01^),120) CSSJ,'
       +'CONVERT(varchar(20),^%s^) JB,CONVERT(DATETIME,^%s^,120) SWSJ,CONVERT(varchar(50),'
       +'^%s^) SWYY,^%s^ YYGR'
       ,[i,FCDSChWT47.FieldByName('FM_XB'+inttostr(i)).AsString,
       FCDSChWT47.FieldByName('FM_PF'+inttostr(i)).AsString,
       FCDSChWT47.FieldByName('FM_SC'+inttostr(i)).AsString,
       FCDSChWT47.FieldByName('FM_Weight'+inttostr(i)).AsString,
       FCDSChWT47.FieldByName('FM_RSJJ'+inttostr(i)).AsString,
       FCDSChWT47.FieldByName('FM_CYQK'+inttostr(i)).AsString,
       FCDSChWT47.FieldByName('FM_CSRQ'+inttostr(i)).AsString,
       FCDSChWT47.FieldByName('FM_JB'+inttostr(i)).AsString,
       FCDSChWT47.FieldByName('FM_SWRQ'+inttostr(i)).AsString,
       FCDSChWT47.FieldByName('FM_SWYY'+inttostr(i)).AsString,
       FCDSChWT47.FieldByName('FM_YYGR'+inttostr(i)).AsString]);
    if i<4 then
     sqltext := sqltext +' union ';
  end;
  TMidProxy.SqlOpen(sqltext,clientdtXSER);
  with clientdtXSER do
  begin
    First;
    while not Eof do
    begin
      if FieldByName('CSSJ').AsString = '1900-01-01' then
      begin
        Edit;
        FieldByName('CSSJ').AsString := '';
        Post;
      end;
      if FieldByName('SWSJ').AsString = '1900-01-01' then
      begin
        Edit;
        FieldByName('SWSJ').AsString := '';
        Post;
      end;
      if FieldByName('PF').AsString = '0' then
      begin
        Edit;
        FieldByName('PF').AsString := '';
        Post;
      end;
      if FieldByName('TZ').AsString = '0' then
      begin
        Edit;
        FieldByName('TZ').AsString := '';
        Post;
      end;
      if FieldByName('SC').AsString = '0' then
      begin
        Edit;
        FieldByName('SC').AsString := '';
        Post;
      end;
       if FieldByName('CCQK').AsString = '0' then
      begin
        Edit;
        FieldByName('CCQK').AsString := '';
        Post;
      end;
       if FieldByName('CYQK').AsString = '0' then
      begin
        Edit;
        FieldByName('CYQK').AsString := '';
        Post;
      end;
      
      Next ;
    end;
  end;
  dsXSER.DataSet := clientdtXSER;
  dbgrdhXSE.DataSource := dsXSER; 
end;

function TFrmTYFY.SetEnable(compent: TAdvOfficeComboBox):Boolean;
var
  dm: string;
begin
  Result := False;
  dm := GetDmOFCombobox(compent);
  if dm <> '' then
  begin
    Result := dm ='2';
  end;
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
  BindCmbItemIndex(1);
  FCDSCh0A.Edit;
  FCDSCh0A.FieldByName('CH0AYN05').AsString :=edtCH0AYN05.Text ;
  FCDSCh0A.FieldByName('CH0AYN02').AsString :=edtCH0AYN02.Text ;
  FCDSCh0A.FieldByName('CH0AQ1').AsString :=edtCH0AQ1.Text;
  FCDSCh0A.FieldByName('CH0AYN08').AsString:=  edtCH0AYN08.Text;
  FCDSCh0A.FieldByName('CH0AYNAA').AsString:= edtCH0AYNAA.Text;
  FCDSCh0A.FieldByName('CH0A46').AsString := edttCH0A46.Text ;
  FCDSCh0A.FieldByName('CH0A47').AsString := edttCH0A47.Text;
  FCDSCh0A.FieldByName('CH0ATY12').AsString :=edtCH0ATY12.Text ;

  if not FCDSCh0E.IsEmpty then
  begin
    FCDSCh0E.Edit;
    FCDSCh0E.FieldByName('CHYear').AsString := FChYear;
    FCDSCh0E.FieldByName('CH0E01').AsString := FCh0A01;
  end;

  if not FCDSCh0R.IsEmpty then
  begin
    FCDSCh0R.Edit;
    FCDSCh0R.FieldByName('CHYear').AsString := FChYear;
    FCDSCh0R.FieldByName('CH0R01').AsString := FCh0A01;
  end;



  //新生儿
  
  if OperaXSE then
  begin
    with clientdtXSER do
    begin
      First;
      while not Eof do
      begin
        xh := clientdtXSER.FieldByName('xh').AsString;
        if (FieldByName('XB').AsString <> '') and (FieldByName('CSSJ').AsString<>'') then
        begin
          if FCDSChWT47.RecordCount =0 then
            FCDSChWT47.Append
          else
            FCDSChWT47.Edit;
          FCDSChWT47.FieldByName('CHYear').AsString := FChYear;
          FCDSChWT47.FieldByName('WT4701').AsString := FCh0A01;
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
        end;
        Next;
      end;
    end;
    aSaveCDS(FCDSChWT47);
  end;
  
  aSaveCDS(FCDSCh0A);
  aSaveCDS(FCDSCh0E);
  aSaveCDS(FCDSCh0R);

  FIsAppend := False;
end;

procedure TFrmTYFY.SetBaSetInfo(aBaSetInfo: TBaSetInfo);
begin
  FBaSetInfo := aBaSetInfo;
end;

function TFrmTYFY.SetXSEState:Boolean;
var
 kmdm,kmdm1:string;
begin
  Result := False;
  if not FCdsCh0A.Active or(FCdsCh0A.IsEmpty) then
    Exit;
  Kmdm:=DmToMc(FCdsCh0A.FieldByName('Ch0A23').AsString,'Select SoKm From VsSoffice Where SoDm=^%s^');
  // 以前只判断了出院科室，判断不全，现加入 入院科室的判断
  Kmdm1:=DmToMc(FCdsCh0A.FieldByName('Ch0A21').AsString,'Select SoKm From VsSoffice Where SoDm=^%s^');
  IF (FCdsCh0A.FieldByName('Ch0A03').AsString='2') And
     ((Leftstr(Kmdm,2)='05') Or (Leftstr(Kmdm,2)='06') or (Leftstr(Kmdm1,2)='05') Or (Leftstr(Kmdm1,2)='06')) Then
  Begin
    dbgrdhXSE.Enabled :=True;
    Result := True;
  End
  Else
  begin
    dbgrdhXSE.Enabled :=False;
    
  end;


end;

end.
