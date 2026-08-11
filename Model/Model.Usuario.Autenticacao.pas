unit Model.Usuario.Autenticacao;

interface

uses
  System.SysUtils,
  Sistema.Exceptions,
  Model.Usuario.Interfaces,
  Model.Entity.Usuario.Interfaces,
  Model.Usuario.DAO.Interfaces,
  Model.Usuario.DAO;

type
  TModelUsuarioAutenticacao = class(TInterfacedObject, iModelAutenticacaoUsuario)
  const
    ERRO_TENTATIVAS_ESGOTADAS = 'As tentativas de autenticação se esgotaram.' +
      sLineBreak + sLineBreak +
      'O sistema será encerrado.';
    ERRO_LOGIN_INVALIDO = 'Login ou senha inválidos. Você tem mais %d tentativa(s).';
    ERRO_USUARIO_INATIVO = 'Usuário inativo. Procure o administrador do sistema.';
  private const
    MAX_TENTATIVAS = 5;
  private
    FUsuarioDAO: iModelDAOUsuario;
    FTentativasRestantes: Integer;
    constructor Create;
    procedure DecrementarTentativa;
    procedure ResetarTentativas;
  public
    class function New: iModelAutenticacaoUsuario;
    destructor Destroy; override;
    function Autenticar(AValue: iEntityUsuario): Boolean;
  end;

implementation

{ TModelUsuarioAutenticacao }

//function TModelUsuarioAutenticacao.Autenticar(
//  AValue: iEntityUsuario): Boolean;
//var
//  LUsuario: iEntityUsuario;
//begin
//  if (AValue.Login = EmptyStr) or (AValue.Senha = EmptyStr) then
//    raise Exception.Create('Informe login e senha.');
//
//  LUsuario := FUsuarioDAO.BuscarPorLogin(AValue.Login, AValue.Senha);
//
//  if not Assigned(LUsuario) then
//  begin
//    DecrementarTentativa;
//
//    if FTentativasRestantes = 1 then
//      raise Exception.Create(ERRO_TENTATIVAS_ESGOTADAS);
//
//    raise Exception.CreateFmt(ERRO_LOGIN_INVALIDO, [FTentativasRestantes]);
//  end;
//
//  // Futuramente: implementação de uma rotina de hash da senha
//
//  if not LUsuario.Ativo then
//    raise Exception.Create(ERRO_USUARIO_INATIVO);
//
//  ResetarTentativas;
//  Result := True;
//end;

function TModelUsuarioAutenticacao.Autenticar(AValue: iEntityUsuario): Boolean;
var
  LUsuario: iEntityUsuario;
begin
  if (AValue.Login = EmptyStr) or (AValue.Senha = EmptyStr) then
    raise EDadosLoginVazios.Create('Informe login e senha.');

  // TODO (futuro): aplicar hash na senha antes de enviar para o DAO,
  // e/ou comparar o hash armazenado no banco com o hash calculado aqui.
  LUsuario := FUsuarioDAO.BuscarPorLogin(AValue.Login, AValue.Senha);

  if not Assigned(LUsuario) then
  begin
    DecrementarTentativa;

    if FTentativasRestantes = 0 then
      raise ETentativasEsgotadas.Create(ERRO_TENTATIVAS_ESGOTADAS);

    raise ELoginInvalido.CreateFmt(ERRO_LOGIN_INVALIDO, [FTentativasRestantes]);
  end;

  if not LUsuario.Ativo then
    raise EUsuarioInativo.Create(ERRO_USUARIO_INATIVO);

  ResetarTentativas;
  Result := True;
end;

procedure TModelUsuarioAutenticacao.ResetarTentativas;
begin
  FTentativasRestantes := MAX_TENTATIVAS;
end;

constructor TModelUsuarioAutenticacao.Create;
begin
  inherited Create;

  FUsuarioDAO := TModelUsuarioDAO.New;
  ResetarTentativas;
end;

procedure TModelUsuarioAutenticacao.DecrementarTentativa;
begin
  Dec(FTentativasRestantes);
end;

destructor TModelUsuarioAutenticacao.Destroy;
begin
  inherited;
end;

class function TModelUsuarioAutenticacao.New: iModelAutenticacaoUsuario;
begin
  Result := Self.Create;
end;

end.
