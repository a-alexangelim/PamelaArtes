unit UCadProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.Buttons, System.ImageList,
  Vcl.ImgList, dxGDIPlusClasses;

type
  TfrmCadProduto = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    DBGrid1: TDBGrid;
    Panel3: TPanel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    edtCodigo: TEdit;
    GroupBox3: TGroupBox;
    edtNome: TEdit;
    ImageList1: TImageList;
    Image1: TImage;
    btCarregaImagem: TSpeedButton;
    btRemoverImagem: TSpeedButton;
    OpenDialog1: TOpenDialog;
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btRemoverImagemClick(Sender: TObject);
    procedure btCarregaImagemClick(Sender: TObject);
  private
    { Private declarations }
    procedure removerImagem();
    function PadronizaTamanho(Imagem: TGraphic; W, H: Integer; Tipo: TGraphicClass = nil): TGraphic;
    var
      s_caminho : String;
  public
    { Public declarations }
  end;

var
  frmCadProduto: TfrmCadProduto;

implementation

{$R *.dfm}

procedure TfrmCadProduto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmCadProduto := nil;
  Action := caFree;
end;

function TfrmCadProduto.PadronizaTamanho(Imagem: TGraphic; W, H: Integer;
  Tipo: TGraphicClass): TGraphic;
  var
    B : TBitmap;
begin
  B := TBitmap.Create;
  try
    B.Width := W;
    B.Height := H;
    B.Canvas.StretchDraw(Rect(0, 0, W, H), Imagem);
    if Tipo = nil then
      Result := TGraphic(Imagem.ClassType.Create)
    else
      Result := Tipo.Create;
      Result.Assign(B);
  finally
    B.Free;
  end;

end;

procedure TfrmCadProduto.removerImagem;
begin
  s_caminho := '';
end;

procedure TfrmCadProduto.SpeedButton2Click(Sender: TObject);
begin
  Close();
end;

procedure TfrmCadProduto.btCarregaImagemClick(Sender: TObject);
var
  Nova: TGraphic;
begin
  if OpenDialog1.Execute then
    s_caminho := OpenDialog1.FileName;

  Image1.Picture.LoadFromFile(s_caminho);
  Nova := PadronizaTamanho(Image1.Picture.Graphic, 215, 215, nil);

  Image1.Picture.Graphic := Nova;
end;

procedure TfrmCadProduto.btRemoverImagemClick(Sender: TObject);
begin
  removerImagem();
end;

end.
