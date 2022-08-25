unit uTarefa3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Controller.CreateDataSet,
  Datasnap.DBClient, Controller.Operacoes, uPadrao;

type
  TfTarefa3 = class(TfrmPadrao)
    pnlMain: TPanel;
    dbgDadosProjeto: TDBGrid;
    edtTotal: TEdit;
    edtTotalDivisoes: TEdit;
    lblTotal: TLabel;
    lblTotalDivisoes: TLabel;
    btnTotal: TBitBtn;
    btnTotalDivisoes: TBitBtn;
    lblProjeto: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnTotalClick(Sender: TObject);
    procedure btnTotalDivisoesClick(Sender: TObject);
  private
    FDataSource: TDataSource;
    FDataSet: TClientDataSet;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fTarefa3: TfTarefa3;

implementation

{$R *.dfm}

procedure TfTarefa3.btnTotalClick(Sender: TObject);
var
   vOperacoes: TOperacoes;
begin
   vOperacoes := TOperacoes.Create;

   vOperacoes.SetDataSet(FDataSet);
   edtTotal.Text := FormatFloat('0.00', vOperacoes.CalculaTotal);
end;

procedure TfTarefa3.btnTotalDivisoesClick(Sender: TObject);
var
   vOperacoes: TOperacoes;
begin
   vOperacoes := TOperacoes.Create;
   vOperacoes.SetDataSet(FDataSet);
   edtTotalDivisoes.Text := FormatFloat('0.00', vOperacoes.CalculaTotalDivisoes);
end;

procedure TfTarefa3.FormCreate(Sender: TObject);
var
   vDataSet: TCreateDataSet;
begin
   vDataSet := TCreateDataSet.Create;
   try
      FDataSet    := vDataSet.PopulaDataSet;
      FDataSource := vDataSet.ConfiguraDataSource;

      FDataSource.DataSet        := FDataSet;
      dbgDadosProjeto.DataSource := FDataSource;

      TFloatField(FDataSet.FieldByName('VALOR')).DisplayFormat := 'R$###,###,##0.00';
   finally
      FreeAndNil(vDataSet);
   end;
end;

end.
