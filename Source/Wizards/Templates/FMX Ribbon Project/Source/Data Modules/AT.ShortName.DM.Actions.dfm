object dmActions: TdmActions
  OldCreateOrder = False
  Height = 150
  Width = 215
  object alstMain: TActionList
    Left = 40
    Top = 56
    object actAppExit: TFileExit
      Category = 'File'
      Hint = 'Quit|Quits the application'
      ImageIndex = 43
      ImageIndex = 43
    end
    object actAppHide: TFileHideApp
      Category = 'File'
      Hint = 'Hide|Hide current application'
    end
    object actAppHideOthers: TFileHideAppOthers
      Category = 'File'
      Hint = 'Hide Others|Hide all other applications'
    end
    object actAppAbout: TAction
      Category = 'File'
      Text = 'About OSXProper'
    end
    object actAppPreferences: TAction
      Category = 'File'
      Text = 'Preferences...'
    end
  end
end
