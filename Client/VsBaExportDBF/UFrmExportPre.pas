unit UFrmExportPre;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFrmSuiDBForm, DB, ActnList, DBClient, UDlClientDataset, DosMove,
  AdvPanel, AdvAppStyler, AdvToolBar, AdvToolBarStylers, AdvOfficeStatusBar,
  AdvOfficeStatusBarStylers, ExtCtrls, AdvGlowButton, TFlatPanelUnit,
  DBGridEhGrouping, GridsEh, DBGridEh, AdvSplitter, SynEdit, QExport3,
  QExport3DBF, SynEditHighlighter, SynHighlighterSQL, SynMemo;

type
  TfrmExportPre = class(TFrmSuiDBForm)
    fltpnl1: TFlatPanel;
    btnOK: TAdvGlowButton;
    btnExport: TAdvGlowButton;
    dbgrdh1: TDBGridEh;
    qxprt3dbfWT42: TQExport3DBF;
    clientdtDBF: TClientDataSet;
    synsqlsyn2: TSynSQLSyn;
    fltpnl2: TFlatPanel;
    synmDBFSql: TSynMemo;
    advspltr1: TAdvSplitter;
    procedure FormShow(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnExportClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    //DBF查询Sql
    DBFsql:string;
    //DBF导出文件名
    DBFName:string;
  end;

var
  frmExportPre: TfrmExportPre;

implementation
  uses UMidProxy,UGFun,UGVar,UCommon;
{$R *.dfm}

procedure TfrmExportPre.btnExportClick(Sender: TObject);
begin
  inherited;
  if not clientdtDBF.Active or(clientdtDBF.IsEmpty) then
  begin
    TMidProxy.SqlOpen(synmDBFSql.Text,clientdtDBF);
    if clientdtDBF.IsEmpty then
    begin
      ShowMsgSure('未查询到符合的数据!');
      Exit;
    end;
  end;
  if DBFName ='' then
    DBFName :=G_MainInfo.MainDir+'卫统上报.DBF';
    
  StartWaitWindow('正在导出相关数据,请稍候......');

  try
    qxprt3dbfWT42.FileName :=DBFName;
    qxprt3dbfWT42.DataSet := clientdtDBF;
    qxprt3dbfWT42.Execute;
    Application.ProcessMessages;
    if FileExists(DBFName) then
      ShowMsgSure('导出成功，'+DBFName);
  finally
    EndWaitWindow;
  end;

end;

procedure TfrmExportPre.btnOKClick(Sender: TObject);
var
 i:Integer;
 col:TColumnEh;
begin
  inherited;
  StartWaitWindow('正在查询数据...');
  try
    dbgrdh1.DataSource := nil;
    TMidProxy.SqlOpen(synmDBFSql.Text,clientdtDBF);
    if not clientdtDBF.IsEmpty then
    begin
      for I := 0 to clientdtDBF.Fields.Count - 1 do                     
      begin
        if i >10 then
         Break;

        col :=dbgrdh1.Columns.Add;
        col.FieldName := clientdtDBF.Fields[i].FieldName;
        col.Title.Caption := clientdtDBF.Fields[i].FieldName;
        col.AutoFitColWidth := True;
        col.TextEditing :=False;
      end;
    end;
    dbgrdh1.DataSource := ds1;
  finally
    EndWaitWindow;
  end;

end;

procedure TfrmExportPre.FormShow(Sender: TObject);
begin
  inherited;
  synsqlsyn2.CommentAttri.Foreground := clGreen;
  synsqlsyn2.DelimitedIdentifierAttri.Foreground :=clBlue;
  synsqlsyn2.FunctionAttri.Foreground :=clFuchsia;
  synsqlsyn2.KeyAttri.Foreground := clBlue;
  synsqlsyn2.StringAttri.Foreground:= clRed;
  synmDBFSql.Lines.Add(Escape(DBFsql));
end;

end.
