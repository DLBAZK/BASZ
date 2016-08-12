/// <summary>
/// DBF上报设置
/// </summary>
/// <author>jdl</author>
///<date> 2016-07-7 </date>
library BaExportDBF;

uses
  ComServ,
  Forms,
  UDM_Img in '..\BaseForm\UDM_Img.pas' {DM_Img: TDataModule},
  UFrmBForm in '..\BaseForm\UFrmBForm.pas' {BForm},
  UFrmSuiBForm in '..\BaseForm\UFrmSuiBForm.pas' {FrmSuiBForm},
  UFrmSuiBListForm in '..\BaseForm\UFrmSuiBListForm.pas' {FrmSuiBListForm},
  UFrmSuiDBForm in '..\BaseForm\UFrmSuiDBForm.pas' {FrmSuiDBForm},
  UFrmSuiDBListForm in '..\BaseForm\UFrmSuiDBListForm.pas' {FrmSuiDBListForm},
  UGFun in '..\..\Public\UGFun.pas',
  UGVar in '..\..\Public\UGVar.pas',
  UFrmExportDBF in 'UFrmExportDBF.pas' {FrmExportDBF},
  UFrmSource in 'UFrmSource.pas' {frmSource},
  UFrmExportPre in 'UFrmExportPre.pas' {frmExportPre},
  UFrmDBFTable in 'UFrmDBFTable.pas' {frmDBFTable},
  UFrmTableRel in 'UFrmTableRel.pas' {frmTableRel},
  UFrmTableSql in 'UFrmTableSql.pas' {frmTableSQL},
  UFrmDBFTheme in 'UFrmDBFTheme.pas' {frmDBFTheme};

exports
  DllGetClassObject,
  DllCanUnloadNow,
  DllRegisterServer,
  DllUnregisterServer;

{$R *.RES}
Function DllObjFactory(MainInfo:TMainInfo;FormClass:String):TFormClass;
Begin
  Application.Handle:=MainInfo.MainAppHandle;    //dll与主程序在一个Application中
  Application.OnException:=MainInfo.MainAppException;
  FMyAppServer:=MainInfo.MainAppServer;
  G_MainInfo:=MainInfo;
  Result:=NewDllForm(FormClass);
End;

Exports
  DllObjFactory;
begin
end.
