unit UPesqCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.StdCtrls, Vcl.Buttons, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters,
  Vcl.Menus, dxSkinsCore, dxSkinsDefaultPainters, cxButtons;

type
  TfrmPesqCliente = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGCliente: TDBGrid;
    DSCliente: TDataSource;
    FDQCliente: TFDQuery;
    FDQClienteid: TIntegerField;
    FDQClientenome: TWideStringField;
    FDQClientetelefone: TWideStringField;
    FDQClientecelular: TWideStringField;
    FDQClienteemail: TWideStringField;
    GroupBox1: TGroupBox;
    edtCodigo: TEdit;
    GroupBox2: TGroupBox;
    edtNome: TEdit;
    btNovo: TSpeedButton;
    btAlterar: TSpeedButton;
    btRetornar: TSpeedButton;
    btPesquisa: TSpeedButton;
    btExcluir: TSpeedButton;
    procedure btPesquisaClick(Sender: TObject);
    procedure edtCodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtNomeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btNovoClick(Sender: TObject);
    procedure btRetornarClick(Sender: TObject);
    procedure DBGClienteDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btAlterarClick(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
    procedure DBGClienteDblClick(Sender: TObject);
  private
    { Private declarations }
    procedure consultarCliente();
    procedure excluirCliente();
    function gridVazio() : Boolean;
  public
    { Public declarations }
  end;

var
  frmPesqCliente: TfrmPesqCliente;

implementation

{$R *.dfm}
  uses
    UdmDados, UPrincipal, UCadCliente;

procedure TfrmPesqCliente.btPesquisaClick(Sender: TObject);
begin
  consultarCliente();
end;

procedure TfrmPesqCliente.DBGClienteDblClick(Sender: TObject);
begin
  btAlterar.Click;
end;

procedure TfrmPesqCliente.DBGClienteDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  //if Column.Field.Value = 1 then
    //DBGCliente.Canvas.Brush.Color := $00B0FFB0;
  //DBGCliente.DefaultDrawDataCell(Rect, DBGCliente.columns[datacol].field, State);
end;

procedure TfrmPesqCliente.edtCodigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_Return then
    consultarCliente();
end;

procedure TfrmPesqCliente.edtNomeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_Return then
    consultarCliente();
end;

procedure TfrmPesqCliente.excluirCliente;
begin
  try
    FDQCliente.Delete;
    Application.MessageBox('Cliente exlcu?do com sucesso!', 'P?mela Artes', MB_ICONINFORMATION);
  except on e: exception do
    begin
     ShowMessage(e.Message);
    end;
  end;
end;

procedure TfrmPesqCliente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmPesqCliente := nil;
  Action := caFree;
end;

function TfrmPesqCliente.gridVazio: Boolean;
begin
  Result := False;
  if (FDQCliente.IsEmpty) or (FDQCliente.State in [dsInactive]) then
    Result := True;
end;

procedure TfrmPesqCliente.btExcluirClick(Sender: TObject);
var
  sCliente : String;
begin
  if gridVazio() then
    Application.MessageBox('Nenhum registro dispon?vel', 'P?mela Artes', MB_ICONWARNING)
  else
  begin
    sCliente := FDQCliente.FieldByName('nome').AsString;

    if Application.MessageBox(PChar('Deseja realmente excluir o cliente ' + sCliente + ' ?'), 'P?mela Artes', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) = ID_YES then
      excluirCliente;
  end;
end;

procedure TfrmPesqCliente.btNovoClick(Sender: TObject);
begin
  if frmCadCliente = nil then
    Application.CreateForm(TfrmCadCliente, frmCadCliente);
  frmCadCliente.Show();
end;

procedure TfrmPesqCliente.btAlterarClick(Sender: TObject);
begin
  if gridVazio() then
  begin
    Application.MessageBox('Nenhum registro dispon?vel', 'P?mela Artes', MB_ICONWARNING);
  end
  else
  begin
    if frmCadCliente = nil then
      Application.CreateForm(TfrmCadCliente, frmCadCliente);

    with frmCadCliente do
    begin
      edtCodigo.Text := frmPesqCliente.FDQCliente.FieldByName('id').AsString;
      edtNome.Text := frmPesqCliente.FDQCliente.FieldByName('nome').AsString;
      edtTelefone.Text := frmPesqCliente.FDQCliente.FieldByName('telefone').AsString;
      edtCelular.Text := frmPesqCliente.FDQCliente.FieldByName('celular').AsString;
      edtEmail.Text := frmPesqCliente.FDQCliente.FieldByName('email').AsString;
      Show();
    end;
  end;
end;

procedure TfrmPesqCliente.btRetornarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPesqCliente.consultarCliente();
 var
   SQL : String;
begin
  FDQCliente.SQL.Clear;

  SQL := 'SELECT * ' +
         '  FROM CLIENTE ' +
         ' WHERE 1 = 1 ';

  if Trim(edtCodigo.Text) <> '' then
  begin
    SQL := SQL + ' AND ID = ' + edtCodigo.Text;
  end;

  if Trim(edtNome.Text) <> '' then
  begin
    SQL := SQL + ' AND UPPER(NOME) LIKE ' + QuotedStr('%' + UpperCase(edtNome.Text) + '%');
  end;

  SQL := SQL + ' ORDER BY NOME';

  FDQCliente.SQL.Add(SQL);

  FDQCliente.Open;

  if FDQCliente.IsEmpty then
    Application.MessageBox('Nenhum registro encontrado!', 'P?mela Artes', MB_ICONINFORMATION);
end;

end.
