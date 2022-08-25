unit uTarefa2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uPadrao, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.ExtCtrls, Controller.Thread;

type
  TfTarefa2 = class(TfrmPadrao)
    pnlMain: TPanel;
    lblIntervalo1: TLabel;
    lblIntervalo2: TLabel;
    edtIntervalo1: TEdit;
    edtIntervalo2: TEdit;
    pb1: TProgressBar;
    pb2: TProgressBar;
    btnExecutar: TButton;
    procedure btnExecutarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fTarefa2: TfTarefa2;

implementation

{$R *.dfm}

procedure TfTarefa2.btnExecutarClick(Sender: TObject);
var
   vThread1, vThread2: TThreadRun;
begin
   vThread1 := TThreadRun.Create(True);
   vThread1.SetIntervalo(StrToIntDef(edtIntervalo1.Text, 0));
   vThread1.SetProgressBar(pb1);

   vThread2 := TThreadRun.Create(True);
   vThread2.SetIntervalo(StrToIntDef(edtIntervalo2.Text, 0));
   vThread2.SetProgressBar(pb2);

   vThread1.Start;
   vThread2.Start;
end;

end.
