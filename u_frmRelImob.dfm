object frmRelImob: TfrmRelImob
  Left = 0
  Top = 0
  Caption = 'Relat'#243'rio do Imobilizado'
  ClientHeight = 442
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object cbbCasaOracao: TComboBoxEx
    Left = 80
    Top = 232
    Width = 321
    Height = 24
    ItemsEx = <>
    TabOrder = 0
    Text = 'cbbCasaOracao'
  end
  object frxReport1: TfrxReport
    Version = '2022.1.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 45569.719928981480000000
    ReportOptions.LastChange = 45569.719928981480000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 456
    Top = 64
    Datasets = <>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
    end
  end
  object dsCasaOracao: TDataSource
    DataSet = qryCasaOracao
    Left = 112
    Top = 56
  end
  object qryCasaOracao: TFDQuery
    Connection = dmVolunt.connImob
    Left = 120
    Top = 136
  end
end
