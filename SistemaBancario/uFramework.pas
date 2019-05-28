unit uFramework;

interface

type
  TConta = class abstract
    Saldo: double;
    procedure Sacar(AValor:double);virtual;
    procedure Depositar(AValor:double);virtual;

  end;
  TContaCorrente = class(TConta)
    const LIMITE_CHEQUE_ESPECIAL = -800;
    procedure Sacar(AValor:double);override;
  end;

  TContaCartao = class(TConta)
    const LIMITE_CARTAO = -2000;
    procedure Depositar(AValor:double);override;
    procedure Sacar(AValor:double);override;
  end;

  TContaPoupanca = class(TConta)
    procedure Sacar(AValor:double);override;

  end;

  TCliente = class
    Codigo: string;
    Nome: string;
    Conta: TConta;
  end;

  TFabrica = class
    class function CriarConta(ATipo: integer): TConta; static;
  end;

implementation

uses
  System.SysUtils;

{ TConta }

procedure TConta.Depositar(AValor: double);
begin
  Saldo := Saldo + AValor;
end;

procedure TConta.Sacar(AValor: double);
begin
  Saldo := Saldo - AValor;
end;

{ TContaCorrente }

procedure TContaCorrente.Sacar(AValor: double);
begin
  if (Saldo - AValor >=  LIMITE_CHEQUE_ESPECIAL) then
     inherited
  else
    raise Exception.Create('Limite 800');
end;

{ TContaPoupanca }

procedure TContaPoupanca.Sacar(AValor: double);
begin
  if (Saldo - AValor >=  0) then
     inherited
  else
    raise Exception.Create('Não pode ficar negativo');
end;

{ TFabrica }

class function TFabrica.CriarConta(ATipo: integer): TConta;
begin
  case ATipo of
     0: result:= TContaCorrente.Create();
     1: result:= TContaPoupanca.Create();
     2: result:= TContaCartao.Create();
     else
      result:= TContaCorrente.Create();
  end;
end;

{ TContaCartao }

procedure TContaCartao.Depositar(AValor: double);
begin
  raise Exception.Create('Não pode depositar no Cartão');
  //Conta Cartão nao deposita - anula
end;

procedure TContaCartao.Sacar(AValor: double);
begin
  if (Saldo - AValor >=  LIMITE_CARTAO) then
     inherited
  else
    raise Exception.Create('Limtide do Cartão é de R# 2.000,00');   

end;

end.
