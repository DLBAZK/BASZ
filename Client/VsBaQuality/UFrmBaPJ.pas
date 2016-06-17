
 /// <summary>
 /// 病案终末评价功能
 /// </summary>
 /// <author>JDL</author>
/// <date> 2016-05-22 </date>
unit UFrmBaPJ;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFrmSuiDBForm, DB, ActnList, DBClient, UDlClientDataset, DosMove,
  AdvPanel, AdvAppStyler, AdvToolBar, AdvToolBarStylers, AdvOfficeStatusBar,
  AdvOfficeStatusBarStylers, ExtCtrls, AdvSplitter, StdCtrls, SUIEdit,
  EllipsLabel, TFlatGroupBoxUnit, AdvGlowButton, DBGridEhGrouping, GridsEh,
  DBGridEh, TFlatPanelUnit, DBCtrls, SUIDBCtrls, ComCtrls, AdvDateTimePicker,
  AdvOfficeButtons, UDLAdvCheckBox;

type
  TFrmBaPJ = class(TFrmSuiDBForm)
    AdvPanel2: TAdvPanel;
    AdvSplitter1: TAdvSplitter;
    FlatGroupBox1: TFlatGroupBox;
    AdvbtnActLocate: TAdvGlowButton;
    dbgrdhBaList: TDBGridEh;
    FlatPanel1: TFlatPanel;
    FlatPanel2: TFlatPanel;
    AdvbtnacSave: TAdvGlowButton;
    dbgrdhPJDetail: TDBGridEh;
    clientdtPJDetail: TClientDataSet;
    dsPJDetail: TDataSource;
    AdvbtnClose: TAdvGlowButton;
    EllipsLabel2: TEllipsLabel;
    suicbcbbLB: TsuiDBLookupComboBox;
    clientdtLB: TClientDataSet;
    dsLB: TDataSource;
    dladvChkCH0A27: TDLAdvCheckBox;
    advDtpks: TAdvDateTimePicker;
    advDtpjs: TAdvDateTimePicker;
    procedure ActLocateExecute(Sender: TObject);
    procedure suiedtZYHKeyPress(Sender: TObject; var Key: Char);
    procedure suiedtZYHKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure AdvbtnacSaveClick(Sender: TObject);

    procedure dbgrdhBaListCellClick(Column: TColumnEh);
  private
    { Private declarations }
    CH0A00:string;    //住院号

  public
    { Public declarations }
     constructor Create(Aower:TComponent);override;
  end;

var
  FrmBaPJ: TFrmBaPJ;

implementation
  uses
    UGFun,UVsMidClassList,UVsBaSx,UMidProxy;
{$R *.dfm}

{ TFrmBaPJ }

procedure TFrmBaPJ.ActLocateExecute(Sender: TObject);
const
  fsql = 'insert into VsPJBA0A(CH0A00,CH0A01,CH0A02,CH0A03,CH0A27,zklb) select CH0A00,CH0A01,CH0A02,CH0A03,CH0A27,^%s^'
       +'from VsCH0A where %s and not exists(select * from VsPJBA0A a left join VsCH0A b on a.CH0A00=b.CH0A01 where zklb=^%0:s^)';
var
 selsql:string;
 dm:string;
 IsAll:Boolean;
begin
  inherited;
  if (not clientdtLB.Active) or (clientdtLB.IsEmpty) then
  begin
    ShowMsgSure('类别数据为空！');
    exit;
  end;
  if VarIsEmpty(suicbcbbLB.KeyValue) then
  begin
    ShowMsgSure('请选择类别!');
    Exit;
  end;
  dm := suicbcbbLB.KeyValue;
  IsAll := clientdtLB.FieldByName('isChoice').AsInteger =1;

  if IsAll then  //查询新的病历
  begin
    if not dladvChkCH0A27.Checked then
    begin
      ShowMsgSure('请选择出院日期!');
      Exit;
    end;
    if advDtpks.Date > advDtpjs.Date then
       selsql := format('CH0A27 >= %s and CH0A27 <= %s',[QuotedStr(DateToStr(advDtpjs.Date)),QuotedStr(DateToStr(advDtpks.Date))])
    else
      selsql := format('CH0A27 >= %s and CH0A27 <= %s',[QuotedStr(DateToStr(advDtpks.Date)),QuotedStr(DateToStr(advDtpjs.Date))]) ;
    try
      //抽取选择出院日期范围的病历到筛选表
      TMidProxy.SqlExecute(Format(fsql,[dm,selsql]));
      DLCDS.Mid_Open(Format('select * from VsPJBA0A where %s and zklb=%s',[selsql,QuotedStr(dm)]));
      if DLCDS.IsEmpty then
      begin
        ShowMsgSure('数据为空!');
        Exit;
      end;
    finally

    end;

  end
  else //病历筛选表中查询数据
  begin
    selsql :=Format( 'select * from VsPJBA0A where zklb=%s',[QuotedStr(dm)]);
    try
      DLCDS.Mid_Open(selsql);
      if DLCDS.IsEmpty then
      begin
        ShowMsgSure('需要筛选此类别病历!');
        Exit;
      end;
    except
      on ex:Exception do
      begin
        WriteErrorLog(Format('查询筛选的病历数据出现异常；%s',[ex.Message]));
      end;
    end;
  end;

end;

procedure TFrmBaPJ.AdvbtnacSaveClick(Sender: TObject);
var

  sql:string;
  FCode,SCode,TCode,Code:string;
  Score:Double;
  Remark:string;
  mark:Pointer;
begin
  inherited;
  //判断师傅存在数据
  if not clientdtPJDetail.Active then Exit;
  if clientdtPJDetail.IsEmpty then Exit;
  if not DLCDS.Active then Exit;
  if DLCDS.IsEmpty then Exit;
//  if clientdtPJDetail.ChangeCount <1 then
//  begin
//    ShowMsgSure('数据没有被修改，不用保存!');
//    Exit;
//  end;
   //获取住院号
  CH0A00:=DLCDS.FieldByName('CH0A00').AsString;
  sql := Format('delete from VsBAZmPj where CH0A00=%s',[CH0A00]);
  try
    //删除上次评价
    TMidProxy.SqlExecute(sql);
    mark := clientdtPJDetail.GetBookmark;
    with clientdtPJDetail do
    begin
      try
        DisableControls;
        First;
        while not Eof do
        begin
          FCode := FieldByName('Fcode').AsString; //主项目编号
          SCode := FieldByName('Scode').AsString;//次项目编号
          TCode := FieldByName('Tcode').AsString;//细项目编号
          Score := FieldByName('Score').AsFloat; //分数
          Remark := DelStrTabDot(FieldByName('Remark').AsString);      //其他问题
          if TCode = '' then
          begin
            if SCode = '' then
              Code := FCode
            else
              Code := SCode;
          end
          else
            Code := TCode;

          sql := Format('insert into VsBAZmPj(CH0A00,Code,Score,Remark) values(^%s^,^%s^,%f,^%s^)',[CH0A00,Code,Score,Remark]) ;
          TMidProxy.SqlExecute(sql);
          Next;
        end;
      finally
        EnableControls;
      end;
    end;
    ShowMsgSure('保存完成');
  finally
    clientdtPJDetail.GotoBookmark(mark);
    clientdtPJDetail.FreeBookmark(mark);
  end;

end;

constructor TFrmBaPJ.Create(Aower: TComponent);
const
  sql = 'select * from VSPJBA0A where 1 <> 1';
  lbSql = ' select * from Vszklb where isTy = 0';
begin
  inherited Create(Aower,EuVsBaZmPj,sql);

  TMidProxy.SqlOpen(lbSql,clientdtLB);
  dladvChkCH0A27.AddStateControls([advDtpks,advDtpjs]);
end;

procedure TFrmBaPJ.dbgrdhBaListCellClick(Column: TColumnEh);
const
  execSql ='exec PBAzmpj ^%s^,^%s^' ;
var
 sql:string;
 dm:string;
begin
  inherited;
  try
    if not DLCDS.Active then Exit;
    if DLCDS.IsEmpty then Exit;
    CH0A00 := DLCDS.FieldByName('CH0A00').AsString;
    dm := DLCDS.FieldByName('zklb').AsString;
    if clientdtPJDetail.Active then
      clientdtPJDetail.EmptyDataSet;
    sql := Format(execSql,[CH0A00,dm]);
    TMidProxy.SqlOpen(sql,clientdtPJDetail);
    WriteDeBug(Format('获取%s病历质量评价信息',[CH0A00]));
  finally

  end;

end;


procedure TFrmBaPJ.suiedtZYHKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key =VK_RETURN then
    ActLocateExecute(nil);
//     SendMessage(Handle, WM_KEYDOWN, VK_TAB, 0);
end;

procedure TFrmBaPJ.suiedtZYHKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key in ['!','@','#','$','%','^','&','*','(',')','`',',','.','/','[',']','\','|'] then
    Key := #0;
end;

initialization
  Classes.RegisterClass(TFrmBaPJ);
finalization
  Classes.UnRegisterClass(TFrmBaPJ);

end.
