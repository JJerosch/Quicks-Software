unit ComercioService;

interface

uses
  System.SysUtils, Vcl.Dialogs, ComercioModel, ComercioRepository;

type
  TComercioService = class
  private
    FRepository: TComercioRepository;
    function ValidarDadosComercio(Comercio: TComercio): Boolean;
    function ValidarAlteracaoSenha(Request: TAlterarSenhaRequest): Boolean;
  public
    constructor Create;
    destructor Destroy; override;

    function ObterComercioPorUsuario(IdUsuario: Integer): TComercio;
    function ObterComercioPorId(IdComercio: Integer): TComercio;
    function AtualizarComercio(Comercio: TComercio): Boolean;
    function AlterarSenha(Request: TAlterarSenhaRequest): Boolean;
  end;

implementation

uses
  PasswordHelper;

{ TComercioService }

constructor TComercioService.Create;
begin
  inherited;
  FRepository := TComercioRepository.Create;
end;

destructor TComercioService.Destroy;
begin
  FRepository.Free;
  inherited;
end;

function TComercioService.ValidarDadosComercio(Comercio: TComercio): Boolean;
begin
  Result := False;

  if Trim(Comercio.NomeComercio) = '' then
  begin
    ShowMessage('O nome do comércio é obrigatório.');
    Exit;
  end;

  if Trim(Comercio.Categoria) = '' then
  begin
    ShowMessage('A categoria do comércio é obrigatória.');
    Exit;
  end;

  if Trim(Comercio.EmailComercio) = '' then
  begin
    ShowMessage('O email do comércio é obrigatório.');
    Exit;
  end;

  if Trim(Comercio.NPhoneComercio) = '' then
  begin
    ShowMessage('O telefone do comércio é obrigatório.');
    Exit;
  end;

  if Comercio.TempoPreparoMedio <= 0 then
  begin
    ShowMessage('O tempo de preparo deve ser maior que zero.');
    Exit;
  end;

  if Comercio.TaxaEntregaBase < 0 then
  begin
    ShowMessage('A taxa de entrega não pode ser negativa.');
    Exit;
  end;

  Result := True;
end;

function TComercioService.ValidarAlteracaoSenha(Request: TAlterarSenhaRequest): Boolean;
begin
  Result := False;

  if Trim(Request.SenhaAtual) = '' then
  begin
    ShowMessage('A senha atual é obrigatória.');
    Exit;
  end;

  if Trim(Request.SenhaNova) = '' then
  begin
    ShowMessage('A nova senha é obrigatória.');
    Exit;
  end;

  if Length(Request.SenhaNova) < 6 then
  begin
    ShowMessage('A nova senha deve ter no mínimo 6 caracteres.');
    Exit;
  end;

  if Request.SenhaNova <> Request.SenhaConfirmacao then
  begin
    ShowMessage('A confirmação de senha não confere.');
    Exit;
  end;

  Result := True;
end;

function TComercioService.ObterComercioPorUsuario(IdUsuario: Integer): TComercio;
begin
  try
    Result := FRepository.BuscarPorIdUsuario(IdUsuario);

    if not Assigned(Result) then
      ShowMessage('Comércio não encontrado para este usuário.');
  except
    on E: Exception do
    begin
      ShowMessage('Erro ao buscar dados do comércio: ' + E.Message);
      Result := nil;
    end;
  end;
end;

function TComercioService.ObterComercioPorId(IdComercio: Integer): TComercio;
begin
  try
    Result := FRepository.BuscarPorIdComercio(IdComercio);

    if not Assigned(Result) then
      ShowMessage('Comércio não encontrado.');
  except
    on E: Exception do
    begin
      ShowMessage('Erro ao buscar dados do comércio: ' + E.Message);
      Result := nil;
    end;
  end;
end;

function TComercioService.AtualizarComercio(Comercio: TComercio): Boolean;
begin
  Result := False;

  try
    if not ValidarDadosComercio(Comercio) then
      Exit;

    Result := FRepository.Atualizar(Comercio);

    if Result then
      ShowMessage('Dados do comércio atualizados com sucesso!')
    else
      ShowMessage('Erro ao atualizar dados do comércio.');

  except
    on E: Exception do
    begin
      ShowMessage('Erro ao atualizar comércio: ' + E.Message);
      Result := False;
    end;
  end;
end;

function TComercioService.AlterarSenha(Request: TAlterarSenhaRequest): Boolean;
var
  SenhaHashAtual: string;
  NovaSenhaHash: string;
begin
  Result := False;

  try
    if not ValidarAlteracaoSenha(Request) then
      Exit;

    // Buscar hash da senha atual
    SenhaHashAtual := FRepository.ObterSenhaHash(Request.IdUsuario);

    if SenhaHashAtual = '' then
    begin
      ShowMessage('Erro ao verificar senha atual.');
      Exit;
    end;

    // Verificar se a senha atual está correta
    if not TPasswordHelper.VerifyPassword(Request.SenhaAtual, SenhaHashAtual) then
    begin
      ShowMessage('Senha atual incorreta.');
      Exit;
    end;

    // Gerar hash da nova senha
    NovaSenhaHash := TPasswordHelper.HashPassword(Request.SenhaNova);

    // Atualizar senha
    Result := FRepository.AlterarSenha(Request.IdUsuario, NovaSenhaHash);

    if Result then
      ShowMessage('Senha alterada com sucesso!')
    else
      ShowMessage('Erro ao alterar senha.');

  except
    on E: Exception do
    begin
      ShowMessage('Erro ao alterar senha: ' + E.Message);
      Result := False;
    end;
  end;
end;

end.
