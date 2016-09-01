/// <summary>
/// ��ת��������
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
     procedure MyAfterUpdate(Sender: TObject; SourceDS: TDataSet;
                            DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind);override;
     Procedure MyAfterApplyUpdates(Sender: TObject; var OwnerData: OleVariant); override;
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

procedure TSZActionCon.MyAfterApplyUpdates(Sender: TObject;
  var OwnerData: OleVariant);
begin
  inherited;
end;

procedure TSZActionCon.MyAfterUpdate(Sender: TObject; SourceDS: TDataSet;
  DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind);
const
   updateSql ='UPDATE SZActionCon SET PriorityNum = PriorityNum-1 WHERE PriorityNum > %s';
var
 prioritynum:string;
begin
  inherited;
  if UpdateKind= ukDelete then
  begin
    prioritynum :=  VarToStr(GetFieldValue(DeltaDS.FieldByName('PriorityNum'))) ;
    self.ExecuteBy(Format(updateSql,[prioritynum]));
  end;

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
  //�ж϶�������ͱ�׼�����Ƿ�����޸�
  olddm :=  DeltaDS.FieldByName('dm').OldValue;
  if UpdateKind = ukModify then
  begin
    if DeltaDS.FieldByName('dm').NewValue <> Unassigned then
    begin
      olddm :=  DeltaDS.FieldByName('dm').OldValue;
      dicDM := DeltaDS.FieldByName('actiondicdm').OldValue;
      if (dicDM ='101') or (dicDM ='105') then
        raise Exception.Create('���벻���޸�');
      //���ڼ�¼�����޸Ĵ���
      if CheckExistsRecord(Format(sql,[olddm])) then
      begin
        raise Exception.Create('�ö����ѱ�ʹ�ã������޸Ĵ���');
      end;
    end;
  end;

end;

initialization
    Classes.RegisterClass(TSZActionCon);
finalization
    classes.UnRegisterClass(TSZActionCon);

end.
