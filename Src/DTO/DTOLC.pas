unit DTOLC;

interface
  uses FormLoginMain;
  Type TDTO = class
    private
      DTOEmailV: String;
      DTOSenhaV: String;
    public
      property DTOEmail: String Read DTOEmailV Write DTOEmailV;
      property DTOSenha: String Read DTOSenhaV Write DTOSenhaV;
end;
implementation

end.
