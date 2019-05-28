unit uFramework;

interface

type
  //Singleton
  TConexao = class
  strict private
    class var FInstance: TConexao;
  public
    class function GetInstance(): TConexao;
  end;

implementation

{ TConexao }
class function TConexao.GetInstance: TConexao;
begin
  if FInstance = nil then
    FInstance:= TConexao.Create();
    result:= FInstance;
end;

end.
