unit CadastroModel;

interface
  Type
    TCadastroCfg = class
    private
      FId: string;
      FNome: string;
      FEmail: string;
      FCPF: string;
      FSenha: string;
      FNPhone: string;
      FTipoUsuario: string;
      FIdTipoUsuario: Integer;
    public
      property Id: string read FId write FId;
      property Nome: string read FNome write FNome;
      property Email: string read FEmail write FEmail;
      property CPF: string read FCPF write FCPF;
      property Senha: string read FSenha write FSenha;
      property NPhone: string read FNPhone write FNPhone;
      property TipoUsuario: string read FTipoUsuario write FTipoUsuario;
      property IdTipoUsuario: Integer read FIdTipoUsuario write FIdTipoUsuario;
    end;
implementation
end.
