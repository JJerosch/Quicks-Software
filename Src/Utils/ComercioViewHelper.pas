unit ComercioViewHelper;

interface

uses
  System.SysUtils, System.StrUtils, Vcl.StdCtrls, ComercioModel;

type
  TComercioViewHelper = class
  public
    // Formatação de moeda
    class function FormatarMoeda(Valor: Currency): string;
    class function ParseMoeda(const Texto: string): Currency;

    // Formatação de telefone
    class function FormatarTelefone(const Telefone: string): string;
    class function RemoverMascaraTelefone(const Telefone: string): string;

    // Formatação de CEP
    class function FormatarCEP(const CEP: string): string;
    class function RemoverMascaraCEP(const CEP: string): string;

    // Formatação de CPF
    class function FormatarCPF(const CPF: string): string;
    class function RemoverMascaraCPF(const CPF: string): string;

    // Validações
    class function ValidarEmail(const Email: string): Boolean;
    class function ValidarCEP(const CEP: string): Boolean;
    class function ValidarTelefone(const Telefone: string): Boolean;

    // Popular ComboBox de categorias
    class procedure PopularCategoriasComercio(ComboBox: TComboBox);

    class function FormatarHorario(const Hora: TTime): string;
    class function ParseHorario(const Texto: string): TTime;
  end;

implementation

{ TComercioViewHelper }

class function TComercioViewHelper.FormatarMoeda(Valor: Currency): string;
begin
  Result := FormatFloat('R$ #,##0.00', Valor);
end;

class function TComercioViewHelper.FormatarHorario(const Hora: TTime): string;
begin
  Result := FormatDateTime('hh:nn', Hora);
end;

class function TComercioViewHelper.ParseHorario(const Texto: string): TTime;
var
  TextoLimpo: string;
begin
  TextoLimpo := StringReplace(Texto, '_', '', [rfReplaceAll]);
  TextoLimpo := Trim(TextoLimpo);

  if (Length(TextoLimpo) >= 4) and (Pos(':', TextoLimpo) > 0) then
  begin
    try
      Result := StrToTime(TextoLimpo);
    except
      Result := 0; // 00:00
    end;
  end
  else
    Result := 0;
end;

class function TComercioViewHelper.ParseMoeda(const Texto: string): Currency;
var
  TextoLimpo: string;
begin
  TextoLimpo := StringReplace(Texto, 'R$', '', [rfReplaceAll]);
  TextoLimpo := StringReplace(TextoLimpo, '.', '', [rfReplaceAll]);
  TextoLimpo := StringReplace(TextoLimpo, ',', '.', [rfReplaceAll]);
  TextoLimpo := Trim(TextoLimpo);

  if TextoLimpo = '' then
    Result := 0
  else
    Result := StrToCurrDef(TextoLimpo, 0);
end;

class function TComercioViewHelper.FormatarTelefone(const Telefone: string): string;
var
  TelLimpo: string;
begin
  TelLimpo := RemoverMascaraTelefone(Telefone);

  if Length(TelLimpo) = 11 then
    Result := Format('(%s) %s-%s', [Copy(TelLimpo, 1, 2), Copy(TelLimpo, 3, 5), Copy(TelLimpo, 8, 4)])
  else if Length(TelLimpo) = 10 then
    Result := Format('(%s) %s-%s', [Copy(TelLimpo, 1, 2), Copy(TelLimpo, 3, 4), Copy(TelLimpo, 7, 4)])
  else
    Result := Telefone;
end;

class function TComercioViewHelper.RemoverMascaraTelefone(const Telefone: string): string;
begin
  Result := StringReplace(Telefone, '(', '', [rfReplaceAll]);
  Result := StringReplace(Result, ')', '', [rfReplaceAll]);
  Result := StringReplace(Result, '-', '', [rfReplaceAll]);
  Result := StringReplace(Result, ' ', '', [rfReplaceAll]);
  Result := Trim(Result);
end;

class function TComercioViewHelper.FormatarCEP(const CEP: string): string;
var
  CEPLimpo: string;
begin
  CEPLimpo := RemoverMascaraCEP(CEP);

  if Length(CEPLimpo) = 8 then
    Result := Format('%s-%s', [Copy(CEPLimpo, 1, 5), Copy(CEPLimpo, 6, 3)])
  else
    Result := CEP;
end;

class function TComercioViewHelper.RemoverMascaraCEP(const CEP: string): string;
begin
  Result := StringReplace(CEP, '-', '', [rfReplaceAll]);
  Result := StringReplace(Result, '.', '', [rfReplaceAll]);
  Result := Trim(Result);
end;

class function TComercioViewHelper.FormatarCPF(const CPF: string): string;
var
  CPFLimpo: string;
begin
  CPFLimpo := RemoverMascaraCPF(CPF);

  if Length(CPFLimpo) = 11 then
    Result := Format('%s.%s.%s-%s', [Copy(CPFLimpo, 1, 3), Copy(CPFLimpo, 4, 3),
                                      Copy(CPFLimpo, 7, 3), Copy(CPFLimpo, 10, 2)])
  else
    Result := CPF;
end;

class function TComercioViewHelper.RemoverMascaraCPF(const CPF: string): string;
begin
  Result := StringReplace(CPF, '.', '', [rfReplaceAll]);
  Result := StringReplace(Result, '-', '', [rfReplaceAll]);
  Result := Trim(Result);
end;

class function TComercioViewHelper.ValidarEmail(const Email: string): Boolean;
begin
  Result := (Pos('@', Email) > 0) and (Pos('.', Email) > 0);
end;

class function TComercioViewHelper.ValidarCEP(const CEP: string): Boolean;
var
  CEPLimpo: string;
begin
  CEPLimpo := RemoverMascaraCEP(CEP);
  Result := Length(CEPLimpo) = 8;
end;

class function TComercioViewHelper.ValidarTelefone(const Telefone: string): Boolean;
var
  TelLimpo: string;
begin
  TelLimpo := RemoverMascaraTelefone(Telefone);
  Result := (Length(TelLimpo) = 10) or (Length(TelLimpo) = 11);
end;

class procedure TComercioViewHelper.PopularCategoriasComercio(ComboBox: TComboBox);
begin
  ComboBox.Items.Clear;
  ComboBox.Items.Add('Restaurante');
  ComboBox.Items.Add('Lanchonete');
  ComboBox.Items.Add('Pizzaria');
  ComboBox.Items.Add('Hamburgueria');
  ComboBox.Items.Add('Açaiteria');
  ComboBox.Items.Add('Padaria');
  ComboBox.Items.Add('Confeitaria');
  ComboBox.Items.Add('Mercado');
  ComboBox.Items.Add('Farmácia');
  ComboBox.Items.Add('Pet Shop');
  ComboBox.Items.Add('Outros');
end;

end.
