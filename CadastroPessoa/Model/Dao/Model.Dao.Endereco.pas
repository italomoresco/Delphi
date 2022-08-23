unit Model.Dao.Endereco;

interface

uses
  Model.Dao.Interfaces, Model.Entidades.Endereco, Data.DB, Conexao.Interfaces,
  Conexao.DBGo;

type
  TDAOEndereco = class(TInterfacedObject, iDAOEntity<TEndereco>)
    private
      FEndereco: TEndereco;
      FConexao: iConexao;
      FDataSet: TDataSet;
    public
      constructor Create;
      destructor Destroy; override;
      class function New: iDAOEntity<TEndereco>;
      function Listar: iDAOEntity<TEndereco>;
      function ListarPorId(Id: Variant): iDAOEntity<TEndereco>;
      function Excluir(Id: Integer): iDAOEntity<TEndereco>; overload;
      function Excluir: iDAOEntity<TEndereco>; overload;
      function Atualizar: iDAOEntity<TEndereco>;
      function Inserir: iDAOEntity<TEndereco>;
      function DataSet(DataSource: TDataSource): iDAOEntity<TEndereco>;
      function This: TEndereco;
  end;

implementation

uses
  System.SysUtils;

function TDAOEndereco.Atualizar: iDAOEntity<TEndereco>;
begin
   Result := Self;
   try
      FConexao
         .SQL('UPDATE ENDERECO SET '+
              'CEP = :CEP, ENDERECO = :ENDERECO, '+
              'NUM = :NUM, CIDADE = :CIDADE, ESTADO = :ESTADO '+
              'WHERE ID = :ID')
            .Params('CEP', FEndereco.CEP)
            .Params('ENDERECO', FEndereco.Endereco)
            .Params('NUM', FEndereco.Num)
            .Params('CIDADE', FEndereco.Cidade)
            .Params('ESTADO', FEndereco.Estado)
            .Params('ID', FEndereco.Id)
         .ExecSQL;
   except on e:Exception do
      raise Exception.Create('Error ao tentar atualizar o endere�o: '+e.Message);
   end;
end;

constructor TDAOEndereco.Create;
begin
   FConexao := TModelConexao.New;
   FEndereco := TEndereco.Create(Self);
end;

function TDAOEndereco.DataSet(DataSource: TDataSource): iDAOEntity<TEndereco>;
begin
   Result := Self;
   if not Assigned(FDataSet) then
      DataSource.DataSet := FConexao.DataSet
   else
      DataSource.DataSet := FDataSet;
end;

destructor TDAOEndereco.Destroy;
begin
   FEndereco.DisposeOf;

  inherited;
end;

function TDAOEndereco.Excluir: iDAOEntity<TEndereco>;
begin
   Result := Self;
   try
      FConexao
         .SQL('DELETE FROM ENDERECO WHERE ID = :ID')
            .Params('ID', FEndereco.Id)
         .ExecSQL;
   except on e:Exception do
      raise Exception.Create('Error ao tentar excluir o endere�o: '+e.Message);
   end;
end;

function TDAOEndereco.Excluir(Id: Integer): iDAOEntity<TEndereco>;
begin
   Result := Self;
   try
      FConexao
         .SQL('DELETE FROM ENDERECO WHERE ID = :ID')
            .Params('ID', Id)
         .ExecSQL;
   except on e:Exception do
      raise Exception.Create('Error ao tentar excluir o endere�o: '+e.Message);
   end;
end;

function TDAOEndereco.Inserir: iDAOEntity<TEndereco>;
begin
   Result := Self;
   try
      FConexao
         .SQL('INSERT INTO ENDERECO '+
              '(ID_PESSOA, CEP, ENDERECO, NUM, CIDADE, ESTADO) '+
              'VALUES '+
              '(:IDPESSOA, :CEP, :ENDERECO, :NUM, :CIDADE, :ESTADO)')
            .Params('IDPESSOA', FEndereco.IdPessoa)
            .Params('CEP', FEndereco.CEP)
            .Params('ENDERECO', FEndereco.Endereco)
            .Params('NUM', FEndereco.Num)
            .Params('CIDADE', FEndereco.Cidade)
            .Params('ESTADO', FEndereco.Estado)
         .ExecSQL;
   except on e:Exception do
      raise Exception.Create('Error ao tentar inserir o endere�o: '+e.Message);
   end;
end;

function TDAOEndereco.Listar: iDAOEntity<TEndereco>;
begin
   Result := Self;
   FDataSet :=
     FConexao
        .SQL('SELECT * FROM ENDERECO '+
             'WHERE ID_PESSOA = :IDPESSOA')
           .Params('IDPESSOA', FEndereco.IdPessoa)
        .Open.DataSet;
end;

function TDAOEndereco.ListarPorId(Id: Variant): iDAOEntity<TEndereco>;
begin
   Result := Self;
   FDataSet :=
      FConexao
         .SQL('SELECT * FROM ENDERECO WHERE ID = :ID')
            .Params('ID', Id)
         .Open.DataSet;
end;

class function TDAOEndereco.New: iDAOEntity<TEndereco>;
begin
   Result := Self.Create;
end;

function TDAOEndereco.This: TEndereco;
begin
   Result := FEndereco;
end;

end.
