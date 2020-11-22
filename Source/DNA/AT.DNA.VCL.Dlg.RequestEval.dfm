inherited DNARequestEvalDlg: TDNARequestEvalDlg
  Caption = 'Request Evaluation Code'
  ExplicitWidth = 566
  ExplicitHeight = 439
  PixelsPerInch = 96
  TextHeight = 13
  inherited gbxInstruct: TcxGroupBox
    inherited lblInstructCap: TcxLabel
      Caption = 'Please tell us where you want the evaluation code sent.'
      Style.IsFontAssigned = True
    end
    inherited lblInstruct: TcxLabel
      Caption = 
        'We need to know where you want the evaluation code sent. Please ' +
        'note that we will not sell, rent or transfer your e-mail address' +
        ' to any third-party.'
    end
  end
  inherited gpnlContents: TGridPanel
    inherited pnlContents: TPanel
      inherited gbxInfo: TcxGroupBox
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
      end
    end
  end
  inherited ilstDlg: TcxImageList
    FormatVersion = 1
  end
  inherited alstDlg: TActionList
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
  end
  inherited barmgrDlg: TdxBarManager
    DockControlHeights = (
      0
      0
      0
      0)
  end
end
