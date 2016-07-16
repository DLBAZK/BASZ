/// <summary>
/// 病历终末质量等级设置
/// </summary>
/// <author> Lisa </author>
/// <date> 2016-05-21 </date>
unit UFrmZmzlpf;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFrmSuiDBListForm, DBGridEhGrouping, ExtCtrls, AdvSplitter, ComCtrls, PrnDbgeh, DB, ActnList, DBClient,
  UDlClientDataset, DosMove, AdvPanel, AdvAppStyler, AdvToolBar, AdvToolBarStylers, AdvOfficeStatusBar, AdvOfficeStatusBarStylers,
  GridsEh, DBGridEh, AdvGlowButton,UVsMidClassList, StdCtrls, EllipsLabel,
  AdvFontCombo, DBCtrls, SUIDBCtrls;

type
  TZmzlpfData=Record
    ZmzlpfTreeNodeCode:String;
    ZmzlpfTreeNodeName:String;
  End;
  PZmzlpfData=^TZmzlpfData;

  PZmzlLb=^TZmzllb;
  TZmZlLb=record
    dm:string;
    dmmc:string;
  end;
type
  TFrmZmzlpf = class(TFrmSuiDBListForm)
    tvZmzlpf: TTreeView;
    advspltr1: TAdvSplitter;
    AdvPanel2: TAdvPanel;
    lbllb1: TEllipsLabel;
    clientdtlb: TClientDataSet;
    dslb: TDataSource;
    suicbcbblb: TsuiDBLookupComboBox;
    procedure tvZmzlpfChange(Sender: TObject; Node: TTreeNode);
    procedure DLCDSBeforeInsert(DataSet: TDataSet);
    procedure DLCDSAfterInsert(DataSet: TDataSet);
    procedure acSaveExecute(Sender: TObject);
    procedure acDelExecute(Sender: TObject);
    procedure acCancelExecute(Sender: TObject);
    procedure suicbcbblbCloseUp(Sender: TObject);
  private
    { Private declarations }
    ZmzlpfTreeData: PZmzlpfData;
    procedure CreateTree; // 创建树
    Procedure RefreshTree; // 刷新树目录
    Function BindTreeNode(Code:String):TTreeNode; // 绑定到指定树结点
    procedure ReLoadZLPJ(dm:string);
  Protected
    Procedure CheckData;Override;
    Procedure InitControl;Override;
  public
    { Public declarations }
    Constructor Create(Aowner:TComponent);Override;
  end;

implementation

Uses UGVar,UGFun,UCommon,UMidProxy,UGShare;
ResourceString
  SZmzlCode='病历终末质量等级';

{$R *.dfm}

{ TFrmZmzlpf }

constructor TFrmZmzlpf.Create(Aowner: TComponent);
var
  sql:string;
begin
  sql := 'select dm ,dmmc from Vszklb where isty=0 order by dm';
  inherited Create(Aowner,EuVsZmzlpf,'');
  FillDBGridEHCombobox('SELECT dm xmlx,dmmc xmlxmc FROM Vsxmlx WHERE isTy = 0',dbgrdh_DLCDS,'xmlx','xmlx','xmlxmc');
  FillDBGridEHCombobox(sql,dbgrdh_DLCDS,'zklb','dm','dmmc');

  TMidProxy.SqlOpen(sql,clientdtlb);
  if not VarIsNull(clientdtlb.FieldByName('dm').AsVariant) then
  begin
    suicbcbblb.KeyValue :=clientdtlb.FieldByName('dm').AsVariant;
    ReLoadZLPJ(suicbcbblb.KeyValue);
  end;

end;

procedure TFrmZmzlpf.CreateTree;
Var
  ParentTree:TTreeNode;
  CdsZmzlpf: TClientDataSet;
  Procedure _CreateChild(PTree: TTreeNode;UpperCode: string);
  Var
    TempSubItem: TTreeNode;
    DataSet: TClientDataSet;
  Begin
    DataSet:=TClientDataSet.Create(Nil);
    AutoFree(DataSet);
    DataSet.CloneCursor(CdsZmzlpf,False);
    SetFilter(Format('upperCode=^%s^',[UpperCode]),DataSet);
    While Not DataSet.Eof Do
    Begin
      TempSubItem:=tvZmzlpf.Items.AddChild(PTree,DataSet.FieldByName('codeName').AsString);
      New(ZmzlpfTreeData);
      ZmzlpfTreeData.ZmzlpfTreeNodeCode:=DataSet.FieldByName('code').AsString;
      ZmzlpfTreeData.ZmzlpfTreeNodeName:=DataSet.FieldByName('codeName').AsString;
      TempSubItem.Data:=ZmzlpfTreeData;
      _CreateChild(TempSubItem,ZmzlpfTreeData.ZmzlpfTreeNodeCode);
      DataSet.Next;
    End;
  End;
Begin
  tvZmzlpf.Items.Clear;

  ParentTree := tvZmzlpf.Items.Add(Nil,SZmzlCode);
  New(ZmzlpfTreeData);
  ZmzlpfTreeData.ZmzlpfTreeNodeCode := '';
  ZmzlpfTreeData.ZmzlpfTreeNodeName := SZmzlCode;
  ParentTree.Data := ZmzlpfTreeData;

  CdsZmzlpf := TClientdataSet.Create(Nil);
  AutoFree(CdsZmzlpf);
  try
    TMidProxy.SqlOpen(Format('Select * From Vszmzlpf where zklb= ^%s^ Order By code',[suicbcbblb.KeyValue]),CdsZmzlpf);
    _CreateChild(ParentTree,'');
  except

  end;
End;

procedure TFrmZmzlpf.DLCDSAfterInsert(DataSet: TDataSet);
begin
  inherited;
  ZmzlpfTreeData:=tvZmzlpf.Selected.Data;
  DlCds.FieldByName('isTy').AsInteger:=CRepFalse;
  DlCds.FieldByName('isBj').AsInteger:=CRepFalse;
  DlCds.FieldByName('upperCode').AsString:=ZmzlpfTreeData.ZmzlpfTreeNodeCode;
  DLCDS.FieldByName('zklb').AsString := suicbcbblb.KeyValue;

end;

procedure TFrmZmzlpf.DLCDSBeforeInsert(DataSet: TDataSet);
begin
  ZmzlpfTreeData:=tvZmzlpf.Selected.Data;
  IF Length(ZmzlpfTreeData.ZmzlpfTreeNodeCode) = 15 Then
     Raise Exception.Create('不能在未级项目下再进行添加操作！');
  inherited;                                  
end;

procedure TFrmZmzlpf.InitControl;
begin
  inherited;

end;

procedure TFrmZmzlpf.RefreshTree;
Var
  TreeNode: TTreeNode;
begin
  inherited;
  CreateTree;
  tvZmzlpf.TopItem.Expand(False);
  TreeNode := BindTreeNode(DlCds.FieldByName('code').AsString);
  IF TreeNode = Nil Then
     TreeNode := BindTreeNode(DlCds.FieldByName('upperCode').AsString);
  IF TreeNode <> Nil Then
  Begin
    TreeNode.Selected := True;
    TreeNode.Expand(False);
  End;
end;

/// <summary>
/// 重新加载终末质量评价项目列表
/// </summary>
/// <param name="dm">类别代码</param>
procedure TFrmZmzlpf.ReLoadZLPJ(dm: string);
begin
  if not DLCDS.Active then Exit;
  
  tvZmzlpf.Items.Clear;
  SetFilter(Format('zklb=^%s^',[dm]),DLCDS);
  CreateTree;
  tvZmzlpf.TopItem.Expand(False);
  tvZmzlpf.TopItem.Selected:=True;
  tvZmzlpf.OnChange(tvZmzlpf,tvZmzlpf.TopItem);

end;

procedure TFrmZmzlpf.suicbcbblbCloseUp(Sender: TObject);
var
 dm:string;
begin
  inherited;

  if not VarIsNull(suicbcbblb.KeyValue) then
  begin
    dm :=suicbcbblb.KeyValue;
    //加载显示选择类别的评价标准
    ReLoadZLPJ(dm);
  end;
end;

procedure TFrmZmzlpf.tvZmzlpfChange(Sender: TObject; Node: TTreeNode);
begin
  inherited;
  IF Node=Nil Then Exit;

  ZmzlpfTreeData:=Node.Data;
  SetSbSimpleText(ZmzlpfTreeData.ZmzlpfTreeNodeCode+'  :  '+ZmzlpfTreeData.ZmzlpfTreeNodeName);
  SetFilter(Format('upperCode=^%s^ and zklb = ^%s^',[ZmzlpfTreeData.ZmzlpfTreeNodeCode,suicbcbblb.KeyValue]),DlCds);

end;

procedure TFrmZmzlpf.acCancelExecute(Sender: TObject);
begin
  inherited;
  RefreshTree;
end;

procedure TFrmZmzlpf.acDelExecute(Sender: TObject);
Var
  Code:String;
begin
  Code:=DlCds.FieldByName('code').AsString;
  if Code = '' then Exit;
  inherited;
  SetFilter(Format('upperCode=^%s^',[Code]),DlCds);
  While Not DlCds.Eof Do
    DlCds.Delete;
  BindTreeNode(Code).Delete;
  tvZmzlpf.OnChange(tvZmzlpf,tvZmzlpf.Selected);
end;

procedure TFrmZmzlpf.acSaveExecute(Sender: TObject);
var
 dm:string;
 treenode:TTreeNode;
 zmzldata:PZmzlpfData;
 code:string;
 clientdttmp:TClientDataSet;
begin
  if DLCDS.State in [dsInsert,dsEdit] then
  begin
    DLCDS.Post;
    code :=DLCDS.FieldByName('code').AsString;
    if code='' then
    begin
      code := DLCDS.FieldByName('itemcode').AsString+dlcds.FieldByName('uppercode').AsString;
    end;
    if Length(code)<15 then
    begin
      clientdttmp := TClientDataSet.Create(nil);
      AutoFree(clientdttmp);
      TMidProxy.SqlOpen(Format('select top 1 1 from Vszmzlpf where  uppercode=^%s^',[code]),clientdttmp);
      if clientdttmp.RecordCount  <>1  then
      begin
        if DLCDS.FieldByName('xmfz').AsInteger=0 then
        begin
            if ShowMsg('未包含子标准，确定不设置分值吗？','',33)=IDCancel then
           Exit;
        end;

      end;
    end;

  end;

  inherited;

  if not VarIsNull(suicbcbblb.KeyValue) then
  begin
    dm :=suicbcbblb.KeyValue;

    zmzldata := tvZmzlpf.Selected.Data;


    DLCDS.Mid_Open('Select * From Vszmzlpf Order By code');
    //加载显示选择类别的评价标准
    ReLoadZLPJ(dm);
    //自动定位上次选择记录
    treenode := BindTreeNode(zmzldata.ZmzlpfTreeNodeCode);
    if Assigned(treenode) then
    begin
      treenode.Selected :=True;
      treenode.Expand(False);
    end;
  end;

end;

function TFrmZmzlpf.BindTreeNode(Code: String): TTreeNode;
Var
  I:Integer;
begin
  Result:=Nil;
  For I := 0 To tvZmzlpf.Items.Count - 1 Do
  Begin
    ZmzlpfTreeData := tvZmzlpf.Items.Item[I].Data;
    IF ZmzlpfTreeData.ZmzlpfTreeNodeCode = Code Then
    Begin
      Result := tvZmzlpf.Items.Item[I];
      Break;
    End;
  End;
end;

procedure TFrmZmzlpf.CheckData;
var
  uppercode:string;
  fz:Integer;
begin
  inherited;
  IF DlCds.FieldByName('itemCode').AsString='' Then
     Raise Exception.Create('项目代码不能为空！');
  if Length(DlCds.FieldByName('itemCode').AsString) <> 5 then
     Raise Exception.Create('项目代码必须为5位！');
  IF DlCds.FieldByName('codeName').AsString='' Then
     Raise Exception.Create('项目名称不能为空！');

  uppercode :=DLCDS.FieldByName('uppercode').AsString;
  fz :=DLCDS.FieldByName('xmfz').AsInteger;
  if Length(uppercode) = 10 then
  begin
    if fz=0 then
    begin
      Raise Exception.Create('末级标准必须设置分值！');
    end;
  end;
end;

initialization
  Classes.RegisterClass(TFrmZmzlpf);
finalization
  Classes.UnRegisterClass(TFrmZmzlpf);
  
end.
