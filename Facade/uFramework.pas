unit uFramework;

interface

type
  TSQLHelper = class
  strict private
   type
    TIsolationLevel = (ReadCommited, Serial);

    TTransaction = class
      procedure Start();
      procedure Commit();
      procedure Rollback();
    end;

    TSQL = class
      CommandText: string;
    end;

    TConnection = class
      procedure Open(Trans: TTransaction);
    end;

  TQuery = class abstract
    procedure Exec(SQL: TSQL; Con: TConnection);
  end;

  TSQLQuery = class(TQuery)
    procedure Exec(SQL: TSQL; Con: TConnection);
  end;
  public
  class procedure Exec(ASQL: string);static;

end;

implementation

{ TTransaction }

procedure TSQLHelper.TTransaction.Commit;
begin

end;

procedure TSQLHelper.TTransaction.Rollback;
begin

end;

procedure TSQLHelper.TTransaction.Start;
begin

end;

{ TSQLQuery }

procedure TSQLHelper.TSQLQuery.Exec(SQL: TSQL; Con: TConnection);
begin
  Writeln('excecutando' + SQL.CommandText );
end;

{ TSQLHelper }

class procedure TSQLHelper.Exec(ASQL: string);
var
  con: TConnection;
  qry: TSQLQuery;
  il: TIsolationLevel;
  SQL: TSQL;
  CommandText: string;
  trans: TTransaction;

begin
  qry:= TSQLQuery.Create();
  SQL:= TSQL.Create();
  con:= TConnection.Create();
  il:= ReadCommited;
  trans:= Transaction.Create(il)
  trans.Start();
  con.Open(trans);
  qry.Exec(SQL,con);
end;

end.
