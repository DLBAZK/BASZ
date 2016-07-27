/// <summary>
/// webservice平台数据交换
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
  EException;

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
    procedure btnOKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnUploadClick(Sender: TObject);
  private
    { Private declarations }
    //用户名、密码
    WebUid,WebPwd:string;
    StartDate,EndDate:string;
    selectDate:TDateTime;
    SQLList:TStringList;
    function GetXMLFieldStr(AData: TClientDataSet): string;
    procedure SendMsg(const sCaption: string; const sMethod: string; const sSQL: string);
    function UploadData(sCaption,sMethod:string;clienttmp:TClientDataSet):Boolean;
    function ValidateCondition:Boolean;
    procedure ReLoadSQL;
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
  //保存用户名和密码
  WriteIniFileSit(G_MainInfo.MainCnfgFileName,'WebService','Uid',WebUid);
  WriteIniFileSit(G_MainInfo.MainCnfgFileName,'WebService','Pwd',WebPwd);
  selectDate :=Now;
  if FileExists(G_MainInfo.MainDir+'Debug.log') then
    DeleteFile(G_MainInfo.MainDir+'Debug.log');
  TMidProxy.SqlExecute('DELETE FROM VsWebDTState');
  SendMsg('基本信息', 'insertMedPh', sCH0ASQL);
  SendMsg('诊断信息', 'insertMedPhDisDiag', sCH0CSQL);
  SendMsg('手术信息', 'insertMedPhOper', sCH0ESQL);
  ShowMsgSure('数据上报完毕');
  DLCDS.Mid_Open(Format('SELECT * FROM VsWebDTState  WHERE Operationtime >= ^%s^ ORDER BY OperationState DESC',[FormatDateTime('yyyy-mm-dd hh:mm:ss',selectDate)]));
end;


procedure TFrmYinHaiMain.btnUploadClick(Sender: TObject);
var
  strCh0A01:string;
  State,strType:string;
  sqltext:string;
  smethod:string;
  clienttmp:TClientDataSet;
  rec:Boolean;
begin
  if not ValidateCondition then
     Exit;
  if not DLCDS.Active or (DLCDS.IsEmpty) then
  begin
    ShowMsgSure('请选择上报失败的数据重新上报!');
    Exit;
  end;

  State := DLCDS.FieldByName('OperationState').AsString;
  if State <> '0' then    //上报失败的可以重新上报
  begin
    ReLoadSQL;
    clienttmp := TClientDataSet.Create(nil);
    AutoFree(clienttmp);
    strCh0A01 :=  DLCDS.FieldByName('CH0A01').AsString;
    strType :=DLCDS.FieldByName('OperationLB').AsString;

    if strType ='基本信息' then
    begin
      smethod := 'insertMedPh';
      sqltext := Format('select * from(%0:s)C where C.adm_id=^%1:s^',
          [Format(SQLList.Values[smethod],[StartDate,EndDate]),strCh0A01]);
    end
    else if strType= '诊断信息' then
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

    WriteErrorLog(StringReplace(sqltext,';','',[rfReplaceAll]));
    TMidProxy.SqlOpen(StringReplace(sqltext,';','',[rfReplaceAll]),clienttmp);
    if not clienttmp.Active or (clienttmp.IsEmpty) then
      Exit;
    StartWaitWindow('正在上报'+strType+'数据...');
    rec :=UploadData(strType,smethod,clienttmp);
    EndWaitWindow;
    if rec then
      ShowMsgSure('数据上报完毕');
      
    DLCDS.Mid_Open('SELECT * FROM VsWebDTState ORDER BY OperationState DESC ');
  end
  else
   ShowMsgSure('该病案信息已上报成功！');
end;

constructor TFrmYinHaiMain.Create(Aowner: TComponent);
var
 strList:TStringList;
 i:Integer;
 sqlText:string;
begin
  inherited Create(Aowner,EuVsWebService,'SELECT * FROM VsWebDTState ORDER BY OperationState DESC');
  //读取用户名和密码
  WebUid := ReadIniFileSit(G_MainInfo.MainCnfgFileName,'WebService','Uid');
  WebPwd := ReadIniFileSit(G_MainInfo.MainCnfgFileName,'WebService','Pwd');
  edtID.Text := WebUid;
  edtPwd.Text := WebPwd;
  SQLList := TStringList.Create;
  ReLoadSQL;

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
    for I := 0 to strList.Count - 1 do
    begin
      if UpperCase(Trim(strList[I])) <> 'GO' then
      begin
        sqlText := sqlText + strList[I];
      end
      else
      begin
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
    ShowMsgSure('请设置平台分配的用户名');
    Exit;
  end;
  if edtPwd.Text = '' then
  begin
    ShowMessage('请设置平台分配的密码');
    Exit;
  end;
  Result := True;
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

function TFrmYinHaiMain.UploadData(sCaption,sMethod:string;clienttmp:TClientDataSet):Boolean;
 const
    InsertSQL='INSERT INTO VsWebDTState(CHYear,CH0A01,Operationtime,OperationState,OperationStateDesc,OperationLB) VALUES(^^,^%s^,^%s^,^%s^,^%s^,^%s^)';
var
  SendMsg,RecMsg:string;  //发送消息，反馈消息
  opearationtime:TDateTime;
  operationState,operationDesc:string;
  StrCh0A01:string;
  xmlFile: TNativeXml;
  node:TXmlNode;
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
        WriteDeBug('发送消息：'+SendMsg);
        WriteDeBug('-------------------------------------');
        RecMsg := GetYinHaiServicePortType.callService(SendMsg);
        if Copy(RecMsg,1,3) = '<?x' then
        begin
          xmlFile.ReadFromString(RecMsg);
          node :=xmlFile.Root;
          operationState :=  node.FindNode('errorcode').Value;
          operationDesc := node.FindNode('errormsg').Value;
          if operationDesc = ''  then
             operationDesc := '成功';
          Result := True;
        end;

        WriteDeBug(Format('反馈消息：%s',[RecMsg]));
        WriteDeBug('-------------------------------------');

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

        opearationtime := Now;
        TMidProxy.SqlExecute(Format('ALTER TABLE dbo.VsWebDTState ALTER COLUMN OperationStateDesc varchar(1000);delete from VsWebDTState where CH0A01=^%s^',[strCh0A01]));

        //保存上传状态
        TMidProxy.SqlExecute(Format(InsertSQL,[StrCh0A01,FormatDateTime('yyyy-mm-dd hh:mm:ss',
            opearationtime),operationState,StringReplace(operationdesc,'''',#39#39,[rfReplaceAll]),sCaption]));
      except
        on ex:Exception  do
        begin
          Result := False;
          EndWaitWindow;
          ShowMsgSure('服务出现异常，请稍后重试！');
          WriteDeBug(ex.Message);
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
  
  StartWaitWindow('正在上报'+sCaption+'数据...');
  UploadData(sCaption, sMethod,clienttmp);
  EndWaitWindow;
end;

initialization
  Classes.RegisterClass(TFrmYinHaiMain);
finalization
  Classes.UnRegisterClass(TFrmYinHaiMain);

end.
