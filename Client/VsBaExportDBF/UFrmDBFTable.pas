unit UFrmDBFTable;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFrmSuiDBListForm, DBGridEhGrouping, PrnDbgeh, DB, ActnList,
  DBClient, UDlClientDataset, DosMove, AdvPanel, AdvAppStyler, AdvToolBar,
  AdvToolBarStylers, AdvOfficeStatusBar, AdvOfficeStatusBarStylers, GridsEh,
  DBGridEh, ExtCtrls, AdvGlowButton;

type
  TfrmDBFTable = class(TFrmSuiDBListForm)
    actTableSql: TAction;
    btnTableSql: TAdvGlowButton;
    procedure actTableSqlExecute(Sender: TObject);
    procedure dbgrdh_DLCDSDblClick(Sender: TObject);
  private
    { Private declarations }
    /// <summary>
    /// 获取关联表达式
    /// </summary>
    /// <param name="BID">设置关联的表</param>
    function GetRelSql(BID:string):string;
  public
    { Public declarations }
    Constructor Create(Aowner:TComponent);Override;
  end;

var
  frmDBFTable: TfrmDBFTable;

implementation
   uses UVsMidClassList,UFrmTableSql,UCommon,UFrmTableRel,UGShare,UGFun,UMidProxy;
{$R *.dfm}

{ TfrmDBFTable }

procedure TfrmDBFTable.actTableSqlExecute(Sender: TObject);
var
 frmsql:TfrmTableSQL; //表SQL创建窗体
 sqltext:string; //表sql
begin
  if DLCDS.Active then
  begin
    if not DLCDS.IsEmpty then
    begin
      //获取当前行的表SQL 
      sqltext := DLCDS.FieldByName('TableSQL').AsString;
      frmsql := TfrmTableSQL.Create(nil);
      //删除前后的()
      frmsql.TableSQL := Copy(sqltext,2,Length(sqltext)-2);
      if frmsql.ShowModal=mrOk then
      begin
        if frmsql.TableSQL <> '' then
        begin
          sqltext :=Format('(%s)',[frmsql.TableSQL]);
          dlcds.Edit;
          dlcds.FieldByName('TableSQL').AsString := sqltext;
          DLCDS.Post;
        end;
      end;
      if Assigned(frmsql) then
        FreeAndNil(frmsql);
    end;
  end;
end;

constructor TfrmDBFTable.Create(Aowner: TComponent);
const
  Sql='select * from VsCHDBFTable order by xh';
begin
  inherited Create(Aowner,EuVsDBF,Sql);

end;


procedure TfrmDBFTable.dbgrdh_DLCDSDblClick(Sender: TObject);
var
  frmRel:TfrmTableRel;
  SelBID,SelBMC:string;//设置关联的表
  RelSql:string;
begin
  inherited;
   if DLCDS.Active and (not DLCDS.IsEmpty) then
  begin
    SelBID := DLCDS.FieldByName('BID').AsString;
    SelBMC :=DLCDS.FieldByName('tablename').AsString;
    if UpperCase(SelBMC)='VSCH0A' then
    begin
      ShowMsgSure('默认关联病案首页，不用设置!');
      Exit;
    end;
    frmRel :=TfrmTableRel.Create(nil);
    AutoFree(frmRel);
    frmrel.RelTableBID :=SelBID;
    frmRel.RelTableMC := SelBMC;
    frmRel.ShowModal;
    //加载关联表达式
    RelSql := GetRelSql(SelBID);
    DLCDS.Edit;
    DLCDS.FieldByName('TableRel').AsString := RelSql;

  end;

end;
/// <summary>
/// 获取关联表达式
/// </summary>
/// <param name="BID">设置关联的表</param>
function TfrmDBFTable.GetRelSql(BID:string):string;
const
  SQL ='select A.TABLENAME LTABLE,A.TableCus LTABLECUS,B.LField,C.TableName RTABLE,C.TableCus RTABLECUS,B.RField,b.LKind,b.RKind from VsCHDBFTableRel B'
     +' LEFT JOIN VsCHDBFTable A ON  A.BID=B.LBID'
     +' LEFT JOIN VsCHDBFTable C ON C.Bid =B.RBID'
     +' WHERE B.RBID=^%s^';
var
  clienttmp:TClientDataSet;
  relSql:string;
  relList:TStringList;
  i:Integer;
begin
  Result := '';
  clienttmp := TClientDataSet.Create(nil);
  AutoFree(clienttmp);
  relList :=TStringList.Create;
  AutoFree(relList);
  TMidProxy.SqlOpen(Format(SQL,[BID]),clienttmp);
  clienttmp.First;
  while not clienttmp.Eof do
  begin
     //右表字段取定值
    if clienttmp.FieldByName('LKind').AsString='1' then
    begin
      relSql := format('%s.%s=%s ',[clienttmp.FieldByName('RTABLECUS').AsString,
        clienttmp.FieldByName('RField').AsString,clienttmp.FieldByName('LField').AsString]);
    end
    else if clienttmp.FieldByName('RKind').AsString='1' then //左表字段取定值
    begin
      relSql := format('%s.%s=%s ',[clienttmp.FieldByName('LTABLECUS').AsString,
        clienttmp.FieldByName('LField').AsString,clienttmp.FieldByName('RField').AsString]);
    end
    else
    begin
      relSql := format('%s.%s=%s.%s ',[clienttmp.FieldByName('RTABLECUS').AsString,
        clienttmp.FieldByName('RField').AsString,clienttmp.FieldByName('LTABLECUS').AsString,
        clienttmp.FieldByName('LField').AsString]);
    end;
    relList.Add(relSql);
    clienttmp.Next;
  end;
  for I := 0 to relList.Count - 1 do
  begin
    if i <> relList.Count-1 then
    begin
      Result := Result+ relList[i]+' and ';
    end
    else
      Result := Result+ relList[i];
  end;
end;

initialization
  Classes.RegisterClass(TfrmDBFTable);
finalization
  Classes.UnRegisterClass(TfrmDBFTable);

end.
