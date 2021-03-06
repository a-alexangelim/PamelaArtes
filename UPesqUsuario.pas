unit UPesqUsuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmPesqUsuario = class(TForm)
    Panel2: TPanel;
    btNovo: TSpeedButton;
    btAlterar: TSpeedButton;
    btRetornar: TSpeedButton;
    Panel1: TPanel;
    btPesquisa: TSpeedButton;
    GroupBox1: TGroupBox;
    edtCodigo: TEdit;
    GroupBox2: TGroupBox;
    edtNome: TEdit;
    DBGUsuario: TDBGrid;
    FDQUsuario: TFDQuery;
    DSUsuario: TDataSource;
    FDQUsuarioid: TIntegerField;
    FDQUsuarionome: TWideStringField;
    FDQUsuariosenha: TWideStringField;
    FDQUsuariousuario: TWideStringField;
    btExcluir: TSpeedButton;
    procedure btPesquisaClick(Sender: TObject);
    procedure edtNomeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btRetornarClick(Sender: TObject);
    procedure btNovoClick(Sender: TObject);
    procedure btAlterarClick(Sender: TObject);
    procedure DBGUsuarioDblClick(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
  private
    { Private declarations }
    procedure excluirUsuario();
    function gridVazio(): Boolean;
  public
    { Public declarations }
  end;

var
  frmPesqUsuario: TfrmPesqUsuario;

implementation

{$R *.dfm}
  uses
    UDmDados, UPrincipal, UCadUsuario;

procedure TfrmPesqUsuario.btPesquisaClick(Sender: TObject);
  var
    SQL : String;
begin
  FDQUsuario.SQL.Clear;

  SQL := 'SELECT *' +
         '  FROM USUARIO ' +
         ' WHERE 1 = 1';

  if Trim(edtCodigo.Text) <> '' then
  begin
    SQL := SQL + ' AND ID = ' + edtCodigo.Text;
  end;

  if Trim(edtNome.Text) <> '' then
  begin
    SQL := SQL + ' AND UPPER(NOME) LIKE ' + QuotedStr('%' + UpperCase(edtNome.Text) + '%');
  end;

  SQL := SQL + ' ORDER BY ID';

  FDQUsuario.SQL.Add(SQL);
  FDQUsuario.Open;

  if FDQUsuario.IsEmpty then
    Application.MessageBox('Nenhum registro encontrado' , 'P?mela Artes' , MB_ICONINFORMATION);

end;

procedure TfrmPesqUsuario.DBGUsuarioDblClick(Sender: TObject);
begin
  btAlterar.Click;
end;

procedure TfrmPesqUsuario.edtCodigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_Return then
    btPesquisa.Click;
end;

procedure TfrmPesqUsuario.edtNomeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_Return then
    btPesquisa.Click;
end;

procedure TfrmPesqUsuario.excluirUsuario;
begin
  try
    FDQUsuario.Delete;
    Application.MessageBox('Usu?rio exlcu?do com sucesso!', 'P?mela Artes', MB_ICONINFORMATION);
  except on e: exception do
    begin
     ShowMessage(e.Message);
    end;
  end;
end;

procedure TfrmPesqUsuario.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmPesqUsuario := nil;
 Action := caFree;
end;

function TfrmPesqUsuario.gridVazio: Boolean;
begin
  Result := False;

  if (FDQUsuario.IsEmpty) or (FDQUsuario.State in [dsInactive]) then
    Result := True;
end;

procedure TfrmPesqUsuario.btExcluirClick(Sender: TObject);
  var
    sUsuario : String;
begin
  if gridVazio() then
    Application.MessageBox('Nenhum registro dispon?vel!', 'P?mela Artes', MB_ICONWARNING)
  else
  begin
    sUsuario := FDQUsuario.FieldByName('nome').AsString;

    if Application.MessageBox(PChar('Deseja realmente excluir o usu?rio ' + sUsuario + ' ?'), 'P?mela Artes', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) = ID_YES then
      excluirUsuario;
  end;
end;

procedure TfrmPesqUsuario.btNovoClick(Sender: TObject);
begin
  if frmCadUsuario = nil then
    Application.CreateForm(TFrmCadUsuario, frmCadUsuario);
  frmCadUsuario.Show;
end;

procedure TfrmPesqUsuario.btAlterarClick(Sender: TObject);
begin
  if gridVazio() then
  begin
    Application.MessageBox('Nenhum registro dispon?vel', 'P?mela Artes', MB_ICONWARNING);
  end
  else
    begin
    if frmCadUsuario = nil then
      Application.CreateForm(TfrmCadUsuario, frmCadUsuario);

    with frmCadUsuario do
    begin
      edtCodigo.Text := frmPesqUsuario.FDQUsuario.FieldByName('id').AsString;
      edtNome.Text := frmPesqUsuario.FDQUsuario.FieldByName('nome').AsString;
      edtUsuario.Text := frmPesqUsuario.FDQUsuario.FieldByName('usuario').AsString;
      edtSenha.Text := frmPesqUsuario.FDQUsuario.FieldByName('senha').AsString;
      Show();
    end;
  end;
end;

procedure TfrmPesqUsuario.btRetornarClick(Sender: TObject);
begin
  Close;
end;

end.
