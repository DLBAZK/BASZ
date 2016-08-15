/// <summary>
/// 流转动作配置
/// </summary>
/// <author>jdl</author>
///<date>2016-08-15</date>

unit USZActionCon;

interface
  uses SysUtils,Classes,UVsMidStand;

  type
   TSZActionCon =class(TVsMidStand)
   public
     constructor Create;override;
   end;
implementation
{ TSZActionCon }

constructor TSZActionCon.Create;
begin
  inherited;
  SelectSql:='';
end;

initialization
    Classes.RegisterClass(TSZActionCon);
finalization
    classes.UnRegisterClass(TSZActionCon);

end.
