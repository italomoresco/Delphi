unit view.padrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Tabs, Vcl.ComCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls;

type
  TfrmPadrao = class(TForm)
    pnlMain: TPanel;
    pnlButtons: TPanel;
    pcMain: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    btnNew: TButton;
    btnSave: TButton;
    btnCancel: TButton;
    btnDelete: TButton;
    pnlSearch: TPanel;
    dbgSearch: TDBGrid;
    btnSearch: TButton;
    edtSearch: TEdit;
    dsSearch: TDataSource;
    procedure dsSearchDataChange(Sender: TObject; Field: TField);
    procedure pcMainChange(Sender: TObject);
    procedure dbgSearchDblClick(Sender: TObject);
  private
    { Private declarations }
    procedure ButtonsControl;
  public
    { Public declarations }
  end;

var
  frmPadrao: TfrmPadrao;

implementation

{$R *.dfm}

procedure TfrmPadrao.ButtonsControl;
begin
   btnSave.Enabled    := dsSearch.State in [dsEdit, dsInsert];
   btnCancel.Enabled  := dsSearch.State in [dsEdit, dsInsert];
   btnNew.Enabled     := dsSearch.State = dsBrowse;
   btnDelete.Enabled  := dsSearch.State = dsBrowse;
end;

procedure TfrmPadrao.dbgSearchDblClick(Sender: TObject);
begin
   pcMain.ActivePageIndex := 1;
end;

procedure TfrmPadrao.dsSearchDataChange(Sender: TObject; Field: TField);
begin
   ButtonsControl;
end;

procedure TfrmPadrao.pcMainChange(Sender: TObject);
begin
   ButtonsControl;
end;

end.
