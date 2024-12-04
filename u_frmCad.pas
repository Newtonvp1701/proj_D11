unit u_frmCad;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls, Vcl.DBCtrls, QImport3Wizard,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmCad = class(TForm)
    DBGrid1: TDBGrid;
    dsVolunt: TDataSource;
    DBNavigator1: TDBNavigator;
    btnIncluir: TButton;
    btnExcluir: TButton;
    btnAlterar: TButton;
    btnSalvar: TButton;
    btnCancelar: TButton;
    DBLookupComboBox1: TDBLookupComboBox;
    dbID: TDBLabeledEdit;
    dbNome: TDBLabeledEdit;
    DBLabeledEdit3: TDBLabeledEdit;
    DBLabeledEdit4: TDBLabeledEdit;
    Button1: TButton;
    ComboBox1: TComboBox;
    QImport3Wizard1: TQImport3Wizard;
    FDTable1: TFDTable;
    btnLerCSV: TButton;
    DataSource1: TDataSource;
    DBGrid2: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure btnLerCSVClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCad: TfrmCad;

implementation

{$R *.dfm}


uses dm;


procedure TfrmCad.btnAlterarClick(Sender: TObject);
begin
  dsVolunt.DataSet.Edit;
  dbNome.SetFocus;
end;

procedure TfrmCad.btnCancelarClick(Sender: TObject);
begin
  dsVolunt.DataSet.Cancel;
end;

procedure TfrmCad.btnIncluirClick(Sender: TObject);
begin
  dsVolunt.DataSet.Append;
  dbNome.SetFocus;
end;

procedure TfrmCad.btnLerCSVClick(Sender: TObject);
begin
 QImport3Wizard1.Execute;
end;

procedure TfrmCad.btnSalvarClick(Sender: TObject);
begin
  dsVolunt.DataSet.Post;
end;

procedure TfrmCad.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmCad.DBGrid1CellClick(Column: TColumn);
begin
  with DBGrid1.Columns[10].PickList do
  begin
    Clear;
    Add('X');
    Add('A');
    Add('B');
    Add('E');
  end;
end;

procedure TfrmCad.FormCreate(Sender: TObject);
begin
  if not (dsVolunt.DataSet.Active) then
    dsVolunt.DataSet.Open;
end;

end.



