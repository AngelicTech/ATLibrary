inherited DNAActivationDlg: TDNAActivationDlg
  Caption = 'Product Activation'
  ClientHeight = 500
  ExplicitHeight = 529
  PixelsPerInch = 96
  TextHeight = 13
  inherited bevFooterDivide: TdxBevel
    Top = 436
    ExplicitTop = 376
  end
  inherited pnlButtons: TPanel
    Top = 440
    ExplicitTop = 440
  end
  inherited gbxInstruct: TcxGroupBox
    Top = 310
    ExplicitTop = 310
    inherited lblInstructCap: TcxLabel
      Caption = 'Please enter an e-mail address and password.'
      Style.IsFontAssigned = True
    end
    inherited lblInstruct: TcxLabel
      Caption = 
        'This information will be used to create an account that you can ' +
        'use to retrieve your activation information should you ever need' +
        ' to reinstall this software. NOTE: The password must be between ' +
        '1 and 16 characters [A-Z, a-z, 0-9, -, @]'
    end
  end
  inherited gpnlContents: TGridPanel
    Height = 278
    ExplicitHeight = 278
    inherited imgLogo: TImage
      Height = 278
      ExplicitHeight = 218
    end
    inherited pnlContents: TPanel
      Height = 278
      ExplicitHeight = 278
      inherited gbxInfo: TcxGroupBox
        Caption = 'Account Information'
        ExplicitHeight = 278
        object bevContentSep: TdxBevel
          AlignWithMargins = True
          Left = 18
          Top = 134
          Width = 326
          Height = 4
          Margins.Left = 16
          Margins.Top = 12
          Margins.Right = 16
          Margins.Bottom = 0
          Align = alTop
          Shape = dxbsLineBottom
          ExplicitLeft = 0
          ExplicitTop = 376
          ExplicitWidth = 550
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
          TabOrder = 1
          TextHint = 'Please enter your e-mail address.'
          OnExit = EditExit
          Height = 24
          Width = 326
        end
        object txtConfirmEmail: TcxButtonEdit
          AlignWithMargins = True
          Left = 18
          Top = 98
          Margins.Left = 16
          Margins.Top = 0
          Margins.Right = 16
          Margins.Bottom = 0
          Align = alTop
          AutoSize = False
          PopupMenu = puDlgEdit
          Properties.Buttons = <
            item
              Action = actClearConfirmEmail
              Kind = bkGlyph
              Width = 24
            end>
          Properties.Images = ilstDlg
          TabOrder = 3
          TextHint = 'Please confirm your e-mail address.'
          OnExit = EditExit
          Height = 24
          Width = 326
        end
        object lblConfirmEmail: TcxLabel
          AlignWithMargins = True
          Left = 18
          Top = 81
          Margins.Left = 16
          Margins.Top = 8
          Margins.Right = 16
          Margins.Bottom = 0
          Align = alTop
          Caption = 'Confirm E-mail Address:'
          FocusControl = txtConfirmEmail
          Transparent = True
        end
        object txtPassword: TcxButtonEdit
          AlignWithMargins = True
          Left = 18
          Top = 163
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
          TabOrder = 5
          TextHint = 'Please enter a password.'
          Height = 24
          Width = 326
        end
        object lblPassword: TcxLabel
          AlignWithMargins = True
          Left = 18
          Top = 146
          Margins.Left = 16
          Margins.Top = 8
          Margins.Right = 16
          Margins.Bottom = 0
          Align = alTop
          Caption = 'Password:'
          FocusControl = txtPassword
          Transparent = True
        end
        object lblConfirmPwd: TcxLabel
          AlignWithMargins = True
          Left = 18
          Top = 195
          Margins.Left = 16
          Margins.Top = 8
          Margins.Right = 16
          Margins.Bottom = 0
          Align = alTop
          Caption = 'Confirm Password:'
          FocusControl = txtConfirmPassword
          Transparent = True
        end
        object txtConfirmPassword: TcxButtonEdit
          AlignWithMargins = True
          Left = 18
          Top = 212
          Margins.Left = 16
          Margins.Top = 0
          Margins.Right = 16
          Margins.Bottom = 0
          Align = alTop
          AutoSize = False
          PopupMenu = puDlgEdit
          Properties.Buttons = <
            item
              Action = actPwdConfirmVisible
              Kind = bkGlyph
              Width = 24
            end
            item
              Action = actClearConfirmPwd
              Kind = bkGlyph
              Width = 24
            end>
          Properties.EchoMode = eemPassword
          Properties.Images = ilstDlg
          TabOrder = 7
          TextHint = 'Please confirm your password.'
          Height = 24
          Width = 326
        end
      end
    end
  end
  inherited ilstDlg: TcxImageList
    FormatVersion = 1
    DesignInfo = 29229186
  end
  inherited alstDlg: TActionList
    Left = 178
    Top = 454
    object actClearEmail: TAction
      Caption = 'Clear E-mail Address'
      Hint = 'Clear E-mail Address'
      ImageIndex = 0
      OnExecute = actClearEmailExecute
    end
    object actClearConfirmEmail: TAction
      Caption = 'Clear Confirm E-mail Address'
      Hint = 'Clear Confirm E-mail Address'
      ImageIndex = 0
      OnExecute = actClearConfirmEmailExecute
    end
    object actClearPwd: TAction
      Caption = 'Clear Password'
      Hint = 'Clear Password'
      ImageIndex = 0
      OnExecute = actClearPwdExecute
    end
    object actClearConfirmPwd: TAction
      Caption = 'Clear Confirm Password'
      Hint = 'Clear Confirm Password'
      ImageIndex = 0
      OnExecute = actClearConfirmPwdExecute
    end
    object actPwdVisible: TAction
      Caption = 'Show Password'
      Hint = 'Show Password'
      ImageIndex = 1
      OnExecute = actPwdVisibleExecute
      OnUpdate = actPwdVisibleUpdate
    end
    object actPwdConfirmVisible: TAction
      Caption = 'Show Confirm Password'
      Hint = 'Show Confirm Password'
      ImageIndex = 1
      OnExecute = actPwdConfirmVisibleExecute
      OnUpdate = actPwdConfirmVisibleUpdate
    end
  end
  inherited barmgrDlg: TdxBarManager
    Left = 6
    Top = 450
    DockControlHeights = (
      0
      0
      0
      0)
  end
  inherited puDlgEdit: TdxBarPopupMenu
    Left = 72
    Top = 448
  end
end
