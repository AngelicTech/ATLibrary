object ATdxNativeFileSelectorFrame: TATdxNativeFileSelectorFrame
  Left = 0
  Top = 0
  Width = 713
  Height = 606
  TabOrder = 0
  object layFileSelect: TdxLayoutControl
    Left = 0
    Top = 0
    Width = 713
    Height = 606
    Align = alClient
    MenuItems = []
    TabOrder = 0
    OptionsItem.AllowRename = False
    OptionsItem.AutoControlAreaAlignment = False
    OptionsItem.AutoControlTabOrders = False
    OptionsItem.ShowLockedGroupChildren = False
    OptionsItem.ShowQuickCustomizationToolbar = False
    object sbcFileSelect: TdxShellBreadcrumbEdit
      Left = 10
      Top = 10
      Width = 693
      Height = 24
      Properties.Buttons = <
        item
          Action = actBCParentFolder
        end
        item
          Action = actBCRefresh
        end>
      Properties.PathEditor.RecentPaths = <>
      ShellListView = shllvFileSelect
      ShellTreeView = shltvFileSelect
      TabOrder = 0
    end
    object btnNewFolder: TcxButton
      Left = 10
      Top = 62
      Width = 100
      Height = 25
      Action = actCreateFolder
      TabOrder = 1
    end
    object btnViewMode: TcxButton
      Left = 655
      Top = 62
      Width = 48
      Height = 25
      Caption = 'btnViewMode'
      Kind = cxbkOfficeDropDown
      PaintStyle = bpsGlyph
      TabOrder = 2
    end
    object shltvFileSelect: TcxShellTreeView
      Left = 10
      Top = 115
      Width = 221
      Height = 341
      AutoExpand = True
      HideSelection = False
      Indent = 19
      Options.ShowNonFolders = False
      RightClickSelect = True
      ShellListView = shllvFileSelect
      TabOrder = 3
    end
    object shllvFileSelect: TcxShellListView
      Left = 245
      Top = 115
      Width = 458
      Height = 341
      IconOptions.AutoArrange = True
      Sorting = True
      TabOrder = 7
      ViewStyle = vsReport
      OnAddFolder = ShellListAddFolderHandler
      OnBeforeNavigation = ShellListBeforeNavHandler
      OnExecuteItem = ShellListExecuteItemHandler
      OnSelectItem = ShellListSelectItemHandler
    end
    object txtFileName: TcxTextEdit
      Left = 65
      Top = 484
      Properties.OnChange = FileNameChangedHandler
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 8
      Text = 'txtFileName'
      OnKeyPress = FileNameKeyPressHandler
      Width = 443
    end
    object cmbFileType: TcxComboBox
      Left = 582
      Top = 484
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownSizeable = True
      Properties.ImmediateDropDownWhenActivated = True
      Properties.ImmediatePost = True
      Properties.ImmediateUpdateText = True
      Properties.PostPopupValueOnTab = True
      Properties.OnChange = CmbFileTypeChangeHandler
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 9
      Width = 121
    end
    object btnAccept: TcxButton
      Left = 489
      Top = 541
      Width = 100
      Height = 25
      Action = actAccept
      Default = True
      TabOrder = 10
    end
    object btnCancel: TcxButton
      Left = 603
      Top = 541
      Width = 100
      Height = 25
      Action = actCancel
      TabOrder = 11
    end
    object laygrpFileSelectGroup_Root: TdxLayoutGroup
      AlignHorz = ahClient
      AlignVert = avClient
      ButtonOptions.Buttons = <>
      Hidden = True
      ItemIndex = 8
      ShowBorder = False
      Index = -1
    end
    object layitmBreadcrumb: TdxLayoutItem
      Parent = laygrpFileSelectGroup_Root
      AllowRemove = False
      CaptionOptions.Text = 'New Item'
      CaptionOptions.Visible = False
      Control = sbcFileSelect
      ControlOptions.OriginalHeight = 24
      ControlOptions.OriginalWidth = 200
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object laygrpCmdLayout: TdxLayoutGroup
      Parent = laygrpFileSelectGroup_Root
      CaptionOptions.Text = 'New Group'
      AllowRemove = False
      ButtonOptions.Buttons = <>
      ItemIndex = 1
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 2
    end
    object layitmNewFldrBtn: TdxLayoutItem
      Parent = laygrpCmdLayout
      AllowRemove = False
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = btnNewFolder
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 100
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object layitmViewsBtn: TdxLayoutItem
      Parent = laygrpCmdLayout
      AlignHorz = ahRight
      AllowRemove = False
      CaptionOptions.Text = 'cxButton2'
      CaptionOptions.Visible = False
      Control = btnViewMode
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 48
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object laygrpShellCtrls: TdxLayoutGroup
      Parent = laygrpFileSelectGroup_Root
      AlignVert = avClient
      CaptionOptions.Text = 'New Group'
      AllowRemove = False
      ButtonOptions.Buttons = <>
      ItemIndex = 2
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 4
    end
    object layitmShellTV: TdxLayoutItem
      Parent = laygrpShellCtrls
      AlignHorz = ahClient
      AlignVert = avClient
      AllowRemove = False
      CaptionOptions.Text = 'New Item'
      CaptionOptions.Visible = False
      Control = shltvFileSelect
      ControlOptions.OriginalHeight = 97
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object layitmShellLV: TdxLayoutItem
      Parent = laygrpShellCtrls
      AlignHorz = ahClient
      AlignVert = avClient
      Padding.AssignedValues = [lpavLeft]
      AllowRemove = False
      CaptionOptions.Text = 'New Item'
      CaptionOptions.Visible = False
      Control = shllvFileSelect
      ControlOptions.OriginalHeight = 150
      ControlOptions.OriginalWidth = 250
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object layspltShellCtrls: TdxLayoutSplitterItem
      Parent = laygrpShellCtrls
      SizeOptions.AssignedValues = [sovSizableHorz, sovSizableVert]
      SizeOptions.SizableHorz = False
      SizeOptions.SizableVert = False
      CaptionOptions.Text = 'Splitter'
      Index = 1
    end
    object laygrpEdits: TdxLayoutGroup
      Parent = laygrpFileSelectGroup_Root
      AlignVert = avBottom
      CaptionOptions.Text = 'New Group'
      AllowRemove = False
      ButtonOptions.Buttons = <>
      ItemIndex = 2
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 6
    end
    object layitmFileName: TdxLayoutItem
      Parent = laygrpEdits
      AlignHorz = ahClient
      Padding.Right = 8
      Padding.AssignedValues = [lpavRight]
      AllowRemove = False
      CaptionOptions.Text = 'File Name:'
      Control = txtFileName
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object layitmFileTypeCmb: TdxLayoutItem
      Parent = laygrpEdits
      AlignHorz = ahRight
      AllowRemove = False
      CaptionOptions.Text = 'File Type:'
      Control = cmbFileType
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object laygrpButtons: TdxLayoutGroup
      Parent = laygrpFileSelectGroup_Root
      AlignVert = avBottom
      CaptionOptions.Text = 'New Group'
      AllowRemove = False
      ButtonOptions.Buttons = <>
      ItemIndex = 1
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 8
    end
    object layitmAcceptBtn: TdxLayoutItem
      Parent = laygrpButtons
      AlignHorz = ahRight
      Padding.Left = 8
      Padding.AssignedValues = [lpavLeft]
      AllowRemove = False
      CaptionOptions.Text = 'New Item'
      CaptionOptions.Visible = False
      Control = btnAccept
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 100
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object layspc1: TdxLayoutEmptySpaceItem
      Parent = laygrpFileSelectGroup_Root
      SizeOptions.Height = 16
      SizeOptions.Width = 10
      CaptionOptions.Text = 'Empty Space Item'
      Index = 1
    end
    object layspc2: TdxLayoutEmptySpaceItem
      Parent = laygrpFileSelectGroup_Root
      SizeOptions.Height = 16
      SizeOptions.Width = 10
      CaptionOptions.Text = 'Empty Space Item'
      Index = 3
    end
    object layspc3: TdxLayoutEmptySpaceItem
      Parent = laygrpFileSelectGroup_Root
      AlignVert = avBottom
      SizeOptions.Height = 16
      SizeOptions.Width = 10
      CaptionOptions.Text = 'Empty Space Item'
      Index = 5
    end
    object layspc4: TdxLayoutEmptySpaceItem
      Parent = laygrpFileSelectGroup_Root
      AlignVert = avBottom
      SizeOptions.Height = 24
      SizeOptions.Width = 10
      CaptionOptions.Text = 'Empty Space Item'
      Index = 7
    end
    object layspc5: TdxLayoutEmptySpaceItem
      Parent = laygrpFileSelectGroup_Root
      AlignVert = avBottom
      SizeOptions.Height = 24
      SizeOptions.Width = 10
      CaptionOptions.Text = 'Empty Space Item'
      Index = 9
    end
    object layspltEdits: TdxLayoutSplitterItem
      Parent = laygrpEdits
      AlignHorz = ahRight
      SizeOptions.AssignedValues = [sovSizableHorz, sovSizableVert]
      SizeOptions.SizableHorz = False
      SizeOptions.SizableVert = False
      CaptionOptions.Text = 'Splitter'
      OnCanResize = EditSplitterCanResizeHandler
      Index = 1
    end
    object layitmCancelBtn: TdxLayoutItem
      Parent = laygrpButtons
      AlignHorz = ahRight
      Padding.Left = 8
      Padding.AssignedValues = [lpavLeft]
      AllowRemove = False
      CaptionOptions.Visible = False
      Control = btnCancel
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 100
      ControlOptions.ShowBorder = False
      Index = 1
    end
  end
  object alstFileSelect: TActionList
    Left = 56
    Top = 543
    object actBCRefresh: TAction
      Caption = 'Refresh'
      OnExecute = ExecuteBCRefreshAction
    end
    object actBCParentFolder: TAction
      Caption = 'Go to Parent Folder'
      OnExecute = ExecuteBCParentFolderAction
      OnUpdate = UpdateBCParentFolderAction
    end
    object actAccept: TAction
      Caption = 'Accept'
      OnExecute = ExecuteAcceptButtonAction
      OnUpdate = UpdateAcceptButtonAction
    end
    object actCreateFolder: TAction
      Caption = 'New Folder'
      OnExecute = ExecuteCreateFolderAction
      OnUpdate = UpdateCreateFolderAction
    end
    object actCancel: TAction
      Caption = 'Cancel'
      OnExecute = ExecuteCancelButtonAction
    end
  end
end
