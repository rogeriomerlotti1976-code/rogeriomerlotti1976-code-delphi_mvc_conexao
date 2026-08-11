unit View.Login;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Vcl.StdCtrls,
  Vcl.Buttons,
  Sistema.Exceptions,
  Controller.Usuario.Interfaces,
  Controller.Usuario, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client;

const
  // Cores da paleta reaproveitadas em runtime (mesmos valores usados no .dfm)
  COR_ROXO_PRIMARIO  = TColor(12000086);  // marca / botão / títulos
  COR_ROXO_CLARO     = TColor(13783160);  // decorativo (círculos, hover)
  COR_CINZA_TEXTO    = TColor(5774125);
  COR_ACENTO_INATIVO = TColor(15132390);  // barra do campo sem foco

type
  TFrmLogin = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    pnlLogo: TShape;
    lblLogoLetra: TLabel;
    lblMarca: TLabel;
    lblTitulo: TLabel;
    lblSubtitulo: TLabel;
    lblUsuario: TLabel;
    lblSenha: TLabel;
    lblEsqueceu: TLabel;
    lblRodape: TLabel;
    pnlUsuario: TPanel;
    shpAccentUsuario: TShape;
    edtLogin: TEdit;
    pnlSenha: TPanel;
    shpAccentSenha: TShape;
    lblToggleSenha: TLabel;
    edtSenha: TEdit;
    pnlEntrar: TPanel;
    lblEntrarTexto: TLabel;
    lblEntrarSeta: TLabel;
    pnlDivEsq: TPanel;
    pnlDivDir: TPanel;
    lblVersaoMeio: TLabel;
    shpCirculo1: TShape;
    shpCirculo2: TShape;
    shpCloseHover: TShape;
    pnlLogoDestaque: TPanel;
    lblLogoDestaqueLetra: TLabel;
    lblBemVindo: TLabel;
    lblDescricao: TLabel;
    lblCheck1: TLabel;
    lblFeature1: TLabel;
    lblCheck2: TLabel;
    lblFeature2: TLabel;
    lblCheck3: TLabel;
    lblFeature3: TLabel;
    SpeedButton1: TSpeedButton;
    FDConnection1: TFDConnection;
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton1MouseEnter(Sender: TObject);
    procedure SpeedButton1MouseLeave(Sender: TObject);
    procedure pnlEntrarClick(Sender: TObject);
    procedure pnlEntrarMouseEnter(Sender: TObject);
    procedure pnlEntrarMouseLeave(Sender: TObject);
    procedure edtLoginEnter(Sender: TObject);
    procedure edtLoginExit(Sender: TObject);
    procedure edtSenhaEnter(Sender: TObject);
    procedure edtSenhaExit(Sender: TObject);
    procedure lblToggleSenhaClick(Sender: TObject);
  private
    FControllerUsuario: iControllerUsuario;
    procedure Autenticar;
    procedure AplicarCantosArredondados;
  public
    { Public declarations }
  end;

var
  FrmLogin: TFrmLogin;

implementation

{$R *.dfm}

procedure TFrmLogin.Autenticar;
begin
  try
    if FControllerUsuario.Autenticacao.Autenticar(edtLogin.Text, edtSenha.Text) then
    begin
      ShowMessage('Autenticação realizada com sucesso!');
      ModalResult := mrOk;
    end;
  except
    on E: ETentativasEsgotadas do
    begin
      ShowMessage(E.Message);
      Application.Terminate;
    end;
    on E: Exception do
      ShowMessage(E.Message);
  end;
end;

// Arredonda os cantos da janela inteira, já que BorderStyle = bsNone.
// Usa a API do Windows diretamente; não depende de nenhum componente externo.
procedure TFrmLogin.AplicarCantosArredondados;
var
  LRegiao: HRGN;
begin
  LRegiao := CreateRoundRectRgn(0, 0, Width + 1, Height + 1, 20, 20);
  SetWindowRgn(Handle, LRegiao, True);
end;

procedure TFrmLogin.FormCreate(Sender: TObject);
begin
  FControllerUsuario := TControllerUsuario.New;
  AplicarCantosArredondados;
end;

procedure TFrmLogin.pnlEntrarClick(Sender: TObject);
begin
  Autenticar;
end;

procedure TFrmLogin.pnlEntrarMouseEnter(Sender: TObject);
begin
  pnlEntrar.Color := COR_ROXO_CLARO;
end;

procedure TFrmLogin.pnlEntrarMouseLeave(Sender: TObject);
begin
  pnlEntrar.Color := COR_ROXO_PRIMARIO;
end;

procedure TFrmLogin.SpeedButton1Click(Sender: TObject);
begin
  Close;
end;

// Mostra um "fundo" circular translúcido atrás do X ao passar o mouse,
// dando affordance de que o botão é clicável.
procedure TFrmLogin.SpeedButton1MouseEnter(Sender: TObject);
begin
  shpCloseHover.Visible := True;
end;

procedure TFrmLogin.SpeedButton1MouseLeave(Sender: TObject);
begin
  shpCloseHover.Visible := False;
end;

// Destaque de foco: a barrinha lateral do campo muda para a cor
// primária da marca, reforçando qual campo está ativo.
procedure TFrmLogin.edtLoginEnter(Sender: TObject);
begin
  shpAccentUsuario.Brush.Color := COR_ROXO_PRIMARIO;
end;

procedure TFrmLogin.edtLoginExit(Sender: TObject);
begin
  shpAccentUsuario.Brush.Color := COR_ACENTO_INATIVO;
end;

procedure TFrmLogin.edtSenhaEnter(Sender: TObject);
begin
  shpAccentSenha.Brush.Color := COR_ROXO_PRIMARIO;
end;

procedure TFrmLogin.edtSenhaExit(Sender: TObject);
begin
  shpAccentSenha.Brush.Color := COR_ACENTO_INATIVO;
end;

// Alterna a visibilidade da senha digitada (equivalente ao ícone de
// "olho" do mockup, implementado aqui como um link de texto por não
// depender de nenhuma fonte de ícones externa).
procedure TFrmLogin.lblToggleSenhaClick(Sender: TObject);
begin
  if edtSenha.PasswordChar = #0 then
  begin
    edtSenha.PasswordChar := '*';
    lblToggleSenha.Caption := 'Mostrar';
  end
  else
  begin
    edtSenha.PasswordChar := #0;
    lblToggleSenha.Caption := 'Ocultar';
  end;
end;

end.
