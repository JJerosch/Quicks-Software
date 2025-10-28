unit uConn;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.PG,
  FireDAC.Phys.PGDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Dialogs;

type
  TDM = class(TDataModule)
    FDConn: TFDConnection;
    FDQr: TFDQuery;
    DS: TDataSource;
    DL: TFDPhysPgDriverLink;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}
procedure TDM.DataModuleCreate(Sender: TObject);
begin
  FDConn.Params.Add('CharacterSet=UTF8');
  try
      if not FDConn.Connected then
      begin
        FDConn.Connected := True;
      end;
    except
      on E: Exception do
        ShowMessage('Erro na conex�o: ' + E.Message);
    end;
  end;
end.
