unit view.pedido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, view.padrao, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls;

type
  TfrmPedidos = class(TfrmPadrao)
    pcData: TPageControl;
    tsGeneral: TTabSheet;
    tsProducts: TTabSheet;
    lblOrderNumber: TLabel;
    lblCustomer: TLabel;
    lblDate: TLabel;
    edtOrderNumber: TDBEdit;
    edtCustomer: TDBEdit;
    edtDate: TDBEdit;
    pnlAmount: TPanel;
    lblAmount: TLabel;
    edtAmount: TDBEdit;
    dbgProduct: TDBGrid;
    pnlProduct: TPanel;
    lblProduct: TLabel;
    lblQuantity: TLabel;
    lblPrice: TLabel;
    edtProduct: TDBEdit;
    edtQuantity: TDBEdit;
    edtPrice: TDBEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPedidos: TfrmPedidos;

implementation

{$R *.dfm}

end.