unit FormaPagamentoClienteModel;

interface

type
  // ⭐ Enumerador para tipos de pagamento
  TTipoPagamento = (tpCartao, tpPix, tpTransferencia, tpDinheiro);

  // ⭐ Classe base
  TFormaPagamentoCliente = class
  private
    FIdPagamento: Integer;
    FIdCliente: Integer;
    FTipoPagamento: TTipoPagamento;
    FApelido: String;
    FPrincipal: Boolean;
    FAtivo: Boolean;
  public
    property IdPagamento: Integer read FIdPagamento write FIdPagamento;
    property IdCliente: Integer read FIdCliente write FIdCliente;
    property TipoPagamento: TTipoPagamento read FTipoPagamento write FTipoPagamento;
    property Apelido: String read FApelido write FApelido;
    property Principal: Boolean read FPrincipal write FPrincipal;
    property Ativo: Boolean read FAtivo write FAtivo;

    constructor Create; virtual;
    function TipoPagamentoToString: String;
    function DescricaoCompleta: String; virtual; abstract;
  end;

  // ⭐ Cartão (Crédito ou Débito)
  TPagamentoCartao = class(TFormaPagamentoCliente)
  private
    FIdCartao: Integer;
    FNumeroCartao: String; // Últimos 4 dígitos
    FNomeTitular: String;
    FBandeira: String;
    FTipoCartao: String; // 'Crédito' ou 'Débito'
    FValidade: String; // MM/YYYY
  public
    property IdCartao: Integer read FIdCartao write FIdCartao;
    property NumeroCartao: String read FNumeroCartao write FNumeroCartao;
    property NomeTitular: String read FNomeTitular write FNomeTitular;
    property Bandeira: String read FBandeira write FBandeira;
    property TipoCartao: String read FTipoCartao write FTipoCartao;
    property Validade: String read FValidade write FValidade;

    constructor Create; override;
    function DescricaoCompleta: String; override;
    function EstaVencido: Boolean;
  end;

  // ⭐ Pix
  TPagamentoPix = class(TFormaPagamentoCliente)
  private
    FIdPix: Integer;
    FChavePix: String;
    FTipoChavePix: String; // 'CPF', 'Email', 'Telefone', 'Aleatória'
  public
    property IdPix: Integer read FIdPix write FIdPix;
    property ChavePix: String read FChavePix write FChavePix;
    property TipoChavePix: String read FTipoChavePix write FTipoChavePix;

    constructor Create; override;
    function DescricaoCompleta: String; override;
  end;

  // ⭐ Transferência Bancária
  TPagamentoTransferencia = class(TFormaPagamentoCliente)
  private
    FIdTransferencia: Integer;
    FBanco: String;
    FCodigoBanco: String;
    FAgencia: String;
    FConta: String;
    FDigitoConta: String;
    FTipoConta: String; // 'Corrente', 'Poupança'
  public
    property IdTransferencia: Integer read FIdTransferencia write FIdTransferencia;
    property Banco: String read FBanco write FBanco;
    property CodigoBanco: String read FCodigoBanco write FCodigoBanco;
    property Agencia: String read FAgencia write FAgencia;
    property Conta: String read FConta write FConta;
    property DigitoC: String read FDigitoConta write FDigitoConta;
    property TipoConta: String read FTipoConta write FTipoConta;

    constructor Create; override;
    function DescricaoCompleta: String; override;
  end;

implementation

uses
  System.SysUtils, System.DateUtils;

{ TFormaPagamentoCliente }

constructor TFormaPagamentoCliente.Create;
begin
  inherited Create;
  FIdPagamento := 0;
  FIdCliente := 0;
  FApelido := '';
  FPrincipal := False;
  FAtivo := True;
end;

function TFormaPagamentoCliente.TipoPagamentoToString: String;
begin
  case FTipoPagamento of
    tpCartao: Result := 'Cartão';
    tpPix: Result := 'Pix';
    tpTransferencia: Result := 'Transferência';
    tpDinheiro: Result := 'Dinheiro';
  else
    Result := 'Desconhecido';
  end;
end;

{ TPagamentoCartao }

constructor TPagamentoCartao.Create;
begin
  inherited;
  FTipoPagamento := tpCartao;
  FIdCartao := 0;
  FNumeroCartao := '';
  FNomeTitular := '';
  FBandeira := '';
  FTipoCartao := 'Crédito';
  FValidade := '';
end;

function TPagamentoCartao.DescricaoCompleta: String;
begin
  Result := Format('%s %s **** %s - Validade: %s',
    [FTipoCartao, FBandeira, FNumeroCartao, FValidade]);
end;

function TPagamentoCartao.EstaVencido: Boolean;
var
  Mes, Ano: Integer;
  DataValidade: TDateTime;
begin
  Result := False;

  if Length(FValidade) = 7 then // MM/YYYY
  begin
    try
      Mes := StrToInt(Copy(FValidade, 1, 2));
      Ano := StrToInt(Copy(FValidade, 4, 4));

      // Último dia do mês de validade
      DataValidade := EndOfAMonth(Ano, Mes);

      Result := Now > DataValidade;
    except
      Result := False;
    end;
  end;
end;

{ TPagamentoPix }

constructor TPagamentoPix.Create;
begin
  inherited;
  FTipoPagamento := tpPix;
  FIdPix := 0;
  FChavePix := '';
  FTipoChavePix := '';
end;

function TPagamentoPix.DescricaoCompleta: String;
begin
  Result := Format('Pix - %s: %s', [FTipoChavePix, FChavePix]);
end;

{ TPagamentoTransferencia }

constructor TPagamentoTransferencia.Create;
begin
  inherited;
  FTipoPagamento := tpTransferencia;
  FIdTransferencia := 0;
  FBanco := '';
  FCodigoBanco := '';
  FAgencia := '';
  FConta := '';
  FDigitoConta := '';
  FTipoConta := 'Corrente';
end;

function TPagamentoTransferencia.DescricaoCompleta: String;
begin
  Result := Format('%s - Ag: %s Conta: %s-%s (%s)',
    [FBanco, FAgencia, FConta, FDigitoConta, FTipoConta]);
end;

end.
