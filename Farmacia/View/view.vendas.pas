unit view.vendas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, view.padrao, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls, Controller.Interfaces, Controller.Controle;

type
  TfrmVendas = class(TfrmPadrao)
    pcVenda: TPageControl;
    pcSale: TTabSheet;
    TabSheet4: TTabSheet;
    pnlProduct: TPanel;
    lblProduct: TLabel;
    dbgProduct: TDBGrid;
    lblQuantity: TLabel;
    lblPrice: TLabel;
    lblCode: TLabel;
    lblCustomer: TLabel;
    dsItens: TDataSource;
    edtCode: TDBEdit;
    edtCustomer: TDBEdit;
    edtProduct: TDBEdit;
    edtQuantity: TDBEdit;
    edtPrice: TDBEdit;
    procedure btnSearchClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
  private
    { Private declarations }
    FControle: iControle;
    procedure ListarTodos;
  public
    { Public declarations }
  end;

var
  frmVendas: TfrmVendas;

implementation

{$R *.dfm}

procedure TfrmVendas.btnDeleteClick(Sender: TObject);
begin
  inherited;
   if pcVenda.ActivePageIndex = 0 then
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
end;

procedure TfrmVendas.btnSaveClick(Sender: TObject);
begin
  inherited;
   if pcVenda.ActivePageIndex = 0 then
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
      end
      else
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
               .Produto(dsItens.DataSet.FieldByName('PRODUTO').AsInteger)
               .IdPedido(dsSearch.DataSet.FieldByName('ID').AsInteger)
               .Quantidade(dsItens.DataSet.FieldByName('QUANTIDADE').AsInteger)
               .Valor(dsItens.DataSet.FieldByName('VALOR').AsFloat)
               .ValorTotal(dsItens.DataSet.FieldByName('VALOR').AsFloat*dsItens.DataSet.FieldByName('QUANTIDADE').AsInteger)
             .&End
           .Atualizar;
      end;
   end;
end;

procedure TfrmVendas.btnSearchClick(Sender: TObject);
begin
  inherited;
   ListarTodos;
end;

procedure TfrmVendas.FormCreate(Sender: TObject);
begin
  inherited;
   FControle := TControle.New;
   ListarTodos;
end;

procedure TfrmVendas.ListarTodos;
begin
   //Pedidos
   FControle
     .Entidades
     .Pedidos
       .This
         .Tipo('V')
       .&End
     .Listar
     .DataSet(dsSearch);
   //Itens
   FControle
     .Entidades
     .PedidosItens
       .This
         .IdPedido(dsSearch.DataSet.FieldByName('ID_PEDIDO').AsInteger)
       .&End
     .Listar
     .DataSet(dsItens);
end;

end.
