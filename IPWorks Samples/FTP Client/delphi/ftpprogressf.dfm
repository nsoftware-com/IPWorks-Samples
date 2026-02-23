object FormFtpprogress: TFormFtpprogress
  Left = 293
  Top = 137
  ActiveControl = ButtonCancel
  BorderStyle = bsDialog
  Caption = 'Progress'
  ClientHeight = 89
  ClientWidth = 639
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
    639
    89)
  PixelsPerInch = 96
  TextHeight = 13
  object LabelUpDown: TLabel
    Left = 20
    Top = 8
    Width = 94
    Height = 13
    Caption = 'will be set as shown'
    Layout = tlCenter
  end
  object ButtonCancel: TButton
    Left = 542
    Top = 58
    Width = 75
    Height = 23
    Anchors = [akRight, akBottom]
    Caption = 'Cancel'
    Default = True
    TabOrder = 0
    OnClick = ButtonCancelClick
  end
  object ProgressBar1: TProgressBar
    Left = 16
    Top = 32
    Width = 601
    Height = 17
    Anchors = [akLeft, akTop, akRight]
    Step = 1
    TabOrder = 1
  end
end
