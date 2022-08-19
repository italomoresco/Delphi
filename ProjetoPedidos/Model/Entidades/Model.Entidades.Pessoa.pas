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
    FCidade: String;
    FEstado: String;
    FId: Integer;
  public
    constructor Create(Parent: iDAOEntity<TPessoa>);
    destructor Destroy; override;
    function Id(Value: Integer): TPessoa; overload;
    function Id: Integer; overload;
    function Nome(Value: String): TPessoa; overload;
    function Nome: String; overload;
    function Cidade(Value: String): TPessoa; overload;
    function Cidade: String; overload;
    function Estado(Value: String): TPessoa; overload;
    function Estado: String; overload;
    function &End: iDAOEntity<TPessoa>;
  end;

implementation

{ TPedidos }

function TPessoa.&End: iDAOEntity<TPessoa>;
begin
   Result := FParent;
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

function TPessoa.Id(Value: Integer): TPessoa;
begin
   Result := Self;
   FId := Value;
end;

function TPessoa.Id: Integer;
begin
   Result := FId;
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

end.
