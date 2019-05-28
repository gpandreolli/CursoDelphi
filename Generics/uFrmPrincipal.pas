unit uFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TFrmPrincipal = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Trocar(var x,y: integer);overload;
    procedure Trocar(var x,y: string);overload;
    procedure Swap<T>(var x,y: T);
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.dfm}

procedure TFrmPrincipal.Button1Click(Sender: TObject);
begin
  var x:= '10a';
  var y:= '20b';
  Swap<string>(x,y);
  ShowMessage(x);
  ShowMessage(y);
end;

procedure TFrmPrincipal.Trocar(var x, y: integer);
var
  aux: integer;
begin
  aux:= x;
  x:= y;
  y:= aux;
end;

procedure TFrmPrincipal.Swap<T>(var x, y: T);
var
  aux: T;
begin
  aux:= x;
  x:= y;
  y:= aux;

end;

procedure TFrmPrincipal.Trocar(var x, y: string);
var
  aux: string;
begin
  aux:= x;
  x:= y;
  y:= aux;

end;

end.
