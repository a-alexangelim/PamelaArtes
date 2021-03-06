program PamelaArtes;

uses
  Vcl.Forms,
  Ulogin in 'Ulogin.pas' {frmLogin},
  Udmdados in 'Udmdados.pas' {dmDados: TDataModule},
  UPrincipal in 'UPrincipal.pas' {frmPrincipal},
  UPesqCliente in 'UPesqCliente.pas' {frmPesqCliente},
  UCadCliente in 'UCadCliente.pas' {frmCadCliente},
  Vcl.Themes,
  Vcl.Styles,
  UParametros in 'UParametros.pas' {frmParametro},
  UPesqUsuario in 'UPesqUsuario.pas' {frmPesqUsuario},
  UCadUsuario in 'UCadUsuario.pas' {frmCadUsuario},
  UCadEnderecoCliente in 'UCadEnderecoCliente.pas' {frmCadEnderecoCliente},
  UPesqProduto in 'UPesqProduto.pas' {frmPesqProduto},
  UCadProduto in 'UCadProduto.pas' {frmCadProduto};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Light');
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TdmDados, dmDados);
  Application.Run;
end.
