unit uFramework;

interface

type
  // Abstract Produtcs
  TConnection = class abstract
    procedure Open();virtual;abstract;
  end;

  TQuery = class abstract
    procedure Exec(ASQL: string);virtual;abstract;
  end;


  //Familia DBExpress

  //Concrete Product
  TDBXConnection = class(TConnection)
    procedure Open(); override;
  end;
  //Concrete Product
  TDBXQuery = class(TQuery)
    procedure Exec(ASQL: string); override;
  end;

  //Familia ADO

  //Concrete Product
  TADOConnection = class(TConnection)
    procedure Open(); override;
  end;
  //Concrete Product
  TADOQuery = class(TQuery)
    procedure Exec(ASQL: string);override;
  end;
  //**************************************//
  //Abstract Factory
  TDBFactory = class abstract
    function CreateConnection(): TConnection; virtual; abstract;
    function CreateQuery(): TQuery; virtual; abstract;
  end;
  //Concrete Factory
  TDBXFactory = class(TDBFactory)
    function CreateConnection(): TConnection; override;
    function CreateQuery(): TQuery;  override;
  end;

   //Concrete Factory
  TADOFactory = class(TDBFactory)
    function CreateConnection(): TConnection; override;
    function CreateQuery(): TQuery;  override;
  end;








implementation

{ TDBXConnection }
procedure TDBXConnection.Open;
begin
  WriteLn('aberta conexao DBX')
end;

{ TDBXQuery }
procedure TDBXQuery.Exec(ASQL: string);
begin
  WriteLn('executado Sql no DBX'+ ASQL);
end;

{ TADOConnection }

procedure TADOConnection.Open;
begin
    WriteLn('aberta conexao ADO')
end;

{ TADOQuery }

procedure TADOQuery.Exec(ASQL: string);
begin
    WriteLn('executado Sql no ADO'+ ASQL);
end;

{ TDBXFactory }

function TDBXFactory.CreateConnection: TConnection;
begin
  result := TDBXConnection.Create();
end;

function TDBXFactory.CreateQuery: TQuery;
begin
  result := TDBXQuery.Create();
end;

{ TADOFactory }

function TADOFactory.CreateConnection: TConnection;
begin
  result := TADOConnection.Create();
end;

function TADOFactory.CreateQuery: TQuery;
begin
  result := TADOQuery.Create();
end;

end.
