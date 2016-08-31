/// <summary>
/// ������ת��������ͼ
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
    layoutXML='Layout.xml';  //����xml
    ReSizeSpace= 5;         //������ť��ƴ�С�߽�
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
    //��������
    ActionList:TList;
    controllist:TStringList;
    //�����ͷͼƬ
    direcImg:string;
    /// <summary>
    /// Ĭ�ϲ��ַ�����
    /// </summary>
    LayoutCol:Integer;
    IsDrag:Boolean;
    px,py:Integer;
    //�˳���ť��ͼƬ
    closeImg:string;
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
    /// <summary>
    /// �������ģʽ
    /// </summary>
    /// <param name="flag">true ��� false ����</param>
    procedure SetDesign(const Flag:Boolean=true);
    procedure BtnMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure OnMyMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure OnMyMouseUp(Sender: TObject; Button: TMouseButton;Shift: TShiftState; X, Y: Integer);
    /// <summary>
    /// ���沼��
    /// </summary>
    procedure SaveLayoutConfig;
    /// <summary>
    /// ���ز���
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
        PicAction.Tag := obj^.PriorityNum;
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
                  ObjTemp^.DirecImgFile := G_MainInfo.MainDir+'arrow_down.gif';
                  PicAction.Picture.LoadFromFile(ObjTemp^.DirecImgFile );
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
        ShowMsgSure('����ͼ����ִ���'+ex.Message);
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
    0: //��
    begin
      imgFile :=G_MainInfo.MainDir+'arrow_left.gif' ;
    end;
    1: //��
    begin
      imgFile :=G_MainInfo.MainDir+'direcImg.gif' ;
    end;
    2: //��
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
  //����button
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
       tmpbtn.Font.Name := '΢���ź�'
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
  //��������Picture
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

    //����ͼƬ��Ϣ
    tmpImg := TAdvPicture(obj^.ActionPic);
    node := rootNode.ChildNodes[1].AddChild('Image') ;
    node.Attributes['Name'] := tmpImg.Name;
    node.Attributes['Left'] := tmpImg.Left;
    node.Attributes['Top'] := tmpImg.Top ;
    node.Attributes['ImageFile'] := obj^.DirecImgFile;
    node.Attributes['Tag'] := tmpImg.Tag;
  end;

  //�˳���ť

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
      //���
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
      else //����
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
    else if  AdvPanel1.Components[i].ClassType=TAdvPicture then  //�����ͷ
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
  //��������
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
