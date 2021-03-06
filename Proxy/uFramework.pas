unit uFramework;

interface

type
  //subject
  TQuery = class abstract
    procedure Exec(ASQL: string);virtual;abstract;
  end;
   //real subject
  TDBXQuery = class (TQuery)
    procedure Exec(ASQL: string); override;
  end;
  //real subject
  TFDQuery = class (TQuery)
    procedure Exec(ASQL: string); override;
  end;

  //proxy
  TProxyQuery = class(TQuery)
  strict private
    Fquery: TQuery;
  public
    procedure Exec(ASQL: string); override;
  end;

implementation

{ TDBXQuery }

procedure TDBXQuery.Exec(ASQL: string);
begin
  WriteLn('Executando SQL no DBX: ' + ASQL);
end;

{ TFDQuery }

procedure TFDQuery.Exec(ASQL: string);
begin
  Writeln('Executando Sql no FireDAC '+ ASQL);
end;

{ TProxyQuery }

procedure TProxyQuery.Exec(ASQL: string);
begin
  //delegação polimórfica de caixa preta
  if FQuery = nil then
    FQuery:= TFDQuery.Create();

  FQuery.Exec(ASQL);
end;

end.
