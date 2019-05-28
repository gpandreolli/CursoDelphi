program AbstractFactory;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  uFramework in 'uFramework.pas';

var
  con: TConnection;
  qry: TQuery;
  fab: TDBFactory;

begin
  fab := TADOFactory.Create();//ler de um INI, XMl..
  con:= fab.CreateConnection();
  con.Open();
  qry:= fab.CreateQuery();
  qry.Exec('Select * from PRODUTOS');
  ReadLn;
end.
