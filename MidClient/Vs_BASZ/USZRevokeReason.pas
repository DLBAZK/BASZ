/// <summary>
/// 流转动作撤销原因配置
/// </summary>
/// <author>jdl</author>
///<date>2016-08-15</date>

unit USZRevokeReason;

interface
  uses SysUtils,Classes,UVsMidStand;

  type
   TSZRevokeReason =class(TVsMidStand)
   public
     constructor Create;override;
   end;
implementation
{ TSZActionCon }

constructor TSZRevokeReason.Create;
begin
  inherited;
  SelectSql:='';
end;

initialization
    Classes.RegisterClass(TSZRevokeReason);
finalization
    classes.UnRegisterClass(TSZRevokeReason);

end.
