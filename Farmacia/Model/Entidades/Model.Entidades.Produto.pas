unit Model.Entidades.Produto;

interface

uses
  Model.Dao.Interfaces;

type
  TProduto = class
  private
    [weak]
    FParent: iDAOEntity<TProduto>;
    FDescricao: String;
    FValor: Double;
    FId: Integer;
  public
    constructor Create(Parent: iDAOEntity<TProduto>);
    destructor Destroy; override;
    function Id(Value: Integer): TProduto; overload;
    function Id: Integer; overload;
    function Descricao(Value: String): TProduto; overload;
    function Descricao: String; overload;
    function Valor(Value: Double): TProduto; overload;
    function Valor: Double; overload;
    function &End: iDAOEntity<TProduto>;
  end;

implementation

{ TPedidos }

function TProduto.&End: iDAOEntity<TProduto>;
begin
   Result := FParent;
end;

constructor TProduto.Create(Parent: iDAOEntity<TProduto>);
begin
   FParent := Parent;
end;

function TProduto.Descricao(Value: String): TProduto;
begin
   Result := Self;
   FDescricao := Value;
end;

function TProduto.Descricao: String;
begin
   Result := FDescricao;
end;

function TProduto.Valor(Value: Double): TProduto;
begin
   Result := Self;
   FValor := Value;
end;

function TProduto.Valor: Double;
begin
   Result := FValor;
end;

destructor TProduto.Destroy;
begin
  inherited;
end;

function TProduto.Id(Value: Integer): TProduto;
begin
   Result := Self;
   FId := Value;
end;

function TProduto.Id: Integer;
begin
   Result := FId;
end;

end.
