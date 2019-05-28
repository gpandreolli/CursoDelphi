unit uFramework;

interface

type
  //Handler
  TAutenticacao = class abstract
  strict protected
    FAutenticacao: TAutenticacao;
  public
    procedure SetSucesssor(ASucessor: TAutenticacao);
    procedure Autenticar(AUsuario, ASenha: string); virtual; abstract;

  end;

  //Concrete Handler
  TAutenticacaoBD = class(TAutenticacao)
    procedure Autenticar(AUsuario, ASenha: string); override;
  end;

   //Concrete Handler
  TAutenticacaoWebService = class(TAutenticacao)
    procedure Autenticar(AUsuario, ASenha: string); override;
  end;

   //Concrete Handler
  TAutenticacaoForm = class(TAutenticacao)
    procedure Autenticar(AUsuario, ASenha: string); override;
  end;


implementation

{ TAutenticacaoBD }
procedure TAutenticacaoBD.Autenticar(AUsuario, ASenha: string);
begin
  Writeln('Usuario autenticado no BD');
end;


{ TAutenticacaoWebService }
procedure TAutenticacaoWebService.Autenticar(AUsuario, ASenha: string);
begin
   Writeln('Usuario autenticado no WebSerivce');
end;



{ TAutenticacaoForm }
procedure TAutenticacaoForm.Autenticar(AUsuario, ASenha: string);
begin
  WriteLn('Usuario autenticado no formulario de Login')

end;

{ TAutenticacao }

procedure TAutenticacao.SetSucesssor(ASucessor: TAutenticacao);
begin
  FAutenticacao:= ASucessor;
end;

end.
