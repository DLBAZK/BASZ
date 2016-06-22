/// <summary>
/// 病历项目类型设置业务类
/// </summary>
/// <author> JDL </author>
/// <date> 2016-06-22 </date>
unit UVsXmLx;

interface

Uses
   SysUtils,Classes,UVsMidStand,DB,DBClient,UGMidVar;

Type
  TVsXmLx=Class(TVsMidStand)
  Public
    Constructor Create;Override;
  Published
    Procedure MyBefoUpdate(Sender: TObject; SourceDS: TDataSet;
                           DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind; var Applied: Boolean);Override;
    procedure MyAfterUpdate(Sender: TObject; SourceDS: TDataSet;
                            DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind);Override;
  End;
implementation

{ TVsXmLx }

constructor TVsXmLx.Create;
begin
  inherited;
  SelectSql := '';
end;

procedure TVsXmLx.MyAfterUpdate(Sender: TObject; SourceDS: TDataSet;
  DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind);
var
  newdm,olddm:string;
begin
  inherited;
  if UpdateKind = ukModify then
  begin
    newdm :=DeltaDs.FieldByName('dm').NewValue;
    olddm := DeltaDs.FieldByName('dm').OldValue;
    if newdm<>olddm then
       ExecuteBy(Format('update Vszmzlpf set xmlx=^%s^ where xmlx=^%s^',
            [newdm,olddm]));
  end;
end;

procedure TVsXmLx.MyBefoUpdate(Sender: TObject; SourceDS: TDataSet;
  DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind; var Applied: Boolean);
begin
  inherited;

end;

initialization
  Classes.RegisterClass(TVsXmLx);
finalization
  Classes.UnRegisterClass(TVsXmLx);
end.
