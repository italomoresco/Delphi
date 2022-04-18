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
    procedure btnEditClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  private
    { Private declarations }
    FControle: iControle;
  public
    { Public declarations }
  end;

var
  frmVendas: TfrmVendas;

implementation

{$R *.dfm}

procedure TfrmVendas.btnEditClick(Sender: TObject);
begin
  inherited;
   FControle.Entidades.PedidosItens.ListarPorId(dsSearch.DataSet.FieldByName('ID').AsInteger).DataSet(dsItens);
end;

procedure TfrmVendas.btnExcluirClick(Sender: TObject);
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
            .Item(dsItens.DataSet.FieldByName('ITEM').AsInteger)
            .IdPedido(dsSearch.DataSet.FieldByName('ID').AsInteger)
          .&End
        .Excluir;
   end;
end;

procedure TfrmVendas.btnSaveClick(Sender: TObject);
begin
  inherited;
   if pcVenda.ActivePageIndex = 0 then
   begin
      if dsSearch.DataSet.FieldByName('ID').AsString.IsEmpty then
      begin
         FControle
           .Entidades
           .Pedidos
             .This
               .Descricao(dsSearch.DataSet.FieldByName('DESCRICAO').AsString)
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
               .Descricao(dsSearch.DataSet.FieldByName('DESCRICAO').AsString)
             .&End
           .Atualizar;
      end;
   end
   else
   begin
      FControle
        .Entidades
        .PedidosItens
          .This
            .Item(dsItens.DataSet.FieldByName('ITEM').AsInteger)
            .IdPedido(dsSearch.DataSet.FieldByName('ID').AsInteger)
            .Produto('amendoim')
            .Quantidade(dsItens.DataSet.FieldByName('QUANTIDADE').AsInteger)
          .&End
        .Inserir;   
   end;
end;

procedure TfrmVendas.btnSearchClick(Sender: TObject);
begin
  inherited;
   FControle.Entidades.Pedidos.Listar.DataSet(dsSearch);
end;

procedure TfrmVendas.FormCreate(Sender: TObject);
begin
  inherited;
   FControle := TControle.New;
end;

end.
