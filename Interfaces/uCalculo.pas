unit uCalculo;

interface

uses
  uLog;

type
  TCalculo = class
  strict private
    FLog: ILog;
  public
    procedure Iniciar();
    procedure Processar();
    procedure Finalizar();
    constructor Create(ALog: ILog);
  end;

implementation

{ TCalculo }

constructor TCalculo.Create(ALog: ILog);
begin
  FLog:= ALog;
end;

procedure TCalculo.Finalizar;
begin
  FLog.Gravar('Finalizando...');
end;

procedure TCalculo.Iniciar;
begin
   FLog.Gravar('Iniciando...');
end;

procedure TCalculo.Processar;
begin
  FLog.Gravar('Processando...');
end;

end.
