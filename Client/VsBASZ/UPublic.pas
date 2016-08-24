/// <summary>
/// ��������
/// </summary>
/// <author>jdl</author>
///<date>2016-08-18</date>

unit UPublic;

interface
   uses Classes,StrUtils,SysUtils,Windows,AdvFontCombo,DB,DBClient,Controls;

   type
   //���ݼ��ƶ����� ȫ�����ơ����ơ����ơ�ȫ������
   TOrientation=(otAllRight,otRight,otLeft,otAllLeft);

   /// <summary>
   /// ������ʾ����
   /// </summary>
   /// <param name="OfficeComboBox">ѡ���</param>
   procedure LoadOffice(OfficeComboBox:TAdvOfficeComboBox);
   /// <summary>
   /// �ƶ�����
   /// </summary>
   /// <param name="Source">Դclientdataset</param>
   /// <param name="Dest">Ŀ��clientdataset</param>
   /// <param name="orientation">����</param>
   procedure ChangeData(Source,Dest:TClientDataSet;orientation:TOrientation);
   /// <summary>
   /// ���ݶ����������ɵ���
   /// </summary>
   /// <param name="ActionType">�������� ���磺�ʿ�ǩ�루10001_1��</param>
   /// <returns>���� HYYYYMMDD000 000:��ˮ��</returns>
   function GenerateActionListNum(ActionType:string):string;
   /// <summary>
   /// ��ȡ��������
   /// </summary>
   /// <returns>where���</returns>
   function GetCondition:string;
implementation
 uses UCommon,UMidProxy,UGFun,UGVar,UFrmMoreTJ;

procedure LoadOffice(OfficeComboBox:TAdvOfficeComboBox);
const
  sql='Select Isnull(UserKS,^^)UserKS from VsUser where usercode = ^%s^';
  officeSql='Select SoDm,SoMC,SoPy From VsSOffice Where SoTy<>1 AND   SODM=^%s^';
var
 clienttmp:TClientDataSet;
 ks:string;  //�û�����
begin
  //��ǰ�û��Ƿ����ÿ���
  try
    clienttmp := TClientDataSet.Create(nil);
    AutoFree(clienttmp);
    TMidProxy.SqlOpen(Format(sql,[G_MainInfo.MainSysInfo.LogonUserCode]),clienttmp);
    if not clienttmp.IsEmpty then
    begin
      ks :=clienttmp.FieldByName('UserKS').AsString;
      if ks<>'' then
      begin
        FillCombobox(Format(officeSql,[ks]),'SoDm','SoMC',OfficeComboBox);
        OfficeComboBox.ItemIndex :=0;
        Exit;
      end;

    end;
  finally
   FillCombobox_ZyKS(OfficeComboBox);
  end;

end;

procedure ChangeData(Source,Dest:TClientDataSet;orientation:TOrientation);
  procedure MoveData(source,Dest:TClientDataSet);
  var
    patientID:string;//����Ψһ��ʶ
    i:Integer;
  begin
    //����Ψһ��ʶ ����
    Dest.IndexFieldNames := 'patientid';

    with source do
    begin
      patientID :=FieldByName('patientID').AsString;
      //�����������
      if not Dest.FindKey([patientid]) then
      begin
        Dest.Append;
        for I := 0 to source.FieldCount-1 do
        begin
          Dest.FieldByName(source.Fields[i].FieldName).AsString :=source.Fields[i].AsString;
        end;
        Dest.Post;
        Delete;
      end;
    end;
  end;
begin
  if not Source.Active then Exit;
  if Source.IsEmpty then exit;
  case orientation of
    //ȫ�����ơ�ȫ������
    otAllRight,otAllLeft:
    begin
      with Source do
      begin
        StartWaitWindow('�����ƶ�����...');
        try
          DisableControls;
          First;
          while not Eof do
          begin
           //�ƶ�����
           MoveData(Source,Dest);
           First;
          end;
          EnableControls;
        finally
          EndWaitWindow;
        end;
      end;

    end;
    //���ơ�����
    otRight,otLeft:
    begin
      MoveData(Source,Dest);
    end;
  end;
end;

function GenerateActionListNum(ActionType:string):string;
const
 SQL='SELECT TOP 1 Right(ListID,3) ListNum FROM SZActionList ORDER BY listtime DESC';
var
  clientdttmp:TClientDataSet;
  num,i:Integer;
  ReclaimListID:string;
begin
  Result :='';
  clientdttmp := TClientDataSet.Create(nil);
  AutoFree(clientdttmp);
  TMidProxy.SqlOpen(SQL,clientdttmp);
  ReclaimListID := Format('H%s',[FormatDateTime('yyyymmdd',Now)]);
  if clientdttmp.IsEmpty then
  begin
    ReclaimListID :=ReclaimListID+'001';
  end
  else
  begin
    num := clientdttmp.FieldByName('ListNum').AsInteger +1;
    for I := 0 to 3-length(IntToStr(num))-1 do
    begin
      ReclaimListID := ReclaimListID+'0';
    end;
    ReclaimListID := ReclaimListID +inttostr(num);
  end;
  try
    TMidProxy.SqlExecute(Format('insert into SZActionList values(^%s^,^%s^,GETDATE(),^%s^)',
               [ReclaimListID,ActionType,G_MainInfo.MainSysInfo.LogonUserName]));
    Result :=ReclaimListID;
  except
    on ex:Exception do
    begin
      WriteErrorLog(ex.Message);
    end;
  end;
end;

function GetCondition:string;
var
 frmtj:TfrmMoreTJ;
begin
  frmtj := TfrmMoreTJ.Create(nil);
  AutoFree(frmtj);
  frmtj.ShowModal;
  Result :=frmtj.Condition;
end;
end.
