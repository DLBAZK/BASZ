/// <summary>
/// 病案流转动作总览图
/// </summary>
/// <author>jdl</author>
///<date>2016-08-26</date>

unit UFrmActionMap;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFrmSuiDBForm, AdvPicture, AdvGlowButton, DB, ActnList, DBClient,
  UDlClientDataset, DosMove, AdvPanel, AdvAppStyler, AdvToolBar,
  AdvToolBarStylers, AdvOfficeStatusBarStylers, ExtCtrls,
  TFlatButtonUnit, AdvOfficeStatusBar, ImgList,StrUtils, Menus, AdvMenus,
  StdCtrls, ExtDlgs,XMLIntf,XMLDoc,UGVar;

  const
    SelSql='SELECT * FROM SZActionCon WHERE bz =0';
    layoutXML='Layout.xml';  //布局xml
    ReSizeSpace= 5;         //动作按钮设计大小边界
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
    BtnImgFile:string;
    DirecImgFile:string;
  end;
  TfrmActionMap = class(TFrmSuiDBForm)
    ilAction: TImageList;
    advpmnbtn: TAdvPopupMenu;
    mniFont: TMenuItem;
    dlgFont1: TFontDialog;
    actDesign: TAction;
    advpmn1: TAdvPopupMenu;
    mniN1: TMenuItem;
    mniN2: TMenuItem;
    mniN3: TMenuItem;
    dlgOpenPicbtn: TOpenPictureDialog;
    advpmndirec: TAdvPopupMenu;
    mnidirecLeft: TMenuItem;
    mnidirecright: TMenuItem;
    mnidirecdown: TMenuItem;
    advpctr1: TAdvPicture;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure mniFontClick(Sender: TObject);
    procedure mniN1Click(Sender: TObject);
    procedure mniN2Click(Sender: TObject);
    procedure mniN3Click(Sender: TObject);
    procedure mnidirecdownClick(Sender: TObject);
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
    IsDrag:Boolean;
    px,py:Integer;
    //退出按钮的图片
    closeImg:string;
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
    /// <summary>
    /// 开启设计模式
    /// </summary>
    /// <param name="flag">true 设计 false 运行</param>
    procedure SetDesign(const Flag:Boolean=true);
    procedure BtnMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure OnMyMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure OnMyMouseUp(Sender: TObject; Button: TMouseButton;Shift: TShiftState; X, Y: Integer);
    /// <summary>
    /// 保存布局
    /// </summary>
    procedure SaveLayoutConfig;
    /// <summary>
    /// 加载布局
    /// </summary>
    procedure LoadLayoutConfig;
  public
    { Public declarations }
  end;

var
  frmActionMap: TfrmActionMap;

implementation
  uses UGFun,UMidProxy,UCommon,UFrmAction;
{$R *.dfm}

{ TfrmActionMap }
procedure TfrmActionMap.OnMyMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin

  if Sender.ClassType = TAdvGlowButton then
  begin
    with (sender as TAdvGlowButton) do begin
      if (x>=0)and(x<=ReSizeSpace) then
      begin
        if (y>=0)and(y<=ReSizeSpace) then cursor:=crsizenwse;
        if (y>ReSizeSpace)and(y<height-ReSizeSpace) then cursor:=crsizewe;
        if (y>=height-ReSizeSpace)and(y<=height) then cursor:=crsizenesw;
      end
      else if (x>ReSizeSpace)and(x<width-ReSizeSpace) then
      begin
        if (y>=0)and(y<=ReSizeSpace) then cursor:=crsizens;
        if (y>ReSizeSpace)and(y<height-ReSizeSpace) then
        begin
          cursor:=crSizeAll;
          if IsDrag then
          begin
            with Sender as TControl do begin
              Left := X-px+Left;
              Top := Y -Py +Top;

            end;
          end;
        end;
        if (y>=height-ReSizeSpace)and(y<=width) then cursor:=crsizens;
        
      end
      else if (x>=width-ReSizeSpace)and(x<=width) then
      begin
        if (y>=0)and(y<=ReSizeSpace) then cursor:=crsizenesw;
        if (y>ReSizeSpace)and(y<height-ReSizeSpace) then cursor:=crsizewe;
        if (y>=height-ReSizeSpace)and(y<=width) then cursor:=crsizenwse;
      end;

    end;
  end
  else
  begin
    if IsDrag then
    begin
      with Sender as TControl do begin
        Left := X-px+Left;
        Top := Y -Py +Top;
      end;
    end;

  end;


end;

procedure TfrmActionMap.OnMyMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  IsDrag := False;
end;

procedure TfrmActionMap.BtnMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   releasecapture;
  if sender.ClassType = TAdvGlowButton then
  begin
    with (sender as TAdvGlowButton) do begin
      if (x>=0)and(x<=ReSizeSpace) then
      begin
        if (y>=0)and(y<=ReSizeSpace) then perform(wm_syscommand,$f004,0);
        if (y>ReSizeSpace)and(y<height-ReSizeSpace) then perform(wm_syscommand,$f001,0);
        if (y>=height-ReSizeSpace)and(y<=height) then perform(wm_syscommand,$f007,0);
      end
      else if (x>ReSizeSpace)and(x<width-ReSizeSpace) then
      begin
        if (y>=0)and(y<=ReSizeSpace) then perform(wm_syscommand,$f003,0);
        if (y>ReSizeSpace)and(y<height-ReSizeSpace) then
        begin
          IsDrag := True;
          px := x;
          py := y;
//          perform(wm_syscommand,$f012,0);
        end;
        if (y>=height-ReSizeSpace)and(y<=width) then perform(wm_syscommand,$f006,0);
      end
      else if (x>=width-ReSizeSpace)and(x<=width) then
      begin
        if (y>=0)and(y<=ReSizeSpace) then perform(wm_syscommand,$f005,0);
        if (y>ReSizeSpace)and(y<height-ReSizeSpace) then perform(wm_syscommand,$f002,0);
        if (y>=height-ReSizeSpace)and(y<=width) then perform(wm_syscommand,$f008,0);
      end;

    end;
  end
  else
  begin
    IsDrag := True;
    px := x;
    py := y;
  end;
end;

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
  if FileExists(G_MainInfo.MainDir+Layoutxml) then
    LoadLayoutConfig
  else
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
        PicAction.Tag := obj^.PriorityNum;
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
                  ObjTemp^.DirecImgFile := G_MainInfo.MainDir+'arrow_down.gif';
                  PicAction.Picture.LoadFromFile(ObjTemp^.DirecImgFile );
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
                  ObjTemp^.DirecImgFile  :=G_MainInfo.MainDir+'arrow_left.gif';
                  PicAction.Picture.LoadFromFile(ObjTemp^.DirecImgFile);
                end
                else
                begin
                  PicAction.Left := btnAction.Left+btnaction.Width div 4;
                  PicAction.Top := btnAction.Height +btnAction.Top +Space;
                  ObjTemp^.DirecImgFile :=G_MainInfo.MainDir+'arrow_down.gif';
                  PicAction.Picture.LoadFromFile(ObjTemp^.DirecImgFile);
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



procedure TfrmActionMap.mniFontClick(Sender: TObject);
begin
  inherited;
  if dlgFont1.Execute then
  begin
    (advpmnbtn.PopupComponent as TAdvGlowButton).Font := dlgFont1.Font;
    (advpmnbtn.PopupComponent as TAdvGlowButton).Font.Size := dlgFont1.Font.Size;
  end;
end;

procedure TfrmActionMap.mniN1Click(Sender: TObject);
begin
  inherited;
  SetDesign;
end;

procedure TfrmActionMap.mniN2Click(Sender: TObject);
begin
  inherited;
  SetDesign(False);
end;

procedure TfrmActionMap.mniN3Click(Sender: TObject);
var
 i :Integer;
 tmpbtn:TAdvGlowButton;
 actionobj:PActionObj;
 picname:string;
begin
  inherited;
  if dlgOpenPicbtn.Execute then
  begin
    try
      picname:=dlgOpenPicbtn.FileName;
      tmpbtn :=(advpmnbtn.PopupComponent as TAdvGlowButton);
      tmpbtn.Picture.LoadFromFile(picname);

      if tmpbtn.Tag  = 99 then
      begin
        closeImg := picname;
      end
      else
      begin
        for I := 0 to ActionList.Count - 1 do
        begin
          actionobj := PActionObj(ActionList[i]);
          if actionobj^.ActionBtn.Name =tmpbtn.Name  then
          begin
           actionobj^.BtnImgFile :=picname;
           Break;
          end;
        end;
      end;
    except
      on Ex:Exception do
      begin
        ShowMsgSure('更换图标出现错误：'+ex.Message);
        WriteErrorLog(ex.Message);
      end;

    end;
  end;
end;



procedure TfrmActionMap.mnidirecdownClick(Sender: TObject);
var
  imgFile:string;
  img:TAdvPicture;
  mitem:TMenuItem;
  tmppic:TAdvPicture;
  i:Integer;
  actionobj:PActionObj;
begin
  inherited;
  mitem := (sender as TMenuItem);
  case mitem.Tag of
    0: //左
    begin
      imgFile :=G_MainInfo.MainDir+'arrow_left.gif' ;
    end;
    1: //右
    begin
      imgFile :=G_MainInfo.MainDir+'direcImg.gif' ;
    end;
    2: //下
    begin
      imgFile :=G_MainInfo.MainDir+'arrow_down.gif' ;
    end;
  end;
  tmppic :=(advpmndirec.PopupComponent as TAdvPicture);
  for I := 0 to ActionList.Count - 1 do
  begin
    actionobj := PActionObj(ActionList[i]);
    if actionobj^.ActionPic.Name = tmppic.Name then
    begin
      actionobj^.DirecImgFile := imgFile;
      Break;
    end;
  end;
 tmppic.Picture.LoadFromFile(imgFile);
end;

procedure TfrmActionMap.LoadLayoutConfig;
var
 xmlFile:IXMLDocument;
 rootNode,node,btnnode,picnode:IXMLNode;
 i,j:Integer;
 tmpbtn:TAdvGlowButton;
 tmpPic:TAdvPicture;
 actionobj:PActionObj;
begin
  xmlFile := NewXMLDocument;
  xmlfile.LoadFromFile(G_MainInfo.MainDir+layoutxml);
  rootNode := xmlFile.DocumentElement;
  node := rootNode.ChildNodes.FindNode('buttons');
  //创建button
  for I := 0 to node.ChildNodes.Count - 1 do
  begin
    btnnode := node.ChildNodes[i];
    tmpbtn := TAdvGlowButton.Create(AdvPanel1);
    tmpbtn.Parent := AdvPanel1;
    tmpbtn.Cursor := crDefault;
    if btnnode.Attributes['Name']='' then
      tmpbtn.Name :=Format('btn%d',[i])
    else
      tmpbtn.Name := btnnode.Attributes['Name'] ;

    tmpbtn.Caption := btnnode.Attributes['Caption'];
    if btnnode.Attributes['Font'] ='' then
       tmpbtn.Font.Name := '微软雅黑'
    else
      tmpbtn.Font.Name := btnnode.Attributes['Font'];
    if btnnode.Attributes['FontSize'] ='' then
      tmpbtn.Font.Size := 18
    else
      tmpbtn.Font.Size := btnnode.Attributes['FontSize'];
    tmpbtn.Left := btnnode.Attributes['Left'];
    tmpbtn.Top := btnnode.Attributes['Top'];
    tmpbtn.Height := btnnode.Attributes['Height'];
    tmpbtn.Width := btnnode.Attributes['Width'];
    if btnnode.Attributes['ImageFile']<>'' then
      tmpbtn.Picture.LoadFromFile(btnnode.Attributes['ImageFile'])
    else
    begin
      tmpbtn.Images := ilAction;
      tmpbtn.ImageIndex := btnnode.Attributes['ImageIndex'];
    end;
    tmpbtn.Tag := btnnode.Attributes['Tag'];
    tmpbtn.Layout := AdvGlowButton.blGlyphTop;
    tmpbtn.OnClick := BtnOnClick;
    tmpbtn.Visible := True;
    for j := 0 to ActionList.Count - 1 do
    begin
      actionobj :=PActionObj(ActionList[j]);
      if actionobj^.PriorityNum = tmpbtn.Tag then
      begin
        actionobj^.ActionBtn := tmpbtn;
        actionobj^.BtnImgFile :=btnnode.Attributes['ImageFile'];
        Break;
      end;
    end;
  end;

  node := rootNode.ChildNodes.FindNode('Images');
  //创建方向Picture
  for I := 0 to node.ChildNodes.Count - 1 do
  begin
    picnode := node.ChildNodes[i];
    tmpPic := TAdvPicture.Create(AdvPanel1);
    tmpPic.Parent := AdvPanel1;
    tmpPic.AutoSize := True;
    tmpPic.PicturePosition :=AdvPicture.bpTopLeft;
    tmpPic.Left := picnode.Attributes['Left'];
    tmpPic.Top := picnode.Attributes['Top'];
    tmpPic.Tag := picnode.Attributes['Tag'];
    if picnode.Attributes['ImageFile'] ='' then
      tmpPic.Picture.LoadFromFile(G_MainInfo.MainDir+direcImg)
    else
      tmpPic.Picture.LoadFromFile(picnode.Attributes['ImageFile']);
    tmpPic.Visible := True;
    for j := 0 to ActionList.Count - 1 do
    begin
      actionobj :=PActionObj(ActionList[j]);
      if actionobj^.PriorityNum = tmpPic.Tag then
      begin
        actionobj^.ActionPic := tmpPic;
        actionobj^.BtnImgFile :=picnode.Attributes['ImageFile'];
        Break;
      end;
    end;
  end;
end;


procedure TfrmActionMap.SaveLayoutConfig;
{
<?xml version="1.0" encoding="UTF-8"?>
<ActionButton>
	<buttons>
		<button Name="" Caption="" Font="" FontSize="" Left="" Top="" Height="" Width="" ImageIndex="" ImageFile="" Tag="1"/>
	</buttons>
	<Images>
		<imageName="pic1" Left="492" Top="309" ImageFile="C:\Batj2005\arrow_left.gif"/>
	</Images>
</ActionButton>
}
var
 i,j:Integer;
 obj:PActionObj;
 tmpbtn:TAdvGlowButton;
 tmpImg:TAdvPicture;
 xmlFile:TXMLDocument;
 rootNode,node:IXMLNode;
begin
  xmlFile := TXMLDocument.Create(nil);
  xmlFile.Active := true;
  xmlFile.Version :='1.0';
  xmlFile.Encoding := 'utf-8';
  rootNode := xmlFile.CreateNode('ActionButton');
  xmlFile.DocumentElement := rootNode;
  node :=xmlFile.CreateNode('buttons');
  rootNode.ChildNodes.Add(node);
  node := xmlFile.CreateNode('Images') ;
  rootNode.ChildNodes.Add(node);

  for i := 0 to ActionList.Count - 1 do
  begin
    obj :=  PActionObj(ActionList[i]);
    tmpbtn := TAdvGlowButton(obj^.ActionBtn);
    node := rootNode.ChildNodes[0].AddChild('button') ;
    node.Attributes['Name']:= tmpbtn.Name;
    node.Attributes['Caption'] := tmpbtn.Caption;
    node.Attributes['Font'] := tmpbtn.Font.Name;
    node.Attributes['FontSize'] := tmpbtn.Font.Size;
    node.Attributes['Left'] := tmpbtn.Left;
    node.Attributes['Top'] := tmpbtn.Top;
    node.Attributes['Height'] := tmpbtn.Height;
    node.Attributes['Width'] := tmpbtn.Width;
    node.Attributes['ImageIndex'] := tmpbtn.ImageIndex;
    node.Attributes['ImageFile'] := obj^.BtnImgFile;
    node.Attributes['Tag'] := tmpbtn.Tag;

    //保存图片信息
    tmpImg := TAdvPicture(obj^.ActionPic);
    node := rootNode.ChildNodes[1].AddChild('Image') ;
    node.Attributes['Name'] := tmpImg.Name;
    node.Attributes['Left'] := tmpImg.Left;
    node.Attributes['Top'] := tmpImg.Top ;
    node.Attributes['ImageFile'] := obj^.DirecImgFile;
    node.Attributes['Tag'] := tmpImg.Tag;
  end;

  //退出按钮

  if Assigned(AdvPanel1.FindComponent('btnClose')) then
  begin
    tmpbtn := (AdvPanel1.FindComponent('btnClose') as TAdvGlowButton);
    node := rootNode.ChildNodes[0].AddChild('button') ;
    node.Attributes['Name'] := 'btnClose';
    node.Attributes['Caption'] := tmpbtn.Caption;
    node.Attributes['Font'] := tmpbtn.Font.Name;
    node.Attributes['FontSize'] := tmpbtn.Font.Size;
    node.Attributes['Left'] := tmpbtn.Left;
    node.Attributes['Top'] := tmpbtn.Top;
    node.Attributes['Height'] := tmpbtn.Height;
    node.Attributes['Width'] := tmpbtn.Width;
    node.Attributes['ImageIndex'] := tmpbtn.ImageIndex;
    node.Attributes['ImageFile'] := closeImg;
    node.Attributes['Tag'] := tmpbtn.Tag;
  end;
  xmlFile.SaveToFile(G_MainInfo.MainDir+layoutXML);
  xmlFile.Free;
end;

procedure TfrmActionMap.SetDesign(const Flag: Boolean=true);
var
 i:Integer;
 actionBtn:TAdvGlowButton;
 actionImg:TAdvPicture;
begin
  for I := 0 to AdvPanel1.ComponentCount - 1 do
  begin
    if AdvPanel1.Components[i].ClassType = TAdvGlowButton then
    begin
      actionBtn := (AdvPanel1.Components[i] as TAdvGlowButton);
      //设计
      if Flag then
      begin
        with actionBtn do
        begin
          Cursor := crSizeAll;
          OnClick :=nil;
          PopupMenu := advpmnbtn;
          OnMouseDown := BtnMouseDown;
          OnMouseMove := OnMyMouseMove;
          OnMouseUp := OnMyMouseUp;
        end;

      end
      else //运行
      begin
        with actionBtn do
        begin
          Cursor := crDefault;
          OnClick := BtnOnClick;
          PopupMenu :=  nil;
          OnMouseDown := nil;
          OnMouseMove := nil;
          OnMouseUp   :=nil;
        end;
      end;
    end
    else if  AdvPanel1.Components[i].ClassType=TAdvPicture then  //方向箭头
    begin
      actionImg:= (AdvPanel1.Components[i] as TAdvPicture);
      if Flag then
      begin
       with actionImg do begin
         Cursor := crSizeAll;
         PopupMenu := advpmndirec;
         OnMouseDown := BtnMouseDown;
         OnMouseMove := OnMyMouseMove;
         OnMouseUp := OnMyMouseUp;
       end;
      end
      else
      begin
        with actionImg do begin
          Cursor := crDefault;
          OnMouseDown := nil;
          OnMouseMove := nil;
          OnMouseUp := nil;
          PopupMenu := nil;
        end;

      end;
    end;
         
  end;
  //保存配置
  if not Flag then
  begin
    SaveLayoutConfig;
  end;
end;

initialization
  RegisterClass(TfrmActionMap);
finalization
  UnRegisterClass(TfrmActionMap);
end.
