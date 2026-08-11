unit Model.Conexao.Interfaces;

interface

uses
  Data.DB,
  Enum.Conexao;

type
  iConexao = interface
    ['{40C35855-7AF6-4BD1-8EE3-B074CF819153}']
    function Conexao: TCustomConnection;
  end;

  iConexaoFactory = interface
    ['{DB4FBE23-0CFE-4DA6-913B-66203CC9B5B0}']
    function ConexaoFiredac: iConexao;
    function ConexaoDBExpress: iConexao;
  end;

  iConfiguracoesConexao = interface
    ['{C1622DC1-2039-4DEF-AB23-207F49FC27A5}']
    function TipoBanco(AValue: TTipoBanco): iConfiguracoesConexao; overload;
    function TipoBanco: TTipoBanco; overload;
    function Protocol(AValue: string): iConfiguracoesConexao; overload;
    function Protocol: string; overload;
    function Port(AValue: string): iConfiguracoesConexao; overload;
    function Port: string; overload;
    function Server(AValue: string): iConfiguracoesConexao; overload;
    function Server: string; overload;
    function Path(AValue: string): iConfiguracoesConexao; overload;
    function Path: string; overload;
    function Database(AValue: string): iConfiguracoesConexao; overload;
    function Database: string; overload;
    function UserName(AValue: string): iConfiguracoesConexao; overload;
    function UserName: string; overload;
    function Password(AValue: string): iConfiguracoesConexao; overload;
    function Password: string; overload;
    function DriverName(AValue: string): iConfiguracoesConexao; overload;
    function DriverName: string; overload;
  end;

implementation

end.
