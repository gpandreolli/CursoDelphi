unit uFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, uCalculo,uLog;

type
  TTFrmPrincipal = class(TForm, ILog)
    btnCalcular: TButton;
    mmLog: TMemo;
    procedure btnCalcularClick(Sender: TObject);
  private
    { Private declarations }
    procedure Gravar(AMensagem: string);
  public
    { Public declarations }
  end;

var
  TFrmPrincipal: TTFrmPrincipal;

implementation

{$R *.dfm}

procedure TTFrmPrincipal.btnCalcularClick(Sender: TObject);
begin
  var calc:= TCalculo.Create(self);//nunca passar nil como parâmetro
  try
    calc.Iniciar();
    calc.Processar();
    calc.Finalizar();
  finally
    calc.Free();
  end;
end;

procedure TTFrmPrincipal.Gravar(AMensagem: string);
begin
  mmLog.Lines.Add(AMensagem);
end;

end.
