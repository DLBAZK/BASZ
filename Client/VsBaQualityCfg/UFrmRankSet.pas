unit UFrmRankSet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFrmSuiDBForm, DB, ActnList, DBClient, UDlClientDataset, DosMove,
  AdvPanel, AdvAppStyler, AdvToolBar, AdvToolBarStylers, AdvOfficeStatusBar,
  AdvOfficeStatusBarStylers, ExtCtrls, StdCtrls, AdvEdit, DBAdvEd, EllipsLabel,
  AdvGlowButton,UVsMidClassList, GradientLabel, SUIComboBox, SUIColorBox;

type
  TFrmRankSet = class(TFrmSuiDBForm)
    AdvedtjiaLow: TDBAdvEdit;
    Advedtyilow: TDBAdvEdit;
    Advedtbinglow: TDBAdvEdit;
    Advedtjiahigh: TDBAdvEdit;
    Advedtyihigh: TDBAdvEdit;
    Advedtbinghigh: TDBAdvEdit;
    AdvGlowButton1: TAdvGlowButton;
    AdvPage2: TAdvPage;
    AdvGlowButton2: TAdvGlowButton;
    GradientLabel1: TGradientLabel;
    GradientLabel2: TGradientLabel;
    GradientLabel3: TGradientLabel;
    EllipsLabel10: TEllipsLabel;
    EllipsLabel11: TEllipsLabel;
    EllipsLabel12: TEllipsLabel;
    suiclbjia: TsuiColorBox;
    suiclbyi: TsuiColorBox;
    suiclbbing: TsuiColorBox;
    GradientLabel4: TGradientLabel;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    procedure acSaveExecute(Sender: TObject);
    procedure AdvedtjiaLowKeyPress(Sender: TObject; var Key: Char);
    procedure AdvedtjiaLowExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(Aowner:TComponent);override;
    Procedure InitControl;override;
  end;

var
  FrmRankSet: TFrmRankSet;

implementation
uses UGFun,UGVar;

{$R *.dfm}

{ TFrmRankSet }



procedure TFrmRankSet.AdvedtjiaLowExit(Sender: TObject);
var
  lowScore,HighScore:Integer;
begin
  inherited;
  lowScore :=0;
  HighScore :=0;
  if (Sender as TAdvEdit).Text <> '' then
  begin
    lowScore :=StrToInt((Sender as TAdvEdit).Text);
    case (Sender as TAdvEdit).Tag of
       0://甲
        begin
          if Self.Advedtjiahigh.text <>'' then
          begin
            HighScore := StrToInt(self.Advedtjiahigh.Text);
          end;
        end;
        1: //乙
        begin
          if Self.Advedtyihigh.text <>'' then
          begin
            HighScore := StrToInt(Self.Advedtyihigh.Text);
          end;
        end;
        2:  //丙
        begin
          if Self.Advedtbinghigh.text <>'' then
          begin
            HighScore := StrToInt(self.Advedtbinghigh.Text);
          end;
        end;
    end;
    if HighScore >0 then
    begin
      if lowScore>=HighScore then
       begin
         ShowMsgSure('最小分数必须小于最大分数');
       end;
    end;
  end;

end;


 //限制只能输入数字
procedure TFrmRankSet.AdvedtjiaLowKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not (Key in ['0'..'9',#8]) then
    Key := #0;

end;

constructor TFrmRankSet.Create(Aowner: TComponent);
var
  levID:Integer;    //等级编号
  lowScore,HighScore:string;  //最低分数、最高分数
  rankcolor:Integer;  //等级颜色
begin
  inherited Create(Aowner,EuVsRank,'select *  from vszkrank ');
  //存在数据
  if DLCDS.Active and (DLCDS.RecordCount > 0) then
  begin
      //等级分数范围显示
    DLCDS.First;
    while not DLCDS.Eof do
    begin
      levID := DLCDS.FieldByName('ID').AsInteger;
      lowScore :=DLCDS.FieldByName('lowscore').AsString;
      HighScore := DLCDS.FieldByName('HighScore').AsString;
      rankcolor := DLCDS.FieldByName('rankcolor').AsInteger;

      case levID of
        101:      //甲
          begin
            AdvedtjiaLow.Text := lowScore;
            Advedtjiahigh.Text := HighScore;
            suiclbjia.Selected := rankcolor;
          end;
        102:     //乙
          begin
            Advedtyilow.Text := lowScore;
            Advedtyihigh.Text := HighScore;
            suiclbyi.Selected := rankcolor;
          end;
        103:   // 丙
          begin
            Advedtbinglow.Text := lowScore;
            Advedtbinghigh.Text := HighScore;
            suiclbbing.Selected := rankcolor;
          end;
      end;
      DLCDS.Next;
    end;
  end;

  acSave.Enabled := True;
end;


procedure TFrmRankSet.InitControl;
begin
  inherited;
  ShowMode := EuShowModel;
end;

procedure TFrmRankSet.acSaveExecute(Sender: TObject);
var
  LevID:Integer;
  colorjia,coloryi,colorbing:Integer;
begin
  //判断是否录入数据
  if AdvedtjiaLow.Text = '' then
  begin
    ShowMsgSure('甲级最小范围不能为空!');
    exit;
  end;
  if Advedtjiahigh.Text = '' then
  begin
    ShowMsgSure('甲级最大范围不能为空!');
    exit;
  end;
  if Advedtyilow.Text = '' then
  begin
    ShowMsgSure('乙级最小范围不能为空!');
    exit;
  end;
  if Advedtyihigh.Text = '' then
  begin
    ShowMsgSure('乙级最大范围不能为空!');
    exit;
  end;
  if Advedtbinglow.Text = '' then
  begin
    ShowMsgSure('丙级最小范围不能为空!');
    Exit;
  end;
  if Advedtbinghigh.Text = '' then
  begin
    ShowMsgSure('丙级最大范围不能为空!');
    exit;
  end;
  //等级颜色
  colorjia := ColorToRGB(suiclbjia.Selected);
  coloryi := ColorToRGB(suiclbyi.Selected);
  colorbing := ColorToRGB(suiclbbing.Selected);

  with DLCDS do
  begin
    DisableControls;
    First;
    while not Eof do
    begin

      LevID := FieldByName('ID').AsInteger;
      case LevID of
         101:
          begin
            Edit;
            FieldByName('lowScore').AsInteger := StrToInt(AdvedtjiaLow.Text);
            FieldByName('HighScore').AsInteger := StrToInt(Advedtjiahigh.Text);
            FieldByName('rankcolor').AsInteger := colorjia;
          end;
          102:
          begin
            Edit;
            FieldByName('lowScore').AsInteger := StrToInt(Advedtyilow.Text);
            FieldByName('HighScore').AsInteger := StrToInt(Advedtyihigh.Text);
            FieldByName('rankcolor').AsInteger := coloryi;
          end;
          103:
          begin
            Edit;
            FieldByName('lowScore').AsInteger := StrToInt(Advedtbinglow.Text);
            FieldByName('HighScore').AsInteger := StrToInt(Advedtbinghigh.Text);
            FieldByName('rankcolor').AsInteger := colorbing;
          end;
      end;
      Post;
      next;
    end;
    EnableControls;
    if ChangeCount>0 then
      ApplyUpdates(-1)
  end;

  inherited;
end;


initialization
  Classes.RegisterClass(TFrmRankSet);
finalization
  Classes.UnRegisterClass(TFrmRankSet);
end.
