object FormNetcode: TFormNetcode
  Left = 249
  Top = 172
  Caption = 'Netcode'
  ClientHeight = 365
  ClientWidth = 487
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  OnCreate = FormCreate
  DesignSize = (
    487
    365)
  PixelsPerInch = 96
  TextHeight = 13
  object Label5: TLabel
    Left = 8
    Top = 8
    Width = 75
    Height = 13
    Caption = 'Encoding Type:'
  end
  object PageControl1: TPageControl
    Left = 8
    Top = 40
    Width = 470
    Height = 317
    ActivePage = TabSheet2
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    TabWidth = 100
    object TabSheet1: TTabSheet
      Caption = 'File to File'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      DesignSize = (
        462
        289)
      object Label1: TLabel
        Left = 8
        Top = 80
        Width = 56
        Height = 13
        Caption = 'Source File:'
      end
      object Label2: TLabel
        Left = 8
        Top = 168
        Width = 53
        Height = 13
        Caption = 'Target File:'
      end
      object EditSource: TEdit
        Left = 8
        Top = 96
        Width = 350
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
      end
      object ButtonGetSource: TButton
        Left = 362
        Top = 96
        Width = 75
        Height = 23
        Anchors = [akTop, akRight]
        Caption = 'Browse'
        TabOrder = 1
        OnClick = ButtonGetSourceClick
      end
      object EditTarget: TEdit
        Left = 8
        Top = 184
        Width = 350
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
      end
      object ButtonGetTarget: TButton
        Left = 362
        Top = 184
        Width = 75
        Height = 23
        Anchors = [akTop, akRight]
        Caption = 'Browse'
        TabOrder = 3
        OnClick = ButtonGetTargetClick
      end
      object ButtonConvert: TButton
        Left = 176
        Top = 240
        Width = 75
        Height = 23
        Caption = 'Convert'
        TabOrder = 4
        OnClick = ButtonConvertClick
      end
      object RadioGroupAction: TRadioGroup
        Left = 8
        Top = 16
        Width = 145
        Height = 45
        Caption = ' Action '
        Columns = 2
        Items.Strings = (
          'Encode'
          'Decode')
        TabOrder = 5
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'String to String'
      DesignSize = (
        462
        289)
      object Label3: TLabel
        Left = 4
        Top = 12
        Width = 70
        Height = 13
        Caption = 'Decoded Data'
      end
      object Label4: TLabel
        Left = 248
        Top = 12
        Width = 69
        Height = 13
        Caption = 'Encoded Data'
      end
      object Label6: TLabel
        Left = 204
        Top = 88
        Width = 37
        Height = 13
        Caption = 'Encode'
      end
      object Label7: TLabel
        Left = 203
        Top = 156
        Width = 38
        Height = 13
        Caption = 'Decode'
      end
      object MemoDecoded: TMemo
        Left = 4
        Top = 32
        Width = 196
        Height = 253
        Anchors = [akLeft, akTop, akBottom]
        TabOrder = 0
      end
      object MemoEncoded: TMemo
        Left = 248
        Top = 32
        Width = 209
        Height = 253
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
      end
      object ButtonEncode: TButton
        Left = 212
        Top = 108
        Width = 25
        Height = 23
        Caption = '-->'
        TabOrder = 2
        OnClick = ButtonEncodeClick
      end
      object ButtonDecode: TButton
        Left = 212
        Top = 176
        Width = 25
        Height = 23
        Caption = '<--'
        TabOrder = 3
        OnClick = ButtonDecodeClick
      end
    end
  end
  object ComboBoxEncType: TComboBox
    Left = 88
    Top = 4
    Width = 120
    Height = 21
    TabOrder = 1
    Text = 'Base 64'
    OnChange = ComboBoxEncTypeChange
    Items.Strings = (
      'UUEncode'
      'Base 64'
      'Quoted-Printable'
      'URL'
      'JIS'
      'YEnc'
      'MD5 Hash'
      'SHA1 Hash'
      'Hex')
  end
  object ProgressBarConvert: TProgressBar
    Left = 249
    Top = 8
    Width = 225
    Height = 16
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
  end
  object OpenDialog1: TOpenDialog
    Left = 148
    Top = 60
  end
  object ipwNetCode1: TipwNetCode
    Mode = '0755'
    OnProgress = ipwNetCode1Progress
    Left = 112
    Top = 60
  end
end


