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
  ComCtrls, AdvDateTimePicker, DBGridEhGrouping, GridsEh, DBGridEh,UVsMidClassList,
  EException, InvokeRegistry, Rio, SOAPHTTPClient,IniFiles;

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
    btnUpload: TAdvGlowButton;
    btnClose: TAdvGlowButton;
    htprWeb: THTTPRIO;
    lblLB: TLabel;
    cbbBALB: TComboBoxEx;
    procedure btnOKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnUploadClick(Sender: TObject);
    procedure dbgrdhStateSortMarkingChanged(Sender: TObject);
  private
    { Private declarations }
    //�û���������
    WebUid,WebPwd:string;
    StartDate,EndDate:string;
    selectDate:TDateTime;
    SQLList:TStringList;
    WSDL:string;    //WSDL��ַ
    Port,Service:string; //THTTPRIO.PROT SERVICE
    function GetXMLFieldStr(AData: TClientDataSet): string;
    procedure SendMsg(const sCaption: string; const sMethod: string; const sSQL: string);
    function UploadData(sCaption,sMethod:string;clienttmp:TClientDataSet):Boolean;
    function ValidateCondition:Boolean;
    procedure GetUploadCount;
    procedure ReLoadSQL;

    procedure WriteLog(const msg:WideString);
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
  if not ValidateCondition then Exit;

  WebUid := edtID.Text;
  WebPwd := edtPwd.Text;
  //�����û���������
  WriteIniFileSit(G_MainInfo.MainCnfgFileName,'WebService','Uid',WebUid);
  WriteIniFileSit(G_MainInfo.MainCnfgFileName,'WebService','Pwd',WebPwd);
  selectDate :=Now;
  if FileExists(G_MainInfo.MainDir+'Debug.log') then
    DeleteFile(G_MainInfo.MainDir+'Debug.log');
  TMidProxy.SqlExecute('DELETE FROM VsWebDTState');
  if cbbBALB.ItemIndex =0 then
  begin
    SendMsg('������Ϣ', 'insertMedPh', sCH0ASQL);
    SendMsg('�����Ϣ', 'insertMedPhDisDiag', sCH0CSQL);
    SendMsg('������Ϣ', 'insertMedPhOper', sCH0ESQL);
  end
  else if cbbBALB.ItemIndex =1 then
  begin
    SendMsg('������Ϣ', 'insertMedPh', sCH0ASQL);
  end
  else if cbbBALB.ItemIndex =2 then
  begin
    SendMsg('�����Ϣ', 'insertMedPhDisDiag', sCH0CSQL);
  end
  else if cbbBALB.ItemIndex =3 then
  begin
    SendMsg('������Ϣ', 'insertMedPhOper', sCH0ESQL);
  end;
  ShowMsgSure('�����ϱ����');
  DLCDS.Mid_Open(Format('SELECT * FROM VsWebDTState  WHERE Operationtime >= ^%s^ ORDER BY OperationState DESC',[FormatDateTime('yyyy-mm-dd hh:mm:ss',selectDate)]));
  GetUploadCount;
end;


procedure TFrmYinHaiMain.btnUploadClick(Sender: TObject);
var
  strCh0A01:string;
  State,strType:string;
  sqltext:string;
  smethod:string;
  clienttmp:TClientDataSet;
  rec:Boolean;
  strLB:string;
begin
  if not ValidateCondition then
     Exit;
  if not DLCDS.Active or (DLCDS.IsEmpty) then
  begin
    ShowMsgSure('�޼�¼');
    Exit;
  end;
  // ���ؽű�
  ReLoadSQL;
  strLB := cbbBALB.Items[cbbBALB.ItemIndex];  
  StartWaitWindow('���������ϱ�ʧ�ܵ�����...');
  DLCDS.DisableControls;
  DLCDS.First;
  while not DLCDS.Eof do
  begin
    State := DLCDS.FieldByName('OperationState').AsString;
    if State <> '0' then    //�ϱ�ʧ�ܵĿ��������ϱ�
    begin
      clienttmp := TClientDataSet.Create(nil);
      AutoFree(clienttmp);
      strCh0A01 :=  DLCDS.FieldByName('CH0A01').AsString;
      strType :=DLCDS.FieldByName('OperationLB').AsString;
      if (strType <> strLB) and (strLB <>'ȫ���ϱ�') then
      begin
        DLCDS.Next;
        Continue;
      end;
      if strType ='������Ϣ' then
      begin
        smethod := 'insertMedPh';
        sqltext := Format('select * from(%0:s)C where C.adm_id=^%1:s^',
            [Format(SQLList.Values[smethod],[StartDate,EndDate]),strCh0A01]);
      end
      else if strType= '�����Ϣ' then
      begin
        smethod := 'insertMedPhDisDiag';
        sqltext := Format('select * from(%0:s)C where C.diag_id=^%1:s^',
            [Format(SQLList.Values[smethod],[StartDate,EndDate]),strCh0A01]);
      end
      else
      begin
        smethod := 'insertMedPhOper';
        sqltext := Format('select * from(%0:s)C where C.ope_rec_id=^%1:s^',
            [Format(SQLList.Values[smethod],[StartDate,EndDate]),strCh0A01]);
      end;
      WriteLog('�����ϱ����ݣ�'+StringReplace(sqltext,';','',[rfReplaceAll]));
      TMidProxy.SqlOpen(StringReplace(sqltext,';','',[rfReplaceAll]),clienttmp);
      if not clienttmp.Active or (clienttmp.IsEmpty) then
      begin
       DLCDS.Next;
       Continue;
      end;

      rec :=UploadData(strType,smethod,clienttmp);
    end;
    DLCDS.Next;
  end;
  DLCDS.EnableControls;
  EndWaitWindow;
  DLCDS.Mid_Open('SELECT * FROM VsWebDTState ORDER BY OperationState DESC ');
  GetUploadCount;
end;

constructor TFrmYinHaiMain.Create(Aowner: TComponent);
var
 strList:TStringList;
 i:Integer;
 sqlText:string;
begin
  inherited Create(Aowner,EuVsWebService,'SELECT * FROM VsWebDTState ORDER BY OperationState DESC');
  //��ȡ�û���������
  WebUid := ReadIniFileSit(G_MainInfo.MainCnfgFileName,'WebService','Uid');
  WebPwd := ReadIniFileSit(G_MainInfo.MainCnfgFileName,'WebService','Pwd');
  WSDL := ReadIniFileSit(G_MainInfo.MainCnfgFileName,'WebService','WSDL');
  Port := ReadIniFileSit(G_MainInfo.MainCnfgFileName,'WebService','Port');
  Service := ReadIniFileSit(G_MainInfo.MainCnfgFileName,'WebService','Service');
  if WSDL = '' then
   WSDL :='http://172.18.2.8:8080/webservice/services/YinHaiService?wsdl';
  if Port ='' then
    Port := 'YinHaiServiceHttpPort';
  if Service='' then
    Service := 'YinHaiService';
  try
    htprWeb.WSDLLocation := WSDL;
    htprWeb.Port := Port;
    htprWeb.Service := Service;
  except
    on ex:Exception do
    begin
      ShowMsgSure('�ϱ����������ӳ����쳣');
      WriteErrorLog(ex.Message);
    end;

  end;
  cbbBALB.ItemIndex := 0;
  edtID.Text := WebUid;
  edtPwd.Text := WebPwd;
  SQLList := TStringList.Create;
  ReLoadSQL;
  GetUploadCount;
end;



procedure TFrmYinHaiMain.dbgrdhStateSortMarkingChanged(Sender: TObject);
begin
  inherited;
  SetDBGridEhSort(dbgrdhState);
end;

procedure TFrmYinHaiMain.ReLoadSQL;
var
  strList: TStringList;
  sqlPath: string;
  sqlText: string;
  i: Integer;
begin
  sqlPath := G_MainInfo.MainDir + CReportFileDir + '\WebSql.txt';
  if FileExists(sqlPath) then
  begin
    strList := TStringList.Create;
    AutoFree(strList);
    strList.LoadFromFile(sqlPath);
    SQLList.Clear;
    for I := 0 to strList.Count - 1 do
    begin
      if UpperCase(Trim(strList[I])) <> 'GO' then
      begin
        sqlText := sqlText + strList[I];
      end
      else
      begin
        if not Assigned(SQLList) then
           SQLList := TStringList.Create;
        SQLList.Add(sqlText);
        sqlText := '';
      end;
    end;
    SQLList.Delimiter := ';';
  end;
end;

function TFrmYinHaiMain.ValidateCondition:Boolean;
begin
  Result := False;
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
  Result := True;
end;

procedure TFrmYinHaiMain.WriteLog(const msg: WideString);
var
  logbz:Boolean;
  IniFile:TIniFile;
Begin
  IniFile:=TiniFile.Create(G_MainInfo.MainCnfgFileName);
  AutoFree(IniFile);
  logbz:=IniFile.ReadBool('WebService','writelog',False);
  if logbz then
    WriteDeBug(Format('%s:%s',[FormatDateTime('yyyy-mm-dd hh:mm:ss zzz',Now),msg]));
end;

procedure TFrmYinHaiMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  SQLList.Free;
end;

procedure TFrmYinHaiMain.GetUploadCount;
const
   SQL ='SELECT OperationLB ,COUNT(*) Result  FROM dbo.VsWebDTState GROUP BY OperationLB  ';
var
   clientResult:TClientDataSet;
   strResult:string;
begin
  clientResult := TClientDataSet.Create(nil);
  AutoFree(clientResult);
  TMidProxy.SqlOpen(SQL,clientResult);
  with clientResult do
  begin
    First;
    while not Eof do
    begin
      strResult :=strResult+format(' %s:%s��;',[FieldByName('OperationLB').AsString,FieldByName('Result').AsString]);
      Next;
    end;
  end;
  SetSbSimpleText('�ϱ���¼:'+strResult);
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

function TFrmYinHaiMain.UploadData(sCaption,sMethod:string;clienttmp:TClientDataSet):Boolean;
 const
    InsertSQL='INSERT INTO VsWebDTState(CHYear,CH0A01,Operationtime,OperationState,OperationStateDesc,OperationLB) VALUES(^^,^%s^,^%s^,^%s^,^%s^,^%s^)';
var
  SendMsg,RecMsg:string;  //������Ϣ��������Ϣ
  opearationtime:TDateTime;
  operationState,operationDesc:string;
  StrCh0A01:string;
  xmlFile: TNativeXml;
  node:TXmlNode;
  servicePortType:YinHaiServicePortType;  //�ϱ��ӿ�
begin
  Result := False;
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
        WriteLog('������Ϣ��'+SendMsg);
        WriteLog('-------------------------------------');
        if sMethod='insertMedPh' then
        begin
          StrCh0A01 := FieldByName('adm_id').AsString;
        end
        else if sMethod = 'insertMedPhDisDiag' then
        begin
          StrCh0A01 := FieldByName('diag_id').AsString;
        end
        else
        begin
          StrCh0A01 := FieldByName('ope_rec_id').AsString;
        end;
        servicePortType := (htprweb as YinHaiServicePortType);
        RecMsg := servicePortType.callService(SendMsg);
        if Copy(RecMsg,1,3) = '<?x' then
        begin
          xmlFile.ReadFromString(RecMsg);
          node :=xmlFile.Root;
          operationState :=  node.FindNode('errorcode').Value;
          operationDesc := node.FindNode('errormsg').Value;
          if operationDesc = ''  then
             operationDesc := '�ɹ�';
          Result := True;
        end;

        WriteLog(Format('������Ϣ��%s',[RecMsg]));
        WriteLog('-------------------------------------');
        opearationtime := Now;
        TMidProxy.SqlExecute(Format('delete from VsWebDTState where CH0A01=^%s^ and OperationLB=^%s^ and OperationState<>0',[strCh0A01,sCaption]));

        //�����ϴ�״̬
        TMidProxy.SqlExecute(Format(InsertSQL,[StrCh0A01,FormatDateTime('yyyy-mm-dd hh:mm:ss',
            opearationtime),operationState,StringReplace(operationdesc,'''',#39#39,[rfReplaceAll]),sCaption]));
      except
        on ex:Exception  do
        begin
          Result := False;
          TMidProxy.SqlExecute(Format('delete from VsWebDTState where CH0A01=^%s^ and OperationLB=^%s^ and OperationState<>0',[strCh0A01,sCaption]));
          TMidProxy.SqlExecute(Format(InsertSQL,[StrCh0A01,FormatDateTime('yyyy-mm-dd hh:mm:ss',
            Now),'901','�ϱ�ʧ��',sCaption]));
          WriteLog(ex.Message);
        end;
      end;
      Next;
    end;
  end;
end;

procedure TFrmYinHaiMain.SendMsg(const sCaption, sMethod, sSQL: string);
var
  clienttmp:TClientDataSet;
  SQLText:string;
begin
  clienttmp := TClientDataSet.Create(nil);
  autofree(clienttmp);
  SQLText:= SQLList.Values[sMethod];
  TMidProxy.SqlOpen(Format(SQLText,[StartDate,EndDate]),clienttmp);
  if (not clienttmp.Active) or( clienttmp.IsEmpty) then
    Exit;
  
  StartWaitWindow('�����ϱ�'+sCaption+'����...');
  UploadData(sCaption, sMethod,clienttmp);
  EndWaitWindow;
end;

initialization
  Classes.RegisterClass(TFrmYinHaiMain);
finalization
  Classes.UnRegisterClass(TFrmYinHaiMain);

end.
