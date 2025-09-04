object FormTftpclient: TFormTftpclient
  Left = 0
  Top = 0
  Caption = 'TFTP Client Demo'
  ClientHeight = 265
  ClientWidth = 649
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Label1: TLabel
    Left = 24
    Top = 24
    Width = 566
    Height = 30
    Caption = 
      'This demo shows how to use the TFTP Client component to connect ' +
      'to a TFTP Server and download a file.  Specify the server host a' +
      'nd port, then click Download to download the file to your local ' +
      'machine.'
    WordWrap = True
  end
  object Label2: TLabel
    Left = 48
    Top = 107
    Width = 80
    Height = 15
    Caption = 'Server Address:'
  end
  object Label3: TLabel
    Left = 48
    Top = 136
    Width = 65
    Height = 15
    Caption = 'Remote File:'
  end
  object Label4: TLabel
    Left = 400
    Top = 136
    Width = 234
    Height = 15
    Caption = 'Select the remote file you wish to download.'
  end
  object Label5: TLabel
    Left = 48
    Top = 165
    Width = 52
    Height = 15
    Caption = 'Local File:'
  end
  object Label6: TLabel
    Left = 400
    Top = 165
    Width = 206
    Height = 15
    Caption = 'Local path to save the downloaded file.'
    WordWrap = True
  end
  object Button1: TButton
    Left = 278
    Top = 212
    Width = 91
    Height = 25
    Caption = 'Download File'
    TabOrder = 0
    OnClick = Button1Click
  end
  object serverAddress: TEdit
    Left = 152
    Top = 104
    Width = 217
    Height = 23
    TabOrder = 1
    Text = '127.0.0.1'
  end
  object portForm: TEdit
    Left = 408
    Top = 104
    Width = 73
    Height = 23
    NumbersOnly = True
    TabOrder = 2
    Text = '69'
  end
  object remoteFileForm: TEdit
    Left = 152
    Top = 133
    Width = 217
    Height = 23
    TabOrder = 3
  end
  object localFileForm: TEdit
    Left = 152
    Top = 162
    Width = 217
    Height = 23
    TabOrder = 4
  end
  object ipwTFTPClient1: TipwTFTPClient
    Left = 616
    Top = 232
  end
end


