object frmCad: TfrmCad
  Left = 0
  Top = 0
  Caption = 'frmCad'
  ClientHeight = 756
  ClientWidth = 1217
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object DBGrid1: TDBGrid
    Left = 32
    Top = 143
    Width = 993
    Height = 209
    DataSource = dsVolunt
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnCellClick = DBGrid1CellClick
    Columns = <
      item
        Expanded = False
        FieldName = 'ID_VOLUNT'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_LIMPEZA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_MANUT'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CPF'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ENDERECO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BAIRRO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DTNASC'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CELULAR'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RES'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'C1'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'C2'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'C3'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'C4'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'C5'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'C6'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'C7'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PC1'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PC2'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PC3'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PC4'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PC5'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PC6'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PC7'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PC8'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PC9'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PC10'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PC11'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PC12'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PC13'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SEXO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMAIL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COMERCIAL'
        Visible = True
      end>
  end
  object DBNavigator1: TDBNavigator
    Left = 32
    Top = 112
    Width = 240
    Height = 25
    DataSource = dsVolunt
    TabOrder = 1
  end
  object btnIncluir: TButton
    Left = 32
    Top = 464
    Width = 75
    Height = 25
    Caption = 'Incluir'
    TabOrder = 2
    OnClick = btnIncluirClick
  end
  object btnExcluir: TButton
    Left = 113
    Top = 464
    Width = 75
    Height = 25
    Caption = 'Excluir'
    TabOrder = 3
  end
  object btnAlterar: TButton
    Left = 201
    Top = 464
    Width = 75
    Height = 25
    Caption = 'Alterar'
    TabOrder = 4
    OnClick = btnAlterarClick
  end
  object btnSalvar: TButton
    Left = 289
    Top = 464
    Width = 75
    Height = 25
    Caption = 'Salvar'
    TabOrder = 5
    OnClick = btnSalvarClick
  end
  object btnCancelar: TButton
    Left = 370
    Top = 464
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 6
    OnClick = btnCancelarClick
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 32
    Top = 48
    Width = 425
    Height = 23
    KeyField = 'NOME'
    ListField = 'NOME'
    ListSource = dsVolunt
    TabOrder = 7
  end
  object dbID: TDBLabeledEdit
    Left = 24
    Top = 392
    Width = 121
    Height = 23
    DataField = 'ID_VOLUNT'
    DataSource = dsVolunt
    TabOrder = 8
    EditLabel.Width = 68
    EditLabel.Height = 15
    EditLabel.Caption = 'ID Volunt'#225'rio'
    EditLabel.Layout = tlCenter
  end
  object dbNome: TDBLabeledEdit
    Left = 168
    Top = 389
    Width = 401
    Height = 23
    DataField = 'NOME'
    DataSource = dsVolunt
    TabOrder = 9
    EditLabel.Width = 33
    EditLabel.Height = 15
    EditLabel.Caption = 'Nome'
    EditLabel.Layout = tlCenter
  end
  object DBLabeledEdit3: TDBLabeledEdit
    Left = 608
    Top = 389
    Width = 121
    Height = 23
    DataField = 'COD_LIMPEZA'
    DataSource = dsVolunt
    TabOrder = 10
    EditLabel.Width = 72
    EditLabel.Height = 15
    EditLabel.Caption = 'C'#243'd. Limpeza'
    EditLabel.Layout = tlCenter
  end
  object DBLabeledEdit4: TDBLabeledEdit
    Left = 776
    Top = 389
    Width = 121
    Height = 23
    DataField = 'COD_MANUT'
    DataSource = dsVolunt
    TabOrder = 11
    EditLabel.Width = 95
    EditLabel.Height = 15
    EditLabel.Caption = 'C'#243'd. Manuten'#231#227'o'
    EditLabel.Layout = tlCenter
  end
  object Button1: TButton
    Left = 506
    Top = 464
    Width = 75
    Height = 25
    Caption = 'Sair'
    TabOrder = 12
    OnClick = Button1Click
  end
  object ComboBox1: TComboBox
    Left = 600
    Top = 64
    Width = 145
    Height = 23
    TabOrder = 13
    Text = 'ComboBox1'
  end
  object btnLerCSV: TButton
    Left = 32
    Top = 520
    Width = 159
    Height = 25
    Caption = 'Ler CSV MR'
    TabOrder = 14
    OnClick = btnLerCSVClick
  end
  object DBGrid2: TDBGrid
    Left = 32
    Top = 560
    Width = 1097
    Height = 169
    DataSource = DataSource1
    TabOrder = 15
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
  object dsVolunt: TDataSource
    DataSet = dmVolunt.qryVoluntarios
    Left = 464
    Top = 200
  end
  object QImport3Wizard1: TQImport3Wizard
    DataSet = FDTable1
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
    Left = 701
    Top = 480
  end
  object FDTable1: TFDTable
    Connection = dmVolunt.dbConn
    TableName = 'CAD_VOLUNT'
    Left = 864
    Top = 480
  end
  object DataSource1: TDataSource
    DataSet = FDTable1
    Left = 976
    Top = 472
  end
end
