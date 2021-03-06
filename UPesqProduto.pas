unit UPesqProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TfrmPesqProduto = class(TForm)
    Panel2: TPanel;
    btNovo: TSpeedButton;
    btAlterar: TSpeedButton;
    btRetornar: TSpeedButton;
    btExcluir: TSpeedButton;
    Panel1: TPanel;
    btPesquisa: TSpeedButton;
    GroupBox1: TGroupBox;
    edtCodigo: TEdit;
    GroupBox2: TGroupBox;
    edtNome: TEdit;
    DBGProduto: TDBGrid;
    FDQProduto: TFDQuery;
    DSProduto: TDataSource;
    FDQProdutoid: TIntegerField;
    FDQProdutodescricao: TWideStringField;
    FDQProdutovalorcusto: TBCDField;
    FDQProdutovalorvenda: TBCDField;
    Splitter1: TSplitter;
    GroupBox3: TGroupBox;
    mmObservacao: TMemo;
    FDQProdutoobservacao: TWideStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btPesquisaClick(Sender: TObject);
    procedure btRetornarClick(Sender: TObject);
    procedure DSProdutoDataChange(Sender: TObject; Field: TField);
    procedure edtCodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtNomeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btNovoClick(Sender: TObject);
  private
    { Private declarations }
    procedure consultarProduto();
    procedure carregarObservacao();
  public
    { Public declarations }
  end;

var
  frmPesqProduto: TfrmPesqProduto;

implementation

{$R *.dfm}
 uses
  udmDados, UPrincipal, UCadProduto;

procedure TfrmPesqProduto.btNovoClick(Sender: TObject);
begin
  if frmCadProduto = nil then
    Application.CreateForm(TfrmCadProduto, frmCadProduto);
  frmCadProduto.Show();
end;

procedure TfrmPesqProduto.btPesquisaClick(Sender: TObject);
begin
  consultarProduto();
end;

procedure TfrmPesqProduto.btRetornarClick(Sender: TObject);
begin
  Close();
end;

procedure TfrmPesqProduto.carregarObservacao();
begin
  mmObservacao.Text := FDQProduto.FieldByName('OBSERVACAO').AsString;
end;

procedure TfrmPesqProduto.consultarProduto;
  var
    SQL : String;
begin
  FDQProduto.SQL.Clear;

  SQL := 'SELECT * ' +
         '  FROM PRODUTO ' +
         ' WHERE 1 = 1 ';

  if Trim(edtCodigo.Text) <> '' then
  begin
    SQL := SQL + ' AND ID = ' + edtCodigo.Text;
  end;

  if Trim(edtNome.Text) <> '' then
  begin
    SQL := SQL + ' AND UPPER(DESCRICAO) LIKE ' + QuotedStr('%' + UpperCase(edtNome.Text) + '%');
  end;

  SQL := SQL + ' ORDER BY ID';

  FDQProduto.SQL.Add(SQL);

  FDQProduto.Open;

  if FDQProduto.IsEmpty then
    Application.MessageBox('Nenhum registro encontrado!', 'P?mela Artes', MB_ICONINFORMATION)
  else
    carregarObservacao();
end;

procedure TfrmPesqProduto.DSProdutoDataChange(Sender: TObject; Field: TField);
begin
  carregarObservacao();
end;

procedure TfrmPesqProduto.edtCodigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_Return then
    consultarProduto();
end;

procedure TfrmPesqProduto.edtNomeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_Return then
    consultarProduto();
end;

procedure TfrmPesqProduto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmPesqProduto := nil;
  Action := caFree;
end;

end.
