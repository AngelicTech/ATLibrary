object dmAppServices: TdmAppServices
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 150
  Width = 215
  object aeMain: TApplicationEvents
    OnIdle = aeMainIdle
    Left = 48
    Top = 74
  end
end
