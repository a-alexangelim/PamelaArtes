unit UPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, System.ImageList, Vcl.ImgList,
  Vcl.ExtCtrls, dxGDIPlusClasses, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinsDefaultPainters, cxCalendar,
  Vcl.StdCtrls, cxImageList;

type
  TfrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    mnCadastro: TMenuItem;
    mnPesqCliente: TMenuItem;
    ImageList1: TImageList;
    mnSair: TMenuItem;
    pnlRodape: TPanel;
    Image1: TImage;
    lbUsuario: TLabel;
    lbDataAtual: TLabel;
    cxImageList1: TcxImageList;
    Configuraes1: TMenuItem;
    mnParametros: TMenuItem;
    mnUsuario: TMenuItem;
    Financeiro1: TMenuItem;
    mnContasReceber: TMenuItem;
    mnProduto: TMenuItem;
    procedure mnPesqClienteClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure mnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure mnParametrosClick(Sender: TObject);
    procedure mnUsuarioClick(Sender: TObject);
    procedure mnProdutoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    var
      Usuario : String;
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

  uses
    UPesqCliente, ULogin, UParametros, UPesqUsuario, UPesqProduto;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  lbUsuario.Caption := lbUsuario.Caption + ' ' + Usuario;
end;

procedure TfrmPrincipal.mnParametrosClick(Sender: TObject);
begin
  if frmParametro = nil then
    Application.CreateForm(TfrmParametro, frmParametro);
  frmParametro.Show();
end;

procedure TfrmPrincipal.mnPesqClienteClick(Sender: TObject);
begin
  if frmPesqCliente = nil then
    Application.CreateForm(TfrmPesqCliente, frmPesqCliente);
  frmPesqCliente.Show();
end;

procedure TfrmPrincipal.mnProdutoClick(Sender: TObject);
begin
  if frmPesqProduto = nil then
    Application.CreateForm(TfrmPesqProduto, frmPesqProduto);
  frmPesqProduto.Show();
end;

procedure TfrmPrincipal.mnSairClick(Sender: TObject);
begin
  if Application.MessageBox('Aten??o, deseja realmente sair do programa ?', 'P?mela Artes', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = ID_YES then
    Close;
end;

procedure TfrmPrincipal.mnUsuarioClick(Sender: TObject);
begin
  if frmPesqUsuario = nil then
    Application.CreateForm(TfrmPesqUsuario, frmPesqUsuario);
  frmPesqUsuario.Show();
end;

end.
