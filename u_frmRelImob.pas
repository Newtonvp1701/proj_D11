unit u_frmRelImob;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, frxClass, Vcl.StdCtrls,
  Vcl.ComCtrls;

type
  TfrmRelImob = class(TForm)
    frxReport1: TfrxReport;
    dsCasaOracao: TDataSource;
    qryCasaOracao: TFDQuery;
    cbbCasaOracao: TComboBoxEx;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelImob: TfrmRelImob;

implementation

uses
  dm;

{$R *.dfm}

end.
