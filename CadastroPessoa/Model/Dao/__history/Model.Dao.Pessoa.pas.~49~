unit Model.Dao.Pessoa;

interface

uses
  Model.Dao.Interfaces, Model.Entidades.Pessoa, Data.DB, Conexao.Interfaces,
  Conexao.Firedac, Vcl.Dialogs;

type
  TDAOPessoa = class(TInterfacedObject, iDAOEntity<TPessoa>)
    private
      FPessoa: TPessoa;
      FConexao: iConexao;
      FDataSet: TDataSet;
    public
      constructor Create;
      destructor Destroy; override;
      class function New: iDAOEntity<TPessoa>;
      function Listar: iDAOEntity<TPessoa>;
      function ListarPorId(Id: Variant): iDAOEntity<TPessoa>;
      function Excluir(Id: Integer): iDAOEntity<TPessoa>; overload;
      function Excluir: iDAOEntity<TPessoa>; overload;
      function Atualizar: iDAOEntity<TPessoa>;
      function Inserir: iDAOEntity<TPessoa>;
      function DataSet(DataSource: TDataSource): iDAOEntity<TPessoa>;
      function This: TPessoa;
  end;

implementation

uses
  System.SysUtils;

function TDAOPessoa.Atualizar: iDAOEntity<TPessoa>;
begin
   Result := Self;
   try
      FConexao
         .SQL('UPDATE CLIENTES SET NOME = :NOME, '+
              'CIDADE = :CIDADE, UF = :ESTADO'+
              'WHERE CODIGO = :ID')
         .Params('NOME', FPessoa.Nome)
         .Params('CIDADE', FPessoa.Cidade)
         .Params('ESTADO', FPessoa.Estado)
         .Params('ID', FPessoa.Id)
         .ExecSQL;
      MessageDlg('Pessoa Atualizada!', mtInformation, [mbOK], 0);
   except on e:Exception do
      raise Exception.Create('Error ao tentar atualizar o resgistro: '+e.Message);
   end;
end;

constructor TDAOPessoa.Create;
begin
   FConexao := TModelConexao.New;
   FPessoa := TPessoa.Create(Self);
end;

function TDAOPessoa.DataSet(DataSource: TDataSource): iDAOEntity<TPessoa>;
begin
   Result := Self;
   if not Assigned(FDataSet) then
      DataSource.DataSet := FConexao.DataSet
   else
      DataSource.DataSet := FDataSet;
end;

destructor TDAOPessoa.Destroy;
begin
   FPessoa.DisposeOf;

  inherited;
end;

function TDAOPessoa.Excluir: iDAOEntity<TPessoa>;
begin
   Result := Self;
   try
      FConexao
         .SQL('DELETE FROM CLIENTES WHERE CODIGO = :ID')
         .Params('ID', FPessoa.Id)
         .ExecSQL;
      MessageDlg('Pessoa Excluída!', mtInformation, [mbOK], 0);
   except on e:Exception do
      raise Exception.Create('Error ao tentar exluir o registro: '+e.Message);
   end;
end;

function TDAOPessoa.Excluir(Id: Integer): iDAOEntity<TPessoa>;
begin
   Result := Self;
   try
      FConexao
         .SQL('DELETE FROM CLIENTES WHERE CODIGO = :ID')
         .Params('ID', Id)
         .ExecSQL;
      MessageDlg('Pessoa Excluída!', mtInformation, [mbOK], 0);
   except on e:Exception do
      raise Exception.Create('Error ao tentar exluir o registro: '+e.Message);
   end;
end;

function TDAOPessoa.Inserir: iDAOEntity<TPessoa>;
begin
   Result := Self;
   try
      FConexao
        .SQL('INSERT INTO CLIENTES (NOME, CIDADE, UF) VALUES (:NOME, :CIDADE, :ESTADO)')
           .Params('NOME', FPessoa.Nome)
           .Params('CIDADE', FPessoa.Cidade)
           .Params('ESTADO', FPessoa.Estado)
        .ExecSQL;
      MessageDlg('Pessoa Cadastrada!', mtInformation, [mbOK], 0);
   except on e:Exception do
      raise Exception.Create('Erro ao tentar inserir os dados: '+ e.Message);
   end;
end;

function TDAOPessoa.Listar: iDAOEntity<TPessoa>;
begin
   Result := Self;
   FDataSet :=
      FConexao
         .SQL('SELECT * FROM CLIENTES')
         .Open
         .DataSet;
end;

function TDAOPessoa.ListarPorId(Id: Variant): iDAOEntity<TPessoa>;
begin
   Result := Self;
   FDataSet :=
      FConexao
         .SQL('SELECT * FROM CLIENTES WHERE CODIGO = :ID')
         .Params('ID', FPessoa.Id)
         .Open
         .DataSet;
end;

class function TDAOPessoa.New: iDAOEntity<TPessoa>;
begin
   Result := Self.Create;
end;

function TDAOPessoa.This: TPessoa;
begin
   Result := FPessoa;
end;

end.
