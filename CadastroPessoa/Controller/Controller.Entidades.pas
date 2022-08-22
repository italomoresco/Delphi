unit Controller.Entidades;

interface

uses
  Controller.Interfaces, Model.Dao.Interfaces, Model.Entidades.Pessoa, Model.Dao.Pessoa,
  Model.Dao.Endereco, Model.Entidades.Endereco;

type
  TControleEntidades = class(TInterfacedObject, iControleEntidades)
    private
      FPessoa: iDAOEntity<TPessoa>;
      FEndereco: iDAOEntity<TEndereco>;
    public
      constructor Create;
      destructor Destroy; override;
      class function New: iControleEntidades;
      function Pessoa: iDAOEntity<TPessoa>;
      function Endereco: iDAOEntity<TEndereco>;
  end;

implementation

constructor TControleEntidades.Create;
begin

end;

destructor TControleEntidades.Destroy;
begin
  inherited;
end;

class function TControleEntidades.New: iControleEntidades;
begin
   Result := Self.Create;
end;

function TControleEntidades.Pessoa: iDAOEntity<TPessoa>;
begin
   if not Assigned(FPessoa) then
      FPessoa := TDAOPessoa.New;
   Result := FPessoa;
end;

function TControleEntidades.Endereco: iDAOEntity<TEndereco>;
begin
   if not Assigned(FEndereco) then
      FEndereco := TDAOEndereco.New;
   Result := FEndereco;
end;

end.
