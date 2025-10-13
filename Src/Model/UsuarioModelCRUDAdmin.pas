unit UsuarioModelCRUDAdmin;

interface

type
  TUsuario = class
  private
    FIdUser: Integer;
    FNomeUser: string;
    FEmailUser: string;
    FCpfUser: string;
    FNPhoneUser: string;
    FIdCargo: Integer;
    FDescCargo: string;
    FAtivo: Boolean;
  public
    property IdUser: Integer read FIdUser write FIdUser;
    property NomeUser: string read FNomeUser write FNomeUser;
    property EmailUser: string read FEmailUser write FEmailUser;
    property CpfUser: string read FCpfUser write FCpfUser;
    property NPhoneUser: string read FNPhoneUser write FNPhoneUser;
    property IdCargo: Integer read FIdCargo write FIdCargo;
    property DescCargo: string read FDescCargo write FDescCargo;
    property Ativo: Boolean read FAtivo write FAtivo;

    constructor Create; overload;
    constructor Create(AId: Integer; ANome, AEmail, ACpf, ANPhone: string;
                      AIdCargo: Integer; ADescCargo: string; AAtivo: Boolean); overload;
    destructor Destroy; override;
  end;

implementation

{ TUsuario }

constructor TUsuario.Create;
begin
  inherited Create;
  FIdUser := 0;
  FNomeUser := '';
  FEmailUser := '';
  FCpfUser := '';
  FNPhoneUser := '';
  FIdCargo := 0;
  FDescCargo := '';
  FAtivo := True;
end;

constructor TUsuario.Create(AId: Integer; ANome, AEmail, ACpf, ANPhone: string;
  AIdCargo: Integer; ADescCargo: string; AAtivo: Boolean);
begin
  FIdUser := AId;
  FNomeUser := ANome;
  FEmailUser := AEmail;
  FCpfUser := ACpf;
  FNPhoneUser := ANPhone;
  FIdCargo := AIdCargo;
  FDescCargo := ADescCargo;
  FAtivo := AAtivo;
end;

destructor TUsuario.Destroy;
begin
  inherited;
end;

end.
