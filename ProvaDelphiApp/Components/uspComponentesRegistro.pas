unit uspComponentesRegistro;

interface

uses
  System.Classes, uspQuery;

procedure Register;

type
  TspQueryDT = class(TspQuery)
  end;

implementation

procedure Register;
begin
   RegisterComponents('spComponentes', [TspQuery]);
end;

end.
