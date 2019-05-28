program Interfaces;

uses
  Vcl.Forms,
  uFrmPrincipal in 'uFrmPrincipal.pas' {TFrmPrincipal},
  uCalculo in 'uCalculo.pas',
  uLog in 'uLog.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TTFrmPrincipal, TFrmPrincipal);
  Application.Run;
end.
