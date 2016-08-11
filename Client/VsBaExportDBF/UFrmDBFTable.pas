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
    /// ��ȡ�������ʽ
    /// </summary>
    /// <param name="BID">���ù����ı�</param>
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
 frmsql:TfrmTableSQL; //��SQL��������
 sqltext:string; //��sql
begin
  if DLCDS.Active then
  begin
    if not DLCDS.IsEmpty then
    begin
      //��ȡ��ǰ�еı�SQL 
      sqltext := DLCDS.FieldByName('TableSQL').AsString;
      frmsql := TfrmTableSQL.Create(nil);
      //ɾ��ǰ���()
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
  SelBID,SelBMC:string;//���ù����ı�
  RelSql:string;
begin
  inherited;
   if DLCDS.Active and (not DLCDS.IsEmpty) then
  begin
    SelBID := DLCDS.FieldByName('BID').AsString;
    SelBMC :=DLCDS.FieldByName('tablename').AsString;
    if UpperCase(SelBMC)='VSCH0A' then
    begin
      ShowMsgSure('Ĭ�Ϲ���������ҳ����������!');
      Exit;
    end;
    frmRel :=TfrmTableRel.Create(nil);
    AutoFree(frmRel);
    frmrel.RelTableBID :=SelBID;
    frmRel.RelTableMC := SelBMC;
    frmRel.ShowModal;
    //���ع������ʽ
    RelSql := GetRelSql(SelBID);
    DLCDS.Edit;
    DLCDS.FieldByName('TableRel').AsString := RelSql;

  end;

end;
/// <summary>
/// ��ȡ�������ʽ
/// </summary>
/// <param name="BID">���ù����ı�</param>
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
     //�ұ��ֶ�ȡ��ֵ
    if clienttmp.FieldByName('LKind').AsString='1' then
    begin
      relSql := format('%s.%s=%s ',[clienttmp.FieldByName('RTABLECUS').AsString,
        clienttmp.FieldByName('RField').AsString,clienttmp.FieldByName('LField').AsString]);
    end
    else if clienttmp.FieldByName('RKind').AsString='1' then //����ֶ�ȡ��ֵ
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
