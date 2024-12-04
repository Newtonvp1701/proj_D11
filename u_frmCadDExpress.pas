unit u_frmCadDExpress;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.DBLookup,
  Vcl.Grids, Vcl.DBGrids, Vcl.Mask, Vcl.ExtCtrls, Vcl.DBCtrls, Data.FMTBcd,
  Data.SqlExpr, Data.DBXFirebird, Datasnap.DBClient, SimpleDS;

type
  TfrmCadVolDBExpress = class(TForm)
    DBGrid1: TDBGrid;
    dbcPesqNome: TDBLookupCombo;
    DBLabeledEdit1: TDBLabeledEdit;
    DBLabeledEdit2: TDBLabeledEdit;
    DBLabeledEdit3: TDBLabeledEdit;
    DBLabeledEdit4: TDBLabeledEdit;
    dsCad: TDataSource;
    SQLQuery1: TSQLQuery;
    SimpleDataSet1: TSimpleDataSet;
    DBNavigator1: TDBNavigator;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadVolDBExpress: TfrmCadVolDBExpress;

implementation

uses
  dm;

{$R *.dfm}

procedure TfrmCadVolDBExpress.FormCreate(Sender: TObject);
begin

//  SQLQuery1.Active := True;


    SimpleDataSet1.Active := True;

end;

end.
