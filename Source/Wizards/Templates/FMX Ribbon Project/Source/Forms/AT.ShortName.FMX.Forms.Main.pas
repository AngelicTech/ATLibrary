unit AT.ShortName.FMX.Forms.Main;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.TMSFNCRibbon,
  FMX.TMSFNCTypes, FMX.TMSFNCUtils, FMX.TMSFNCGraphics,
  FMX.TMSFNCGraphicsTypes, FMX.Controls.Presentation, FMX.StdCtrls,
  FMX.TMSCustomControl, FMX.TMSTabSet, FMX.TMSPageControl,
  FMX.TMSFNCPageControl, FMX.TMSFNCTabSet, FMX.TMSFNCHTMLText,
  FMX.TMSFNCToolBar, FMX.TMSFNCCustomControl,
  FMX.TMSFNCCustomComponent, FMX.TMSFNCBitmapContainer, FMX.Objects,
  Radiant.Shapes, AT.FMX.ClockLabel;

type
  TfrmMain = class(TTMSFNCRibbonForm)
    ribMain: TTMSFNCRibbon;
    barQAT: TTMSFNCRibbonQAT;
    ribcapNain: TTMSFNCRibbonCaption;
  TMSFNCRibbon1BottomContainer: TTMSFNCRibbonBottomContainer;
    rsmicoSysMenu: TTMSFNCRibbonIcon;
    rsmButtons: TTMSFNCRibbonSystemMenu;
    rsmbtnHelp: TTMSFNCRibbonSystemMenuToolBarButton;
    rsmbtnMaxRestore: TTMSFNCRibbonSystemMenuToolBarButton;
    rsmbtnMinimize: TTMSFNCRibbonSystemMenuToolBarButton;
    rsmbtnClose: TTMSFNCRibbonSystemMenuToolBarButton;
  TMSFNCRibbon1Wrapper: TTMSFNCRibbonToolBarWrapper;
    ribpcMain: TTMSFNCRibbonPageControl;
  TMSFNCRibbon1PageControlFileButton: TTMSFNCRibbonFileButton;
    rctrTAT: TTMSFNCRibbonContainer;
  TMSFNCRibbon1PageControlPage0: TTMSFNCRibbonPageControlContainer;
    pcMain: TTMSFMXPageControl;
    barFile: TTMSFNCRibbonToolBar;
    cmdQATEditUndo: TTMSFNCRibbonDefaultToolBarButton;
    barClipboard: TTMSFNCRibbonToolBar;
    barEditing: TTMSFNCRibbonToolBar;
    bmpcRibbon: TTMSFNCBitmapContainer;
    cmdClipPaste: TTMSFNCRibbonDefaultToolBarButton;
    cmdClipCut: TTMSFNCRibbonDefaultToolBarButton;
    cmdClipCopy: TTMSFNCRibbonDefaultToolBarButton;
    cmdFileNewBlank: TTMSFNCRibbonDefaultToolBarButton;
    cmdFileOpen: TTMSFNCRibbonDefaultToolBarButton;
    cmdFileSaveDD: TTMSFNCRibbonDefaultToolBarButton;
    cmdQATEditRedo: TTMSFNCRibbonDefaultToolBarButton;
    sepQAT1: TTMSFNCRibbonToolBarSeparator;
    cmdQATNewBlank: TTMSFNCRibbonDefaultToolBarButton;
    cmdQATFileOpen: TTMSFNCRibbonDefaultToolBarButton;
    cmdQATFileSaveDD: TTMSFNCRibbonDefaultToolBarButton;
    rdntrctngl1: TRadiantRectangle;
    szgrp1: TSizeGrip;
    cmdEditUndo: TTMSFNCRibbonDefaultToolBarButton;
    cmdEditRedo: TTMSFNCRibbonDefaultToolBarButton;
    sepEdit1: TTMSFNCRibbonToolBarSeparator;
    cmdSearchFind: TTMSFNCRibbonDefaultToolBarButton;
    cmdSearchReplace: TTMSFNCRibbonDefaultToolBarButton;
    cmdSelectDD: TTMSFNCRibbonDefaultToolBarButton;
    cmdTATSearchFind: TTMSFNCRibbonDefaultToolBarButton;
    cmdTATSearchReplace: TTMSFNCRibbonDefaultToolBarButton;
    sep1: TTMSFNCRibbonToolBarSeparator;
    cmdTATHelpContents: TTMSFNCRibbonDefaultToolBarButton;
    barSaveDD: TTMSFNCRibbonToolBar;
    cmdFileSave: TTMSFNCRibbonDefaultToolBarButton;
    cmdFileSaveAs: TTMSFNCRibbonDefaultToolBarButton;
    cmdFileSaveAll: TTMSFNCRibbonDefaultToolBarButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.fmx}

uses AT.ShortName.DM.Images;

end.
