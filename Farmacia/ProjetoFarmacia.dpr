program ProjetoFarmacia;

uses
  Vcl.Forms,
  view.principal in 'View\view.principal.pas' {frmPrincipal},
  view.padrao in 'View\Padrao\view.padrao.pas' {FormPadrao},
  view.compras in 'View\view.compras.pas' {frmCompras},
  view.vendas in 'View\view.vendas.pas' {frmVendas},
  view.pessoas in 'View\view.pessoas.pas' {frmPessoas},
  view.produtos in 'View\view.produtos.pas' {frmProdutos};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TFormPadrao, FormPadrao);
  Application.CreateForm(TfrmCompras, frmCompras);
  Application.CreateForm(TfrmVendas, frmVendas);
  Application.CreateForm(TfrmPessoas, frmPessoas);
  Application.CreateForm(TfrmProdutos, frmProdutos);
  Application.Run;
end.
