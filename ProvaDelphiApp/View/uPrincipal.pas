unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ExtCtrls, Vcl.ToolWin,
  Vcl.ActnMan, Vcl.ActnCtrls, Vcl.ActnMenus, Vcl.CategoryButtons;

type
  TfPrincipal = class(TForm)
    pnlMain: TPanel;
    mmMenu: TMainMenu;
    miTarefas: TMenuItem;
    miTarefa1: TMenuItem;
    miTarefa2: TMenuItem;
    miTarefa3: TMenuItem;
    procedure miTarefa1Click(Sender: TObject);
    procedure miTarefa2Click(Sender: TObject);
    procedure miTarefa3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fPrincipal: TfPrincipal;

implementation

{$R *.dfm}

uses
   uTarefa1, uTarefa2, uTarefa3;

procedure TfPrincipal.miTarefa1Click(Sender: TObject);
begin
   if Assigned(fTarefa1) then
      fTarefa1.Show
   else
      fTarefa1 := TfTarefa1.Create(Self);
end;

procedure TfPrincipal.miTarefa2Click(Sender: TObject);
begin
   if Assigned(fTarefa2) then
      fTarefa2.Show
   else
      fTarefa2 := TfTarefa2.Create(Self);
end;

procedure TfPrincipal.miTarefa3Click(Sender: TObject);
begin
   if Assigned(fTarefa3) then
      fTarefa3.Show
   else
      fTarefa3 := TfTarefa3.Create(Self);
end;

end.
