unit EntregadorModel;

interface

type
  // ⭐ Endereço de Origem (fixo, armazenado na tabela entregadores)
  TEnderecoOrigem = class
  private
    FLogradouro: String;
    FNumero: String;
    FComplemento: String;
    FBairro: String;
    FCidade: String;
    FUF: String;
    FCEP: String;
  public
    property Logradouro: String read FLogradouro write FLogradouro;
    property Numero: String read FNumero write FNumero;
    property Complemento: String read FComplemento write FComplemento;
    property Bairro: String read FBairro write FBairro;
    property Cidade: String read FCidade write FCidade;
    property UF: String read FUF write FUF;
    property CEP: String read FCEP write FCEP;

    constructor Create;
    function EnderecoCompleto: String;
  end;

  // ⭐ Endereço Atual (dinâmico, armazenado em enderecos_entregadores)
  TEnderecoAtual = class
  private
    FIdEnderecoAtual: Integer;
    FIdEntregador: Integer;
    FLogradouro: String;
    FNumero: String;
    FComplemento: String;
    FBairro: String;
    FCidade: String;
    FUF: String;
    FCEP: String;
  public
    property IdEnderecoAtual: Integer read FIdEnderecoAtual write FIdEnderecoAtual;
    property IdEntregador: Integer read FIdEntregador write FIdEntregador;
    property Logradouro: String read FLogradouro write FLogradouro;
    property Numero: String read FNumero write FNumero;
    property Complemento: String read FComplemento write FComplemento;
    property Bairro: String read FBairro write FBairro;
    property Cidade: String read FCidade write FCidade;
    property UF: String read FUF write FUF;
    property CEP: String read FCEP write FCEP;

    constructor Create;
    function EnderecoCompleto: String;
  end;

  // ⭐ Model principal do Entregador
  TEntregador = class
  private
    FIdEntregador: Integer;
    FIdUser: Integer;

    // Dados do usuário (vêm do JOIN com usuarios)
    FNomeUsuario: String;
    FEmailUsuario: String;
    FCPFUsuario: String;
    FTelefoneUsuario: String;

    // Status de expediente
    FEmExpediente: Boolean;

    // Endereços
    FEnderecoOrigem: TEnderecoOrigem;
    FEnderecoAtual: TEnderecoAtual; // Último endereço registrado
  public
    property IdEntregador: Integer read FIdEntregador write FIdEntregador;
    property IdUser: Integer read FIdUser write FIdUser;

    property NomeUsuario: String read FNomeUsuario write FNomeUsuario;
    property EmailUsuario: String read FEmailUsuario write FEmailUsuario;
    property CPFUsuario: String read FCPFUsuario write FCPFUsuario;
    property TelefoneUsuario: String read FTelefoneUsuario write FTelefoneUsuario;

    property EmExpediente: Boolean read FEmExpediente write FEmExpediente;

    property EnderecoOrigem: TEnderecoOrigem read FEnderecoOrigem write FEnderecoOrigem;
    property EnderecoAtual: TEnderecoAtual read FEnderecoAtual write FEnderecoAtual;

    constructor Create;
    destructor Destroy; override;
  end;

  // ⭐ Request para alterar senha do entregador
  TAlterarSenhaEntregadorRequest = class
  private
    FIdUsuario: Integer;
    FSenhaAtual: String;
    FSenhaNova: String;
    FSenhaConfirmacao: String;
  public
    property IdUsuario: Integer read FIdUsuario write FIdUsuario;
    property SenhaAtual: String read FSenhaAtual write FSenhaAtual;
    property SenhaNova: String read FSenhaNova write FSenhaNova;
    property SenhaConfirmacao: String read FSenhaConfirmacao write FSenhaConfirmacao;

    constructor Create;
  end;

implementation

uses
  System.SysUtils;

{ TEnderecoOrigem }

constructor TEnderecoOrigem.Create;
begin
  inherited;
  FLogradouro := '';
  FNumero := '';
  FComplemento := '';
  FBairro := '';
  FCidade := '';
  FUF := '';
  FCEP := '';
end;

function TEnderecoOrigem.EnderecoCompleto: String;
begin
  Result := Format('%s, %s - %s, %s/%s - CEP: %s',
    [FLogradouro, FNumero, FBairro, FCidade, FUF, FCEP]);

  if Trim(FComplemento) <> '' then
    Result := Format('%s, %s, %s - %s, %s/%s - CEP: %s',
      [FLogradouro, FNumero, FComplemento, FBairro, FCidade, FUF, FCEP]);
end;

{ TEnderecoAtual }

constructor TEnderecoAtual.Create;
begin
  inherited;
  FIdEnderecoAtual := 0;
  FIdEntregador := 0;
  FLogradouro := '';
  FNumero := '';
  FComplemento := '';
  FBairro := '';
  FCidade := '';
  FUF := '';
  FCEP := '';
end;

function TEnderecoAtual.EnderecoCompleto: String;
begin
  Result := Format('%s, %s - %s, %s/%s - CEP: %s',
    [FLogradouro, FNumero, FBairro, FCidade, FUF, FCEP]);

  if Trim(FComplemento) <> '' then
    Result := Format('%s, %s, %s - %s, %s/%s - CEP: %s',
      [FLogradouro, FNumero, FComplemento, FBairro, FCidade, FUF, FCEP]);
end;

{ TEntregador }

constructor TEntregador.Create;
begin
  inherited;
  FIdEntregador := 0;
  FIdUser := 0;
  FNomeUsuario := '';
  FEmailUsuario := '';
  FCPFUsuario := '';
  FTelefoneUsuario := '';
  FEmExpediente := False; // ⭐ Começa fora de expediente

  FEnderecoOrigem := TEnderecoOrigem.Create;
  FEnderecoAtual := TEnderecoAtual.Create;
end;

destructor TEntregador.Destroy;
begin
  FEnderecoOrigem.Free;
  FEnderecoAtual.Free;
  inherited;
end;

{ TAlterarSenhaEntregadorRequest }

constructor TAlterarSenhaEntregadorRequest.Create;
begin
  inherited;
  FIdUsuario := 0;
  FSenhaAtual := '';
  FSenhaNova := '';
  FSenhaConfirmacao := '';
end;

end.
