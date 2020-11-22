object frmATDXRibbonProjWiz: TfrmATDXRibbonProjWiz
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'New Angelic Technology DX Ribbon Project'
  ClientHeight = 500
  ClientWidth = 500
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  Position = poMainFormCenter
  ScreenSnap = True
  ShowHint = True
  PixelsPerInch = 96
  TextHeight = 13
  object wizMain: TdxWizardControl
    Left = 0
    Top = 0
    Width = 500
    Height = 500
    AutoSize = True
    Buttons.CustomButtons.Buttons = <>
    Buttons.Help.Visible = False
    ViewStyle = wcvsAero
    OnButtonClick = WizardButtonClicked
    object wizpgPgmInfo: TdxWizardControlPage
      Header.Title = 'Program Information'
      Header.Description = ''
      object pnlPgmInfo: TRelativePanel
        Left = 0
        Top = 0
        Width = 453
        Height = 337
        ControlCollection = <
          item
            Control = lblProgramName
            AlignBottomWithPanel = False
            AlignHorizontalCenterWithPanel = False
            AlignLeftWithPanel = True
            AlignRightWithPanel = False
            AlignTopWithPanel = True
            AlignVerticalCenterWithPanel = False
          end
          item
            Control = txtProgramName
            AlignBottomWithPanel = False
            AlignHorizontalCenterWithPanel = False
            AlignLeftWithPanel = True
            AlignRightWithPanel = True
            AlignTopWithPanel = False
            AlignVerticalCenterWithPanel = False
            Below = lblProgramName
          end
          item
            Control = lblPgmShortName
            AlignBottomWithPanel = False
            AlignHorizontalCenterWithPanel = False
            AlignLeftWithPanel = True
            AlignRightWithPanel = False
            AlignTopWithPanel = False
            AlignVerticalCenterWithPanel = False
            Below = txtProgramName
          end
          item
            Control = msktxtPgmShortName
            AlignBottomWithPanel = False
            AlignHorizontalCenterWithPanel = False
            AlignLeftWithPanel = True
            AlignRightWithPanel = True
            AlignTopWithPanel = False
            AlignVerticalCenterWithPanel = False
            Below = lblPgmShortName
          end
          item
            Control = lblPgmDescription
            AlignBottomWithPanel = False
            AlignHorizontalCenterWithPanel = False
            AlignLeftWithPanel = True
            AlignRightWithPanel = False
            AlignTopWithPanel = False
            AlignVerticalCenterWithPanel = False
            Below = msktxtPgmShortName
          end
          item
            Control = memPgmDescription
            AlignBottomWithPanel = False
            AlignHorizontalCenterWithPanel = False
            AlignLeftWithPanel = True
            AlignRightWithPanel = True
            AlignTopWithPanel = False
            AlignVerticalCenterWithPanel = False
            Below = lblPgmDescription
          end>
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        DesignSize = (
          453
          337)
        object lblProgramName: TcxLabel
          AlignWithMargins = True
          Left = 8
          Top = 8
          Margins.Left = 8
          Margins.Top = 8
          Margins.Right = 0
          Margins.Bottom = 0
          Anchors = []
          Caption = 'Program Name:'
          FocusControl = txtProgramName
          Transparent = True
        end
        object txtProgramName: TcxTextEdit
          AlignWithMargins = True
          Left = 8
          Top = 25
          Margins.Left = 8
          Margins.Top = 0
          Margins.Right = 8
          Margins.Bottom = 8
          Anchors = []
          TabOrder = 1
          Text = 'txtProgramName'
          Width = 437
        end
        object lblPgmShortName: TcxLabel
          AlignWithMargins = True
          Left = 8
          Top = 62
          Margins.Left = 8
          Margins.Top = 8
          Margins.Right = 0
          Margins.Bottom = 0
          Anchors = []
          Caption = 'Short Name:'
          FocusControl = msktxtPgmShortName
          Transparent = True
        end
        object msktxtPgmShortName: TcxMaskEdit
          AlignWithMargins = True
          Left = 8
          Top = 79
          Margins.Left = 8
          Margins.Top = 0
          Margins.Right = 8
          Margins.Bottom = 8
          Anchors = []
          Properties.MaskKind = emkRegExpr
          Properties.EditMask = '[a-zA-Z]+'
          TabOrder = 3
          Text = 'msktxtPgmShortName'
          Width = 437
        end
        object lblPgmDescription: TcxLabel
          AlignWithMargins = True
          Left = 8
          Top = 116
          Margins.Left = 8
          Margins.Top = 8
          Margins.Right = 0
          Margins.Bottom = 0
          Anchors = []
          Caption = 'Description:'
          FocusControl = memPgmDescription
          Transparent = True
        end
        object memPgmDescription: TcxMemo
          AlignWithMargins = True
          Left = 8
          Top = 133
          Margins.Left = 8
          Margins.Top = 0
          Margins.Right = 8
          Margins.Bottom = 8
          Anchors = []
          Lines.Strings = (
            'memPgmDescription')
          Properties.ScrollBars = ssVertical
          TabOrder = 5
          Height = 164
          Width = 437
        end
      end
    end
    object wizpgPlatforms: TdxWizardControlPage
      Header.Title = 'Platforms'
      Header.Description = ''
      object pnlPlatforms: TRelativePanel
        Left = 0
        Top = 0
        Width = 453
        Height = 337
        ControlCollection = <
          item
            Control = chkPlatformWin32
            AlignBottomWithPanel = False
            AlignHorizontalCenterWithPanel = False
            AlignLeftWithPanel = True
            AlignRightWithPanel = False
            AlignTopWithPanel = True
            AlignVerticalCenterWithPanel = False
          end
          item
            Control = chkPlatformWin64
            AlignBottomWithPanel = False
            AlignHorizontalCenterWithPanel = False
            AlignLeftWithPanel = True
            AlignRightWithPanel = False
            AlignTopWithPanel = False
            AlignVerticalCenterWithPanel = False
            Below = chkPlatformWin32
          end>
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        DesignSize = (
          453
          337)
        object chkPlatformWin32: TdxToggleSwitch
          AlignWithMargins = True
          Left = 8
          Top = 8
          Margins.Left = 8
          Margins.Top = 8
          Margins.Right = 8
          Margins.Bottom = 8
          Anchors = []
          Caption = '32-bit Windows'
          Checked = False
          Properties.ImmediatePost = True
          TabOrder = 0
          Transparent = True
          Width = 155
        end
        object chkPlatformWin64: TdxToggleSwitch
          AlignWithMargins = True
          Left = 8
          Top = 45
          Margins.Left = 8
          Margins.Top = 8
          Margins.Right = 8
          Margins.Bottom = 8
          Anchors = []
          Caption = '64-bit Windows'
          Checked = False
          Properties.ImmediatePost = True
          TabOrder = 1
          Transparent = True
          Width = 155
        end
      end
    end
    object wizpgProjInfo: TdxWizardControlPage
      Header.Title = 'Project Information'
      Header.Description = ''
      object pnlProjInfo: TRelativePanel
        Left = 0
        Top = 0
        Width = 453
        Height = 337
        ControlCollection = <
          item
            Control = lblProjFolder
            AlignBottomWithPanel = False
            AlignHorizontalCenterWithPanel = False
            AlignLeftWithPanel = True
            AlignRightWithPanel = False
            AlignTopWithPanel = True
            AlignVerticalCenterWithPanel = False
          end
          item
            Control = txtProjFolder
            AlignBottomWithPanel = False
            AlignHorizontalCenterWithPanel = False
            AlignLeftWithPanel = True
            AlignRightWithPanel = True
            AlignTopWithPanel = False
            AlignVerticalCenterWithPanel = False
            Below = lblProjFolder
          end
          item
            Control = txtProjName
            AlignBottomWithPanel = False
            AlignHorizontalCenterWithPanel = False
            AlignLeftWithPanel = True
            AlignRightWithPanel = False
            AlignTopWithPanel = False
            AlignVerticalCenterWithPanel = False
            Below = lblProjName
          end
          item
            Control = lblProjName
            AlignBottomWithPanel = False
            AlignHorizontalCenterWithPanel = False
            AlignLeftWithPanel = True
            AlignRightWithPanel = False
            AlignTopWithPanel = False
            AlignVerticalCenterWithPanel = False
            Below = txtProjFolder
          end>
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        DesignSize = (
          453
          337)
        object lblProjFolder: TcxLabel
          AlignWithMargins = True
          Left = 8
          Top = 8
          Margins.Left = 8
          Margins.Top = 8
          Margins.Right = 0
          Margins.Bottom = 0
          Anchors = []
          Caption = 'Project Folder:'
          FocusControl = txtProgramName
          Transparent = True
        end
        object txtProjFolder: TcxButtonEdit
          AlignWithMargins = True
          Left = 8
          Top = 25
          Margins.Left = 8
          Margins.Top = 0
          Margins.Right = 8
          Margins.Bottom = 8
          Anchors = []
          Properties.Buttons = <
            item
              Action = actSelectFolder
              Default = True
              Glyph.SourceDPI = 96
              Glyph.Data = {
                89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
                6100000018744558745469746C65004F70656E3B4F70656E446F63756D656E74
                3B7D89C0140000006D49444154785EB5D3A10D85501483E1CE81C0C1504FE058
                8071103CC5262C010912CB0A879A935C03246D10BFFD928A2222AC7CE05C86B8
                090F7D0EBC6703392581834129819955C2943D819EFD04E09F40CB4601E850EC
                5F05A086B39F01C6FE298146DD5F029BB29FF96FBC00F142E965128A526B0000
                000049454E44AE426082}
              Kind = bkGlyph
            end>
          TabOrder = 1
          Text = 'txtProjFolder'
          Width = 437
        end
        object txtProjName: TcxTextEdit
          AlignWithMargins = True
          Left = 8
          Top = 79
          Margins.Left = 8
          Margins.Top = 0
          Margins.Right = 8
          Margins.Bottom = 8
          Anchors = []
          TabOrder = 2
          Text = 'txtProjName'
          Width = 437
        end
        object lblProjName: TcxLabel
          AlignWithMargins = True
          Left = 8
          Top = 62
          Margins.Left = 8
          Margins.Top = 8
          Margins.Right = 0
          Margins.Bottom = 0
          Anchors = []
          Caption = 'Project Name:'
          FocusControl = txtProjName
          Transparent = True
        end
      end
    end
  end
  object sknctlrMain: TdxSkinController
    NativeStyle = False
    SkinName = 'Office2016Colorful'
    Left = 124
    Top = 424
  end
  object alstMain: TActionList
    Left = 48
    Top = 424
    object actSelectFolder: TBrowseForFolder
      Category = 'File'
      Caption = 'Select Project Folder'
      DialogCaption = 'Select Project Folder'
      BrowseOptions = [bifNewDialogStyle, bifUseNewUI]
      BrowseOptionsEx = []
      BeforeExecute = actSelectFolderBeforeExecute
      OnAccept = actSelectFolderAccept
    end
  end
end
