/// <summary>
/// ²¡°¸×¢Ïú
/// </summary>
/// <author>jdl</author>
///<date>2016-08-25</date>


unit USZBACancel;

interface
  uses SysUtils,Classes,DBClient,DB,Variants,UVsMidStand;

  type
   TSZBACancel =class(TVsMidStand)
   public
     constructor Create;override;
   end;

implementation

{ TSZBACancel }

constructor TSZBACancel.Create;
begin
  inherited;
  SelectSql:='';
  
end;

initialization
  RegisterClass(TSZBACancel);
finalization
  UnRegisterClass(TSZBACancel);
end.
