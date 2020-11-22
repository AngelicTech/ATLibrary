inherited frmTabRibbonForm: TfrmTabRibbonForm
  Caption = 'frmTabRibbonForm'
  ClientHeight = 466
  ExplicitHeight = 505
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlContents: TPanel
    Top = 163
    Height = 295
    ExplicitLeft = 8
    ExplicitTop = 139
    ExplicitWidth = 619
    ExplicitHeight = 319
  end
  object ribChild: TdxRibbon
    Left = 0
    Top = 0
    Width = 635
    Height = 155
    BarManager = barmgrChild
    Style = rs2016
    ColorSchemeAccent = rcsaBlue
    ColorSchemeName = 'Colorful'
    QuickAccessToolbar.Toolbar = barQAT
    TabAreaToolbar.Toolbar = barTAT
    Contexts = <>
    TabOrder = 1
    TabStop = False
    object ribtabHome: TdxRibbonTab
      Active = True
      Caption = 'Home'
      Groups = <>
      Index = 0
    end
  end
  object barmgrChild: TdxBarManager
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
    Left = 48
    Top = 390
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
