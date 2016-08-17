/// <summary>
/// ����ʾ��
/// </summary>
/// <author>jdl</author>
///<date>2016-08-15</date>

library BASZ;

{ Important note about DLL memory management: ShareMem must be the
  first unit in your library's USES clause AND your project's (select
  Project-View Source) USES clause if your DLL exports any procedures or
  functions that pass strings as parameters or function results. This
  applies to all strings passed to and from your DLL--even those that
  are nested in records and classes. ShareMem is the interface unit to
  the BORLNDMM.DLL shared memory manager, which must be deployed along
  with your DLL. To avoid using BORLNDMM.DLL, pass string information
  using PChar or ShortString parameters. }

uses
  SysUtils,
  Classes,
  Forms,
  UDM_Img in '..\BaseForm\UDM_Img.pas' {DM_Img: TDataModule},
  UFrmBForm in '..\BaseForm\UFrmBForm.pas' {BForm},
  UFrmSuiBForm in '..\BaseForm\UFrmSuiBForm.pas' {FrmSuiBForm},
  UFrmSuiBListForm in '..\BaseForm\UFrmSuiBListForm.pas' {FrmSuiBListForm},
  UFrmSuiDBForm in '..\BaseForm\UFrmSuiDBForm.pas' {FrmSuiDBForm},
  UFrmSuiDBListForm in '..\BaseForm\UFrmSuiDBListForm.pas' {FrmSuiDBListForm},
  UGFun in '..\..\Public\UGFun.pas',
  UGVar in '..\..\Public\UGVar.pas',
  UFrmActionCon in 'UFrmActionCon.pas' {frmActionCon},
  UFrmReason in 'UFrmReason.pas' {frmRevokeReason},
  UFrmReclaim in 'UFrmReclaim.pas' {frmReclaim};

{$R *.res}
 Function DllObjFactory(MainInfo:TMainInfo;FormClass:String):TFormClass;
Begin
  Application.Handle:=MainInfo.MainAppHandle;    //dll����������һ��Application��
  Application.OnException:=MainInfo.MainAppException;
  FMyAppServer:=MainInfo.MainAppServer;
  G_MainInfo:=MainInfo;
  Result:=NewDllForm(FormClass);
End;

Exports
  DllObjFactory;
begin
end.
