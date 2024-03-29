unit uTarefa1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uPadrao, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Buttons, Controller.GeraSQL;

type
  TfTarefa1 = class(TfrmPadrao)
    pnlMain: TPanel;
    mmColunas: TMemo;
    mmTabelas: TMemo;
    mmCondicoes: TMemo;
    btnGerar: TBitBtn;
    lblColunas: TLabel;
    lblTabelas: TLabel;
    lblCondicoes: TLabel;
    mmSQL: TMemo;
    lblSQL: TLabel;
    procedure btnGerarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fTarefa1: TfTarefa1;

implementation

{$R *.dfm}

procedure TfTarefa1.btnGerarClick(Sender: TObject);

   function GerarSQL: TStringList;
   var
      vGeraSQL: TGeraSql;
   begin
      vGeraSQL := TGeraSql.Create;
      Try
         vGeraSQL.SetColunas(mmColunas);
         vGeraSQL.SetTabela(mmTabelas);
         vGeraSQL.SetCondicoes(mmCondicoes);
         Result := vGeraSQL.GeraSQL;
      Finally
         FreeAndNil(vGeraSQL);
      End;
   end;

begin
   mmSQL.Clear;
   mmSQL.Lines := GerarSQL;
end;

end.
