unit ComercioModel;

interface

type
  // Dados principais do comércio
  TComercio = class
  private
    FIdComercio: Integer;
    FIdUser: Integer;
    FNomeComercio: string;
    FCategoria: string;
    FDescricao: string;
    FHorarioAbertura: TTime;  // MUDOU DE TDate PARA TTime
    FHorarioFechamento: TTime;  // MUDOU DE TDate PARA TTime
    FTempoPreparoMedio: Integer;
    FTaxaEntregaBase: Currency;

    // Contato
    FEmailComercio: string;
    FNPhoneComercio: string;
    FCpfCnpjComercio: string;

    // Localização
    FEnderecoCompleto: string;
    FCEP: string;
    FNumero: string;
    FComplemento: string;
    FBairro: string;
    FCidade: string;
    FEstado: string;

    // Proprietário (vem do JOIN com usuarios)
    FNomeProprietario: string;
    FEmailProprietario: string;
    FCPFProprietario: string;
    FNPhoneProprietario: string;
  public
    property IdComercio: Integer read FIdComercio write FIdComercio;
    property IdUser: Integer read FIdUser write FIdUser;
    property NomeComercio: string read FNomeComercio write FNomeComercio;
    property Categoria: string read FCategoria write FCategoria;
    property Descricao: string read FDescricao write FDescricao;
    property HorarioAbertura: TTime read FHorarioAbertura write FHorarioAbertura;  // TTime
    property HorarioFechamento: TTime read FHorarioFechamento write FHorarioFechamento;  // TTime
    property TempoPreparoMedio: Integer read FTempoPreparoMedio write FTempoPreparoMedio;
    property TaxaEntregaBase: Currency read FTaxaEntregaBase write FTaxaEntregaBase;

    property EmailComercio: string read FEmailComercio write FEmailComercio;
    property NPhoneComercio: string read FNPhoneComercio write FNPhoneComercio;
    property CpfCnpjComercio: string read FCpfCnpjComercio write FCpfCnpjComercio;

    property EnderecoCompleto: string read FEnderecoCompleto write FEnderecoCompleto;
    property CEP: string read FCEP write FCEP;
    property Numero: string read FNumero write FNumero;
    property Complemento: string read FComplemento write FComplemento;
    property Bairro: string read FBairro write FBairro;
    property Cidade: string read FCidade write FCidade;
    property Estado: string read FEstado write FEstado;

    property NomeProprietario: string read FNomeProprietario write FNomeProprietario;
    property EmailProprietario: string read FEmailProprietario write FEmailProprietario;
    property CPFProprietario: string read FCPFProprietario write FCPFProprietario;
    property NPhoneProprietario: string read FNPhoneProprietario write FNPhoneProprietario;

    constructor Create;
    destructor Destroy; override;
  end;

  // Model para alteração de senha
  TAlterarSenhaRequest = class
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

{ TComercio }

constructor TComercio.Create;
begin
  inherited Create;
  FIdComercio := 0;
  FIdUser := 0;
  FNomeComercio := '';
  FCategoria := '';
  FDescricao := '';
  FTempoPreparoMedio := 0;
  FTaxaEntregaBase := 0;
  FEmailComercio := '';
  FNPhoneComercio := '';
  FCpfCnpjComercio := '';
  FEnderecoCompleto := '';
  FCEP := '';
  FNumero := '';
  FComplemento := '';
  FBairro := '';
  FCidade := '';
  FEstado := '';
  FNomeProprietario := '';
  FEmailProprietario := '';
  FCPFProprietario := '';
  FNPhoneProprietario := '';
end;

destructor TComercio.Destroy;
begin
  inherited;
end;

{ TAlterarSenhaRequest }

constructor TAlterarSenhaRequest.Create;
begin
  inherited Create;
  FIdUsuario := 0;
  FSenhaAtual := '';
  FSenhaNova := '';
  FSenhaConfirmacao := '';
end;

destructor TAlterarSenhaRequest.Destroy;
begin
  inherited;
end;

end.
