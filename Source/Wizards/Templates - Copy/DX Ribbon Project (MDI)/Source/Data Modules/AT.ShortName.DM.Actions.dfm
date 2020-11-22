object dmActions: TdmActions
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 211
  Width = 265
  object alstMain: TActionList
    Images = dmImages.ilstSmall
    OnExecute = ExecuteActionListAction
    OnUpdate = UpdateActionListActions
    Left = 48
    Top = 135
    object actKbdCapsState: TATBooleanDataAction
      Category = 'Keyboard States'
      Caption = 'Caps'
      OnExecute = ExecuteCapsStateAction
      OnUpdate = UpdateCapsStateAction
      Data = True
    end
    object actKbdNumState: TATBooleanDataAction
      Category = 'Keyboard States'
      Caption = 'Num'
      OnExecute = ExecuteNumStateAction
      OnUpdate = UpdateNumStateAction
      Data = True
    end
    object actKbdScrlState: TATBooleanDataAction
      Category = 'Keyboard States'
      Caption = 'Scrl'
      OnExecute = ExecuteScrollStateAction
      OnUpdate = UpdateSrollStateAction
      Data = True
    end
    object actKbdOvrMode: TATBooleanDataAction
      Category = 'Keyboard States'
      Caption = 'Ins'
      Hint = 'Insert Mode'
      Visible = False
      OnExecute = ExecuteInsModeStateAction
      OnUpdate = UpdateInsModeStateAction
    end
    object actHelpTOC: TATBooleanDataAction
      Category = 'Help'
      Caption = '$ProgramName$ Help'
      Hint = 'Display @Document'#39's help table of contents.'
      ImageIndex = 0
      ShortCut = 112
      OnExecute = ExecuteHelpTOCAction
      Data = True
    end
    object actTATHelpTOC: TATBooleanDataAction
      Category = 'Help'
      Caption = '$ProgramName$ Help'
      Hint = 'Display @Document'#39's help table of contents.'
      ImageIndex = 2
      ShortCut = 112
      OnExecute = ExecuteHelpTOCAction
      Data = True
    end
    object actUITouchMode: TATBooleanDataAction
      Category = 'UI'
      Caption = 'Touch Mode'
      ImageIndex = 33
      OnExecute = ExecuteTouchModeAction
      OnUpdate = UpdateTouchModeAction
      Data = True
    end
    object actUIQATTouchMode: TATBooleanDataAction
      Category = 'UI'
      Caption = 'Touch Mode'
      ImageIndex = 35
      OnExecute = ExecuteTouchModeAction
      OnUpdate = UpdateTouchModeAction
      Data = True
    end
    object actClipCopy: TATBooleanDataAction
      Category = 'Clipboard'
      Caption = 'Copy'
      Hint = 'Copy|Copy to clipboard.'
      ImageIndex = 7
      ShortCut = 16451
      Visible = False
      OnExecute = ExecuteClipCopyAction
      OnUpdate = UpdateClipCopyAction
      Data = True
    end
    object actClipCut: TATBooleanDataAction
      Category = 'Clipboard'
      Caption = 'Cut'
      Hint = 'Cut'
      ImageIndex = 8
      ShortCut = 16472
      Visible = False
      OnExecute = ExecuteClipCutAction
      OnUpdate = UpdateClipCutAction
      Data = True
    end
    object actClipPaste: TATBooleanDataAction
      Category = 'Clipboard'
      Caption = 'Paste'
      Hint = 'Paste'
      ImageIndex = 9
      ShortCut = 16470
      Visible = False
      OnExecute = ExecuteClipPasteAction
      OnUpdate = UpdateClipPasteAction
      Data = True
    end
    object actEditRedo: TATBooleanDataAction
      Category = 'Undo'
      Caption = 'Redo'
      Hint = 'Redo'
      ImageIndex = 10
      ShortCut = 16473
      Visible = False
      OnExecute = ExecuteEditRedoAction
      OnUpdate = UpdateEditRedoAction
      Data = True
    end
    object actQATEditRedo: TATBooleanDataAction
      Category = 'Undo'
      Caption = 'Redo'
      Hint = 'Redo'
      ImageIndex = 12
      ShortCut = 16473
      Visible = False
      OnExecute = ExecuteEditRedoAction
      OnUpdate = UpdateEditRedoAction
      Data = True
    end
    object actEditUndo: TATBooleanDataAction
      Category = 'Undo'
      Caption = 'Undo'
      Hint = 'Undo'
      ImageIndex = 13
      ShortCut = 16474
      Visible = False
      OnExecute = ExecuteEditUndoAction
      OnUpdate = UpdateEditUndoAction
      Data = True
    end
    object actQATEditUndo: TATBooleanDataAction
      Category = 'Undo'
      Caption = 'Undo'
      Hint = 'Undo'
      ImageIndex = 15
      ShortCut = 16474
      Visible = False
      OnExecute = ExecuteEditUndoAction
      OnUpdate = UpdateEditUndoAction
      Data = True
    end
    object actSearchFind: TATBooleanDataAction
      Category = 'Search'
      Caption = 'Find'
      Hint = 'Find'
      ImageIndex = 16
      ShortCut = 16454
      Visible = False
      OnExecute = ExecuteSearchFindAction
      OnUpdate = UpdateSearchFindAction
      Data = True
    end
    object actTATSearchFind: TATBooleanDataAction
      Category = 'Search'
      Caption = 'Find'
      Hint = 'Find'
      ImageIndex = 37
      ShortCut = 16454
      Visible = False
      OnExecute = ExecuteSearchFindAction
      OnUpdate = UpdateSearchFindAction
      Data = True
    end
    object actSearchReplace: TATBooleanDataAction
      Category = 'Search'
      Caption = 'Replace'
      Hint = 'Replace'
      ImageIndex = 25
      ShortCut = 16456
      Visible = False
      OnExecute = ExecuteSearchReplaceAction
      OnUpdate = UpdateSearchReplaceAction
      Data = True
    end
    object actTATSearchReplace: TATBooleanDataAction
      Category = 'Search'
      Caption = 'Replace'
      Hint = 'Replace'
      ImageIndex = 39
      ShortCut = 16456
      Visible = False
      OnExecute = ExecuteSearchReplaceAction
      OnUpdate = UpdateSearchReplaceAction
      Data = True
    end
    object actSelect: TATBooleanDataAction
      Category = 'Selection'
      Caption = 'Select'
      Hint = 'Select'
      ImageIndex = 27
      OnExecute = ExecuteDoNothing
      OnUpdate = UpdateSelectAction
      Data = True
    end
    object actSelectAll: TATBooleanDataAction
      Category = 'Selection'
      Caption = 'Select All'
      Hint = 'Select All'
      ImageIndex = 28
      ShortCut = 16449
      OnExecute = ExecuteSelectAllAction
      OnUpdate = UpdateSelectAllAction
      Data = True
    end
    object actSelectInvert: TATBooleanDataAction
      Category = 'Selection'
      Caption = 'Invert Selection'
      Hint = 'Invert Selection'
      ImageIndex = 29
      OnExecute = ExecuteSelectInvertAction
      OnUpdate = UpdateSelectInvertAction
      Data = True
    end
    object actSelectNone: TATBooleanDataAction
      Category = 'Selection'
      Caption = 'Select None'
      Hint = 'Select None'
      ImageIndex = 30
      OnExecute = ExecuteSelectNoneAction
      OnUpdate = UpdateSelectNoneAction
      Data = True
    end
    object actUIRibbon: TATBooleanDataAction
      Category = 'Ribbon'
      Caption = 'Ribbon'
      Hint = 'Ribbon'
      Visible = False
      OnExecute = ExecuteDoNothing
      OnUpdate = UpdateRibbonAction
      Data = True
    end
    object actUIStatusBar: TATBooleanDataAction
      Category = 'UI'
      Caption = 'Status Bar'
      Hint = 'Show/Hide Status Bar'
      Visible = False
      OnExecute = ExecuteUIStatusBarAction
      OnUpdate = UpdateUIStatusBarAction
      Data = True
    end
    object actUIRibModeAH: TATMultiDataAction
      Category = 'Ribbon'
      Caption = 'Auto-Hide Ribbon'
      Hint = 'Automatically hide the ribbon.'
      ImageIndex = 40
      Visible = False
      OnExecute = ExecuteRibbonModeAction
      OnUpdate = UpdateRibbonModeAction
      BooleanData = True
      DateTimeData = 42962.660104305560000000
      Int32Data = 0
      Int64Data = 0
    end
    object actUIRibModeTO: TATMultiDataAction
      Tag = 1
      Category = 'Ribbon'
      Caption = 'Show Tabs'
      Hint = 'Show only tabs.'
      ImageIndex = 41
      Visible = False
      OnExecute = ExecuteRibbonModeAction
      OnUpdate = UpdateRibbonModeAction
      BooleanData = True
      DateTimeData = 42962.660137233800000000
      Int32Data = 1
      Int64Data = 0
    end
    object actUIRibModeTC: TATMultiDataAction
      Tag = 1
      Category = 'Ribbon'
      Caption = 'Show Tabs and Commands'
      Hint = 'Show tabs and commands.'
      ImageIndex = 42
      Visible = False
      OnExecute = ExecuteRibbonModeAction
      OnUpdate = UpdateRibbonModeAction
      BooleanData = True
      DateTimeData = 42962.660137233800000000
      Int32Data = 2
      Int64Data = 0
    end
  end
end
