object DlgServices: TDlgServices
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 190
  Width = 198
  object dlgSave: TSaveDialog
    Filter = 'All Files (*.*)|*.*'
    FilterIndex = 5
    Options = [ofHideReadOnly, ofPathMustExist, ofEnableSizing]
    Left = 124
    Top = 114
  end
  object dlgOpen: TOpenDialog
    Filter = 'All Files (*.*)|*.*'
    Left = 48
    Top = 114
  end
  object tskdlg1: TTaskDialog
    Buttons = <>
    RadioButtons = <>
    Left = 80
    Top = 48
  end
end
