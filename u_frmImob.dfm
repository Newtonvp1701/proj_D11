object frmImobilizado: TfrmImobilizado
  Left = 0
  Top = 0
  Caption = 'Imobilizado'
  ClientHeight = 679
  ClientWidth = 1374
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object Label1: TLabel
    Left = 320
    Top = 32
    Width = 151
    Height = 15
    Caption = 'Selecionar a Casa de Ora'#231#227'o:'
  end
  object Button1: TButton
    Left = 56
    Top = 28
    Width = 217
    Height = 25
    Caption = 'Carregar CSV - Imoblizado'
    TabOrder = 0
    OnClick = Button1Click
  end
  object DBGrid1: TDBGrid
    Left = 56
    Top = 128
    Width = 1369
    Height = 513
    DataSource = dsImob
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'codigo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'descricao'
        Width = 250
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dependencia'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'bem_sim'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'bem_nao'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'localidade_atual'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'etiqueta'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'situacao'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dt_aquisicao'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'localidade'
        Width = 150
        Visible = True
      end>
  end
  object btnExportar: TButton
    Left = 704
    Top = 39
    Width = 257
    Height = 25
    Caption = 'Exportar  para Planilha'
    TabOrder = 2
    OnClick = btnExportarClick
  end
  object cbbCasaOracao: TComboBox
    Left = 320
    Top = 64
    Width = 289
    Height = 22
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = cbbCasaOracaoClick
  end
  object btnGerarExcel: TButton
    Left = 704
    Top = 80
    Width = 185
    Height = 25
    Caption = 'Gerar Planilha Excel'
    TabOrder = 4
    OnClick = btnGerarExcelClick
  end
  object QImport3Wizard1: TQImport3Wizard
    DataSet = fdtImob
    DBGrid = DBGrid1
    FileName = 'c:\db\imob.csv'
    Formats.DecimalSeparator = ','
    Formats.ThousandSeparator = '.'
    Formats.DateSeparator = '/'
    Formats.TimeSeparator = ':'
    Formats.BooleanTrue.Strings = (
      'True')
    Formats.BooleanFalse.Strings = (
      'False')
    Formats.NullValues.Strings = (
      'Null')
    Formats.ShortDateFormat = 'dd/mm/yyyy'
    Formats.LongDateFormat = 'dddd, d'#39' de '#39'mmmm'#39' de '#39'yyyy'
    Formats.ShortTimeFormat = 'hh:nn'
    Formats.LongTimeFormat = 'hh:nn:ss'
    FieldFormats = <>
    HelpFile = 'AImportWizard.hlp'
    ErrorLogFileName = 'error.log'
    AddType = qatInsert
    OnAfterImport = QImport3Wizard1AfterImport
    Left = 1200
    Top = 40
  end
  object fdtImob: TFDTable
    Active = True
    Connection = dmVolunt.connImob
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = 'imob'
    Left = 1048
    Top = 40
    object fdtImobcodigo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'codigo'
      Origin = 'codigo'
      Size = 30
    end
    object fdtImobdescricao: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'descricao'
      Origin = 'descricao'
      Size = 250
    end
    object fdtImobdependencia: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'dependencia'
      Origin = 'dependencia'
      Size = 200
    end
    object fdtImobbem_sim: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'bem_sim'
      Origin = 'bem_sim'
      Size = 10
    end
    object fdtImobbem_nao: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'bem_nao'
      Origin = 'bem_nao'
      Size = 10
    end
    object fdtImoblocalidade_atual: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'localidade_atual'
      Origin = 'localidade_atual'
      Size = 200
    end
    object fdtImobetiqueta: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'etiqueta'
      Origin = 'etiqueta'
      Size = 200
    end
    object fdtImobsituacao: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'situacao'
      Origin = 'situacao'
      Size = 200
    end
    object fdtImobdt_aquisicao: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'dt_aquisicao'
      Origin = 'dt_aquisicao'
      Size = 30
    end
    object fdtImoblocalidade: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'localidade'
      Origin = 'localidade'
      Size = 200
    end
  end
  object dsImob: TDataSource
    DataSet = qryImob
    Left = 992
    Top = 40
  end
  object QExport4XLS1: TQExport4XLS
    DataSet = qryImob
    DBGrid = DBGrid1
    About = '(About Advanced Data Export VCL)'
    _Version = '4.17.0.0'
    FileName = 'bosque.xls'
    ShowFile = True
    Formats.DecimalSeparator = ','
    Formats.ThousandSeparator = '.'
    Formats.DateSeparator = '/'
    Formats.TimeSeparator = ':'
    Formats.BooleanTrue = 'true'
    Formats.BooleanFalse = 'false'
    Formats.IntegerFormat = '#,###,##0'
    Formats.FloatFormat = '#,###,##0.00'
    Formats.DateFormat = 'dd/mm/yyyy'
    Formats.TimeFormat = 'hh:nn'
    Formats.DateTimeFormat = 'dd/mm/yyyy hh:nn:ss'
    Formats.CurrencyFormat = 'R$ #,###,##0.00'
    Options.PageFooter = 'Page &P of &N'
    Options.SheetTitle = 'Sheet 1'
    Options.CaptionsFormat.Font.Style = [xfsBold]
    Options.HyperlinkFormat.Font.Color = clrBlue
    Options.HyperlinkFormat.Font.Underline = fulSingle
    Options.NoteFormat.Alignment.Horizontal = halLeft
    Options.NoteFormat.Alignment.Vertical = valTop
    Options.NoteFormat.Font.Size = 8
    Options.NoteFormat.Font.Style = [xfsBold]
    Options.NoteFormat.Font.Name = 'Tahoma'
    FieldFormats = <>
    StripStyles = <>
    Hyperlinks = <>
    Notes = <>
    Charts = <>
    Sheets = <>
    Pictures = <>
    Images = <>
    Cells = <>
    Aggregates = <>
    MergedCells = <>
    Left = 1304
    Top = 40
  end
  object qryImob: TFDQuery
    Active = True
    Connection = dmVolunt.connImob
    SQL.Strings = (
      'select * from imob '
      '')
    Left = 1112
    Top = 40
    object qryImobcodigo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'codigo'
      Origin = 'codigo'
      Size = 30
    end
    object qryImobdescricao: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'descricao'
      Origin = 'descricao'
      Size = 250
    end
    object qryImobdependencia: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'dependencia'
      Origin = 'dependencia'
      Size = 200
    end
    object qryImobbem_sim: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'bem_sim'
      Origin = 'bem_sim'
      Size = 10
    end
    object qryImobbem_nao: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'bem_nao'
      Origin = 'bem_nao'
      Size = 10
    end
    object qryImoblocalidade_atual: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'localidade_atual'
      Origin = 'localidade_atual'
      Size = 200
    end
    object qryImobetiqueta: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'etiqueta'
      Origin = 'etiqueta'
      Size = 200
    end
    object qryImobsituacao: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'situacao'
      Origin = 'situacao'
      Size = 200
    end
    object qryImobdt_aquisicao: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'dt_aquisicao'
      Origin = 'dt_aquisicao'
      Size = 30
    end
    object qryImoblocalidade: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'localidade'
      Origin = 'localidade'
      Size = 200
    end
  end
end
