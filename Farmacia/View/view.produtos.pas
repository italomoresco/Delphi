unit view.produtos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, view.padrao, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.ExtCtrls, Controller.Interfaces, Controller.Controle,
  Vcl.Mask, Vcl.DBCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmProdutos = class(TfrmPadrao)
    edtID: TDBEdit;
    edtName: TDBEdit;
    edtPrice: TDBEdit;
    lbID: TLabel;
    lblName: TLabel;
    lblPrice: TLabel;
    DBText1: TDBText;
    procedure btnSearchClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
  private
    { Private declarations }
    FControle: iControle;
    procedure ListarTodos;
  public
    { Public declarations }
  end;

var
  frmProdutos: TfrmProdutos;

implementation

{$R *.dfm}

procedure TfrmProdutos.btnCancelClick(Sender: TObject);
begin
  inherited;
   dsSearch.DataSet.Cancel;
end;

procedure TfrmProdutos.btnEditClick(Sender: TObject);
begin
  inherited;
   dsSearch.DataSet.Edit;
end;

procedure TfrmProdutos.btnExcluirClick(Sender: TObject);
begin
  inherited;
   FControle
     .Entidades
     .Produto
       .This
         .Id(dsSearch.DataSet.FieldByName('ID').AsInteger)
       .&End
     .Excluir;
end;

procedure TfrmProdutos.btnNewClick(Sender: TObject);
begin
  inherited;
   ListarTodos;
   dsSearch.DataSet.Insert;
   if pcMain.ActivePageIndex = 0 then
      pcMain.ActivePageIndex := 1;
end;

procedure TfrmProdutos.btnSaveClick(Sender: TObject);
begin
  inherited;
   if dsSearch.DataSet.State = dsInsert then
   begin
      FControle
        .Entidades
        .Produto
          .This
            .Descricao(dsSearch.DataSet.FieldByName('DESCRICAO').AsString)
            .Valor(dsSearch.DataSet.FieldByName('VALOR').AsFloat)
          .&End
        .Inserir;
   end
   else
   begin
      FControle
        .Entidades
        .Produto
          .This
            .Id(dsSearch.DataSet.FieldByName('ID').AsInteger)
            .Descricao(dsSearch.DataSet.FieldByName('DESCRICAO').AsString)
            .Valor(dsSearch.DataSet.FieldByName('VALOR').AsFloat)
          .&End
        .Atualizar;
   end;
end;

procedure TfrmProdutos.btnSearchClick(Sender: TObject);
begin
  inherited;
   ListarTodos;
end;

procedure TfrmProdutos.FormCreate(Sender: TObject);
begin
  inherited;
   FControle := TControle.New;
end;

procedure TfrmProdutos.ListarTodos;
begin
   FControle.Entidades.Produto.Listar.DataSet(dsSearch);
end;

end.
