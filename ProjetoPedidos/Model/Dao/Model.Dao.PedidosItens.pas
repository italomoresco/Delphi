unit Model.Dao.PedidosItens;

interface

uses
  Model.Dao.Interfaces, Model.Entidades.PedidosItens, Data.DB, Conexao.Interfaces,
  Conexao.Firedac;

type
  TDAOPedidosItens = class(TInterfacedObject, iDAOEntity<TPedidosItens>)
    private
      FPedidosItens: TPedidosItens;
      FConexao: iConexao;
      FDataSet: TDataSet;
    public
      constructor Create;
      destructor Destroy; override;
      class function New: iDAOEntity<TPedidosItens>;
      function Listar: iDAOEntity<TPedidosItens>;
      function ListarPorId(Id: Variant): iDAOEntity<TPedidosItens>;
      function Excluir(Id: Integer): iDAOEntity<TPedidosItens>; overload;
      function Excluir: iDAOEntity<TPedidosItens>; overload;
      function Atualizar: iDAOEntity<TPedidosItens>;
      function Inserir: iDAOEntity<TPedidosItens>;
      function DataSet(DataSource: TDataSource): iDAOEntity<TPedidosItens>;
      function This: TPedidosItens;
  end;

implementation

uses
  System.SysUtils;

function TDAOPedidosItens.Atualizar: iDAOEntity<TPedidosItens>;
begin
   Result := Self;
   try
      FConexao
         .SQL('UPDATE PED_ITENS SET '+
              'CODIGO_PRODUTO = :PRODUTO, QUANTIDADE = :QUANTIDADE, '+
              'VALOR_UNITARIO = :VALOR, VALOR_TOTAL = :VALOR_TOTAL '+
              'WHERE AUTO_INCREM = :ID')
            .Params('PRODUTO', FPedidosItens.Produto)
            .Params('QUANTIDADE', FPedidosItens.Quantidade)
            .Params('VALOR', FPedidosItens.Valor)
            .Params('VALOR_TOTAL', FPedidosItens.ValorTotal)
            .Params('ID', FPedidosItens.Id)
         .ExecSQL;
   except on e:Exception do
      raise Exception.Create('Error ao tentar atualizar o registro: '+e.Message);
   end;
end;

constructor TDAOPedidosItens.Create;
begin
   FConexao := TModelConexao.New;
   FPedidosItens := TPedidosItens.Create(Self);
end;

function TDAOPedidosItens.DataSet(DataSource: TDataSource): iDAOEntity<TPedidosItens>;
begin
   Result := Self;
   if not Assigned(FDataSet) then
      DataSource.DataSet := FConexao.DataSet
   else
      DataSource.DataSet := FDataSet;
end;

destructor TDAOPedidosItens.Destroy;
begin
   FPedidosItens.DisposeOf;

  inherited;
end;

function TDAOPedidosItens.Excluir: iDAOEntity<TPedidosItens>;
begin
   Result := Self;
   try
      FConexao
         .SQL('DELETE FROM PED_ITENS WHERE AUTO_INCREM = :ID')
            .Params('ID', FPedidosItens.Id)
         .ExecSQL;
   except on e:Exception do
      raise Exception.Create('Error ao tentar excluir o registro: '+e.Message);
   end;
end;

function TDAOPedidosItens.Excluir(Id: Integer): iDAOEntity<TPedidosItens>;
begin
   Result := Self;
   try
      FConexao
         .SQL('DELETE FROM PED_ITENS WHERE AUTO_INCREM = :ID')
            .Params('ID', Id)
         .ExecSQL;
   except on e:Exception do
      raise Exception.Create('Error ao tentar excluir o registro: '+e.Message);
   end;
end;

function TDAOPedidosItens.Inserir: iDAOEntity<TPedidosItens>;
begin
   Result := Self;
   try
      FConexao
         .SQL('INSERT INTO PED_ITENS '+
              '(NUMERO_PEDIDO, CODIGO_PRODUTO, QUANTIDADE, VALOR_UNITARIO, VALOR_TOTAL) '+
              'VALUES '+
              '(:ID_PEDIDO, :PRODUTO, :QUANTIDADE, :VALOR, :VALOR_TOTAL)')
            .Params('ID_PEDIDO', FPedidosItens.IdPedido)
            .Params('PRODUTO', FPedidosItens.Produto)
            .Params('QUANTIDADE', FPedidosItens.Quantidade)
            .Params('VALOR', FPedidosItens.Valor)
            .Params('VALOR_TOTAL', FPedidosItens.ValorTotal)
         .ExecSQL;
   except on e:Exception do
      raise Exception.Create('Error ao tentar inserir o registro: '+e.Message);
   end;
end;

function TDAOPedidosItens.Listar: iDAOEntity<TPedidosItens>;
begin
   Result := Self;
   FDataSet :=
     FConexao
        .SQL('SELECT * FROM PED_ITENS INNER JOIN PRODUTOS ON CODIGO = CODIGO_PRODUTO '+
             'WHERE NUMERO_PEDIDO = :ID_PEDIDO')
           .Params('ID_PEDIDO', FPedidosItens.IdPedido)
        .Open.DataSet;
end;

function TDAOPedidosItens.ListarPorId(Id: Variant): iDAOEntity<TPedidosItens>;
begin
   Result := Self;
   FDataSet :=
      FConexao
         .SQL('SELECT * FROM PED_ITENS WHERE AUTO_INCREM = :ID')
            .Params('ID', Id)
         .Open.DataSet;
end;

class function TDAOPedidosItens.New: iDAOEntity<TPedidosItens>;
begin
   Result := Self.Create;
end;

function TDAOPedidosItens.This: TPedidosItens;
begin
   Result := FPedidosItens;
end;

end.
