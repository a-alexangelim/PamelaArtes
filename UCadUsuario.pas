unit UCadUsuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls, Vcl.StdCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TfrmCadUsuario = class(TForm)
    Panel1: TPanel;
    btSalvar: TSpeedButton;
    btRetornar: TSpeedButton;
    Panel2: TPanel;
    GroupBox3: TGroupBox;
    edtNome: TEdit;
    GroupBox1: TGroupBox;
    edtCodigo: TEdit;
    gbUsuario: TGroupBox;
    edtUsuario: TEdit;
    GroupBox2: TGroupBox;
    edtSenha: TEdit;
    FDQCadUsuario: TFDQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btSalvarClick(Sender: TObject);
    procedure btRetornarClick(Sender: TObject);
  private
    { Private declarations }
    procedure inserirUsuario();
    procedure alterarUsuario();
  public
    { Public declarations }
  end;

var
  frmCadUsuario: TfrmCadUsuario;

implementation

{$R *.dfm}
  uses
    UdmDados, UPrincipal;

procedure TfrmCadUsuario.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmCadUsuario := nil;
  Action := caFree;
end;

procedure TfrmCadUsuario.btSalvarClick(Sender: TObject);
begin
  if Trim(edtNome.Text) = '' then
  begin
    Application.MessageBox('Favor informar o nome!', 'P?mela Artes', MB_ICONINFORMATION);
    edtNome.SetFocus;
  end;

  if Trim(edtUsuario.Text) = '' then
  begin
    Application.MessageBox('Favor informar o usu?rio!', 'P?mela Artes', MB_ICONINFORMATION);
    edtUsuario.SetFocus;
  end;

  if Trim(edtSenha.Text) = '' then
  begin
    Application.MessageBox('Favor informar a senha!', 'P?mela Artes', MB_ICONINFORMATION);
    edtSenha.SetFocus;
  end;

  if Trim(edtCodigo.Text) = '' then
    inserirUsuario()
  else
    alterarUsuario();
end;

procedure TfrmCadUsuario.alterarUsuario;
  var
    SQL : String;
begin
  FDQCadUsuario.SQL.Clear;

  SQL := 'UPDATE USUARIO SET NOME = :nome, ' +
         '                   USUARIO = :usuario, ' +
         '                   SENHA = :senha ' +
         ' WHERE ID = :id;';

  FDQCadUsuario.ParamByName('id').AsInteger := StrToInt(edtCodigo.Text);
  FDQCadUsuario.ParamByName('nome').AsString := edtNome.Text;
  FDQCadUsuario.ParamByName('usuario').AsString := edtUsuario.Text;
  FDQCadUsuario.ParamByName('senha').AsString := edtSenha.Text;
  FDQCadUsuario.SQL.Add(SQL);

  try
    FDQCadUsuario.ExecSQL;
    Application.MessageBox('Usu?rio salvo com sucesso!', 'P?mela Artes', MB_ICONINFORMATION);
  except on e: exception do
    begin
     ShowMessage(e.Message);
    end;
  end;
end;

procedure TfrmCadUsuario.btRetornarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadUsuario.inserirUsuario();
  var
    SQL : String;
begin
  FDQCadUsuario.SQL.Clear;
  SQL := 'INSERT INTO USUARIO (NOME, SENHA, USUARIO) ' +
         ' VALUES ' +
         ' (:nome, :senha, :usuario);';


  FDQCadUsuario.ParamByName('nome').AsString := edtNome.Text;
  FDQCadUsuario.ParamByName('senha').AsString := edtSenha.Text;
  FDQCadUsuario.ParamByName('usuario').AsString := edtUsuario.Text;
  FDQCadUsuario.SQL.Add(SQL);

  try
    FDQCadUsuario.ExecSQL;
    Application.MessageBox('Usu?rio salvo com sucesso!', 'P?mela Artes', MB_ICONINFORMATION);
  except on e: exception do
    begin
     ShowMessage(e.Message);
    end;
  end;
end;

end.
