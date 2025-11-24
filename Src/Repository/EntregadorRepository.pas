unit EntregadorRepository;

interface

uses
  System.SysUtils, System.Generics.Collections,
  FireDAC.Comp.Client, EntregadorModel;

type
  TEntregadorRepository = class
  private
    function CarregarEnderecoOrigem(IdEntregador: Integer): TEnderecoOrigem;
    function CarregarEnderecoAtual(IdEntregador: Integer): TEnderecoAtual;
  public
    // Buscar entregador por ID do usuário
    function BuscarPorIdUsuario(IdUsuario: Integer): TEntregador;

    // Buscar entregador por ID do entregador
    function BuscarPorIdEntregador(IdEntregador: Integer): TEntregador;

    // Atualizar dados do perfil (atualiza usuarios E entregadores)
    function AtualizarPerfil(Entregador: TEntregador): Boolean;

    // Atualizar endereço de origem
    function AtualizarEnderecoOrigem(IdEntregador: Integer; EnderecoOrigem: TEnderecoOrigem): Boolean;

    // Registrar novo endereço atual (histórico)
    function RegistrarEnderecoAtual(IdEntregador: Integer; EnderecoAtual: TEnderecoAtual): Boolean;

    // Buscar histórico de endereços atuais
    function BuscarHistoricoEnderecos(IdEntregador: Integer): TObjectList<TEnderecoAtual>;

    // ⭐ Alterar status de expediente
    function AlterarStatusExpediente(IdEntregador: Integer; EmExpediente: Boolean): Boolean;

    // Senha
    function ObterSenhaHash(IdUsuario: Integer): String;
    function AlterarSenha(IdUsuario: Integer; const NovaSenhaHash: String): Boolean;
  end;

implementation

uses
  uConn, Vcl.Dialogs;

{ TEntregadorRepository }

function TEntregadorRepository.CarregarEnderecoOrigem(IdEntregador: Integer): TEnderecoOrigem;
var
  Qr: TFDQuery;
begin
  Result := TEnderecoOrigem.Create;
  Qr := TFDQuery.Create(nil);
  try
    Qr.Connection := DM.FDConn;
    Qr.SQL.Clear;
    Qr.SQL.Add('SELECT ');
    Qr.SQL.Add('  endereco_origem_logradouro, endereco_origem_numero,');
    Qr.SQL.Add('  endereco_origem_complemento, endereco_origem_bairro,');
    Qr.SQL.Add('  endereco_origem_cidade, endereco_origem_uf, endereco_origem_cep');
    Qr.SQL.Add('FROM entregadores');
    Qr.SQL.Add('WHERE id_entregador = :id_entregador');
    Qr.ParamByName('id_entregador').AsInteger := IdEntregador;
    Qr.Open;

    if not Qr.IsEmpty then
    begin
      Result.Logradouro := Qr.FieldByName('endereco_origem_logradouro').AsString;
      Result.Numero := Qr.FieldByName('endereco_origem_numero').AsString;
      Result.Complemento := Qr.FieldByName('endereco_origem_complemento').AsString;
      Result.Bairro := Qr.FieldByName('endereco_origem_bairro').AsString;
      Result.Cidade := Qr.FieldByName('endereco_origem_cidade').AsString;
      Result.UF := Qr.FieldByName('endereco_origem_uf').AsString;
      Result.CEP := Qr.FieldByName('endereco_origem_cep').AsString;
    end;
  finally
    Qr.Free;
  end;
end;

function TEntregadorRepository.CarregarEnderecoAtual(IdEntregador: Integer): TEnderecoAtual;
begin
  // ⭐ Por enquanto, retornar endereço vazio
  // A tabela enderecos_entregadores será criada futuramente
  Result := TEnderecoAtual.Create;
  Result.IdEntregador := IdEntregador;

  // ⭐ TODO: Implementar quando a tabela enderecos_entregadores for criada
  // SELECT * FROM enderecos_entregadores
  // WHERE id_entregador = :id
  // ORDER BY data_registro DESC LIMIT 1
end;

function TEntregadorRepository.BuscarPorIdUsuario(IdUsuario: Integer): TEntregador;
var
  Qr: TFDQuery;
begin
  Result := nil;
  Qr := TFDQuery.Create(nil);
  try
    Qr.Connection := DM.FDConn;
    Qr.SQL.Clear;
    Qr.SQL.Add('SELECT ');
    Qr.SQL.Add('  e.id_entregador, e.id_user, e.em_expediente,');
    Qr.SQL.Add('  u.nome_user, u.email_user, u.cpf_user, u.nphone_user');
    Qr.SQL.Add('FROM entregadores e');
    Qr.SQL.Add('INNER JOIN usuarios u ON e.id_user = u.id_user');
    Qr.SQL.Add('WHERE e.id_user = :id_user');
    Qr.ParamByName('id_user').AsInteger := IdUsuario;
    Qr.Open;

    if not Qr.IsEmpty then
    begin
      Result := TEntregador.Create;
      Result.IdEntregador := Qr.FieldByName('id_entregador').AsInteger;
      Result.IdUser := Qr.FieldByName('id_user').AsInteger;
      Result.NomeUsuario := Qr.FieldByName('nome_user').AsString;
      Result.EmailUsuario := Qr.FieldByName('email_user').AsString;
      Result.CPFUsuario := Qr.FieldByName('cpf_user').AsString;
      Result.TelefoneUsuario := Qr.FieldByName('nphone_user').AsString;
      Result.EmExpediente := Qr.FieldByName('em_expediente').AsBoolean; // ⭐ NOVO

      // ⭐ Carregar endereços
      Result.EnderecoOrigem.Free;
      Result.EnderecoOrigem := CarregarEnderecoOrigem(Result.IdEntregador);

      Result.EnderecoAtual.Free;
      Result.EnderecoAtual := CarregarEnderecoAtual(Result.IdEntregador);
    end;
  finally
    Qr.Free;
  end;
end;

function TEntregadorRepository.BuscarPorIdEntregador(IdEntregador: Integer): TEntregador;
var
  Qr: TFDQuery;
begin
  Result := nil;
  Qr := TFDQuery.Create(nil);
  try
    Qr.Connection := DM.FDConn;
    Qr.SQL.Clear;
    Qr.SQL.Add('SELECT ');
    Qr.SQL.Add('  e.id_entregador, e.id_user, e.em_expediente,');
    Qr.SQL.Add('  u.nome_user, u.email_user, u.cpf_user, u.nphone_user');
    Qr.SQL.Add('FROM entregadores e');
    Qr.SQL.Add('INNER JOIN usuarios u ON e.id_user = u.id_user');
    Qr.SQL.Add('WHERE e.id_entregador = :id_entregador');
    Qr.ParamByName('id_entregador').AsInteger := IdEntregador;
    Qr.Open;

    if not Qr.IsEmpty then
    begin
      Result := TEntregador.Create;
      Result.IdEntregador := Qr.FieldByName('id_entregador').AsInteger;
      Result.IdUser := Qr.FieldByName('id_user').AsInteger;
      Result.NomeUsuario := Qr.FieldByName('nome_user').AsString;
      Result.EmailUsuario := Qr.FieldByName('email_user').AsString;
      Result.CPFUsuario := Qr.FieldByName('cpf_user').AsString;
      Result.TelefoneUsuario := Qr.FieldByName('nphone_user').AsString;
      Result.EmExpediente := Qr.FieldByName('em_expediente').AsBoolean; // ⭐ NOVO

      // ⭐ Carregar endereços
      Result.EnderecoOrigem.Free;
      Result.EnderecoOrigem := CarregarEnderecoOrigem(Result.IdEntregador);

      Result.EnderecoAtual.Free;
      Result.EnderecoAtual := CarregarEnderecoAtual(Result.IdEntregador);
    end;
  finally
    Qr.Free;
  end;
end;

function TEntregadorRepository.AtualizarPerfil(Entregador: TEntregador): Boolean;
var
  Qr: TFDQuery;
begin
  Result := False;
  Qr := TFDQuery.Create(nil);
  try
    Qr.Connection := DM.FDConn;

    // ⭐ ATUALIZAR TABELA USUARIOS (nome, email, cpf, telefone)
    Qr.SQL.Clear;
    Qr.SQL.Add('UPDATE usuarios SET');
    Qr.SQL.Add('  nome_user = :nome,');
    Qr.SQL.Add('  email_user = :email,');
    Qr.SQL.Add('  cpf_user = :cpf,');
    Qr.SQL.Add('  nphone_user = :telefone');
    Qr.SQL.Add('WHERE id_user = :id_user');

    Qr.ParamByName('nome').AsString := Entregador.NomeUsuario;
    Qr.ParamByName('email').AsString := Entregador.EmailUsuario;
    Qr.ParamByName('cpf').AsString := Entregador.CPFUsuario;
    Qr.ParamByName('telefone').AsString := Entregador.TelefoneUsuario;
    Qr.ParamByName('id_user').AsInteger := Entregador.IdUser;

    Qr.ExecSQL;

    Result := True;
  finally
    Qr.Free;
  end;
end;

function TEntregadorRepository.AtualizarEnderecoOrigem(IdEntregador: Integer;
  EnderecoOrigem: TEnderecoOrigem): Boolean;
var
  Qr: TFDQuery;
begin
  Result := False;
  Qr := TFDQuery.Create(nil);
  try
    Qr.Connection := DM.FDConn;
    Qr.SQL.Clear;
    Qr.SQL.Add('UPDATE entregadores SET');
    Qr.SQL.Add('  endereco_origem_logradouro = :logradouro,');
    Qr.SQL.Add('  endereco_origem_numero = :numero,');
    Qr.SQL.Add('  endereco_origem_complemento = :complemento,');
    Qr.SQL.Add('  endereco_origem_bairro = :bairro,');
    Qr.SQL.Add('  endereco_origem_cidade = :cidade,');
    Qr.SQL.Add('  endereco_origem_uf = :uf,');
    Qr.SQL.Add('  endereco_origem_cep = :cep');
    Qr.SQL.Add('WHERE id_entregador = :id_entregador');

    Qr.ParamByName('logradouro').AsString := EnderecoOrigem.Logradouro;
    Qr.ParamByName('numero').AsString := EnderecoOrigem.Numero;
    Qr.ParamByName('complemento').AsString := EnderecoOrigem.Complemento;
    Qr.ParamByName('bairro').AsString := EnderecoOrigem.Bairro;
    Qr.ParamByName('cidade').AsString := EnderecoOrigem.Cidade;
    Qr.ParamByName('uf').AsString := EnderecoOrigem.UF;
    Qr.ParamByName('cep').AsString := EnderecoOrigem.CEP;
    Qr.ParamByName('id_entregador').AsInteger := IdEntregador;

    Qr.ExecSQL;
    Result := True;
  finally
    Qr.Free;
  end;
end;

function TEntregadorRepository.RegistrarEnderecoAtual(IdEntregador: Integer;
  EnderecoAtual: TEnderecoAtual): Boolean;
begin
  // ⭐ Por enquanto, retornar True sem fazer nada
  // A tabela enderecos_entregadores será criada futuramente
  Result := True;

  // ⭐ TODO: Implementar quando a tabela enderecos_entregadores for criada
  // INSERT INTO enderecos_entregadores (id_entregador, logradouro, numero...)
  // VALUES (:id_entregador, :logradouro, :numero...)
end;

function TEntregadorRepository.BuscarHistoricoEnderecos(IdEntregador: Integer): TObjectList<TEnderecoAtual>;
begin
  // ⭐ Por enquanto, retornar lista vazia
  // A tabela enderecos_entregadores será criada futuramente
  Result := TObjectList<TEnderecoAtual>.Create(True);

  // ⭐ TODO: Implementar quando a tabela enderecos_entregadores for criada
  // SELECT * FROM enderecos_entregadores
  // WHERE id_entregador = :id
  // ORDER BY data_registro DESC
end;

function TEntregadorRepository.AlterarStatusExpediente(IdEntregador: Integer;
  EmExpediente: Boolean): Boolean;
var
  Qr: TFDQuery;
  LinhasAfetadas: Integer;
begin
  Result := False;
  Qr := TFDQuery.Create(nil);
  try
    Qr.Connection := DM.FDConn;

    // ⭐ DEBUG: Mostrar valores
    ShowMessage('DEBUG Repository:' + #13#10 +
                'IdEntregador: ' + IntToStr(IdEntregador) + #13#10 +
                'EmExpediente: ' + BoolToStr(EmExpediente, True));

    // ⭐ Iniciar transação se não estiver em uma
    if not DM.FDConn.InTransaction then
      DM.FDConn.StartTransaction;

    try
      Qr.SQL.Clear;
      Qr.SQL.Add('UPDATE entregadores');
      Qr.SQL.Add('SET em_expediente = :em_expediente');
      Qr.SQL.Add('WHERE id_entregador = :id_entregador');

      Qr.ParamByName('em_expediente').AsBoolean := EmExpediente;
      Qr.ParamByName('id_entregador').AsInteger := IdEntregador;

      // ⭐ DEBUG: Mostrar SQL
      ShowMessage('DEBUG SQL:' + #13#10 + Qr.SQL.Text);

      Qr.ExecSQL;
      LinhasAfetadas := Qr.RowsAffected;

      // ⭐ DEBUG: Mostrar linhas afetadas
      ShowMessage('DEBUG: Linhas afetadas = ' + IntToStr(LinhasAfetadas));

      // ⭐ Commit explícito
      if DM.FDConn.InTransaction then
        DM.FDConn.Commit;

      Result := (LinhasAfetadas > 0);

      // ⭐ DEBUG: Resultado
      ShowMessage('DEBUG: Result = ' + BoolToStr(Result, True));
    except
      on E: Exception do
      begin
        // ⭐ Rollback em caso de erro
        if DM.FDConn.InTransaction then
          DM.FDConn.Rollback;
        raise Exception.Create('Erro ao alterar status de expediente: ' + E.Message);
      end;
    end;
  finally
    Qr.Free;
  end;
end;

function TEntregadorRepository.ObterSenhaHash(IdUsuario: Integer): String;
var
  Qr: TFDQuery;
begin
  Result := '';
  Qr := TFDQuery.Create(nil);
  try
    Qr.Connection := DM.FDConn;
    Qr.SQL.Clear;
    Qr.SQL.Add('SELECT senha_user FROM usuarios WHERE id_user = :id_user');
    Qr.ParamByName('id_user').AsInteger := IdUsuario;
    Qr.Open;

    if not Qr.IsEmpty then
      Result := Qr.FieldByName('senha_user').AsString;
  finally
    Qr.Free;
  end;
end;

function TEntregadorRepository.AlterarSenha(IdUsuario: Integer; const NovaSenhaHash: String): Boolean;
var
  Qr: TFDQuery;
begin
  Result := False;
  Qr := TFDQuery.Create(nil);
  try
    Qr.Connection := DM.FDConn;
    Qr.SQL.Clear;
    Qr.SQL.Add('UPDATE usuarios SET senha_user = :senha WHERE id_user = :id_user');
    Qr.ParamByName('senha').AsString := NovaSenhaHash;
    Qr.ParamByName('id_user').AsInteger := IdUsuario;
    Qr.ExecSQL;
    Result := True;
  finally
    Qr.Free;
  end;
end;

end.
