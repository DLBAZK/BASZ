/// <summary>
/// 病案类别设置
/// </summary>
/// <author> JDL </author>
/// <date> 2016-06-16 </date>
unit UFrmLBSet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFrmSuiDBListForm, DBGridEhGrouping, PrnDbgeh, DB, ActnList,
  DBClient, UDlClientDataset, DosMove, AdvPanel, AdvAppStyler, AdvToolBar,
  AdvToolBarStylers, AdvOfficeStatusBar, AdvOfficeStatusBarStylers, GridsEh,
  DBGridEh, ExtCtrls, AdvGlowButton,UVsMidClassList;

type
  TfrmLBSet = class(TFrmSuiDBListForm)
    procedure DLCDSAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    Constructor Create(Aowner:TComponent);Override;
    Procedure CheckData;Override;
  end;

var
  frmLBSet: TfrmLBSet;

implementation
 uses
    UGFun,UGVar;
{$R *.dfm}

procedure TfrmLBSet.CheckData;
begin
  inherited;
  if DLCDS.FieldByName('dm').AsString = '' then
  begin
    raise exception.Create('类别代码不能为空！');
  end;
  if DLCDS.FieldByName('dmmc').AsString = '' then
  begin
    raise Exception.Create('类别名称不能为空！');
  end;
end;

constructor TfrmLBSet.Create(Aowner: TComponent);
begin
  inherited Create(Aowner,EuVsBaLbSz,'select * from Vszklb order by dm');
end;

procedure TfrmLBSet.DLCDSAfterInsert(DataSet: TDataSet);
begin
  inherited;
  SetFieldValue('isTy',sBoolFalse,Dlcds,False);
  SetFieldValue('isChoice',sBoolFalse,Dlcds,False);
end;

initialization
  Classes.RegisterClass(TfrmLBSet);
finalization
  Classes.UnRegisterClass(TfrmLBSet);
end.
