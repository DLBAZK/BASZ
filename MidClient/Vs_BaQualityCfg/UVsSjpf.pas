/// <summary>
/// 病案数据评分设置业务类
/// </summary>
/// <author> Lisa </author>
/// <date> 2016-05-17 </date>
unit UVsSjpf;

interface

Uses
  SysUtils,Classes,UVsMidStand,DB,DBClient,UGMidVar;

Type
  TVsSjpf=Class(TVsMidStand)
  Public
    Constructor Create;Override;
    Function MidQuery:OleVariant;Override;
  published
    procedure MyAfterUpdate(Sender: TObject; SourceDS: TDataSet;
                            DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind);Override;
    Procedure MyBefoUpdate(Sender: TObject; SourceDS: TDataSet;
                           DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind; var Applied: Boolean);Override;  
  End;

implementation
Uses Variants,UCommon;

{ TVsSjpf }

constructor TVsSjpf.Create;
begin
  inherited;
  SelectSql:='Select * From Vssjpf Order By xh';
end;

function TVsSjpf.MidQuery: OleVariant;
begin
  PQuery.SQL.Text:=Escape(SelectSQL);
  PQuery.Open;
  PDsp.DataSet:=PQuery;
  Result:=PDsp.Data;
end;

procedure TVsSjpf.MyAfterUpdate(Sender: TObject; SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
  UpdateKind: TUpdateKind);
begin
  inherited;
  if UpdateKind=ukModify then
  begin
    ExecuteBy(Format('update VsBAsyzk Set Subject=^%s^ Where Subject=^%s^',
                     [DeltaDs.FieldByName('dm').NewValue,DeltaDs.FieldByName('dm').OldValue]));
  End;
end;

procedure TVsSjpf.MyBefoUpdate(Sender: TObject; SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
  UpdateKind: TUpdateKind; var Applied: Boolean);
begin
  inherited;
  DeltaDs.Edit;
  DeltaDs.Post;
  if UpdateKind=ukDelete then
     begin
       Applied:=true;
       If CheckExistsRecord(Format('Select Top 1 1 From VsBAsyzk Where Subject=^%s^',[GetFieldValue(DeltaDs.FieldByName('dm'))])) then
          raise Exception.Create('数据评分：'+GetFieldValue(DeltaDs.FieldByName('dmmc'))+'中已经有数据，您不能删除该项目！');
       ExecuteBy(Format('Delete Vssjpf Where dm=^%s^',[GetFieldValue(DeltaDs.FieldByName('dm'))]));
     end;
end;

initialization
  Classes.RegisterClass(TVsSjpf);
finalization
  Classes.UnRegisterClass(TVsSjpf);

end.
