object frmProj1: TfrmProj1
  Left = 0
  Top = 0
  Caption = 'Cadastro de Volunt'#225'rios - CCB'
  ClientHeight = 697
  ClientWidth = 1063
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu1
  OnShow = FormShow
  TextHeight = 15
  object lblNSorteado: TLabel
    Left = 290
    Top = 203
    Width = 69
    Height = 15
    Caption = 'lblNSorteado'
  end
  object Label1: TLabel
    Left = 290
    Top = 174
    Width = 94
    Height = 15
    Caption = 'N'#250'mero Sorteado'
  end
  object Label2: TLabel
    Left = 427
    Top = 292
    Width = 34
    Height = 15
    Caption = 'Label2'
  end
  object Button1: TButton
    Left = 506
    Top = 72
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
    OnClick = Button1Click
  end
  object sbPrincipal: TStatusBar
    Left = 0
    Top = 678
    Width = 1063
    Height = 19
    Panels = <>
    ExplicitTop = 677
    ExplicitWidth = 1059
  end
  object ListBox1: TListBox
    Left = 24
    Top = 56
    Width = 233
    Height = 337
    ItemHeight = 15
    TabOrder = 2
  end
  object btnSorteio: TButton
    Left = 290
    Top = 120
    Width = 75
    Height = 25
    Caption = 'Sorteio'
    TabOrder = 3
    OnClick = btnSorteioClick
  end
  object btnClassificar: TButton
    Left = 386
    Top = 120
    Width = 75
    Height = 25
    Caption = 'Classificar'
    TabOrder = 4
    OnClick = btnClassificarClick
  end
  object edtNumsorteado: TEdit
    Left = 290
    Top = 243
    Width = 271
    Height = 23
    TabOrder = 5
  end
  object Button2: TButton
    Left = 290
    Top = 288
    Width = 75
    Height = 25
    Caption = 'Pesquisar'
    TabOrder = 6
    OnClick = Button2Click
  end
  object edtCNPJ: TLabeledEdit
    Left = 24
    Top = 440
    Width = 233
    Height = 23
    EditLabel.Width = 27
    EditLabel.Height = 15
    EditLabel.Caption = 'CNPJ'
    TabOrder = 7
    Text = '33014556000196'
  end
  object Button3: TButton
    Left = 24
    Top = 480
    Width = 121
    Height = 25
    Caption = 'Pesquisar CEP'
    TabOrder = 8
    OnClick = Button3Click
  end
  object Memo1: TMemo
    Left = 328
    Top = 440
    Width = 505
    Height = 209
    Lines.Strings = (
      'Memo1')
    TabOrder = 9
  end
  object edtDtNr: TLabeledEdit
    Left = 640
    Top = 171
    Width = 121
    Height = 23
    EditLabel.Width = 94
    EditLabel.Height = 15
    EditLabel.Caption = 'Data em n'#250'meros'
    TabOrder = 10
    Text = ''
  end
  object btnCalcDt: TButton
    Left = 640
    Top = 200
    Width = 145
    Height = 25
    Caption = 'c'#225'lculo de data'
    TabOrder = 11
    OnClick = btnCalcDtClick
  end
  object edtDtRes: TLabeledEdit
    Left = 840
    Top = 168
    Width = 121
    Height = 23
    EditLabel.Width = 45
    EditLabel.Height = 15
    EditLabel.Caption = 'Res Data'
    TabOrder = 12
    Text = ''
  end
  object edtDt: TLabeledEdit
    Left = 640
    Top = 267
    Width = 121
    Height = 23
    EditLabel.Width = 27
    EditLabel.Height = 15
    EditLabel.Caption = 'Data '
    TabOrder = 13
    Text = ''
  end
  object edtNr: TLabeledEdit
    Left = 840
    Top = 264
    Width = 121
    Height = 23
    EditLabel.Width = 44
    EditLabel.Height = 15
    EditLabel.Caption = 'N'#250'mero'
    TabOrder = 14
    Text = ''
  end
  object Button4: TButton
    Left = 640
    Top = 304
    Width = 145
    Height = 25
    Caption = 'Mostrar n'#250'mero'
    TabOrder = 15
    OnClick = Button4Click
  end
  object MainMenu1: TMainMenu
    Left = 360
    Top = 40
    object Cadastro1: TMenuItem
      Caption = 'Cadastro'
      object CadastroVoluntriosDBexpress1: TMenuItem
        Caption = 'Cadastro Volunt'#225'rios DBexpress'
        OnClick = CadastroVoluntriosDBexpress1Click
      end
      object CadVolFireDAC1: TMenuItem
        Caption = 'Cad Vol FireDAC'
        OnClick = CadVolFireDAC1Click
      end
    end
    object Relatrios1: TMenuItem
      Caption = 'Relat'#243'rios'
      object relVolunt: TMenuItem
        Caption = 'Volunt'#225'rios'
        OnClick = relVoluntClick
      end
    end
    object mnuTesteWK: TMenuItem
      Caption = 'Teste WK'
      object mnuWKdb: TMenuItem
        Caption = 'WKDB'
        OnClick = mnuWKdbClick
      end
    end
    object Imobilizado1: TMenuItem
      Caption = 'Imobilizado'
      object Imobilizado2: TMenuItem
        Caption = 'Imobilizado'
        OnClick = Imobilizado2Click
      end
      object Relatrio1: TMenuItem
        Caption = 'Relat'#243'rio'
        OnClick = Relatrio1Click
      end
    end
    object Sair1: TMenuItem
      Caption = 'Sair'
      OnClick = Sair1Click
    end
  end
  object RESTClient1: TRESTClient
    Params = <>
    SynchronizedEvents = False
    Left = 344
    Top = 352
  end
  object RESTRequest1: TRESTRequest
    Client = RESTClient1
    Params = <>
    Response = RESTResponse1
    SynchronizedEvents = False
    Left = 456
    Top = 360
  end
  object RESTResponse1: TRESTResponse
    Left = 568
    Top = 352
  end
end
