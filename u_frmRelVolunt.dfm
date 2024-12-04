object frmRelVolunt: TfrmRelVolunt
  Left = 0
  Top = 0
  Caption = 'Relat'#243'rio de Cadastro de Volunt'#225'rios'
  ClientHeight = 602
  ClientWidth = 943
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Scaled = False
  TextHeight = 15
  object Button1: TButton
    Left = 56
    Top = 40
    Width = 75
    Height = 25
    Caption = 'Imprimir'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 168
    Top = 40
    Width = 75
    Height = 25
    Caption = 'Sair'
    TabOrder = 1
  end
  object QuickRep1: TQuickRep
    Left = 72
    Top = 304
    Width = 794
    Height = 1123
    ShowingPreview = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Functions.Strings = (
      'PAGENUMBER'
      'COLUMNNUMBER'
      'REPORTTITLE')
    Functions.DATA = (
      '0'
      '0'
      #39#39)
    Options = [FirstPageHeader, LastPageFooter]
    Page.Columns = 1
    Page.Orientation = poPortrait
    Page.PaperSize = A4
    Page.Continuous = False
    Page.Values = (
      100.000000000000000000
      2970.000000000000000000
      100.000000000000000000
      2100.000000000000000000
      100.000000000000000000
      100.000000000000000000
      0.000000000000000000)
    PrinterSettings.Copies = 1
    PrinterSettings.OutputBin = Auto
    PrinterSettings.Duplex = False
    PrinterSettings.FirstPage = 0
    PrinterSettings.LastPage = 0
    PrinterSettings.UseStandardprinter = False
    PrinterSettings.UseCustomBinCode = False
    PrinterSettings.CustomBinCode = 0
    PrinterSettings.ExtendedDuplex = 0
    PrinterSettings.UseCustomPaperCode = False
    PrinterSettings.CustomPaperCode = 0
    PrinterSettings.PrintMetaFile = False
    PrinterSettings.MemoryLimit = 1000000
    PrinterSettings.PrintQuality = 0
    PrinterSettings.Collate = 0
    PrinterSettings.ColorOption = 0
    PrintIfEmpty = True
    SnapToGrid = True
    Units = MM
    Zoom = 100
    PrevFormStyle = fsNormal
    PreviewInitialState = wsNormal
    PreviewWidth = 500
    PreviewHeight = 500
    PrevInitialZoom = qrZoomToFit
    PreviewDefaultSaveType = stPDF
    PreviewLeft = 0
    PreviewTop = 0
  end
  object frxRepVolunt: TfrxReport
    Version = '2022.1.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 45527.739970150500000000
    ReportOptions.LastChange = 45527.739970150500000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 216
    Top = 112
    Datasets = <
      item
        DataSet = dbCadVolunt
        DataSetName = 'dbCadVolunt'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 102.047310000000000000
        Width = 1046.929810000000000000
        DataSet = dbCadVolunt
        DataSetName = 'dbCadVolunt'
        RowCount = 0
        object dbCadVoluntID_VOLUNT: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 37.795275590551200000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'ID_VOLUNT'
          DataSet = dbCadVolunt
          DataSetName = 'dbCadVolunt'
          Frame.Typ = []
          Memo.UTF8W = (
            '[dbCadVolunt."ID_VOLUNT"]')
        end
        object dbCadVoluntNOME: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 151.181102362205000000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          DataField = 'NOME'
          DataSet = dbCadVolunt
          DataSetName = 'dbCadVolunt'
          Frame.Typ = []
          Memo.UTF8W = (
            '[dbCadVolunt."NOME"]')
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 37.795275590551200000
          Width = 755.905511811024000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Cadastro de Volunt'#225'rios - Bosque da Sa'#250'de')
          ParentFont = False
        end
      end
    end
  end
  object dbCadVolunt: TfrxDBDataset
    UserName = 'dbCadVolunt'
    CloseDataSource = False
    DataSet = qryCadVolunt
    BCDToCurrency = False
    DataSetOptions = []
    Left = 336
    Top = 104
  end
  object frxPDFExport1: TfrxPDFExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    EmbedFontsIfProtected = False
    InteractiveFormsFontSubset = 'A-Z,a-z,0-9,#43-#47 '
    OpenAfterExport = False
    PrintOptimized = False
    Outline = False
    Background = False
    HTMLTags = True
    Quality = 95
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    Creator = 'FastReport'
    ProtectionFlags = [ePrint, eModify, eCopy, eAnnot]
    HideToolbar = False
    HideMenubar = False
    HideWindowUI = False
    FitWindow = False
    CenterWindow = False
    PrintScaling = False
    PdfA = False
    PDFStandard = psNone
    PDFVersion = pv17
    Left = 256
    Top = 224
  end
  object qryCadVolunt: TFDQuery
    Active = True
    Connection = dmVolunt.dbConn
    SQL.Strings = (
      'select * from cad_volunt'
      'order by nome ')
    Left = 536
    Top = 88
  end
  object dsCad: TDataSource
    DataSet = qryCadVolunt
    Left = 640
    Top = 96
  end
end
