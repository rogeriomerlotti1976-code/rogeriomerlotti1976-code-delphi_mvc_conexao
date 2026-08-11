unit Sistema.Bootstrap;

interface

uses
  Vcl.Forms,
  Vcl.Controls,
  System.SysUtils,
  View.Login,
  View.Principal;

type
  TSistemaBootstrap = class
  public
    class procedure Execute;
  end;

implementation

class procedure TSistemaBootstrap.Execute;
var
  LFormLogin: TFrmLogin;
begin
  LFormLogin := TFrmLogin.Create(nil);

  try
    if LFormLogin.ShowModal = mrOk then
    begin
      Application.CreateForm(TFrmPrincipal, FrmPrincipal);

    end;
  finally
    LFormLogin.Free;
  end;
end;

end.
