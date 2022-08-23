program ProjetoCadastroPessoa;

uses
  Vcl.Forms,
  view.padrao in 'View\Padrao\view.padrao.pas' {frmPadrao},
  view.pessoa in 'View\view.pessoa.pas' {frmPessoa},
  Vcl.Themes,
  Vcl.Styles,
  Controller.Controle in 'Controller\Controller.Controle.pas',
  Controller.Entidades in 'Controller\Controller.Entidades.pas',
  Controller.Interfaces in 'Controller\Controller.Interfaces.pas',
  Conexao.Firedac in 'Conexao\Conexao.Firedac.pas',
  Conexao.Interfaces in 'Conexao\Conexao.Interfaces.pas',
  Model.Dao.Interfaces in 'Model\Dao\Model.Dao.Interfaces.pas',
  Model.Entidades.Pessoa in 'Model\Entidades\Model.Entidades.Pessoa.pas',
  Model.Dao.Pessoa in 'Model\Dao\Model.Dao.Pessoa.pas',
  Model.Entidades.Endereco in 'Model\Entidades\Model.Entidades.Endereco.pas',
  Model.Dao.Endereco in 'Model\Dao\Model.Dao.Endereco.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Glossy');
  Application.CreateForm(TfrmPessoa, frmPessoa);
  Application.Run;
end.
