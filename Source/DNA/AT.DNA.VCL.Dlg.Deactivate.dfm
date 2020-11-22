inherited DNADeactivateDlg: TDNADeactivateDlg
  Caption = 'Deactivate'
  ExplicitWidth = 566
  ExplicitHeight = 439
  PixelsPerInch = 96
  TextHeight = 13
  inherited gbxInstruct: TcxGroupBox
    inherited lblInstructCap: TcxLabel
      Caption = 'Enter the password associated with this code.'
      Style.IsFontAssigned = True
    end
    inherited lblInstruct: TcxLabel
      Caption = 
        'Please enter the password associated with this software'#39's code. ' +
        'Please note that it can take up to  72 hours for our servers to ' +
        'fully deactivate this code and make it available for re-activati' +
        'on on another computer.'
    end
  end
  inherited gpnlContents: TGridPanel
    inherited pnlContents: TPanel
      inherited gbxInfo: TcxGroupBox
        Caption = 'Authentication'
        object txtPassword: TcxButtonEdit
          AlignWithMargins = True
          Left = 18
          Top = 43
          Margins.Left = 16
          Margins.Top = 0
          Margins.Right = 16
          Margins.Bottom = 0
          Align = alTop
          AutoSize = False
          PopupMenu = puDlgEdit
          Properties.Buttons = <
            item
              Action = actPwdVisible
              Kind = bkGlyph
              Width = 24
            end
            item
              Action = actClearPwd
              Kind = bkGlyph
              Width = 24
            end>
          Properties.EchoMode = eemPassword
          Properties.Images = ilstDlg
          TabOrder = 0
          TextHint = 'Enter your password.'
          ExplicitWidth = 316
          Height = 24
          Width = 326
        end
        object lblPassword: TcxLabel
          AlignWithMargins = True
          Left = 18
          Top = 26
          Margins.Left = 16
          Margins.Top = 8
          Margins.Right = 16
          Margins.Bottom = 0
          Align = alTop
          Caption = 'Password:'
          FocusControl = txtPassword
          Transparent = True
        end
      end
    end
  end
  inherited ilstDlg: TcxImageList
    FormatVersion = 1
  end
  inherited alstDlg: TActionList
    object actClearPwd: TAction
      Caption = 'Clear Password'
      Hint = 'Clear Password'
      ImageIndex = 0
      OnExecute = actClearPwdExecute
    end
    object actPwdVisible: TAction
      Caption = 'Show Password'
      Hint = 'Show Password'
      ImageIndex = 1
      OnExecute = actPwdVisibleExecute
      OnUpdate = actPwdVisibleUpdate
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
