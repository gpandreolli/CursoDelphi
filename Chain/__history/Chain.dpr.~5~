program Chain;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  uFramework in 'uFramework.pas';

var
  frm, ws,bd: TAutenticacao;

begin
  //cria os handlers
  frm:= TAutenticacaoForm.Create();
  ws:= TAutenticacaoWebService.Create();
  bd:= TAutenticacaoBD.Create();

  //monta a cadeia
  frm.SetSucesssor(ws);
  ws.SetSucesssor(bd);

  //inicia a cadeia
  frm.Autenticar('GUINTER','123456');
  ReadLn;


end.
