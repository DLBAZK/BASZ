/// <summary>
///  DBF…œ±®…Ë÷√
/// </summary>
/// <date> 2016-07-07 </date>
/// <author> JDL </author>
unit UVsCHDBF;

interface
         
Uses
   SysUtils,Classes,UVsMidStand,DB,DBClient;

Type
  TVsCHDBF=Class(TVsMidStand)
  Public
    Constructor Create;Override;
  End;

implementation

{ TVsBZRanger }

constructor TVsCHDBF.Create;
begin
  inherited;
  SelectSql:='';
end;
    
initialization
  Classes.RegisterClass(TVsCHDBF);
finalization
  Classes.UnRegisterClass(TVsCHDBF);
end.
