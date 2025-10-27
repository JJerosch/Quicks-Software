unit ProdutoService;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.ComCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Mask,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  System.Generics.Collections, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  ProdutoModel, ProdutoRepository;

type
  TProdutoService = class
  private
    FRepository: TProdutoRepository;
  public
    constructor Create;
    destructor Destroy; override;

    function ListarProdutosPorDono(IdDono: Integer; ApenasDisponiveis: Boolean = False): TObjectList<TProduto>;
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

function TProdutoService.ListarProdutosPorDono(IdDono: Integer;
  ApenasDisponiveis: Boolean): TObjectList<TProduto>;
begin
  try
    Result := FRepository.BuscarTodosPorDono(IdDono, ApenasDisponiveis);

    if Result.Count = 0 then
    begin
      if ApenasDisponiveis then
        ShowMessage('Nenhum produto disponível encontrado.')
      else
        ShowMessage('Nenhum produto cadastrado ainda.');
    end;

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

    if Produto.IdDono <= 0 then
    begin
      ShowMessage('Dono do produto inválido.');
      Exit;
    end;

    // Verificar se já existe produto com mesmo nome
    if FRepository.NomeJaExiste(Produto.NomeProd, Produto.IdDono, 0) then
    begin
      ShowMessage('Já existe um produto com este nome.');
      Exit;
    end;

    // Inserir
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
  Result := False;

  try
    // Validações
    if Produto.IdProduto <= 0 then
    begin
      ShowMessage('Produto inválido.');
      Exit;
    end;

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

    // Verificar se já existe outro produto com mesmo nome
    if FRepository.NomeJaExiste(Produto.NomeProd, Produto.IdDono, Produto.IdProduto) then
    begin
      ShowMessage('Já existe outro produto com este nome.');
      Exit;
    end;

    // Atualizar
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
  Result := False;

  try
    if MessageDlg('Deseja realmente desativar o produto "' + NomeProduto + '"?',
       mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      Result := FRepository.AlterarDisponibilidade(IdProduto, False);

      if Result then
        ShowMessage('Produto desativado com sucesso!');
    end;

  except
    on E: Exception do
    begin
      ShowMessage('Erro ao desativar produto: ' + E.Message);
      Result := False;
    end;
  end;
end;

function TProdutoService.ReativarProduto(IdProduto: Integer;
  const NomeProduto: string): Boolean;
begin
  Result := False;

  try
    if MessageDlg('Deseja realmente reativar o produto "' + NomeProduto + '"?',
       mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      Result := FRepository.AlterarDisponibilidade(IdProduto, True);

      if Result then
        ShowMessage('Produto reativado com sucesso!');
    end;

  except
    on E: Exception do
    begin
      ShowMessage('Erro ao reativar produto: ' + E.Message);
      Result := False;
    end;
  end;
end;

function TProdutoService.ExcluirProduto(IdProduto: Integer;
  const NomeProduto: string): Boolean;
begin
  Result := False;

  try
    if MessageDlg('Deseja realmente EXCLUIR permanentemente o produto "' +
       NomeProduto + '"?' + #13#10 + 'Esta ação não pode ser desfeita!',
       mtWarning, [mbYes, mbNo], 0) = mrYes then
    begin
      Result := FRepository.Excluir(IdProduto);

      if Result then
        ShowMessage('Produto excluído com sucesso!');
    end;

  except
    on E: Exception do
    begin
      ShowMessage('Erro ao excluir produto: ' + E.Message);
      Result := False;
    end;
  end;
end;

end.
