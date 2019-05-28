unit uFramework;

interface

type
  TCorrecao = class abstract
  strict protected
    procedure Ler(); virtual;abstract;
    procedure Corrigir();virtual;abstract;
    procedure EnviarBD();virtual;abstract;
  public
    procedure Processar();
  end;


  TCorrecaoProva = class(TCorrecao)
  strict protected
    procedure Ler(); override;
    procedure Corrigir(); override;
    procedure EnviarBD(); override;
  end;

  TCorrecaoRedacao = class (TCorrecao)
  strict protected
    procedure Ler(); override;
    procedure Corrigir();override;
    procedure EnviarBD(); override;
  end;

implementation

{ TCorrecaoProva }
procedure TCorrecaoProva.Corrigir;
begin
  WriteLn('Corrigindo Prova');
end;

procedure TCorrecaoProva.EnviarBD;
begin
  WriteLn('Enviando respostas das provas para o BD');
end;

procedure TCorrecaoProva.Ler;
begin
  WriteLn('Lendo Arquivo TXT da Prova');
end;

{ TCorrecaoRedacao }
procedure TCorrecaoRedacao.Corrigir;
begin
     WriteLn('Corrigindo Redação');
end;

procedure TCorrecaoRedacao.EnviarBD;
begin
    WriteLn('Enviando respostas das redação para o BD');
end;

procedure TCorrecaoRedacao.Ler;
begin
      WriteLn('Lendo Arquivo TXT da REdação');
end;

{ TCorrecao }

procedure TCorrecao.Processar;
begin
  Ler();
  Corrigir();
  EnviarBD();
end;

end.
