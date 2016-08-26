unit UFrmActionMap;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFrmSuiDBForm, AdvPicture, AdvGlowButton, DB, ActnList, DBClient,
  UDlClientDataset, DosMove, AdvPanel, AdvAppStyler, AdvToolBar,
  AdvToolBarStylers, AdvOfficeStatusBarStylers, ExtCtrls,
  TFlatButtonUnit, AdvOfficeStatusBar, ImgList,StrUtils;

  const
    SelSql='SELECT * FROM SZActionCon WHERE bz =0';
   
type

  //���õĶ�����¼����
  PActionObj=^TActionObj;
  TActionObj=record
    ActionDM:string;//����
    PriorityNum:Integer;//���ȼ�
    ActionMC:string;//����
    ActionDicDM:string;//ָ���Ķ�������
  end;
  TfrmActionMap = class(TFrmSuiDBForm)
    ilAction: TImageList;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCloseClick(Sender: TObject);
  private
    { Private declarations }
    //��������
    ActionList:TList;
    controllist:TStringList;
    //�����ͷͼƬ
    direcImg:string;
    /// <summary>
    /// ��ȡ���õĶ���
    /// </summary>
    procedure GetAction;
    /// <summary>
    /// �������ֻ滭
    /// </summary>
    procedure GenerateActionMap;
    //������ť�����¼�
    procedure BtnOnClick(Sender:TObject);
  public
    { Public declarations }
  end;

var
  frmActionMap: TfrmActionMap;

implementation
  uses UGFun,UGVar,UMidProxy,UCommon;
{$R *.dfm}

{ TfrmActionMap }

procedure TfrmActionMap.BtnOnClick(Sender: TObject);
var
 btntmp:TAdvGlowButton;
 i :Integer;
 Obj:PActionObj;
begin
  btntmp :=TAdvGlowButton(Sender);
  if btntmp.Tag=99 then
  begin
    Close;
    Exit;
  end;
  for I := 0 to ActionList.Count - 1 do
  begin
    Obj :=PActionObj(ActionList[i]);

    if btntmp.Tag=Obj.PriorityNum then
    begin
      //�򿪲�����ת����
      Break;
    end;
  end;

end;

procedure TfrmActionMap.btnCloseClick(Sender: TObject);
begin
  inherited;
  Close();
end;

procedure TfrmActionMap.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(ActionList);
  FreeAndNil(controllist);
end;

procedure TfrmActionMap.FormCreate(Sender: TObject);
begin
  inherited;
  ActionList := TList.Create;
  controllist := TStringList.Create;
  //��ȡ�����ͷͼƬ
  direcImg :=ReadIniFileSit(G_MainInfo.MainDir+CClientCfgFileName,'BASZ','direcImg');
  if direcImg='' then
    direcImg :='direcImg.gif';
  GetAction;
  GenerateActionMap;
end;

procedure TfrmActionMap.GenerateActionMap;
var
  i:Integer;
  actionObj:PActionObj;
  strleft:string;
  procedure Repaint(const obj:PActionObj;isend:Boolean=False);
  var
    btnAction:TAdvGlowButton;
    PicAction:TAdvPicture;
    controlLeft:string;
  begin
   //������ť
    btnAction := TAdvGlowButton.Create(AdvPanel1);
    btnAction.Parent := AdvPanel1;
    btnAction.ShowHint :=True;
    btnAction.ParentFont :=False;
    btnAction.Height := 80;
    btnAction.Width :=80;
    btnAction.Top :=  100;
    btnAction.Layout := AdvGlowButton.blGlyphTop;
    btnAction.Font.Name := '΢���ź�';
    btnAction.Font.Size := 18;
    btnAction.Images := ilAction;
    btnAction.OnClick := BtnOnClick;
    btnAction.Visible :=True;
    if Assigned(obj) then
    begin
      btnAction.Caption := obj^.ActionMC;
      btnAction.Hint := obj^.ActionMC;
      btnAction.Name := Format('btn%d',[obj^.PriorityNum]);
      btnAction.Tag := obj^.PriorityNum;
      btnAction.ImageIndex :=StrToInt(rightstr(obj^.ActionDicDM,1))-1;
      controlLeft := controllist.Values[Format('pic%d',[obj^.PriorityNum-1])];
      if controlLeft<>'' then
      begin
        btnAction.Left := StrToInt(controlLeft)+62;
      end
      else
      begin
        btnAction.Left := 30;
      end;
      controllist.Add(Format('%s=%d',[btnAction.Name,btnAction.Left]));
//      if not isend then
//      begin
        //�����ͷ
        PicAction:=TAdvPicture.Create(AdvPanel1);
        PicAction.Parent :=AdvPanel1;
        PicAction.Picture.LoadFromFile(G_MainInfo.MainDir+direcImg);
        PicAction.AutoSize :=True;
        PicAction.PicturePosition :=AdvPicture.bpTopLeft;
        PicAction.Name := Format('pic%d',[obj^.PriorityNum]);
        PicAction.Top :=btnAction.Top+btnaction.Height div 4;
        controlLeft := controllist.Values[Format('btn%d',[obj^.PriorityNum])];
        if controlLeft<>'' then
        begin
          PicAction.Left :=StrToInt(controlLeft)+130;
        end;
        controllist.Add(Format('%s=%d',[PicAction.Name,PicAction.Left]));
        PicAction.Visible :=true;
//      end;
    end
    else //�˳���ť
    begin
      btnAction.Caption :='�˳�';
      btnAction.Hint := '�˳�';
      btnAction.Name :='btnClose';
      btnAction.Tag := 99;
      btnAction.ImageIndex :=ilAction.Count-1;
      controlLeft := controllist.Values[Format('pic%d',[ActionList.Count])];
      if controlLeft<>'' then
      begin
        btnAction.Left := StrToInt(controlLeft)+62;
      end
    end;
  end;

begin
  for I := 0 to ActionList.Count - 1 do
  begin
    actionObj := PActionObj(ActionList[i]);
    if i+1 < ActionList.Count then
      Repaint(actionObj)
    else
      Repaint(actionObj,True);
  end;
  Repaint(nil,true)  
end;

procedure TfrmActionMap.GetAction;
var
 Actionobj:PActionObj;
 clienttmp:TClientDataSet;
begin
  try
    clienttmp := TClientDataSet.Create(nil);
    autofree(clienttmp);
    TMidProxy.SqlOpen(SelSql,clienttmp);
    if not clienttmp.IsEmpty then
    begin
      with clienttmp do
      begin
        First;
        while not Eof do
        begin
          New(Actionobj);
          Actionobj^.ActionDM := FieldByName('DM').AsString ;
          Actionobj^.ActionMC := FieldByName('MC').AsString;
          Actionobj^.ActionDicDM := FieldByName('ActionDicDM').AsString ;
          Actionobj^.PriorityNum := FieldByName('PriorityNum').AsInteger ;
          //���浽�б�
          ActionList.Add(Actionobj);
          Next;
        end;
      end;
    end;
  except
    on ex:Exception do
    begin
      WriteErrorLog('����������ͼ�����쳣��'+ex.Message);
    end;

  end;
end;

initialization
  RegisterClass(TfrmActionMap);
finalization
  UnRegisterClass(TfrmActionMap);
end.
