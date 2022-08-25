unit uspQuery;

interface

uses
  System.Classes, FireDAC.Comp.Client, FireDac.DApt, System.SysUtils;

  type
    TspQuery = class(TFDQuery)
  private
    FspColunas: TStringList;
    FspTabelas: TStringList;
    FspCondicoes: TStringList;
    procedure SetspColunas(const Value: TStringList);
    procedure SetspTabelas(const Value: TStringList);
    procedure SetspCondicoes(const Value: TStringList);
    procedure MontaSelect(Query: TStringList);
    procedure MontaFrom(Query: TStringList);
    procedure MontaWhere(Query: TStringList);
  public
    function GeraSQL: TStringList;
  published
    property spColunas: TStringList read FspColunas write SetspColunas;
    property spTabelas: TStringList read FspTabelas write SetspTabelas;
    property spCondicoes: TStringList read FspCondicoes write SetspCondicoes;
  end;

implementation

{ TspQuery }

function TspQuery.GeraSQL: TStringList;
var
   spSQL: TStringList;
begin
   spSQL := TStringList.Create;

   MontaSelect(spSql);
   MontaFrom(spSql);
   MontaWhere(spSql);

   Result := spSQL;
end;

procedure TspQuery.MontaFrom(Query: TStringList);
var
   vTabela: string;
begin
   Query.Add('FROM');
   for vTabela in spTabelas do
      Query.add('  ' + vTabela);
end;

procedure TspQuery.MontaSelect(Query: TStringList);
var
   vColuna: string;
begin
   Query.add('SELECT');

   if spColunas.Count = 0 then
      Query.add(' *');

   for vColuna in spColunas do
   begin
      if Query.Count = 1 then
         Query.add('  ' + vColuna)
      else
         Query.add(' ,' + vColuna);
   end;
end;

procedure TspQuery.MontaWhere(Query: TStringList);
var
  vCondicao: String;
begin
   if spCondicoes.Count > 0 then
      Query.add('WHERE 1=1 ');

   for vCondicao in spCondicoes do
      Query.add(' AND ' + vCondicao);
end;

procedure TspQuery.SetspColunas(const Value: TStringList);
begin
   FspColunas := Value;
end;

procedure TspQuery.SetspCondicoes(const Value: TStringList);
begin
   FspCondicoes := Value;
end;

procedure TspQuery.SetspTabelas(const Value: TStringList);
begin
   if Value.Count > 1 then
      raise Exception.Create('Quantidade de tabelas maior que 1!');

   if Value.Count = 0 then
      raise Exception.Create('Nenhuma tabela selecionada!');

   FspTabelas := Value;
end;

end.
