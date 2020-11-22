inherited DNAProxySettingsDlg: TDNAProxySettingsDlg
  Caption = 'Proxy Settings'
  ClientHeight = 450
  ExplicitWidth = 566
  ExplicitHeight = 479
  PixelsPerInch = 96
  TextHeight = 13
  inherited bevFooterDivide: TdxBevel
    AlignWithMargins = True
    Top = 386
    Margins.Left = 0
    Margins.Top = 16
    Margins.Right = 0
    Margins.Bottom = 0
    ExplicitTop = 560
  end
  inherited pnlButtons: TPanel
    Top = 390
    ExplicitTop = 390
  end
  inherited gbxInstruct: TcxGroupBox
    Top = 354
    Visible = False
    ExplicitTop = 354
    ExplicitHeight = 0
    Height = 0
    inherited lblInstructCap: TcxLabel
      Style.IsFontAssigned = True
    end
  end
  inherited gpnlContents: TGridPanel
    Height = 322
    ExplicitHeight = 322
    inherited imgLogo: TImage
      Height = 322
      ExplicitHeight = 402
    end
    inherited pnlContents: TPanel
      Height = 322
      ExplicitHeight = 322
      inherited gbxInfo: TcxGroupBox
        Align = alTop
        Caption = 'Proxy Server'
        ExplicitHeight = 163
        Height = 163
        object lblServerName: TcxLabel
          AlignWithMargins = True
          Left = 18
          Top = 32
          Margins.Left = 16
          Margins.Top = 14
          Margins.Right = 16
          Margins.Bottom = 0
          Align = alTop
          Caption = 'Server:'
          FocusControl = txtServerName
          Transparent = True
        end
        object txtServerName: TcxButtonEdit
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
              Action = actClearServer
              Kind = bkGlyph
              Width = 24
            end>
          Properties.Images = ilstDlg
          TabOrder = 1
          TextHint = 'Enter the proxy server name or IP address.'
          OnExit = EditExit
          Height = 24
          Width = 326
        end
        object lblServerPort: TcxLabel
          AlignWithMargins = True
          Left = 18
          Top = 87
          Margins.Left = 16
          Margins.Top = 14
          Margins.Right = 16
          Margins.Bottom = 0
          Align = alTop
          Caption = 'Port:'
          FocusControl = seServerPort
          Transparent = True
        end
        object seServerPort: TcxSpinEdit
          AlignWithMargins = True
          Left = 18
          Top = 104
          Margins.Left = 16
          Margins.Top = 0
          Margins.Right = 200
          Margins.Bottom = 0
          Align = alTop
          AutoSize = False
          Properties.Alignment.Horz = taCenter
          Properties.MaxValue = 65535.000000000000000000
          Properties.MinValue = 1.000000000000000000
          Properties.SpinButtons.Position = sbpHorzLeftRight
          Properties.SpinButtons.ShowFastButtons = True
          Properties.UseCtrlIncrement = True
          Properties.UseLeftAlignmentOnEditing = False
          TabOrder = 3
          Value = 80
          Height = 24
          Width = 142
        end
      end
      object gbxAuthenticate: TcxGroupBox
        AlignWithMargins = True
        Left = 16
        Top = 179
        Margins.Left = 16
        Margins.Top = 16
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alClient
        Caption = 'Authentication'
        PanelStyle.OfficeBackgroundKind = pobkStyleColor
        Style.Shadow = False
        TabOrder = 1
        Height = 143
        Width = 362
        object txtUserName: TcxButtonEdit
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
              Action = actClearUser
              Kind = bkGlyph
              Width = 24
            end>
          Properties.Images = ilstDlg
          TabOrder = 1
          TextHint = 'Enter your user name for the proxy server.'
          OnExit = EditExit
          Height = 24
          Width = 326
        end
        object lblUserName: TcxLabel
          AlignWithMargins = True
          Left = 18
          Top = 32
          Margins.Left = 16
          Margins.Top = 14
          Margins.Right = 16
          Margins.Bottom = 0
          Align = alTop
          Caption = 'User Name:'
          FocusControl = txtServerName
          Transparent = True
        end
        object lblPassword: TcxLabel
          AlignWithMargins = True
          Left = 18
          Top = 81
          Margins.Left = 16
          Margins.Top = 8
          Margins.Right = 16
          Margins.Bottom = 0
          Align = alTop
          Caption = 'Password:'
          FocusControl = txtPassword
          Transparent = True
        end
        object txtPassword: TcxButtonEdit
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
          TabOrder = 3
          TextHint = 'Please enter a password.'
          Height = 24
          Width = 326
        end
      end
    end
  end
  inherited ilstDlg: TcxImageList
    FormatVersion = 1
    DesignInfo = 12058672
  end
  inherited alstDlg: TActionList
    Left = 100
    Top = 186
    object actClearServer: TAction
      Caption = 'Clear Server'
      Hint = 'Clear Server'
      ImageIndex = 0
      OnExecute = actClearServerExecute
    end
    object actClearUser: TAction
      Caption = 'Clear User Name'
      Hint = 'Clear User Name'
      ImageIndex = 0
      OnExecute = actClearUserExecute
    end
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
    Left = 40
    Top = 254
    DockControlHeights = (
      0
      0
      0
      0)
  end
  inherited puDlgEdit: TdxBarPopupMenu
    Left = 110
    Top = 254
  end
end
