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
    ActionBtn:TAdvGlowButton; //��ť
    ActionPic:TAdvPicture;  /// �����ͷͼƬ
    PositionX:Integer; //X����
    PositionY:Integer; //Y����
  end;
  TfrmActionMap = class(TFrmSuiDBForm)
    ilAction: TImageList;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    //��������
    ActionList:TList;
    controllist:TStringList;
    //�����ͷͼƬ
    direcImg:string;
    /// <summary>
    /// Ĭ�ϲ��ַ�����
    /// </summary>
    LayoutCol:Integer;
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
  uses UGFun,UGVar,UMidProxy,UCommon,UFrmAction;
{$R *.dfm}

{ TfrmActionMap }

procedure TfrmActionMap.BtnOnClick(Sender: TObject);
var
 btntmp:TAdvGlowButton;
 i :Integer;
 Obj:PActionObj;
 frmAct:TfrmActionCheckB;
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

    if btntmp.Tag=Obj^.PriorityNum then
    begin
      //�򿪲�����ת����
      frmAct :=TfrmActionCheckB.Create(nil);
      frmAct.BorderStyle :=bsSingle;
      frmAct.ActionDM :=Obj^.ActionDM;
      frmAct.ShowModal;
      Break;
    end;
  end;

end;

procedure TfrmActionMap.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(ActionList);
  FreeAndNil(controllist);
end;

procedure TfrmActionMap.FormCreate(Sender: TObject);
var
 col:string;
begin
  inherited;
  ActionList := TList.Create;
  controllist := TStringList.Create;
  //��ȡ�����ͷͼƬ
  direcImg :=ReadIniFileSit(G_MainInfo.MainDir+CClientCfgFileName,'BASZ','direcImg');
  //��ȡ������ťÿ�е�����
  col :=ReadIniFileSit(G_MainInfo.MainDir+CClientCfgFileName,'BASZ','Col');
  if col='' then
    LayoutCol :=3
  else
    LayoutCol :=StrToInt(col);
  if direcImg='' then
    direcImg :='direcImg.gif';
  //��ȡ���õĹ���
  GetAction;
  GenerateActionMap;
end;

procedure TfrmActionMap.GenerateActionMap;
var
  i:Integer;
  actionObj:PActionObj;
  strleft:string;
  /// <summary>
  /// ����������ť
  /// </summary>
  /// <param name="obj">������¼��</param>
  /// <param name="num">�������</param>
  /// <param name="isend">�Ƿ���ʾ���һ����ͷ</param>
  procedure Repaint(var obj:PActionObj;num:Integer;isend:Boolean=False);
   const
     Space=30; //��ť�ͼ�ͷ�ļ��
  var
    btnAction:TAdvGlowButton;
    PicAction:TAdvPicture;
    controlLeft:string;
    i:Integer;
    LX,LY:Integer;  // X��Yͼ��
    ObjTemp:PActionObj;
  begin
   //������ť
    btnAction := TAdvGlowButton.Create(AdvPanel1);
    btnAction.Parent := AdvPanel1;
    btnAction.ShowHint :=True;
    btnAction.ParentFont :=False;
    btnAction.Height := 80;
    btnAction.Width :=80;
    btnAction.Layout := AdvGlowButton.blGlyphTop;
    btnAction.Font.Name := '΢���ź�';
    btnAction.Font.Size := 18;
    btnAction.Images := ilAction;
    btnAction.OnClick := BtnOnClick;
    btnAction.Visible :=True;
    if not isend then
    begin
      if Assigned(obj) then
      begin
        btnAction.Caption := obj^.ActionMC;
        btnAction.Hint := obj^.ActionMC;
        btnAction.Name := Format('btn%d',[obj^.PriorityNum]);
        btnAction.Tag := obj^.PriorityNum;
        btnAction.ImageIndex :=StrToInt(rightstr(obj^.ActionDicDM,1))-1;

        //��������
        PicAction:=TAdvPicture.Create(AdvPanel1);
        PicAction.Parent :=AdvPanel1;
        PicAction.Picture.LoadFromFile(G_MainInfo.MainDir+direcImg);
        PicAction.AutoSize :=True;
        PicAction.PicturePosition :=AdvPicture.bpTopLeft;
        PicAction.Name := Format('pic%d',[obj^.PriorityNum]);
        PicAction.Visible :=true;
        //X����
        LX :=num div LayoutCol;
        //Y����
        LY := num mod LayoutCol;
        //��һ����ť
        if (LX=0) and (LY=0) then
        begin
          btnAction.Left := 100;
          btnAction.Top := 100;
          PicAction.Left := btnAction.Left+btnaction.Width+Space;
          PicAction.Top :=btnAction.Top+btnaction.Height div 4;
        end
        //������ť
        else
        begin
          for I := 0 to ActionList.Count - 1 do
          begin
            ObjTemp := PActionObj(ActionList[i]);
            if ObjTemp^.ActionDM<> Obj^.ActionDM then
            begin
              ///��ż�� ��ť���ַ���

              if LX mod 2 = 0 then //ż��
              begin
                if LY <>0 then
                begin
                  //ǰһ����ť
                  if (ObjTemp^.PositionX = LX) and (ObjTemp^.PositionY = LY-1) then
                  begin
                    btnAction.Left := ObjTemp^.ActionPic.Left + ObjTemp^.ActionPic.Width+Space;
                    btnAction.Top := ObjTemp^.ActionBtn.Top ;
                  end
                  else
                    Continue;
                end
                else
                begin
                  //��һ����ť
                  if  (ObjTemp^.PositionX = LX-1) and (ObjTemp^.PositionY =LayoutCol-1 ) then
                  begin
                    btnAction.Left := ObjTemp^.ActionBtn.Left;
                    btnAction.Top := objtemp^.ActionPic.Top +objtemp^.ActionPic.Height+10;
                  end
                  else
                    Continue;
                end;
                if LY<> LayoutCol-1 then
                begin
                  PicAction.Top := btnAction.Top+btnaction.Height div 4;
                  PicAction.Left := btnAction.Left +btnAction.Width +30;

                end
                else
                begin
                  PicAction.Left := btnAction.Left+btnaction.Width div 4;
                  PicAction.Top := btnAction.Height +btnAction.Top +Space;
                  PicAction.Picture.LoadFromFile(G_MainInfo.MainDir+'arrow_down.gif');                  
                end;

              end
              else  //����
              begin
                 //�ŵ����һ��
                if LY=0 then
                begin
                  if (ObjTemp^.PositionX = LX-1) and (ObjTemp^.PositionY =LY+LayoutCol-1) then
                  begin
                    btnAction.Left := ObjTemp^.ActionBtn.Left;
                    btnAction.Top := objtemp^.ActionPic.Top +objtemp^.ActionPic.Height+10;
                  end
                  else
                    Continue;
                end
                else
                begin
                  if (ObjTemp^.PositionX=LX) and (ObjTemp^.PositionY=LY-1) then
                  begin
                    btnAction.Left := ObjTemp^.ActionPic.Left - btnAction.Width-Space;
                    btnAction.Top := ObjTemp^.ActionBtn.Top ;
                  end
                  else
                    Continue;
                end;
                if LY<> LayoutCol-1 then
                begin
                  PicAction.Top := btnAction.Top+btnaction.Height div 4;
                  PicAction.Left := btnAction.Left - PicAction.Width -Space;
                  PicAction.Picture.LoadFromFile(G_MainInfo.MainDir+'arrow_left.gif');
                end
                else
                begin
                  PicAction.Left := btnAction.Left+btnaction.Width div 4;
                  PicAction.Top := btnAction.Height +btnAction.Top +Space;
                  PicAction.Picture.LoadFromFile(G_MainInfo.MainDir+'arrow_down.gif');
                end;
              end;
              Break;
            end;
          end;
        end;
        obj^.PositionX :=LX;
        obj^.PositionY := LY;
        //���水ť
        obj^.ActionBtn := btnAction;
        obj^.ActionPic := PicAction;
      end
    end
    else //�˳���ť
    begin
      btnAction.Caption :='�˳�';
      btnAction.Hint := '�˳�';
      btnAction.Name :='btnClose';
      btnAction.Tag := 99;
      btnAction.ImageIndex :=ilAction.Count-1;
      ObjTemp:=PActionObj(ActionList.Last);
      if ObjTemp^.PositionX mod 2= 0 then
      begin
        if ObjTemp^.PositionY <> LayoutCol -1 then
        begin
          btnAction.Top := objtemp^.ActionBtn.Top;
          btnAction.Left := objtemp^.ActionPic.Left+objtemp^.ActionPic.Width+Space;
        end
        else
        begin
          btnAction.Top := objtemp^.ActionPic.Top+objtemp^.ActionPic.Height+Space;
          btnAction.Left := objtemp^.ActionBtn.Left;
        end;
      end
      else
      begin
        if ObjTemp^.PositionY <> LayoutCol -1 then
        begin
          btnAction.Top := objtemp^.ActionBtn.Top;
          btnAction.Left := objtemp^.ActionPic.Left-btnaction.Width-Space;
        end
        else
        begin
          btnAction.Top := objtemp^.ActionPic.Top+objtemp^.ActionPic.Height+Space;
          btnAction.Left := objtemp^.ActionBtn.Left;
        end;
      end;
    end;
  end;

begin
  for I := 0 to ActionList.Count - 1 do
  begin
    actionObj := PActionObj(ActionList[i]);
    Repaint(actionObj,I);
  end;
  Repaint(actionObj,0,True);
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
