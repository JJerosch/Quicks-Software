unit ClienteRepository;

interface

uses
  System.SysUtils, System.Generics.Collections, FireDAC.Comp.Client,
  ComercioModel, System.DateUtils;

type
  TClienteRepository = class
  private
    function ComercioEstaAberto(HorarioAbertura, HorarioFechamento: TTime): Boolean;
  public
    function ListarComercios(ApenasAbertos: Boolean): TObjectList<TComercio>;
    function BuscarComercios(const Termo: string): TObjectList<TComercio>;
  end;

implementation

uses
  uConn;

function TClienteRepository.ComercioEstaAberto(HorarioAbertura, HorarioFechamento: TTime): Boolean;
var
  HoraAtual: TTime;
begin
  HoraAtual := Time;

  if HorarioFechamento > HorarioAbertura then
    Result := (HoraAtual >= HorarioAbertura) and (HoraAtual <= HorarioFechamento)
  else
    Result := (HoraAtual >= HorarioAbertura) or (HoraAtual <= HorarioFechamento);
end;

function TClienteRepository.ListarComercios(ApenasAbertos: Boolean): TObjectList<TComercio>;
var
  Qr: TFDQuery;
  Comercio: TComercio;
  EstaAberto: Boolean;
begin
  Result := TObjectList<TComercio>.Create(True);
  Qr := TFDQuery.Create(nil);
  try
    Qr.Connection := DM.FDConn;
    Qr.SQL.Clear;
    Qr.SQL.Add('SELECT ');
    Qr.SQL.Add('  c.id_comercio, c.nome_comercio, c.categoria,');
    Qr.SQL.Add('  c.descricao, c.horario_abertura, c.horario_fechamento,');
    Qr.SQL.Add('  c.taxa_entrega_base, c.nphone_comercio');
    Qr.SQL.Add('FROM comercios c');
    Qr.SQL.Add('ORDER BY c.nome_comercio');

    Qr.Open;

    // ✅ DEBUG: Log quantos registros vieram do banco
    if Qr.IsEmpty then
      raise Exception.Create('Nenhum comércio encontrado no banco de dados!');

    while not Qr.Eof do
    begin
      Comercio := TComercio.Create;
      try
        Comercio.IdComercio := Qr.FieldByName('id_comercio').AsInteger;
        Comercio.NomeComercio := Qr.FieldByName('nome_comercio').AsString;
        Comercio.Categoria := Qr.FieldByName('categoria').AsString;
        Comercio.Descricao := Qr.FieldByName('descricao').AsString;
        Comercio.HorarioAbertura := Frac(Qr.FieldByName('horario_abertura').AsDateTime);
        Comercio.HorarioFechamento := Frac(Qr.FieldByName('horario_fechamento').AsDateTime);
        Comercio.TaxaEntregaBase := Qr.FieldByName('taxa_entrega_base').AsCurrency;
        Comercio.NPhoneComercio := Qr.FieldByName('nphone_comercio').AsString;

        // ✅ CORREÇÃO: Sempre adiciona à lista, independente do filtro
        // O filtro de "aberto" é apenas visual, não remove da lista
        Result.Add(Comercio);

      except
        Comercio.Free;
        raise;
      end;

      Qr.Next;
    end;

  finally
    Qr.Free;
  end;
end;

function TClienteRepository.BuscarComercios(const Termo: string): TObjectList<TComercio>;
var
  Qr: TFDQuery;
  Comercio: TComercio;
begin
  Result := TObjectList<TComercio>.Create(True);
  Qr := TFDQuery.Create(nil);
  try
    Qr.Connection := DM.FDConn;
    Qr.SQL.Clear;
    Qr.SQL.Add('SELECT ');
    Qr.SQL.Add('  c.id_comercio, c.nome_comercio, c.categoria,');
    Qr.SQL.Add('  c.descricao, c.horario_abertura, c.horario_fechamento,');
    Qr.SQL.Add('  c.taxa_entrega_base, c.nphone_comercio');
    Qr.SQL.Add('FROM comercios c');
    Qr.SQL.Add('WHERE UPPER(c.nome_comercio) LIKE UPPER(:termo)');
    Qr.SQL.Add('   OR UPPER(c.categoria) LIKE UPPER(:termo)');
    Qr.SQL.Add('   OR UPPER(c.descricao) LIKE UPPER(:termo)');
    Qr.SQL.Add('ORDER BY c.nome_comercio');

    Qr.ParamByName('termo').AsString := '%' + Termo + '%';
    Qr.Open;

    while not Qr.Eof do
    begin
      Comercio := TComercio.Create;
      try
        Comercio.IdComercio := Qr.FieldByName('id_comercio').AsInteger;
        Comercio.NomeComercio := Qr.FieldByName('nome_comercio').AsString;
        Comercio.Categoria := Qr.FieldByName('categoria').AsString;
        Comercio.Descricao := Qr.FieldByName('descricao').AsString;
        Comercio.HorarioAbertura := Frac(Qr.FieldByName('horario_abertura').AsDateTime);
        Comercio.HorarioFechamento := Frac(Qr.FieldByName('horario_fechamento').AsDateTime);
        Comercio.TaxaEntregaBase := Qr.FieldByName('taxa_entrega_base').AsCurrency;
        Comercio.NPhoneComercio := Qr.FieldByName('nphone_comercio').AsString;

        Result.Add(Comercio);

      except
        Comercio.Free;
        raise;
      end;

      Qr.Next;
    end;

  finally
    Qr.Free;
  end;
end;

end.
