unit CargosModelCRUDAdmin;

interface

type
  TCargo = class
  private
    FIdCargo: Integer;
    FDescCargo: string;
  public
    property IdCargo: Integer read FIdCargo write FIdCargo;
    property DescCargo: string read FDescCargo write FDescCargo;

    constructor Create; overload;
    constructor Create(AId: Integer; ADesc: string); overload;
    destructor Destroy; override;
  end;

implementation

{ TCargo }

constructor TCargo.Create;
begin
  inherited Create;
  FIdCargo := 0;
  FDescCargo := '';
end;

constructor TCargo.Create(AId: Integer; ADesc: string);
begin
  FIdCargo := AId;
  FDescCargo := ADesc;
end;

destructor TCargo.Destroy;
begin
  inherited;
end;

end.
