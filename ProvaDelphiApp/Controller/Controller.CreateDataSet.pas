unit Controller.CreateDataSet;

interface

uses
  Datasnap.DBClient, Data.DB, System.SysUtils, Vcl.Forms;

type
  TCreateDataSet = class(TInterfacedObject)
  private
    function ConfiguraDataSet: TCLientDataset;
  public
    function ConfiguraDataSource: TDatasource;
    function PopulaDataSet: TCLientDataset;
  end;

implementation

{ TCreateDataSet }

function TCreateDataSet.ConfiguraDataSet: TCLientDataset;
begin
   ConfiguraDataSet := TClientDataSet.Create(nil);

   ConfiguraDataSet.FieldDefs.Add('IDPROJETO', ftInteger);
   ConfiguraDataSet.FieldDefs.Add('NOMEPROJETO', ftString, 20);
   ConfiguraDataSet.FieldDefs.Add('VALOR', ftFloat);
   ConfiguraDataSet.CreateDataSet;
end;

function TCreateDataSet.ConfiguraDataSource: TDatasource;
begin
   ConfiguraDataSource := TDataSource.Create(nil);
end;

function TCreateDataSet.PopulaDataSet: TCLientDataset;
var
   I: Integer;
   vValor: Double;
begin
   PopulaDataSet := ConfiguraDataSet;

   vValor := 10.00;
   for I := 1 to 10 do
   begin
      PopulaDataSet.Append;
      PopulaDataSet.FieldByName('IDPROJETO').AsInteger  := I;
      PopulaDataSet.FieldByName('NOMEPROJETO').AsString := 'Projeto ' + IntToStr(I);
      PopulaDataSet.FieldByName('VALOR').AsFloat        := vValor;
      PopulaDataSet.Post;

      vValor := vValor + 10;
   end;
end;

end.