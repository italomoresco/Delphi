program ProjetoPedido;

uses
  Vcl.Forms,
  view.padrao in 'View\Padrao\view.padrao.pas' {frmPadrao},
  view.pedido in 'View\view.pedido.pas' {frmPedidos},
  Conexao.Firedac in 'Conexao\Conexao.Firedac.pas',
  Conexao.Interfaces in 'Conexao\Conexao.Interfaces.pas',
  Model.Dao.Interfaces in 'Model\Dao\Model.Dao.Interfaces.pas',
  Model.Dao.Pedidos in 'Model\Dao\Model.Dao.Pedidos.pas',
  Model.Dao.PedidosItens in 'Model\Dao\Model.Dao.PedidosItens.pas',
  Model.Entidades.Pedidos in 'Model\Entidades\Model.Entidades.Pedidos.pas',
  Model.Entidades.PedidosItens in 'Model\Entidades\Model.Entidades.PedidosItens.pas',
  Controller.Controle in 'Controller\Controller.Controle.pas',
  Controller.Entidades in 'Controller\Controller.Entidades.pas',
  Controller.Interfaces in 'Controller\Controller.Interfaces.pas',
  Model.Dao.Pessoa in 'Model\Dao\Model.Dao.Pessoa.pas',
  Model.Entidades.Pessoa in 'Model\Entidades\Model.Entidades.Pessoa.pas',
  Model.Entidades.Produto in 'Model\Entidades\Model.Entidades.Produto.pas',
  Model.Dao.Produto in 'Model\Dao\Model.Dao.Produto.pas',
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Glossy');
  Application.CreateForm(TfrmPedidos, frmPedidos);
  Application.Run;
end.
