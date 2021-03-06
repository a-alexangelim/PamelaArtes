unit UCadCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ComCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinsDefaultPainters, cxTextEdit, cxMaskEdit, Vcl.Mask;

type
  TfrmCadCliente = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    edtCodigo: TEdit;
    GroupBox3: TGroupBox;
    edtNome: TEdit;
    GroupBox2: TGroupBox;
    GroupBox4: TGroupBox;
    PageControl1: TPageControl;
    tabEndereco: TTabSheet;
    tabHistorico: TTabSheet;
    GroupBox5: TGroupBox;
    edtEmail: TEdit;
    Splitter1: TSplitter;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    DBGrid1: TDBGrid;
    Panel3: TPanel;
    DBGrid2: TDBGrid;
    Panel4: TPanel;
    SpeedButton3: TSpeedButton;
    ckFinalizadas: TCheckBox;
    Panel5: TPanel;
    Shape1: TShape;
    Label1: TLabel;
    Label2: TLabel;
    Shape2: TShape;
    FDQCadCliente: TFDQuery;
    FDQEndereco: TFDQuery;
    DSEndereco: TDataSource;
    DSEncomenda: TDataSource;
    FDQEncomenda: TFDQuery;
    FDQEnderecorua: TWideStringField;
    FDQEndereconumero: TIntegerField;
    FDQEnderecobairro: TWideStringField;
    edtTelefone: TMaskEdit;
    edtCelular: TMaskEdit;
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure inserirCliente();
    procedure atualizarCliente();
  public
    { Public declarations }
  end;

var
  frmCadCliente: TfrmCadCliente;

implementation

{$R *.dfm}
  uses
    UPrincipal, Udmdados, UCadEnderecoCliente, UPesqCliente;

procedure TfrmCadCliente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmCadCliente := nil;
  Action := caFree;
end;

procedure TfrmCadCliente.FormShow(Sender: TObject);
begin
  FDQEndereco.ParamByName('cliente').AsInteger := frmPesqCliente.FDQCliente.FieldByName('id').AsInteger;
  FDQEndereco.Open;
end;

procedure TfrmCadCliente.SpeedButton1Click(Sender: TObject);
begin
  if Trim(edtCodigo.Text) = '' then
    inserirCliente()
  else
    atualizarCliente();
end;

procedure TfrmCadCliente.SpeedButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadCliente.SpeedButton3Click(Sender: TObject);
begin
  if frmCadEnderecoCliente = nil then
    Application.CreateForm(TfrmCadEnderecoCliente, frmCadEnderecoCliente);
  frmCadEnderecoCliente.BringToFront;
  frmCadEnderecoCliente.ShowModal;
end;

procedure TfrmCadCliente.inserirCliente();
  var
    SQL : String;
begin
  FDQCadCliente.SQL.Clear;
  SQL := 'INSERT INTO CLIENTE (NOME, TELEFONE, CELULAR, EMAIL, DATACADASTRO) ' +
         ' VALUES ' +
         ' (:nome, :telefone, :celular, :email, now());';


  FDQCadCliente.ParamByName('nome').AsString := edtNome.Text;
  FDQCadCliente.ParamByName('telefone').AsString := edtTelefone.Text;
  FDQCadCliente.ParamByName('celular').AsString := edtCelular.Text;
  FDQCadCliente.ParamByName('email').AsString := edtEmail.Text;
  FDQCadCliente.SQL.Add(SQL);

  try
    FDQCadCliente.ExecSQL;
    Application.MessageBox('Cliente salvo com sucesso!', 'P?mela Artes', MB_ICONINFORMATION);
  except on e: exception do
    begin
     ShowMessage(e.Message);
    end;
  end;
end;

procedure TfrmCadCliente.atualizarCliente();
  var
    SQL : String;
begin
  FDQCadCliente.SQL.Clear;

  SQL := 'UPDATE CLIENTE SET NOME = :nome, ' +
         '                   TELEFONE = :telefone, ' +
         '                   CELULAR = :celular, ' +
         '                   EMAIL = :email ' +
         ' WHERE ID = :id; ';

  FDQCadCliente.ParamByName('nome').AsString := edtNome.Text;
  FDQCadCliente.ParamByName('telefone').AsString := edtTelefone.Text;
  FDQCadCliente.ParamByName('celular').AsString := edtCelular.Text;
  FDQCadCliente.ParamByName('email').AsString := edtEmail.Text;
  FDQCadCliente.ParamByName('id').AsInteger := StrToInt(edtCodigo.Text);
  FDQCadCliente.SQL.Add(SQL);

  try
    FDQCadCliente.ExecSQL;
    Application.MessageBox('Cliente alterado com sucesso!', 'P?mela Artes', MB_ICONINFORMATION);
  except on e: exception do
    begin
     ShowMessage(e.Message);
    end;
  end;

end;

end.
