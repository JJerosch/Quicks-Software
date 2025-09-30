unit CadastroController;

interface
uses
  CadastroModel, CadastroService, SysUtils, vcl.Dialogs;

type
  TCadastroController = class
  private
    FService: TCadastroService;
  public
    constructor Create;
    destructor Destroy; override;
    function ProcessoCadastro(const Cadastro: TCadastroCfg): Boolean;
  end;

implementation

constructor TCadastroController.Create;
  begin
    inherited;
    FService := TCadastroService.Create;
  end;

destructor TCadastroController.Destroy;
  begin
    FService.Free;
    inherited;
  end;

function TCadastroController.ProcessoCadastro(const Cadastro: TCadastroCfg): Boolean;
  begin
    try
      Result := FService.Cadastrar(Cadastro);
    except
      on E: Exception do
      begin
        ShowMessage('Falha no cadastro: ' + E.Message);
        Result := False;
      end;
    end;
  end;
end.
