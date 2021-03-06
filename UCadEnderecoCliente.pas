unit UCadEnderecoCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls, Vcl.StdCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TfrmCadEnderecoCliente = class(TForm)
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    edtLogradouro: TEdit;
    Label1: TLabel;
    edtNumero: TEdit;
    Label2: TLabel;
    edtBairro: TEdit;
    Label3: TLabel;
    FDQEnderecoCliente: TFDQuery;
    edtCodigo: TEdit;
    Label4: TLabel;
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
    procedure insereEndereco();
  public
    { Public declarations }
  end;

var
  frmCadEnderecoCliente: TfrmCadEnderecoCliente;

implementation

{$R *.dfm}
  uses
    UCadCliente, UdmDados;

procedure TfrmCadEnderecoCliente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if frmCadCliente.FDQEndereco.Active then
    frmCadCliente.FDQEndereco.Refresh;
  frmCadEnderecoCliente := nil;
  Action := caFree;
end;

procedure TfrmCadEnderecoCliente.insereEndereco;
  var
    SQL : String;
    QAux : TFDQuery;
begin
  QAux := TFDQuery.Create(Self);
  QAux.Connection := dmDados.FDPrincipal;

  FDQEnderecoCliente.SQL.Clear;

  SQL := ' INSERT INTO ENDERECO (RUA, NUMERO, BAIRRO) VALUES (:rua, :numero, :bairro);';

  FDQEnderecoCliente.ParamByName('rua').AsString := edtLogradouro.Text;
  FDQEnderecoCliente.ParamByName('bairro').AsString := edtBairro.Text;
  FDQEnderecoCliente.ParamByName('numero').AsInteger := StrToInt(edtNumero.Text);
  FDQEnderecoCliente.SQL.Add(SQL);

  try
    FDQEnderecoCliente.ExecSQL;

    QAux.SQL.Text := 'SELECT * FROM ENDERECO ORDER BY ID DESC LIMIT 1';
    QAux.Open;
    edtCodigo.Text := QAux.FieldByName('id').AsString;
    QAux.Close;
    QAux.SQL.Clear;

    QAux.SQL.Text := 'INSERT INTO ENDERECO_CLIENTE (ID_CLIENTE, ID_ENDERECO) VALUES (:cliente, :endereco);';
    QAux.ParamByName('cliente').AsInteger := StrToInt(frmCadCliente.edtCodigo.Text);
    QAux.ParamByName('endereco').AsInteger := StrToInt(edtCodigo.Text);
    QAux.ExecSQL;
    QAux.Close;
    FreeAndNil(QAux);
  except on e: exception do
    begin
      ShowMessage(e.Message);
    end

  end;
end;

procedure TfrmCadEnderecoCliente.SpeedButton1Click(Sender: TObject);
begin
  insereEndereco();
end;

procedure TfrmCadEnderecoCliente.SpeedButton2Click(Sender: TObject);
begin
  Close();
end;

end.
