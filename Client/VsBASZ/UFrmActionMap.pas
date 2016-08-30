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

  //配置的动作记录类型
  PActionObj=^TActionObj;
  TActionObj=record
    ActionDM:string;//代码
    PriorityNum:Integer;//优先级
    ActionMC:string;//名称
    ActionDicDM:string;//指定的动作代码
    ActionBtn:TAdvGlowButton; //按钮
    ActionPic:TAdvPicture;  /// 方向箭头图片
    PositionX:Integer; //X坐标
    PositionY:Integer; //Y坐标
  end;
  TfrmActionMap = class(TFrmSuiDBForm)
    ilAction: TImageList;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    //动作集合
    ActionList:TList;
    controllist:TStringList;
    //方向箭头图片
    direcImg:string;
    /// <summary>
    /// 默认布局分栏数
    /// </summary>
    LayoutCol:Integer;
    /// <summary>
    /// 获取配置的动作
    /// </summary>
    procedure GetAction;
    /// <summary>
    /// 动作布局绘画
    /// </summary>
    procedure GenerateActionMap;
    //动作按钮处理事件
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
      //打开病案流转窗体
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
  //读取方向箭头图片
  direcImg :=ReadIniFileSit(G_MainInfo.MainDir+CClientCfgFileName,'BASZ','direcImg');
  //读取动作按钮每行的数量
  col :=ReadIniFileSit(G_MainInfo.MainDir+CClientCfgFileName,'BASZ','Col');
  if col='' then
    LayoutCol :=3
  else
    LayoutCol :=StrToInt(col);
  if direcImg='' then
    direcImg :='direcImg.gif';
  //获取配置的工作
  GetAction;
  GenerateActionMap;
end;

procedure TfrmActionMap.GenerateActionMap;
var
  i:Integer;
  actionObj:PActionObj;
  strleft:string;
  /// <summary>
  /// 创建动作按钮
  /// </summary>
  /// <param name="obj">动作记录体</param>
  /// <param name="num">动作序号</param>
  /// <param name="isend">是否显示最后一个箭头</param>
  procedure Repaint(var obj:PActionObj;num:Integer;isend:Boolean=False);
   const
     Space=30; //按钮和箭头的间距
  var
    btnAction:TAdvGlowButton;
    PicAction:TAdvPicture;
    controlLeft:string;
    i:Integer;
    LX,LY:Integer;  // X、Y图标
    ObjTemp:PActionObj;
  begin
   //动作按钮
    btnAction := TAdvGlowButton.Create(AdvPanel1);
    btnAction.Parent := AdvPanel1;
    btnAction.ShowHint :=True;
    btnAction.ParentFont :=False;
    btnAction.Height := 80;
    btnAction.Width :=80;
    btnAction.Layout := AdvGlowButton.blGlyphTop;
    btnAction.Font.Name := '微软雅黑';
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

        //创建方向
        PicAction:=TAdvPicture.Create(AdvPanel1);
        PicAction.Parent :=AdvPanel1;
        PicAction.Picture.LoadFromFile(G_MainInfo.MainDir+direcImg);
        PicAction.AutoSize :=True;
        PicAction.PicturePosition :=AdvPicture.bpTopLeft;
        PicAction.Name := Format('pic%d',[obj^.PriorityNum]);
        PicAction.Visible :=true;
        //X坐标
        LX :=num div LayoutCol;
        //Y坐标
        LY := num mod LayoutCol;
        //第一个按钮
        if (LX=0) and (LY=0) then
        begin
          btnAction.Left := 100;
          btnAction.Top := 100;
          PicAction.Left := btnAction.Left+btnaction.Width+Space;
          PicAction.Top :=btnAction.Top+btnaction.Height div 4;
        end
        //其他按钮
        else
        begin
          for I := 0 to ActionList.Count - 1 do
          begin
            ObjTemp := PActionObj(ActionList[i]);
            if ObjTemp^.ActionDM<> Obj^.ActionDM then
            begin
              ///奇偶行 按钮布局方向

              if LX mod 2 = 0 then //偶行
              begin
                if LY <>0 then
                begin
                  //前一个按钮
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
                  //上一个按钮
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
              else  //奇行
              begin
                 //放到最后一个
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
        //保存按钮
        obj^.ActionBtn := btnAction;
        obj^.ActionPic := PicAction;
      end
    end
    else //退出按钮
    begin
      btnAction.Caption :='退出';
      btnAction.Hint := '退出';
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
          //保存到列表
          ActionList.Add(Actionobj);
          Next;
        end;
      end;
    end;
  except
    on ex:Exception do
    begin
      WriteErrorLog('操作动作地图出现异常：'+ex.Message);
    end;

  end;
end;

initialization
  RegisterClass(TfrmActionMap);
finalization
  UnRegisterClass(TfrmActionMap);
end.
