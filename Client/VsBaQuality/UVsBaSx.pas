{*******************************************************}
{                                                       }
{       ����ɸѡ                                        }
{                                                       }
{       ��Ȩ���� (C) 2016 �人�������ҽ�����ݷ���      }
{                                                       }
{*******************************************************}

unit UVsBaSx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFrmSuiDBForm, AdvGlowButton, SUIButton, StdCtrls, SUIComboBox,
  SUIEdit, ComCtrls, AdvDateTimePicker, EllipsLabel, AdvGroupBox, DB, ActnList,
  DBClient, UDlClientDataset, DosMove, AdvPanel, AdvAppStyler, AdvToolBar,
  AdvToolBarStylers, AdvOfficeStatusBar, AdvOfficeStatusBarStylers, ExtCtrls,
  DBGridEhGrouping, AdvSplitter, GridsEh, DBGridEh, TFlatButtonUnit,
  TFlatPanelUnit, AdvEdit, AdvOfficeButtons, UDLAdvCheckBox;

type
  TFrmBaSx = class(TFrmSuiDBForm)
    AdvPanel2: TAdvPanel;
    AdvGroupBox1: TAdvGroupBox;
    advDtpks: TAdvDateTimePicker;
    advDtpjs: TAdvDateTimePicker;
    suiedtstart: TsuiEdit;
    suiedtEnd: TsuiEdit;
    AdvGlowButton1: TAdvGlowButton;
    FlatPanel1: TFlatPanel;
    FlatPanel2: TFlatPanel;
    suichkCheckAll: TsuiCheckBox;
    suichkinverseAll: TsuiCheckBox;
    FlatbtnAllCancle: TFlatButton;
    dbgrdhDest: TDBGridEh;
    FlatPanel3: TFlatPanel;
    FlatPanel4: TFlatPanel;
    suichkAll: TsuiCheckBox;
    suichkinverse: TsuiCheckBox;
    FlatbtnCancle: TFlatButton;
    dbgrdhSource: TDBGridEh;
    FlatPanel5: TFlatPanel;
    FlatPanel6: TFlatPanel;
    FlatPanel7: TFlatPanel;
    suiCheckBox7: TsuiCheckBox;
    suiCheckBox8: TsuiCheckBox;
    FlatButton3: TFlatButton;
    DBGridEh1: TDBGridEh;
    FlatbtnAllRight: TFlatButton;
    FlatbtnRight: TFlatButton;
    FlatbtnLeft: TFlatButton;
    FlatbtnAllLeft: TFlatButton;
    AdvedtCH0A23: TAdvEdit;
    dladvChkCH0A23: TDLAdvCheckBox;
    dladvChkCH0A27: TDLAdvCheckBox;
    dladvChkZyts: TDLAdvCheckBox;
    advckbDeath: TAdvOfficeCheckBox;
    advckbOPS: TAdvOfficeCheckBox;
    dsDest: TDataSource;
    clientdtDest: TClientDataSet;
    clientdtSource: TClientDataSet;
    clientdtSourcechk: TBooleanField;
    clientdtSourceCH0A00: TStringField;
    clientdtSourceCH0A02: TStringField;
    clientdtSourceCH0A03: TStringField;
    clientdtSourceCH0A23: TStringField;
    clientdtSourceCH0A27: TStringField;
    clientdtSourceCH0A33: TStringField;
    clientdtDestchk: TBooleanField;
    clientdtDestCH0A00: TStringField;
    clientdtDestCH0A02: TStringField;
    clientdtDestCH0A03: TStringField;
    clientdtDestCH0A23: TStringField;
    clientdtDestCH0A27: TStringField;
    clientdtDestCH0A33: TStringField;
    clientdtDestCh0A01: TStringField;
    clientdtDestChYear: TStringField;
    clientdtSourceCh0A01: TStringField;
    clientdtSourceChYear: TStringField;
    FlatPanel8: TFlatPanel;
    AdvbtnSave: TAdvGlowButton;
    AdvSplitter1: TAdvSplitter;
    AdvbtnClose: TAdvGlowButton;
    procedure suiedtstartKeyPress(Sender: TObject; var Key: Char);
    procedure FlatbtnAllRightClick(Sender: TObject);
    procedure AdvedtCH0A23KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure AdvedtCH0A23Enter(Sender: TObject);
    procedure AdvedtCH0A23Exit(Sender: TObject);
    procedure suichkAllClick(Sender: TObject);
    procedure FlatbtnCancleClick(Sender: TObject);
    procedure FlatbtnAllCancleClick(Sender: TObject);
    procedure AdvGlowButton1Click(Sender: TObject);
    procedure suiedtstartExit(Sender: TObject);
    procedure AdvbtnSaveClick(Sender: TObject);
    procedure dbgrdhSourceGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure dbgrdhDestGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
  private
    { Private declarations }
    /// <summary>
    /// ��Ժ�Ʊ����
    /// </summary>
    FCh0A23:string;
    constructor Create(Aower:TComponent);override;
    /// <summary>
    /// �ƶ�����
    /// </summary>
    /// <param name="CdsS">Դclientdataset</param>
    /// <param name="CdsD">Ŀ��clientdataset</param>
    procedure MoveData(CdsS,CdsD:TClientDataSet);
    /// <summary>
    /// ѡ�����
    /// </summary>
    /// <param name="dt">���ݼ��ؼ�</param>
    /// <param name="chkState">ѡ��״̬</param>
    /// <param name="bz">true �� ȫ����false ������</param>
    procedure SetDataCheck(dt:TClientDataSet;const chkState:Boolean;const bz:Boolean);
    /// <summary>
    ///�жϲ����Ƿ��ѱ���
    /// </summary>
    /// <param name="BAH">������</param>
    /// <returns></returns>
    function IsExist(BAH:string):Boolean;
  public
    { Public declarations }
  end;

var
  FrmBaSx: TFrmBaSx;

implementation
  uses
    UGFun,UGVar,UMidProxy,UVsMidClassList;

{$R *.dfm}

procedure TFrmBaSx.AdvbtnSaveClick(Sender: TObject);
var
  sql:string;
  CH0A01:string; //������
  CH0A00:string; //סԺ��
  CH0A02:string; //����
  CH0A03:string; //�Ա�
  
begin
  inherited;
  StartWaitWindow('���ڱ���...');
  try
    //DBGridEhSave(dbgrdhDest);
    if clientdtDest.Active then
    begin
      if not clientdtDest.IsEmpty then
      begin
        with clientdtDest do
        begin
          //�������ݵ����ݿ�
          First;
          while not Eof do
          begin
            CH0A00 := FieldByName('CH0A00').AsString;
            CH0A01 := FieldByName('CH0A01').AsString;
            CH0A02 := FieldByName('CH0A02').AsString;
            CH0A03 := FieldByName('CH0A03').AsString;
            if not IsExist(CH0A00) then            
            begin
              sql := Format('insert into VsPJBA0A values(%s,%s,%s,%s)',[Quotedstr(CH0A00),Quotedstr(CH0A01),Quotedstr(CH0A02),Quotedstr(CH0A03)]);
              Application.ProcessMessages;
              try
                TMidProxy.SqlExecute(sql);
              except
                on ex:Exception do
                begin
                  
                end;
              end;
            end;
            
            Next;
          end;
        end;
      end;
    end;
  finally
    EndWaitWindow;
  end;
end;

procedure TFrmBaSx.AdvedtCH0A23Enter(Sender: TObject);
begin
  inherited;
  SetSbSimpleText('�밴�ո����ȡ�������');
end;

procedure TFrmBaSx.AdvedtCH0A23Exit(Sender: TObject);
begin
  inherited;
  SetSbSimpleText('');
end;

procedure TFrmBaSx.AdvedtCH0A23KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_SPACE then
    FCH0A23:=ShowDM(sdm_ZyKs, AdvedtCH0A23);
end;

procedure TFrmBaSx.AdvGlowButton1Click(Sender: TObject);
  const
    ssql='select CH0A29,CH0A23=(Select SoMc From VsSoffice Where Sodm=Ch0A23),CH0A33,'
       +'CH0A27,(case when CH0A03=''1'' then ''��'' else ''Ů'' end)CH0A03,CH0A02,CH0A00,CH0A01,CHYear from vsCH0A as A where 1=1';
    function WhereSql:string;
      var
        sday,eday:Integer;
    begin

      if (not dladvChkCH0A27.Checked) and (not dladvChkCH0A23.Checked)
        and (not dladvChkZyts.Checked) and (not advckbDeath.Checked)
        and ( not advckbOPS.Checked)then
      begin
        Result := '';
        Exit;
      end;
      //��Ժ����
      if dladvChkCH0A27.Checked then
      begin
      //�Զ��ж�����˳��
        if advDtpks.Date > advDtpjs.Date then
          Result := Result +format(' and CH0A27 >= %s and CH0A27 <= %s',
              [QuotedStr(DateToStr(advDtpjs.Date)),QuotedStr(DateToStr(advDtpks.Date))])
        else
          Result := Result +format(' and CH0A27 >= %s and CH0A27 <= %s',
                  [QuotedStr(DateToStr(advDtpks.Date)),QuotedStr(DateToStr(advDtpjs.Date))])
      end;

      // ��Ժ����
      if dladvChkCH0A23.Checked then
      begin
        Result := Result + Format(' and CH0A23 = %s ',[QuotedStr(FCH0A23)]);
      end;

      // סԺ����
      if dladvChkZyts.Checked then
      begin
        if suiedtstart.Text ='' then
        begin
          sday := 0;
        end
        else
          sday := StrToInt(suiedtstart.Text) ;

        if suiedtEnd.Text = '' then
        begin
          eday :=0;
        end
        else
          eday := StrToInt(suiedtEnd.Text);

        Result := Result + Format(' and CH0A29 >= %d and CH0A29 <= %d ',[sday,eday]);
        
      end;

      //����  ת�����4
      if advckbDeath.Checked then
        Result :=Result+' and CH0A41 = ^4^';
      if advckbOPS.Checked then
       //����
         Result :=Result + ' and exists(select * from VsCh0E B where Ch0E01=Ch0A01  and B.ChYear=A.CHYear)';

    end;
var
  fsql,wsql:string;
  clientdttmp:TClientDataSet;

begin
  inherited;
  wsql := WhereSql;
  if wsql= '' then
  begin
    ShowMsgSure('���ڲ�����ʷ���������󣬽��鰴����������');
    Exit;
  end;
  StartWaitWindow('����ɸѡ...');
  try
    clientdttmp := TClientDataSet.Create(nil);
    //ɸѡ����
    fsql := ssql+wsql;
    TMidProxy.SqlOpen(fsql,clientdttmp);
    if clientdttmp.Active then
    begin     
      clientdtSource.EmptyDataSet;
       //��������
      with clientdttmp do
      begin
       if not IsEmpty then
       begin
          Open;
          DisableControls;
          First;
          while not eof do
          begin

            MoveData(clientdttmp,clientdtSource);
            First;
          end;
          EnableControls;
       end;
      end;
      if not clientdtSource.IsEmpty then
      begin
        clientdtSource.First;
        dbgrdhSource.DataSource := ds1;
      end;
    end;
  finally
    EndWaitWindow;
  end;
end;

constructor TFrmBaSx.Create(Aower: TComponent);
begin
  inherited Create(Aower,EuVsBaSx,'select getdate()');
  clientdtSource.CreateDataSet;
  clientdtDest.CreateDataSet;
  dbgrdhSource.DataSource :=nil;
  dbgrdhDest.DataSource :=nil;
end;

procedure TFrmBaSx.dbgrdhDestGetCellParams(Sender: TObject; Column: TColumnEh;
  AFont: TFont; var Background: TColor; State: TGridDrawState);
begin
  inherited;
   if dbgrdhDest.SumList.RecNo mod 2 = 0 then
    Background := clSkyBlue
  else
    Background :=clYellow;
end;

procedure TFrmBaSx.dbgrdhSourceGetCellParams(Sender: TObject; Column: TColumnEh;
  AFont: TFont; var Background: TColor; State: TGridDrawState);
begin
  inherited;
  if dbgrdhSource.SumList.RecNo mod 2 = 0 then
    Background := clSkyBlue
  else
    Background :=clYellow;

end;

procedure TFrmBaSx.FlatbtnAllCancleClick(Sender: TObject);
begin
  inherited;
  suichkCheckAll.Checked :=False;
  suichkinverseAll.Checked :=False;
  SetDataCheck(clientdtDest,False,True);
end;

procedure TFrmBaSx.FlatbtnAllRightClick(Sender: TObject);
var
  tag:Integer;
  MyClass: TDlClientDataset;
  //���ƻ�����
  procedure LeftOrRight(source,dest:TClientDataSet);
  begin
    with source do
    begin
      DisableControls;
      First;
      while not Eof do
      begin
        if FieldByName('chk').AsBoolean then
        begin
          MoveData(source,dest);
          First;
        end
        else
          Next;

      end;
      First;
      EnableControls;
    end;
  end;
begin
  inherited;

  tag := (Sender as TFlatButton).Tag;
  case tag of
     0:   //ȫ������
     begin
       if not clientdtSource.Active then  Exit;
       if clientdtSource.RecordCount =0 then Exit;
       with clientdtSource do
       begin
         DisableControls;
         try
           First;
           while not Eof do
           begin
             MoveData(clientdtSource,clientdtDest);
             First;
           end;
         finally
           EnableControls;
         end;

       end;
       dbgrdhSource.DataSource := nil;
       if not clientdtDest.IsEmpty then
       begin
         clientdtDest.First;
         dbgrdhDest.DataSource := dsDest;
       end
       else
         dbgrdhDest.DataSource := nil;
     end;
     1: //ѡ������
     begin
       if not clientdtSource.Active then  Exit;
       if clientdtSource.RecordCount =0 then Exit;
       LeftOrRight(clientdtSource,clientdtDest);
       if clientdtSource.IsEmpty then
          dbgrdhSource.DataSource :=nil;
       if not clientdtDest.IsEmpty then
         dbgrdhDest.DataSource := dsDest;
     end;
     2:  //ѡ������
     begin
       if not clientdtDest.Active then Exit;
       if clientdtDest.RecordCount = 0 then Exit;
       LeftOrRight(clientdtDest,clientdtSource);
       if clientdtDest.IsEmpty then
         dbgrdhDest.DataSource :=nil;
       if not clientdtSource.IsEmpty then
         dbgrdhSource.DataSource := ds1;
     end;
     3:  //ȫ������
     begin
       if not clientdtDest.Active then Exit;
       if clientdtDest.RecordCount = 0 then Exit;
       with clientdtDest do
       begin
         DisableControls;
         try
           First;
           while not Eof do
           begin
             MoveData(clientdtDest,clientdtSource);
             First;
           end;
         finally
           EnableControls;
         end;

       end;
       dbgrdhDest.DataSource :=nil;
       if not clientdtSource.IsEmpty then
       begin
         clientdtSource.First;
         dbgrdhSource.DataSource := ds1;
       end
       else
         dbgrdhSource.DataSource := nil;
     end;
  end;
end;



procedure TFrmBaSx.FlatbtnCancleClick(Sender: TObject);
begin
  inherited;
  suichkAll.Checked :=False;
  suichkinverse.Checked := False;
  SetDataCheck(clientdtSource,False,True);
end;

function TFrmBaSx.IsExist(BAH: string): Boolean;
var
 Sql:string;
 clientTmp:TClientDataSet;
begin
  Result :=False;
  if BAH = '' then Exit;
  clientTmp := TClientDataSet.Create(nil);
  Sql := Format('select count(*) as result from VSPJBA0A where CH0A00=%s',[BAH]);
  try
    TMidProxy.SqlOpen(Sql,clientTmp);
    if not clientTmp.IsEmpty then
    begin
      if clientTmp.FieldByName('result').AsInteger >0 then
         Result :=True;
    end;
  finally
    clientTmp.Free;
  end;
end;

procedure TFrmBaSx.MoveData(CdsS, CdsD: TClientDataSet);
var
  Bah,BaYear: string;
begin
  inherited;
  if Cdss.IsEmpty then Exit;

  with CdsS do begin
    if Eof then Exit;
    Bah := FieldByName('Ch0A01').AsString;
    BaYear := FieldByName('ChYear').AsString;

    
    CdsD.IndexFieldNames :=  'ChYear;Ch0A01' ;
    if not  CdsD.FindKey([BaYear,Bah]) then    
    begin
      CdsD.Append;
      CdsD.FieldByName('chk').AsBoolean :=False;
      CdsD.FieldByName('ChYear').AsString := BaYear;    //���
      CdsD.FieldByName('Ch0A00').AsString := FieldByName('Ch0A00').AsString;       //סԺ��
      CdsD.FieldByName('CH0A02').AsString := FieldByName('CH0A02').AsString;  //��������
      CdsD.FieldByName('CH0A03').AsString := FieldByName('CH0A03').AsString;  //�Ա�
      CdsD.FieldByName('CH0A01').AsString := Bah;  //������
      CdsD.FieldByName('CH0A23').AsString := FieldByName('CH0A23').AsString;  //��Ժ�Ʊ�
      //CdsD.FieldByName('CH0A29').AsInteger := FieldByName('CH0A29').AsInteger; //סԺ����
      CdsD.FieldByName('CH0A27').AsString := FieldByName('CH0A27').AsString;  //��Ժ����
      CdsD.FieldByName('CH0A33').AsString := FieldByName('CH0A33').AsString;  //����ҽʦ
      CdsD.Post;
      delete;
    end;
  end;

end;

procedure TFrmBaSx.SetDataCheck(dt: TClientDataSet; const chkState,
  bz: Boolean);
begin
   if (not dt.Active) and dt.IsEmpty then exit;
   with dt do
   begin
     DisableControls;
     Open;
     First;
     while not Eof do
     begin
       Edit;
       if bz then   //ȫ������
       begin
         FieldByName('chk').AsBoolean :=chkState;
       end
       else
       begin  //���ֲ��� ��ѡ
         if chkState then         
           FieldByName('chk').AsBoolean :=not FieldByName('chk').AsBoolean
         else
           FieldByName('chk').AsBoolean :=False;
       end;
       Post;
       Next;
     end;
     EnableControls;
   end;
end;

procedure TFrmBaSx.suichkAllClick(Sender: TObject);
 var
   CTag:Integer;
   chktmp:TsuiCheckBox;
begin
  inherited;
  if Sender is TsuiCheckBox then
  begin
    with Sender as TsuiCheckBox do
    begin
      CTag := Tag;
      case CTag of
         101: //���ȫѡ
         begin
           if Checked then
           begin
             SetDataCheck(clientdtSource,True,True);
             suichkinverse.Checked :=False;
           end
           else
           begin
             if not suichkinverse.Checked then
              SetDataCheck(clientdtSource,False,True);
           end;

         end;
         102: //��߷�ѡ
         begin
           if Checked then
           begin
             SetDataCheck(clientdtSource,True,False);
             suichkAll.Checked :=False;
           end
           else
           begin
             SetDataCheck(clientdtSource,False,False);
           end;

         end;
         201:  //�ұ�ȫѡ
         begin
           if Checked then
           begin
             SetDataCheck(clientdtDest,True,True);
             suichkinverseAll.Checked :=false;
           end
           else
           begin
             if not suichkinverseAll.Checked then
             begin
               SetDataCheck(clientdtDest,False,True);
             end;
           end;

         end;
         202: //�ұ߷�ѡ
         begin
           if Checked then
           begin
             SetDataCheck(clientdtDest,True,False);
             suichkCheckAll.Checked :=False;
           end
           else
           begin
             SetDataCheck(clientdtDest,False,False);
           end;
         end;
      end;
    end;
  end;
end;

procedure TFrmBaSx.suiedtstartExit(Sender: TObject);
var
 sday,eday:Integer;
begin
  inherited;
  if Trim(suiedtstart.Text) <> '' then
  begin
    sday :=StrToInt(suiedtstart.Text);
    if Trim(suiedtEnd.Text) <>'' then
    begin
      eday := StrToInt(suiedtEnd.Text) ;
      if sday > eday then
      begin
        ShowMsgSure('������Χ����!');
      end;
    end;
  end;


  
end;

procedure TFrmBaSx.suiedtstartKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not (Key  in ['0'..'9',#8,#13]) then
    Key := #0;
end;

initialization
  Classes.RegisterClass(TFrmBaSx);
finalization
  Classes.UnRegisterClass(TFrmBaSx);

end.
