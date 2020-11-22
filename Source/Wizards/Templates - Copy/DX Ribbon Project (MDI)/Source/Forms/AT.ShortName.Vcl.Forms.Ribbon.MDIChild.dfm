object frmRibbonMDIChild: TfrmRibbonMDIChild
  Left = 360
  Top = 84
  Caption = 'frmEibbonMDIChild'
  ClientHeight = 304
  ClientWidth = 449
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = True
  Position = poDefault
  Visible = True
  OnActivate = FormActivate
  OnClose = FormClose
  OnDeactivate = FormDeactivate
  PixelsPerInch = 96
  TextHeight = 13
  object ribMDIChild: TdxRibbon
    Left = 0
    Top = 0
    Width = 449
    Height = 155
    BarManager = barmgrMDIChild
    Style = rs2016
    ColorSchemeAccent = rcsaBlue
    ColorSchemeName = 'Colorful'
    QuickAccessToolbar.Toolbar = barQAT
    TabAreaToolbar.Toolbar = barTAT
    Contexts = <>
    TabOrder = 0
    TabStop = False
    object ribtabHome: TdxRibbonTab
      Active = True
      Caption = 'Home'
      Groups = <>
      Index = 0
    end
  end
  object barmgrMDIChild: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    PopupMenuLinks = <>
    UseSystemFont = True
    Left = 28
    Top = 172
    PixelsPerInch = 96
    object barQAT: TdxBar
      Caption = 'Quick Access Toolbar'
      CaptionButtons = <>
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 483
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <>
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object barTAT: TdxBar
      Caption = 'Tab Area Toolbar'
      CaptionButtons = <>
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 483
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <>
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
  end
end
