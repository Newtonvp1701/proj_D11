
unit frmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Menus, Vcl.ComCtrls, system.Math,
  REST.Types, Vcl.Mask, Vcl.ExtCtrls, REST.Client, Data.Bind.Components,
  Data.Bind.ObjectScope,
  system.Net.HttpClient;

type TDigits = set of '1'..'9';

type
  TfrmProj1 = class(TForm)
    Button1: TButton;
    MainMenu1: TMainMenu;
    Cadastro1: TMenuItem;
    Relatrios1: TMenuItem;
    Sair1: TMenuItem;
    sbPrincipal: TStatusBar;
    ListBox1: TListBox;
    btnSorteio: TButton;
    lblNSorteado: TLabel;
    btnClassificar: TButton;
    edtNumsorteado: TEdit;
    Button2: TButton;
    Label1: TLabel;
    CadastroVoluntriosDBexpress1: TMenuItem;
    CadVolFireDAC1: TMenuItem;
    Label2: TLabel;
    relVolunt: TMenuItem;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    edtCNPJ: TLabeledEdit;
    Button3: TButton;
    Memo1: TMemo;
    mnuTesteWK: TMenuItem;
    mnuWKdb: TMenuItem;
    edtDtNr: TLabeledEdit;
    btnCalcDt: TButton;
    edtDtRes: TLabeledEdit;
    edtDt: TLabeledEdit;
    edtNr: TLabeledEdit;
    Button4: TButton;
    Imobilizado1: TMenuItem;
    Imobilizado2: TMenuItem;
    Relatrio1: TMenuItem;
    procedure Button1Click(Sender: TObject);
    procedure btnSorteioClick(Sender: TObject);
    procedure btnClassificarClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure CadastroVoluntriosDBexpress1Click(Sender: TObject);
    procedure CadVolFireDAC1Click(Sender: TObject);
    procedure QuickSort(var A: array of Integer; iLo, iHi: Integer) ;
    procedure relVoluntClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure mnuWKdbClick(Sender: TObject);
    procedure btnCalcDtClick(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Imobilizado2Click(Sender: TObject);
    procedure Relatrio1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProj1: TfrmProj1;
  numSorteio: array[1..50] of Integer;
  numSorteado: array[1..10] of string;
  numsorteadoInt: array[1..10] of Integer;

implementation

{$R *.dfm}
{$R+}

uses u_frmCad, u_frmCadDExpress, u_frmRelVolunt,
     u_frmWKdb, u_frmImob, u_frmRelImob ;


procedure TfrmProj1.QuickSort(var A: array of Integer; iLo, iHi: Integer) ;
var
   Lo, Hi, Pivot, T: Integer;
begin
   Lo := iLo;
   Hi := iHi;
   try
    Pivot := A[(Lo + Hi) div 2];
   except on e:ERangeError
    do
      showmessage(e.message);
   end;
//   Pivot := A[(Lo + Hi) div 2];
   repeat
     while A[Lo] < Pivot do Inc(Lo) ;
     while A[Hi] > Pivot do Dec(Hi) ;
     if Lo <= Hi then
     begin
       T := A[Lo];
       A[Lo] := A[Hi];
       A[Hi] := T;
       Inc(Lo) ;
       Dec(Hi) ;
     end;
   until Lo > Hi;
   if Hi > iLo then QuickSort(A, iLo, Hi) ;
   if Lo < iHi then QuickSort(A, Lo, iHi) ;
end;


procedure TfrmProj1.Relatrio1Click(Sender: TObject);
begin
  try
    if not assigned(frmRelImob) then
     frmRelImob := tfrmRelImob.Create(frmRelImob);
    frmRelImob.ShowModal;
  finally
    FreeAndNil(frmRelImob);
  end;

end;

procedure TfrmProj1.relVoluntClick(Sender: TObject);
begin
  try
    if not assigned(frmRelVolunt) then
     frmRelVolunt := tfrmRelVolunt.Create(frmRelVolunt);
    frmRelVolunt.ShowModal;
  finally
    FreeAndNil(frmRelVolunt);
  end;
end;

procedure TfrmProj1.Sair1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmProj1.btnCalcDtClick(Sender: TObject);
var
  nr: integer;
begin
  nr := Trunc(StrToInt(edtDtNr.Text));
  edtDtRes.Text := datetimetostr(nr);
end;

procedure TfrmProj1.btnClassificarClick(Sender: TObject);
var
  I: Integer;
  msg: string;
begin
// classificar o lblNumSorteado

  QuickSort(numsorteadoint, 1 , 50);

  msg:='';
  for I := 1 to 10 do
  begin
    msg:=msg + ' ' + IntToStr(numSorteadoint[i]) ;
  end;

  showmessage(msg);

end;

procedure TfrmProj1.btnSorteioClick(Sender: TObject);
var
 i, numS:integer;
 numList: string;
begin
  numList := '';

  for I := 1 to 50 do
  begin
    numsorteio[i] := i;
  end;

  for i := 1 to 10 do
    begin
      numS := (system.Math.RandomFrom(numSorteio));
      if (numS < 10)  then
        numList := '0'+inttostr(Nums)
      else if (nums >= 10) then
        numList:= IntToStr(nums);
      numsorteado[i] := numList;
      numsorteadoint[i] := numS;
      listbox1.Items.Add(numList );
    end;


   lblNSorteado.Caption := '';
   for i := 1 to 10 do
     begin
     if i = 1  then
       lblNSorteado.Caption := lblNSorteado.Caption + numsorteado[i]
     else lblNSorteado.Caption := lblNSorteado.Caption + ',' + numsorteado[i];
     end;

   listbox1.Sorted := True;

end;

procedure TfrmProj1.Button1Click(Sender: TObject);
var
  k, l, m, n: integer;
  digitos : TDigits;
  myChar : char;
begin
  digitos := ['2', '4'..'7'];

  for myChar := '7' to '8' do
    if myChar In digitos      then

  ShowMessageFmt('''%s'' ',[myChar]) ;

  k := 25;
  l := k mod 2;
  m := k mod 3;
  n:= l + m;
  ShowMessage(inttostr(l) + ',' + inttostr(m) +   ',' + inttostr(n));

end;

procedure TfrmProj1.Button2Click(Sender: TObject);
var
  numSorteado: integer;
  nPesq:ShortString;
  nPesquisa: string;
begin
// fazer pesquisa no número digitado no label
  numsorteado :=  StrToInt(edtNumsorteado.Text);

  nPesquisa:= copy(trim(edtNumsorteado.Text), 1 ,2);

//  npesq := Pos(nPesquisa, lblNSorteado);

  Label2.Caption := nPesq;


end;


procedure TfrmProj1.Button3Click(Sender: TObject);
begin
// se não encontrar mostra um apolication.message com botão de resposta
//  https//www.receitaws.com.br/v1/cnpj/33014556000196
//  edtCNPJ.Text := '33014556000196';
  edtCNPJ.Text := '04160020';
  memo1.Clear;
//  RESTClient1.BaseURL := 'https//www.receitaws.com.br/v1/cnpj/' + edtCNPJ.text;
  RESTClient1.BaseURL := 'http://viacep.com.br/ws/'+ edtCNPJ.text +'/json'  ;

  RESTClient1.SecureProtocols := [THTTPSecureProtocol.TLS12];
  RESTRequest1.Method := rmGET;
  RESTRequest1.Execute;
  Memo1.lines.add(RESTRequest1.Response.JSONText);

  if  (Application.MessageBox('CEP encontrado, coninuar a pesquisa ? ', PChar(Application.Title), MB_YESNOCANCEL
      + MB_ICONINFORMATION) = ID_YES) then
  begin

    edtCNPJ.Clear;
    edtcnpj.SetFocus;

  end;


//  if RESTRequest1.Response.Content = '' then
//  begin
//    Application.MessageBox('CEP não encontrado, favor pesquisar novamente!', PChar(Application.Title), MB_YESNOCANCEL
//      + MB_ICONINFORMATION);
//
//  end;

end;

procedure TfrmProj1.Button4Click(Sender: TObject);
var i: integer;
begin
  edtNr.Text := IntToStr(trunc(strtodatetime(edtDt.Text)));

end;

procedure TfrmProj1.CadastroVoluntriosDBexpress1Click(Sender: TObject);
begin
  try
    if not assigned(frmCadVolDBExpress) then
     frmCadVolDBExpress := tfrmCadVolDBExpress.Create(frmCadVolDBExpress);
    frmCadVolDBExpress.ShowModal;
  finally
    FreeAndNil(frmCadVolDBExpress);
  end;
end;

procedure TfrmProj1.CadVolFireDAC1Click(Sender: TObject);
begin
  try
    if not assigned(frmcad) then
     frmcad := tfrmcad.Create(frmCad);
    frmCad.ShowModal;
  finally
   FreeAndNil(frmcad);
  end;
end;

procedure TfrmProj1.FormShow(Sender: TObject);
begin
edtDt.Text := DateTimeToStr(now);
end;

procedure TfrmProj1.Imobilizado2Click(Sender: TObject);
begin
  try
  if not Assigned(frmImobilizado) then
    frmImobilizado := TfrmImobilizado.Create(Self);
    frmImobilizado.ShowModal;
  finally
    FreeAndNil(frmImobilizado);
  end;
end;

procedure TfrmProj1.mnuWKdbClick(Sender: TObject);
begin
  try
  if not Assigned(frmWKdb) then
    frmWKdb := TfrmWKdb.Create(Self);
    frmWKdb.ShowModal;
  finally
    FreeAndNil(frmWKdb);
  end;
end;

end.
