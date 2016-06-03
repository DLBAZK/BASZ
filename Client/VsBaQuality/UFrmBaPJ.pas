{*******************************************************}
{                                                       }
{       ������ĩ����                                    }
{                                                       }
{       ��Ȩ���� (C) 2016 �人�������ҽ�����ݷ���      }
{                                                       }
{*******************************************************}

unit UFrmBaPJ;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFrmSuiDBForm, DB, ActnList, DBClient, UDlClientDataset, DosMove,
  AdvPanel, AdvAppStyler, AdvToolBar, AdvToolBarStylers, AdvOfficeStatusBar,
  AdvOfficeStatusBarStylers, ExtCtrls, AdvSplitter, StdCtrls, SUIEdit,
  EllipsLabel, TFlatGroupBoxUnit, AdvGlowButton, DBGridEhGrouping, GridsEh,
  DBGridEh, TFlatPanelUnit;

type
  TFrmBaPJ = class(TFrmSuiDBForm)
    AdvPanel2: TAdvPanel;
    AdvSplitter1: TAdvSplitter;
    FlatGroupBox1: TFlatGroupBox;
    EllipsLabel1: TEllipsLabel;
    suiedtZYH: TsuiEdit;
    AdvbtnActLocate: TAdvGlowButton;
    dbgrdhBaList: TDBGridEh;
    FlatPanel1: TFlatPanel;
    FlatPanel2: TFlatPanel;
    AdvbtnacSave: TAdvGlowButton;
    dbgrdhPJDetail: TDBGridEh;
    clientdtPJDetail: TClientDataSet;
    dsPJDetail: TDataSource;
    AdvbtnClose: TAdvGlowButton;
    procedure ActLocateExecute(Sender: TObject);
    procedure suiedtZYHKeyPress(Sender: TObject; var Key: Char);
    procedure suiedtZYHKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure AdvbtnacSaveClick(Sender: TObject);

    procedure dbgrdhBaListCellClick(Column: TColumnEh);
  private
    { Private declarations }
    CH0A00:string;    //סԺ��

  public
    { Public declarations }
     constructor Create(Aower:TComponent);override;
  end;

var
  FrmBaPJ: TFrmBaPJ;

implementation
  uses
    UGFun,UVsMidClassList,UVsBaSx,UMidProxy;
{$R *.dfm}

{ TFrmBaPJ }

procedure TFrmBaPJ.ActLocateExecute(Sender: TObject);
var
 StrCH0A00:string; //סԺ��
begin
  inherited;
  if suiedtZYH.Text = '' then Exit;
  if not DLCDS.Active then Exit;
  if DLCDS.IsEmpty then Exit;
  StrCH0A00 := suiedtZYH.Text;
  if not DLCDS.Locate('CH0A00',StrCH0A00,[loCaseInsensitive]) then
  begin
    ShowMsgSure('������¼������!');
  end;

end;

procedure TFrmBaPJ.AdvbtnacSaveClick(Sender: TObject);
var

  sql:string;
  FCode,SCode,TCode,Code:string;
  Score:Double;
  Remark:string;
  mark:Pointer;
begin
  inherited;
  //�ж�ʦ����������
  if not clientdtPJDetail.Active then Exit;
  if clientdtPJDetail.IsEmpty then Exit;
  if not DLCDS.Active then Exit;
  if DLCDS.IsEmpty then Exit;
  if clientdtPJDetail.ChangeCount <1 then 
  begin
    ShowMsgSure('����û�б��޸ģ����ñ���!');
    Exit;
  end;
   //��ȡסԺ��
  CH0A00:=DLCDS.FieldByName('CH0A00').AsString;
  sql := Format('delete from VsBAZmPj where CH0A00=%s',[CH0A00]);
  try
    //ɾ���ϴ�����
    TMidProxy.SqlExecute(sql);
    mark := clientdtPJDetail.GetBookmark;
    with clientdtPJDetail do
    begin
      try
        DisableControls;
        First;
        while not Eof do
        begin
          FCode := FieldByName('Fcode').AsString; //����Ŀ���
          SCode := FieldByName('Scode').AsString;//����Ŀ���
          TCode := FieldByName('Tcode').AsString;//ϸ��Ŀ���
          Score := FieldByName('Score').AsFloat; //����
          Remark := DelStrTabDot(FieldByName('Remark').AsString);      //��������
          if TCode = '' then
          begin
            if SCode = '' then
              Code := FCode
            else
              Code := SCode;
          end
          else
            Code := TCode;

          sql := Format('insert into VsBAZmPj(CH0A00,Code,Score,Remark) values(^%s^,^%s^,%f,^%s^)',[CH0A00,Code,Score,Remark]) ;
          TMidProxy.SqlExecute(sql);
          Next;
        end;
      finally
        EnableControls;
      end;
    end;
    ShowMsgSure('�������');
  finally
    clientdtPJDetail.GotoBookmark(mark);
    clientdtPJDetail.FreeBookmark(mark);
  end;

end;

constructor TFrmBaPJ.Create(Aower: TComponent);
const
  sql = 'select * from VSPJBA0A';

begin
  inherited Create(Aower,EuVsBaZmPj,sql);
  if DLCDS.Active then
  begin
    if DLCDS.IsEmpty then
    begin
      ShowMsgSure('��δɸѡ����,�޷���������!');
      Exit;
    end
    else
      SetSbSimpleText(Format('���ƣ�%d������',[DLCDS.RecordCount]));
  end;
end;

procedure TFrmBaPJ.dbgrdhBaListCellClick(Column: TColumnEh);
const
  execSql ='exec PBAzmpj ^%s^' ;
var
 sql:string;

begin
  inherited;
  try
    if not DLCDS.Active then Exit;
    if DLCDS.IsEmpty then Exit;
    CH0A00 := DLCDS.FieldByName('CH0A00').AsString;
    if clientdtPJDetail.Active then
      clientdtPJDetail.EmptyDataSet;
    sql := Format(execSql,[CH0A00]);
    TMidProxy.SqlOpen(sql,clientdtPJDetail);
    WriteDeBug(Format('��ȡ%s��������������Ϣ',[CH0A00]));
  finally

  end;

end;


procedure TFrmBaPJ.suiedtZYHKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key =VK_RETURN then
    ActLocateExecute(nil);
//     SendMessage(Handle, WM_KEYDOWN, VK_TAB, 0);
end;

procedure TFrmBaPJ.suiedtZYHKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key in ['!','@','#','$','%','^','&','*','(',')','`',',','.','/','[',']','\','|'] then
    Key := #0;
end;

initialization
  Classes.RegisterClass(TFrmBaPJ);
finalization
  Classes.UnRegisterClass(TFrmBaPJ);

end.
