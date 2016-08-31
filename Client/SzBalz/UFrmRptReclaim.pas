/// <summary>
/// 病案接收报表预览
/// </summary>
/// <author>jdl</author>
///<date>2016-08-26</date>

unit UFrmRptReclaim;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFrmRep, ActnList, DosMove, AdvPanel, AdvAppStyler, AdvToolBar,
  AdvToolBarStylers, AdvOfficeStatusBar, AdvOfficeStatusBarStylers,
  AdvOfficePager, AdvGlowButton, ExtCtrls;

type
  TfrmRptReclaim = class(TFrmRep)
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
  frmRptReclaim: TfrmRptReclaim;

implementation
 uses URptReclaim;
{$R *.dfm}

{ TFrmRep1 }

procedure TfrmRptReclaim.InitControl;
begin
  inherited;
  RepCreate([TRptYSGZYLB]);
end;

procedure TfrmRptReclaim.SetHeaderCaption(const Caption: string);
begin
  SetRptHeaderCaption(Caption);
end;

procedure TfrmRptReclaim.ShowRept(const ListNum: string);
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
