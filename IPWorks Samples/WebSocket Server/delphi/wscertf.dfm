object FormWscert: TFormWscert
  Left = 0
  Top = 0
  Caption = 'Certificate Browser'
  ClientHeight = 366
  ClientWidth = 506
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 9
    Top = 206
    Width = 77
    Height = 13
    Caption = 'Certificate Info:'
  end
  object Label2: TLabel
    Left = 9
    Top = 50
    Width = 105
    Height = 13
    Caption = 'Available Certificates:'
  end
  object Label1: TLabel
    Left = 8
    Top = 11
    Width = 83
    Height = 13
    Caption = 'Certificate Store:'
  end
  object txtInfo: TMemo
    Left = 8
    Top = 222
    Width = 490
    Height = 134
    Anchors = [akLeft, akTop, akRight, akBottom]
    Lines.Strings = (
      'txtInfo')
    ScrollBars = ssBoth
    TabOrder = 0
  end
  object lCerts: TListBox
    Left = 8
    Top = 69
    Width = 490
    Height = 131
    Anchors = [akLeft, akTop, akRight]
    ItemHeight = 13
    TabOrder = 1
    OnClick = lCertsClick
  end
  object bSelectCert: TButton
    Left = 394
    Top = 4
    Width = 99
    Height = 29
    Anchors = [akTop, akRight]
    Caption = 'Select'
    TabOrder = 2
    OnClick = bSelectCertClick
  end
  object cbStores: TListBox
    Left = 91
    Top = 9
    Width = 295
    Height = 19
    Anchors = [akLeft, akTop, akRight]
    ItemHeight = 13
    TabOrder = 3
    OnClick = cbStoresClick
  end
  object ipwCertMgr1: TipwCertMgr
    CertStore = 'MY'
    ExportFormat = 'PFX'
    OnCertList = ipwCertMgr1CertList
    OnStoreList = ipwCertMgr1StoreList
    Left = 304
    Top = 280
  end
end
