/// <summary>
/// webserviceƽ̨���ݽ���
/// </summary>
/// <author> JDL </author>
/// <date> 2016-07-21 </date>
unit UFrmMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFrmSuiDBForm, DB, ActnList, DBClient, UDlClientDataset, DosMove,
  AdvPanel, AdvAppStyler, AdvToolBar, AdvToolBarStylers, AdvOfficeStatusBar,
  AdvOfficeStatusBarStylers, ExtCtrls, StdCtrls, TFlatPanelUnit, AdvGlowButton,
  ComCtrls, AdvDateTimePicker, DBGridEhGrouping, GridsEh, DBGridEh,UVsMidClassList;

type
  TFrmYinHaiMain = class(TFrmSuiDBForm)
    fltpnl1: TFlatPanel;
    lbldateStart: TLabel;
    lblDateEnd: TLabel;
    advdtmpckrStart: TAdvDateTimePicker;
    advdtmpckrEnd: TAdvDateTimePicker;
    btnOK: TAdvGlowButton;
    dbgrdhState: TDBGridEh;
    lblID: TLabel;
    edtID: TEdit;
    Label1: TLabel;
    edtPwd: TEdit;
    procedure btnOKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    //�û���������
    WebUid,WebPwd:string;
    StartDate,EndDate:string;
    selectDate:TDateTime;
    SQLList:TStringList;
    function GetXMLFieldStr(AData: TClientDataSet): string;
    procedure SendMsg(const sCaption: string; const sMethod: string; const sSQL: string);
  public
    { Public declarations }
    Constructor Create(Aowner:TComponent);override;
  end;

var
  FrmMain: TFrmYinHaiMain;

implementation
  uses YinHaiService,UGFun,UGVar,UPVar,UCommon,UMidProxy,NativeXml;
{$R *.dfm}

procedure TFrmYinHaiMain.btnOKClick(Sender: TObject);
begin
  inherited;
  if advdtmpckrStart.Date > advdtmpckrEnd.Date then
  begin
    StartDate := DateToStr(advdtmpckrEnd.Date);
    EndDate := DateToStr(advdtmpckrStart.Date);
  end
  else
  begin
    EndDate := DateToStr(advdtmpckrEnd.Date);
    StartDate := DateToStr(advdtmpckrStart.Date);
  end;
  if edtID.Text='' then
  begin
    ShowMsgSure('������ƽ̨������û���');
    Exit;
  end;
  if edtPwd.Text = '' then
  begin
    ShowMessage('������ƽ̨���������');
    Exit;
  end;
  WebUid := edtID.Text;
  WebPwd := edtPwd.Text;
  //�����û���������
  WriteIniFileSit(G_MainInfo.MainCnfgFileName,'WebService','Uid',WebUid);
  WriteIniFileSit(G_MainInfo.MainCnfgFileName,'WebService','Pwd',WebPwd);
  selectDate :=Now;
  SendMsg('������Ϣ', 'insertMedPh', sCH0ASQL);
  SendMsg('�����Ϣ', 'insertMedPhDisDiag', sCH0CSQL);
  SendMsg('������Ϣ', 'insertMedPhOper', sCH0ESQL);
  ShowMsgSure('�����ϱ����');
  DLCDS.Mid_Open(Format('SELECT * FROM VsWebDTState  WHERE Operationtime >= ^%s^ ORDER BY Operationtime,CH0A01,CHYear',[FormatDateTime('yyyy-mm-dd hh:mm:ss',selectDate)]));
end;


constructor TFrmYinHaiMain.Create(Aowner: TComponent);
var
 sqlPath:string;
begin
  inherited Create(Aowner,EuVsWebService,'SELECT * FROM VsWebDTState ORDER BY Operationtime,CH0A01,CHYear');
  //��ȡ�û���������
  WebUid := ReadIniFileSit(G_MainInfo.MainCnfgFileName,'WebService','Uid');
  WebPwd := ReadIniFileSit(G_MainInfo.MainCnfgFileName,'WebService','Pwd');
  edtID.Text := WebUid;
  edtPwd.Text := WebPwd;
  SQLList := TStringList.Create;
  sqlPath := G_MainInfo.MainDir+CReportFileDir+'\WebSql.txt';
  if FileExists(sqlPath) then
  begin
    SQLList.LoadFromFile(sqlPath);
    SQLList.Delimiter := ';';
  end;

end;

procedure TFrmYinHaiMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  SQLList.Free;
end;

function TFrmYinHaiMain.GetXMLFieldStr(AData: TClientDataSet): string;
const
  sStdField='           <para %s="%s" />';
var
  i: Integer;
begin
  Result:='';
  for i:=0 to AData.FieldCount - 1 do begin
    Result:=Result+Format(sStdField, [AData.Fields[i].FieldName, AData.Fields[i].AsString]);
  end;

end;

procedure TFrmYinHaiMain.SendMsg(const sCaption, sMethod, sSQL: string);
  const
    InsertSQL='INSERT INTO VsWebDTState(CHYear,CH0A01,Operationtime,OperationState,OperationStateDesc,OperationLB) VALUES(^^,^%s^,^%s^,^%s^,^%s^,^%s^)';
var
  clienttmp:TClientDataSet;
  SendMsg,RecMsg:string;  //������Ϣ��������Ϣ
  opearationtime:TDateTime;
  operationState,operationDesc:string;
  StrCh0A01:string;
  xmlFile: TNativeXml;
  node:TXmlNode;
  SQLText:string;
begin
  clienttmp := TClientDataSet.Create(nil);
  autofree(clienttmp);
  SQLText:= SQLList.Values[sMethod];
  TMidProxy.SqlOpen(Format(SQLText,[StartDate,EndDate]),clienttmp);
  if (not clienttmp.Active) or( clienttmp.IsEmpty) then
    Exit;
  
  StartWaitWindow('�����ϱ�'+sCaption+'����...');
  xmlFile := TNativeXml.Create(nil);
  AutoFree(xmlFile);
  with clienttmp do
  begin
    First;
    while not Eof do
    begin

      SendMsg := Format(sSendMsg,[WebUid,WebPwd,sMethod,GetXMLFieldStr(clienttmp)]);
      try
        Application.ProcessMessages;
        WriteDeBug('������Ϣ��'+SendMsg);
        WriteDeBug('-------------------------------------');
        RecMsg := GetYinHaiServicePortType.callService(SendMsg);
        if Copy(RecMsg,1,3) = '<?x' then
        begin
          xmlFile.ReadFromString(RecMsg);
          node :=xmlFile.Root;
          operationState :=  node.FindNode('errorcode').Value;
          operationDesc := node.FindNode('errormsg').Value;
          if operationDesc = ''  then
             operationDesc := '�ɹ�';

        end;

        WriteDeBug(Format('������Ϣ��%s',[RecMsg]));
        WriteDeBug('-------------------------------------');

        if sMethod='insertMedPh' then
        begin
          StrCh0A01 := FieldByName('med_id').AsString;
        end
        else if sMethod = 'insertMedPhDisDiag' then
        begin
          StrCh0A01 := Copy(FieldByName('diag_id').AsString,0,Pos('_',FieldByName('diag_id').AsString)-1);
        end
        else
        begin
          StrCh0A01 := Copy(FieldByName('ope_rec_id').AsString,0,Pos('_',FieldByName('ope_rec_id').AsString)-1);
        end;

        opearationtime := Now;
        //�����ϴ�״̬
        TMidProxy.SqlExecute(Format(InsertSQL,[StrCh0A01,FormatDateTime('yyyy-mm-dd hh:mm:ss',opearationtime),operationState,StringReplace(operationdesc,'''',#39,[rfReplaceAll]),sCaption]));
      except
        on ex:Exception do
        begin
          WriteDeBug(ex.Message);
        end;

      end;
      Next;
    end;
  end;
  EndWaitWindow;
end;

initialization
  Classes.RegisterClass(TFrmYinHaiMain);
finalization
  Classes.UnRegisterClass(TFrmYinHaiMain);

end.
