unit dm;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Phys.IBBase, Data.SqlExpr, IBX.IBDatabase,
  FireDAC.Comp.UI, Data.FMTBcd, Data.DBXFirebird, System.IniFiles,
  FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef;

type
  TdmVolunt = class(TDataModule)
    dbConn: TFDConnection;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    qryVoluntarios: TFDQuery;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    SQLConnDB: TSQLConnection;
    qryCadvolunt: TSQLQuery;
    dsCadVol: TDataSource;
    fdconnMYSql: TFDConnection;
    FDGUIxWaitCursor2: TFDGUIxWaitCursor;
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
    connImob: TFDConnection;
    qryVoluntariosID_VOLUNT: TFDAutoIncField;
    qryVoluntariosNOME: TStringField;
    qryVoluntariosCOD_LIMPEZA: TStringField;
    qryVoluntariosCOD_MANUT: TStringField;
    qryVoluntariosCPF: TStringField;
    qryVoluntariosENDERECO: TStringField;
    qryVoluntariosBAIRRO: TStringField;
    qryVoluntariosDTNASC: TDateField;
    qryVoluntariosCELULAR: TStringField;
    qryVoluntariosRES: TStringField;
    qryVoluntariosC1: TStringField;
    qryVoluntariosC2: TStringField;
    qryVoluntariosC3: TStringField;
    qryVoluntariosC4: TStringField;
    qryVoluntariosC5: TStringField;
    qryVoluntariosC6: TStringField;
    qryVoluntariosC7: TStringField;
    qryVoluntariosPC1: TStringField;
    qryVoluntariosPC2: TStringField;
    qryVoluntariosPC3: TStringField;
    qryVoluntariosPC4: TStringField;
    qryVoluntariosPC5: TStringField;
    qryVoluntariosPC6: TStringField;
    qryVoluntariosPC7: TStringField;
    qryVoluntariosPC8: TStringField;
    qryVoluntariosPC9: TStringField;
    qryVoluntariosPC10: TStringField;
    qryVoluntariosPC11: TStringField;
    qryVoluntariosPC12: TStringField;
    qryVoluntariosPC13: TStringField;
    qryVoluntariosSEXO: TStringField;
    qryVoluntariosEMAIL: TStringField;
    qryVoluntariosCOMERCIAL: TStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmVolunt: TdmVolunt;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

uses
  Forms;

procedure TdmVolunt.DataModuleCreate(Sender: TObject);
var
  vName: string;
  LIniFile  : TIniFile;
  LDatabase : string;
  LUser_name: string;
  LPassword : string;
  LServidor : string;
  LPorta    : string;
  LCaminho  : string;


begin
//  dbConn.Connected := False;
////  vName := ExtractFilePath(Application.ExeName) + 'C:\DB\dbvolunt.FDB';
//  dbConn.Params.Database := 'C:\DB\dbvolunt.FDB';
//  dbConn.Params.UserName := 'SYSDBA';
//  dbConn.Params.Password := 'masterkey';
//  dbConn.Open;
//
//  SQLConnDB.Connected := False;
////  SQLConnDB.Params.database := 'C:\DB\dbvolunt.FDB';
////  SQLConnDB.Params.user_name := 'SYSDBA';
////  SQLConnDB.Params.
//
//  sqlconndb.Open;
//

  try
    dbConn.Connected := False;
    LCaminho := ExtractFileDir(ParamStr(0)) + '\Login.ini';

    LInifile  := TIniFile.Create(LCaminho);
    LDatabase := LIniFile.ReadString('Conexao','Database', LDatabase);
    LServidor := LIniFile.ReadString('Conexao','Servidor', LServidor);
    LPorta    := LIniFile.ReadString('Conexao','Porta', Lporta);

    LUser_name := 'SYSDBA';
    LPassword  := 'masterkey';

    dbConn.Params.Values['Database'] := LDatabase ;
    dbConn.Params.Values['User_name'] := LUser_name;
    dbConn.Params.Values['Password'] := LPassword;
    dbConn.Params.Values['Server'] := LServidor;
    dbConn.Params.Values['Porta'] :=  LPorta;

    dbConn.Connected := True;

  finally
    FreeAndNil(Linifile);
  end;


  try
    fdconnMYSql.Connected := False;
    LCaminho := ExtractFileDir(ParamStr(0)) + '\loginMYsql.ini';

    FDPhysMySQLDriverLink1.VendorLib := 'C:\source\proj_D11\Win32\Debug\libmysql.dll';

    LInifile  := TIniFile.Create(LCaminho);
    LDatabase := LIniFile.ReadString('Conexao','Database', LDatabase);
    LServidor := LIniFile.ReadString('Conexao','Servidor', LServidor);
    LPorta    := LIniFile.ReadString('Conexao','Porta', Lporta);

    LUser_name := 'root';
    LPassword  := 'N20atl20at#';

    fdconnMYSql.DriverName := 'MySQL';
    fdconnMYSql.Params.Values['Database'] := LDatabase;
    fdconnMYSql.Params.Values['User_name'] := LUser_name;
    fdconnMYSql.Params.Values['Password'] := LPassword;
    fdconnMYSql.Params.Values['Server']   := LServidor;
    fdconnMYSql.Params.Values['Porta']    := LPorta;

    fdconnMYSql.Connected := True;

  finally
    FreeAndNil(LIniFile);
  end;



end;

end.
