unit ProdutoService;

interface

uses
  System.SysUtils, System.Generics.Collections,
  ProdutoModel, ProdutoRepository, Vcl.Dialogs, Vcl.Forms, System.UITypes;

type
  TProdutoService = class
  private
    FRepository: TProdutoRepository;
  public
    constructor Create;
    destructor Destroy; override;

    function ListarProdutosPorComercio(IdComercio: Integer; ApenasDisponiveis: Boolean): TObjectList<TProduto>;
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
  Result := FRepository.ListarPorComercio(IdComercio, ApenasDisponiveis);
end;

function TProdutoService.ObterProduto(IdProduto: Integer): TProduto;
begin
  Result := FRepository.BuscarPorId(IdProduto);
end;

function TProdutoService.CadastrarProduto(Produto: TProduto): Boolean;
begin
  // Validações
  if Trim(Produto.NomeProd) = '' then
  begin
    ShowMessage('Informe o nome do produto.');
    Result := False;
    Exit;
  end;

  if Produto.IdCategoria <= 0 then
  begin
    ShowMessage('Selecione a categoria do produto.');
    Result := False;
    Exit;
  end;

  if Produto.PrecoCusto < 0 then
  begin
    ShowMessage('O preço de custo não pode ser negativo.');
    Result := False;
    Exit;
  end;

  if Produto.PrecoVenda <= 0 then
  begin
    ShowMessage('Informe o preço de venda do produto.');
    Result := False;
    Exit;
  end;

  if Produto.PrecoVenda < Produto.PrecoCusto then
  begin
    if MessageDlg('O preço de venda é menor que o preço de custo. Deseja continuar?',
       mtWarning, [mbYes, mbNo], 0) <> mrYes then
    begin
      Result := False;
      Exit;
    end;
  end;

  try
    Result := FRepository.Inserir(Produto);
    if Result then
      ShowMessage('Produto cadastrado com sucesso!');
  except
    on E: Exception do
    begin
      ShowMessage('Erro ao cadastrar produto: ' + E.Message);
      Result := False;
    end;
  end;
end;

function TProdutoService.AtualizarProduto(Produto: TProduto): Boolean;
begin
  // Validações
  if Trim(Produto.NomeProd) = '' then
  begin
    ShowMessage('Informe o nome do produto.');
    Result := False;
    Exit;
  end;

  if Produto.IdCategoria <= 0 then
  begin
    ShowMessage('Selecione a categoria do produto.');
    Result := False;
    Exit;
  end;

  if Produto.PrecoCusto < 0 then
  begin
    ShowMessage('O preço de custo não pode ser negativo.');
    Result := False;
    Exit;
  end;

  if Produto.PrecoVenda <= 0 then
  begin
    ShowMessage('Informe o preço de venda do produto.');
    Result := False;
    Exit;
  end;

  if Produto.PrecoVenda < Produto.PrecoCusto then
  begin
    if MessageDlg('O preço de venda é menor que o preço de custo. Deseja continuar?',
       mtWarning, [mbYes, mbNo], 0) <> mrYes then
    begin
      Result := False;
      Exit;
    end;
  end;

  try
    Result := FRepository.Atualizar(Produto);
    if Result then
      ShowMessage('Produto atualizado com sucesso!');
  except
    on E: Exception do
    begin
      ShowMessage('Erro ao atualizar produto: ' + E.Message);
      Result := False;
    end;
  end;
end;

function TProdutoService.DesativarProduto(IdProduto: Integer;
  const NomeProduto: string): Boolean;
begin
  if MessageDlg('Deseja desativar o produto "' + NomeProduto + '"?',
     mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    try
      Result := FRepository.AlterarDisponibilidade(IdProduto, False);
      if Result then
        ShowMessage('Produto desativado com sucesso!');
    except
      on E: Exception do
      begin
        ShowMessage('Erro ao desativar produto: ' + E.Message);
        Result := False;
      end;
    end;
  end
  else
    Result := False;
end;

function TProdutoService.ReativarProduto(IdProduto: Integer;
  const NomeProduto: string): Boolean;
begin
  if MessageDlg('Deseja reativar o produto "' + NomeProduto + '"?',
     mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    try
      Result := FRepository.AlterarDisponibilidade(IdProduto, True);
      if Result then
        ShowMessage('Produto reativado com sucesso!');
    except
      on E: Exception do
      begin
        ShowMessage('Erro ao reativar produto: ' + E.Message);
        Result := False;
      end;
    end;
  end
  else
    Result := False;
end;

function TProdutoService.ExcluirProduto(IdProduto: Integer;
  const NomeProduto: string): Boolean;
begin
  if MessageDlg('Deseja EXCLUIR permanentemente o produto "' + NomeProduto + '"?' + sLineBreak +
     'Esta ação não pode ser desfeita!',
     mtWarning, [mbYes, mbNo], 0) = mrYes then
  begin
    try
      Result := FRepository.Excluir(IdProduto);
      if Result then
        ShowMessage('Produto excluído com sucesso!');
    except
      on E: Exception do
      begin
        ShowMessage('Erro ao excluir produto: ' + E.Message);
        Result := False;
      end;
    end;
  end
  else
    Result := False;
end;

end.
