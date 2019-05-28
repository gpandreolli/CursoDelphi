unit uFramework;

interface

type
  //target
  TQuery = class abstract
    procedure Exec(ASQL: string);virtual;abstract;
  end;

  TDBXQuery = class (TQuery)
    procedure Exec(ASQL: string); override;
  end;

  TFDQuery = class (TQuery)
    procedure Exec(ASQL: string); override;
  end;
  //adaptee
  TRESTQuery = class
    procedure Execute(ACommand: string; AAsync: boolean);
  end;
   //adapater
  TAdapterQuery = class(TQuery)
    strict private
      FQuery: TRESTQuery;
    public
      procedure Exec(ASQL: string);override;
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


{ TRESTQuery }

procedure TRESTQuery.Execute(ACommand: string; AAsync: boolean);
begin
  Writeln('Executando sql no REST'+ ACommand);
end;

{ TAdapterQuery }

procedure TAdapterQuery.Exec(ASQL: string);
begin
  if FQuery = nil then
    FQuery:= TRESTQuery.Create();
  FQuery.Execute(' HTTP '+ASQL,false);
end;

end.
