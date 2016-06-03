unit UFrmZkDetail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,UMidProxy, UFrmSuiBListForm, DBGridEhGrouping, PrnDbgeh, ActnList, DB,
  DBClient, DosMove, AdvPanel, AdvAppStyler, AdvToolBar, AdvToolBarStylers,
  AdvOfficeStatusBar, AdvOfficeStatusBarStylers, GridsEh, DBGridEh, ExtCtrls,
  StdCtrls, Buttons;

type
  TFrmZkDetail = class(TFrmSuiBListForm)
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
    bah, PFSJ: string;

     /// <summary>
    /// ��ѯ�ʿ���ϸ��Ϣ
    /// </summary>
    /// <param name="bah">������</param>
    /// <param name="PFSJ">����ʱ��</param>
    procedure GetZkDetail;//(bah,PFSJ:string);
  end;


implementation

{$R *.dfm}

{ TFrmSuiBListForm1 }

procedure TFrmZkDetail.FormShow(Sender: TObject);
begin
  inherited;
  GetZkDetail;
end;

procedure TFrmZkDetail.GetZkDetail;//(bah, PFSJ: string);
const
   sql ='select * from VsBAsyzk A left join Vssjpf B on A.Subject = B.dm where A.CH0A01 =^%s^ and A.PFSJ=^%s^';
begin
  if (bah ='') and (PFSJ = '') then Exit;

  QuerySQL := Format(sql,[bah,PFSJ]);


end;

end.
