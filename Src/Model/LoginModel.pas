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
    FEmailUsuario: String; // ⭐ ADICIONADO
    FIdCargo: Integer;
    FDescCargo: String;
    FTipoUsuario: TTipoUsuario;
    FAutenticado: Boolean;
    FAtivo: Boolean; // ⭐ ADICIONADO
    FMensagem: String;
    FSenhaHash: string;
    FUsuarioEncontrado: Boolean;
  public
    property IdUsuario: Integer read FIdUsuario write FIdUsuario;
    property NomeUsuario: String read FNomeUsuario write FNomeUsuario;
    property EmailUsuario: String read FEmailUsuario write FEmailUsuario; // ⭐ ADICIONADO
    property IdCargo: Integer read FIdCargo write FIdCargo;
    property DescCargo: String read FDescCargo write FDescCargo;
    property TipoUsuario: TTipoUsuario read FTipoUsuario write FTipoUsuario;
    property Autenticado: Boolean read FAutenticado write FAutenticado;
    property Ativo: Boolean read FAtivo write FAtivo; // ⭐ ADICIONADO
    property Mensagem: String read FMensagem write FMensagem;
    property SenhaHash: string read FSenhaHash write FSenhaHash;
    property UsuarioEncontrado: Boolean read FUsuarioEncontrado write FUsuarioEncontrado;

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
  FEmailUsuario := ''; // ⭐ INICIALIZADO
  FIdCargo := 0;
  FDescCargo := '';
  FTipoUsuario := tuInvalido;
  FAutenticado := False;
  FAtivo := False; // ⭐ INICIALIZADO
  FMensagem := '';
  FSenhaHash := ''; // ⭐ INICIALIZADO
  FUsuarioEncontrado := False; // ⭐ INICIALIZADO
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
