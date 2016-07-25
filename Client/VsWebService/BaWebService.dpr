library BaWebService;

uses
  SysUtils,
  Classes,
  Forms,
  ComServ,
  UDM_Img in '..\BaseForm\UDM_Img.pas' {DM_Img: TDataModule},
  UFrmBForm in '..\BaseForm\UFrmBForm.pas' {BForm},
  UFrmSuiBForm in '..\BaseForm\UFrmSuiBForm.pas' {FrmSuiBForm},
  UFrmSuiBListForm in '..\BaseForm\UFrmSuiBListForm.pas' {FrmSuiBListForm},
  UFrmSuiDBForm in '..\BaseForm\UFrmSuiDBForm.pas' {FrmSuiDBForm},
  UFrmSuiDBListForm in '..\BaseForm\UFrmSuiDBListForm.pas' {FrmSuiDBListForm},
  UGFun in '..\..\Public\UGFun.pas',
  UGVar in '..\..\Public\UGVar.pas',
  UFrmMain in 'UFrmMain.pas' {FrmYinHaiMain},
  UPVar in 'UPVar.pas',
  uLkJSON in 'uLkJSON.pas',
  YinHaiService in 'YinHaiService.pas';

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
