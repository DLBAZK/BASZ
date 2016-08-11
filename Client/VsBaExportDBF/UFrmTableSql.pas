unit UFrmTableSql;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFrmSuiDBForm, DB, ActnList, DBClient, UDlClientDataset, DosMove,
  AdvPanel, AdvAppStyler, AdvToolBar, AdvToolBarStylers, AdvOfficeStatusBar,
  AdvOfficeStatusBarStylers, ExtCtrls, SUIButton, AdvGlowButton,
  DBGridEhGrouping, GridsEh, DBGridEh, AdvSplitter, SynEditHighlighter,
  SynHighlighterSQL, SynEdit, SynMemo, SynEditor;

type
  TfrmTableSQL = class(TFrmSuiDBForm)
    advpnl1: TAdvPanel;
    btnExecute: TAdvGlowButton;
    actExecute: TAction;
    btnExecute1: TAdvGlowButton;
    btnExecute2: TAdvGlowButton;
    actOK: TAction;
    syndtrSQL: TSynEditor;
    synsqlsyn2: TSynSQLSyn;
    advspltr1: TAdvSplitter;
    dbgrdhResult: TDBGridEh;
    clientdtResult: TClientDataSet;
    procedure btnExecuteClick(Sender: TObject);
    procedure btnExecute1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    //返回的表SQL语句
    TableSQL:string;
  end;

var
  frmTableSQL: TfrmTableSQL;

implementation
  uses UMidProxy,UGFun;
{$R *.dfm}

procedure TfrmTableSQL.btnExecute1Click(Sender: TObject);
begin
  TableSQL := syndtrSQL.Text;
end;
/// <summary>
/// 执行SQL查询
/// </summary>
/// <param name="Sender"></param>
procedure TfrmTableSQL.btnExecuteClick(Sender: TObject);
var
  sqlText:string;
  i:Integer;
  col:TColumnEh;
begin
   //查询数据
  if syndtrSQL.Text <> '' then
  begin
    sqlText := syndtrSQL.Text;

    try
      StartWaitWindow('正在查询数据...');
      TMidProxy.SqlOpen(sqlText,clientdtResult);
      ds1.DataSet :=clientdtResult;

      for I := 0 to clientdtResult.Fields.Count - 1 do
      begin
        if I>-1 then
        begin
          col := dbgrdhResult.Columns.Add;
          col.FieldName := clientdtResult.Fields[i].FieldName;
          col.Title.Caption := clientdtResult.Fields[i].FieldName;
          col.AutoFitColWidth := True;
          col.TextEditing :=False;
        end
        else
          Break;
      end;
      dbgrdhResult.DataSource :=ds1;
    finally
      EndWaitWindow;
    end;
    
  end;
end;

procedure TfrmTableSQL.FormShow(Sender: TObject);
begin
  inherited;
  if TableSQL <> '' then
    syndtrSQL.Lines.Add(TableSQL);
end;

end.
