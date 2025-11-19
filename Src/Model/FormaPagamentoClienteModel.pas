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
    function GetIcone: String; virtual;
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
    function GetIcone: String; override;
    function ValidarDados(out MsgErro: String): Boolean;
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
    function GetIcone: String; override;
    function ValidarDados(out MsgErro: String): Boolean;
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
    function GetIcone: String; override;
    function ValidarDados(out MsgErro: String): Boolean;
  end;

implementation

uses
  System.SysUtils, System.DateUtils, System.StrUtils;

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

function TFormaPagamentoCliente.GetIcone: String;
begin
  case FTipoPagamento of
    tpCartao: Result := '💳';
    tpPix: Result := '🔄';
    tpTransferencia: Result := '🏦';
    tpDinheiro: Result := '💵';
  else
    Result := '💰';
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

function TPagamentoCartao.GetIcone: String;
begin
  // Ícone baseado na bandeira
  if ContainsText(FBandeira, 'Visa') then
    Result := '💳'
  else if ContainsText(FBandeira, 'Master') then
    Result := '💳'
  else if ContainsText(FBandeira, 'Elo') then
    Result := '💳'
  else if ContainsText(FBandeira, 'Amex') then
    Result := '💳'
  else
    Result := '💳';
end;

function TPagamentoCartao.ValidarDados(out MsgErro: String): Boolean;
begin
  Result := False;
  MsgErro := '';

  if Trim(FApelido) = '' then
  begin
    MsgErro := 'Informe um apelido para o cartão!';
    Exit;
  end;

  if Trim(FNumeroCartao) = '' then
  begin
    MsgErro := 'Informe o número do cartão!';
    Exit;
  end;

  if Length(FNumeroCartao) < 4 then
  begin
    MsgErro := 'Número do cartão inválido!';
    Exit;
  end;

  if Trim(FNomeTitular) = '' then
  begin
    MsgErro := 'Informe o nome do titular!';
    Exit;
  end;

  if Trim(FBandeira) = '' then
  begin
    MsgErro := 'Selecione a bandeira!';
    Exit;
  end;

  if Trim(FValidade) = '' then
  begin
    MsgErro := 'Informe a validade!';
    Exit;
  end;

  if Length(FValidade) <> 7 then // MM/YYYY
  begin
    MsgErro := 'Validade inválida! Use o formato MM/AAAA';
    Exit;
  end;

  if EstaVencido then
  begin
    MsgErro := 'Este cartão está vencido!';
    Exit;
  end;

  Result := True;
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

function TPagamentoPix.GetIcone: String;
begin
  Result := '🔄';
end;

function TPagamentoPix.ValidarDados(out MsgErro: String): Boolean;
begin
  Result := False;
  MsgErro := '';

  if Trim(FApelido) = '' then
  begin
    MsgErro := 'Informe um apelido para a chave Pix!';
    Exit;
  end;

  if Trim(FChavePix) = '' then
  begin
    MsgErro := 'Informe a chave Pix!';
    Exit;
  end;

  if Trim(FTipoChavePix) = '' then
  begin
    MsgErro := 'Selecione o tipo de chave Pix!';
    Exit;
  end;

  Result := True;
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

function TPagamentoTransferencia.GetIcone: String;
begin
  Result := '🏦';
end;

function TPagamentoTransferencia.ValidarDados(out MsgErro: String): Boolean;
begin
  Result := False;
  MsgErro := '';

  if Trim(FApelido) = '' then
  begin
    MsgErro := 'Informe um apelido para a conta!';
    Exit;
  end;

  if Trim(FBanco) = '' then
  begin
    MsgErro := 'Informe o banco!';
    Exit;
  end;

  if Trim(FCodigoBanco) = '' then
  begin
    MsgErro := 'Informe o código do banco!';
    Exit;
  end;

  if Trim(FAgencia) = '' then
  begin
    MsgErro := 'Informe a agência!';
    Exit;
  end;

  if Trim(FConta) = '' then
  begin
    MsgErro := 'Informe o número da conta!';
    Exit;
  end;

  if Trim(FTipoConta) = '' then
  begin
    MsgErro := 'Selecione o tipo de conta!';
    Exit;
  end;

  Result := True;
end;

end.
