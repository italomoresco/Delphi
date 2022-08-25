unit Controller.Operacoes;

interface

uses
  Data.DB;

type
  TOperacoes = class(TInterfacedObject)
    FDataSet: TDataSet;
    procedure SetDataSet(DataSet: TDataSet);
    function CalculaTotal: Double;
    function CalculaTotalDivisoes: Double;
  end;

implementation

{ TOperacoes }

procedure TOperacoes.SetDataSet(DataSet: TDataSet);
begin
   FDataSet := DataSet;
end;

function TOperacoes.CalculaTotal: Double;
var
   vTotal: Double;
begin
   vTotal := 0;

   FDataSet.First;
   while not FDataSet.Eof do
   begin
      vTotal := vTotal + FDataSet.FieldByName('VALOR').AsFloat;
      FDataSet.Next;
   end;

   Result := vTotal;
end;

function TOperacoes.CalculaTotalDivisoes: Double;
var
   vId: Integer;
   vTotal, vValorAtual, vValorAnterior: Double;
begin
   vTotal := 0;

   FDataSet.First;
   vId := FDataSet.FieldByName('IdProjeto').AsInteger;
   while not FDataSet.Eof do
   begin
      vValorAtual := FDataSet.FieldByName('VALOR').AsFloat;

      if vId <> FDataSet.FieldByName('IDPROJETO').AsInteger then
         vTotal := vTotal + (vValorAtual/vValorAnterior);

      vValorAnterior := FDataSet.FieldByName('VALOR').AsFloat;
      vId := FDataSet.FieldByName('IDPROJETO').AsInteger;

      FDataSet.Next;
   end;
   Result := vTotal;
end;

end.
