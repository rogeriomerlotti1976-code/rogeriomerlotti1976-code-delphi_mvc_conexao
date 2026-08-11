unit Model.Usuario.DAO.Interfaces;

interface

uses
  Model.Entity.Usuario.Interfaces;

type
  iModelDAOUsuario = interface
    ['{2ACB727F-6FA4-45C7-9BC7-587E5A028B88}']
    function BuscarPorLogin(const ALogin, ASenha: string): iEntityUsuario;
  end;

implementation

end.
