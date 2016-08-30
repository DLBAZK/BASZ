unit UFrmRptCheck;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFrmRep, ActnList, DosMove, AdvPanel, AdvAppStyler, AdvToolBar,
  AdvToolBarStylers, AdvOfficeStatusBar, AdvOfficeStatusBarStylers,
  AdvOfficePager, AdvGlowButton, ExtCtrls;

type
  TfrmRptCheck = class(TFrmRep)
  private
    { Private declarations }
  public
    { Public declarations }
    Procedure InitControl;Override;
    /// <summary>
    /// 查看报表
    /// </summary>
    /// <param name="ListNum">单号</param>
    procedure ShowRept(const ListNum:string);
    procedure SetHeaderCaption(const Caption:string);
  end;

var
  frmRptCheck: TfrmRptCheck;

implementation
uses URptCheck;
{$R *.dfm}

{ TfrmRptCheck }

procedure TfrmRptCheck.InitControl;
begin
  inherited;
  RepCreate([TRptCheck]);
end;

procedure TfrmRptCheck.SetHeaderCaption(const Caption: string);
begin
  SetRptHeaderCaption(Caption);
end;

procedure TfrmRptCheck.ShowRept(const ListNum: string);
const
  SQLtext='select *,(SELECT xbmc FROM VsZhdm WHERE ISNULL(xbmc,^^)<> ^^ AND dm=b.sex)xbmc '
     +' from SZActionListDeatil a left join SZBADetail b on a.patientid=b.patientid'
     +' where a.listid=^%s^ ';
begin
   RepCdsSQL :=Format(SQLtext,[ListNum]);
   OpenRptCds;
   ShowRrpt;

end;

end.
