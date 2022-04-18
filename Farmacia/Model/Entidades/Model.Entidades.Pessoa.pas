unit Model.Entidades.Pessoa;

interface

uses
  Model.Dao.Interfaces;

type
  TPessoa = class
  private
    [weak]
    FParent: iDAOEntity<TPessoa>;
    FNome: String;
    FTelefone: String;
    FLogradouro: String;
    FCEP: String;
    FBairro: String;
    FCidade: String;
    FEstado: String;
    FTipo: String;
    FDocumento: String;
    FId: Integer;
  public
    constructor Create(Parent: iDAOEntity<TPessoa>);
    destructor Destroy; override;
    function Id(Value: Integer): TPessoa; overload;
    function Id: Integer; overload;
    function Nome(Value: String): TPessoa; overload;
    function Nome: String; overload;
    function Telefone(Value: String): TPessoa; overload;
    function Telefone: String; overload;
    function Logradouro(Value: String): TPessoa; overload;
    function Logradouro: String; overload;
    function CEP(Value: String): TPessoa; overload;
    function CEP: String; overload;
    function Bairro(Value: String): TPessoa; overload;
    function Bairro: String; overload;
    function Cidade(Value: String): TPessoa; overload;
    function Cidade: String; overload;
    function Estado(Value: String): TPessoa; overload;
    function Estado: String; overload;
    function Tipo(Value: String): TPessoa; overload;
    function Tipo: String; overload;
    function Documento(Value: String): TPessoa; overload;
    function Documento: String; overload;
    function &End: iDAOEntity<TPessoa>;
  end;

implementation

{ TPedidos }

function TPessoa.&End: iDAOEntity<TPessoa>;
begin
   Result := FParent;
end;

function TPessoa.Bairro(Value: String): TPessoa;
begin
   Result := Self;
   FBairro := Value;
end;

function TPessoa.Bairro: String;
begin
   Result := FBairro;
end;

function TPessoa.CEP: String;
begin
   Result := FCEP;
end;

function TPessoa.CEP(Value: String): TPessoa;
begin
   Result := Self;
   FCEP := Value;
end;

function TPessoa.Cidade: String;
begin
   Result := FCidade;
end;

function TPessoa.Cidade(Value: String): TPessoa;
begin
   Result := Self;
   FCidade := Value;
end;

function TPessoa.Estado: String;
begin
   Result := FEstado;
end;

function TPessoa.Estado(Value: String): TPessoa;
begin
   Result := Self;
   FEstado := Value;
end;

constructor TPessoa.Create(Parent: iDAOEntity<TPessoa>);
begin
   FParent := Parent;
end;

destructor TPessoa.Destroy;
begin
  inherited;
end;

function TPessoa.Documento(Value: String): TPessoa;
begin
   Result := Self;
   FDocumento := Value;
end;

function TPessoa.Documento: String;
begin
   Result := FDocumento;
end;

function TPessoa.Id(Value: Integer): TPessoa;
begin
   Result := Self;
   FId := Value;
end;

function TPessoa.Id: Integer;
begin
   Result := FId;
end;

function TPessoa.Logradouro(Value: String): TPessoa;
begin
   Result := Self;
   FLogradouro := Value;
end;

function TPessoa.Logradouro: String;
begin
   Result := FLogradouro;
end;

function TPessoa.Nome: String;
begin
   Result := FNome;
end;

function TPessoa.Nome(Value: String): TPessoa;
begin
   Result := Self;
   FNome := Value;
end;

function TPessoa.Telefone(Value: String): TPessoa;
begin
   Result := Self;
   FTelefone := Value;
end;

function TPessoa.Telefone: String;
begin
   Result := FTelefone;
end;

function TPessoa.Tipo(Value: String): TPessoa;
begin
   Result := Self;
   FTipo := Value;
end;

function TPessoa.Tipo: String;
begin
   Result := FTipo;
end;

end.
