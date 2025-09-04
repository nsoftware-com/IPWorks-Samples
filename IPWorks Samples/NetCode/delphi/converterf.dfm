object FormConverter: TFormConverter
  Left = 397
  Top = 252
  Caption = 'Convert'
  ClientHeight = 94
  ClientWidth = 208
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  DesignSize = (
    208
    94)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 16
    Width = 104
    Height = 13
    Caption = 'Name of file to create:'
  end
  object EditFilename: TEdit
    Left = 8
    Top = 36
    Width = 192
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
  end
  object Button1: TButton
    Left = 42
    Top = 65
    Width = 75
    Height = 23
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 1
  end
  object Button2: TButton
    Left = 126
    Top = 65
    Width = 75
    Height = 23
    Anchors = [akRight, akBottom]
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 2
  end
end
