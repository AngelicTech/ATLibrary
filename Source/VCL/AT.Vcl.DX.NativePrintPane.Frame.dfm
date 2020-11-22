object ATdxNativePrintPaneFrame: TATdxNativePrintPaneFrame
  Left = 0
  Top = 0
  Width = 1041
  Height = 762
  ParentShowHint = False
  ShowHint = True
  TabOrder = 0
  object layPrintPreview: TdxLayoutControl
    Left = 0
    Top = 0
    Width = 1041
    Height = 762
    Align = alClient
    TabOrder = 0
    object PSPreviewWindow: TdxPSPreviewWindow
      Left = 260
      Top = 10
      Width = 771
      Height = 742
      BorderStyle = cxcbsNone
      PreviewPopupMenu = puPreview
      OnUpdateControls = PSPreviewWindowUpdateControls
    end
    object btnPrint: TcxButton
      Left = 10
      Top = 10
      Width = 75
      Height = 75
      Caption = '&Print'
      OptionsImage.ImageIndex = 0
      OptionsImage.Layout = blGlyphTop
      TabOrder = 0
      OnClick = PrintButtonClickHandler
    end
    object sePrintCopies: TcxSpinEdit
      Left = 162
      Top = 10
      Properties.ImmediatePost = True
      Properties.MinValue = 1.000000000000000000
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      TabOrder = 1
      Value = 1
      Width = 48
    end
    object btnPrinter: TcxButton
      Left = 10
      Top = 127
      Width = 200
      Height = 50
      Caption = 'btnPrinter'
      DropDownMenu = puPrinters
      Kind = cxbkOfficeDropDown
      OptionsImage.ImageIndex = 1
      TabOrder = 2
      WordWrap = True
    end
    object btnPrintCollate: TcxButton
      Left = 10
      Top = 322
      Width = 200
      Height = 50
      DropDownMenu = puPrintCollate
      Kind = cxbkOfficeDropDown
      OptionsImage.ImageIndex = 5
      TabOrder = 5
      WordWrap = True
    end
    object btnPrintPages: TcxButton
      Left = 10
      Top = 239
      Width = 200
      Height = 50
      DropDownMenu = puPrintRanges
      Kind = cxbkOfficeDropDown
      OptionsImage.ImageIndex = 4
      TabOrder = 3
      WordWrap = True
    end
    object txtPrintRange: TcxTextEdit
      Left = 48
      Top = 295
      Properties.OnChange = PrintRangeChangeHandler
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 4
      Width = 162
    end
    object btnPageOrientation: TcxButton
      Left = 10
      Top = 378
      Width = 200
      Height = 50
      DropDownMenu = puPageOrientation
      Kind = cxbkOfficeDropDown
      OptionsImage.ImageIndex = 2
      TabOrder = 6
      WordWrap = True
    end
    object btnPaperSize: TcxButton
      Left = 10
      Top = 434
      Width = 200
      Height = 50
      DropDownMenu = puPaperSizes
      Kind = cxbkOfficeDropDown
      OptionsImage.ImageIndex = 7
      TabOrder = 7
      WordWrap = True
    end
    object laygrpPrintPreviewGroup_Root: TdxLayoutGroup
      AlignHorz = ahClient
      AlignVert = avClient
      ButtonOptions.Buttons = <>
      Hidden = True
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = -1
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = laygrpPrintPreviewGroup_Root
      AlignHorz = ahClient
      AlignVert = avClient
      CaptionOptions.Text = 'dxPSPreviewWindow1'
      CaptionOptions.Visible = False
      Control = PSPreviewWindow
      ControlOptions.OriginalHeight = 240
      ControlOptions.OriginalWidth = 320
      ControlOptions.ShowBorder = False
      Index = 4
    end
    object dxLayoutItem2: TdxLayoutItem
      Parent = dxLayoutGroup1
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = btnPrint
      ControlOptions.OriginalHeight = 75
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object layitmCopies: TdxLayoutItem
      Parent = dxLayoutGroup1
      AlignHorz = ahRight
      CaptionOptions.Text = 'Copies:'
      Control = sePrintCopies
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 48
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutSeparatorItem1: TdxLayoutSeparatorItem
      Parent = laygrpPrintPreviewGroup_Root
      CaptionOptions.Text = 'Separator'
      Index = 2
    end
    object dxLayoutEmptySpaceItem1: TdxLayoutEmptySpaceItem
      Parent = laygrpPrintPreviewGroup_Root
      SizeOptions.Height = 10
      SizeOptions.Width = 10
      CaptionOptions.Text = 'Empty Space Item'
      Index = 3
    end
    object dxLayoutEmptySpaceItem2: TdxLayoutEmptySpaceItem
      Parent = laygrpPrintPreviewGroup_Root
      SizeOptions.Height = 10
      SizeOptions.Width = 10
      CaptionOptions.Text = 'Empty Space Item'
      Index = 1
    end
    object dxLayoutGroup1: TdxLayoutGroup
      Parent = dxLayoutAutoCreatedGroup1
      AlignVert = avTop
      CaptionOptions.Text = 'New Group'
      SizeOptions.Width = 200
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 0
    end
    object dxLayoutItem4: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup1
      CaptionOptions.Visible = False
      Control = btnPrinter
      ControlOptions.OriginalHeight = 50
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutAutoCreatedGroup1: TdxLayoutAutoCreatedGroup
      Parent = laygrpPrintPreviewGroup_Root
      Index = 0
    end
    object dxLayoutEmptySpaceItem3: TdxLayoutEmptySpaceItem
      Parent = dxLayoutAutoCreatedGroup1
      SizeOptions.Height = 10
      SizeOptions.Width = 10
      CaptionOptions.Text = 'Empty Space Item'
      Index = 1
    end
    object lblitmPrinterProperties: TdxLayoutLabeledItem
      Parent = dxLayoutAutoCreatedGroup1
      AlignHorz = ahRight
      CaptionOptions.Cursor = crHandPoint
      CaptionOptions.Text = 'Printer Properties'
      OnCaptionClick = PrinterPropertiesCaptionClickHandler
      Index = 4
    end
    object dxLayoutEmptySpaceItem4: TdxLayoutEmptySpaceItem
      Parent = dxLayoutAutoCreatedGroup1
      SizeOptions.Height = 10
      SizeOptions.Width = 10
      CaptionOptions.Text = 'Empty Space Item'
      Index = 5
    end
    object lblitmPageSetup: TdxLayoutLabeledItem
      Parent = dxLayoutAutoCreatedGroup1
      AlignHorz = ahRight
      CaptionOptions.Cursor = crHandPoint
      CaptionOptions.Text = 'Page Setup'
      OnCaptionClick = PageSetupCaptionClickHandler
      Index = 12
    end
    object dxLayoutItem5: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup1
      CaptionOptions.Visible = False
      Control = btnPrintCollate
      ControlOptions.OriginalHeight = 50
      ControlOptions.OriginalWidth = 173
      ControlOptions.ShowBorder = False
      Index = 9
    end
    object lblitmPrinter: TdxLayoutLabeledItem
      Parent = dxLayoutAutoCreatedGroup1
      CaptionOptions.Text = 'Printer'
      Index = 2
    end
    object lblitmSettings: TdxLayoutLabeledItem
      Parent = dxLayoutAutoCreatedGroup1
      CaptionOptions.Text = 'Settings'
      Index = 6
    end
    object dxLayoutItem6: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup1
      CaptionOptions.Visible = False
      Control = btnPrintPages
      ControlOptions.OriginalHeight = 50
      ControlOptions.OriginalWidth = 173
      ControlOptions.ShowBorder = False
      Index = 7
    end
    object layitmPages: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup1
      CaptionOptions.Text = 'Pages:'
      Control = txtPrintRange
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 8
    end
    object layitmPageOrientation: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup1
      CaptionOptions.Visible = False
      Control = btnPageOrientation
      ControlOptions.OriginalHeight = 50
      ControlOptions.OriginalWidth = 173
      ControlOptions.ShowBorder = False
      Index = 10
    end
    object layitmPaperSize: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup1
      AlignHorz = ahRight
      CaptionOptions.Visible = False
      Control = btnPaperSize
      ControlOptions.OriginalHeight = 50
      ControlOptions.OriginalWidth = 200
      ControlOptions.ShowBorder = False
      Index = 11
    end
  end
  object barmgrPrintPane: TdxBarManager
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
    ImageOptions.StretchGlyphs = False
    PopupMenuLinks = <>
    UseSystemFont = True
    Left = 368
    Top = 341
    PixelsPerInch = 96
    object cmdPrinters: TdxBarListItem
      Caption = 'Printers'
      Category = 0
      Visible = ivAlways
      OnClick = PrintersClickHandler
      ShowCheck = True
      ShowNumbers = False
    end
    object cmdPrintRanges: TdxBarListItem
      Caption = 'Print Ranges'
      Category = 0
      Visible = ivAlways
      OnClick = PrintRangesClickHandler
      ItemIndex = 0
      Items.Strings = (
        'Print All Pages'
        'Print Current Page'
        'Custom')
      ShowCheck = True
      ShowNumbers = False
    end
    object cmdPageOrientation: TdxBarListItem
      Caption = 'Page Orientation'
      Category = 0
      Visible = ivAlways
      OnClick = PageOrientationClickHandler
      ItemIndex = 0
      Items.Strings = (
        'Portrait'
        'Landscape')
      ShowCheck = True
      ShowNumbers = False
    end
    object cmdCollation: TdxBarListItem
      Caption = 'Collation'
      Category = 0
      Visible = ivAlways
      OnClick = CollationClickHandler
      ItemIndex = 0
      Items.Strings = (
        'Collate'
        'Uncollate')
      ShowCheck = True
      ShowNumbers = False
    end
    object cmdPaperSizes: TdxBarListItem
      Caption = 'Paper Sizes'
      Category = 0
      Visible = ivAlways
      OnClick = PaperSizesClickHandler
      ItemIndex = 0
      ShowCheck = True
      ShowNumbers = False
    end
    object cmdCustomPaperSize: TdxBarButton
      Caption = 'More...'
      Category = 0
      Hint = 'More'
      Visible = ivAlways
      OnClick = PageSetupCaptionClickHandler
    end
    object cmdDesignReport: TdxBarButton
      Action = actDesignReport
      Category = 0
    end
    object cmdRebuildReport: TdxBarButton
      Caption = 'Rebuild Report'
      Category = 0
      Hint = 'Rebuild Report'
      Visible = ivAlways
      ImageIndex = 1
      OnClick = RebuildReportClickHandler
    end
  end
  object puPrinters: TdxRibbonPopupMenu
    BarManager = barmgrPrintPane
    ItemLinks = <
      item
        Visible = True
      end
      item
        Visible = True
        ItemName = 'cmdPrinters'
      end>
    UseOwnFont = False
    Left = 736
    Top = 341
    PixelsPerInch = 96
  end
  object puPrintCollate: TdxRibbonPopupMenu
    BarManager = barmgrPrintPane
    ItemLinks = <
      item
        Visible = True
      end
      item
        Visible = True
      end
      item
        Visible = True
        ItemName = 'cmdCollation'
      end>
    UseOwnFont = False
    Left = 276
    Top = 393
    PixelsPerInch = 96
  end
  object puPrintRanges: TdxRibbonPopupMenu
    BarManager = barmgrPrintPane
    ItemLinks = <
      item
        Visible = True
        ItemName = 'cmdPrintRanges'
      end>
    UseOwnFont = False
    Left = 368
    Top = 393
    PixelsPerInch = 96
  end
  object puPageOrientation: TdxRibbonPopupMenu
    BarManager = barmgrPrintPane
    ItemLinks = <
      item
        Visible = True
        ItemName = 'cmdPageOrientation'
      end>
    UseOwnFont = False
    Left = 644
    Top = 341
    PixelsPerInch = 96
  end
  object puPaperSizes: TdxRibbonPopupMenu
    BarManager = barmgrPrintPane
    ItemLinks = <
      item
        Visible = True
        ItemName = 'cmdPaperSizes'
      end
      item
        BeginGroup = True
        Visible = True
        ItemName = 'cmdCustomPaperSize'
      end>
    UseOwnFont = False
    Left = 460
    Top = 341
    PixelsPerInch = 96
  end
  object puPreview: TdxRibbonPopupMenu
    BarManager = barmgrPrintPane
    ItemLinks = <
      item
        Visible = True
        ItemName = 'cmdDesignReport'
      end
      item
        Visible = True
        ItemName = 'cmdRebuildReport'
      end>
    UseOwnFont = False
    Left = 552
    Top = 341
    PixelsPerInch = 96
  end
  object alstPrintPane: TActionList
    Left = 276
    Top = 341
    object actDesignReport: TAction
      Caption = 'Design Report...'
    end
  end
end
