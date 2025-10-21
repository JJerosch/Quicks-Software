unit LoginModel;

interface

type
  // Enumerador para tipos de usuário
  TTipoUsuario = (tuCliente, tuComercio, tuEntregador, tuAdmin, tuInvalido);

  // Model para request de login
  TLoginRequest = class
  private
    FEmail: String;
    FSenha: String;
  public
    property Email: String read FEmail write FEmail;
    property Senha: String read FSenha write FSenha;
  end;

  // Model para response de login
  TLoginResponse = class
  private
    FIdUsuario: Integer;
    FNomeUsuario: String;
    FIdCargo: Integer;
    FDescCargo: String;
    FTipoUsuario: TTipoUsuario;
    FAutenticado: Boolean;
    FMensagem: String;
  public
    property IdUsuario: Integer read FIdUsuario write FIdUsuario;
    property NomeUsuario: String read FNomeUsuario write FNomeUsuario;
    property IdCargo: Integer read FIdCargo write FIdCargo;
    property DescCargo: String read FDescCargo write FDescCargo;
    property TipoUsuario: TTipoUsuario read FTipoUsuario write FTipoUsuario;
    property Autenticado: Boolean read FAutenticado write FAutenticado;
    property Mensagem: String read FMensagem write FMensagem;

    constructor Create;
    function TipoUsuarioToString: String;
  end;

implementation

{ TLoginResponse }

constructor TLoginResponse.Create;
begin
  inherited;
  FIdUsuario := 0;
  FNomeUsuario := '';
  FIdCargo := 0;
  FDescCargo := '';
  FTipoUsuario := tuInvalido;
  FAutenticado := False;
  FMensagem := '';
end;

function TLoginResponse.TipoUsuarioToString: String;
begin
  case FTipoUsuario of
    tuCliente: Result := 'Cliente';
    tuComercio: Result := 'Dono de Comércio';
    tuEntregador: Result := 'Entregador';
    tuAdmin: Result := 'Administrador';
  else
    Result := 'Inválido';
  end;
end;

end.
