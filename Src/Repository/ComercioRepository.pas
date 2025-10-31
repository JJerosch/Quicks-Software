unit ComercioRepository;

interface

uses
  System.SysUtils, FireDAC.Comp.Client, ComercioModel;

type
  TComercioRepository = class
  public
    function BuscarPorIdUsuario(IdUsuario: Integer): TComercio;
    function BuscarPorIdComercio(IdComercio: Integer): TComercio;
    function Atualizar(Comercio: TComercio): Boolean;
    function ObterSenhaHash(IdUsuario: Integer): string;
    function AlterarSenha(IdUsuario: Integer; const NovaSenhaHash: string): Boolean;
  end;

implementation

uses
  uConn;

{ TComercioRepository }

function TComercioRepository.BuscarPorIdUsuario(IdUsuario: Integer): TComercio;
var
  Qr: TFDQuery;
begin
  Result := nil;
  Qr := TFDQuery.Create(nil);
  try
    Qr.Connection := DM.FDConn;
    Qr.SQL.Clear;
    Qr.SQL.Add('SELECT ');
    Qr.SQL.Add('  c.id_comercio, c.id_user, c.nome_comercio, c.categoria,');
    Qr.SQL.Add('  c.descricao, c.horario_abertura, c.horario_fechamento,');
    Qr.SQL.Add('  c.tempo_preparo_medio, c.taxa_entrega_base,');
    Qr.SQL.Add('  c.email_comercio, c.nphone_comercio, c.cpf_cnpj_comercio,');
    Qr.SQL.Add('  c.endereco_completo, c.cep, c.numero, c.complemento,');
    Qr.SQL.Add('  c.bairro, c.cidade, c.estado,');
    Qr.SQL.Add('  u.nome_user, u.email_user, u.cpf_user, u.nphone_user');
    Qr.SQL.Add('FROM comercios c');
    Qr.SQL.Add('INNER JOIN usuarios u ON c.id_user = u.id_user');
    Qr.SQL.Add('WHERE c.id_user = :id_user');
    Qr.ParamByName('id_user').AsInteger := IdUsuario;
    Qr.Open;

    if not Qr.IsEmpty then
    begin
      Result := TComercio.Create;
      Result.IdComercio := Qr.FieldByName('id_comercio').AsInteger;
      Result.IdUser := Qr.FieldByName('id_user').AsInteger;
      Result.NomeComercio := Qr.FieldByName('nome_comercio').AsString;
      Result.Categoria := Qr.FieldByName('categoria').AsString;
      Result.Descricao := Qr.FieldByName('descricao').AsString;
      Result.HorarioAbertura := Qr.FieldByName('horario_abertura').AsString;
      Result.HorarioFechamento := Qr.FieldByName('horario_fechamento').AsString;
      Result.TempoPreparoMedio := Qr.FieldByName('tempo_preparo_medio').AsInteger;
      Result.TaxaEntregaBase := Qr.FieldByName('taxa_entrega_base').AsCurrency;
      Result.EmailComercio := Qr.FieldByName('email_comercio').AsString;
      Result.NPhoneComercio := Qr.FieldByName('nphone_comercio').AsString;
      Result.CpfCnpjComercio := Qr.FieldByName('cpf_cnpj_comercio').AsString;
      Result.EnderecoCompleto := Qr.FieldByName('endereco_completo').AsString;
      Result.CEP := Qr.FieldByName('cep').AsString;
      Result.Numero := Qr.FieldByName('numero').AsString;
      Result.Complemento := Qr.FieldByName('complemento').AsString;
      Result.Bairro := Qr.FieldByName('bairro').AsString;
      Result.Cidade := Qr.FieldByName('cidade').AsString;
      Result.Estado := Qr.FieldByName('estado').AsString;
      Result.NomeProprietario := Qr.FieldByName('nome_user').AsString;
      Result.EmailProprietario := Qr.FieldByName('email_user').AsString;
      Result.CPFProprietario := Qr.FieldByName('cpf_user').AsString;
      Result.NPhoneProprietario := Qr.FieldByName('nphone_user').AsString;
    end;
  finally
    Qr.Free;
  end;
end;

function TComercioRepository.BuscarPorIdComercio(IdComercio: Integer): TComercio;
var
  Qr: TFDQuery;
begin
  Result := nil;
  Qr := TFDQuery.Create(nil);
  try
    Qr.Connection := DM.FDConn;
    Qr.SQL.Clear;
    Qr.SQL.Add('SELECT ');
    Qr.SQL.Add('  c.id_comercio, c.id_user, c.nome_comercio, c.categoria,');
    Qr.SQL.Add('  c.descricao, c.horario_abertura, c.horario_fechamento,');
    Qr.SQL.Add('  c.tempo_preparo_medio, c.taxa_entrega_base,');
    Qr.SQL.Add('  c.email_comercio, c.nphone_comercio, c.cpf_cnpj_comercio,');
    Qr.SQL.Add('  c.endereco_completo, c.cep, c.numero, c.complemento,');
    Qr.SQL.Add('  c.bairro, c.cidade, c.estado,');
    Qr.SQL.Add('  u.nome_user, u.email_user, u.cpf_user, u.nphone_user');
    Qr.SQL.Add('FROM comercios c');
    Qr.SQL.Add('INNER JOIN usuarios u ON c.id_user = u.id_user');
    Qr.SQL.Add('WHERE c.id_comercio = :id_comercio');
    Qr.ParamByName('id_comercio').AsInteger := IdComercio;
    Qr.Open;

    if not Qr.IsEmpty then
    begin
      Result := TComercio.Create;
      Result.IdComercio := Qr.FieldByName('id_comercio').AsInteger;
      Result.IdUser := Qr.FieldByName('id_user').AsInteger;
      Result.NomeComercio := Qr.FieldByName('nome_comercio').AsString;
      Result.Categoria := Qr.FieldByName('categoria').AsString;
      Result.Descricao := Qr.FieldByName('descricao').AsString;
      Result.HorarioAbertura := Qr.FieldByName('horario_abertura').AsString;
      Result.HorarioFechamento := Qr.FieldByName('horario_fechamento').AsString;
      Result.TempoPreparoMedio := Qr.FieldByName('tempo_preparo_medio').AsInteger;
      Result.TaxaEntregaBase := Qr.FieldByName('taxa_entrega_base').AsCurrency;
      Result.EmailComercio := Qr.FieldByName('email_comercio').AsString;
      Result.NPhoneComercio := Qr.FieldByName('nphone_comercio').AsString;
      Result.CpfCnpjComercio := Qr.FieldByName('cpf_cnpj_comercio').AsString;
      Result.EnderecoCompleto := Qr.FieldByName('endereco_completo').AsString;
      Result.CEP := Qr.FieldByName('cep').AsString;
      Result.Numero := Qr.FieldByName('numero').AsString;
      Result.Complemento := Qr.FieldByName('complemento').AsString;
      Result.Bairro := Qr.FieldByName('bairro').AsString;
      Result.Cidade := Qr.FieldByName('cidade').AsString;
      Result.Estado := Qr.FieldByName('estado').AsString;
      Result.NomeProprietario := Qr.FieldByName('nome_user').AsString;
      Result.EmailProprietario := Qr.FieldByName('email_user').AsString;
      Result.CPFProprietario := Qr.FieldByName('cpf_user').AsString;
      Result.NPhoneProprietario := Qr.FieldByName('nphone_user').AsString;
    end;
  finally
    Qr.Free;
  end;
end;

function TComercioRepository.Atualizar(Comercio: TComercio): Boolean;
var
  Qr: TFDQuery;
begin
  Result := False;
  Qr := TFDQuery.Create(nil);
  try
    Qr.Connection := DM.FDConn;
    Qr.SQL.Clear;
    Qr.SQL.Add('UPDATE comercios SET');
    Qr.SQL.Add('  nome_comercio = :nome_comercio,');
    Qr.SQL.Add('  categoria = :categoria,');
    Qr.SQL.Add('  descricao = :descricao,');
    Qr.SQL.Add('  horario_abertura = :horario_abertura,');
    Qr.SQL.Add('  horario_fechamento = :horario_fechamento,');
    Qr.SQL.Add('  tempo_preparo_medio = :tempo_preparo_medio,');
    Qr.SQL.Add('  taxa_entrega_base = :taxa_entrega_base,');
    Qr.SQL.Add('  email_comercio = :email_comercio,');
    Qr.SQL.Add('  nphone_comercio = :nphone_comercio,');
    Qr.SQL.Add('  endereco_completo = :endereco_completo,');
    Qr.SQL.Add('  cep = :cep,');
    Qr.SQL.Add('  numero = :numero,');
    Qr.SQL.Add('  complemento = :complemento,');
    Qr.SQL.Add('  bairro = :bairro,');
    Qr.SQL.Add('  cidade = :cidade,');
    Qr.SQL.Add('  estado = :estado');
    Qr.SQL.Add('WHERE id_comercio = :id_comercio');

    Qr.ParamByName('nome_comercio').AsString := Comercio.NomeComercio;
    Qr.ParamByName('categoria').AsString := Comercio.Categoria;
    Qr.ParamByName('descricao').AsString := Comercio.Descricao;
    Qr.ParamByName('horario_abertura').AsString := Comercio.HorarioAbertura;
    Qr.ParamByName('horario_fechamento').AsString := Comercio.HorarioFechamento;
    Qr.ParamByName('tempo_preparo_medio').AsInteger := Comercio.TempoPreparoMedio;
    Qr.ParamByName('taxa_entrega_base').AsCurrency := Comercio.TaxaEntregaBase;
    Qr.ParamByName('email_comercio').AsString := Comercio.EmailComercio;
    Qr.ParamByName('nphone_comercio').AsString := Comercio.NPhoneComercio;
    Qr.ParamByName('endereco_completo').AsString := Comercio.EnderecoCompleto;
    Qr.ParamByName('cep').AsString := Comercio.CEP;
    Qr.ParamByName('numero').AsString := Comercio.Numero;
    Qr.ParamByName('complemento').AsString := Comercio.Complemento;
    Qr.ParamByName('bairro').AsString := Comercio.Bairro;
    Qr.ParamByName('cidade').AsString := Comercio.Cidade;
    Qr.ParamByName('estado').AsString := Comercio.Estado;
    Qr.ParamByName('id_comercio').AsInteger := Comercio.IdComercio;

    Qr.ExecSQL;
    Result := True;
  finally
    Qr.Free;
  end;
end;

function TComercioRepository.ObterSenhaHash(IdUsuario: Integer): string;
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

function TComercioRepository.AlterarSenha(IdUsuario: Integer; const NovaSenhaHash: string): Boolean;
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
