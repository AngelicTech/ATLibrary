inherited DNAForgotPasswordDlg: TDNAForgotPasswordDlg
  Caption = 'Forgot Password'
  ExplicitWidth = 566
  ExplicitHeight = 439
  PixelsPerInch = 96
  TextHeight = 13
  inherited gbxInstruct: TcxGroupBox
    inherited lblInstructCap: TcxLabel
      Caption = 'Please enter the e-mail address associated with your code.'
      Style.IsFontAssigned = True
    end
    inherited lblInstruct: TcxLabel
      Caption = 
        'You need to enter the e-mail address associated with this code s' +
        'o that we can lookup your current password and e-mail it to you.'
    end
  end
  inherited gpnlContents: TGridPanel
    inherited pnlContents: TPanel
      inherited gbxInfo: TcxGroupBox
        Caption = 'Account Information'
        object txtEmail: TcxButtonEdit
          AlignWithMargins = True
          Left = 18
          Top = 49
          Margins.Left = 16
          Margins.Top = 0
          Margins.Right = 16
          Margins.Bottom = 0
          Align = alTop
          AutoSize = False
          PopupMenu = puDlgEdit
          Properties.Buttons = <
            item
              Action = actClearEmail
              Kind = bkGlyph
              Width = 24
            end>
          Properties.Images = ilstDlg
          TabOrder = 0
          TextHint = 'Please enter your e-mail address.'
          OnExit = EditExit
          Height = 24
          Width = 326
        end
        object lblEmail: TcxLabel
          AlignWithMargins = True
          Left = 18
          Top = 32
          Margins.Left = 16
          Margins.Top = 14
          Margins.Right = 16
          Margins.Bottom = 0
          Align = alTop
          Caption = 'E-mail Address:'
          FocusControl = txtEmail
          Transparent = True
        end
      end
    end
  end
  inherited ilstDlg: TcxImageList
    FormatVersion = 1
  end
  inherited alstDlg: TActionList
    Top = 346
    object actClearEmail: TAction
      Caption = 'Clear E-mail Address'
      Hint = 'Clear E-mail Address'
      ImageIndex = 0
      OnExecute = actClearEmailExecute
    end
  end
  inherited barmgrDlg: TdxBarManager
    DockControlHeights = (
      0
      0
      0
      0)
  end
end
