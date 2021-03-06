unit uFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,uFramework;

type
  TFrmPrincipal = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    lblSaldo: TLabel;
    Label4: TLabel;
    edtCodigo: TEdit;
    edtValor: TEdit;
    edtNome: TEdit;
    btnAbrirConta: TButton;
    btnSacar: TButton;
    btnDepositar: TButton;
    btnSaldo: TButton;
    Label3: TLabel;
    boxTipoConta: TComboBox;
    procedure btnAbrirContaClick(Sender: TObject);
    procedure btnSacarClick(Sender: TObject);
    procedure btnDepositarClick(Sender: TObject);
    procedure btnSaldoClick(Sender: TObject);
  private
    Cliente: TCliente;
    function GetValor(): double;
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.dfm}

procedure TFrmPrincipal.btnAbrirContaClick(Sender: TObject);
begin
     Cliente := TCliente.Create();
     Cliente.Codigo:= edtCodigo.Text;
     Cliente.Nome:= edtNome.Text;
     if Cliente.Conta <> nil then
      Cliente.Conta.Free;
     Cliente.Conta:= TFabrica.CriarConta(boxTipoConta.ItemIndex);
end;

procedure TFrmPrincipal.btnDepositarClick(Sender: TObject);

begin
  Cliente.Conta.Depositar(GetValor());
end;

procedure TFrmPrincipal.btnSacarClick(Sender: TObject);

begin
  Cliente.Conta.Sacar(GetValor());
end;

procedure TFrmPrincipal.btnSaldoClick(Sender: TObject);
begin
  lblSaldo.Caption := Cliente.Conta.Saldo.ToString();
end;

function TFrmPrincipal.GetValor: double;
begin
  result:= StrToFloat(edtValor.Text);
end;

end.
