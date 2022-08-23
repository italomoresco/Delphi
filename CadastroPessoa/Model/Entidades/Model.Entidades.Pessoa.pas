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
    FCPF: String;
    FRG: String;
    FNomeMae: String;
    FNomePai: String;
    FId: Integer;
  public
    constructor Create(Parent: iDAOEntity<TPessoa>);
    destructor Destroy; override;
    function Id(Value: Integer): TPessoa; overload;
    function Id: Integer; overload;
    function Nome(Value: String): TPessoa; overload;
    function Nome: String; overload;
    function CPF(Value: String): TPessoa; overload;
    function CPF: String; overload;
    function RG(Value: String): TPessoa; overload;
    function RG: String; overload;
    function NomeMae(Value: String): TPessoa; overload;
    function NomeMae: String; overload;
    function NomePai(Value: String): TPessoa; overload;
    function NomePai: String; overload;
    function &End: iDAOEntity<TPessoa>;
  end;

implementation

{ TPedidos }

function TPessoa.&End: iDAOEntity<TPessoa>;
begin
   Result := FParent;
end;

function TPessoa.NomeMae: String;
begin
   Result := FNomeMae;
end;

function TPessoa.NomeMae(Value: String): TPessoa;
begin
   Result := Self;
   FNomeMae := Value;
end;

function TPessoa.NomePai: String;
begin
   Result := FNomePai;
end;

function TPessoa.NomePai(Value: String): TPessoa;
begin
   Result := Self;
   FNomePai := Value;
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

function TPessoa.CPF(Value: String): TPessoa;
begin
   Result := Self;
   FCPF := Value;
end;

function TPessoa.CPF: String;
begin
   Result := FCPF;
end;

function TPessoa.RG(Value: String): TPessoa;
begin
   Result := Self;
   FRG := Value;
end;

function TPessoa.RG: String;
begin
   Result := FRG;
end;

end.
