unit Model.Entidades.Pedidos;

interface

uses
  Model.Dao.Interfaces;

type
  TPedidos = class
  private
    [weak]
    FParent: iDAOEntity<TPedidos>;
    FPessoa: Integer;
    FTipo: string;
    FValorTotal: Double;
    FData: TDate;
    FId: Integer;
  public
    constructor Create(Parent: iDAOEntity<TPedidos>);
    destructor Destroy; override;
    function Id(Value: Integer): TPedidos; overload;
    function Id: Integer; overload;
    function Data(Value: TDateTime): TPedidos; overload;
    function Data: TDateTime; overload;
    function ValorTotal(Value: Double): TPedidos; overload;
    function ValorTotal: Double; overload;
    function Tipo(Value: string): TPedidos; overload;
    function Tipo: string; overload;
    function Pessoa(Value: Integer): TPedidos; overload;
    function Pessoa: Integer; overload;
    function &End: iDAOEntity<TPedidos>;
  end;

implementation

{ TPedidos }

function TPedidos.&End: iDAOEntity<TPedidos>;
begin
   Result := FParent;
end;

constructor TPedidos.Create(Parent: iDAOEntity<TPedidos>);
begin
   FParent := Parent;
end;

function TPedidos.Data(Value: TDateTime): TPedidos;
begin
   Result := Self;
   FData := Value;
end;

function TPedidos.Data: TDateTime;
begin
   Result := FData;
end;

destructor TPedidos.Destroy;
begin
  inherited;
end;

function TPedidos.Id(Value: Integer): TPedidos;
begin
   Result := Self;
   FId := Value;
end;

function TPedidos.Id: Integer;
begin
   Result := FId;
end;

function TPedidos.Pessoa: Integer;
begin
   Result := FPessoa;
end;

function TPedidos.Pessoa(Value: Integer): TPedidos;
begin
   Result := Self;
   FPessoa := Value;
end;

function TPedidos.Tipo: string;
begin
   Result := FTipo;
end;

function TPedidos.Tipo(Value: string): TPedidos;
begin
   Result := Self;
   FTipo := Value;
end;

function TPedidos.ValorTotal(Value: Double): TPedidos;
begin
   Result := Self;
   FValorTotal := Value;
end;

function TPedidos.ValorTotal: Double;
begin
   Result := FValorTotal;
end;

end.
