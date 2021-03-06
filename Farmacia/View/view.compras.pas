unit view.compras;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, view.padrao, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls, Controller.Interfaces, Controller.Controle,
  Vcl.Mask, Vcl.DBCtrls, Vcl.Buttons;

type
  TfrmCompras = class(TfrmPadrao)
    pcCompra: TPageControl;
    pcPurchase: TTabSheet;
    lblCode: TLabel;
    lblCustomer: TLabel;
    edtCode: TDBEdit;
    edtProvider: TDBEdit;
    TabSheet4: TTabSheet;
    pnlProduct: TPanel;
    lblProduct: TLabel;
    lblQuantity: TLabel;
    lblPrice: TLabel;
    edtProduct: TDBEdit;
    edtQuantity: TDBEdit;
    edtPrice: TDBEdit;
    dsItens: TDataSource;
    edtDate: TDBEdit;
    lblDate: TLabel;
    dbgProduct: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure dsSearchDataChange(Sender: TObject; Field: TField);
    procedure dsItensDataChange(Sender: TObject; Field: TField);
    procedure edtPriceExit(Sender: TObject);
  private
    { Private declarations }
    FControle: iControle;
    procedure ListarTodos;
    procedure ListarItens;
  public
    { Public declarations }
  end;

var
  frmCompras: TfrmCompras;

implementation

{$R *.dfm}

procedure TfrmCompras.btnCancelClick(Sender: TObject);
begin
  inherited;
   dsSearch.DataSet.Cancel;
   dsItens.DataSet.Cancel;
end;

procedure TfrmCompras.btnDeleteClick(Sender: TObject);
begin
  inherited;
   if pcCompra.ActivePageIndex = 0 then
   begin
      FControle
        .Entidades
        .Pedidos
          .This
            .Id(dsSearch.DataSet.FieldByName('ID').AsInteger)
          .&End
        .Excluir;
   end
   else
   begin
      FControle
        .Entidades
        .PedidosItens
          .This
            .Id(dsItens.DataSet.FieldByName('ID').AsInteger)
          .&End
        .Excluir;
   end;
   ListarTodos;
end;

procedure TfrmCompras.btnNewClick(Sender: TObject);
begin
  inherited;
   if (pcMain.ActivePageIndex = 1) and
      (pcCompra.ActivePageIndex = 1) then
   begin
      //ListarItens;
      dsItens.DataSet.Insert;
      edtProduct.SetFocus;
   end
   else
   begin
      if pcMain.ActivePageIndex = 0 then
         pcMain.ActivePageIndex := 1;
      dsSearch.DataSet.Insert;
      dsSearch.DataSet.FieldByName('DATA').AsDateTime := Now;
      edtProvider.SetFocus;
   end;
end;

procedure TfrmCompras.btnSaveClick(Sender: TObject);

   procedure AtualizaPedido;
   begin
      FControle
        .Entidades
        .Pedidos
          .This
            .Id(dsSearch.DataSet.FieldByName('ID').AsInteger)
            .Pessoa(dsSearch.DataSet.FieldByName('PESSOA').AsInteger)
            .Data(dsSearch.DataSet.FieldByName('DATA').AsDateTime)
          .&End
        .Atualizar;
   end;
var
   vPedido: Integer;
begin
  inherited;
   if dsSearch.DataSet.FieldByName('PESSOA').AsString.Trim.IsEmpty then
   begin
      MessageDlg('Informe o Fornecedor!', mtWarning, [mbOK], 0);
      edtProvider.SetFocus;
      Exit;
   end;

   if pcCompra.ActivePageIndex = 0 then
   begin
      if dsSearch.State = dsInsert then
      begin
         FControle
           .Entidades
           .Pedidos
             .This
               .Tipo('C')
               .Pessoa(dsSearch.DataSet.FieldByName('PESSOA').AsInteger)
               .Data(dsSearch.DataSet.FieldByName('DATA').AsDateTime)
             .&End
           .Inserir;
         ListarTodos;
         dsSearch.DataSet.Last;
         ListarItens;
      end
      else
      begin
         vPedido := dsSearch.DataSet.FieldByName('ID').AsInteger;
         AtualizaPedido;
         ListarTodos;
         dsSearch.DataSet.Locate('ID', VarArrayOf([vPedido]), []);
         ListarItens;
      end;
   end
   else
   begin
      if dsItens.State = dsInsert then
      begin
         FControle
           .Entidades
           .PedidosItens
             .This
               .Produto(dsItens.DataSet.FieldByName('PRODUTO').AsInteger)
               .IdPedido(dsSearch.DataSet.FieldByName('ID').AsInteger)
               .Quantidade(dsItens.DataSet.FieldByName('QUANTIDADE').AsInteger)
               .Valor(dsItens.DataSet.FieldByName('VALOR').AsFloat)
               .ValorTotal(dsItens.DataSet.FieldByName('VALOR').AsFloat*dsItens.DataSet.FieldByName('QUANTIDADE').AsInteger)
             .&End
           .Inserir;
      end
      else
      begin
         FControle
           .Entidades
           .PedidosItens
             .This
               .Id(dsItens.DataSet.FieldByName('ID').AsInteger)
               .Produto(dsItens.DataSet.FieldByName('PRODUTO').AsInteger)
               .Quantidade(dsItens.DataSet.FieldByName('QUANTIDADE').AsInteger)
               .Valor(dsItens.DataSet.FieldByName('VALOR').AsFloat)
               .ValorTotal(dsItens.DataSet.FieldByName('VALOR').AsFloat*dsItens.DataSet.FieldByName('QUANTIDADE').AsInteger)
             .&End
           .Atualizar;
      end;
      ListarTodos;
      dsSearch.DataSet.Locate('ID', VarArrayOf([vPedido]), []);
      ListarItens;
   end;
end;

procedure TfrmCompras.btnSearchClick(Sender: TObject);
begin
  inherited;
   ListarTodos;
end;

procedure TfrmCompras.dsItensDataChange(Sender: TObject; Field: TField);
begin
   if pcCompra.ActivePageIndex = 1 then
   begin
      btnSave.Enabled    := (dsItens.State in [dsEdit, dsInsert]) or (dsSearch.State in [dsEdit, dsInsert]);
      btnCancel.Enabled  := (dsItens.State in [dsEdit, dsInsert]) or (dsSearch.State in [dsEdit, dsInsert]);
      btnNew.Enabled     := (dsItens.State = dsBrowse) or (dsSearch.State = dsBrowse);
      btnDelete.Enabled  := (dsItens.State = dsBrowse) or (dsSearch.State = dsBrowse);
   end;
end;

procedure TfrmCompras.dsSearchDataChange(Sender: TObject; Field: TField);
begin
  inherited;
   ListarItens;
end;

procedure TfrmCompras.edtPriceExit(Sender: TObject);
begin
  inherited;
   btnSave.SetFocus;
end;

procedure TfrmCompras.FormCreate(Sender: TObject);
begin
  inherited;
   FControle := TControle.New;
   ListarTodos;
end;

procedure TfrmCompras.ListarTodos;
begin
   FControle
     .Entidades
     .Pedidos
       .This
         .Tipo('C')
       .&End
     .Listar
     .DataSet(dsSearch);
end;

procedure TfrmCompras.ListarItens;
begin
   FControle
     .Entidades
     .PedidosItens
       .This
         .IdPedido(dsSearch.DataSet.FieldByName('ID').AsInteger)
       .&End
     .Listar
     .DataSet(dsItens);
end;

end.
