unit view.produtos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, view.padrao, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls, Controller.Interfaces,
  Controller.Controle, Vcl.Mask, Vcl.DBCtrls;

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
    procedure btnDeleteClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
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

procedure TfrmProdutos.btnDeleteClick(Sender: TObject);
begin
  inherited;
   FControle
     .Entidades
     .Produto
       .This
         .Id(dsSearch.DataSet.FieldByName('ID').AsInteger)
       .&End
     .Excluir;
   ListarTodos;
end;

procedure TfrmProdutos.btnNewClick(Sender: TObject);
begin
  inherited;
   ListarTodos;
   dsSearch.DataSet.Insert;
   if pcMain.ActivePageIndex = 0 then
      pcMain.ActivePageIndex := 1;
   edtName.SetFocus;
end;

procedure TfrmProdutos.btnSaveClick(Sender: TObject);
var
   vProduto: Integer;
begin
  inherited;
   if dsSearch.DataSet.FieldByName('DESCRICAO').AsString.Trim.IsEmpty then
   begin
      MessageDlg('Informe a Descri??o!', mtWarning, [mbOK], 0);
      edtName.SetFocus;
      Exit;
   end;

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
      ListarTodos;
      dsSearch.DataSet.Last;
   end
   else
   begin
      vProduto := dsSearch.DataSet.FieldByName('ID').AsInteger;
      FControle
        .Entidades
        .Produto
          .This
            .Id(dsSearch.DataSet.FieldByName('ID').AsInteger)
            .Descricao(dsSearch.DataSet.FieldByName('DESCRICAO').AsString)
            .Valor(dsSearch.DataSet.FieldByName('VALOR').AsFloat)
          .&End
        .Atualizar;
      ListarTodos;
      dsSearch.DataSet.Locate('ID', VarArrayOf([vProduto]), []);
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
   ListarTodos;
end;

procedure TfrmProdutos.ListarTodos;
begin
   FControle.Entidades.Produto.Listar.DataSet(dsSearch);
end;

end.
