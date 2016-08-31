/// <summary>
/// ≤°∞∏ªÿ ’
/// </summary>
/// <author>jdl</author>
///<date>2016-08-15</date>

unit USZReclaim;

interface
  uses SysUtils,Classes,UVsMidStand;

  type
   TSZReclaim =class(TVsMidStand)
   public
     constructor Create;override;
   end;
implementation
{ TSZActionCon }

constructor TSZReclaim.Create;
begin
  inherited;
  SelectSql:='';
end;

initialization
    Classes.RegisterClass(TSZReclaim);
finalization
    classes.UnRegisterClass(TSZReclaim);

end.

