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
    EllipsLabel1: TEllipsLabel;
    EllipsLabel2: TEllipsLabel;
    EllipsLabel3: TEllipsLabel;
    AdvedtjiaLow: TDBAdvEdit;
    Advedtyilow: TDBAdvEdit;
    Advedtbinglow: TDBAdvEdit;
    Advedtjiahigh: TDBAdvEdit;
    Advedtyihigh: TDBAdvEdit;
    Advedtbinghigh: TDBAdvEdit;
    EllipsLabel4: TEllipsLabel;
    EllipsLabel5: TEllipsLabel;
    EllipsLabel6: TEllipsLabel;
    EllipsLabel7: TEllipsLabel;
    EllipsLabel8: TEllipsLabel;
    EllipsLabel9: TEllipsLabel;
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
    procedure acSaveExecute(Sender: TObject);
    procedure AdvedtjiaLowKeyPress(Sender: TObject; var Key: Char);
    procedure AdvedtjiaLowExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(Aowner:TComponent);override;
  end;

var
  FrmRankSet: TFrmRankSet;

implementation
uses UGFun;

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
       0://��
        begin
          if Self.Advedtjiahigh.text <>'' then
          begin
            HighScore := StrToInt(self.Advedtjiahigh.Text);
          end;
        end;
        1: //��
        begin
          if Self.Advedtyihigh.text <>'' then
          begin
            HighScore := StrToInt(Self.Advedtyihigh.Text);
          end;
        end;
        2:  //��
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
         ShowMsgSure('��С��������С��������');
       end;
    end;
  end;

end;


 //����ֻ����������
procedure TFrmRankSet.AdvedtjiaLowKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not (Key in ['0'..'9',#8]) then
    Key := #0;

end;

constructor TFrmRankSet.Create(Aowner: TComponent);
var
  levID:Integer;    //�ȼ����
  lowScore,HighScore:string;  //��ͷ�������߷���
  rankcolor:Integer;  //�ȼ���ɫ
begin
  inherited Create(Aowner,EuVsRank,'select *  from vszkrank ');
  //��������
  if DLCDS.Active and (DLCDS.RecordCount > 0) then
  begin
      //�ȼ�������Χ��ʾ
    DLCDS.First;
    while not DLCDS.Eof do
    begin
      levID := DLCDS.FieldByName('ID').AsInteger;
      lowScore :=DLCDS.FieldByName('lowscore').AsString;
      HighScore := DLCDS.FieldByName('HighScore').AsString;
      rankcolor := DLCDS.FieldByName('rankcolor').AsInteger;

      case levID of
        101:      //��
          begin
            AdvedtjiaLow.Text := lowScore;
            Advedtjiahigh.Text := HighScore;
            suiclbjia.Selected := rankcolor;
          end;
        102:     //��
          begin
            Advedtyilow.Text := lowScore;
            Advedtyihigh.Text := HighScore;
            suiclbyi.Selected := rankcolor;
          end;
        103:   // ��
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


procedure TFrmRankSet.acSaveExecute(Sender: TObject);
var
  LevID:Integer;
  colorjia,coloryi,colorbing:Integer;
begin
  //�ж��Ƿ�¼������
  if AdvedtjiaLow.Text = '' then
  begin
    ShowMsgSure('�׼���С��Χ����Ϊ��!');
    exit;
  end;
  if Advedtjiahigh.Text = '' then
  begin
    ShowMsgSure('�׼����Χ����Ϊ��!');
    exit;
  end;
  if Advedtyilow.Text = '' then
  begin
    ShowMsgSure('�Ҽ���С��Χ����Ϊ��!');
    exit;
  end;
  if Advedtyihigh.Text = '' then
  begin
    ShowMsgSure('�Ҽ����Χ����Ϊ��!');
    exit;
  end;
  if Advedtbinglow.Text = '' then
  begin
    ShowMsgSure('������С��Χ����Ϊ��!');
    Exit;
  end;
  if Advedtbinghigh.Text = '' then
  begin
    ShowMsgSure('�������Χ����Ϊ��!');
    exit;
  end;
  //�ȼ���ɫ
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
