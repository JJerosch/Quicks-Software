unit ClienteModel;

interface

type
  TCliente = class
  private
    FIdCliente: Integer;
    FIdUser: Integer;

    // Dados do usuário (vem do JOIN)
    FNomeUser: string;
    FEmailUser: string;
    FCpfUser: string;
    FNPhoneUser: string;

    // Endereço
    FLogradouro: string;
    FCEP: string;
    FNumero: string;
    FComplemento: string;
    FBairro: string;
    FCidade: string;
    FUF: string;

  public
    property IdCliente: Integer read FIdCliente write FIdCliente;
    property IdUser: Integer read FIdUser write FIdUser;

    property NomeUser: string read FNomeUser write FNomeUser;
    property EmailUser: string read FEmailUser write FEmailUser;
    property CpfUser: string read FCpfUser write FCpfUser;
    property NPhoneUser: string read FNPhoneUser write FNPhoneUser;

    property Logradouro: string read FLogradouro write FLogradouro;
    property CEP: string read FCEP write FCEP;
    property Numero: string read FNumero write FNumero;
    property Complemento: string read FComplemento write FComplemento;
    property Bairro: string read FBairro write FBairro;
    property Cidade: string read FCidade write FCidade;
    property UF: string read FUF write FUF;

    constructor Create;
    destructor Destroy; override;
  end;

  // Model para alteração de senha
  TAlterarSenhaClienteRequest = class
  private
    FIdUsuario: Integer;
    FSenhaAtual: string;
    FSenhaNova: string;
    FSenhaConfirmacao: string;
  public
    property IdUsuario: Integer read FIdUsuario write FIdUsuario;
    property SenhaAtual: string read FSenhaAtual write FSenhaAtual;
    property SenhaNova: string read FSenhaNova write FSenhaNova;
    property SenhaConfirmacao: string read FSenhaConfirmacao write FSenhaConfirmacao;

    constructor Create;
    destructor Destroy; override;
  end;

implementation

{ TCliente }

constructor TCliente.Create;
begin
  inherited Create;
  FIdCliente := 0;
  FIdUser := 0;
  FNomeUser := '';
  FEmailUser := '';
  FCpfUser := '';
  FNPhoneUser := '';
  FLogradouro := '';
  FCEP := '';
  FNumero := '';
  FComplemento := '';
  FBairro := '';
  FCidade := '';
  FUF := '';
end;

destructor TCliente.Destroy;
begin
  inherited;
end;

{ TAlterarSenhaClienteRequest }

constructor TAlterarSenhaClienteRequest.Create;
begin
  inherited Create;
  FIdUsuario := 0;
  FSenhaAtual := '';
  FSenhaNova := '';
  FSenhaConfirmacao := '';
end;

destructor TAlterarSenhaClienteRequest.Destroy;
begin
  inherited;
end;

end.
