program ProjetoPedido;

uses
  Vcl.Forms,
  view.padrao in 'View\Padrao\view.padrao.pas' {frmPadrao},
  view.pedido in 'View\view.pedido.pas' {frmPedidos};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPedidos, frmPedidos);
  Application.Run;
end.