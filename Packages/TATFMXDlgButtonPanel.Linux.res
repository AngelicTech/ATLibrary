        ��  ��                  V  P   ��
 A T F M X D L G B U T T O N P A N E L S T Y L E         0 	        object RectangleButtonPanel: TRectangle
  StyleName = 'ATFMXDlgButtonPanelStyle'
  Align = MostBottom
  Fill.Kind = None
  Position.Y = 432.000000000000000000
  Size.Width = 600.000000000000000000
  Size.Height = 48.000000000000000000
  Size.PlatformDefault = False
  Stroke.Kind = None
  object FlowLayoutButtonPanel: TFlowLayout
    Align = Client
    Position.Y = 16.000000000000000000
    Size.Width = 288.000000000000000000
    Size.Height = 32.000000000000000000
    Size.PlatformDefault = False
    TabOrder = 0
    Justify = Right
    JustifyLastLine = Right
    FlowDirection = LeftToRight
    object DoButton: TButton
      StyleName = 'DoButton'
      Default = True
      ModalResult = 1
      Margins.Right = 10.000000000000000000
      Position.X = 370.000000000000000000
      TabOrder = 0
      Text = 'Do Verb'
    end
    object DontButton: TButton
      StyleName = 'DontButton'
      ModalResult = -1
      Margins.Right = 10.000000000000000000
      Position.X = 460.000000000000000000
      TabOrder = 1
      Text = 'Don'#39't Verb'
    end
    object CancelButton: TButton
      StyleName = 'CancelButton'
      Cancel = True
      ModalResult = 2
      Margins.Right = 10.000000000000000000
      Position.X = 550.000000000000000000
      TabOrder = 2
      Text = 'Cancel'
    end
  end
end

  