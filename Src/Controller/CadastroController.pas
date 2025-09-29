unit CadastroController;

interface
uses CadastroModel, CadastroService, SysUtils, vcl.Dialogs;
Type TCadastroController = class
  private
    FService: TCadastroService;
  public
    constructor Create;
    function ProcessoCadastro(const Cadastro: TCadastroCfg): Boolean;
    //class procedure VerificarCB(const Cadastro: TCadastroCfg);
  end;

implementation

constructor TCadastroController.Create;
    begin
      FService := TCadastroService.Create;
    end;

  function TCadastroController.ProcessoCadastro(const Cadastro: TCadastroCfg): Boolean;
      begin
        try
          FService.Cadastrar(Cadastro);
          Result := True;
        except
          on E: Exception do
          begin
            ShowMessage('Falha no cadastro: ' + E.Message);
          end;
        end;
      end;
//class procedure TCadastroController.VerificarCB(const Cadastro: TCadastroCfg);
//begin
  //TCadastroService.LerCB(Cadastro);
//end;

end.

