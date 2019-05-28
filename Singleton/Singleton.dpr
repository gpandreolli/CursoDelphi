program Singleton;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  uFramework in 'uFramework.pas';

var
  con1, con2: TConexao;

begin
  con1:= TConexao.GetInstance();
  con2:= TConexao.GetInstance();
  if con1 = con2 then
    WriteLn('S�o a mesma inst�ncia');
  WriteLn('con1 = ' + con1.GetHashCode().ToString());
  WriteLn('con2 = ' + con2.GetHashCode().ToString());
  ReadLn;

end.
