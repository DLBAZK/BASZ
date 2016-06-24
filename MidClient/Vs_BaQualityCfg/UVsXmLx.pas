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
       ExecuteBy(Format('update Vszmzlpf set xmlx=^%s^ where xmlx=^%s^;update Vssjpf set xmlx=^%0:s^ where xmlx=^%1:s^ ',
            [newdm,olddm]));
  end;
end;

procedure TVsXmLx.MyBefoUpdate(Sender: TObject; SourceDS: TDataSet;
  DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind; var Applied: Boolean);
var
  sql1,sql2,sql3,sql4,newty,oldty:string;
begin
  inherited;
  sql1 := Format('select top 1 1 from Vszmzlpf where xmlx =^%s^ and isty=0',[DeltaDs.FieldByName('dm').OldValue]);
  sql2 := Format('select top 1 1 from Vssjpf where xmlx =^%s^ and isty=0',[DeltaDs.FieldByName('dm').OldValue]);
  sql3 :=Format('delete from Vsxmlx where dm=^%s^',[DeltaDs.FieldByName('dm').OldValue]);
  sql4 := Format('update Vsxmlx set isty=^%s^ where isty=^%s^ and dm=^%s^',[DeltaDS.FieldByName('isty').NewValue,DeltaDS.FieldByName('isty').OldValue,
                     DeltaDS.FieldByName('dm').OldValue]);
  if UpdateKind=ukDelete then
  begin
    Applied :=True;
    if CheckExistsRecord(sql1) then
    begin
      raise exception.Create('项目类型已使用，不能删除！');
    end
    else if CheckExistsRecord(sql2) then
    begin
      raise Exception.Create('项目类型已使用，不能删除！');
    end;
    Applied :=False;
    ExecuteBy(sql3);
  end
  else if UpdateKind = ukModify then
  begin
    newty := DeltaDS.FieldByName('isty').NewValue;
    oldty := DeltaDS.FieldByName('isty').OldValue;

    if (newty<>'') and (newty<>oldty) then
    begin
      Applied := True;
   
      if CheckExistsRecord(sql1) then
      begin
        raise exception.Create('项目类型已使用，不能停用！');
      end
      else if CheckExistsRecord(sql2) then
      begin
        raise Exception.Create('项目类型已使用，不能停用！');
      end;
      Applied :=False;
      ExecuteBy(sql4);
    end;


  end;
end;

initialization
  Classes.RegisterClass(TVsXmLx);
finalization
  Classes.UnRegisterClass(TVsXmLx);
end.
