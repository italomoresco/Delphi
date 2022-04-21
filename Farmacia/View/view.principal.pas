unit view.principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons;

type
  TfrmPrincipal = class(TForm)
    pnlMain: TPanel;
    pnlOptions: TPanel;
    btnPurchases: TBitBtn;
    btnSales: TBitBtn;
    btnPeople: TBitBtn;
    btnProduct: TBitBtn;
    btnExit: TBitBtn;
    procedure btnPurchasesClick(Sender: TObject);
    procedure btnSalesClick(Sender: TObject);
    procedure btnPeopleClick(Sender: TObject);
    procedure btnProductClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses
   view.compras, view.vendas, view.pessoas, view.produtos;

procedure TfrmPrincipal.btnExitClick(Sender: TObject);
begin
   Application.Terminate;
end;

procedure TfrmPrincipal.btnPeopleClick(Sender: TObject);
begin
   frmPessoas := TfrmPessoas.Create(Self);
   frmPessoas.ShowModal;
end;

procedure TfrmPrincipal.btnProductClick(Sender: TObject);
begin
   frmProdutos := TfrmProdutos.Create(Self);
   frmProdutos.ShowModal;
end;

procedure TfrmPrincipal.btnPurchasesClick(Sender: TObject);
begin
   frmCompras := TfrmCompras.Create(Self);
   frmCompras.ShowModal;
end;

procedure TfrmPrincipal.btnSalesClick(Sender: TObject);
begin
   frmVendas := TfrmVendas.Create(Self);
   frmVendas.ShowModal;
end;

end.
