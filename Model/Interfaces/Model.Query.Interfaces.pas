unit Model.Query.Interfaces;

interface

uses
  Data.DB;

type
  iQuery = interface
    ['{A5159B3E-0696-47BE-992C-A47E06F46160}']
    procedure Execute(const AStatement: string; const AParams: array of Variant); overload;
    function Query(const AStatement: string; const AParams: array of Variant): TDataSet; overload;
  end;

  iQueryFactory = interface
    ['{22AB4AB9-27E8-4B8E-B36E-5806BEC6297D}']
    function QueryFiredac: iQuery;
    function QueryDBExpress: iQuery;
  end;

implementation

end.
