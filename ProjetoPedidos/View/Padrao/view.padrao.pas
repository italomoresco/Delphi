unit view.padrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Tabs, Vcl.ComCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Controller.Interfaces, Controller.Controle;

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
    dsSearch: TDataSource;
    procedure dsSearchDataChange(Sender: TObject; Field: TField);
    procedure pcMainChange(Sender: TObject);
    procedure dbgSearchDblClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
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
   btnSave.Enabled    := dsSearch.State in dsEditModes;
   btnCancel.Enabled  := dsSearch.State in dsEditModes;
   btnNew.Enabled     := dsSearch.State = dsBrowse;
   btnDelete.Enabled  := (dsSearch.State = dsBrowse) and (not dsSearch.DataSet.IsEmpty);
end;

procedure TfrmPadrao.dbgSearchDblClick(Sender: TObject);
begin
   pcMain.ActivePageIndex := 1;
end;

procedure TfrmPadrao.dsSearchDataChange(Sender: TObject; Field: TField);
begin
   ButtonsControl;
end;

procedure TfrmPadrao.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
   begin
      Key := #0;
      Perform(Wm_NextDlgCtl, 0, 0);
   end;
end;

procedure TfrmPadrao.pcMainChange(Sender: TObject);
begin
   ButtonsControl;

end;

end.
