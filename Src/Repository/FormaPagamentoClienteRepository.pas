unit FormaPagamentoClienteRepository;

interface

uses
  System.SysUtils, System.Generics.Collections,
  FireDAC.Comp.Client, FireDAC.Stan.Param, Data.DB,
  FormaPagamentoClienteModel, uConn;

type
  TFormaPagamentoClienteRepository = class
  private
    function DataSetToPagamento(DataSet: TDataSet): TFormaPagamentoCliente;
    function CarregarDadosCartao(IdPagamento: Integer): TPagamentoCartao;
    function CarregarDadosPix(IdPagamento: Integer): TPagamentoPix;
    function CarregarDadosTransferencia(IdPagamento: Integer): TPagamentoTransferencia;
  public
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

{ TFormaPagamentoClienteRepository }

function TFormaPagamentoClienteRepository.DataSetToPagamento(DataSet: TDataSet): TFormaPagamentoCliente;
var
  TipoStr: String;
begin
  TipoStr := DataSet.FieldByName('tipo_pagamento').AsString;

  // Criar o objeto correto baseado no tipo
  if TipoStr = 'Cartão' then
    Result := CarregarDadosCartao(DataSet.FieldByName('id_pagamento').AsInteger)
  else if TipoStr = 'Pix' then
    Result := CarregarDadosPix(DataSet.FieldByName('id_pagamento').AsInteger)
  else if TipoStr = 'Transferência' then
    Result := CarregarDadosTransferencia(DataSet.FieldByName('id_pagamento').AsInteger)
  else
  begin
    Result := TFormaPagamentoCliente.Create;
    Result.TipoPagamento := tpDinheiro;
  end;

  // Dados comuns
  Result.IdPagamento := DataSet.FieldByName('id_pagamento').AsInteger;
  Result.IdCliente := DataSet.FieldByName('id_cliente').AsInteger;
  Result.Apelido := DataSet.FieldByName('apelido').AsString;
  Result.Principal := DataSet.FieldByName('principal').AsBoolean;
  Result.Ativo := DataSet.FieldByName('ativo').AsBoolean;
end;

function TFormaPagamentoClienteRepository.CarregarDadosCartao(IdPagamento: Integer): TPagamentoCartao;
var
  Qr: TFDQuery;
begin
  Result := TPagamentoCartao.Create;
  Qr := TFDQuery.Create(nil);
  try
    Qr.Connection := DM.FDConn;
    Qr.SQL.Text :=
      'SELECT * FROM pagamentos_cartao WHERE id_pagamento = :id_pagamento';
    Qr.ParamByName('id_pagamento').AsInteger := IdPagamento;
    Qr.Open;

    if not Qr.IsEmpty then
    begin
      Result.IdCartao := Qr.FieldByName('id_cartao').AsInteger;
      Result.NumeroCartao := Qr.FieldByName('numero_cartao').AsString;
      Result.NomeTitular := Qr.FieldByName('nome_titular').AsString;
      Result.Bandeira := Qr.FieldByName('bandeira').AsString;
      Result.TipoCartao := Qr.FieldByName('tipo_cartao').AsString;
      Result.Validade := Qr.FieldByName('validade').AsString;
    end;
  finally
    Qr.Free;
  end;
end;

function TFormaPagamentoClienteRepository.CarregarDadosPix(IdPagamento: Integer): TPagamentoPix;
var
  Qr: TFDQuery;
begin
  Result := TPagamentoPix.Create;
  Qr := TFDQuery.Create(nil);
  try
    Qr.Connection := DM.FDConn;
    Qr.SQL.Text :=
      'SELECT * FROM pagamentos_pix WHERE id_pagamento = :id_pagamento';
    Qr.ParamByName('id_pagamento').AsInteger := IdPagamento;
    Qr.Open;

    if not Qr.IsEmpty then
    begin
      Result.IdPix := Qr.FieldByName('id_pix').AsInteger;
      Result.ChavePix := Qr.FieldByName('chave_pix').AsString;
      Result.TipoChavePix := Qr.FieldByName('tipo_chave_pix').AsString;
    end;
  finally
    Qr.Free;
  end;
end;

function TFormaPagamentoClienteRepository.CarregarDadosTransferencia(IdPagamento: Integer): TPagamentoTransferencia;
var
  Qr: TFDQuery;
begin
  Result := TPagamentoTransferencia.Create;
  Qr := TFDQuery.Create(nil);
  try
    Qr.Connection := DM.FDConn;
    Qr.SQL.Text :=
      'SELECT * FROM pagamentos_transferencia WHERE id_pagamento = :id_pagamento';
    Qr.ParamByName('id_pagamento').AsInteger := IdPagamento;
    Qr.Open;

    if not Qr.IsEmpty then
    begin
      Result.IdTransferencia := Qr.FieldByName('id_transferencia').AsInteger;
      Result.Banco := Qr.FieldByName('banco').AsString;
      Result.CodigoBanco := Qr.FieldByName('codigo_banco').AsString;
      Result.Agencia := Qr.FieldByName('agencia').AsString;
      Result.Conta := Qr.FieldByName('conta').AsString;
      Result.DigitoC := Qr.FieldByName('digito_conta').AsString;
      Result.TipoConta := Qr.FieldByName('tipo_conta').AsString;
    end;
  finally
    Qr.Free;
  end;
end;

function TFormaPagamentoClienteRepository.ListarPagamentos(IdCliente: Integer): TObjectList<TFormaPagamentoCliente>;
var
  Qr: TFDQuery;
  Pagamento: TFormaPagamentoCliente;
begin
  Result := TObjectList<TFormaPagamentoCliente>.Create(True);
  Qr := TFDQuery.Create(nil);
  try
    Qr.Connection := DM.FDConn;
    Qr.SQL.Text :=
      'SELECT * FROM formas_pagamento_clientes ' +
      'WHERE id_cliente = :id_cliente AND ativo = TRUE ' +
      'ORDER BY principal DESC, apelido';
    Qr.ParamByName('id_cliente').AsInteger := IdCliente;
    Qr.Open;

    while not Qr.Eof do
    begin
      Pagamento := DataSetToPagamento(Qr);
      if Assigned(Pagamento) then
        Result.Add(Pagamento);
      Qr.Next;
    end;
  finally
    Qr.Free;
  end;
end;

function TFormaPagamentoClienteRepository.CadastrarCartao(Cartao: TPagamentoCartao): Boolean;
var
  Qr: TFDQuery;
  IdPagamento: Integer;
begin
  Result := False;
  Qr := TFDQuery.Create(nil);
  try
    Qr.Connection := DM.FDConn;
    DM.FDConn.StartTransaction;

    try
      // 1. Inserir na tabela base
      if Cartao.Principal then
      begin
        Qr.SQL.Text :=
          'UPDATE formas_pagamento_clientes SET principal = FALSE ' +
          'WHERE id_cliente = :id_cliente';
        Qr.ParamByName('id_cliente').AsInteger := Cartao.IdCliente;
        Qr.ExecSQL;
      end;

      Qr.SQL.Text :=
        'INSERT INTO formas_pagamento_clientes ' +
        '(id_cliente, tipo_pagamento, apelido, principal, ativo) ' +
        'VALUES (:id_cliente, ''Cartão'', :apelido, :principal, TRUE) ' +
        'RETURNING id_pagamento';
      Qr.ParamByName('id_cliente').AsInteger := Cartao.IdCliente;
      Qr.ParamByName('apelido').AsString := Cartao.Apelido;
      Qr.ParamByName('principal').AsBoolean := Cartao.Principal;
      Qr.Open;

      IdPagamento := Qr.FieldByName('id_pagamento').AsInteger;
      Qr.Close;

      // 2. Inserir dados específicos do cartão
      Qr.SQL.Text :=
        'INSERT INTO pagamentos_cartao ' +
        '(id_pagamento, numero_cartao, nome_titular, bandeira, tipo_cartao, validade) ' +
        'VALUES (:id_pagamento, :numero_cartao, :nome_titular, :bandeira, :tipo_cartao, :validade)';
      Qr.ParamByName('id_pagamento').AsInteger := IdPagamento;
      Qr.ParamByName('numero_cartao').AsString := Cartao.NumeroCartao;
      Qr.ParamByName('nome_titular').AsString := Cartao.NomeTitular;
      Qr.ParamByName('bandeira').AsString := Cartao.Bandeira;
      Qr.ParamByName('tipo_cartao').AsString := Cartao.TipoCartao;
      Qr.ParamByName('validade').AsString := Cartao.Validade;
      Qr.ExecSQL;

      DM.FDConn.Commit;
      Result := True;
    except
      DM.FDConn.Rollback;
      raise;
    end;
  finally
    Qr.Free;
  end;
end;

function TFormaPagamentoClienteRepository.CadastrarPix(Pix: TPagamentoPix): Boolean;
var
  Qr: TFDQuery;
  IdPagamento: Integer;
begin
  Result := False;
  Qr := TFDQuery.Create(nil);
  try
    Qr.Connection := DM.FDConn;
    DM.FDConn.StartTransaction;

    try
      if Pix.Principal then
      begin
        Qr.SQL.Text :=
          'UPDATE formas_pagamento_clientes SET principal = FALSE ' +
          'WHERE id_cliente = :id_cliente';
        Qr.ParamByName('id_cliente').AsInteger := Pix.IdCliente;
        Qr.ExecSQL;
      end;

      Qr.SQL.Text :=
        'INSERT INTO formas_pagamento_clientes ' +
        '(id_cliente, tipo_pagamento, apelido, principal, ativo) ' +
        'VALUES (:id_cliente, ''Pix'', :apelido, :principal, TRUE) ' +
        'RETURNING id_pagamento';
      Qr.ParamByName('id_cliente').AsInteger := Pix.IdCliente;
      Qr.ParamByName('apelido').AsString := Pix.Apelido;
      Qr.ParamByName('principal').AsBoolean := Pix.Principal;
      Qr.Open;

      IdPagamento := Qr.FieldByName('id_pagamento').AsInteger;
      Qr.Close;

      Qr.SQL.Text :=
        'INSERT INTO pagamentos_pix ' +
        '(id_pagamento, chave_pix, tipo_chave_pix) ' +
        'VALUES (:id_pagamento, :chave_pix, :tipo_chave_pix)';
      Qr.ParamByName('id_pagamento').AsInteger := IdPagamento;
      Qr.ParamByName('chave_pix').AsString := Pix.ChavePix;
      Qr.ParamByName('tipo_chave_pix').AsString := Pix.TipoChavePix;
      Qr.ExecSQL;

      DM.FDConn.Commit;
      Result := True;
    except
      DM.FDConn.Rollback;
      raise;
    end;
  finally
    Qr.Free;
  end;
end;

function TFormaPagamentoClienteRepository.CadastrarTransferencia(Transferencia: TPagamentoTransferencia): Boolean;
var
  Qr: TFDQuery;
  IdPagamento: Integer;
begin
  Result := False;
  Qr := TFDQuery.Create(nil);
  try
    Qr.Connection := DM.FDConn;
    DM.FDConn.StartTransaction;

    try
      if Transferencia.Principal then
      begin
        Qr.SQL.Text :=
          'UPDATE formas_pagamento_clientes SET principal = FALSE ' +
          'WHERE id_cliente = :id_cliente';
        Qr.ParamByName('id_cliente').AsInteger := Transferencia.IdCliente;
        Qr.ExecSQL;
      end;

      Qr.SQL.Text :=
        'INSERT INTO formas_pagamento_clientes ' +
        '(id_cliente, tipo_pagamento, apelido, principal, ativo) ' +
        'VALUES (:id_cliente, ''Transferência'', :apelido, :principal, TRUE) ' +
        'RETURNING id_pagamento';
      Qr.ParamByName('id_cliente').AsInteger := Transferencia.IdCliente;
      Qr.ParamByName('apelido').AsString := Transferencia.Apelido;
      Qr.ParamByName('principal').AsBoolean := Transferencia.Principal;
      Qr.Open;

      IdPagamento := Qr.FieldByName('id_pagamento').AsInteger;
      Qr.Close;

      Qr.SQL.Text :=
        'INSERT INTO pagamentos_transferencia ' +
        '(id_pagamento, banco, codigo_banco, agencia, conta, digito_conta, tipo_conta) ' +
        'VALUES (:id_pagamento, :banco, :codigo_banco, :agencia, :conta, :digito_conta, :tipo_conta)';
      Qr.ParamByName('id_pagamento').AsInteger := IdPagamento;
      Qr.ParamByName('banco').AsString := Transferencia.Banco;
      Qr.ParamByName('codigo_banco').AsString := Transferencia.CodigoBanco;
      Qr.ParamByName('agencia').AsString := Transferencia.Agencia;
      Qr.ParamByName('conta').AsString := Transferencia.Conta;
      Qr.ParamByName('digito_conta').AsString := Transferencia.DigitoC;
      Qr.ParamByName('tipo_conta').AsString := Transferencia.TipoConta;
      Qr.ExecSQL;

      DM.FDConn.Commit;
      Result := True;
    except
      DM.FDConn.Rollback;
      raise;
    end;
  finally
    Qr.Free;
  end;
end;

function TFormaPagamentoClienteRepository.ExcluirPagamento(IdPagamento: Integer): Boolean;
var
  Qr: TFDQuery;
begin
  Result := False;
  Qr := TFDQuery.Create(nil);
  try
    Qr.Connection := DM.FDConn;
    Qr.SQL.Text :=
      'UPDATE formas_pagamento_clientes SET ativo = FALSE ' +
      'WHERE id_pagamento = :id_pagamento';
    Qr.ParamByName('id_pagamento').AsInteger := IdPagamento;
    Qr.ExecSQL;
    Result := True;
  finally
    Qr.Free;
  end;
end;

function TFormaPagamentoClienteRepository.DefinirComoPrincipal(IdPagamento: Integer; IdCliente: Integer): Boolean;
var
  Qr: TFDQuery;
begin
  Result := False;
  Qr := TFDQuery.Create(nil);
  try
    Qr.Connection := DM.FDConn;
    Qr.SQL.Text :=
      'UPDATE formas_pagamento_clientes SET principal = TRUE ' +
      'WHERE id_pagamento = :id_pagamento AND id_cliente = :id_cliente';
    Qr.ParamByName('id_pagamento').AsInteger := IdPagamento;
    Qr.ParamByName('id_cliente').AsInteger := IdCliente;
    Qr.ExecSQL;
    Result := True;
  finally
    Qr.Free;
  end;
end;

// ⭐ Métodos de atualização seguem a mesma lógica do cadastro
function TFormaPagamentoClienteRepository.AtualizarCartao(Cartao: TPagamentoCartao): Boolean;
begin
  // Implementação similar ao CadastrarCartao, mas com UPDATE
  Result := False;
  // TODO: Implementar
end;

function TFormaPagamentoClienteRepository.AtualizarPix(Pix: TPagamentoPix): Boolean;
begin
  Result := False;
  // TODO: Implementar
end;

function TFormaPagamentoClienteRepository.AtualizarTransferencia(Transferencia: TPagamentoTransferencia): Boolean;
begin
  Result := False;
  // TODO: Implementar
end;

function TFormaPagamentoClienteRepository.ObterPagamento(IdPagamento: Integer): TFormaPagamentoCliente;
var
  Qr: TFDQuery;
begin
  Result := nil;
  Qr := TFDQuery.Create(nil);
  try
    Qr.Connection := DM.FDConn;
    Qr.SQL.Text :=
      'SELECT * FROM formas_pagamento_clientes WHERE id_pagamento = :id_pagamento';
    Qr.ParamByName('id_pagamento').AsInteger := IdPagamento;
    Qr.Open;

    if not Qr.IsEmpty then
      Result := DataSetToPagamento(Qr);
  finally
    Qr.Free;
  end;
end;

end.
