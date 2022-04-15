unit view.padrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Tabs, Vcl.ComCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls;

type
  TFormPadrao = class(TForm)
    pnlMain: TPanel;
    pnlButtons: TPanel;
    pcMain: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    btnNew: TButton;
    btnSave: TButton;
    btnCancelar: TButton;
    btnExcluir: TButton;
    pnlSearch: TPanel;
    dbgSearch: TDBGrid;
    btnSearch: TButton;
    edtSearch: TEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPadrao: TFormPadrao;

implementation

{$R *.dfm}

end.
