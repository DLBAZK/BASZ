/// <summary>
///  DBF数据导出配置
/// </summary>
/// <author> JDL </author>
/// <date> 2016-07-7 </date>
unit UFrmExportDBF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFrmSuiDBListForm, DBGridEhGrouping, PrnDbgeh, DB, ActnList,
  DBClient, UDlClientDataset, DosMove, AdvPanel, AdvAppStyler, AdvToolBar,
  AdvToolBarStylers, AdvOfficeStatusBar, AdvOfficeStatusBarStylers, GridsEh,
  DBGridEh, ExtCtrls, AdvGlowButton,UVsMidClassList, TFlatPanelUnit, AdvSplitter,
  StdCtrls, AdvEdit, AdvEdBtn, ComCtrls, AdvDateTimePicker, ExtDlgs, QExport3,
  QExport3DBF,ShellAPI, MemTableDataEh, DataDriverEh, MemTableEh, DBTables,Contnrs,
  DBCtrls, SUIDBCtrls;

type
  TFrmExportDBF = class(TFrmSuiDBListForm)
    advspltr1: TAdvSplitter;
    fltpnl1: TFlatPanel;
    dbgrdhDBF: TDBGridEh;
    dsDBF: TDataSource;
    clientdtDBF: TClientDataSet;
    fltpnl2: TFlatPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    advdtmpckrStart: TAdvDateTimePicker;
    advdtmpckrEnd: TAdvDateTimePicker;
    btnExport: TAdvGlowButton;
    lbl3: TLabel;
    edtbtnPath: TAdvEditBtn;
    SaveTFiledlgDBFFile: TSaveTextFileDialog;
    btnSQL: TAdvGlowButton;
    qxprt3dbfWT: TQExport3DBF;
    dlclntdtstDBF: TDlClientDataset;
    mtblhDBF: TMemTableEh;
    dtstdrvrhddmtblh1: TDataSetDriverEh;
    mtblhDBFTable: TMemTableEh;
    dtstdrvrhDBFTable: TDataSetDriverEh;
    tbl1: TTable;
    dtstdrvrhDBF: TDataSetDriverEh;
    suiLkcbbDBFType: TsuiDBLookupComboBox;
    clientdtDBFType: TClientDataSet;
    dsDBFType: TDataSource;
    lbl4: TLabel;
    procedure dbgrdhDBFDblClick(Sender: TObject);
    procedure edtbtnPathClickBtn(Sender: TObject);
    procedure btnSQLClick(Sender: TObject);
    procedure btnExportClick(Sender: TObject);
    procedure dtstdrvrhddmtblh1UpdateRecord(DataDriver: TDataDriverEh;
      MemTableData: TMemTableDataEh; MemRec: TMemoryRecordEh);
    procedure dbgrdh_DLCDSColumns1UpdateData(Sender: TObject; var Text: string;
      var Value: Variant; var UseText, Handled: Boolean);
    procedure FormShow(Sender: TObject);
    procedure suiLkcbbDBFTypeCloseUp(Sender: TObject);
    procedure acInsExecute(Sender: TObject);
    procedure acEditExecute(Sender: TObject);
    procedure acCancelExecute(Sender: TObject);
    procedure acFirstExecute(Sender: TObject);
    procedure acPriorExecute(Sender: TObject);
    procedure acNextExecute(Sender: TObject);
    procedure acLastExecute(Sender: TObject);
    procedure acSaveExecute(Sender: TObject);
  private
    { Private declarations }
    procedure SelSourceField;
    function  GenerateSQL:string;
    /// <summary>
    /// 加载显示DBF字段
    /// </summary>
    procedure ReloadDBFField;
    /// <summary>
    /// 保存DBF字段
    /// </summary>
    procedure SaveDBFField;
  public
    { Public declarations }
    TypeID:string;//DBF类型ID
    //Constructor Create(Aowner:TComponent);Override;
    Procedure CheckData;override;
  end;

var
  FrmExportDBF: TFrmExportDBF;

implementation
 uses UGVar,UGFun,UMidProxy,UFrmSource,UCommon,UGShare,UFrmExportPre;
{$R *.dfm}

{ TFrmExportDBF }

procedure TFrmExportDBF.acCancelExecute(Sender: TObject);
begin
  inherited;
  mtblhDBF.CancelUpdates;
  AcSave.Enabled:=False;
  AcCancel.Enabled:=False;
end;

procedure TFrmExportDBF.acEditExecute(Sender: TObject);
begin
 // inherited;
  mtblhDBF.Edit;
end;

procedure TFrmExportDBF.acFirstExecute(Sender: TObject);
begin
 // inherited;
  mtblhDBF.First;
end;

procedure TFrmExportDBF.acInsExecute(Sender: TObject);
begin
  //inherited;
  mtblhDBF.Append;
end;

procedure TFrmExportDBF.acLastExecute(Sender: TObject);
begin
 // inherited;
  mtblhDBF.Last;
end;

procedure TFrmExportDBF.acNextExecute(Sender: TObject);
begin
 // inherited;
  if not mtblhDBF.Eof then
   mtblhDBF.Next;
end;

procedure TFrmExportDBF.acPriorExecute(Sender: TObject);
begin
 // inherited;
  if not mtblhDBF.Bof then
     mtblhDBF.Prior;
end;

procedure TFrmExportDBF.acSaveExecute(Sender: TObject);
begin
  //inherited;
  if mtblhDBF.Active and (not mtblhDBF.IsEmpty) then
  begin
    SaveDBFField;
    if mtblhDBF.State in [dsInsert,dsEdit] then
     mtblhDBF.Post;
     mtblhDBF.ApplyUpdates(-1);
  end;
end;

procedure TFrmExportDBF.btnExportClick(Sender: TObject);
var
  SqlText:string; //导出执行sql
  DBFFileName:string; //导出文件名 包含路径
  clienttmp:TClientDataSet; //DBF数据集
begin
  inherited;
  if Dlcds.state in [DB.dsEdit,DB.dsInsert] then
  begin
    Dlcds.Post;
    DLCDS.ApplyUpdates(-1);
  end;
  if edtbtnPath.Text='' then
  begin
    ShowMsg('导出文件名不能为空！','',48);
    Exit;
  end;
  DBFFileName := edtbtnPath.Text;

  StartWaitWindow('正在导出相关数据,请稍候......');
  try
    SqlText := GenerateSQL;
    clienttmp := TClientDataSet.Create(nil);
    AutoFree(clienttmp);
    TMidProxy.SqlOpen(SqlText,clienttmp);
    if clienttmp.IsEmpty then
    begin
      EndWaitWindow;
      ShowMsg('未查询到符合条件的数据!','',48);
      Exit;
    end;
    qxprt3dbfWT.DataSet := clienttmp;
    qxprt3dbfWT.FileName := DBFFileName;
    Application.ProcessMessages;
    qxprt3dbfWT.Execute;
    EndWaitWindow;
    if FileExists(DBFFileName) then
    begin
      ShowMsgSure('数据导出成功');
    end;
  except
    on ex:Exception do
    begin
      EndWaitWindow;
      ShowMsg('未查询到符合条件的数据!','',48);
      WriteErrorLog(Format('%s:%s',[FormatDateTime('yyyy-mm-dd hh:mm:ss',Now),ex.Message]));      
    end;

  end;
end;

procedure TFrmExportDBF.btnSQLClick(Sender: TObject);
var
  frmExport:TfrmExportPre;
  dbfSql:string;
begin
  inherited;
  dbfSql :=GenerateSQL;
  frmExport :=TfrmExportPre.Create(nil);
  AutoFree(frmExport);
  frmExport.DBFsql := dbfSql;
  frmExport.DBFName := edtbtnPath.Text;
  frmExport.ShowModal;
end;

procedure TFrmExportDBF.CheckData;
begin
  inherited;
  
end;

//constructor TFrmExportDBF.Create(Aowner: TComponent);
// const
//    DBFSQL ='SELECT * FROM VsCHDBFStructure  ORDER BY xh';
//begin
//  inherited Create(Aowner,EuVsDBF,'SELECT * FROM VsCHDBFTable order by xh');
//  mtblhDBFTable.Active := True;
//  //获取DBF上报字段
////  TMidProxy.SqlOpen(DBFSQL,clientdtDBF);
//  dlclntdtstDBF.MidClassName := EuVsDBF;
//  dlclntdtstDBF.Mid_Open(DBFSQL);
//  mtblhDBF.Active := True;
//  TMidProxy.SqlOpen('select * from VsCHDBFType',clientdtDBFType);
//end;

procedure TFrmExportDBF.dbgrdhDBFDblClick(Sender: TObject);
begin
  inherited;
  SelSourceField;
end;

procedure TFrmExportDBF.dbgrdh_DLCDSColumns1UpdateData(Sender: TObject;
  var Text: string; var Value: Variant; var UseText, Handled: Boolean);
const
  sql='select 1 from VsCHDBFTable where tablecus =^%s^';
begin
  inherited;
  if Value <> '' then
  begin
    if  ExistsRecord(Format(sql,[Value])) then
    begin
      ShowMsg('存在相同的别名,请检查!','',48);
      Handled :=True;
    end;
  end;
end;

procedure TFrmExportDBF.dtstdrvrhddmtblh1UpdateRecord(DataDriver: TDataDriverEh;
  MemTableData: TMemTableDataEh; MemRec: TMemoryRecordEh);
  procedure UpdateDBF(const Flag:Integer);
   const
     SQL ='UPDATE dbo.VsCHDBFStructure SET FieldName=^%s^,FieldSQL=^%s^,FieldTable=^%s^,'
          +'FieldTableCus=^%s^ WHERE fid=^%s^ AND tid=^%s^';
   var
    FName,FSQL,FTable,FTableCus,Fid,Tid:string;
  begin
    case Flag of
      0: //更新
      begin
        if MemRec.DataValues['FieldName',dvvCurValueEh]=null then
          FName :=''
        else
         FName := MemRec.DataValues['FieldName',dvvCurValueEh];
         
        if MemRec.DataValues['FieldSQL',dvvCurValueEh]=null then
          FSQL :=''
        else
         FSQL := MemRec.DataValues['FieldSQL',dvvCurValueEh];
         
        if MemRec.DataValues['FieldTable',dvvCurValueEh]=null then
          FTable :=''
        else
         FTable := MemRec.DataValues['FieldTable',dvvCurValueEh];

        if MemRec.DataValues['FieldTableCus',dvvCurValueEh]=null then
          FTableCus :=''
        else
         FTableCus := MemRec.DataValues['FieldTableCus',dvvCurValueEh];
        Fid:=MemRec.DataValues['FID',dvvCurValueEh];
        Tid:=MemRec.DataValues['TID',dvvCurValueEh];

        TMidProxy.SqlExecute(Format(SQL,[FName,FSQL,FTable,FTableCus,Fid,Tid]));
      end;
    end;
  end;
begin
  inherited;
  //修改
  if MemRec.UpdateStatus =usModified then
  begin
    UpdateDBF(0);
  end ;
  //添加
//  else if MemRec.UpdateStatus = usInserted then
//  begin
//    UpdateDBF(1);
//  end;
end;

procedure TFrmExportDBF.edtbtnPathClickBtn(Sender: TObject);
var
  filename :string;
begin
  inherited;
  SaveTFiledlgDBFFile.Filter := 'dBase文件(*.DBF)';
  if SaveTFiledlgDBFFile.Execute then
  begin
    filename := SaveTFiledlgDBFFile.FileName;
    if Pos('.dbf',filename)<1 then
    begin
      filename := filename+'.DBF';
    end;
    edtbtnPath.Text := filename;
  end;

end;

procedure TFrmExportDBF.FormShow(Sender: TObject);
begin
  inherited;
  TMidProxy.SqlOpen('select * from VsCHDBFType',clientdtDBFType);
  //赋值显示DBF类型
  if TypeID <> '' then
  begin
    if clientdtDBFType.Active and (not clientdtDBFType.IsEmpty) then
    begin
      suiLkcbbDBFType.KeyValue := TypeID;
      ReloadDBFField;
    end;
  end;
  
end;

/// <summary>
/// 生成DBF导出的SQL
/// </summary>
/// <returns>SQL</returns>
function TFrmExportDBF.GenerateSQL: string;
 const
    SQL='SELECT a.*,b.TableRel, b.LTableName,b.LtableCus,b.LTableRel FROM dbo.VsCHDBFStructure a'
       +' LEFT JOIN (SELECT c.*,d.TableName LTableName,d.TableCus LtableCus,d.TableRel LTableRel FROM dbo.VsCHDBFTable c'
       +' LEFT JOIN dbo.VsCHDBFTable d ON c.linktablecus =d.TableCus'
       +' ) b ON a.FieldTable =b.TableName AND a.FieldTableCus = b.TableCus';
       
var
  SQLField,SQLCondition:string; //字段语句，表关系连接语句
  IsEnable:Boolean;  //字段是否启用
  FieldName,DBFName,TableRel:string;//字段名称  、DBF上报名称、源表关联
  LTableName,LtableCus,LTableRel:string;//关联表、关联表别名、关联关系
  FieldTable,FieldtaleCus:string;
  dtDBF:TClientDataSet;  //DBF整合数据集 
  StrDateStart,StrDateEnd:string;
  strLeft1,strLeft2:string;
begin
  Result :='';

  if mtblhDBF.Active and (not mtblhDBF.IsEmpty) then
  begin
    if mtblhDBF.State in [dsInsert,dsEdit] then
     mtblhDBF.Post;
    mtblhDBF.ApplyUpdates(-1);
    
    if advdtmpckrEnd.Date < advdtmpckrStart.Date then
    begin
      ShowMsg('出院日期小于入院日期','',48);
      Exit;
    end;
    StrDateStart := DateToStr(advdtmpckrStart.Date);
    StrDateEnd := DateToStr(advdtmpckrEnd.Date);
    dtDBF := TClientDataSet.Create(nil);
    AutoFree(dtDBF);
    TMidProxy.SqlOpen(SQL,dtDBF);
    with dtDBF do
    begin
      First;
      while not Eof do
      begin
        IsEnable := FieldByName('DBFBZ').AsBoolean;
        //字段启用
        if IsEnable then
        begin
          if FieldByName('FieldSQL').AsString <> '' then
            FieldName :=FieldByName('FieldSQL').AsString
          else
            FieldName := FieldByName('FieldName').AsString;
          DBFName := FieldByName('DBFName').AsString;
          FieldName := StringReplace(FieldName,#39,'^',[rfReplaceAll,rfIgnoreCase]);
          if FieldName <> '' then
          begin
            SQLField :=SQLField +format(',%s %s',[FieldName,DBFName]);
          //获取源表关联
            TableRel:=FieldByName('TableRel').AsString;
            FieldTable := FieldByName('FieldTable').AsString;
            FieldtaleCus := FieldByName('FieldTableCus').AsString;
            LTableName := FieldByName('LTableName').AsString;
            LtableCus := FieldByName('LtableCus').AsString;
            LTableRel := FieldByName('LTableRel').AsString;
            strLeft1 :=  Format(' Left Join %s %s on %s',[LTableName,LtableCus,LTableRel]);
            strLeft2 := Format(' Left Join %s %s on %s',[FieldTable,FieldtaleCus,TableRel]);
            //存在关联
            if TableRel <>  '' then
            begin         
              //先添加上级关联
              if LTableName <> '' then
              begin
               
                if Pos(strLeft1,SQLCondition)<=0 then
                  SQLCondition := SQLCondition + #13#10+strLeft1;
                
                if Pos(strLeft2,SQLCondition)<=0 then              
                   SQLCondition := SQLCondition + #13#10+strleft2;
              end
              else
              begin
                if Pos(strLeft2,SQLCondition)<=0 then              
                   SQLCondition := SQLCondition + #13#10+strleft2;
              end;
              
            end
            else
            begin
              if FieldTable <> '' then  
              begin
                if Pos(Format(' %s %s ',[FieldTable,FieldtaleCus]),SQLCondition)<=0 then
                begin
                  SQLCondition := Format(' %s %s ',[FieldTable,FieldtaleCus]);
                end;
              end;
                
            end;
          end;          
        end;
        Next;
      end;
    end;
    if SQLField<>'' then
    begin
      SQLField := Copy(SQLField,2,length(SQLField)-1)
    end;
  end;
  Result := Format('Select %s from %s where Ch0A27 >=^%s^ and Ch0A27 <=^%s^',[SQLField,SQLCondition,StrDateStart,StrDateEnd]);
end;

procedure TFrmExportDBF.ReloadDBFField;
const
   SQL ='SELECT a.FID,a.TID,a.FieldName DBFFieldName,a.FieldDes,b.FieldName,'
       +' b.FieldSQL,b.FieldTable,b.FieldTableCus FROM VsCHDBFField a LEFT JOIN '
       +' VsCHDBFStructure b ON a.TID=b.tid  WHERE a.BZ =1 and a.TID=^%s^ AND a.FID=b.fid  ORDER BY a.xh';
begin
  if mtblhDBF.Active and (not mtblhDBF.IsEmpty) then
    mtblhDBF.Close;
    
  dlclntdtstDBF.MidClassName := EuVsDBF;
  dlclntdtstDBF.Mid_Open(Format(SQL,[TypeID]));
  mtblhDBF.Active := True;
  mtblhDBF.Open;
end;

procedure TFrmExportDBF.SaveDBFField;
const
  SQL ='INSERT INTO VsCHDBFStructure(TID,FID) VALUES(^%s^,^%s^)';
var
 tid,fid:string;
 num:Integer;
begin
  if mtblhDBF.Active and (not mtblhDBF.IsEmpty) then
  begin
    num := mtblhDBF.RecNo;
    with mtblhDBF do
    begin
      DisableControls;
      First;
      while not Eof do
      begin
        tid := FieldByName('TID').AsString;
        fid:=FieldByName('FID').AsString;
        if not ExistsRecord(Format('SELECT * FROM VsCHDBFStructure where TID=^%s^ and FID=^%s^',[tid,fid])) then
        begin
          TMidProxy.SqlExecute(Format(SQL,[tid,fid]));
        end;
        Next;
      end;
      EnableControls;
    end;
    mtblhDBF.RecNo := num;
  end;
end;

procedure TFrmExportDBF.SelSourceField;
var
  frmSource:TFrmSource;
begin                                          
  frmSource := TfrmSource.Create(nil);
  autofree(frmSource);
  frmSource.ShowMode := EuShowModel;
  frmSource.ShowModal;
  
  if frmSource.TableName<> '' then
  begin
    with mtblhDBF do
    begin
      Edit;
      FieldByName('FieldTable').AsString := frmSource.TableName;
      FieldByName('FieldTableCus').AsString := frmSource.TableCus;
      //别名为空 则取表名
      if frmSource.TableCus='' then
        frmSource.TableCus :=frmSource.TableName;

      FieldByName('FieldName').AsString :=frmSource.TableCus+'.'+frmSource.FieldName;
    end;
  end;

end;

procedure TFrmExportDBF.suiLkcbbDBFTypeCloseUp(Sender: TObject);
var
 tmpID:string;
begin
  inherited;
  if suiLkcbbDBFType.KeyValue=null then
    Exit;
  tmpID := suiLkcbbDBFType.KeyValue;
  if TypeID<> tmpID then
  begin
    TypeID := tmpID;
    //加载选择类型的字段
    ReloadDBFField;
  end;
end;

initialization
  Classes.RegisterClass(TFrmExportDBF);
finalization
  Classes.UnRegisterClass(TFrmExportDBF);


end.
