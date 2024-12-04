object dmVolunt: TdmVolunt
  OnCreate = DataModuleCreate
  Height = 480
  Width = 887
  object dbConn: TFDConnection
    Params.Strings = (
      'Database=C:\DB\dbvolunt.FDB'
      'User_Name=sysdba'
      'Password=masterkey'
      'Protocol=TCPIP'
      'Server=localhost'
      'DriverID=FB')
    Connected = True
    LoginPrompt = False
    Left = 64
    Top = 64
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    VendorLib = 'C:\Program Files (x86)\Firebird\Firebird_3_0\fbclient.dll'
    Left = 192
    Top = 72
  end
  object qryVoluntarios: TFDQuery
    Connection = dbConn
    UpdateOptions.KeyFields = 'ID_VOLUNT'
    UpdateOptions.AutoIncFields = 'ID_VOLUNT'
    SQL.Strings = (
      'select * from cad_volunt')
    Left = 344
    Top = 80
    object qryVoluntariosID_VOLUNT: TFDAutoIncField
      DisplayWidth = 10
      FieldName = 'ID_VOLUNT'
      Origin = 'ID_VOLUNT'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      IdentityInsert = True
    end
    object qryVoluntariosNOME: TStringField
      DisplayWidth = 59
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 100
    end
    object qryVoluntariosCOD_LIMPEZA: TStringField
      DisplayWidth = 20
      FieldName = 'COD_LIMPEZA'
      Origin = 'COD_LIMPEZA'
    end
    object qryVoluntariosCOD_MANUT: TStringField
      DisplayWidth = 20
      FieldName = 'COD_MANUT'
      Origin = 'COD_MANUT'
    end
    object qryVoluntariosCPF: TStringField
      DisplayWidth = 14
      FieldName = 'CPF'
      Origin = 'CPF'
      Size = 14
    end
    object qryVoluntariosENDERECO: TStringField
      DisplayWidth = 32
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      Size = 200
    end
    object qryVoluntariosBAIRRO: TStringField
      DisplayWidth = 40
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
      Size = 150
    end
    object qryVoluntariosDTNASC: TDateField
      DisplayWidth = 10
      FieldName = 'DTNASC'
      Origin = 'DTNASC'
    end
    object qryVoluntariosCELULAR: TStringField
      DisplayWidth = 20
      FieldName = 'CELULAR'
      Origin = 'CELULAR'
    end
    object qryVoluntariosRES: TStringField
      DisplayWidth = 20
      FieldName = 'RES'
      Origin = 'RES'
    end
    object qryVoluntariosC1: TStringField
      DisplayWidth = 5
      FieldName = 'C1'
      Origin = 'C1'
      Size = 5
    end
    object qryVoluntariosC2: TStringField
      DisplayWidth = 5
      FieldName = 'C2'
      Origin = 'C2'
      Size = 5
    end
    object qryVoluntariosC3: TStringField
      DisplayWidth = 5
      FieldName = 'C3'
      Origin = 'C3'
      Size = 5
    end
    object qryVoluntariosC4: TStringField
      DisplayWidth = 5
      FieldName = 'C4'
      Origin = 'C4'
      Size = 5
    end
    object qryVoluntariosC5: TStringField
      DisplayWidth = 5
      FieldName = 'C5'
      Origin = 'C5'
      Size = 5
    end
    object qryVoluntariosC6: TStringField
      DisplayWidth = 5
      FieldName = 'C6'
      Origin = 'C6'
      Size = 5
    end
    object qryVoluntariosC7: TStringField
      DisplayWidth = 5
      FieldName = 'C7'
      Origin = 'C7'
      Size = 5
    end
    object qryVoluntariosPC1: TStringField
      DisplayWidth = 5
      FieldName = 'PC1'
      Origin = 'PC1'
      Size = 5
    end
    object qryVoluntariosPC2: TStringField
      DisplayWidth = 5
      FieldName = 'PC2'
      Origin = 'PC2'
      Size = 5
    end
    object qryVoluntariosPC3: TStringField
      DisplayWidth = 5
      FieldName = 'PC3'
      Origin = 'PC3'
      Size = 5
    end
    object qryVoluntariosPC4: TStringField
      DisplayWidth = 5
      FieldName = 'PC4'
      Origin = 'PC4'
      Size = 5
    end
    object qryVoluntariosPC5: TStringField
      DisplayWidth = 5
      FieldName = 'PC5'
      Origin = 'PC5'
      Size = 5
    end
    object qryVoluntariosPC6: TStringField
      DisplayWidth = 5
      FieldName = 'PC6'
      Origin = 'PC6'
      Size = 5
    end
    object qryVoluntariosPC7: TStringField
      DisplayWidth = 5
      FieldName = 'PC7'
      Origin = 'PC7'
      Size = 5
    end
    object qryVoluntariosPC8: TStringField
      DisplayWidth = 5
      FieldName = 'PC8'
      Origin = 'PC8'
      Size = 5
    end
    object qryVoluntariosPC9: TStringField
      DisplayWidth = 5
      FieldName = 'PC9'
      Origin = 'PC9'
      Size = 5
    end
    object qryVoluntariosPC10: TStringField
      DisplayWidth = 5
      FieldName = 'PC10'
      Origin = 'PC10'
      Size = 5
    end
    object qryVoluntariosPC11: TStringField
      DisplayWidth = 5
      FieldName = 'PC11'
      Origin = 'PC11'
      Size = 5
    end
    object qryVoluntariosPC12: TStringField
      DisplayWidth = 5
      FieldName = 'PC12'
      Origin = 'PC12'
      Size = 5
    end
    object qryVoluntariosPC13: TStringField
      DisplayWidth = 5
      FieldName = 'PC13'
      Origin = 'PC13'
      Size = 5
    end
    object qryVoluntariosSEXO: TStringField
      DisplayWidth = 4
      FieldName = 'SEXO'
      Origin = 'SEXO'
      FixedChar = True
      Size = 1
    end
    object qryVoluntariosEMAIL: TStringField
      DisplayWidth = 200
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      Size = 200
    end
    object qryVoluntariosCOMERCIAL: TStringField
      DisplayWidth = 20
      FieldName = 'COMERCIAL'
      Origin = 'COMERCIAL'
    end
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 80
    Top = 176
  end
  object SQLConnDB: TSQLConnection
    DriverName = 'Firebird'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=Firebird'
      'Database=c:\db\dbvolunt.FDB'
      'RoleName=RoleName'
      'User_Name=sysdba'
      'Password=masterkey'
      'ServerCharSet='
      'SQLDialect=3'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'BlobSize=-1'
      'CommitRetain=False'
      'WaitOnLocks=True'
      'IsolationLevel=ReadCommitted'
      'Trim Char=False'
      
        'ConnectionString=DriverName=Firebird,Database=database.fdb,RoleN' +
        'ame=RoleName,User_Name=sysdba,Password=masterkey,ServerCharSet=,' +
        'SQLDialect=3,ErrorResourceFile=,LocaleCode=0000,BlobSize=-1,Comm' +
        'itRetain=False,WaitOnLocks=True,IsolationLevel=ReadCommitted,Tri' +
        'm Char=False')
    Connected = True
    Left = 72
    Top = 296
  end
  object qryCadvolunt: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from cad_volunt')
    SQLConnection = SQLConnDB
    Left = 168
    Top = 296
  end
  object dsCadVol: TDataSource
    DataSet = qryCadvolunt
    Left = 312
    Top = 296
  end
  object fdconnMYSql: TFDConnection
    ConnectionName = 'fdconnMYSql'
    Params.Strings = (
      'Database=wkdb'
      'User_Name=root'
      'Password=N20atl20at#'
      'Server=localhost'
      'DriverID=MySQL')
    LoginPrompt = False
    Left = 72
    Top = 400
  end
  object FDGUIxWaitCursor2: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 280
    Top = 400
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    VendorLib = 'C:\source\proj_D11\Win32\Debug\libmysql.dll'
    Left = 448
    Top = 392
  end
  object connImob: TFDConnection
    Params.Strings = (
      'Database=imob'
      'User_Name=root'
      'Password=N20atl20at#'
      'Server=localhost'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    Left = 464
    Top = 200
  end
end
