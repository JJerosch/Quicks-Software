unit ProdutoService;

interface

uses
  System.SysUtils, System.Generics.Collections, Vcl.Dialogs, Vcl.Forms, Vcl.Controls,
  ProdutoModel, ProdutoRepository;

type
  TProdutoService = class
  private
    FRepository: TProdutoRepository;
  public
    constructor Create;
    destructor Destroy; override;

    function ListarProdutosPorComercio(IdComercio: Integer; ApenasDisponiveis: Boolean = False): TObjectList<TProduto>;
    function ObterProduto(IdProduto: Integer): TProduto;
    function CadastrarProduto(Produto: TProduto): Boolean;
    function AtualizarProduto(Produto: TProduto): Boolean;
    function DesativarProduto(IdProduto: Integer; const NomeProduto: string): Boolean;
    function ReativarProduto(IdProduto: Integer; const NomeProduto: string): Boolean;
    function ExcluirProduto(IdProduto: Integer; const NomeProduto: string): Boolean;
  end;

implementation

{ TProdutoService }

constructor TProdutoService.Create;
begin
  inherited;
  FRepository := TProdutoRepository.Create;
end;

destructor TProdutoService.Destroy;
begin
  FRepository.Free;
  inherited;
end;

function TProdutoService.ListarProdutosPorComercio(IdComercio: Integer;
  ApenasDisponiveis: Boolean): TObjectList<TProduto>;
begin
  try
    Result := FRepository.BuscarTodosPorComercio(IdComercio, ApenasDisponiveis);
  except
    on E: Exception do
    begin
      ShowMessage('Erro ao listar produtos: ' + E.Message);
      Result := TObjectList<TProduto>.Create(True);
    end;
  end;
end;

function TProdutoService.ObterProduto(IdProduto: Integer): TProduto;
begin
  try
    Result := FRepository.BuscarPorId(IdProduto);

    if not Assigned(Result) then
      ShowMessage('Produto não encontrado.');

  except
    on E: Exception do
    begin
      ShowMessage('Erro ao buscar produto: ' + E.Message);
      Result := nil;
    end;
  end;
end;

function TProdutoService.CadastrarProduto(Produto: TProduto): Boolean;
begin
  Result := False;

  try
    // Validações
    if Trim(Produto.NomeProd) = '' then
    begin
      ShowMessage('O nome do produto é obrigatório.');
      Exit;
    end;

    if Produto.PrecoProd <= 0 then
    begin
      ShowMessage('O preço deve ser maior que zero.');
      Exit;
    end;

    if Produto.IdComercio <= 0 then
    begin
      ShowMessage('ID do comércio não definido.');
      Exit;
    end;

    // Verificar se nome já existe
    if FRepository.NomeJaExiste(Produto.NomeProd, Produto.IdComercio) then
    begin
      ShowMessage('Já existe um produto com esse nome neste comércio.');
      Exit;
    end;

    // Inserir
    if FRepository.Inserir(Produto) then
    begin
      ShowMessage('Produto cadastrado com sucesso!');
      Result := True;
    end;

  except
    on E: Exception do
      ShowMessage('Erro ao cadastrar produto: ' + E.Message);
  end;
end;

function TProdutoService.AtualizarProduto(Produto: TProduto): Boolean;
begin
  Result := False;

  try
    // Validações
    if Trim(Produto.NomeProd) = '' then
    begin
      ShowMessage('O nome do produto é obrigatório.');
      Exit;
    end;

    if Produto.PrecoProd <= 0 then
    begin
      ShowMessage('O preço deve ser maior que zero.');
      Exit;
    end;

    // Verificar se nome já existe (excluindo o próprio produto)
    if FRepository.NomeJaExiste(Produto.NomeProd, Produto.IdComercio, Produto.IdProduto) then
    begin
      ShowMessage('Já existe outro produto com esse nome neste comércio.');
      Exit;
    end;

    // Atualizar
    if FRepository.Atualizar(Produto) then
    begin
      ShowMessage('Produto atualizado com sucesso!');
      Result := True;
    end;

  except
    on E: Exception do
      ShowMessage('Erro ao atualizar produto: ' + E.Message);
  end;
end;

function TProdutoService.DesativarProduto(IdProduto: Integer;
  const NomeProduto: string): Boolean;
begin
  Result := False;

  if MessageDlg(Format('Deseja realmente desativar o produto "%s"?', [NomeProduto]),
     mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    Exit;

  try
    if FRepository.AlterarDisponibilidade(IdProduto, False) then
    begin
      ShowMessage('Produto desativado com sucesso!');
      Result := True;
    end;
  except
    on E: Exception do
      ShowMessage('Erro ao desativar produto: ' + E.Message);
  end;
end;

function TProdutoService.ReativarProduto(IdProduto: Integer;
  const NomeProduto: string): Boolean;
begin
  Result := False;

  if MessageDlg(Format('Deseja reativar o produto "%s"?', [NomeProduto]),
     mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    Exit;

  try
    if FRepository.AlterarDisponibilidade(IdProduto, True) then
    begin
      ShowMessage('Produto reativado com sucesso!');
      Result := True;
    end;
  except
    on E: Exception do
      ShowMessage('Erro ao reativar produto: ' + E.Message);
  end;
end;

function TProdutoService.ExcluirProduto(IdProduto: Integer;
  const NomeProduto: string): Boolean;
begin
  Result := False;

  if MessageDlg(Format('ATENÇÃO: Excluir permanentemente o produto "%s"?', [NomeProduto]),
     mtWarning, [mbYes, mbNo], 0) <> mrYes then
    Exit;

  try
    if FRepository.Excluir(IdProduto) then
    begin
      ShowMessage('Produto excluído permanentemente!');
      Result := True;
    end;
  except
    on E: Exception do
      ShowMessage('Erro ao excluir produto: ' + E.Message);
  end;
end;

end.
