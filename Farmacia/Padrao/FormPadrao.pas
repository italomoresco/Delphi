unit FormPadrao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, DB, DBCtrls, ExtCtrls, StdCtrls, Buttons, DBClient,
  ActnList, JvDBCombobox, SqlExpr, SemiModalForm, System.Actions, PngBitBtn;

type
  TPadrao = class(TForm)
    Panel2: TPanel;
    BotaoNovo: TPngBitBtn;
    BotaoGrava: TPngBitBtn;
    BotaoCancela: TPngBitBtn;
    BotaoExclui: TPngBitBtn;
    Bevel1: TBevel;
    DtSrc: TDataSource;
    StsBr: TStatusBar;
    PagePrincipal: TPageControl;
    pgConsulta: TTabSheet;
    pgCad: TTabSheet;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    pnlConsulta: TPanel;
    bt_pesquisa: TPngBitBtn;
    actPadrao: TActionList;
    F6: TAction;
    F7: TAction;
    procedure BotaoNovoClick(Sender: TObject);
    procedure BotaoGravaClick(Sender: TObject);
    procedure BotaoCancelaClick(Sender: TObject);
    procedure BotaoExcluiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DtSrcStateChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PageControl1Changing(Sender: TObject; var AllowChange: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure F6Execute(Sender: TObject);
    procedure F7Execute(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    //Popula Lista a partir das Combos para consulta avançada
    procedure ConfiguraConsAvancada(vConsAvancada : String; vCmpAvancadoItem : String;
                                vCmpAvancadoValue : String; vCondicaoItem : String; vCondicaoIndex : Integer; lsbSelect: TListBox;
                                cdsConsulta: TClientDataSet; lsbAuxiliar : TListBox);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure StsBrDrawPanel(StatusBar: TStatusBar; Panel: TStatusPanel;
      const Rect: TRect);
    procedure PagePrincipalChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DtSrcDataChange(Sender: TObject; Field: TField);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    AlphaPanel : TTransparentPanel;
  public
    { Public declarations }
      procedure SetBounds(ALeft, ATop, AWidth, AHeight: Integer); override;
  end;

var
  Padrao: TPadrao;
//  TD: TTransactionDesc;

implementation

uses uDM,Inicio, OfficeFunctions, ValidacG;

{$R *.dfm}

procedure TPadrao.SetBounds(ALeft, ATop, AWidth, AHeight: Integer);
var
  Rect: TRect;
  OurWidth: Integer;
  OurHeight: Integer;
begin
   if (Self.FormStyle = fsMDIChild) or (Self.FormStyle = fsNormal) then
   begin
      if Showing then
      begin
         // Obtem o retângulo da área cliente MDI
         if (Self.FormStyle = fsNormal) then
            Rect := Screen.WorkAreaRect
         else
            Windows.GetWindowRect(Application.MainForm.ClientHandle, Rect);

         // Calcular largura e altura da área cliente
         OurWidth := Rect.Right - Rect.Left;
         OurHeight := Rect.Bottom - Rect.Top;

         // Calcula a nova posição
         ALeft := (OurWidth - Width) div 2;
         ATop := (OurHeight - Height) div 2;
      end;
   end;
   inherited SetBounds(ALeft, ATop, AWidth, AHeight);
end;

procedure TPadrao.StsBrDrawPanel(StatusBar: TStatusBar; Panel: TStatusPanel;
  const Rect: TRect);
begin
   if (((not DtSrc.DataSet.Active) OR ((DtSrc.DataSet.RecordCount = 0) AND
       (DtSrc.State = dsBrowse))) and (PagePrincipal.ActivePage = pgCad)) or
       (DtSrc.State = dsInsert) then
   begin
      StsBr.Canvas.Brush.Color := clBtnFace;
      Panel.Text := '';
   end;
end;

procedure TPadrao.BotaoNovoClick(Sender: TObject);
begin
   if PagePrincipal.ActivePageIndex =  0 then
   begin
      PagePrincipal.ActivePageIndex := 1;
      PageControl1.ActivePageIndex := 0;
   end;
   if not DtSrc.DataSet.Active then DtSrc.DataSet.Open;
   DtSrc.Dataset.append;
   Self.SelectNext(Self.TabSheet1,True,True);
end;

procedure TPadrao.BotaoGravaClick(Sender: TObject);
begin
  ActiveControl := nil;
  if Inicial.VerificaCamposEmBranco(DtSrc) then
  begin
     DtSrc.Dataset.Post;
     (DtSrc.Dataset as TClientDataset).ApplyUpdates(0);
  end;
  if BotaoNovo.CanFocus then BotaoNovo.setfocus;
end;

procedure TPadrao.BotaoCancelaClick(Sender: TObject);
begin
   DtSrc.Dataset.cancel;
   if BotaoNovo.CanFocus then BotaoNovo.setfocus;
end;

procedure TPadrao.BotaoExcluiClick(Sender: TObject);
begin
   if DtSrc.DataSet.IsEmpty then
   begin
      MessageDlg('Não há nenhum registro selecionado para Exclusão!',mtInformation,[mbOk],0);
      Exit;
   end;
   if MessageDlg('Deseja realmente excluir este registro?',mtConfirmation,
                [mbYes,mbNo],0)=mrYes then
   begin
      DtSrc.dataset.delete;
      (DtSrc.DataSet as TCLientDataset).ApplyUpdates(0);
   end;
   if BotaoNovo.CanFocus then BotaoNovo.setfocus;
end;

procedure TPadrao.F6Execute(Sender: TObject);
begin
   //Vai para aba anterior do PageControl
   if DtSrc.State = dsBrowse then
   begin
      if PagePrincipal.ActivePageindex > 0 then
      begin
         if PageControl1.CanFocus then PageControl1.SetFocus;
         PageControl1.ActivePage := PageControl1.FindNextPage(PageControl1.ActivePage, False, True);
      end;
   end;
end;

procedure TPadrao.F7Execute(Sender: TObject);
begin
   //vai para Proxima aba do Pagecontrol
   if DtSrc.State = dsBrowse then
   begin
      if PagePrincipal.ActivePageIndex > 0 then
      begin
         if PageControl1.CanFocus then PageControl1.SetFocus;
         PageControl1.ActivePage := PageControl1.FindNextPage(PageControl1.ActivePage, True, True);
      end;
   end;
end;

procedure TPadrao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   DtSrc.DataSet.Close;
   action := caFree;
   Padrao := nil;
end;

procedure TPadrao.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
   if (DtSrc.State = dsInsert) or (DtSrc.State = dsEdit) then
   begin
      MessageDlg('Registro não salvo, finalize a operação para continuar!',mtInformation,[mbOk],0);
      CanClose := false;
   end;
end;

procedure TPadrao.FormCreate(Sender: TObject);
begin
   {$IF DEFINED(MK) or DEFINED(MFROTA)}
      //Aqui faz o panel que fica transparente
      AlphaPanel := TTransparentPanel.Create(pgCad);
      AlphaPanel.Parent := pgCad;
      AlphaPanel.BlendColor := RGB(1,1,1); //Não pode ser clBlack nem RGB(0,0,0), pois não funciona em WIN 10.
      AlphaPanel.BlendAlpha := 180;
      AlphaPanel.SetBounds(0,0,AlphaPanel.Parent.Width,AlphaPanel.Parent.Height);
      AlphaPanel.Visible := False;
      AlphaPanel.Caption := '';
      //Label
      with TLabel.Create(AlphaPanel) do
      begin
         Name := 'AlphaLabel';
         Parent := AlphaPanel;
         Align := alClient;
         Alignment := taCenter;
         Layout := tlCenter;
         WordWrap := True;
         AlignWithMargins := True;
         Margins.Left := 5;
         Margins.Right := 5;
         Margins.Top := 5;
         Margins.Bottom := 5;

         Caption := 'Clique em "Novo" ou pressione "Alt+N"'+#13+#10+
                    'para inserir um registro,'+#13+#10+
                    'ou selecione um registro existente.';
         Font.Name := 'Tahoma';
         Font.Style := [fsBold];
         Font.Size := 18;
         Font.Color := clWhite;
      end;
   {$ENDIF}
end;

procedure TPadrao.FormDestroy(Sender: TObject);
begin
   if Assigned(AlphaPanel) then
      AlphaPanel.Free;
end;

procedure TPadrao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 //  Showmessage(Format('O código da tecla pressionada é: %d', [Key]));

{   if (key = VK_CONTROL) and (Key = VK_TAB) then
   begin
      PageControl1.ActivePageIndex := PageControl1.ActivePageIndex+1;
   end;  }
end;

procedure TPadrao.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if (Key = #39) then
      key:=#0;
end;

procedure TPadrao.DtSrcDataChange(Sender: TObject; Field: TField);
begin
   if Assigned(AlphaPanel) then
   begin
      AlphaPanel.Visible := ((not DtSrc.DataSet.Active) OR ((DtSrc.DataSet.RecordCount = 0) AND (DtSrc.State = dsBrowse)));
      AlphaPanel.Parent.Enabled := not AlphaPanel.Visible;
   end;
end;

procedure TPadrao.DtSrcStateChange(Sender: TObject);
const
   Estados: array [TDataSetState] of string = ('Fechado','Consultando','Alterando','Inserindo','','','','','','','','','');
begin
   BotaoNovo.Enabled    := DtSrc.State in [dsBrowse,dsInactive];
   BotaoGrava.Enabled   := DtSrc.State in [dsInsert,dsEdit];
   BotaoCancela.Enabled := DtSrc.State in [dsInsert,dsEdit];
   BotaoExclui.Enabled  := DtSrc.State in [dsBrowse];
   if DtSrc.DataSet.IsEmpty then
      BotaoExclui.Enabled := false;
   StsBr.Panels[0].Text := Estados[DtSrc.State];

   if not TestaModulo(Tag,oUsuario,'I',false) then
      BotaoNovo.Enabled := false;
   if not TestaModulo(Tag,oUsuario,'E',false) then
      BotaoExclui.Enabled := false;

   StsBr.Refresh;
end;

procedure TPadrao.FormShow(Sender: TObject);
begin
   PagePrincipal.ActivePageIndex := 0;
   Pagecontrol1.ActivePageIndex  := 0;
   DtSrcStateChange(Self);

   if not TestaModulo(Tag,oUsuario,'A',false) then
      DtSrc.AutoEdit := false;
end;

procedure TPadrao.PageControl1Changing(Sender: TObject;
  var AllowChange: Boolean);
begin
   if (DtSrc.State in [dsInsert,dsEdit]) then
      AllowChange := false;
end;

procedure TPadrao.PagePrincipalChange(Sender: TObject);
begin
   StsBr.Refresh;
   if Assigned(AlphaPanel) then
   begin
      if (PagePrincipal.ActivePage = pgCad) AND (AlphaPanel.Visible) then
         AlphaPanel.SetBounds(0,0,AlphaPanel.Parent.Width,AlphaPanel.Parent.Height);
   end;
end;

procedure TPadrao.ConfiguraConsAvancada(vConsAvancada : String; vCmpAvancadoItem : String;
                                vCmpAvancadoValue : String; vCondicaoItem : String; vCondicaoIndex : Integer; lsbSelect: TListBox;
                                cdsConsulta: TClientDataSet; lsbAuxiliar : TListBox);
var
   vLinha,vVlr : string;
   vDataType: TFieldType;
   vCampos: TStringList;
   i: Integer;
begin
   if vCondicaoIndex < 0 then
   begin
      Application.MessageBox('Você deve informar uma condição!','Atenção',MB_OK+MB_ICONWARNING);
      Exit;
   end;
   // listbox do usuario
   vLinha := Trim(vCmpAvancadoItem);
   vLinha := vLinha+' '+Trim(vCondicaoItem);
   vLinha := vLinha+' '+Trim(vConsAvancada);
   // listbox nosso

   // VALOR
   vDataType := ftString;
   if not cdsConsulta.Active then cdsConsulta.Open;
   if Pos('/', vCmpAvancadoValue) > 0 then
   begin
      if (vCondicaoIndex=6) or (vCondicaoIndex=7) then
         vVlr := Trim(vConsAvancada)
      else
         vVlr := 'UPPER('''+Trim(vConsAvancada)+''')';
   end
   else
   begin
      vDataType := cdsConsulta.FieldDefs.Find(vCmpAvancadoValue).DataType;
      case vDataType of
         ftString :
         begin
            if (vCondicaoIndex=6) or (vCondicaoIndex=7) then
               vVlr := Trim(vConsAvancada)
            else
               vVlr := 'UPPER('''+Trim(vConsAvancada)+''')';
         end;
         ftInteger:
         begin
            if not TestNumero(vConsAvancada) then
            begin
               MessageDlg('Você deve informar um número',mtWarning,[mbOK],0);
               Exit;
            end;
            vVlr := Trim(vConsAvancada);
         end;
         ftBCD:
         begin
            if not TestFloat(vConsAvancada) then
            begin
               MessageDlg('Você deve informar um valor',mtWarning,[mbOK],0);
               Exit;
            end;
            vVlr := (StringReplace(Trim(vConsAvancada),'.','',[]));
            //vVlr := FormatFloat('0.00',StrToFloat(vVlr));
            vVlr := StringReplace(vVlr,',','.',[]);
         end;
         ftFMTBCD:
         begin
            if not TestFloat(vConsAvancada) then
            begin
               MessageDlg('Você deve informar um valor',mtWarning,[mbOK],0);
               Exit;
            end;
            vVlr := (StringReplace(Trim(vConsAvancada),'.','',[]));
            //vVlr := FormatFloat('0.00',StrToFloat(vVlr));
            vVlr := StringReplace(vVlr,',','.',[]);
         end;
         ftFloat:
         begin
            if not TestFloat(vConsAvancada) then
            begin
               MessageDlg('Você deve informar um valor',mtWarning,[mbOK],0);
               Exit;
            end;
            vVlr := (StringReplace(Trim(vConsAvancada),'.','',[]));
            //vVlr := FormatFloat('0.00',StrToFloat(vVlr));
            vVlr := StringReplace(vVlr,',','.',[]);
         end;
         ftDate   :
         begin
            if not Testa_DATA(vConsAvancada) then
            begin
               MessageDlg('Você deve informar uma data',mtWarning,[mbOK],0);
               Exit;
            end;
            vVlr := ''''+FormatDateTime('mm/dd/yyyy',StrToDate(Trim(vConsAvancada)))+'''';
         end;
         ftBlob   :
         begin
            if (vCondicaoIndex=6) or (vCondicaoIndex=7) then
               vVlr := Trim(vConsAvancada)
            else
               vVlr := 'UPPER('''+Trim(vConsAvancada)+''')';
         end;
      end;
   end;
   lsbSelect.Items.add(vLinha);
   // CAMPO

   vCampos := Split(vCmpAvancadoValue, '/');
   for i := 0 to vCampos.Count - 1 do
   begin
      if vDataType = ftString then
         vLinha := 'UPPER('+Trim(vCampos[i])+')'
      else
         vLinha := Trim(vCampos[i]);
      // OPERAÇÕES
      if      vCondicaoIndex = 0 then
         vLinha := vLinha+' = '+vVlr
      else if vCondicaoIndex = 1 then
         vLinha := vLinha+' <> '+vVlr
      else if vCondicaoIndex = 2 then
         vLinha := vLinha+' > '+vVlr
      else if vCondicaoIndex = 3 then
         vLinha := vLinha+' < '+vVlr
      else if vCondicaoIndex = 4 then
         vLinha := vLinha+' >= '+vVlr
      else if vCondicaoIndex = 5 then
         vLinha := vLinha+' <= '+vVlr
      else
      begin
         if vCondicaoIndex = 6 then
            vLinha := vLinha+' LIKE Upper('''+vVlr+'%'')'
         else
            vLinha := vLinha+' LIKE Upper(''%'+vVlr+'%'')';
      end;
      vCampos[i] := vLinha;
   end;
   if vCampos.Count > 1 then
   begin
      vLinha := '(';
      for i := 0 to vCampos.Count - 1 do
      begin
         if i = 0 then
            vLinha := vLinha + vCampos[i]
         else
            vLinha := vLinha + ' or ' + vCampos[i];
      end;
      vLinha := vLinha + ')';
      lsbAuxiliar.Items.add(vLinha);
   end
   else if vCampos.Count > 0 then
      lsbAuxiliar.Items.add(vCampos[0]);
   vCampos.Free;
end;

end.
