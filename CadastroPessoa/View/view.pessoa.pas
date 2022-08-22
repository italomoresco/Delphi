unit view.pessoa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, view.padrao, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask,
  Vcl.DBCtrls, Controller.Interfaces, Controller.Controle;

type
  TfrmPessoa = class(TfrmPadrao)
    pcData: TPageControl;
    tsGeneral: TTabSheet;
    lblCode: TLabel;
    lblName: TLabel;
    lblCPF: TLabel;
    edtOrderNumber: TDBEdit;
    edtName: TDBEdit;
    edtDate: TDBEdit;
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
    procedure btnCancelClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure pcMainChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtDadNameExit(Sender: TObject);
    procedure edtStateExit(Sender: TObject);
    procedure dsSearchDataChange(Sender: TObject; Field: TField);
    procedure dsAddressDataChange(Sender: TObject; Field: TField);
    procedure btnSearchClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
  private
    { Private declarations }
    FControle: iControle;
    FIdPessoa: Integer;
    procedure ListarTodos;
    procedure ListarEnderecos;
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

   FIdPessoa := dsSearch.DataSet.FieldByName('ID_PESSOA').AsInteger;

   if pcData.ActivePageIndex = 0 then
   begin
      if Application.MessageBox('Deseja excluir este cadastro Pessoa?', 'EXCLUS�O',
                                MB_YESNO + MB_DEFBUTTON2) = IDYES then
         FControle
           .Entidades
           .Pessoa
             .This
               .Id(dsSearch.DataSet.FieldByName('ID_PESSOA').AsInteger)
             .&End
           .Excluir;
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
   end;
   ListarTodos;

   pcMain.ActivePageIndex := 0;
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

procedure TfrmPessoa.btnSaveClick(Sender: TObject);

   procedure AtualizaPedido;
   begin
      FControle
        .Entidades
        .Pessoa
          .This
            .Id(dsSearch.DataSet.FieldByName('ID').AsInteger)
            .Nome(dsSearch.DataSet.FieldByName('NOME').AsString)
            .CPF(dsSearch.DataSet.FieldByName('CPF').AsInteger)
            .RG(dsSearch.DataSet.FieldByName('RG').AsInteger)
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
               .CPF(dsSearch.DataSet.FieldByName('CPF').AsInteger)
               .RG(dsSearch.DataSet.FieldByName('RG').AsInteger)
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
               .CEP(dsAddress.DataSet.FieldByName('CEP').AsInteger)
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
               .CEP(dsAddress.DataSet.FieldByName('CEP').AsInteger)
               .Endereco(dsAddress.DataSet.FieldByName('ENDERECO').AsString)
               .Num(dsAddress.DataSet.FieldByName('NUM').AsString)
               .Cidade(dsAddress.DataSet.FieldByName('CIDADE').AsString)
               .Estado(dsAddress.DataSet.FieldByName('ESTADO').AsString)
             .&End
           .Atualizar;
      end;
      ListarTodos;
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

procedure TfrmPessoa.edtDadNameExit(Sender: TObject);
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

procedure TfrmPessoa.FormCreate(Sender: TObject);
begin
  inherited;

//   FControle := TControle.New;
//   ListarTodos;
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

   if FIdPessoa > 0 then
      dsSearch.DataSet.Locate('ID', VarArrayOf([FIdPessoa]), []);
end;

procedure TfrmPessoa.pcMainChange(Sender: TObject);
begin
  inherited;

   pcData.ActivePageIndex := 0;
end;

end.
