unit UCSVReader;

interface

uses
  SysUtils, Classes;

type
  TCSVRecord = record
    // Defina aqui os campos que correspondem às colunas do seu arquivo CSV
    Campo1: string;
    Campo2: Integer;
    // ... outros campos
  end;

  TCSVReader = class
  private
    FDelimiter: Char;
    FFileName: string;
    FCSVData: TStringList;
  public
    constructor Create(const AFileName: string; const ADelimiter: Char = ';');
    destructor Destroy; override;
    function ReadCSV: Boolean;
    function GetRecord(Index: Integer): TCSVRecord;
  end;

implementation

constructor TCSVReader.Create(const AFileName: string; const ADelimiter: Char = ';');
begin
  FFileName := AFileName;
  FDelimiter := ADelimiter;
  FCSVData := TStringList.Create;
end;

destructor TCSVReader.Destroy;
begin
  FreeAndNil(FCSVData);
  inherited;
end;

function TCSVReader.ReadCSV: Boolean;
var
  CSVFile: TextFile;
begin
  Result := False;
  try
    AssignFile(CSVFile, FFileName);
    Reset(CSVFile);
    while not EOF(CSVFile) do
    begin
//      ReadLn(CSVFile, FCSVData[FCSVData.Count]);
    end;
    CloseFile(CSVFile);
    Result := True;
  except
    on E: Exception do
    begin
      // Tratar exceções, como arquivo não encontrado, etc.
//      ShowMessage(E.Message);
    end;
  end;
end;

function TCSVReader.GetRecord(Index: Integer): TCSVRecord;
var
  RecordParts: TStringList;
begin
  if (Index >= 0) and (Index < FCSVData.Count) then
  begin
    RecordParts := TStringList.Create;
    try
      RecordParts.DelimitedText := FCSVData[Index];
      RecordParts.Delimiter := FDelimiter;

      // Preencha os campos da estrutura TCSVRecord com os valores de RecordParts
      Result.Campo1 := RecordParts[0];
      Result.Campo2 := StrToInt(RecordParts[1]);
      // ... outros campos
    finally
      FreeAndNil(RecordParts);
    end;
  end else
  begin
    // Índice inválido
    // ... tratar o erro
  end;
end;

end.
