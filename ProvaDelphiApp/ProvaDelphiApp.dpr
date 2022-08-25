program ProvaDelphiApp;

uses
  Vcl.Forms,
  Vcl.Themes,
  Vcl.Styles,
  uPadrao in 'view\Padrao\uPadrao.pas' {frmPadrao},
  uTarefa1 in 'view\uTarefa1.pas' {fTarefa1},
  Controller.GeraSQL in 'Controller\Controller.GeraSQL.pas',
  uspQuery in 'Components\uspQuery.pas',
  uTarefa2 in 'View\uTarefa2.pas' {fTarefa2},
  Controller.Thread in 'Controller\Controller.Thread.pas',
  Controller.Operacoes in 'Controller\Controller.Operacoes.pas' {$R *.res},
  Controller.CreateDataSet in 'Controller\Controller.CreateDataSet.pas',
  uTarefa3 in 'View\uTarefa3.pas' {fTarefa3},
  uPrincipal in 'View\uPrincipal.pas' {fPrincipal};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Glossy');
  Application.CreateForm(TfPrincipal, fPrincipal);
  Application.Run;
end.
