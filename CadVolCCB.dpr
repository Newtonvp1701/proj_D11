program CadVolCCB;

uses
  Vcl.Forms,
  frmPrincipal in 'frmPrincipal.pas' {frmProj1},
  dm in 'dm.pas' {dmVolunt: TDataModule},
  u_frmCad in 'u_frmCad.pas' {frmCad},
  u_frmCadDExpress in 'u_frmCadDExpress.pas' {frmCadVolDBExpress},
  u_frmRelVolunt in 'u_frmRelVolunt.pas' {frmRelVolunt},
  u_frmWKdb in 'u_frmWKdb.pas' {frmWKdb},
  u_frmImob in 'u_frmImob.pas' {frmImobilizado},
  UCSVReader in 'UCSVReader.pas',
  u_frmRelImob in 'u_frmRelImob.pas' {frmRelImob};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmProj1, frmProj1);
  Application.CreateForm(TdmVolunt, dmVolunt);
  Application.CreateForm(TfrmCadVolDBExpress, frmCadVolDBExpress);
  Application.CreateForm(TfrmRelVolunt, frmRelVolunt);
  Application.CreateForm(TfrmWKdb, frmWKdb);
  Application.CreateForm(TfrmImobilizado, frmImobilizado);
  Application.CreateForm(TfrmRelImob, frmRelImob);
  Application.Run;
end.
