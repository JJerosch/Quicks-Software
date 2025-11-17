unit ViaCEPHelper;

interface

uses
  System.SysUtils, System.Classes, System.JSON, System.Net.HttpClient,
  System.Net.URLClient, Vcl.StdCtrls, Vcl.Dialogs, Vcl.Mask;

type
  TEndereco = record
    CEP: string;
    Logradouro: string;
    Complemento: string;
    Bairro: string;
    Localidade: string;  // Cidade
    UF: string;
    Erro: Boolean;
  end;

  TViaCEPHelper = class
  private
    class function LimparCEP(const CEP: string): string;
  public
    class function BuscarEnderecoPorCEP(const CEP: string): TEndereco;
    class procedure PreencherCamposEndereco(
      const CEP: string;
      eLogradouro, eCidade, eBairro, eComplemento: TEdit;
      cbEstado: TComboBox);
  end;

implementation

{ TViaCEPHelper }

class function TViaCEPHelper.LimparCEP(const CEP: string): string;
var
  i: Integer;
begin
  Result := '';
  for i := 1 to Length(CEP) do
  begin
    if CharInSet(CEP[i], ['0'..'9']) then
      Result := Result + CEP[i];
  end;
end;

class function TViaCEPHelper.BuscarEnderecoPorCEP(const CEP: string): TEndereco;
var
  HttpClient: THTTPClient;
  Response: IHTTPResponse;
  JSONValue: TJSONValue;
  CEPLimpo: string;
  URL: string;
begin
  // Inicializar com erro por padrão
  Result.Erro := True;
  Result.CEP := '';
  Result.Logradouro := '';
  Result.Complemento := '';
  Result.Bairro := '';
  Result.Localidade := '';
  Result.UF := '';

  CEPLimpo := LimparCEP(CEP);

  // Validar CEP
  if Length(CEPLimpo) <> 8 then
  begin
    ShowMessage('CEP inválido! Deve conter 8 dígitos.');
    Exit;
  end;

  HttpClient := THTTPClient.Create;
  try
    URL := Format('https://viacep.com.br/ws/%s/json/', [CEPLimpo]);

    try
      Response := HttpClient.Get(URL);

      if Response.StatusCode = 200 then
      begin
        JSONValue := TJSONObject.ParseJSONValue(Response.ContentAsString);
        try
          if Assigned(JSONValue) and (JSONValue is TJSONObject) then
          begin
            // Verificar se retornou erro
            if (JSONValue as TJSONObject).GetValue('erro') <> nil then
            begin
              ShowMessage('CEP não encontrado!');
              Exit;
            end;

            // Preencher resultado
            Result.CEP := CEPLimpo;
            Result.Logradouro := (JSONValue as TJSONObject).GetValue('logradouro').Value;
            Result.Complemento := (JSONValue as TJSONObject).GetValue('complemento').Value;
            Result.Bairro := (JSONValue as TJSONObject).GetValue('bairro').Value;
            Result.Localidade := (JSONValue as TJSONObject).GetValue('localidade').Value;
            Result.UF := (JSONValue as TJSONObject).GetValue('uf').Value;
            Result.Erro := False;
          end;
        finally
          JSONValue.Free;
        end;
      end
      else
      begin
        ShowMessage('Erro ao consultar CEP: ' + Response.StatusText);
      end;
    except
      on E: Exception do
      begin
        ShowMessage('Erro ao buscar CEP: ' + E.Message);
      end;
    end;
  finally
    HttpClient.Free;
  end;
end;

class procedure TViaCEPHelper.PreencherCamposEndereco(
  const CEP: string;
  eLogradouro, eCidade, eBairro, eComplemento: TEdit;
  cbEstado: TComboBox);
var
  Endereco: TEndereco;
begin
  Endereco := BuscarEnderecoPorCEP(CEP);

  if not Endereco.Erro then
  begin
    // Preencher campos
    if Assigned(eLogradouro) then
      eLogradouro.Text := Endereco.Logradouro;

    if Assigned(eCidade) then
      eCidade.Text := Endereco.Localidade;

    if Assigned(eBairro) then
      eBairro.Text := Endereco.Bairro;

    if Assigned(eComplemento) and (Trim(Endereco.Complemento) <> '') then
      eComplemento.Text := Endereco.Complemento;

    if Assigned(cbEstado) then
      cbEstado.Text := Endereco.UF;
  end;
end;

end.
