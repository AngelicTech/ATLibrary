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
      Data = True
    end
    object actHelpTOC: TATBooleanDataAction
      Category = 'Help'
      Caption = '$ProgramName$ Help'
      Hint = 'Display $ProgramName$'#39's help table of contents.'
      ImageIndex = 16
      ShortCut = 112
      OnExecute = ExecuteHelpTOCAction
      Data = True
    end
    object actTATHelpTOC: TATBooleanDataAction
      Category = 'Help'
      Caption = '$ProgramName$ Help'
      Hint = 'Display $ProgramName$'#39's help table of contents.'
      ImageIndex = 18
      ShortCut = 112
      OnExecute = ExecuteHelpTOCAction
      Data = True
    end
    object actUITouchMode: TATBooleanDataAction
      Category = 'UI'
      Caption = 'Touch Mode'
      ImageIndex = 78
      OnExecute = ExecuteTouchModeAction
      OnUpdate = UpdateTouchModeAction
      Data = True
    end
    object actUIQATTouchMode: TATBooleanDataAction
      Category = 'UI'
      Caption = 'Touch Mode'
      ImageIndex = 80
      OnExecute = ExecuteTouchModeAction
      OnUpdate = UpdateTouchModeAction
      Data = True
    end
    object actClipCopy: TATBooleanDataAction
      Category = 'Clipboard'
      Caption = 'Copy'
      Hint = 'Copy|Copy to clipboard.'
      ImageIndex = 1
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
      ImageIndex = 4
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
      ImageIndex = 34
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
      ImageIndex = 47
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
      ImageIndex = 49
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
      ImageIndex = 81
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
      ImageIndex = 83
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
      ImageIndex = 7
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
      ImageIndex = 9
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
      ImageIndex = 50
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
      ImageIndex = 52
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
      ImageIndex = 68
      OnExecute = ExecuteDoNothing
      OnUpdate = UpdateSelectAction
      Data = True
    end
    object actSelectAll: TATBooleanDataAction
      Category = 'Selection'
      Caption = 'Select All'
      Hint = 'Select All'
      ImageIndex = 69
      ShortCut = 16449
      OnExecute = ExecuteSelectAllAction
      OnUpdate = UpdateSelectAllAction
      Data = True
    end
    object actSelectInvert: TATBooleanDataAction
      Category = 'Selection'
      Caption = 'Invert Selection'
      Hint = 'Invert Selection'
      ImageIndex = 70
      OnExecute = ExecuteSelectInvertAction
      OnUpdate = UpdateSelectInvertAction
      Data = True
    end
    object actSelectNone: TATBooleanDataAction
      Category = 'Selection'
      Caption = 'Select None'
      Hint = 'Select None'
      ImageIndex = 71
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
      ImageIndex = 53
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
      ImageIndex = 55
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
      ImageIndex = 54
      Visible = False
      OnExecute = ExecuteRibbonModeAction
      OnUpdate = UpdateRibbonModeAction
      BooleanData = True
      DateTimeData = 42962.660137233800000000
      Int32Data = 2
      Int64Data = 0
    end
    object actFileNewBlank: TATBooleanDataAction
      Category = 'File'
      Caption = 'New'
      Hint = 'New|Create a new blank document.'
      ImageIndex = 28
      ShortCut = 16462
      OnExecute = ExecuteFileNewBlankAction
      Data = True
    end
    object actQATFileNewBlank: TATBooleanDataAction
      Category = 'File'
      Caption = 'New'
      Hint = 'New|Create a new blank document.'
      ImageIndex = 30
      ShortCut = 16462
      OnExecute = ExecuteFileNewBlankAction
      Data = True
    end
    object actFileOpen: TATBooleanDataAction
      Category = 'File'
      Caption = 'Open'
      Hint = 'Open|Open an existing document.'
      ImageIndex = 31
      ShortCut = 16463
      OnExecute = ExecuteFileOpenAction
      Data = True
    end
    object actQATFileOpen: TATBooleanDataAction
      Category = 'File'
      Caption = 'Open'
      Hint = 'Open|Open an existing document.'
      ImageIndex = 33
      ShortCut = 16463
      OnExecute = ExecuteFileOpenAction
      Data = True
    end
    object actFileSave: TATBooleanDataAction
      Category = 'File'
      Caption = 'Save'
      Hint = 'Save|Save the active document.'
      ImageIndex = 56
      ShortCut = 16467
      OnExecute = ExecuteFileSaveAction
      OnUpdate = UpdateFileSaveAction
      Data = True
    end
    object actQATFileSave: TATBooleanDataAction
      Category = 'File'
      Caption = 'Save'
      Hint = 'Save|Save the active document.'
      ImageIndex = 58
      ShortCut = 16467
      OnExecute = ExecuteFileSaveAction
      OnUpdate = UpdateFileSaveAction
    end
    object actFileSaveAs: TATBooleanDataAction
      Category = 'File'
      Caption = 'Save As'
      Hint = 'Save As|Save the active document with a new name.'
      ImageIndex = 62
      ShortCut = 49235
      OnExecute = ExecuteFileSaveAsAction
      OnUpdate = UpdateFileSaveAsAction
      Data = True
    end
    object actQATFileSaveAs: TATBooleanDataAction
      Category = 'File'
      Caption = 'Save As'
      Hint = 'Save As|Save the active document with a new name.'
      ImageIndex = 64
      ShortCut = 49235
      OnExecute = ExecuteFileSaveAsAction
      OnUpdate = UpdateFileSaveAsAction
      Data = True
    end
    object actFileSaveAll: TATBooleanDataAction
      Category = 'File'
      Caption = 'Save All'
      Hint = 'Save All|Save all open documents.'
      ImageIndex = 59
      ShortCut = 24659
      OnExecute = ExecuteFileSaveAllAction
      OnUpdate = UpdateFileSaveAllAction
      Data = True
    end
    object actQATFileSaveAll: TATBooleanDataAction
      Category = 'File'
      Caption = 'Save All'
      Hint = 'Save All|Save all open documents.'
      ImageIndex = 61
      ShortCut = 24659
      OnExecute = ExecuteFileSaveAllAction
      OnUpdate = UpdateFileSaveAllAction
      Data = True
    end
    object act1: TATBooleanDataAction
      Category = 'Angelic Technology.Data'
      Caption = 'act1'
    end
  end
end
