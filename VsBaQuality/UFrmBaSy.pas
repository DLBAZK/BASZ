{*******************************************************}
{                                                       }
{       ������ҳ�ʿ�                                    }
{                                                       }
{       ��Ȩ���� (C) 2016 �人�������ҽ�����ݷ���      }
{                                                       }
{*******************************************************}

unit UFrmBaSy;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFrmSuiDBForm, ComCtrls, AdvDateTimePicker, DosMove, AdvPanel,
  AdvAppStyler, AdvToolBar, AdvToolBarStylers, AdvOfficeStatusBar,
  AdvOfficeStatusBarStylers, ExtCtrls, AdvGlowButton, StdCtrls, EllipsLabel,
  DBGridEhGrouping, GridsEh, DBGridEh, SUIImagePanel, SUIGroupBox, DB, DBClient,
  UDlClientDataset,UVsMidClassList, UFrmSuiBForm, ActnList;

type
  TFrmBaSy = class(TFrmSuiDBForm)
    advDtpks: TAdvDateTimePicker;
    AdvPanel2: TAdvPanel;
    EllipsLabel1: TEllipsLabel;
    advDtpjs: TAdvDateTimePicker;
    EllipsLabel2: TEllipsLabel;
    AdvbtnOK: TAdvGlowButton;
    suiGroupBox1: TsuiGroupBox;
    dbgrdhBarecord: TDBGridEh;
    suiGroupBox2: TsuiGroupBox;
    dbgrdhBaHistory: TDBGridEh;
    DLCDSLocal: TDlClientDataset;
    DBGridEh1: TDBGridEh;
    DLCDSHistory: TDlClientDataset;
    dsLocal: TDataSource;
    dsHistory: TDataSource;
    procedure AdvbtnOKClick(Sender: TObject);
    procedure DLCDSLocalAfterScroll(DataSet: TDataSet);
    procedure dbgrdhBaHistoryDblClick(Sender: TObject);
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
   UFrmZkDetail,UGFun,UGVar;
{$R *.dfm}


{ TFrmBaSy }

procedure TFrmBaSy.AdvbtnOKClick(Sender: TObject);
var
  kssj,jssj:string;
  Sql:string;

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
  finally
    EndWaitWindow; 
  end;
end;

constructor TFrmBaSy.Create(Aowner: TComponent);
begin
  inherited Create(Aowner,EuVsBaSy,'');
  DLCDSLocal.MidClassName := EuVsBaSy;
  DLCDSHistory.MidClassName := EuVsBaSy;
  Self.advDtpjs.Date :=Now;
  Self.advDtpks.Date := Now -7;
  //��ȡ���еĲ�����ʷ��¼
  GetBazkHistory;
end;

/// <summary>
/// ˫�������� ������ʾ��ϸ�������ּ�¼
/// </summary>
procedure TFrmBaSy.dbgrdhBaHistoryDblClick(Sender: TObject);
var
  strBah:string;  //������
  frmZkdetal:TFrmZkDetail;
begin
  inherited;
  strBah :=DLCDSHistory.FieldByName('CH0A01').AsString;
  frmZkdetal := TFrmZkDetail.Create(nil);
  FrmZkDetail.StrBah := strBah;
  frmZkdetal.ShowModal;
  if Assigned(FrmZkDetail) then
     frmZkdetal.Free;
end;

/// <summary>
/// ��̬����ѡ�񲡰���ʷ��¼
/// </summary>
/// <param name="DataSet"></param>
procedure TFrmBaSy.DLCDSLocalAfterScroll(DataSet: TDataSet);
var
  Afilter:string;//�������
  Strbah:string;    //������
begin
  inherited;
  if DLCDSLocal.RecordCount <1 then Exit;
  Strbah := DLCDSLocal.FieldByName('CH0A01').AsString;
  Afilter :=  Format('CH0A01=%s',[QuotedStr(Strbah)]);
  DLCDSHistory.Filtered :=False;
  DLCDSHistory.Filter :=Afilter ;
  DLCDSHistory.Filtered := True;
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
    DLCDSHistory.Filtered :=True;
    DLCDSHistory.Filter := ' 1<>1';
    DLCDSHistory.Filtered := False;
  end;
end;

initialization
   Classes.RegisterClass(TFrmBaSy);
finalization
   Classes.UnRegisterClass(TFrmBaSy);
end.
