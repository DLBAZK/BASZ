/// <summary>
/// 病历终末质量等级设置业务类
/// </summary>
/// <author> Lisa </author>
/// <date> 2016-05-21 </date>
unit UVsZmzlpf;

interface

Uses
   SysUtils,Classes,UVsMidStand,DB,DBClient,UGMidVar;

Type
  TVsZmzlpf=Class(TVsMidStand)
  Public
    Constructor Create;Override;
  Published
    Function MidQuery:OleVariant;Override;
    Procedure MyBefoUpdate(Sender: TObject; SourceDS: TDataSet;
                           DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind; var Applied: Boolean);Override;
    procedure MyAfterUpdate(Sender: TObject; SourceDS: TDataSet;
                            DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind);Override;
  End;

implementation
Uses Variants,UCommon;

{ TVsZmzlpf }

constructor TVsZmzlpf.Create;
begin
  inherited;
  SelectSql:='Select * From Vszmzlpf Order By code';
end;

function TVsZmzlpf.MidQuery: OleVariant;
begin
  PQuery.SQL.Text:=Escape(SelectSQL);
  PQuery.Open;
  PDsp.DataSet:=PQuery;
  Result:=PDsp.Data;
end;

procedure TVsZmzlpf.MyAfterUpdate(Sender: TObject; SourceDS: TDataSet;
  DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind);
var
  sql:string;
  uppercode:string; //上级编号
begin
  inherited;
  IF UpdateKind=ukModify then
  begin
    ExecuteBy(Format('Update VsBAZmPj Set code=^%s^ Where code=^%s^',
                    [DeltaDs.FieldByName('code').NewValue,DeltaDs.FieldByName('code').OldValue]));
  End;
  //更新上级分数
//  uppercode := DeltaDS.FieldByName('uppercode').OldValue;
//  if uppercode<> '' then
//  begin
//    sql:=Format('exec Updatezmzlpj ^%s^',[uppercode]);
//    ExecuteBy(sql);
//  end;


end;

procedure TVsZmzlpf.MyBefoUpdate(Sender: TObject; SourceDS: TDataSet;
  DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
var
 code:string;
 sql:string;
begin
  inherited;
  DeltaDs.Edit;
  DeltaDs.FieldByName('code').AsString:=GetFieldValue(DeltaDs.FieldByName('upperCode'))+
                                         GetFieldValue(DeltaDs.FieldByName('itemCode'));
  DeltaDs.Post;
  if UpdateKind=ukDelete then
  begin
   Applied:=True;
   If CheckExistsRecord(Format('Select Top 1 1 From VsBAZmPj Where code=^%s^',[GetFieldValue(DeltaDs.FieldByName('code'))])) then
      raise Exception.Create('医技项目：'+GetFieldValue(DeltaDs.FieldByName('codename'))+'中已经有数据，您不能删除该项目！');
   ExecuteBy(Format('Delete Vszmzlpf Where code=^%s^',[GetFieldValue(DeltaDs.FieldByName('code'))]));
  end
  else if UpdateKind=ukModify then
  begin
    //除却三级之外，有下级的标准不能修改分值
//    code := GetFieldValue(DeltaDs.FieldByName('upperCode'))+deltads.FieldByName('itemcode').OldValue;
//    sql := Format('select top 1 1 from Vszmzlpf where  uppercode=^%s^',[code]) ;
//    if CheckExistsRecord(sql) then
//      raise Exception.Create('标准包含子标准，修改子标准分值即可自动计算！')
    
  end;


end;

initialization
  Classes.RegisterClass(TVsZmzlpf);
finalization
  Classes.UnRegisterClass(TVsZmzlpf);

end.
