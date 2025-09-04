object FormFtplogin: TFormFtplogin
  Left = 481
  Top = 102
  ActiveControl = EditHostName
  BorderStyle = bsDialog
  Caption = 'Logon'
  ClientHeight = 134
  ClientWidth = 247
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = 11
  Font.Name = 'MS Sans Serif'
  Font.Pitch = fpVariable
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  DesignSize = (
    247
    134)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 16
    Width = 99
    Height = 13
    Caption = 'Host Name/Address:'
    Layout = tlCenter
  end
  object Label2: TLabel
    Left = 68
    Top = 44
    Width = 39
    Height = 13
    Caption = 'User ID:'
    Layout = tlCenter
  end
  object Label3: TLabel
    Left = 56
    Top = 72
    Width = 49
    Height = 13
    Caption = 'Password:'
    Layout = tlCenter
  end
  object EditHostName: TEdit
    Left = 113
    Top = 13
    Width = 121
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    MaxLength = 32767
    TabOrder = 0
  end
  object EditUser: TEdit
    Left = 112
    Top = 40
    Width = 121
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    MaxLength = 32767
    TabOrder = 1
  end
  object EditPassword: TEdit
    Left = 112
    Top = 68
    Width = 121
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    MaxLength = 32767
    PasswordChar = '*'
    TabOrder = 2
  end
  object ButtonOk: TButton
    Left = 72
    Top = 104
    Width = 75
    Height = 23
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 3
  end
  object ButtonCancel: TButton
    Left = 156
    Top = 104
    Width = 75
    Height = 23
    Anchors = [akRight, akBottom]
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 4
  end
end
