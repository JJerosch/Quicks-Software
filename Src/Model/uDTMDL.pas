unit uDTMDL;

interface

uses
  System.SysUtils, System.Classes;

type
  TDataMdl = class(TDataModule)
  private
    Fsenha: String;
    Femail: String;

  public
    property senha: String read Fsenha Write Fsenha;
    property email: String read Femail Write Femail;
  end;

var
  DataModule: TDataMdl;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
