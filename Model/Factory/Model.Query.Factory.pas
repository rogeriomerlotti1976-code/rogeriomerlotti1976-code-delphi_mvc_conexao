unit Model.Query.Factory;

interface

uses
  Model.Query.Interfaces,
  Model.Query.Firedac,
  Model.Query.DBExpress,
  Model.Conexao.Interfaces;

type
  TModelQueryFactory = class(TInterfacedObject, iQueryFactory)
  private
    FConexao: iConexao;
    constructor Create(AConexao: iConexao);
  public
    class function New(AConexao: iConexao): iQueryFactory;
    destructor Destroy; override;
    function QueryFiredac: iQuery;
    function QueryDBExpress: iQuery;
  end;

implementation

{ TModelQueryFactory }

constructor TModelQueryFactory.Create(AConexao: iConexao);
begin
  FConexao := AConexao;
end;

destructor TModelQueryFactory.Destroy;
begin

  inherited;
end;

class function TModelQueryFactory.New(AConexao: iConexao): iQueryFactory;
begin
  Result := Self.Create(AConexao);
end;

function TModelQueryFactory.QueryDBExpress: iQuery;
begin
  Result := TModelQueryDBExpress.New(FConexao);
end;

function TModelQueryFactory.QueryFiredac: iQuery;
begin
  Result := TModelQueryFiredac.New(FConexao);
end;

end.
