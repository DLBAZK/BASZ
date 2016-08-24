/// <summary>
/// 公共方法
/// </summary>
/// <author>jdl</author>
///<date>2016-08-18</date>

unit UPublic;

interface
   uses Classes,StrUtils,SysUtils,Windows,AdvFontCombo,DB,DBClient,Controls;

   type
   //数据集移动方向 全部右移、右移、左移、全部左移
   TOrientation=(otAllRight,otRight,otLeft,otAllLeft);

   /// <summary>
   /// 加载显示科室
   /// </summary>
   /// <param name="OfficeComboBox">选择框</param>
   procedure LoadOffice(OfficeComboBox:TAdvOfficeComboBox);
   /// <summary>
   /// 移动数据
   /// </summary>
   /// <param name="Source">源clientdataset</param>
   /// <param name="Dest">目的clientdataset</param>
   /// <param name="orientation">方向</param>
   procedure ChangeData(Source,Dest:TClientDataSet;orientation:TOrientation);
   /// <summary>
   /// 根据动作类型生成单号
   /// </summary>
   /// <param name="ActionType">动作类型 比如：质控签入（10001_1）</param>
   /// <returns>单号 HYYYYMMDD000 000:流水号</returns>
   function GenerateActionListNum(ActionType:string):string;
   /// <summary>
   /// 获取更多条件
   /// </summary>
   /// <returns>where语句</returns>
   function GetCondition:string;
implementation
 uses UCommon,UMidProxy,UGFun,UGVar,UFrmMoreTJ;

procedure LoadOffice(OfficeComboBox:TAdvOfficeComboBox);
const
  sql='Select Isnull(UserKS,^^)UserKS from VsUser where usercode = ^%s^';
  officeSql='Select SoDm,SoMC,SoPy From VsSOffice Where SoTy<>1 AND   SODM=^%s^';
var
 clienttmp:TClientDataSet;
 ks:string;  //用户科室
begin
  //当前用户是否设置科室
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
    patientID:string;//病人唯一标识
    i:Integer;
  begin
    //病人唯一标识 索引
    Dest.IndexFieldNames := 'patientid';

    with source do
    begin
      patientID :=FieldByName('patientID').AsString;
      //不存在则添加
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
    //全部右移、全部左移
    otAllRight,otAllLeft:
    begin
      with Source do
      begin
        StartWaitWindow('正在移动数据...');
        try
          DisableControls;
          First;
          while not Eof do
          begin
           //移动数据
           MoveData(Source,Dest);
           First;
          end;
          EnableControls;
        finally
          EndWaitWindow;
        end;
      end;

    end;
    //右移、左移
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
