library M_BaQualityCfg;

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
  UGMidVar,
  UVsMidClassList in '..\BaseClass\UVsMidClassList.pas',
  UVsMidStand in '..\BaseClass\UVsMidStand.pas',
  UVsMidPersistent in '..\BaseClass\UVsMidPersistent.pas',
  UVsRankSet in 'UVsRankSet.pas',
  UVsSjpf in 'UVsSjpf.pas',
  UVsZmzlpf in 'UVsZmzlpf.pas',
  UVsBaLbSet in 'UVsBaLbSet.pas',
  UVsXmLx in 'UVsXmLx.pas',
  UVsTYCH0E in 'UVsTYCH0E.pas',
  UVsTYCH0R in 'UVsTYCH0R.pas',
  UVsCHTYWt47 in 'UVsCHTYWt47.pas';

{$R *.res}

/// <summary>
/// 获取业务类类信息
/// </summary>
/// <param name="OperationClass"> 业务类类名</param>
/// <returns>类信息</returns>
Function NewOperationClass(OperationClass:String;ServerInfo:TServerInfo):TVsMidPersistentClass;
Begin
  InitMidDll(ServerInfo);
  Result:=GetOperationClass(OperationClass);
End;

Exports
  NewOperationClass;
begin
end.
