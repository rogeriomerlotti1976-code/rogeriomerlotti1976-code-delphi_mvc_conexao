unit Controller.Usuario;

interface

uses
  Controller.Usuario.Interfaces,
  Model.Usuario.Factory,
  Model.Usuario.Interfaces,
  Model.Usuario,
  Model.Entity.Usuario.Interfaces;

type
  TControllerUsuario = class(TInterfacedObject, iControllerUsuario,
    iControllerAutenticacaoUsuario)
  private
    FModelUsuario: iUsuario;
    FModelUsuarioAutenticacao: iModelAutenticacaoUsuario;
    constructor Create;
  public
    destructor Destroy; override;
    class function New: iControllerUsuario;
    function Usuario: iEntityUsuario;
    function Autenticar(const ALogin, ASenha: string): Boolean;
    function Autenticacao: iControllerAutenticacaoUsuario;
  end;

implementation

{ TControllerUsuario }

function TControllerUsuario.Autenticacao: iControllerAutenticacaoUsuario;
begin
  Result := Self;
end;

function TControllerUsuario.Autenticar(const ALogin, ASenha: string): Boolean;
var
  LUsuario: iEntityUsuario;
begin
  LUsuario :=
    TModelUsuarioFactory.New
      .EntityUsuario
        .Login(ALogin)
        .Senha(ASenha);

  Result := FModelUsuarioAutenticacao.Autenticar(LUsuario);
end;

constructor TControllerUsuario.Create;
begin
  FModelUsuario := TModelUsuario.New;
  FModelUsuarioAutenticacao := TModelUsuarioFactory.New.AutenticacaoUsuario;
end;

destructor TControllerUsuario.Destroy;
begin

  inherited;
end;

class function TControllerUsuario.New: iControllerUsuario;
begin
  Result := Self.Create;
end;

function TControllerUsuario.Usuario: iEntityUsuario;
begin
  Result := FModelUsuario.Usuario;
end;

end.
