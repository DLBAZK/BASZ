 /// <summary>
 /// ������ҳ�ʿع���
 /// </summary>
 /// <author>JDL</author>
/// <date> 2016-05-14 </date>

unit UFrmBaSy;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFrmSuiDBForm, ComCtrls, AdvDateTimePicker, DosMove, AdvPanel,
  AdvAppStyler, AdvToolBar, AdvToolBarStylers, AdvOfficeStatusBar,
  AdvOfficeStatusBarStylers, ExtCtrls, AdvGlowButton, StdCtrls, EllipsLabel,
  DBGridEhGrouping, GridsEh, DBGridEh, SUIImagePanel, SUIGroupBox, DB, DBClient,
  UDlClientDataset,UVsMidClassList, UFrmSuiBForm, ActnList, AdvSplitter,UFrmZkDetail,
  Buttons;

type
  TFrmBaSy = class(TFrmSuiDBForm)
    AdvPanel2: TAdvPanel;
    suiGroupBox1: TsuiGroupBox;
    dbgrdhBarecord: TDBGridEh;
    suiGroupBox2: TsuiGroupBox;
    dbgrdhBaHistory: TDBGridEh;
    DLCDSLocal: TDlClientDataset;
    DBGridEh1: TDBGridEh;
    DLCDSHistory: TDlClientDataset;
    dsLocal: TDataSource;
    dsHistory: TDataSource;
    AdvPanel3: TAdvPanel;
    advDtpks: TAdvDateTimePicker;
    advDtpjs: TAdvDateTimePicker;
    AdvbtnOK: TAdvGlowButton;
    Timer1: TTimer;
    AdvSplitter1: TAdvSplitter;
    AdvbtnClose: TAdvGlowButton;
    Label1: TLabel;
    Label2: TLabel;
    btnQuery: TAdvGlowButton;
    procedure AdvbtnOKClick(Sender: TObject);
    procedure dbgrdhBaHistoryDblClick(Sender: TObject);
    procedure dbgrdhBarecordGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure dbgrdhBarecordCellClick(Column: TColumnEh);
    procedure btnQueryClick(Sender: TObject);

  private
    { Private declarations }
    /// <summary>
    /// ��ѯ���в�����ҳ�ʿ���ʷ��¼
    /// </summary>
    procedure GetBazkHistory;

  public
    { Public declarations }
    Constructor Create(Aowner:TComponent);Override;
  end;

var
  FrmBaSy: TFrmBaSy;

implementation
 uses
   UGFun,UGVar,UCommon;
{$R *.dfm}


{ TFrmBaSy }

procedure TFrmBaSy.AdvbtnOKClick(Sender: TObject);
var
  kssj,jssj:string;
  Sql:string;
begin
  inherited;
  dbgrdhBarecord.FieldColumns['Score'].Visible := true;
  kssj := DateToStr(self.advDtpks.Date);
  jssj := DateToStr(self.advDtpjs.Date);
  if kssj ='' then
  begin
    ShowMsgSure('��ѡ���Ժ����!');
    Exit;
  end;
  if jssj ='' then
  begin
    ShowMsgSure('��ѡ���Ժ����!');
    Exit;
  end;
  //�Զ��жϳ�Ժ���ڷ�Χ
  if Self.advDtpks.Date > Self.advDtpjs.Date then
    Sql := Format('exec PBaSyZk @StartDate=%s,@EndDate=%s, @UserName=%s',
                [QuotedStr(jssj),QuotedStr(kssj),QuotedStr(G_MainInfo.MainSysInfo.LogonUserName)])
  else
    Sql := Format('exec PBaSyZk @StartDate=%s,@EndDate=%s, @UserName=%s',
                [QuotedStr(kssj),QuotedStr(jssj),QuotedStr(G_MainInfo.MainSysInfo.LogonUserName)]);

  StartWaitWindow('���ڷ�������......');
  try
    DLCDSLocal.Mid_Open(Sql);
    if DLCDSLocal.Active then
    begin
      if DLCDSLocal.IsEmpty then
      begin
        EndWaitWindow;
        dbgrdhBarecord.DataSource := nil;
        ShowMsgSure('���Ϊ��!');
        Exit;
      end;
      dbgrdhBarecord.DataSource := dsLocal;
      GetBazkHistory;
    end;
  finally
    EndWaitWindow; 
  end;
end;


procedure TFrmBaSy.btnQueryClick(Sender: TObject);
  const
    sql = 'SELECT * FROM dbo.VsCH0A  WHERE CH0A27 >=^%0:s^ AND CH0A27 <=^%1:s^';
var
  kssj,jssj:string;
begin
  inherited;
  kssj := DateToStr(self.advDtpks.Date);
  jssj := DateToStr(self.advDtpjs.Date);
  if kssj ='' then
  begin
    ShowMsgSure('��ѡ���Ժ����!');
    Exit;
  end;
  if jssj ='' then
  begin
    ShowMsgSure('��ѡ���Ժ����!');
    Exit;
  end;
  dbgrdhBarecord.FieldColumns['Score'].Visible := false;
  DLCDSLocal.Mid_Open(Format(sql,[kssj,jssj]));
  dbgrdhBarecord.DataSource := dsLocal;
  GetBazkHistory;
end;

constructor TFrmBaSy.Create(Aowner: TComponent);
begin
  inherited; //Create(Aowner,EuVsBaSy,'select getdate()');
  DLCDSLocal.MidClassName := EuVsBaSy;
  DLCDSHistory.MidClassName := EuVsBaSy;
  Self.advDtpjs.Date :=Now;
  Self.advDtpks.Date := Now -7;
  dbgrdhBarecord.DataSource := nil;
  dbgrdhBaHistory.DataSource := nil;

end;

/// <summary>
/// ˫�������� ������ʾ��ϸ�������ּ�¼
/// </summary>
procedure TFrmBaSy.dbgrdhBaHistoryDblClick(Sender: TObject);
var
  strBah,pfsj:string;  //������
  frmZkdetal:TFrmZkDetail;
begin
  inherited;
  if not DLCDSHistory.Active then Exit;
  if DLCDSHistory.IsEmpty then Exit;

  strBah :=DLCDSHistory.FieldByName('CH0A01').AsString;
  pfsj := DLCDSHistory.FieldByName('PFSJ').AsString;
  if strBah = '' then Exit;

  frmZkdetal :=TFrmZkDetail.Create(nil);
  AutoFree(frmZkdetal);
  frmZkdetal.bah := strBah;
  frmZkdetal.PFSJ := pfsj;
  frmZkdetal.ShowModal;
end;

procedure TFrmBaSy.dbgrdhBarecordCellClick(Column: TColumnEh);
var
  Afilter:string;//�������
  Strbah:string;    //������
begin
  inherited;
  if not DLCDSLocal.Active then Exit;

  if DLCDSLocal.RecordCount <1 then Exit;
  Strbah := DLCDSLocal.FieldByName('CH0A01').AsString;
  Afilter :=  Format(' CH0A01=%s',[QuotedStr(Strbah)]);
  DLCDSHistory.Filtered :=False;
  DLCDSHistory.Filter :=Afilter ;
  DLCDSHistory.Filtered := True;

end;

procedure TFrmBaSy.dbgrdhBarecordGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  inherited;

end;


//��ѯ��ʷ���ּ�¼
procedure TFrmBaSy.GetBazkHistory;
var
  sql:string;
begin
  sql :='select CH0A01,PFSJ,100-SUM(score) Score, ROW_NUMBER() OVER(PARTITION BY '
       +'CH0A01 ORDER BY PFSJ) times  from VsBAsyzk group by CH0A01,PFSJ';
  DLCDSHistory.Mid_Open(sql);
  if DLCDSHistory.RecordCount > 0 then
  begin
    DLCDSHistory.Filtered :=False;
    DLCDSHistory.Filter := ' 1>1';
    DLCDSHistory.Filtered := True;
    dbgrdhBaHistory.DataSource := dsHistory;
  end;
end;

initialization
   Classes.RegisterClass(TFrmBaSy);
finalization
   Classes.UnRegisterClass(TFrmBaSy);
end.
