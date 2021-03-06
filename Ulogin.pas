unit Ulogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, dxGDIPlusClasses,
  Vcl.ExtCtrls;

type
  TfrmLogin = class(TForm)
    Image1: TImage;
    edtUsuario: TEdit;
    lbUsuario: TLabel;
    lbSenha: TLabel;
    edtSenha: TEdit;
    btAcessar: TButton;
    btSair: TButton;
    procedure btAcessarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}
  uses
    UdmDados, UPrincipal;

function chamarTelaPrincipal() : boolean;
begin
  Result := False;

  try
    Application.CreateForm(TdmDados, dmDados);

    with dmDados, frmLogin do
    begin
      FDQlogin.ParamByName('usuario').AsString := edtUsuario.Text;
      FDQlogin.ParamByName('senha').AsString := edtSenha.Text;

      FDQlogin.Open;

      if FDQlogin.IsEmpty then
      begin
        Application.MessageBox('Usu?rio ou senha inv?lido!', 'P?mela Artes', MB_ICONWARNING);
      end
      else
      begin
        Application.CreateForm(TfrmPrincipal, frmPrincipal);

        with frmPrincipal do
        begin
          Pointer((@Application.MainForm)^) := frmPrincipal;
          Usuario := UpperCase(dmDados.FDQlogin.FieldByName('nome').AsString);
          lbDataAtual.Caption := 'Data: ' + DateToStr(Now);
          ShowModal();
          Result := True;
        end;
      end;
    end;

  except on e: exception do
    begin
     ShowMessage(e.Message);
    end;

  end;
end;

procedure TfrmLogin.btAcessarClick(Sender: TObject);
begin
  if Trim(edtUsuario.Text) = '' then
  begin
    Application.MessageBox('Informe o usu?rio!', 'P?mela Artes', MB_ICONQUESTION);
    edtUsuario.SetFocus;
    Abort;
  end;

  if Trim(edtSenha.Text) = '' then
  begin
    Application.MessageBox('Informe o senha!', 'P?mela Artes', MB_ICONINFORMATION);
    edtSenha.SetFocus;
    Abort;
  end;

  if chamarTelaPrincipal() then
  begin
    frmLogin.Visible := False;
  end;
end;

procedure TfrmLogin.btSairClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmLogin := nil;
  Action := caFree;
end;

procedure TfrmLogin.FormShow(Sender: TObject);
begin
  edtUsuario.SetFocus;
end;

end.
