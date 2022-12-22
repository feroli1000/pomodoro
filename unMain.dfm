object FormMain: TFormMain
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'P***omodoro'
  ClientHeight = 299
  ClientWidth = 584
  Color = clBackground
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clCream
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = [fsBold]
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblDisplay: TLabel
    Left = 164
    Top = 81
    Width = 256
    Height = 77
    Alignment = taCenter
    Caption = '00:00:00'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clCream
    Font.Height = -64
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblInit: TLabel
    Left = 408
    Top = 261
    Width = 33
    Height = 13
    Caption = 'lblInit'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGrayText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblDone: TLabel
    Left = 504
    Top = 261
    Width = 42
    Height = 13
    Caption = 'lblDone'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGrayText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblDisplay2: TLabel
    Left = 255
    Top = 187
    Width = 74
    Height = 23
    Alignment = taCenter
    Caption = '00:00:00'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGrayText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object upDownMinutes: TUpDown
    Left = 95
    Top = 256
    Width = 30
    Height = 24
    Associate = edtMinutes
    Min = 1
    Max = 180
    Position = 15
    TabOrder = 0
  end
  object edtMinutes: TEdit
    Left = 24
    Top = 256
    Width = 71
    Height = 24
    Alignment = taCenter
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    Text = '15'
    OnDblClick = edtMinutesDblClick
  end
  object btnStartStop: TBitBtn
    Left = 164
    Top = 255
    Width = 75
    Height = 24
    Caption = 'Start'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = btnStartStopClick
  end
  object MediaPlayer1: TMediaPlayer
    Left = 128
    Top = 24
    Width = 57
    Height = 30
    VisibleButtons = [btPlay, btStop]
    Visible = False
    TabOrder = 3
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 80
    Top = 24
  end
  object TrayIcon1: TTrayIcon
    OnDblClick = TrayIcon1DblClick
    Left = 216
    Top = 24
  end
  object ApplicationEvents1: TApplicationEvents
    OnMinimize = ApplicationEvents1Minimize
    Left = 288
    Top = 24
  end
end
