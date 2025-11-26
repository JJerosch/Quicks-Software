unit LogSistema;

interface

uses
  System.SysUtils, System.Classes, System.IOUtils;

type
  TLogSistema = class
  private
    class var FLogPath: String;
    class function GetLogPath: String; static;
    class function GetLogFileName: String; static;
    class function FormatarLog(const Usuario, Acao: String): String; static;
    class function FormatarLogErro(const Usuario, Acao, Erro: String): String; static;
    class function FormatarLogDetalhado(const Usuario, Acao, Detalhes: String): String; static;
    class procedure EscreverLog(const Texto: String); static;
  public
    // ===== AUTENTICAÇÃO =====
    class procedure RegistrarLogin(const Usuario: String); static;
    class procedure RegistrarLogout(const Usuario: String); static;
    class procedure RegistrarTentativaLoginFalha(const Usuario, Motivo: String); static;

    // ===== PERFIL =====
    class procedure RegistrarAcessoPerfil(const Usuario: String); static;
    class procedure RegistrarEdicaoPerfil(const Usuario: String); static;
    class procedure RegistrarAlteracaoSenha(const Usuario: String); static;
    class procedure RegistrarCancelamentoEdicao(const Usuario: String); static;

    // ===== USUÁRIOS (ADMIN) =====
    class procedure RegistrarCadastroUsuario(const Admin, NovoUsuario: String); static;
    class procedure RegistrarAtualizacaoUsuario(const Admin, Usuario: String); static;
    class procedure RegistrarDesativacaoUsuario(const Admin, Usuario: String); static;
    class procedure RegistrarReativacaoUsuario(const Admin, Usuario: String); static;
    class procedure RegistrarBuscaUsuario(const Admin, TermoBusca: String); static;

    // ===== PRODUTOS (DONO) =====
    class procedure RegistrarCadastroProduto(const Usuario, NomeProduto: String; Preco: Currency); static;
    class procedure RegistrarAtualizacaoProduto(const Usuario, NomeProduto: String); static;
    class procedure RegistrarDesativacaoProduto(const Usuario, NomeProduto: String); static;
    class procedure RegistrarReativacaoProduto(const Usuario, NomeProduto: String); static;
    class procedure RegistrarBuscaProduto(const Usuario, TermoBusca: String); static;

    // ===== COMÉRCIO (DONO) =====
    class procedure RegistrarAtualizacaoComercio(const Usuario, NomeComercio: String); static;
    class procedure RegistrarAlteracaoHorario(const Usuario, HorarioAbertura, HorarioFechamento: String); static;
    class procedure RegistrarAlteracaoTaxaEntrega(const Usuario: String; NovaTaxa: Currency); static;

    // ===== PEDIDOS =====
    class procedure RegistrarNovoPedido(const Usuario: String; IdPedido: Integer; ValorTotal: Currency); static;
    class procedure RegistrarCancelamentoPedido(const Usuario: String; IdPedido: Integer; Motivo: String); static;
    class procedure RegistrarAlteracaoStatusPedido(const Usuario: String; IdPedido, NovoStatus: Integer); static;
    class procedure RegistrarAceitePedido(const Usuario: String; IdPedido: Integer); static;
    class procedure RegistrarRecusaPedido(const Usuario: String; IdPedido: Integer); static;
    class procedure RegistrarVisualizacaoDetalhesPedido(const Usuario: String; IdPedido: Integer); static;

    // ===== ENTREGADOR =====
    class procedure RegistrarInicioExpediente(const Usuario: String; IdEntregador: Integer); static;
    class procedure RegistrarFimExpediente(const Usuario: String; IdEntregador: Integer); static;
    class procedure RegistrarAceiteEntrega(const Usuario: String; IdPedido: Integer); static;
    class procedure RegistrarEntregaACaminho(const Usuario: String; IdPedido: Integer); static;
    class procedure RegistrarEntregaConcluida(const Usuario: String; IdPedido: Integer); static;

    // ===== CLIENTE =====
    class procedure RegistrarAcessoCardapio(const Usuario: String; IdComercio: Integer; NomeComercio: String); static;
    class procedure RegistrarAdicionarCarrinho(const Usuario, NomeProduto: String; Quantidade: Integer); static;
    class procedure RegistrarRemoverCarrinho(const Usuario, NomeProduto: String); static;
    class procedure RegistrarLimparCarrinho(const Usuario: String; QtdItens: Integer); static;
    class procedure RegistrarFinalizacaoPedido(const Usuario: String; IdPedido: Integer; ValorTotal: Currency); static;
    class procedure RegistrarAvaliacao(const Usuario: String; IdComercio: Integer; Nota: Integer); static;

    // ===== ENDEREÇOS =====
    class procedure RegistrarCadastroEndereco(const Usuario, Apelido: String); static;
    class procedure RegistrarAtualizacaoEndereco(const Usuario, Apelido: String); static;
    class procedure RegistrarExclusaoEndereco(const Usuario, Apelido: String); static;
    class procedure RegistrarDefinirEnderecoPrincipal(const Usuario, Apelido: String); static;

    // ===== PAGAMENTOS =====
    class procedure RegistrarCadastroPagamento(const Usuario, TipoPagamento, Apelido: String); static;
    class procedure RegistrarAtualizacaoPagamento(const Usuario, TipoPagamento, Apelido: String); static;
    class procedure RegistrarExclusaoPagamento(const Usuario, TipoPagamento: String); static;
    class procedure RegistrarDefinirPagamentoPrincipal(const Usuario, Apelido: String); static;

    // ===== RELATÓRIOS =====
    class procedure RegistrarGeracaoRelatorio(const Usuario, TipoRelatorio: String; DataInicio, DataFim: TDateTime); static;
    class procedure RegistrarExportacaoRelatorio(const Usuario, TipoRelatorio, Formato: String); static;

    // ===== NAVEGAÇÃO =====
    class procedure RegistrarAcessoTela(const Usuario, NomeTela: String); static;
    class procedure RegistrarBuscaComercio(const Usuario, TermoBusca: String); static;
    class procedure RegistrarFiltroCategoria(const Usuario, Categoria: String); static;

    // ===== GENÉRICOS =====
    class procedure RegistrarAcaoUsuario(const Usuario, Acao: String); static;
    class procedure RegistrarAcaoDetalhada(const Usuario, Acao, Detalhes: String); static;
    class procedure RegistrarErro(const Usuario, Acao, MensagemErro: String); static;
    class procedure RegistrarErroValidacao(const Usuario, Campo, Erro: String); static;
    class procedure RegistrarErroSenha(const Usuario, Erro: String); static;
    class procedure RegistrarErroSistema(const Contexto, MensagemErro: String); static;

    // ===== LEITURA DE LOGS =====
    class function LerUltimosLogs(Quantidade: Integer = 10): TStringList; static;
    class function LerLogsDeHoje: TStringList; static;
    class function LerLogsPorUsuario(const Usuario: String; Quantidade: Integer = 50): TStringList; static;
    class function LerLogsPorPeriodo(DataInicio, DataFim: TDateTime): TStringList; static;
    class procedure LimparLogsAntigos(DiasParaManter: Integer = 30); static;
  end;

implementation

{ TLogSistema }

class function TLogSistema.GetLogPath: String;
begin
  if FLogPath = '' then
  begin
    FLogPath := 'C:\Users\jpjer\Documents\Embarcadero\Studio\Projects\Quicks-Software\log\';

    if not DirectoryExists(FLogPath) then
      ForceDirectories(FLogPath);
  end;

  Result := FLogPath;
end;

class function TLogSistema.GetLogFileName: String;
begin
  Result := GetLogPath + 'log_sistema.txt';
end;

class function TLogSistema.FormatarLog(const Usuario, Acao: String): String;
begin
  Result := Format('[%s] - %s - %s',
    [FormatDateTime('dd/mm/yyyy hh:nn:ss', Now), Usuario, Acao]);
end;

class function TLogSistema.FormatarLogErro(const Usuario, Acao, Erro: String): String;
begin
  Result := Format('[%s] - %s - %s - ERRO: %s',
    [FormatDateTime('dd/mm/yyyy hh:nn:ss', Now), Usuario, Acao, Erro]);
end;

class function TLogSistema.FormatarLogDetalhado(const Usuario, Acao, Detalhes: String): String;
begin
  Result := Format('[%s] - %s - %s | Detalhes: %s',
    [FormatDateTime('dd/mm/yyyy hh:nn:ss', Now), Usuario, Acao, Detalhes]);
end;

class procedure TLogSistema.EscreverLog(const Texto: String);
var
  LogFile: TextFile;
  LogFileName: String;
begin
  try
    LogFileName := GetLogFileName;

    AssignFile(LogFile, LogFileName);

    if FileExists(LogFileName) then
      Append(LogFile)
    else
      Rewrite(LogFile);

    try
      WriteLn(LogFile, Texto);
    finally
      CloseFile(LogFile);
    end;
  except
    on E: Exception do
    begin
      // Se quiser debugar, descomente a linha abaixo
      // ShowMessage('Erro ao gravar log: ' + E.Message);
    end;
  end;
end;

// ===== AUTENTICAÇÃO =====

class procedure TLogSistema.RegistrarLogin(const Usuario: String);
begin
  EscreverLog(FormatarLog(Usuario, 'LOGIN - Acesso ao sistema'));
end;

class procedure TLogSistema.RegistrarLogout(const Usuario: String);
begin
  EscreverLog(FormatarLog(Usuario, 'LOGOUT - Saiu do sistema'));
end;

class procedure TLogSistema.RegistrarTentativaLoginFalha(const Usuario, Motivo: String);
begin
  EscreverLog(FormatarLogErro(Usuario, 'LOGIN FALHOU', Motivo));
end;

// ===== PERFIL =====

class procedure TLogSistema.RegistrarAcessoPerfil(const Usuario: String);
begin
  EscreverLog(FormatarLog(Usuario, 'PERFIL - Acessou visualização de perfil'));
end;

class procedure TLogSistema.RegistrarEdicaoPerfil(const Usuario: String);
begin
  EscreverLog(FormatarLog(Usuario, 'PERFIL - Dados atualizados com sucesso'));
end;

class procedure TLogSistema.RegistrarAlteracaoSenha(const Usuario: String);
begin
  EscreverLog(FormatarLog(Usuario, 'PERFIL - Senha alterada com sucesso'));
end;

class procedure TLogSistema.RegistrarCancelamentoEdicao(const Usuario: String);
begin
  EscreverLog(FormatarLog(Usuario, 'PERFIL - Cancelou edição de perfil'));
end;

// ===== USUÁRIOS (ADMIN) =====

class procedure TLogSistema.RegistrarCadastroUsuario(const Admin, NovoUsuario: String);
begin
  EscreverLog(FormatarLogDetalhado(Admin, 'USUÁRIO - Cadastrou novo usuário', 'Usuário: ' + NovoUsuario));
end;

class procedure TLogSistema.RegistrarAtualizacaoUsuario(const Admin, Usuario: String);
begin
  EscreverLog(FormatarLogDetalhado(Admin, 'USUÁRIO - Atualizou dados', 'Usuário: ' + Usuario));
end;

class procedure TLogSistema.RegistrarDesativacaoUsuario(const Admin, Usuario: String);
begin
  EscreverLog(FormatarLogDetalhado(Admin, 'USUÁRIO - Desativou usuário', 'Usuário: ' + Usuario));
end;

class procedure TLogSistema.RegistrarReativacaoUsuario(const Admin, Usuario: String);
begin
  EscreverLog(FormatarLogDetalhado(Admin, 'USUÁRIO - Reativou usuário', 'Usuário: ' + Usuario));
end;

class procedure TLogSistema.RegistrarBuscaUsuario(const Admin, TermoBusca: String);
begin
  EscreverLog(FormatarLogDetalhado(Admin, 'USUÁRIO - Realizou busca', 'Termo: ' + TermoBusca));
end;

// ===== PRODUTOS (DONO) =====

class procedure TLogSistema.RegistrarCadastroProduto(const Usuario, NomeProduto: String; Preco: Currency);
begin
  EscreverLog(FormatarLogDetalhado(Usuario, 'PRODUTO - Cadastrou produto',
    Format('Produto: %s | Preço: R$ %.2f', [NomeProduto, Preco])));
end;

class procedure TLogSistema.RegistrarAtualizacaoProduto(const Usuario, NomeProduto: String);
begin
  EscreverLog(FormatarLogDetalhado(Usuario, 'PRODUTO - Atualizou produto', 'Produto: ' + NomeProduto));
end;

class procedure TLogSistema.RegistrarDesativacaoProduto(const Usuario, NomeProduto: String);
begin
  EscreverLog(FormatarLogDetalhado(Usuario, 'PRODUTO - Desativou produto', 'Produto: ' + NomeProduto));
end;

class procedure TLogSistema.RegistrarReativacaoProduto(const Usuario, NomeProduto: String);
begin
  EscreverLog(FormatarLogDetalhado(Usuario, 'PRODUTO - Reativou produto', 'Produto: ' + NomeProduto));
end;

class procedure TLogSistema.RegistrarBuscaProduto(const Usuario, TermoBusca: String);
begin
  EscreverLog(FormatarLogDetalhado(Usuario, 'PRODUTO - Realizou busca', 'Termo: ' + TermoBusca));
end;

// ===== COMÉRCIO (DONO) =====

class procedure TLogSistema.RegistrarAtualizacaoComercio(const Usuario, NomeComercio: String);
begin
  EscreverLog(FormatarLogDetalhado(Usuario, 'COMÉRCIO - Atualizou dados', 'Comércio: ' + NomeComercio));
end;

class procedure TLogSistema.RegistrarAlteracaoHorario(const Usuario, HorarioAbertura, HorarioFechamento: String);
begin
  EscreverLog(FormatarLogDetalhado(Usuario, 'COMÉRCIO - Alterou horários',
    Format('Abertura: %s | Fechamento: %s', [HorarioAbertura, HorarioFechamento])));
end;

class procedure TLogSistema.RegistrarAlteracaoTaxaEntrega(const Usuario: String; NovaTaxa: Currency);
begin
  EscreverLog(FormatarLogDetalhado(Usuario, 'COMÉRCIO - Alterou taxa de entrega',
    Format('Nova taxa: R$ %.2f', [NovaTaxa])));
end;

// ===== PEDIDOS =====

class procedure TLogSistema.RegistrarNovoPedido(const Usuario: String; IdPedido: Integer; ValorTotal: Currency);
begin
  EscreverLog(FormatarLogDetalhado(Usuario, 'PEDIDO - Novo pedido criado',
    Format('Pedido #%d | Total: R$ %.2f', [IdPedido, ValorTotal])));
end;

class procedure TLogSistema.RegistrarCancelamentoPedido(const Usuario: String; IdPedido: Integer; Motivo: String);
begin
  EscreverLog(FormatarLogDetalhado(Usuario, 'PEDIDO - Cancelamento',
    Format('Pedido #%d | Motivo: %s', [IdPedido, Motivo])));
end;

class procedure TLogSistema.RegistrarAlteracaoStatusPedido(const Usuario: String; IdPedido, NovoStatus: Integer);
var
  StatusDesc: String;
begin
  case NovoStatus of
    0: StatusDesc := 'Pendente';
    1: StatusDesc := 'Confirmado';
    2: StatusDesc := 'Preparando';
    3: StatusDesc := 'Pronto para Entrega';
    4: StatusDesc := 'A Caminho';
    5: StatusDesc := 'Entregue';
    6: StatusDesc := 'Cancelado';
  else
    StatusDesc := 'Status ' + IntToStr(NovoStatus);
  end;

  EscreverLog(FormatarLogDetalhado(Usuario, 'PEDIDO - Alteração de status',
    Format('Pedido #%d | Novo status: %s', [IdPedido, StatusDesc])));
end;

class procedure TLogSistema.RegistrarAceitePedido(const Usuario: String; IdPedido: Integer);
begin
  EscreverLog(FormatarLogDetalhado(Usuario, 'PEDIDO - Pedido aceito', 'Pedido #' + IntToStr(IdPedido)));
end;

class procedure TLogSistema.RegistrarRecusaPedido(const Usuario: String; IdPedido: Integer);
begin
  EscreverLog(FormatarLogDetalhado(Usuario, 'PEDIDO - Pedido recusado', 'Pedido #' + IntToStr(IdPedido)));
end;

class procedure TLogSistema.RegistrarVisualizacaoDetalhesPedido(const Usuario: String; IdPedido: Integer);
begin
  EscreverLog(FormatarLogDetalhado(Usuario, 'PEDIDO - Visualizou detalhes', 'Pedido #' + IntToStr(IdPedido)));
end;

// ===== ENTREGADOR =====

class procedure TLogSistema.RegistrarInicioExpediente(const Usuario: String; IdEntregador: Integer);
begin
  EscreverLog(FormatarLogDetalhado(Usuario, 'EXPEDIENTE - Iniciou expediente',
    'ID Entregador: ' + IntToStr(IdEntregador)));
end;

class procedure TLogSistema.RegistrarFimExpediente(const Usuario: String; IdEntregador: Integer);
begin
  EscreverLog(FormatarLogDetalhado(Usuario, 'EXPEDIENTE - Finalizou expediente',
    'ID Entregador: ' + IntToStr(IdEntregador)));
end;

class procedure TLogSistema.RegistrarAceiteEntrega(const Usuario: String; IdPedido: Integer);
begin
  EscreverLog(FormatarLogDetalhado(Usuario, 'ENTREGA - Aceitou entrega', 'Pedido #' + IntToStr(IdPedido)));
end;

class procedure TLogSistema.RegistrarEntregaACaminho(const Usuario: String; IdPedido: Integer);
begin
  EscreverLog(FormatarLogDetalhado(Usuario, 'ENTREGA - Saiu para entrega', 'Pedido #' + IntToStr(IdPedido)));
end;

class procedure TLogSistema.RegistrarEntregaConcluida(const Usuario: String; IdPedido: Integer);
begin
  EscreverLog(FormatarLogDetalhado(Usuario, 'ENTREGA - Entrega concluída', 'Pedido #' + IntToStr(IdPedido)));
end;

// ===== CLIENTE =====

class procedure TLogSistema.RegistrarAcessoCardapio(const Usuario: String; IdComercio: Integer; NomeComercio: String);
begin
  EscreverLog(FormatarLogDetalhado(Usuario, 'CARDÁPIO - Acessou cardápio',
    Format('Comércio #%d: %s', [IdComercio, NomeComercio])));
end;

class procedure TLogSistema.RegistrarAdicionarCarrinho(const Usuario, NomeProduto: String; Quantidade: Integer);
begin
  EscreverLog(FormatarLogDetalhado(Usuario, 'CARRINHO - Adicionou item',
    Format('Produto: %s | Qtd: %d', [NomeProduto, Quantidade])));
end;

class procedure TLogSistema.RegistrarRemoverCarrinho(const Usuario, NomeProduto: String);
begin
  EscreverLog(FormatarLogDetalhado(Usuario, 'CARRINHO - Removeu item', 'Produto: ' + NomeProduto));
end;

class procedure TLogSistema.RegistrarLimparCarrinho(const Usuario: String; QtdItens: Integer);
begin
  EscreverLog(FormatarLogDetalhado(Usuario, 'CARRINHO - Limpou carrinho',
    Format('%d itens removidos', [QtdItens])));
end;

class procedure TLogSistema.RegistrarFinalizacaoPedido(const Usuario: String; IdPedido: Integer; ValorTotal: Currency);
begin
  EscreverLog(FormatarLogDetalhado(Usuario, 'PEDIDO - Finalizou pedido',
    Format('Pedido #%d | Total: R$ %.2f', [IdPedido, ValorTotal])));
end;

class procedure TLogSistema.RegistrarAvaliacao(const Usuario: String; IdComercio: Integer; Nota: Integer);
begin
  EscreverLog(FormatarLogDetalhado(Usuario, 'AVALIAÇÃO - Avaliou comércio',
    Format('Comércio #%d | Nota: %d estrelas', [IdComercio, Nota])));
end;

// ===== ENDEREÇOS =====

class procedure TLogSistema.RegistrarCadastroEndereco(const Usuario, Apelido: String);
begin
  EscreverLog(FormatarLogDetalhado(Usuario, 'ENDEREÇO - Cadastrou novo endereço', 'Apelido: ' + Apelido));
end;

class procedure TLogSistema.RegistrarAtualizacaoEndereco(const Usuario, Apelido: String);
begin
  EscreverLog(FormatarLogDetalhado(Usuario, 'ENDEREÇO - Atualizou endereço', 'Apelido: ' + Apelido));
end;

class procedure TLogSistema.RegistrarExclusaoEndereco(const Usuario, Apelido: String);
begin
  EscreverLog(FormatarLogDetalhado(Usuario, 'ENDEREÇO - Excluiu endereço', 'Apelido: ' + Apelido));
end;

class procedure TLogSistema.RegistrarDefinirEnderecoPrincipal(const Usuario, Apelido: String);
begin
  EscreverLog(FormatarLogDetalhado(Usuario, 'ENDEREÇO - Definiu como principal', 'Apelido: ' + Apelido));
end;

// ===== PAGAMENTOS =====

class procedure TLogSistema.RegistrarCadastroPagamento(const Usuario, TipoPagamento, Apelido: String);
begin
  EscreverLog(FormatarLogDetalhado(Usuario, 'PAGAMENTO - Cadastrou forma de pagamento',
    Format('Tipo: %s | Apelido: %s', [TipoPagamento, Apelido])));
end;

class procedure TLogSistema.RegistrarAtualizacaoPagamento(const Usuario, TipoPagamento, Apelido: String);
begin
  EscreverLog(FormatarLogDetalhado(Usuario, 'PAGAMENTO - Atualizou forma de pagamento',
    Format('Tipo: %s | Apelido: %s', [TipoPagamento, Apelido])));
end;

class procedure TLogSistema.RegistrarExclusaoPagamento(const Usuario, TipoPagamento: String);
begin
  EscreverLog(FormatarLogDetalhado(Usuario, 'PAGAMENTO - Excluiu forma de pagamento', 'Tipo: ' + TipoPagamento));
end;

class procedure TLogSistema.RegistrarDefinirPagamentoPrincipal(const Usuario, Apelido: String);
begin
  EscreverLog(FormatarLogDetalhado(Usuario, 'PAGAMENTO - Definiu como principal', 'Apelido: ' + Apelido));
end;

// ===== RELATÓRIOS =====

class procedure TLogSistema.RegistrarGeracaoRelatorio(const Usuario, TipoRelatorio: String; DataInicio, DataFim: TDateTime);
begin
  EscreverLog(FormatarLogDetalhado(Usuario, 'RELATÓRIO - Gerou relatório',
    Format('Tipo: %s | Período: %s a %s', [TipoRelatorio,
      FormatDateTime('dd/mm/yyyy', DataInicio),
      FormatDateTime('dd/mm/yyyy', DataFim)])));
end;

class procedure TLogSistema.RegistrarExportacaoRelatorio(const Usuario, TipoRelatorio, Formato: String);
begin
  EscreverLog(FormatarLogDetalhado(Usuario, 'RELATÓRIO - Exportou relatório',
    Format('Tipo: %s | Formato: %s', [TipoRelatorio, Formato])));
end;

// ===== NAVEGAÇÃO =====

class procedure TLogSistema.RegistrarAcessoTela(const Usuario, NomeTela: String);
begin
  EscreverLog(FormatarLog(Usuario, 'NAVEGAÇÃO - Acessou tela: ' + NomeTela));
end;

class procedure TLogSistema.RegistrarBuscaComercio(const Usuario, TermoBusca: String);
begin
  EscreverLog(FormatarLogDetalhado(Usuario, 'BUSCA - Pesquisou comércios', 'Termo: ' + TermoBusca));
end;

class procedure TLogSistema.RegistrarFiltroCategoria(const Usuario, Categoria: String);
begin
  EscreverLog(FormatarLogDetalhado(Usuario, 'FILTRO - Aplicou filtro de categoria', 'Categoria: ' + Categoria));
end;

// ===== GENÉRICOS =====

class procedure TLogSistema.RegistrarAcaoUsuario(const Usuario, Acao: String);
begin
  EscreverLog(FormatarLog(Usuario, Acao));
end;

class procedure TLogSistema.RegistrarAcaoDetalhada(const Usuario, Acao, Detalhes: String);
begin
  EscreverLog(FormatarLogDetalhado(Usuario, Acao, Detalhes));
end;

class procedure TLogSistema.RegistrarErro(const Usuario, Acao, MensagemErro: String);
begin
  EscreverLog(FormatarLogErro(Usuario, Acao, MensagemErro));
end;

class procedure TLogSistema.RegistrarErroValidacao(const Usuario, Campo, Erro: String);
begin
  RegistrarErro(Usuario, Format('Validação do campo %s', [Campo]), Erro);
end;

class procedure TLogSistema.RegistrarErroSenha(const Usuario, Erro: String);
begin
  RegistrarErro(Usuario, 'Alteração de Senha', Erro);
end;

class procedure TLogSistema.RegistrarErroSistema(const Contexto, MensagemErro: String);
begin
  EscreverLog(Format('[%s] - SISTEMA - ERRO em %s: %s',
    [FormatDateTime('dd/mm/yyyy hh:nn:ss', Now), Contexto, MensagemErro]));
end;

// ===== LEITURA DE LOGS =====

class function TLogSistema.LerUltimosLogs(Quantidade: Integer): TStringList;
var
  LogFileName: String;
  TodasLinhas: TStringList;
  Inicio: Integer;
  i: Integer;
begin
  Result := TStringList.Create;

  try
    LogFileName := GetLogFileName;

    if not FileExists(LogFileName) then
      Exit;

    TodasLinhas := TStringList.Create;
    try
      TodasLinhas.LoadFromFile(LogFileName);

      if TodasLinhas.Count > Quantidade then
        Inicio := TodasLinhas.Count - Quantidade
      else
        Inicio := 0;

      for i := Inicio to TodasLinhas.Count - 1 do
        Result.Add(TodasLinhas[i]);

    finally
      TodasLinhas.Free;
    end;
  except
    // Retorna lista vazia em caso de erro
  end;
end;

class function TLogSistema.LerLogsDeHoje: TStringList;
var
  LogFileName: String;
  TodasLinhas: TStringList;
  Linha: String;
  DataHoje: String;
begin
  Result := TStringList.Create;
  LogFileName := GetLogFileName;

  try
    if not FileExists(LogFileName) then
      Exit;

    DataHoje := FormatDateTime('dd/mm/yyyy', Date);
    TodasLinhas := TStringList.Create;
    try
      TodasLinhas.LoadFromFile(LogFileName);

      for Linha in TodasLinhas do
      begin
        if Pos('[' + DataHoje, Linha) = 1 then
          Result.Add(Linha);
      end;
    finally
      TodasLinhas.Free;
    end;
  except
    // Retorna lista vazia em caso de erro
  end;
end;

class function TLogSistema.LerLogsPorUsuario(const Usuario: String; Quantidade: Integer): TStringList;
var
  LogFileName: String;
  TodasLinhas: TStringList;
  Linha: String;
  i, Count: Integer;
begin
  Result := TStringList.Create;
  LogFileName := GetLogFileName;

  try
    if not FileExists(LogFileName) then
      Exit;

    TodasLinhas := TStringList.Create;
    try
      TodasLinhas.LoadFromFile(LogFileName);
      Count := 0;

      // Percorrer de trás para frente (logs mais recentes primeiro)
      for i := TodasLinhas.Count - 1 downto 0 do
      begin
        Linha := TodasLinhas[i];
        if Pos(' - ' + Usuario + ' - ', Linha) > 0 then
        begin
          Result.Insert(0, Linha);
          Inc(Count);
          if Count >= Quantidade then
            Break;
        end;
      end;
    finally
      TodasLinhas.Free;
    end;
  except
    // Retorna lista vazia em caso de erro
  end;
end;

class function TLogSistema.LerLogsPorPeriodo(DataInicio, DataFim: TDateTime): TStringList;
var
  LogFileName: String;
  TodasLinhas: TStringList;
  Linha: String;
  DataStr: String;
  DataLinha: TDateTime;
  PosInicio, PosFim: Integer;
begin
  Result := TStringList.Create;
  LogFileName := GetLogFileName;

  try
    if not FileExists(LogFileName) then
      Exit;

    TodasLinhas := TStringList.Create;
    try
      TodasLinhas.LoadFromFile(LogFileName);

      for Linha in TodasLinhas do
      begin
        PosInicio := Pos('[', Linha);
        PosFim := Pos(']', Linha);

        if (PosInicio > 0) and (PosFim > PosInicio) then
        begin
          DataStr := Copy(Linha, PosInicio + 1, 10);

          try
            DataLinha := StrToDate(DataStr);

            if (DataLinha >= DataInicio) and (DataLinha <= DataFim) then
              Result.Add(Linha);
          except
            // Ignora linha se não conseguir ler a data
          end;
        end;
      end;
    finally
      TodasLinhas.Free;
    end;
  except
    // Retorna lista vazia em caso de erro
  end;
end;

class procedure TLogSistema.LimparLogsAntigos(DiasParaManter: Integer);
var
  LogFileName: String;
  TodasLinhas: TStringList;
  NovasLinhas: TStringList;
  Linha: String;
  DataLimite: TDateTime;
  DataLinha: TDateTime;
  DataStr: String;
  PosInicio, PosFim: Integer;
begin
  try
    LogFileName := GetLogFileName;

    if not FileExists(LogFileName) then
      Exit;

    DataLimite := Date - DiasParaManter;
    TodasLinhas := TStringList.Create;
    NovasLinhas := TStringList.Create;
    try
      TodasLinhas.LoadFromFile(LogFileName);

      for Linha in TodasLinhas do
      begin
        PosInicio := Pos('[', Linha);
        PosFim := Pos(']', Linha);

        if (PosInicio > 0) and (PosFim > PosInicio) then
        begin
          DataStr := Copy(Linha, PosInicio + 1, 10);

          try
            DataLinha := StrToDate(DataStr);

            if DataLinha >= DataLimite then
              NovasLinhas.Add(Linha);
          except
            NovasLinhas.Add(Linha);
          end;
        end
        else
          NovasLinhas.Add(Linha);
      end;

      NovasLinhas.SaveToFile(LogFileName);
    finally
      TodasLinhas.Free;
      NovasLinhas.Free;
    end;
  except
    // Ignora erros
  end;
end;

end.
