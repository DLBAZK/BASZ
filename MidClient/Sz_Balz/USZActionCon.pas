/// <summary>
/// 流转动作配置
/// </summary>
/// <author>jdl</author>
///<date>2016-08-15</date>

unit USZActionCon;

interface
  uses SysUtils,Classes,DBClient,DB,Variants,UVsMidStand;

  type
   TSZActionCon =class(TVsMidStand)
   public
     constructor Create;override;
     Procedure MyBefoUpdate(Sender: TObject; SourceDS: TDataSet;
                           DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind; var Applied: Boolean);override;
   end;
implementation
  uses UMidProxy;
{ TSZActionCon }

constructor TSZActionCon.Create;
begin
  inherited;
  SelectSql:='';
  TableName:='SZActionCon';
end;

procedure TSZActionCon.MyBefoUpdate(Sender: TObject; SourceDS: TDataSet;
  DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind; var Applied: Boolean);
const
 sql ='SELECT * FROM SZActionRecord WHERE ActionDM=^%s^ ';
var
 olddm:string;
 dicDM:string;
begin
  inherited;
  //判断动作代码和标准动作是否可以修改
  if UpdateKind = ukModify then
  begin
    if DeltaDS.FieldByName('dm').NewValue <> Unassigned then
    begin
      olddm :=  DeltaDS.FieldByName('dm').OldValue;
      dicDM := DeltaDS.FieldByName('actiondicdm').OldValue;
      if (dicDM ='101') or (dicDM ='105') then
        raise Exception.Create('代码不能修改');
      //存在记录不能修改代码
      if CheckExistsRecord(Format(sql,[olddm])) then
      begin
        raise Exception.Create('该动作已被使用，不能修改代码');
      end;
    end;

  end;
  
end;

initialization
    Classes.RegisterClass(TSZActionCon);
finalization
    classes.UnRegisterClass(TSZActionCon);

end.
