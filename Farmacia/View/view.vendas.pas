unit view.vendas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, view.padrao, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls;

type
  TfrmVendas = class(TFormPadrao)
    PageControl1: TPageControl;
    pcSale: TTabSheet;
    TabSheet4: TTabSheet;
    pnlProduct: TPanel;
    lblProduct: TLabel;
    dbgProduct: TDBGrid;
    lblQuantity: TLabel;
    lblPrice: TLabel;
    lblCode: TLabel;
    lblCustomer: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmVendas: TfrmVendas;

implementation

{$R *.dfm}

end.
