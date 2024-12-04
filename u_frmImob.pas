unit u_frmImob;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Data.DB,
  Vcl.DBGrids, QImport3Wizard, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, QExport4, QExport4XLS,
  Excel2000, ComObj;


type

  TStringArray = class(TStrings)
  private
    Fcodigo: string;
    FNome : string;
  end;

  TfrmImobilizado = class(TForm)
    Button1: TButton;
    QImport3Wizard1: TQImport3Wizard;
    fdtImob: TFDTable;
    dsImob: TDataSource;
    DBGrid1: TDBGrid;
    QExport4XLS1: TQExport4XLS;
    btnExportar: TButton;
    cbbCasaOracao: TComboBox;
    qryImob: TFDQuery;
    qryImobcodigo: TStringField;
    qryImobdescricao: TStringField;
    qryImobdependencia: TStringField;
    qryImobbem_sim: TStringField;
    qryImobbem_nao: TStringField;
    qryImoblocalidade_atual: TStringField;
    qryImobetiqueta: TStringField;
    qryImobsituacao: TStringField;
    qryImobdt_aquisicao: TStringField;
    qryImoblocalidade: TStringField;
    fdtImobcodigo: TStringField;
    fdtImobdescricao: TStringField;
    fdtImobdependencia: TStringField;
    fdtImobbem_sim: TStringField;
    fdtImobbem_nao: TStringField;
    fdtImoblocalidade_atual: TStringField;
    fdtImobetiqueta: TStringField;
    fdtImobsituacao: TStringField;
    fdtImobdt_aquisicao: TStringField;
    fdtImoblocalidade: TStringField;
    Label1: TLabel;
    btnGerarExcel: TButton;

    procedure Button1Click(Sender: TObject);
    function LerCSVParaTabela(NomeArquivo: string; Tabela: TStringGrid): Boolean;
    procedure FormCreate(Sender: TObject);
    procedure QImport3Wizard1AfterImport(Sender: TObject);
    procedure btnExportarClick(Sender: TObject);
    procedure cbbCasaOracaoClick(Sender: TObject);
    procedure btnGerarExcelClick(Sender: TObject);
    procedure GerarExcel(Consulta: TFDQuery);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  frmImobilizado: TfrmImobilizado;
  Colunas: array[1..78] of String = ('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z',
  'AA','AB','AC','AD','AE','AF','AG','AH','AI','AJ','AK','AL','AM','AN','AO','AP','AQ','AR','AS','AT','AU','AV','AW','AX','AY','AZ',
  'BA','BB','BC','BD','BE','BF','BG','BH','BI','BJ','BK','BL','BM','BN','BO','BP','BQ','BR','BS','BT','BU','BV','BW','BX','BY','BZ');

implementation

uses
  UCSVReader, dm;

{$R *.dfm}

procedure TfrmImobilizado.FormCreate(Sender: TObject);
var
TStringArray:array[0..3] of string;
_qrya: TFDQuery;
begin

//   TStringArray[0] :='codigo';
//   TStringArray[1] :='nome';
//   TStringArray[2] :='fornecedor';
//   TStringArray[3] :='localidade';

  //select * from imob where substr(codigo, 1 ,7) = '21-0007'
  //order by dependencia, codigo;

//  _qrya:=TFDQuery.Create(nil);
//  with _qrya do
//  Begin
//    Close;
//    Connection := dmVolunt.connImob;
//    sql.Clear;
//    sql.Add(' select * from imob where substr(codigo, 1 ,7) = ''21-0007'' ');
//    sql.Add(' order by dependencia, codigo' );
//    Open;
//    First;
//
//  End;


//cbbCasaOracao

  _qrya:=TFDQuery.Create(nil);
  with _qrya do
  Begin
  try
    Close;
    Connection := dmVolunt.connImob;
    sql.Clear;
    sql.Add('select codigo, nome from casaOracao order by nome ');
    Open;
    First;
    if not IsEmpty then
    begin
      cbbCasaOracao.Items.Clear;
      cbbCasaOracao.Items.Add('TODAS');
      while not Eof do
      begin
        cbbCasaOracao.Items.Add(''+Trim(fieldbyname('codigo').AsString) + ' - ' + FieldByName('nome').AsString);
        Next;
      end;
      cbbCasaOracao.ItemIndex := 0;
    end;
  finally
    FreeAndNil(_qrya);
  end;

  End;



end;

function  TfrmImobilizado.LerCSVParaTabela(NomeArquivo: string; Tabela: TStringGrid): Boolean;
var
  Arquivo: TextFile;
  Linha, Campo: string;
  Campos: TStringArray;
  I: Integer;
begin


  Result := False;
  AssignFile(Arquivo, NomeArquivo);
  try
    Reset(Arquivo);
    Tabela.RowCount := 1; // Limpa a tabela
    while not EOF(Arquivo) do
    begin
      ReadLn(Arquivo, Linha);
//      Campos := Split(Linha, ','); // Ajustar o delimitador se necessário
//      Tabela.RowCount := Tabela.RowCount + 1;
//      for I := 0 to High(Campos) do
//        Tabela.Cells[I, Tabela.RowCount - 1] := Campos[I];
    end;
    Result := True;
  finally
    CloseFile(Arquivo);
  end;
end;


procedure TfrmImobilizado.QImport3Wizard1AfterImport(Sender: TObject);
begin
  fdtImob.Close;
  dmVolunt.connImob.Connected := False;
  dmVolunt.connImob.Connected := True;
  fdtImob.Open;
end;

procedure TfrmImobilizado.btnExportarClick(Sender: TObject);
begin

  QExport4XLS1.Execute;

end;

procedure TfrmImobilizado.Button1Click(Sender: TObject);
//var
//  CSVReader: TCSVReader;
//  Registro: TCSVRecord;
//  Record: TCSVRecord;
begin
//  CSVReader := TCSVReader.Create('meu_arquivo.csv');
//  if CSVReader.ReadCSV then
//  begin
//    for i := 0 to CSVReader.FCSVData.Count - 1 do
//    begin
//      Record := CSVReader.GetRecord(i);
//      // Utilize os dados da estrutura Record
//      ShowMessage(Format('Campo1: %s, Campo2: %d', [Record.Campo1, Record.Campo2]));
//    end;
//  end;
//  FreeAndNil(CSVReader);


//  LerCSVParaTabela('meu_arquivo.csv', StringGrid1);
//  LerCSVParaTabela('c:\db\novo.txt', StringGrid1);


  QImport3Wizard1.Execute;


end;

procedure TfrmImobilizado.btnGerarExcelClick(Sender: TObject);
var
  coluna, linha: integer;
  Excel, Sheet: variant;
  ColumnRange: OleVariant;
  cNome, valor: string;
  i, nr_2: Integer;
  _qryCasaOracao: TFDQuery;
begin


  if Trim(copy(cbbCasaOracao.Text,1,5)) = 'TODAS'  then
  begin
    try
      begin
        _qryCasaOracao := TFDQuery.Create(nil);
        with _qryCasaOracao do
        begin
          Close;
          Connection := dmVolunt.connImob;
          sql.Clear;
          sql.Add('select distinct substr(a.localidade,4,7) codigo , b.nome ');
          sql.Add('from imob a inner join casaoracao b on b.codigo = a.localidade ');
          sql.Add('order by b.nome ');
          Open;
          First;
          if IsEmpty then
            Exit
          else if not IsEmpty then
          begin
            while not _qryCasaOracao.eof do
            begin

              cNome:= ExtractFilePath(Application.ExeName) ;

              try
                excel := CreateOleObject('Excel.Application');
                excel.Workbooks.add(1);
              except
                Application.MessageBox('Versão do Ms-Excel' + 'Incompatível', 'Erro', MB_OK + MB_ICONEXCLAMATION);
              end;

              Excel.visible := False;
              Excel.DisplayAlerts := False;
              Excel.Workbooks[1].WorkSheets[1].Name := Trim(FieldByName('codigo').AsString) ;//Trim(copy(cbbCasaOracao.Text,4,8));
              cNome:= cNome + Trim(FieldByName('codigo').AsString) + ' - ' + trim(FieldByName('nome').AsString);

              Sheet := Excel.Workbooks[1].WorkSheets[1];

              Sheet.Range['A1'] := 'CONGREGAÇÃO CRISTÃ NO BRASIL';
              Sheet.Range['A1'].Font.Bold := True;
              Sheet.Range['A1'].HorizontalAlignment := 3;
              Sheet.Range['A1'].Font.Size := 14;

              Sheet.Range['C1'] := 'CASA DE ORAÇÃO: ' + Trim(FieldByName('codigo').AsString) + ' - ' + trim(FieldByName('nome').AsString);
//               Trim(copy(cbbCasaOracao.Text,4,8)) + ' - ' + copy(cbbCasaOracao.Text,14,50);

              Sheet.range['a2'] := 'Código do Bem';
              Sheet.range['b2'] := 'Descrição do Bem';
              Sheet.range['c2'] := 'Dependência';
              Sheet.range['d2'] := 'Bem foi encontrado';
              Sheet.range['e2'] := '';
              Sheet.range['f2'] := 'Localização Atual';
              Sheet.range['g2'] := 'Etiqueta';
              Sheet.range['h2'] := 'Observação';
              Sheet.Range['d3'] := 'Sim';
              Sheet.Range['e3'] := 'Não';

              Sheet.Pagesetup.RightFooter := '&P de &N';
              Sheet.Pagesetup.LeftFooter := '&D  &T';
              Sheet.PageSetup.PrintTitleRows := '$1:$3';
              Sheet.PageSetup.Orientation    := xlLandscape;


              Sheet.PageSetup.LeftMargin := 0.5;
              Sheet.PageSetup.RightMargin := 0.5;

              Sheet.Columns[1].ColumnWidth := 12.5;
              Sheet.Columns[2].ColumnWidth := 58.43;
              Sheet.Columns[3].ColumnWidth := 18;
              Sheet.Columns[4].ColumnWidth := 8;
              Sheet.Columns[5].ColumnWidth := 8;
              Sheet.Columns[6].ColumnWidth := 12.5;
              Sheet.Columns[7].ColumnWidth := 6.5;
              Sheet.Columns[8].ColumnWidth := 10.20;

              Sheet.Rows[1].RowHeight := 35; //sets Row 1 height

              Sheet.Range['a1:b1'].Mergecells := True;
              Sheet.Range['a1:b1'].HorizontalAlignment := -4108;
              Sheet.Range['a1:b1'].VerticalAlignment := 2;

              sheet.range['c1:f1'].MergeCells := True;
              Sheet.Range['c1:f1'].HorizontalAlignment := -4108; //xlCenter;
              Sheet.Range['c1:f1'].VerticalAlignment := 2; //xlCenter;

              Sheet.Range['a2:a3'].Mergecells := True;
              Sheet.Range['a2:a3'].HorizontalAlignment := -4108; //xlCenter;
              Sheet.Range['a2:a3'].VerticalAlignment := 2; //xlCenter;
              Sheet.Range['a2:a3'].Interior.color := clYellow;
              Sheet.Range['a2:a3'].borders.linestyle := 1;
              Sheet.Range['a2:a3'].Borders.Weight := 2;

              Sheet.Range['b2:b3'].Mergecells := True;
              Sheet.Range['b2:b3'].HorizontalAlignment := -4108;
              Sheet.Range['b2:b3'].VerticalAlignment := 2;
              Sheet.Range['b2:b3'].Interior.color := clYellow;
              Sheet.Range['b2:b3'].borders.linestyle := 1;
              Sheet.Range['b2:b3'].Borders.Weight := 2;

              Sheet.Range['c2:c3'].Mergecells := True;
              Sheet.Range['c2:c3'].HorizontalAlignment := -4108;
              Sheet.Range['c2:c3'].VerticalAlignment := 2;
              Sheet.Range['c2:c3'].Interior.color := clYellow;
              Sheet.Range['c2:c3'].borders.linestyle := 1;
              Sheet.Range['c2:c3'].Borders.Weight := 2;

              Sheet.Range['d2:e2'].Mergecells := True;
              Sheet.Range['d2:e2'].HorizontalAlignment := -4108;
              Sheet.Range['d2:e2'].VerticalAlignment := 2;
              Sheet.Range['d2:e2'].Interior.color := clYellow;
              Sheet.Range['d2:e2'].borders.linestyle := 1;
              Sheet.Range['d2:e2'].Borders.Weight := 2;

              Sheet.Range['d3:e3'].Interior.color := clYellow;
              Sheet.Range['d3:d3'].borders.linestyle := 1;
              Sheet.Range['d3:d3'].Borders.Weight := 2;
              Sheet.Range['e3:e3'].borders.linestyle := 1;
              Sheet.Range['e3:e3'].Borders.Weight := 2;

              Sheet.Range['d3:e3'].HorizontalAlignment := -4108;
              Sheet.Range['d3:e3'].VerticalAlignment := 2;

              Sheet.Range['f2:f3'].Mergecells := True;
              Sheet.Range['f2:f3'].HorizontalAlignment := -4108;
              Sheet.Range['f2:f3'].VerticalAlignment := 2;
              Sheet.Range['f2:f3'].Interior.color := clYellow;
              Sheet.Range['f2:f3'].borders.linestyle := 1;
              Sheet.Range['f2:f3'].Borders.Weight := 2;

              Sheet.Range['g2:g3'].Mergecells := True;
              Sheet.Range['g2:g3'].HorizontalAlignment := -4108;
              Sheet.Range['g2:g3'].VerticalAlignment := 2;
              Sheet.Range['g2:g3'].Interior.color := clYellow;
              Sheet.Range['g2:g3'].borders.linestyle := 1;
              Sheet.Range['g2:g3'].Borders.Weight := 2;

              Sheet.Range['h2:h3'].Mergecells := True;
              Sheet.Range['h2:h3'].HorizontalAlignment := -4108;
              Sheet.Range['h2:h3'].VerticalAlignment := 2;
              Sheet.Range['h2:h3'].Interior.color := clYellow;
              Sheet.Range['h2:h3'].borders.linestyle := 1;
              Sheet.Range['h2:h3'].Borders.Weight := 2;

              with qryImob do
              begin
                Close;
                Connection := dmVolunt.connImob;
                sql.Clear;
                sql.Add(' select * from imob where substr(codigo, 1 ,7) =:pCodigo ');
                sql.add(' order by localidade, dependencia, codigo ');
                ParamByName('pcodigo').AsString := Trim(_qryCasaOracao.FieldByName('codigo').AsString); //Trim(copy(cbbCasaOracao.Text,4,8));
                Open;
                First;
                DBGrid1.Refresh;
              end;

              qryImob.First;

              nr_2 := 1;

              try
                i:= 4;
                with qryImob do
                begin
                while not qryImob.eof do
                  begin
//                    Sheet.Range['A' + IntToStr(I)] := FieldByName('codigo').AsString;
//                    Sheet.Range['B' + IntToStr(I)] := FieldByName('descricao').AsString;
//                    Sheet.Range['C' + IntToStr(I)] := FieldByName('dependencia').AsString;
//                    Sheet.Range['A'+ IntToStr(I) + ':' + 'H'+ IntToStr(i)].Borders.LineStyle := 1;
//                    Sheet.Range['A'+ IntToStr(I) + ':' + 'H'+ IntToStr(i)].Borders.Weight := 2;

                    Sheet.Range['A' + IntToStr(I)] := FieldByName('codigo').AsString;
                    Sheet.Range['A' + IntToStr(I)].HorizontalAlignment := -4108;
                    Sheet.Range['A' + IntToStr(I)].VerticalAlignment := 2;

                    Sheet.Range['B' + IntToStr(I)] := FieldByName('descricao').AsString;
                    Sheet.Range['B' + IntToStr(I)].HorizontalAlignment := -4108;
                    Sheet.Range['B' + IntToStr(I)].VerticalAlignment := 2;

                    Sheet.Range['C' + IntToStr(I)] := FieldByName('dependencia').AsString;
                    Sheet.Range['C' + IntToStr(I)].HorizontalAlignment := -4108;
                    Sheet.Range['C' + IntToStr(I)].VerticalAlignment := 2;

                    Sheet.Range['A'+ IntToStr(I) + ':' + 'H'+ IntToStr(i)].Borders.LineStyle := 1;
                    Sheet.Range['A'+ IntToStr(I) + ':' + 'H'+ IntToStr(i)].Borders.Weight := 2;
                    Sheet.Rows[I].RowHeight := 24; //sets Row 1 height


                    inc(i);
                    Next;
                  end;
                end;

                nr_2:= i + 20;

                while i <= nr_2 do
                begin
                    Sheet.Range['A'+ IntToStr(I) + ':' + 'H'+ IntToStr(i)].Borders.LineStyle := 1;
                    Sheet.Range['A'+ IntToStr(I) + ':' + 'H'+ IntToStr(i)].Borders.Weight := 2;
                    Sheet.Rows[I].RowHeight := 24; //sets Row 1 height
                    inc(i);
                end;

                Sheet.Range['a2:h'+IntToStr(i)].Font.Name := 'Tahoma';
                Sheet.Range['a2:h'+IntToStr(i)].Font.Size := 7;

                Excel.ActiveWindow.DisplayGridlines := True;

            //    Sheet.columns.autofit;
                excel.ActiveWorkbook.SaveAs(cNome + '.xlsx'); //, xlnormal, , , False, false);
            //    excel.workbooks.disconnect;
            //    excel.application.disconnect;
                excel.quit;
//                excel := unassigned;

              except
                on e: exception do
                begin
                    Application.MessageBox(PChar('Aconteceu um erro durante a conversão da tabela para o MS-Excel. Erro: ' + E.Message), 'Erro', MB_OK + MB_ICONEXCLAMATION);
            //        Excel.WorkBooks.Disconnect;
            //        Excel.Application.Disconnect;

                end;


              end;

              excel.quit;
              Excel := Unassigned;

              _qryCasaOracao.Next;

            end;
          end;


        end;
      end;
    finally
      FreeAndNil(_qryCasaOracao);
    end;

  end else if Trim(copy(cbbCasaOracao.Text,1,5)) <> 'TODAS' then
  begin

    cNome:= ExtractFilePath(Application.ExeName) ;

    try
      excel := CreateOleObject('Excel.Application');
      excel.Workbooks.add(1);
    except
      Application.MessageBox('Versão do Ms-Excel' + 'Incompatível', 'Erro', MB_OK + MB_ICONEXCLAMATION);
    end;

    Excel.visible := False;
    Excel.DisplayAlerts := False;
    Excel.Workbooks[1].WorkSheets[1].Name := Trim(copy(cbbCasaOracao.Text,4,8)); //AnsiUpperCase(Copy(sNome,0,1))+AnsiLowerCase(Copy(sNome,2,Length(sNome)));
    cNome:= cNome + Trim(copy(cbbCasaOracao.Text,4,8)) + ' - ' + trim(copy(cbbCasaOracao.Text,15,50));
    Sheet := Excel.Workbooks[1].WorkSheets[1];

    Sheet.Range['A1'] := 'CONGREGAÇÃO CRISTÃ NO BRASIL';
    Sheet.Range['A1'].Font.Bold := True;
    Sheet.Range['A1'].HorizontalAlignment := 3;
    Sheet.Range['A1'].Font.Size := 14;
  //  Sheet.Range['G1'] := datetimetostr(now());

    Sheet.Range['C1'] := 'CASA DE ORAÇÃO: ' + Trim(copy(cbbCasaOracao.Text,4,8)) + ' - ' + copy(cbbCasaOracao.Text,15,50);

    Sheet.range['a2'] := 'Código do Bem';
    Sheet.range['b2'] := 'Descrição do Bem';
    Sheet.range['c2'] := 'Dependência';
    Sheet.range['d2'] := 'Bem foi encontrado';
    Sheet.range['e2'] := '';
    Sheet.range['f2'] := 'Localização Atual';
    Sheet.range['g2'] := 'Etiqueta';
    Sheet.range['h2'] := 'Observação';
    Sheet.Range['d3'] := 'Sim';
    Sheet.Range['e3'] := 'Não';

    Sheet.Pagesetup.RightFooter := '&P de &N';
    Sheet.Pagesetup.LeftFooter := '&D  &T';
    Sheet.PageSetup.PrintTitleRows := '$1:$3';
    Sheet.PageSetup.Orientation    := xlLandscape;

    Sheet.PageSetup.LeftMargin := 0.5;
    Sheet.PageSetup.RightMargin := 0.5;

    Sheet.Columns[1].ColumnWidth := 12.5;
    Sheet.Columns[2].ColumnWidth := 58.43;
    Sheet.Columns[3].ColumnWidth := 18;
    Sheet.Columns[4].ColumnWidth := 8;
    Sheet.Columns[5].ColumnWidth := 8;
    Sheet.Columns[6].ColumnWidth := 12.5;
    Sheet.Columns[7].ColumnWidth := 6.5;
    Sheet.Columns[8].ColumnWidth := 10.20;

    Sheet.Rows[1].RowHeight := 35; //sets Row 1 height

    Sheet.Range['a1:b1'].Mergecells := True;
    Sheet.Range['a1:b1'].HorizontalAlignment := -4108;
    Sheet.Range['a1:b1'].VerticalAlignment := 2;

    sheet.range['c1:f1'].MergeCells := True;
    Sheet.Range['c1:f1'].HorizontalAlignment := -4108; //xlCenter;
    Sheet.Range['c1:f1'].VerticalAlignment := 2; //xlCenter;

    Sheet.Range['a2:a3'].Mergecells := True;
    Sheet.Range['a2:a3'].HorizontalAlignment := -4108; //xlCenter;
    Sheet.Range['a2:a3'].VerticalAlignment := 2; //xlCenter;
    Sheet.Range['a2:a3'].Interior.color := clYellow;
    Sheet.Range['a2:a3'].borders.linestyle := 1;
    Sheet.Range['a2:a3'].Borders.Weight := 2;

    Sheet.Range['b2:b3'].Mergecells := True;
    Sheet.Range['b2:b3'].HorizontalAlignment := -4108;
    Sheet.Range['b2:b3'].VerticalAlignment := 2;
    Sheet.Range['b2:b3'].Interior.color := clYellow;
    Sheet.Range['b2:b3'].borders.linestyle := 1;
    Sheet.Range['b2:b3'].Borders.Weight := 2;

    Sheet.Range['c2:c3'].Mergecells := True;
    Sheet.Range['c2:c3'].HorizontalAlignment := -4108;
    Sheet.Range['c2:c3'].VerticalAlignment := 2;
    Sheet.Range['c2:c3'].Interior.color := clYellow;
    Sheet.Range['c2:c3'].borders.linestyle := 1;
    Sheet.Range['c2:c3'].Borders.Weight := 2;

    Sheet.Range['d2:e2'].Mergecells := True;
    Sheet.Range['d2:e2'].HorizontalAlignment := -4108;
    Sheet.Range['d2:e2'].VerticalAlignment := 2;
    Sheet.Range['d2:e2'].Interior.color := clYellow;
    Sheet.Range['d2:e2'].borders.linestyle := 1;
    Sheet.Range['d2:e2'].Borders.Weight := 2;

    Sheet.Range['d3:e3'].Interior.color := clYellow;
    Sheet.Range['d3:d3'].borders.linestyle := 1;
    Sheet.Range['d3:d3'].Borders.Weight := 2;
    Sheet.Range['e3:e3'].borders.linestyle := 1;
    Sheet.Range['e3:e3'].Borders.Weight := 2;

    Sheet.Range['d3:e3'].HorizontalAlignment := -4108;
    Sheet.Range['d3:e3'].VerticalAlignment := 2;

    Sheet.Range['f2:f3'].Mergecells := True;
    Sheet.Range['f2:f3'].HorizontalAlignment := -4108;
    Sheet.Range['f2:f3'].VerticalAlignment := 2;
    Sheet.Range['f2:f3'].Interior.color := clYellow;
    Sheet.Range['f2:f3'].borders.linestyle := 1;
    Sheet.Range['f2:f3'].Borders.Weight := 2;

    Sheet.Range['g2:g3'].Mergecells := True;
    Sheet.Range['g2:g3'].HorizontalAlignment := -4108;
    Sheet.Range['g2:g3'].VerticalAlignment := 2;
    Sheet.Range['g2:g3'].Interior.color := clYellow;
    Sheet.Range['g2:g3'].borders.linestyle := 1;
    Sheet.Range['g2:g3'].Borders.Weight := 2;

    Sheet.Range['h2:h3'].Mergecells := True;
    Sheet.Range['h2:h3'].HorizontalAlignment := -4108;
    Sheet.Range['h2:h3'].VerticalAlignment := 2;
    Sheet.Range['h2:h3'].Interior.color := clYellow;
    Sheet.Range['h2:h3'].borders.linestyle := 1;
    Sheet.Range['h2:h3'].Borders.Weight := 2;


    qryImob.First;

    nr_2 := 1;
    try
      i:= 4;
      with qryImob do
      begin
      while not qryImob.eof do
        begin
          Sheet.Range['A' + IntToStr(I)] := FieldByName('codigo').AsString;
          Sheet.Range['A' + IntToStr(I)].HorizontalAlignment := -4108;
          Sheet.Range['A' + IntToStr(I)].VerticalAlignment := 2;

          Sheet.Range['B' + IntToStr(I)] := FieldByName('descricao').AsString;
          Sheet.Range['B' + IntToStr(I)].HorizontalAlignment := -4108;
          Sheet.Range['B' + IntToStr(I)].VerticalAlignment := 2;

          Sheet.Range['C' + IntToStr(I)] := FieldByName('dependencia').AsString;
          Sheet.Range['C' + IntToStr(I)].HorizontalAlignment := -4108;
          Sheet.Range['C' + IntToStr(I)].VerticalAlignment := 2;

          Sheet.Range['A'+ IntToStr(I) + ':' + 'H'+ IntToStr(i)].Borders.LineStyle := 1;
          Sheet.Range['A'+ IntToStr(I) + ':' + 'H'+ IntToStr(i)].Borders.Weight := 2;
          Sheet.Rows[I].RowHeight := 24; //sets Row 1 height
          inc(i);
          Next;
        end;
      end;

      nr_2:= i + 20;

      while i <= nr_2 do
      begin
          Sheet.Range['A'+ IntToStr(I) + ':' + 'H'+ IntToStr(i)].Borders.LineStyle := 1;
          Sheet.Range['A'+ IntToStr(I) + ':' + 'H'+ IntToStr(i)].Borders.Weight := 2;
          Sheet.Rows[I].RowHeight := 24; //sets Row 1 height
          inc(i);
      end;

      Sheet.Range['a2:h'+IntToStr(i)].Font.Name := 'Tahoma';
      Sheet.Range['a2:h'+IntToStr(i)].Font.Size := 7;

      Excel.ActiveWindow.DisplayGridlines := True;

  //    Sheet.columns.autofit;
      excel.ActiveWorkbook.SaveAs(cNome + '.xlsx'); //, xlnormal, , , False, false);
//      excel.workbooks.disconnect;
//      excel.application.disconnect;
      excel.quit;
//      excel := unassigned;

    except
      on e: exception do
      begin
          Application.MessageBox(PChar('Aconteceu um erro durante a conversão da tabela para o MS-Excel. Erro: ' + E.Message), 'Erro', MB_OK + MB_ICONEXCLAMATION);
  //        Excel.WorkBooks.Disconnect;
  //        Excel.Application.Disconnect;
      end;

    end;

    excel.quit;
    Excel := Unassigned;

    ShowMessage('Planilha gerada !');

  end;


//  ShowMessage('Planilha gerada !');

end;

procedure TfrmImobilizado.cbbCasaOracaoClick(Sender: TObject);
var _qrya: TFDQuery;
begin
  if cbbCasaOracao.Text <> 'TODAS' then
    ShowMessage(copy(cbbCasaOracao.Text,4,8) + ' | ' + copy(cbbCasaOracao.Text,13,50))
  else if (cbbCasaOracao.Text = 'TODAS') then
    ShowMessage(copy(cbbCasaOracao.Text,1,5));

  _qrya:= TFDQuery.Create(nil);
  try
    with qryImob do
    begin
      Close;
      Connection := dmVolunt.connImob;
      sql.Clear;
      if cbbCasaOracao.Text <> 'TODAS' then
      begin
        sql.Add(' select * from imob where substr(codigo, 1 ,7) =:pCodigo ');
        sql.add(' order by localidade, dependencia, codigo ');
        ParamByName('pcodigo').AsString := Trim(copy(cbbCasaOracao.Text,4,8));
      end
      else if (cbbCasaOracao.Text = 'TODAS') then
      begin
        sql.Add(' select * from imob ');
        sql.add(' where codigo <> '''' ');
        sql.add(' order by localidade ,dependencia, codigo ');
      end;
      Open;
      First;
      DBGrid1.Refresh;

    end;
  finally
    FreeAndNil(_qrya);
  end;

  QExport4XLS1.FileName := '';


end;


procedure TfrmImobilizado.GerarExcel(Consulta: TFDQuery);
var
  coluna, linha: integer;
  excel: variant;
  valor: string;
  _FieldCount: Integer;
begin
  try
    excel:=CreateOleObject('Excel.Application');
    excel.Workbooks.add(1);
  except
    Application.MessageBox ('Versão do Ms-Excel'+ 'Incompatível','Erro',MB_OK+MB_ICONEXCLAMATION);
  end;

  Consulta.First;
  try
        for linha:=1 to Consulta.RecordCount do
        begin
            for coluna:=3 to Consulta.FieldCount do // eliminei a coluna 0 da relação do Excel
            begin
                 if ((Consulta.Fields[coluna-1].FieldName = 'C. MEDIO') or (Consulta.Fields[coluna-1].FieldName = 'C. UNIT')) then
                 begin
                   excel.cells [linha+2,coluna-2].NumberFormat := 'R$ #.0,0000_)';
                   Valor := FormatFloat('R$ 0.0000', Consulta.Fields[coluna-1].AsFloat);
                 end
                 else
                   valor:= Consulta.Fields[coluna-1].AsString;
                 excel.cells [linha+2,coluna-2]:=valor;
                 excel.Range['A'+IntToStr(Linha+2),'P'+IntToSTr(Linha+2)].Interior.Color := clSilver;
                 excel.Range['A'+IntToStr(Linha+2),'P'+IntToSTr(Linha+2)].Borders.LineStyle := 1;
                 excel.Range['A'+IntToStr(Linha+2),'P'+IntToSTr(Linha+2)].Borders.Weight := 2;
                 excel.Range['A'+IntToStr(Linha+2),'P'+IntToSTr(Linha+2)].Borders.ColorIndex := 2;
            end;
            Consulta.Next;
        end;
        excel.Range['A1',Colunas[Consulta.Fields.Count-2]+'1'].Interior.Color := clSilver;
        excel.Range['A1',Colunas[Consulta.Fields.Count-2]+'1'].Mergecells := True;
        excel.Range['A1',Colunas[Consulta.Fields.Count-2]+'1'].font.bold := true;
        excel.Range['A1',Colunas[Consulta.Fields.Count-2]+'1'].HorizontalAlignment := 3;
        excel.Range['A1',Colunas[Consulta.Fields.Count-2]+'1'].Borders.LineStyle := 1;
        excel.Range['A1',Colunas[Consulta.Fields.Count-2]+'1'].Borders.Weight := 2;
        excel.Range['A1',Colunas[Consulta.Fields.Count-2]+'1'].Borders.ColorIndex := 2;

        excel.cells[1,1]:='PRODUTOS';

        excel.Range['A2',Colunas[Consulta.Fields.Count-2]+'2'].Interior.Color := $00ffcf9c;
        excel.Range['A2',Colunas[Consulta.Fields.Count-2]+'2'].font.bold := true; { Adecio Chamado 11196 }
        excel.Range['A2',Colunas[Consulta.Fields.Count-2]+'2'].Borders.LineStyle := 1;
        excel.Range['A2',Colunas[Consulta.Fields.Count-2]+'2'].Borders.Weight := 2;
        excel.Range['A2',Colunas[Consulta.Fields.Count-2]+'2'].Borders.ColorIndex := 2;
        excel.Range['A2',Colunas[Consulta.Fields.Count-2]+'2'].HorizontalAlignment := 3;

        linha:= 1;
        for coluna:=3 to Consulta.FieldCount do // eliminei a coluna 0 da relação do Excel
        begin
             valor:= Trim(StringReplace(Consulta.Fields[coluna-1].DisplayLabel, '_', ' ', [rfReplaceAll]));
             excel.cells[2,coluna-2]:=UpperCase(valor);
             //excel.Range['A'+IntToStr(Linha+2),Colunas[Consulta.Fields.Count]+IntToSTr(Linha+2)].Interior.Color := clSilver;
             excel.Range['A'+IntToStr(Linha),Colunas[Consulta.Fields.Count-2]+IntToStr(Linha)].Borders.LineStyle := 1;
             excel.Range['A'+IntToStr(Linha),Colunas[Consulta.Fields.Count-2]+IntToStr(Linha)].Borders.Weight := 2;
             excel.Range['A'+IntToStr(Linha),Colunas[Consulta.Fields.Count-2]+IntToStr(Linha)].Borders.ColorIndex := 2;
        end;
        excel.Range['A2',Colunas[Consulta.Fields.Count-2]+IntToStr(Consulta.RecordCount + 2)].AutoFilter();
        excel.columns.AutoFit; // esta linha é para fazer com que o Excel dimencione as células adequadamente.
        excel.visible:=true;
     except
          Application.MessageBox ('Aconteceu um erro desconhecido durante a conversão'+
          'da tabela para o Ms-Excel','Erro',MB_OK+MB_ICONEXCLAMATION);
     end;
end;



end.
