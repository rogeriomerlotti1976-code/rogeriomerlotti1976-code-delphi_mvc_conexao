unit Sistema.Exceptions;

interface

uses
  System.SysUtils;

type
  ETentativasEsgotadas = class(Exception);
  ELoginInvalido = class(Exception);
  EUsuarioInativo = class(Exception);
  EDadosLoginVazios = class(Exception);

implementation

end.
