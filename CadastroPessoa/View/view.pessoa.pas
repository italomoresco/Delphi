unit view.pessoa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, view.padrao, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask,
  Vcl.DBCtrls, Controller.Interfaces, Controller.Controle, Xml.xmldom,
  Xml.XMLIntf, Xml.Win.msxmldom, Xml.XMLDoc, IdBaseComponent, IdComponent,
  IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL,
  Data.Win.ADODB, frxClass, frxADOComponents, frxPDFViewer, frxGradient, frxMap,
  frxDesgn, fs_iibxrtti, fs_idbctrlsrtti, fs_iadortti, frxExportBaseDialog,
  frxExportPDF;

type
  TfrmPessoa = class(TfrmPadrao)
    pcData: TPageControl;
    tsGeneral: TTabSheet;
    lblCode: TLabel;
    lblName: TLabel;
    lblCPF: TLabel;
    edtID: TDBEdit;
    edtName: TDBEdit;
    edtCPF: TDBEdit;
    tsAddress: TTabSheet;
    dbgProduct: TDBGrid;
    pnlProduct: TPanel;
    lblZipCode: TLabel;
    lblAddress: TLabel;
    lblNumber: TLabel;
    edtZipCode: TDBEdit;
    edtAddress: TDBEdit;
    edtNumber: TDBEdit;
    lblRG: TLabel;
    edtRG: TDBEdit;
    edtMotherName: TDBEdit;
    lblNameMother: TLabel;
    edtDadName: TDBEdit;
    lblNameDad: TLabel;
    dsAddress: TDataSource;
    edtCity: TDBEdit;
    lblCity: TLabel;
    lblState: TLabel;
    edtState: TDBEdit;
    SSLIO: TIdSSLIOHandlerSocketOpenSSL;
    XMLDoc: TXMLDocument;
    btnReport: TButton;
    frxReport1: TfrxReport;
    frxPDFExport1: TfrxPDFExport;
    frxADOComponents1: TfrxADOComponents;
    procedure btnCancelClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure pcMainChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtStateExit(Sender: TObject);
    procedure dsSearchDataChange(Sender: TObject; Field: TField);
    procedure dsAddressDataChange(Sender: TObject; Field: TField);
    procedure btnSearchClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure edtCPFExit(Sender: TObject);
    procedure edtZipCodeExit(Sender: TObject);
    procedure btnReportClick(Sender: TObject);
  private
    { Private declarations }
    FControle: iControle;
    FIdPessoa: Integer;
    procedure ListarTodos;
    procedure ListarEnderecos;
    procedure VerificaCEP;
  public
    { Public declarations }
  end;

var
  frmPessoa: TfrmPessoa;

implementation

{$R *.dfm}

{ TfrmPessoa }

procedure TfrmPessoa.btnCancelClick(Sender: TObject);
begin
  inherited;

   dsSearch.DataSet.Cancel;
   dsAddress.DataSet.Cancel;
end;

procedure TfrmPessoa.btnDeleteClick(Sender: TObject);
begin
  inherited;

   if pcData.ActivePageIndex = 0 then
   begin
      if Application.MessageBox('Deseja excluir este cadastro Pessoa?', 'EXCLUS�O',
                                MB_YESNO + MB_DEFBUTTON2) = IDYES then
         FControle
           .Entidades
           .Pessoa
             .This
               .Id(dsSearch.DataSet.FieldByName('ID').AsInteger)
             .&End
           .Excluir;

      ListarTodos;
      pcMain.ActivePageIndex := 0;
   end
   else
   begin
      if Application.MessageBox('Deseja excluir este Endere�o?', 'EXCLUS�O',
                                MB_YESNO + MB_DEFBUTTON2) = IDYES then
         FControle
           .Entidades
           .Endereco
             .This
               .Id(dsAddress.DataSet.FieldByName('ID').AsInteger)
             .&End
           .Excluir;

      ListarEnderecos;
   end;
end;

procedure TfrmPessoa.btnNewClick(Sender: TObject);
begin
  inherited;

   if (pcMain.ActivePageIndex = 1) and
      (pcData.ActivePageIndex = 1) then
   begin
      dsAddress.DataSet.Insert;
      edtZipCode.SetFocus;
   end
   else
   begin
      if pcMain.ActivePageIndex = 0 then
         pcMain.ActivePageIndex := 1;
      dsSearch.DataSet.Insert;
      edtName.SetFocus;
   end;
end;

procedure TfrmPessoa.btnReportClick(Sender: TObject);
begin
   //frxReport1.LoadFromFile('relPessoaEnderecos.fr3');
   frxReport1.ShowReport();
end;

procedure TfrmPessoa.btnSaveClick(Sender: TObject);

   procedure AtualizaPedido;
   begin
      FControle
        .Entidades
        .Pessoa
          .This
            .Id(dsSearch.DataSet.FieldByName('ID').AsInteger)
            .Nome(dsSearch.DataSet.FieldByName('NOME').AsString)
            .CPF(dsSearch.DataSet.FieldByName('CPF').AsString)
            .RG(dsSearch.DataSet.FieldByName('RG').AsString)
            .NomeMae(dsSearch.DataSet.FieldByName('NOME_MAE').AsString)
            .NomePai(dsSearch.DataSet.FieldByName('NOME_PAI').AsString)
          .&End
        .Atualizar;
   end;

begin
  inherited;

   if pcData.ActivePageIndex = 0 then
   begin
      if dsSearch.State = dsInsert then
      begin
         FControle
           .Entidades
           .Pessoa
             .This
               .Nome(dsSearch.DataSet.FieldByName('NOME').AsString)
               .CPF(dsSearch.DataSet.FieldByName('CPF').AsString)
               .RG(dsSearch.DataSet.FieldByName('RG').AsString)
               .NomeMae(dsSearch.DataSet.FieldByName('NOME_MAE').AsString)
               .NomePai(dsSearch.DataSet.FieldByName('NOME_PAI').AsString)
             .&End
           .Inserir;
         ListarTodos;
         dsSearch.DataSet.Last;
         ListarEnderecos;
      end
      else
      begin
         FIdPessoa := dsSearch.DataSet.FieldByName('ID').AsInteger;
         AtualizaPedido;
         ListarTodos;
         ListarEnderecos;
      end;
   end
   else
   begin
      FIdPessoa := dsSearch.DataSet.FieldByName('ID').AsInteger;
      if dsAddress.State = dsInsert then
      begin
         FControle
           .Entidades
           .Endereco
             .This
               .IdPessoa(dsSearch.DataSet.FieldByName('ID').AsInteger)
               .CEP(dsAddress.DataSet.FieldByName('CEP').AsString)
               .Endereco(dsAddress.DataSet.FieldByName('ENDERECO').AsString)
               .Num(dsAddress.DataSet.FieldByName('NUM').AsString)
               .Cidade(dsAddress.DataSet.FieldByName('CIDADE').AsString)
               .Estado(dsAddress.DataSet.FieldByName('ESTADO').AsString)
             .&End
           .Inserir;
      end
      else
      begin
         FControle
           .Entidades
           .Endereco
             .This
               .Id(dsAddress.DataSet.FieldByName('ID').AsInteger)
               .CEP(dsAddress.DataSet.FieldByName('CEP').AsString)
               .Endereco(dsAddress.DataSet.FieldByName('ENDERECO').AsString)
               .Num(dsAddress.DataSet.FieldByName('NUM').AsString)
               .Cidade(dsAddress.DataSet.FieldByName('CIDADE').AsString)
               .Estado(dsAddress.DataSet.FieldByName('ESTADO').AsString)
             .&End
           .Atualizar;
      end;
      ListarEnderecos;
   end;
end;

procedure TfrmPessoa.btnSearchClick(Sender: TObject);
begin
  inherited;

   ListarTodos;
end;

procedure TfrmPessoa.dsAddressDataChange(Sender: TObject; Field: TField);
begin
  inherited;

   if pcData.ActivePageIndex = 1 then
   begin
      btnSave.Enabled   := dsAddress.State in dsEditModes;
      btnCancel.Enabled := dsAddress.State in dsEditModes;
      btnNew.Enabled    := dsAddress.State = dsBrowse;
      btnDelete.Enabled := (dsAddress.State = dsBrowse) and (not dsAddress.DataSet.IsEmpty);
   end;
end;

procedure TfrmPessoa.dsSearchDataChange(Sender: TObject; Field: TField);
begin
  inherited;

   ListarEnderecos;
end;

procedure TfrmPessoa.edtCPFExit(Sender: TObject);
begin
  inherited;

   if dsSearch.DataSet.State in dsEditModes then
      btnSave.SetFocus;
end;

procedure TfrmPessoa.edtStateExit(Sender: TObject);
begin
  inherited;

   if dsAddress.DataSet.State in dsEditModes then
      btnSave.SetFocus;
end;

procedure TfrmPessoa.edtZipCodeExit(Sender: TObject);
begin
  inherited;

   if ActiveControl <> btnCancel then
      VerificaCEP;
end;

procedure TfrmPessoa.FormCreate(Sender: TObject);
begin
  inherited;

   FControle := TControle.New;
   ListarTodos;
end;

procedure TfrmPessoa.ListarEnderecos;
begin
   FControle
     .Entidades
     .Endereco
       .This
         .IdPessoa(dsSearch.DataSet.FieldByName('ID').AsInteger)
       .&End
     .Listar
     .DataSet(dsAddress);
end;

procedure TfrmPessoa.ListarTodos;
begin
   FControle
     .Entidades
     .Pessoa
     .Listar
     .DataSet(dsSearch);
end;

procedure TfrmPessoa.pcMainChange(Sender: TObject);
begin
  inherited;

   pcData.ActivePageIndex := 0;
end;

procedure TfrmPessoa.VerificaCEP;
var
  tempXML, tempNodePAI, tempNodeFilho: IXMLNode;
  I: Integer;
begin
   XMLDoc.FileName := 'https://viacep.com.br/ws/'+Trim(dsAddress.DataSet.FieldByName('CEP').AsString)+ '/xml/';
   XMLDoc.Active := true;
   tempXML := XMLDoc.DocumentElement;

   tempNodePAI := tempXML.ChildNodes.FindNode('logradouro');
   if tempNodePAI = nil then
   begin
      ShowMessage('CEP Inv�lido!');
      edtZipCode.SetFocus;
      Exit;
   end;

   for i := 0 to tempNodePAI.ChildNodes.Count - 1 do
   begin
      tempNodeFilho := tempNodePAI.ChildNodes[i];
      dsAddress.DataSet.FieldByName('ENDERECO').AsString := tempNodeFilho.Text;
   end;

   tempNodePAI := tempXML.ChildNodes.FindNode('bairro');
   for i := 0 to tempNodePAI.ChildNodes.Count - 1 do
   begin
      tempNodeFilho := tempNodePAI.ChildNodes[i];
      dsAddress.DataSet.FieldByName('ENDERECO').AsString := dsAddress.DataSet.FieldByName('ENDERECO').AsString + ' | ' +
                                                            tempNodeFilho.Text;
   end;

   tempNodePAI := tempXML.ChildNodes.FindNode('localidade');
   for i := 0 to tempNodePAI.ChildNodes.Count - 1 do
   begin
      tempNodeFilho := tempNodePAI.ChildNodes[i];
      dsAddress.DataSet.FieldByName('CIDADE').AsString := tempNodeFilho.Text;
   end;

   tempNodePAI := tempXML.ChildNodes.FindNode('uf');
   for i := 0 to tempNodePAI.ChildNodes.Count - 1 do
   begin
      tempNodeFilho := tempNodePAI.ChildNodes[i];
      dsAddress.DataSet.FieldByName('ESTADO').AsString := tempNodeFilho.Text;
   end;
end;

end.
