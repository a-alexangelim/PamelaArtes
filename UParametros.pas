unit UParametros;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmParametro = class(TForm)
    GroupBox1: TGroupBox;
    edtValorHora: TEdit;
    GBInternet: TGroupBox;
    edtValorInternet: TEdit;
    chkInternet: TCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure chkInternetClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParametro: TfrmParametro;

implementation

{$R *.dfm}
  uses
    UPrincipal;

procedure TfrmParametro.chkInternetClick(Sender: TObject);
begin
  edtValorInternet.Enabled := chkInternet.Checked;

  if chkInternet.Checked then
  begin
    edtValorInternet.SetFocus;
  end
  else
  begin
    edtValorInternet.Clear;
  end;
end;

procedure TfrmParametro.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
