unit EnderecoClienteModel;

interface

type
  TEnderecoCliente = class
  private
    FIdEndereco: Integer;
    FIdCliente: Integer;
    FApelido: String;
    FLogradouro: String;
    FCEP: String;
    FNumero: String;
    FComplemento: String;
    FBairro: String;
    FCidade: String;
    FUF: String;
    FPrincipal: Boolean;
  public
    property IdEndereco: Integer read FIdEndereco write FIdEndereco;
    property IdCliente: Integer read FIdCliente write FIdCliente;
    property Apelido: String read FApelido write FApelido;
    property Logradouro: String read FLogradouro write FLogradouro;
    property CEP: String read FCEP write FCEP;
    property Numero: String read FNumero write FNumero;
    property Complemento: String read FComplemento write FComplemento;
    property Bairro: String read FBairro write FBairro;
    property Cidade: String read FCidade write FCidade;
    property UF: String read FUF write FUF;
    property Principal: Boolean read FPrincipal write FPrincipal;

    constructor Create;
    function EnderecoCompleto: String;
  end;

implementation

uses
  System.SysUtils;

{ TEnderecoCliente }

constructor TEnderecoCliente.Create;
begin
  inherited;
  FIdEndereco := 0;
  FIdCliente := 0;
  FApelido := '';
  FLogradouro := '';
  FCEP := '';
  FNumero := '';
  FComplemento := '';
  FBairro := '';
  FCidade := '';
  FUF := '';
  FPrincipal := False;
end;

function TEnderecoCliente.EnderecoCompleto: String;
begin
  Result := Format('%s, %s - %s, %s/%s - CEP: %s',
    [FLogradouro, FNumero, FBairro, FCidade, FUF, FCEP]);

  if Trim(FComplemento) <> '' then
    Result := Format('%s, %s, %s - %s, %s/%s - CEP: %s',
      [FLogradouro, FNumero, FComplemento, FBairro, FCidade, FUF, FCEP]);
end;

end.
