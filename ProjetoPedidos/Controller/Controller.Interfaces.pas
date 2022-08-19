unit Controller.Interfaces;

interface

uses
  Model.DAO.Interfaces, Model.Entidades.PedidosItens, Model.Entidades.Pedidos,
  Model.Entidades.Produto, Model.Entidades.Pessoa;

type
  iControleEntidades = interface;
  iControle = interface
    function Entidades: iControleEntidades;
  end;

  iControleEntidades = interface
    function Pedidos: iDAOEntity<TPedidos>;
    function PedidosItens: iDAOEntity<TPedidosItens>;
    function Produto: iDAOEntity<TProduto>;
    function Pessoa: iDAOEntity<TPessoa>;
  end;

implementation

end.
