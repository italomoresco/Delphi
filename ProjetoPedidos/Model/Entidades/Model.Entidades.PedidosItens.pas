unit Model.Entidades.PedidosItens;

interface

uses
  Model.DAO.Interfaces;

type
  TPedidosItens = class
  private
    [weak]
    FParent: iDAOEntity<TPedidosItens>;
    FValor: Double;
    FValorTotal: Double;
    FQuantidade: Integer;
    FProduto: Integer;
    FIdPedido: Integer;
    FId: Integer;
  public
    constructor Create(Parent: iDAOEntity<TPedidosItens>);
    destructor Destroy; override;
    function Id(Value: Integer): TPedidosItens; overload;
    function Id: Integer; overload;
    function IdPedido(Value: Integer): TPedidosItens; overload;
    function IdPedido: Integer; overload;
    function Produto(Value: Integer): TPedidosItens; overload;
    function Produto: Integer; overload;
    function Quantidade(Value: Integer): TPedidosItens; overload;
    function Quantidade: Integer; overload;
    function Valor(Value: Double): TPedidosItens; overload;
    function Valor: Double; overload;
    function ValorTotal(Value: Double): TPedidosItens; overload;
    function ValorTotal: Double; overload;
    function &End: iDAOEntity<TPedidosItens>;
  end;

implementation

{ TPedidosItens }

constructor TPedidosItens.Create(Parent: iDAOEntity<TPedidosItens>);
begin
   FParent := Parent;
end;

destructor TPedidosItens.Destroy;
begin
  inherited;
end;

function TPedidosItens.&End: iDAOEntity<TPedidosItens>;
begin
   Result := FParent;
end;

function TPedidosItens.IdPedido(Value: Integer): TPedidosItens;
begin
   Result := Self;
   FIdPedido := Value;
end;

function TPedidosItens.IdPedido: Integer;
begin
   Result := FIdPedido;
end;

function TPedidosItens.Produto: Integer;
begin
   Result := FProduto;
end;

function TPedidosItens.Produto(Value: Integer): TPedidosItens;
begin
   Result := Self;
   FProduto := Value;
end;

function TPedidosItens.Id: Integer;
begin
   Result := FId;
end;

function TPedidosItens.Id(Value: Integer): TPedidosItens;
begin
   Result := Self;
   FId := Value;
end;

function TPedidosItens.Quantidade(Value: Integer): TPedidosItens;
begin
   Result := Self;
   FQuantidade := Value;
end;

function TPedidosItens.Quantidade: Integer;
begin
   Result := FQuantidade;
end;

function TPedidosItens.Valor: Double;
begin
   Result := FValor;
end;

function TPedidosItens.ValorTotal: Double;
begin
   Result := FValorTotal;
end;

function TPedidosItens.ValorTotal(Value: Double): TPedidosItens;
begin
   Result := Self;
   FValorTotal := Value;
end;

function TPedidosItens.Valor(Value: Double): TPedidosItens;
begin
   Result := Self;
   FValor := Value;
end;

end.
