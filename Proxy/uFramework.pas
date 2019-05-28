unit uFramework;

interface

type
  TDBXQuery = class
    procedure Exec(ASQL: string);
  end;
  TFDQuery = class
    procedure Exec(ASQL: string);
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

end.
