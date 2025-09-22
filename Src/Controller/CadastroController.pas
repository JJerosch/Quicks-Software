unit CadastroController;

interface
uses CadastroModel, CadastroService, SysUtils, vcl.Dialogs;
Type TCadastroController = class
  private
    FService: TCadastroService;
  public
    constructor Create;
    class procedure ProcessoCadastro(const Cadastro: TCadastroCfg);
  end;

implementation
  constructor TCadastroController.Create;
    begin
      FService := TCadastroService.Create;
    end;
  class procedure TCadastroController.ProcessoCadastro(const Cadastro: TCadastroCfg);
    begin
      try
        TCadastroService.Salvar(Cadastro);
      except
        on E: Exception do
        begin
          ShowMessage('Falha no cadastro: ' + E.Message);
        end;
      end;
    end;
end.
