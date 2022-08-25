unit Conexao.DBGo;

interface

uses
  Data.Win.ADODB, Conexao.Interfaces, Data.DB, SysUtils, Forms;

type
  TModelConexao = class(TInterfacedObject, iConexao)
    private
      FConexao: TADOConnection;
      FQuery: TADOQuery;
    public
      constructor Create;
      destructor Destroy; override;
      class function New: iConexao;
      function Params(Param: String; Value: Variant): iConexao; overload;
      function DataSet(DataSource: TDataSource): iConexao; overload;
      function DataSet: TDataSet; overload;
      function ExecSQL: iConexao;
      function Open: iConexao;
      function SQL(Value: String): iConexao;
  end;

implementation

function TModelConexao.Params(Param: String; Value: Variant): iConexao;
begin
   Result := Self;
   FQuery.Parameters.ParamByName(Param).Value := Value;
end;

constructor TModelConexao.Create;
begin
   FConexao := TADOConnection.Create(nil);
   FConexao.ConnectionString := 'Provider=SQLNCLI10.1;Integrated Security=SSPI;Persist Security Info=False;User ID="";Initial Catalog=DADOS01;Data Source=DESKTOP-EMUMF8N\SQLEXPRESS;Initial File Name="";Server SPN=sa;';
   FConexao.LoginPrompt := False;

   FQuery := TADOQuery.Create(nil);
   FQuery.Connection := FConexao;

   FConexao.Connected := True;
end;

function TModelConexao.DataSet(DataSource: TDataSource): iConexao;
begin
   Result := Self;
   DataSource.DataSet := FQuery;
end;

function TModelConexao.DataSet: TDataSet;
begin
   Result := FQuery;
end;

destructor TModelConexao.Destroy;
begin
   FConexao.DisposeOf;
   FQuery.DisposeOf;

  inherited;
end;

function TModelConexao.ExecSQL: iConexao;
begin
   Result := Self;
   FQuery.ExecSQL;
end;

class function TModelConexao.New: iConexao;
begin
   Result := Self.Create;
end;

function TModelConexao.Open: iConexao;
begin
   Result := Self;
   FQuery.Open;
end;

function TModelConexao.SQL(Value: String): iConexao;
begin
   Result := Self;
   FQuery.SQL.Clear;
   FQuery.SQL.Add(Value);
end;

end.