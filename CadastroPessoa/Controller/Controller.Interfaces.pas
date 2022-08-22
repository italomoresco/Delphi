unit Controller.Interfaces;

interface

uses
  Model.DAO.Interfaces, Model.Entidades.Pessoa, Model.Entidades.Endereco;

type
  iControleEntidades = interface;
  iControle = interface
    function Entidades: iControleEntidades;
  end;

  iControleEntidades = interface
    function Pessoa: iDAOEntity<TPessoa>;
    function Endereco: iDAOEntity<TEndereco>;
  end;

implementation

end.
