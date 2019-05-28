program Chain;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  uFramework in 'uFramework.pas';

var
  frm, ws,bd: TAutenticacao;

begin
  frm:= TAutenticacaoForm.Create();
  frm.SetSucesssor(ws);
  ws:= TAutenticacaoWebService.Create();
  ws.SetSucesssor(bd);
  bd:= TAutenticacaoBD.Create();
  frm.Autenticar('GUINTER','123456');
  ReadLn;


end.
