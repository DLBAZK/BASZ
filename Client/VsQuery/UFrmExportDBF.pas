/// <summary>
///  DBF数据导出配置
/// </summary>
/// <author> JDL </author>
/// <date> 2016-07-7 </date>
unit UFrmExportDBF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFrmSuiDBForm, DB, ActnList, DBClient, UDlClientDataset, DosMove,
  AdvPanel, AdvAppStyler, AdvToolBar, AdvToolBarStylers, AdvOfficeStatusBar,
  AdvOfficeStatusBarStylers, ExtCtrls, StdCtrls, AdvGroupBox, TFlatPanelUnit,
  DBGridEhGrouping, GridsEh, DBGridEh, AdvGlowButton, Grids_ts, TSGrid,
  TSDBGrid,UMidProxy,UVsMidClassList, TSDateTimeDef, TSDateTime, TSMask,
  QExport3, QExport3DBF, ComCtrls, AdvDateTimePicker, ExtDlgs, AdvEdit, AdvEdBtn;

type
  TFrmExportDBF = class(TFrmSuiDBForm)
    AdvGroupBox2: TAdvGroupBox;
    AdvPanel2: TAdvPanel;
    AdvPanel3: TAdvPanel;
    AdvPanel4: TAdvPanel;
    btnAddFZ: TAdvGlowButton;
    btn2: TAdvGlowButton;
    dbgrdh1: TDBGridEh;
    clientdtDBFFZ: TClientDataSet;
    dsDBFFZ: TDataSource;
    AdvPanel5: TAdvPanel;
    AdvPanel6: TAdvPanel;
    tsDBGridDBF: TtsDBGrid;
    btnInert: TAdvGlowButton;
    btnAdd: TAdvGlowButton;
    btnDel: TAdvGlowButton;
    btnSave: TAdvGlowButton;
    btnClose: TAdvGlowButton;
    clientdtTemp: TClientDataSet;
    tsMaskDefs1: TtsMaskDefs;
    tsDateTimeDef1: TtsDateTimeDef;
    btnOutPut: TAdvGlowButton;
    clientdtDBF: TClientDataSet;
    qxprt3dbfWTB: TQExport3DBF;
    clientdtDBFtmp: TClientDataSet;
    lbl1: TLabel;
    advdtmpckrStart: TAdvDateTimePicker;
    advdtmpckrEnd: TAdvDateTimePicker;
    lbl2: TLabel;
    advedtFileName: TAdvEditBtn;
    lbl3: TLabel;
    SaveTextFileDialog1: TSaveTextFileDialog;
    procedure btnAddFZClick(Sender: TObject);
    procedure clientdtDBFFZAfterScroll(DataSet: TDataSet);
    procedure btn2Click(Sender: TObject);
    procedure btnInertClick(Sender: TObject);
    procedure btnDelClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure tsDBGridDBFButtonClick(Sender: TObject; DataCol: Integer;
      DataRow: Variant);
    procedure btnSaveClick(Sender: TObject);
    procedure btnOutPutClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure advedtFileNameClickBtn(Sender: TObject);
  private
    { Private declarations }
    function GetTJZ: string;
    procedure GetFZ;
    Procedure SetWhereValueEditMask(FieldType:String);
  public
    { Public declarations }
    Constructor Create(Aowner:TComponent);Override;
    procedure InitControl; override;

  end;

var
  FrmExportDBF: TFrmExportDBF;

implementation
  uses UGShare,UGFun,UGVar,UCommon;
{$R *.dfm}


{ TFrmExportDBF }

procedure TFrmExportDBF.advedtFileNameClickBtn(Sender: TObject);
var
  filename :string;
begin
  inherited;
  SaveTextFileDialog1.Filter := 'dBase文件(*.DBF)';
  if SaveTextFileDialog1.Execute then
  begin
    filename := SaveTextFileDialog1.FileName;
    if Pos('.dbf',filename)<1 then
    begin
      filename := filename+'.DBF';
    end;
    advedtFileName.Text := filename;
  end;
end;

procedure TFrmExportDBF.btn2Click(Sender: TObject);
begin
  inherited;
  if (not clientdtDBFFZ.Active) or (clientdtDBFFZ.IsEmpty) then
   Exit;

  if ShowMsg('您确定要删除此分组【%S】, 吗？', '确认框',33)<>IDOk then
    Exit;
  TMidProxy.SqlExecute(Format('delete from VsCHDBFWhere where DBFName = ^%s^ ',[GetTJZ]));
  GetFZ;
end;

procedure TFrmExportDBF.btnAddClick(Sender: TObject);
Var
  CurTeamByID:Integer;
begin
  inherited;
  IF GetTjz='' Then
     Raise Exception.Create('请先建立分组');
  DlCds.Last;
  CurTeamByID:=DlCds.FieldByName('DBFByID').AsInteger;
  DLCDS.Append;
  SetFieldValue('DBFByID',IntToStr(CurTeamByID+1),DlCds,False);
  SetFieldValue('DBFName',GetTjz,DlCds,False);

end;

procedure TFrmExportDBF.btnAddFZClick(Sender: TObject);
Var
  TeamName:String;
//  cdsTemp: TClientDataSet;
begin
  inherited;
  TeamName:=InputDialog('新建分组','请输入分组名称','');
  IF TeamName<>'' Then
  Begin
     IF ExistsRecord(Format('Select 1 From VsCHDBFWhere Where DBFName=^%s^',[TeamName])) Then
      Begin
        ShowMsg('您要建组名已经存在','注意',64);
        Exit;
      End;
    clientdtDBFFZ.Append;
    clientdtDBFFZ.Fields[0].AsString:=TeamName;
    clientdtDBFFZ.Post;
    clientdtDBFFZAfterScroll(clientdtDBFFZ);
    btnAddClick(nil);
  End;

end;

procedure TFrmExportDBF.btnCloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFrmExportDBF.btnDelClick(Sender: TObject);
begin
  inherited;
  acDelExecute(nil);
end;

procedure TFrmExportDBF.btnInertClick(Sender: TObject);
Var
  CurRec,CurTeamByID:Integer;
begin
  inherited;
  if GetTJZ ='' then
    ShowMsg('请先创建分组','',0);
  if DLCDS.RecordCount = 0 then
  begin
     btnAddFZClick(nil);
     Exit;
  end;
  CurRec := DLCDS.RecNo;
  if CurRec <0 then
  begin
    ShowMsg('请重新选择一行记录或保存当前设置后再进行插入条件操作','',0);
    Exit;
  end;
  CurTeamByID := DLCDS.FieldByName('DBFByID').AsInteger;
  with DLCDS do
  begin
     DisableControls;
     while not Eof do
     begin
       SetFieldValue('DBFByID',IntToStr(DLCDS.FieldByName('DBFByID').AsInteger+1),DLCDS,False);
       Next;
     end;
     EnableControls;
  end;
  DLCDS.RecNo := CurRec;
  DLCDS.Insert;
  SetFieldValue('DBFByID',IntToStr(CurTeamByID),DLCDS,False);
  SetFieldValue('DBFName',GetTJZ,DLCDS,False);
end;

procedure TFrmExportDBF.btnOutPutClick(Sender: TObject);

     //组织SQL语句
  Function _GenQuerySQL:String;
    const
     leftjoinSQL = ' on VsCh0A.ChYear=%0:s.ChYear And VsCh0A.Ch0A01=%0:s.%s01';
  Var
    FieldSql,WhereUnionTable,TableName:String;
     FJTJSQL,JoinSQL,ZDBJoinSQL :string;
     clientdtZDB:TClientDataSet;
     tindex:Integer;
  Begin
    Result:='';
    tindex := 0;
    with DLCDS do
    begin
       First;
       while not Eof do
       begin
         ZDBJoinSQL:='';
         //取出字段
         if FieldByName('DBFFJTJ').AsString <> '' then    //针对手术、诊断多次情况
         begin
           clientdtDBFtmp.Filtered := False;
           clientdtDBFtmp.Filter := Format(' DBFFJTJ =%s and DBFFJValue=%d',[QuotedStr(FieldByName('DBFFJTJ').AsString),
                FieldByName('DBFFJValue').AsInteger]);

           clientdtDBFtmp.Filtered := True;
           //同一附件条件 取多个字段
           if clientdtDBFtmp.RecordCount >1 then
           begin
             clientdtDBFtmp.First;
             TableName := Format('%s%d',[clientdtDBFtmp.FieldByName('DBFTable').AsString,clientdtDBFtmp.FieldByName('DBFByID').AsInteger]);

           end
           else
           begin
             TableName := Format('%s%d',[FieldByName('DBFTable').AsString,FieldByName('DBFByID').AsInteger]) ;
           end;
           
           FieldSql := FieldSql + Format(' ,%0:s.%1:s  %2:s',[TableName,
                 FieldByName('DBFField').AsString,FieldByName('DBFCField').AsString]) ;

           FJTJSQL := Format(' and %s.%s %s %s',[TableName,FieldByName('DBFFJTJ').AsString,
                  FieldByName('DBFOperate').AsString,FieldByName('DBFFJValue').AsString]);

         end
         else
         begin
           FieldSql := FieldSql + Format(', %0:s.%1:s  %2:s',[FieldByName('DBFTable').AsString,
                   FieldByName('DBFField').AsString,FieldByName('DBFCField').AsString]) ;
           TableName := FieldByName('DBFTable').AsString;
           FJTJSQL := '';
         end;

          if DLCDS.FieldByName('DBFCSql').AsString <>'' then
                 FieldSql := StringReplace(FieldSql,Format('%0:s.%1:s',[TableName,
                         FieldByName('DBFField').AsString]),DLCDS.FieldByName('DBFCSql').AsString,[rfReplaceAll,rfIgnoreCase]);

         clientdtZDB := TClientDataSet.Create(nil);
         AutoFree(clientdtZDB);
         
         //查询关联字典表
         TMidProxy.SqlOpen(Format('SELECT FieldST,FieldStDm,FieldStDmmc FROM dbo.VsCHStructure WHERE FieldTable=^%s^ AND FieldName=^%s^',
                [FieldByName('DBFTable').AsString,FieldByName('DBFField').AsString]),clientdtZDB);
         if clientdtZDB.FieldByName('FieldST').AsString <> '' then
         begin
           Inc(tindex);
           FieldSql := StringReplace(FieldSql,TableName+'.'+FieldByName('DBFField').AsString,
                Format('%0:s%1:d.%2:s',[clientdtZDB.FieldByName('FieldST').AsString,tindex,
                               clientdtZDB.FieldByName('FieldSTDMMC').AsString]),
                               [rfReplaceAll,rfIgnoreCase]);
           ZDBJoinSQL := Format(' left join %s %0:s%1:d on  %2:s.%3:s =%0:s%1:d.%4:s ',[clientdtZDB.FieldByName('FieldST').AsString,
               tindex,TableName,FieldByName('DBFField').AsString,clientdtZDB.FieldByName('FieldSTDM').AsString ]) ;
           if DLCDS.FieldByName('DBFCSql').AsString <>'' then
                 FieldSql := StringReplace(FieldSql,Format('%0:s.%1:s',[TableName,
                         FieldByName('DBFField').AsString]), Format('%0:s%1:d.%2:s',[clientdtZDB.FieldByName('FieldST').AsString,tindex,
                               clientdtZDB.FieldByName('FieldSTDMMC').AsString]),[rfReplaceAll,rfIgnoreCase]);
         end;


         if  not SameText(UpperCase(TableName),'VSCH0A') then
         begin
            JoinSQL :=format(' left join %s %s %s %s',[FieldByName('DBFTable').AsString,
                TableName,Format(leftjoinSQL,[TableName,Copy(FieldByName('DBFTable').AsString,3,4)]),FJTJSQL]);
            //重复则不添加
            if StrPos(PChar(WhereUnionTable),PChar(JoinSQL))=nil then
              WhereUnionTable := WhereUnionTable+JoinSQL;

         end;
         WhereUnionTable := WhereUnionTable+zdbjoinsql;
         Next;
       end;

    end;

    Result := Format('select %s from VsCH0A %s ',[Copy(FieldSql,Pos(',',FieldSql)+1,StrLen(PChar(FieldSql))),WhereUnionTable]);
  End;
var
 exportSQL,StrDateStart,StrDateEnd,WhereSql:string;
begin
  inherited;
  acSaveExecute(nil);
  if not DLCDS.Active or (DLCDS.IsEmpty) then
  begin
    ShowMsg('请选择需要导出的数据！','',48);
    Exit;
  end;
  if advedtFileName.Text = '' then
  begin
    ShowMsg('DBF导出文件名称不能为空','',48);
    Exit;
  end;
  if advdtmpckrEnd.Date < advdtmpckrStart.Date then
  begin
    ShowMsg('结束日期小于开始日期','',48);
    Exit;
  end;
  StrDateStart := DateToStr(advdtmpckrStart.Date);
  StrDateEnd := DateToStr(advdtmpckrEnd.Date);

  WhereSql  := Format(' where CH0A27 >= %s and CH0A27 <= %s',[QuotedStr(StrDateStart),QuotedStr(StrDateEnd)]);
  StartWaitWindow('正在导出相关数据,请稍候......');
  if Dlcds.state in [DB.dsEdit,DB.dsInsert] then
     Dlcds.Post;
  exportSQL :=_GenQuerySQL+WhereSql;
  try
    if exportSQL <> '' then
    begin
      TMidProxy.SqlOpen(exportSQL,clientdtDBF);
      if not clientdtDBF.IsEmpty then
      begin
        qxprt3dbfWTB.FileName := advedtFileName.Text;
        qxprt3dbfWTB.Execute;
        EndWaitWindow;
        ShowMsg('导出成功','提示',64);
      end
      else
      begin
        EndWaitWindow;
        ShowMsg('未查询到符合的数据','提示',16);
      end;
    end;
  finally
    EndWaitWindow;
  end;
end;

procedure TFrmExportDBF.btnSaveClick(Sender: TObject);
begin
  inherited;
  acSaveExecute(nil);
end;

procedure TFrmExportDBF.clientdtDBFFZAfterScroll(DataSet: TDataSet);
begin
  inherited;
  DLCDS.Mid_Open(Format('SELECT * FROM VsCHDBFWhere where DBFName=^%s^ order by DBFByID',[GetTJZ]));
end;

constructor TFrmExportDBF.Create(Aowner: TComponent);
begin
  inherited Create(Aowner,EuVsDBF,'SELECT * FROM VsCHDBFWhere where 1<>1');

  clientdtDBFtmp.CloneCursor(DLCDS,True,False);
end;



procedure TFrmExportDBF.GetFZ;
begin
   TMidProxy.SqlOpen('SELECT DISTINCT DBFName FROM VsCHDBFWhere',clientdtDBFFZ);
end;

function TFrmExportDBF.GetTJZ: string;
begin
   Result:='';
  if not clientdtDBFFZ.Active then
    Exit;
  Result:=clientdtDBFFZ.FieldByName('DBFName').AsString;
end;

procedure TFrmExportDBF.InitControl;
begin
  inherited;
  GetFZ;
end;

procedure TFrmExportDBF.SetWhereValueEditMask(FieldType: String);
begin
   IF SameText(DlCds.FieldByName('DBFOperate').AsString,'In') Then
     FieldType:='C';
     
  if FieldType ='' then
     FieldType := 'N';
     
  IF FieldType='N' Then // 数值型
     Begin
       tsDBGridDBF.Col['DBFFJValue'].ButtonType:=btDefault;
       tsDBGridDBF.Col['DBFFJValue'].MaskName:='MaskNumeric';
     End;
  IF FieldType='D' Then // 日期型
     Begin
       tsDBGridDBF.Col['DBFFJValue'].ButtonType:=btDateTimeDropDown;
       tsDBGridDBF.Col['DBFFJValue'].MaskName:='';
     End;
  IF FieldType='C' Then // 字符型
     Begin
       tsDBGridDBF.Col['DBFFJValue'].ButtonType:=btNormal;
       tsDBGridDBF.Col['DBFFJValue'].MaskName:='';
     End;
end;

procedure TFrmExportDBF.tsDBGridDBFButtonClick(Sender: TObject;
  DataCol: Integer; DataRow: Variant);
begin
  inherited;
  //项目名称
  if SameText(tsDBGridDBF.Col[datacol].FieldName,'DBFFieldMC') then
  begin
    TMidProxy.SqlOpen('Select * From VsCHStructure',clientdtTemp);
    ShowDm(clientdtTemp,'FieldName','FieldNamec','Pym','Wbm',G_Dm,G_Dmmc);
    if G_Dm <> '' then
    begin
      //当改变查询条件项目的时候,则自动清空条件值内容
      IF clientdtTemp.FieldByName('FieldName').AsString<>DlCds.FieldByName('DBFField').AsString Then
         Begin
           SetFieldValue('DBFCField','',DlCds,False);
           SetFieldValue('DBFFJTJ','',DlCds,False);
         End;
      SetFieldValue('DBFField',clientdtTemp.FieldByName('FieldName').AsString,DlCds,False);
      SetFieldValue('DBFFieldMC',clientdtTemp.FieldByName('FieldNameC').AsString,DlCds,False);
      SetFieldValue('DBFFieldType',clientdtTemp.FieldByName('FieldType').AsString,DlCds,False);
      SetFieldValue('DBFOperate','=',DlCds,False);
      SetFieldValue('DBFTable',clientdtTemp.FieldByName('FieldTable').AsString,DlCds,False);
      //SetWhereValueEditMask(DlCds.FieldByName('DBFFieldType').AsString);
    end;
  end
  else if SameText(tsDBGridDBF.Col[datacol].FieldName,'DBFFJTJMC') then   //附加条件
  begin
    ShowDM(clientdtTemp,'FieldName','FieldNamec','Pym','Wbm',G_Dm,G_Dmmc);
    if G_Dm <> '' then
    begin
      //设置附加条件
      SetFieldValue('DBFFJTJ',clientdtTemp.FieldByName('FieldName').AsString,DlCds,False);
      SetFieldValue('DBFFJTJMC',clientdtTemp.FieldByName('FieldNameC').AsString,DlCds,False);
    end;
  end;


end;

initialization
  Classes.RegisterClass(TFrmExportDBF);
finalization
  Classes.UnRegisterClass(TFrmExportDBF);

end.
