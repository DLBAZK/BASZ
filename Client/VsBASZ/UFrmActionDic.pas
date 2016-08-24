unit UFrmActionDic;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFrmSuiDBForm, DB, ActnList, DBClient, UDlClientDataset, DosMove,
  AdvPanel, AdvAppStyler, AdvToolBar, AdvToolBarStylers, AdvOfficeStatusBar,
  AdvOfficeStatusBarStylers, ExtCtrls, StdCtrls, AdvFontCombo, AdvGlowButton;

type
  TfrmActionDic = class(TFrmSuiDBForm)
    lbl1: TLabel;
    cbbAction: TAdvOfficeComboBox;
    btnOK: TAdvGlowButton;
    btnCancel: TAdvGlowButton;
    procedure FormCreate(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
   //标准动作代码
    actionDM:string;
  end;

var
  frmActionDic: TfrmActionDic;

implementation
 uses UGFun;
{$R *.dfm}

procedure TfrmActionDic.btnOKClick(Sender: TObject);
begin
  inherited;
  if cbbAction.ItemIndex <> -1 then
  begin
    actionDM :=GetDmOFCombobox(cbbAction);
  end;

end;

procedure TfrmActionDic.FormCreate(Sender: TObject);
begin
  inherited;
  //加载标准动作库
  FillCombobox('select * from szactiondic','dm','mc',cbbAction);
end;

end.
