unit FormaPagamentoClienteController;

interface

uses
  System.SysUtils, System.StrUtils, // ⭐ ADICIONAR System.StrUtils
  System.Generics.Collections,
  FormaPagamentoClienteModel, FormaPagamentoClienteService;

type
  TFormaPagamentoClienteController = class
  private
    FService: TFormaPagamentoClienteService;
  public
    constructor Create;
    destructor Destroy; override;

    function ListarPagamentos(IdCliente: Integer): TObjectList<TFormaPagamentoCliente>;
    function ObterPagamento(IdPagamento: Integer): TFormaPagamentoCliente;

    function CadastrarCartao(Cartao: TPagamentoCartao): Boolean;
    function CadastrarPix(Pix: TPagamentoPix): Boolean;
    function CadastrarTransferencia(Transferencia: TPagamentoTransferencia): Boolean;

    function AtualizarCartao(Cartao: TPagamentoCartao): Boolean;
    function AtualizarPix(Pix: TPagamentoPix): Boolean;
    function AtualizarTransferencia(Transferencia: TPagamentoTransferencia): Boolean;

    function ExcluirPagamento(IdPagamento: Integer): Boolean;
    function DefinirComoPrincipal(IdPagamento: Integer; IdCliente: Integer): Boolean;
  end;

implementation

{ TFormaPagamentoClienteController }

constructor TFormaPagamentoClienteController.Create;
begin
  inherited Create;
  FService := TFormaPagamentoClienteService.Create;
end;

destructor TFormaPagamentoClienteController.Destroy;
begin
  FService.Free;
  inherited;
end;

function TFormaPagamentoClienteController.ListarPagamentos(IdCliente: Integer): TObjectList<TFormaPagamentoCliente>;
begin
  try
    Result := FService.ListarPagamentos(IdCliente);
  except
    on E: Exception do
      raise Exception.Create('Erro ao listar formas de pagamento: ' + E.Message);
  end;
end;

function TFormaPagamentoClienteController.ObterPagamento(IdPagamento: Integer): TFormaPagamentoCliente;
begin
  try
    Result := FService.ObterPagamento(IdPagamento);

    if not Assigned(Result) then
      raise Exception.Create('Forma de pagamento não encontrada!');

  except
    on E: Exception do
      raise Exception.Create('Erro ao buscar forma de pagamento: ' + E.Message);
  end;
end;

function TFormaPagamentoClienteController.CadastrarCartao(Cartao: TPagamentoCartao): Boolean;
begin
  Result := False;

  try
    // Validações
    if Trim(Cartao.Apelido) = '' then
      raise Exception.Create('Informe um apelido para o cartão!');

    if Trim(Cartao.NumeroCartao) = '' then
      raise Exception.Create('Informe os últimos 4 dígitos do cartão!');

    if Length(Trim(Cartao.NumeroCartao)) <> 4 then
      raise Exception.Create('Informe exatamente os 4 últimos dígitos do cartão!');

    if Trim(Cartao.NomeTitular) = '' then
      raise Exception.Create('Informe o nome do titular do cartão!');

    if Trim(Cartao.Bandeira) = '' then
      raise Exception.Create('Selecione a bandeira do cartão!');

    if Trim(Cartao.TipoCartao) = '' then
      raise Exception.Create('Selecione o tipo do cartão (Crédito ou Débito)!');

    if Trim(Cartao.Validade) = '' then
      raise Exception.Create('Informe a validade do cartão!');

    // Validar formato da validade (MM/YYYY)
    if Length(Cartao.Validade) <> 7 then
      raise Exception.Create('Formato de validade inválido! Use MM/YYYY');

    if Cartao.Validade[3] <> '/' then
      raise Exception.Create('Formato de validade inválido! Use MM/YYYY');

    // Verificar se o cartão não está vencido
    if Cartao.EstaVencido then
      raise Exception.Create('Este cartão está vencido!');

    // Cadastrar no Service
    Result := FService.CadastrarCartao(Cartao);

    if not Result then
      raise Exception.Create('Não foi possível cadastrar o cartão!');

  except
    on E: Exception do
      raise Exception.Create('Erro ao cadastrar cartão: ' + E.Message);
  end;
end;

function TFormaPagamentoClienteController.CadastrarPix(Pix: TPagamentoPix): Boolean;
begin
  Result := False;

  try
    // Validações
    if Trim(Pix.Apelido) = '' then
      raise Exception.Create('Informe um apelido para a chave Pix!');

    if Trim(Pix.ChavePix) = '' then
      raise Exception.Create('Informe a chave Pix!');

    if Trim(Pix.TipoChavePix) = '' then
      raise Exception.Create('Selecione o tipo da chave Pix!');

    // Validações específicas por tipo de chave
    case AnsiIndexText(Pix.TipoChavePix, ['CPF', 'CNPJ', 'Email', 'Telefone', 'Aleatória']) of
      0: // CPF
        if Length(Pix.ChavePix) <> 14 then
          raise Exception.Create('CPF inválido! Use o formato: 000.000.000-00');

      1: // CNPJ
        if Length(Pix.ChavePix) <> 18 then
          raise Exception.Create('CNPJ inválido! Use o formato: 00.000.000/0000-00');

      2: // Email
        if Pos('@', Pix.ChavePix) = 0 then
          raise Exception.Create('Email inválido!');

      3: // Telefone
        if Length(Pix.ChavePix) < 14 then
          raise Exception.Create('Telefone inválido! Use o formato: (00)00000-0000');

      4: // Aleatória
        if Length(Pix.ChavePix) < 30 then
          raise Exception.Create('Chave aleatória inválida!');
    end;

    // Cadastrar no Service
    Result := FService.CadastrarPix(Pix);

    if not Result then
      raise Exception.Create('Não foi possível cadastrar a chave Pix!');

  except
    on E: Exception do
      raise Exception.Create('Erro ao cadastrar Pix: ' + E.Message);
  end;
end;

function TFormaPagamentoClienteController.CadastrarTransferencia(Transferencia: TPagamentoTransferencia): Boolean;
begin
  Result := False;

  try
    // Validações
    if Trim(Transferencia.Apelido) = '' then
      raise Exception.Create('Informe um apelido para a conta bancária!');

    if Trim(Transferencia.Banco) = '' then
      raise Exception.Create('Informe o banco!');

    if Trim(Transferencia.Agencia) = '' then
      raise Exception.Create('Informe a agência!');

    if Trim(Transferencia.Conta) = '' then
      raise Exception.Create('Informe o número da conta!');

    if Trim(Transferencia.TipoConta) = '' then
      raise Exception.Create('Selecione o tipo da conta!');

    // Cadastrar no Service
    Result := FService.CadastrarTransferencia(Transferencia);

    if not Result then
      raise Exception.Create('Não foi possível cadastrar a conta bancária!');

  except
    on E: Exception do
      raise Exception.Create('Erro ao cadastrar conta bancária: ' + E.Message);
  end;
end;

function TFormaPagamentoClienteController.AtualizarCartao(Cartao: TPagamentoCartao): Boolean;
begin
  Result := False;

  try
    if Cartao.IdPagamento <= 0 then
      raise Exception.Create('ID do pagamento inválido!');

    // Mesmas validações do cadastro
    if Trim(Cartao.Apelido) = '' then
      raise Exception.Create('Informe um apelido para o cartão!');

    if Trim(Cartao.NumeroCartao) = '' then
      raise Exception.Create('Informe os últimos 4 dígitos do cartão!');

    if Length(Trim(Cartao.NumeroCartao)) <> 4 then
      raise Exception.Create('Informe exatamente os 4 últimos dígitos do cartão!');

    if Trim(Cartao.NomeTitular) = '' then
      raise Exception.Create('Informe o nome do titular do cartão!');

    if Trim(Cartao.Bandeira) = '' then
      raise Exception.Create('Selecione a bandeira do cartão!');

    if Trim(Cartao.TipoCartao) = '' then
      raise Exception.Create('Selecione o tipo do cartão!');

    if Trim(Cartao.Validade) = '' then
      raise Exception.Create('Informe a validade do cartão!');

    if Cartao.EstaVencido then
      raise Exception.Create('Este cartão está vencido!');

    Result := FService.AtualizarCartao(Cartao);

    if not Result then
      raise Exception.Create('Não foi possível atualizar o cartão!');

  except
    on E: Exception do
      raise Exception.Create('Erro ao atualizar cartão: ' + E.Message);
  end;
end;

function TFormaPagamentoClienteController.AtualizarPix(Pix: TPagamentoPix): Boolean;
begin
  Result := False;

  try
    if Pix.IdPagamento <= 0 then
      raise Exception.Create('ID do pagamento inválido!');

    if Trim(Pix.Apelido) = '' then
      raise Exception.Create('Informe um apelido para a chave Pix!');

    if Trim(Pix.ChavePix) = '' then
      raise Exception.Create('Informe a chave Pix!');

    if Trim(Pix.TipoChavePix) = '' then
      raise Exception.Create('Selecione o tipo da chave Pix!');

    Result := FService.AtualizarPix(Pix);

    if not Result then
      raise Exception.Create('Não foi possível atualizar a chave Pix!');

  except
    on E: Exception do
      raise Exception.Create('Erro ao atualizar Pix: ' + E.Message);
  end;
end;

function TFormaPagamentoClienteController.AtualizarTransferencia(Transferencia: TPagamentoTransferencia): Boolean;
begin
  Result := False;

  try
    if Transferencia.IdPagamento <= 0 then
      raise Exception.Create('ID do pagamento inválido!');

    if Trim(Transferencia.Apelido) = '' then
      raise Exception.Create('Informe um apelido para a conta bancária!');

    if Trim(Transferencia.Banco) = '' then
      raise Exception.Create('Informe o banco!');

    if Trim(Transferencia.Agencia) = '' then
      raise Exception.Create('Informe a agência!');

    if Trim(Transferencia.Conta) = '' then
      raise Exception.Create('Informe o número da conta!');

    if Trim(Transferencia.TipoConta) = '' then
      raise Exception.Create('Selecione o tipo da conta!');

    Result := FService.AtualizarTransferencia(Transferencia);

    if not Result then
      raise Exception.Create('Não foi possível atualizar a conta bancária!');

  except
    on E: Exception do
      raise Exception.Create('Erro ao atualizar conta bancária: ' + E.Message);
  end;
end;

function TFormaPagamentoClienteController.ExcluirPagamento(IdPagamento: Integer): Boolean;
begin
  Result := False;

  try
    if IdPagamento <= 0 then
      raise Exception.Create('ID do pagamento inválido!');

    Result := FService.ExcluirPagamento(IdPagamento);

    if not Result then
      raise Exception.Create('Não foi possível excluir a forma de pagamento!');

  except
    on E: Exception do
      raise Exception.Create('Erro ao excluir forma de pagamento: ' + E.Message);
  end;
end;

function TFormaPagamentoClienteController.DefinirComoPrincipal(IdPagamento: Integer; IdCliente: Integer): Boolean;
begin
  Result := False;

  try
    if IdPagamento <= 0 then
      raise Exception.Create('ID do pagamento inválido!');

    if IdCliente <= 0 then
      raise Exception.Create('ID do cliente inválido!');

    Result := FService.DefinirComoPrincipal(IdPagamento, IdCliente);

    if not Result then
      raise Exception.Create('Não foi possível definir como principal!');

  except
    on E: Exception do
      raise Exception.Create('Erro ao definir pagamento principal: ' + E.Message);
  end;
end;

end.
