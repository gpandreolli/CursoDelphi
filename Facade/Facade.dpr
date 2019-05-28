program Facade;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  uFramework in 'uFramework.pas';


begin

  TSQLHelper.Exec('drop table CLIENTES');
  TSQLHelper.Exec('create table PRODUTOS...');
  ReadLn;
end.
