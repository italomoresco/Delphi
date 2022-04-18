program ProjetoFarmacia;

uses
  Vcl.Forms,
  view.principal in 'View\view.principal.pas' {frmPrincipal},
  view.padrao in 'View\Padrao\view.padrao.pas' {frmPadrao},
  view.compras in 'View\view.compras.pas' {frmCompras},
  view.vendas in 'View\view.vendas.pas' {frmVendas},
  view.pessoas in 'View\view.pessoas.pas' {frmPessoas},
  view.produtos in 'View\view.produtos.pas' {frmProdutos},
  Controller.Controle in 'Controller\Controller.Controle.pas',
  Controller.Entidades in 'Controller\Controller.Entidades.pas',
  Controller.Interfaces in 'Controller\Controller.Interfaces.pas',
  Conexao.Firedac in 'Conexao\Conexao.Firedac.pas',
  Conexao.Interfaces in 'Conexao\Conexao.Interfaces.pas',
  Model.Dao.Interfaces in 'Model\Dao\Model.Dao.Interfaces.pas',
  Model.Dao.Pedidos in 'Model\Dao\Model.Dao.Pedidos.pas',
  Model.Dao.PedidosItens in 'Model\Dao\Model.Dao.PedidosItens.pas',
  Model.Entidades.Pedidos in 'Model\Entidades\Model.Entidades.Pedidos.pas',
  Model.Entidades.PedidosItens in 'Model\Entidades\Model.Entidades.PedidosItens.pas',
  Model.Entidades.Produto in 'Model\Entidades\Model.Entidades.Produto.pas',
  Model.Dao.Produto in 'Model\Dao\Model.Dao.Produto.pas',
  Model.Entidades.Pessoa in 'Model\Entidades\Model.Entidades.Pessoa.pas',
  Model.Dao.Pessoa in 'Model\Dao\Model.Dao.Pessoa.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmPadrao, frmPadrao);
  Application.Run;
end.
