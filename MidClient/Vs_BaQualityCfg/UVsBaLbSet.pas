/// <summary>
/// 病历类别设置业务类
/// </summary>
/// <author> JDL </author>
/// <date> 2016-06-16 </date>
unit UVsBaLbSet;

interface

Uses
   SysUtils,Classes,UVsMidStand,DB,DBClient,UGMidVar;

Type
  TVsBaLbSet=Class(TVsMidStand)
  Public
    Constructor Create;Override;
  Published
    Procedure MyBefoUpdate(Sender: TObject; SourceDS: TDataSet;
                           DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind; var Applied: Boolean);Override;
    procedure MyAfterUpdate(Sender: TObject; SourceDS: TDataSet;
                            DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind);Override;
  End;

implementation
Uses Variants,UCommon;

{ TVsZmzlpf }

constructor TVsBaLbSet.Create;
begin
  inherited;
  SelectSql:='';
end;



procedure TVsBaLbSet.MyAfterUpdate(Sender: TObject; SourceDS: TDataSet;
  DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind);
var
  newdm,olddm:string;
  sql:string;
begin
  inherited;
  //更新关联表
  if UpdateKind = ukModify then
  begin
    //代码已修改
    if DeltaDS.FieldByName('dm').NewValue<>Unassigned then
    begin
      newdm := DeltaDS.FieldByName('dm').NewValue;
      olddm := DeltaDS.FieldByName('dm').OldValue;
      sql :=Format('update VsPJBA0A set zklb=^%s^ where zklb=^%s^;update Vszmzlpf set zklb = ^%0:s^ where zklb=^%1:s^',[newdm,olddm]);
      ExecuteBy(sql);
    end;
  end;

end;

procedure TVsBaLbSet.MyBefoUpdate(Sender: TObject; SourceDS: TDataSet;
  DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
  inherited;

end;

initialization
  Classes.RegisterClass(TVsBaLbSet);
finalization
  Classes.UnRegisterClass(TVsBaLbSet);

end.
