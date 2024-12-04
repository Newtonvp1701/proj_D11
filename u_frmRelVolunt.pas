unit u_frmRelVolunt;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, frxClass, frxDBSet,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.ExtCtrls, QuickRpt, frxExportBaseDialog, frxExportPDF;

type
  TfrmRelVolunt = class(TForm)
    frxRepVolunt: TfrxReport;
    dbCadVolunt: TfrxDBDataset;
    Button1: TButton;
    Button2: TButton;
    frxPDFExport1: TfrxPDFExport;
    QuickRep1: TQuickRep;
    qryCadVolunt: TFDQuery;
    dsCad: TDataSource;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelVolunt: TfrmRelVolunt;

implementation

uses
  dm;

{$R *.dfm}

procedure TfrmRelVolunt.Button1Click(Sender: TObject);
begin
  frxRepVolunt.ShowReport(); //'relCadVoluntarios.fr3'
end;

end.
