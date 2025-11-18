unit FormaPagamentoClienteService;

interface

uses
  System.SysUtils, System.StrUtils, System.Generics.Collections,
  FormaPagamentoClienteModel, FormaPagamentoClienteRepository,
  Vcl.Dialogs, System.UITypes;

type
  TFormaPagamentoClienteService = class
  private
    FRepository: TFormaPagamentoClienteRepository;
  public
    constructor Create;
    destructor Destroy; override;

    // Listar todos os pagamentos do cliente
    function ListarPagamentos(IdCliente: Integer): TObjectList<TFormaPagamentoCliente>;

    // Obter pagamento específico
    function ObterPagamento(IdPagamento: Integer): TFormaPagamentoCliente;

    // Cadastrar novas formas de pagamento
    function CadastrarCartao(Cartao: TPagamentoCartao): Boolean;
    function CadastrarPix(Pix: TPagamentoPix): Boolean;
    function CadastrarTransferencia(Transferencia: TPagamentoTransferencia): Boolean;

    // Atualizar formas de pagamento existentes
    function AtualizarCartao(Cartao: TPagamentoCartao): Boolean;
    function AtualizarPix(Pix: TPagamentoPix): Boolean;
    function AtualizarTransferencia(Transferencia: TPagamentoTransferencia): Boolean;

    // Excluir forma de pagamento
    function ExcluirPagamento(IdPagamento: Integer): Boolean;

    // Definir como principal
    function DefinirComoPrincipal(IdPagamento: Integer; IdCliente: Integer): Boolean;

    // Validações específicas
    function ValidarCartao(Cartao: TPagamentoCartao): Boolean;
    function ValidarPix(Pix: TPagamentoPix): Boolean;
    function ValidarTransferencia(Transferencia: TPagamentoTransferencia): Boolean;

    // Obter pagamento principal do cliente
    function ObterPagamentoPrincipal(IdCliente: Integer): TFormaPagamentoCliente;

    // Verificar se cliente tem alguma forma de pagamento cadastrada
    function ClienteTemPagamentoCadastrado(IdCliente: Integer): Boolean;
  end;

implementation

{ TFormaPagamentoClienteService }

constructor TFormaPagamentoClienteService.Create;
begin
  inherited Create;
  FRepository := TFormaPagamentoClienteRepository.Create;
end;

destructor TFormaPagamentoClienteService.Destroy;
begin
  FRepository.Free;
  inherited;
end;

// ============================================================
// LISTAR E OBTER
// ============================================================

function TFormaPagamentoClienteService.ListarPagamentos(IdCliente: Integer): TObjectList<TFormaPagamentoCliente>;
begin
  try
    if IdCliente <= 0 then
      raise Exception.Create('ID do cliente inválido!');

    Result := FRepository.ListarPagamentos(IdCliente);

    if not Assigned(Result) then
      Result := TObjectList<TFormaPagamentoCliente>.Create(True);

  except
    on E: Exception do
    begin
      ShowMessage('Erro no Service ao listar formas de pagamento: ' + E.Message);
      Result := TObjectList<TFormaPagamentoCliente>.Create(True);
    end;
  end;
end;

function TFormaPagamentoClienteService.ObterPagamento(IdPagamento: Integer): TFormaPagamentoCliente;
begin
  try
    if IdPagamento <= 0 then
      raise Exception.Create('ID do pagamento inválido!');

    Result := FRepository.ObterPagamento(IdPagamento);

    if not Assigned(Result) then
      raise Exception.Create('Forma de pagamento não encontrada!');

  except
    on E: Exception do
    begin
      ShowMessage('Erro no Service ao obter forma de pagamento: ' + E.Message);
      Result := nil;
    end;
  end;
end;

function TFormaPagamentoClienteService.ObterPagamentoPrincipal(IdCliente: Integer): TFormaPagamentoCliente;
var
  Pagamentos: TObjectList<TFormaPagamentoCliente>;
  Pagamento: TFormaPagamentoCliente;
begin
  Result := nil;

  try
    Pagamentos := ListarPagamentos(IdCliente);
    try
      for Pagamento in Pagamentos do
      begin
        if Pagamento.Principal then
        begin
          Result := Pagamento;
          Break;
        end;
      end;
    finally
      // Não liberar a lista aqui, pois o objeto Result pertence a ela
    end;
  except
    on E: Exception do
    begin
      ShowMessage('Erro ao obter pagamento principal: ' + E.Message);
      Result := nil;
    end;
  end;
end;

function TFormaPagamentoClienteService.ClienteTemPagamentoCadastrado(IdCliente: Integer): Boolean;
var
  Pagamentos: TObjectList<TFormaPagamentoCliente>;
begin
  Result := False;

  try
    Pagamentos := ListarPagamentos(IdCliente);
    try
      Result := Pagamentos.Count > 0;
    finally
      Pagamentos.Free;
    end;
  except
    on E: Exception do
    begin
      ShowMessage('Erro ao verificar pagamentos: ' + E.Message);
      Result := False;
    end;
  end;
end;

// ============================================================
// VALIDAÇÕES
// ============================================================

function TFormaPagamentoClienteService.ValidarCartao(Cartao: TPagamentoCartao): Boolean;
var
  Mes, Ano: Integer;
begin
  Result := False;

  try
    // Validar apelido
    if Trim(Cartao.Apelido) = '' then
      raise Exception.Create('Informe um apelido para o cartão!');

    // Validar número do cartão (últimos 4 dígitos)
    if Trim(Cartao.NumeroCartao) = '' then
      raise Exception.Create('Informe os últimos 4 dígitos do cartão!');

    if Length(Trim(Cartao.NumeroCartao)) <> 4 then
      raise Exception.Create('Informe exatamente os 4 últimos dígitos!');

    // Validar se são apenas números
    if not TryStrToInt(Cartao.NumeroCartao, Ano) then
      raise Exception.Create('O número do cartão deve conter apenas dígitos!');

    // Validar nome do titular
    if Trim(Cartao.NomeTitular) = '' then
      raise Exception.Create('Informe o nome do titular do cartão!');

    if Length(Trim(Cartao.NomeTitular)) < 3 then
      raise Exception.Create('Nome do titular muito curto!');

    // Validar bandeira
    if Trim(Cartao.Bandeira) = '' then
      raise Exception.Create('Selecione a bandeira do cartão!');

    // Validar tipo
    if Trim(Cartao.TipoCartao) = '' then
      raise Exception.Create('Selecione o tipo do cartão!');

    if not ((Cartao.TipoCartao = 'Crédito') or (Cartao.TipoCartao = 'Débito')) then
      raise Exception.Create('Tipo de cartão inválido!');

    // Validar validade
    if Trim(Cartao.Validade) = '' then
      raise Exception.Create('Informe a validade do cartão!');

    if Length(Cartao.Validade) <> 7 then
      raise Exception.Create('Formato de validade inválido! Use MM/YYYY');

    if Cartao.Validade[3] <> '/' then
      raise Exception.Create('Formato de validade inválido! Use MM/YYYY');

    // Validar mês
    if not TryStrToInt(Copy(Cartao.Validade, 1, 2), Mes) then
      raise Exception.Create('Mês inválido!');

    if (Mes < 1) or (Mes > 12) then
      raise Exception.Create('Mês deve estar entre 01 e 12!');

    // Validar ano
    if not TryStrToInt(Copy(Cartao.Validade, 4, 4), Ano) then
      raise Exception.Create('Ano inválido!');

    if Ano < 2024 then
      raise Exception.Create('Ano inválido!');

    // Verificar se está vencido
    if Cartao.EstaVencido then
      raise Exception.Create('Este cartão está vencido!');

    Result := True;

  except
    on E: Exception do
    begin
      ShowMessage('Validação de cartão: ' + E.Message);
      Result := False;
    end;
  end;
end;

function TFormaPagamentoClienteService.ValidarPix(Pix: TPagamentoPix): Boolean;
begin
  Result := False;

  try
    // Validar apelido
    if Trim(Pix.Apelido) = '' then
      raise Exception.Create('Informe um apelido para a chave Pix!');

    // Validar chave
    if Trim(Pix.ChavePix) = '' then
      raise Exception.Create('Informe a chave Pix!');

    // Validar tipo de chave
    if Trim(Pix.TipoChavePix) = '' then
      raise Exception.Create('Selecione o tipo da chave Pix!');

    // Validações específicas por tipo (básicas)
    case AnsiIndexStr(Pix.TipoChavePix, ['CPF', 'CNPJ', 'Email', 'Telefone', 'Aleatória']) of
      0: // CPF
        begin
          if Length(Pix.ChavePix) < 11 then
            raise Exception.Create('CPF inválido!');
        end;

      1: // CNPJ
        begin
          if Length(Pix.ChavePix) < 14 then
            raise Exception.Create('CNPJ inválido!');
        end;

      2: // Email
        begin
          if Pos('@', Pix.ChavePix) = 0 then
            raise Exception.Create('Email inválido!');

          if Pos('.', Pix.ChavePix) = 0 then
            raise Exception.Create('Email inválido!');
        end;

      3: // Telefone
        begin
          if Length(Pix.ChavePix) < 10 then
            raise Exception.Create('Telefone inválido!');
        end;

      4: // Aleatória
        begin
          if Length(Pix.ChavePix) < 30 then
            raise Exception.Create('Chave aleatória inválida!');
        end;
    else
      raise Exception.Create('Tipo de chave Pix inválido!');
    end;

    Result := True;

  except
    on E: Exception do
    begin
      ShowMessage('Validação de Pix: ' + E.Message);
      Result := False;
    end;
  end;
end;

function TFormaPagamentoClienteService.ValidarTransferencia(Transferencia: TPagamentoTransferencia): Boolean;
begin
  Result := False;

  try
    // Validar apelido
    if Trim(Transferencia.Apelido) = '' then
      raise Exception.Create('Informe um apelido para a conta bancária!');

    // Validar banco
    if Trim(Transferencia.Banco) = '' then
      raise Exception.Create('Informe o banco!');

    // Validar agência
    if Trim(Transferencia.Agencia) = '' then
      raise Exception.Create('Informe a agência!');

    if Length(Trim(Transferencia.Agencia)) < 3 then
      raise Exception.Create('Agência inválida!');

    // Validar conta
    if Trim(Transferencia.Conta) = '' then
      raise Exception.Create('Informe o número da conta!');

    if Length(Trim(Transferencia.Conta)) < 3 then
      raise Exception.Create('Número da conta inválido!');

    // Validar tipo de conta
    if Trim(Transferencia.TipoConta) = '' then
      raise Exception.Create('Selecione o tipo da conta!');

    if not ((Transferencia.TipoConta = 'Corrente') or (Transferencia.TipoConta = 'Poupança')) then
      raise Exception.Create('Tipo de conta inválido!');

    Result := True;

  except
    on E: Exception do
    begin
      ShowMessage('Validação de transferência: ' + E.Message);
      Result := False;
    end;
  end;
end;

// ============================================================
// CADASTRAR
// ============================================================

function TFormaPagamentoClienteService.CadastrarCartao(Cartao: TPagamentoCartao): Boolean;
begin
  Result := False;

  try
    // Validar dados
    if not ValidarCartao(Cartao) then
      Exit;

    // Validar ID do cliente
    if Cartao.IdCliente <= 0 then
      raise Exception.Create('ID do cliente inválido!');

    // Cadastrar no Repository
    Result := FRepository.CadastrarCartao(Cartao);

    if Result then
      ShowMessage('✅ Cartão cadastrado com sucesso!')
    else
      ShowMessage('❌ Não foi possível cadastrar o cartão!');

  except
    on E: Exception do
    begin
      ShowMessage('Erro ao cadastrar cartão: ' + E.Message);
      Result := False;
    end;
  end;
end;

function TFormaPagamentoClienteService.CadastrarPix(Pix: TPagamentoPix): Boolean;
begin
  Result := False;

  try
    // Validar dados
    if not ValidarPix(Pix) then
      Exit;

    // Validar ID do cliente
    if Pix.IdCliente <= 0 then
      raise Exception.Create('ID do cliente inválido!');

    // Cadastrar no Repository
    Result := FRepository.CadastrarPix(Pix);

    if Result then
      ShowMessage('✅ Chave Pix cadastrada com sucesso!')
    else
      ShowMessage('❌ Não foi possível cadastrar a chave Pix!');

  except
    on E: Exception do
    begin
      ShowMessage('Erro ao cadastrar Pix: ' + E.Message);
      Result := False;
    end;
  end;
end;

function TFormaPagamentoClienteService.CadastrarTransferencia(Transferencia: TPagamentoTransferencia): Boolean;
begin
  Result := False;

  try
    // Validar dados
    if not ValidarTransferencia(Transferencia) then
      Exit;

    // Validar ID do cliente
    if Transferencia.IdCliente <= 0 then
      raise Exception.Create('ID do cliente inválido!');

    // Cadastrar no Repository
    Result := FRepository.CadastrarTransferencia(Transferencia);

    if Result then
      ShowMessage('✅ Conta bancária cadastrada com sucesso!')
    else
      ShowMessage('❌ Não foi possível cadastrar a conta bancária!');

  except
    on E: Exception do
    begin
      ShowMessage('Erro ao cadastrar conta bancária: ' + E.Message);
      Result := False;
    end;
  end;
end;

// ============================================================
// ATUALIZAR
// ============================================================

function TFormaPagamentoClienteService.AtualizarCartao(Cartao: TPagamentoCartao): Boolean;
begin
  Result := False;

  try
    // Validar ID
    if Cartao.IdPagamento <= 0 then
      raise Exception.Create('ID do pagamento inválido!');

    // Validar dados
    if not ValidarCartao(Cartao) then
      Exit;

    // Atualizar no Repository
    Result := FRepository.AtualizarCartao(Cartao);

    if Result then
      ShowMessage('✅ Cartão atualizado com sucesso!')
    else
      ShowMessage('❌ Não foi possível atualizar o cartão!');

  except
    on E: Exception do
    begin
      ShowMessage('Erro ao atualizar cartão: ' + E.Message);
      Result := False;
    end;
  end;
end;

function TFormaPagamentoClienteService.AtualizarPix(Pix: TPagamentoPix): Boolean;
begin
  Result := False;

  try
    // Validar ID
    if Pix.IdPagamento <= 0 then
      raise Exception.Create('ID do pagamento inválido!');

    // Validar dados
    if not ValidarPix(Pix) then
      Exit;

    // Atualizar no Repository
    Result := FRepository.AtualizarPix(Pix);

    if Result then
      ShowMessage('✅ Chave Pix atualizada com sucesso!')
    else
      ShowMessage('❌ Não foi possível atualizar a chave Pix!');

  except
    on E: Exception do
    begin
      ShowMessage('Erro ao atualizar Pix: ' + E.Message);
      Result := False;
    end;
  end;
end;

function TFormaPagamentoClienteService.AtualizarTransferencia(Transferencia: TPagamentoTransferencia): Boolean;
begin
  Result := False;

  try
    // Validar ID
    if Transferencia.IdPagamento <= 0 then
      raise Exception.Create('ID do pagamento inválido!');

    // Validar dados
    if not ValidarTransferencia(Transferencia) then
      Exit;

    // Atualizar no Repository
    Result := FRepository.AtualizarTransferencia(Transferencia);

    if Result then
      ShowMessage('✅ Conta bancária atualizada com sucesso!')
    else
      ShowMessage('❌ Não foi possível atualizar a conta bancária!');

  except
    on E: Exception do
    begin
      ShowMessage('Erro ao atualizar conta bancária: ' + E.Message);
      Result := False;
    end;
  end;
end;

// ============================================================
// EXCLUIR E DEFINIR PRINCIPAL
// ============================================================

function TFormaPagamentoClienteService.ExcluirPagamento(IdPagamento: Integer): Boolean;
begin
  Result := False;

  try
    // Validar ID
    if IdPagamento <= 0 then
      raise Exception.Create('ID do pagamento inválido!');

    // Confirmação
    if MessageDlg('Deseja realmente excluir esta forma de pagamento?',
                  mtConfirmation,
                  [mbYes, mbNo],
                  0) = mrNo then
      Exit;

    // Excluir no Repository
    Result := FRepository.ExcluirPagamento(IdPagamento);

    if Result then
      ShowMessage('✅ Forma de pagamento excluída com sucesso!')
    else
      ShowMessage('❌ Não foi possível excluir a forma de pagamento!');

  except
    on E: Exception do
    begin
      ShowMessage('Erro ao excluir forma de pagamento: ' + E.Message);
      Result := False;
    end;
  end;
end;

function TFormaPagamentoClienteService.DefinirComoPrincipal(IdPagamento: Integer; IdCliente: Integer): Boolean;
begin
  Result := False;

  try
    // Validar IDs
    if IdPagamento <= 0 then
      raise Exception.Create('ID do pagamento inválido!');

    if IdCliente <= 0 then
      raise Exception.Create('ID do cliente inválido!');

    // Definir no Repository
    Result := FRepository.DefinirComoPrincipal(IdPagamento, IdCliente);

    if Result then
      ShowMessage('✅ Forma de pagamento definida como principal!')
    else
      ShowMessage('❌ Não foi possível definir como principal!');

  except
    on E: Exception do
    begin
      ShowMessage('Erro ao definir pagamento principal: ' + E.Message);
      Result := False;
    end;
  end;
end;

end.
