unit Model.Entidades.Endereco;

interface

uses
  Model.Dao.Interfaces;

type
  TEndereco = class
  private
    [weak]
    FParent: iDAOEntity<TEndereco>;
    FCEP: Integer;
    FEndereco: string;
    FNum: String;
    FCidade: String;
    FEstado: String;
    FIdPessoa: Integer;
    FId: Integer;
  public
    constructor Create(Parent: iDAOEntity<TEndereco>);
    destructor Destroy; override;
    function Id(Value: Integer): TEndereco; overload;
    function Id: Integer; overload;
    function IdPessoa(Value: Integer): TEndereco; overload;
    function IdPessoa: Integer; overload;
    function CEP(Value: Integer): TEndereco; overload;
    function CEP: Integer; overload;
    function Endereco(Value: String): TEndereco; overload;
    function Endereco: String; overload;
    function Num(Value: String): TEndereco; overload;
    function Num: String; overload;
    function Cidade(Value: String): TEndereco; overload;
    function Cidade: String; overload;
    function Estado(Value: String): TEndereco; overload;
    function Estado: String; overload;
    function &End: iDAOEntity<TEndereco>;
  end;

implementation

{ TPedidos }

function TEndereco.&End: iDAOEntity<TEndereco>;
begin
   Result := FParent;
end;

function TEndereco.Cidade: String;
begin
   Result := FCidade;
end;

function TEndereco.Cidade(Value: String): TEndereco;
begin
   Result := Self;
   FCidade := Value;
end;

function TEndereco.Estado: String;
begin
   Result := FEstado;
end;

function TEndereco.Estado(Value: String): TEndereco;
begin
   Result := Self;
   FEstado := Value;
end;

constructor TEndereco.Create(Parent: iDAOEntity<TEndereco>);
begin
   FParent := Parent;
end;

destructor TEndereco.Destroy;
begin
  inherited;
end;

function TEndereco.Id(Value: Integer): TEndereco;
begin
   Result := Self;
   FId := Value;
end;

function TEndereco.Id: Integer;
begin
   Result := FId;
end;

function TEndereco.IdPessoa: Integer;
begin
   Result := FIdPessoa;
end;

function TEndereco.IdPessoa(Value: Integer): TEndereco;
begin
   Result := Self;
   FIdPessoa := Value;
end;

function TEndereco.CEP: Integer;
begin
   Result := FCEP;
end;

function TEndereco.CEP(Value: Integer): TEndereco;
begin
   Result := Self;
   FCEP := Value;
end;

function TEndereco.Endereco(Value: String): TEndereco;
begin
   Result := Self;
   FEndereco := Value;
end;

function TEndereco.Endereco: String;
begin
   Result := FEndereco;
end;

function TEndereco.Num(Value: String): TEndereco;
begin
   Result := Self;
   FNum := Value;
end;

function TEndereco.Num: String;
begin
   Result := FNum;
end;

end.
