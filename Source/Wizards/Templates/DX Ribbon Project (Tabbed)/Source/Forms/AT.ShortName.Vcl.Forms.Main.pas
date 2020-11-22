// ******************************************************************
//
// Program Name   : $ProgramName$
// Platform(s)    : $Platforms$
// Framework      : VCL
//
// Filename       : AT.$ShortName$.Vcl.Forms.Main.pas/.dfm
// File Version   : 1.00
// Date Created   : $CreateDate$
// Author         : Matthew Vesperman
//
// Description:
//
// $ProgramName$'s main UI form.
//
// Revision History:
//
// v1.00   :   Initial version
//
// ******************************************************************
//
// COPYRIGHT © $Year$ - PRESENT Angelic Technology
// ALL RIGHTS RESERVED WORLDWIDE
//
// ******************************************************************

/// <summary>
///   $ProgramName$'s main form class.
/// </summary>
unit AT.ShortName.Vcl.Forms.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  dxBar, dxRibbon, dxRibbonForm, dxRibbonSkins, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxClasses,
  dxRibbonBackstageView, cxBarEditItem, dxSkinsCore, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light,
  dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue,
  dxSkinsdxRibbonPainter, dxRibbonCustomizationForm,
  dxSkinscxPCPainter, dxSkinsdxBarPainter, cxContainer, cxEdit,
  dxSkinsForm, dxStatusBar, dxRibbonStatusBar, cxLabel, dxGallery,
  dxGalleryControl, dxRibbonBackstageViewGalleryControl,
  AT.ShortName.Intf, Vcl.StdCtrls, cxPC, dxBarBuiltInMenu,
  cxCheckBox, AT.ShortName.Types, dxScreenTip,
  AT.ShortName.DM.Services.Application,
  AT.ShortName.Vcl.Forms.Generic.TabForm, dxSkinBlack, dxSkinBlue,
  dxSkinSilver;

type
  /// <summary>
  ///   Defines the main form class.
  /// </summary>
  TfrmMain = class(TdxRibbonForm, IATMainTabUI, IATMainCloseQuery,
      IATMainCloseChildren, IATMainCloseChildrenQuery,
      IATMainRibbon, IATMainRibbonMerge, IATMainRibbonQuery,
      IATMainUI, IATMainUICaps, IATMainUIQuery, IATThemedForm,
      IATTabCaptionChanged)
    barClipboard: TdxBar;
    barEditing: TdxBar;
    barFile: TdxBar;
    barHelp: TdxBar;
    barKbdState: TdxBar;
    barmgrMain: TdxBarManager;
    barQAT: TdxBar;
    barTAT: TdxBar;
    barUI: TdxBar;
    bsvMain: TdxRibbonBackstageView;
    cmdClipCopy: TdxBarLargeButton;
    cmdClipCut: TdxBarLargeButton;
    cmdClipPaste: TdxBarLargeButton;
    cmdEditRedo: TdxBarLargeButton;
    cmdEditUndo: TdxBarLargeButton;
    cmdFileNewBlank: TdxBarLargeButton;
    cmdFileOpen: TdxBarLargeButton;
    cmdFileSave: TdxBarLargeButton;
    cmdFileSaveAll: TdxBarLargeButton;
    cmdFileSaveAs: TdxBarLargeButton;
    cmdFileSaveDD: TdxBarLargeButton;
    cmdHelpContents: TdxBarLargeButton;
    cmdKbdCapsState: TdxBarButton;
    cmdKbdInsOvr: TdxBarButton;
    cmdKbdNumState: TdxBarButton;
    cmdKbdScrlState: TdxBarButton;
    cmdQATEditRedo: TdxBarButton;
    cmdQATEditUndo: TdxBarButton;
    cmdQATFileOpen: TdxBarButton;
    cmdQATFileSave: TdxBarButton;
    cmdQATFileSaveAll: TdxBarButton;
    cmdQATFileSaveAs: TdxBarButton;
    cmdQATFileSaveDD: TdxBarButton;
    cmdQATNewBlank: TdxBarButton;
    cmdSearchFind: TdxBarLargeButton;
    cmdSearchReplace: TdxBarLargeButton;
    cmdSelectAll: TdxBarLargeButton;
    cmdSelectDD: TdxBarSubItem;
    cmdSelectInvert: TdxBarLargeButton;
    cmdSelectNone: TdxBarLargeButton;
    cmdTATHelpContents: TdxBarButton;
    cmdTATSearchFind: TdxBarButton;
    cmdTATSearchReplace: TdxBarButton;
    cmdUIQATTouchMode: TdxBarButton;
    cmdUIRibbonDD: TdxBarSubItem;
    cmdUIRibModeAH: TdxBarLargeButton;
    cmdUIRibModeTC: TdxBarLargeButton;
    cmdUIRibModeTO: TdxBarLargeButton;
    cmdUIStatusBar: TdxBarLargeButton;
    cmdUITouchMode: TdxBarLargeButton;
    pcMain: TcxPageControl;
    puFileSaveDD: TdxRibbonPopupMenu;
    ribMain: TdxRibbon;
    ribtabHelp: TdxRibbonTab;
    ribtabHome: TdxRibbonTab;
    ribtabView: TdxRibbonTab;
    sbarMain: TdxRibbonStatusBar;
    /// <summary>
    ///   Occurs when the form closes.
    /// </summary>
    /// <remarks>
    ///   <para>
    ///     This handler first checks to see if the child windows
    ///     can close.
    ///   </para>
    ///   <para>
    ///     If the child forms can close then they are told to
    ///     close.
    ///   </para>
    ///   <para>
    ///     If any child form can not close the application is
    ///     prevented from closing.
    ///   </para>
    /// </remarks>
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    /// <summary>
    ///   Occurs when the form is shown .
    /// </summary>
    /// <remarks>
    ///   This event handler tells the splash screen to hide itself
    ///   after 500 milliseconds.
    /// </remarks>
    procedure FormShow(Sender: TObject);
    procedure pcMainCanCloseEx(Sender: TObject; ATabIndex: Integer; var
        ACanClose: Boolean);
    procedure pcMainChange(Sender: TObject);
    procedure pcMainGetTabHint(Sender: TObject; ATabIndex: Integer; var
        AHint: String; var ACanShow: Boolean);
    procedure pcMainPageChanging(Sender: TObject; NewPage: TcxTabSheet;
        var AllowChange: Boolean);
    /// <summary>
    ///   This event opens the local help file and displays its table
    ///   of contents.
    /// </summary>
    /// <remarks>
    ///   This event handler is fired when the user clicks the help
    ///   icon in the window caption.
    /// </remarks>
    procedure ribMainHelpButtonClick(Sender: TdxCustomRibbon);
    /// <summary>
    ///   Fires after an active Ribbon tab has been changed.
    /// </summary>
    /// <remarks>
    ///   This event handler tells the active child form which ribbon
    ///   tab is active for that form.
    /// </remarks>
    procedure ribMainTabChanged(Sender: TdxCustomRibbon);
  strict private
    /// <summary>
    ///   Stores a flag indicating if the main form is in the process
    ///   of closing.
    /// </summary>
    FIsClosing: Boolean;
    FRibbonUpdate: Boolean;
    /// <summary>
    ///   Stores a flag indicating if the main form wants to close.
    /// </summary>
    FWantsToClose: Boolean;
  strict protected
    procedure AddTabChild(ATabSheet: TcxTabSheet);
    procedure AddTabFormChild(AFormClass: TfrmGenericTabFormClass);
    procedure AddTabFrameChild(AFrameClass: TCustomFrameClass);
    /// <summary>
    ///   This method is called after a child form merges its ribbon
    ///   with the main form's ribbon.
    /// </summary>
    procedure AfterRibbonMerge;
    /// <summary>
    ///   This method is called after a child form unmerges its
    ///   ribbon from the main form's ribbon.
    /// </summary>
    procedure AfterRibbonUnmerge;
    /// <summary>
    ///   This method is called before a child form merges its ribbon
    ///   with the main form's ribbon.
    /// </summary>
    procedure BeforeRibbonMerge;
    /// <summary>
    ///   This method is called before a child form unmerges its
    ///   ribbon from the main form's ribbon.
    /// </summary>
    procedure BeforeRibbonUnmerge;
    procedure BeginUpdate;
    /// <summary>
    ///   This method will tell the backstage view to close.
    /// </summary>
    procedure CloseBackStageView;
    /// <summary>
    ///   This method will close all open child windows.
    /// </summary>
    procedure CloseChildren;
    procedure EndUpdate;
    /// <summary>
    ///   ActiveRibbonTabIndex property getter.
    /// </summary>
    function GetActiveRibbonTabIndex: Integer;
    function GetActiveTabChild: TcxTabSheet;
    /// <summary>
    ///   CanCloseChildren property getter.
    /// </summary>
    function GetCanCloseChildren: Boolean;
    /// <summary>
    ///   HasStatusBar property getter.
    /// </summary>
    function GetHasStatusBar: Boolean;
    /// <summary>
    ///   IsClosing property getter.
    /// </summary>
    function GetIsClosing: Boolean;
    /// <summary>
    ///   IsStatusBarVisible property getter.
    /// </summary>
    function GetIsStatusBarVisible: Boolean;
    /// <summary>
    ///   Ribbon property getter.
    /// </summary>
    function GetRibbon: TdxRibbon;
    /// <summary>
    ///   RibbonMode property getter.
    /// </summary>
    function GetRibbonMode: TATRibbonMode;
    function GetTabChildCount: Integer;
    function GetTabChildren(Index: Integer): TcxTabSheet;
    /// <summary>
    ///   WantsToClose property getter.
    /// </summary>
    function GetWantsToClose: Boolean;
    /// <summary>
    ///   ActiveRibbonTabIndex property setter.
    /// </summary>
    procedure SetActiveRibbonTabIndex(Value: Integer);
    procedure SetActiveTabChild(const Value: TcxTabSheet);
    /// <summary>
    ///   RibbonMode property setter.
    /// </summary>
    procedure SetRibbonMode(Value: TATRibbonMode);
    /// <summary>
    ///   Synchronizes the main form's UI controls.
    /// </summary>
    procedure SynchronizeUIObjects;
    procedure TabCaptionChanged(const Value: String);
    /// <summary>
    ///   Informs the main form about changes to the current theme.
    /// </summary>
    /// <remarks>
    ///   This method is part of the IATThemedForm interface.
    /// </remarks>
    procedure ThemeChanged(const ASkinName: string);
    /// <summary>
    ///   Toggles the status bar's visibility.
    /// </summary>
    procedure ToggleStatusBarVisible;
    /// <summary>
    ///   Updates the ribbon's context states.
    /// </summary>
    procedure UpdateRibbonContextStates;
    procedure _ActivateActiveTabChild;
    function _CanChildClose(Index: Integer): Boolean;
    procedure _DeactivateActiveTabChild;
    /// <summary>
    ///   Loads the bar manager's state from the config file.
    /// </summary>
    procedure _LoadBarManagerState;
    /// <summary>
    ///   Loads the form's state from the config file.
    /// </summary>
    procedure _LoadFormState;
    /// <summary>
    ///   Loads the ribbon's state from the config file.
    /// </summary>
    procedure _LoadRibbonState;
    /// <summary>
    ///   Saves the bar manager's state to the config file.
    /// </summary>
    procedure _SaveBarManagerState;
    /// <summary>
    ///   Saves the form's state to the config file.
    /// </summary>
    procedure _SaveFormState;
    /// <summary>
    ///   Saves the ribbon's state to the config file.
    /// </summary>
    procedure _SaveRibbonState;
  public
    /// <summary>
    ///   Creates and initializes an instance.
    /// </summary>
    constructor Create(AOwner: TComponent); override;
    /// <summary>
    ///   Frees the resources allocated with an instance.
    /// </summary>
    destructor Destroy; override;
    /// <summary>
    ///   CloseQuery is called automatically when an attempt is made
    ///   to close the form.
    /// </summary>
    /// <remarks>
    ///   <para>
    ///     This method sets the WantsToClose property to TRUE,
    ///     then asks the child forms if they can close.
    ///   </para>
    ///   <para>
    ///     If the child forms can close the inherited CloseQuery
    ///     is called so any OnCloseQuery handler can run..
    ///   </para>
    ///   <para>
    ///     Finally the WantsToClose property is set back to FALSE.
    ///   </para>
    /// </remarks>
    function CloseQuery: Boolean; override;
    /// <summary>
    ///   Specifies the index of the currently active ribbon tab.
    /// </summary>
    property ActiveRibbonTabIndex: Integer
        read GetActiveRibbonTabIndex write SetActiveRibbonTabIndex;
    property ActiveTabChild: TcxTabSheet read GetActiveTabChild write
        SetActiveTabChild;
    /// <summary>
    ///   Indicates if the child forms can close.
    /// </summary>
    property CanCloseChildren: Boolean read GetCanCloseChildren;
    /// <summary>
    ///   Indicates if the form has a status bar.
    /// </summary>
    property HasStatusBar: Boolean read GetHasStatusBar;
    /// <summary>
    ///   Indicates if the form is closing.
    /// </summary>
    property IsClosing: Boolean read GetIsClosing;
    /// <summary>
    ///   Indicates if the status bar is visible.
    /// </summary>
    property IsStatusBarVisible: Boolean read GetIsStatusBarVisible;
    /// <summary>
    ///   Returns a reference to the main form's ribbon.
    /// </summary>
    property Ribbon: TdxRibbon read GetRibbon;
    /// <summary>
    ///   Specifies the current ribbon mode.
    /// </summary>
    property RibbonMode: TATRibbonMode read GetRibbonMode
        write SetRibbonMode;
    property TabChildCount: Integer read GetTabChildCount;
    property TabChildren[Index: Integer]: TcxTabSheet read GetTabChildren;
    /// <summary>
    ///   Indicates if the form currently wants to close.
    /// </summary>
    property WantsToClose: Boolean read GetWantsToClose;
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses AT.ShortName.ResourceStrings, AT.ShortName.Vcl.Dialogs.SplashDX,
  AT.ShortName.DM.Images, AT.ShortName.DM.Actions, dxCore,
  AT.ShortName.DM.Services.Config, AT.GarbageCollector,
  AT.ShortName.Config.Consts, AT.ShortName.DM.ScreenTips,
  AT.ShortName.DM.Services.Dialogs, AT.ShortName.DX.TabFrameChild,
  AT.ShortName.Vcl.Frames.Generic.Tab, AT.ShortName.DX.TabFormChild,
  AT.ShortName.Vcl.Forms.Generic.TabRibbon,
  AT.ShortName.ObjectServices, AT.ShortName.Consts;

constructor TfrmMain.Create(AOwner: TComponent);
begin
  TdlgSplashDX.ChangeStartMessage(rstrStartInitMain, cStartMsgDelay);

  inherited Create(AOwner);

  DisableAero := True;

  Caption := Application.Title;

  FRibbonUpdate := False;

  Ribbon.ActiveTab := ribtabHome;

  _LoadFormState;
  _LoadBarManagerState;
  _LoadRibbonState;

  SynchronizeUIObjects;
end;

destructor TfrmMain.Destroy;
begin
  _SaveRibbonState;
  _SaveBarManagerState;
  _SaveFormState;

  inherited Destroy;
end;

procedure TfrmMain.AddTabChild(ATabSheet: TcxTabSheet);
begin
  if (NOT Assigned(ATabSheet)) then
    Exit;

  ATabSheet.PageControl := pcMain;
  pcMain.ActivePage := ATabSheet;
end;

procedure TfrmMain.AddTabFormChild(
  AFormClass: TfrmGenericTabFormClass);
var
  ATab: TATdxTabFormChild;
begin
  ATab := TATdxTabFormChild.Create(Self, AFormClass, Self);
  AddTabChild(ATab);
end;

procedure TfrmMain.AddTabFrameChild(AFrameClass: TCustomFrameClass);
var
  ATab: TATdxTabFrameChild;
begin
  ATab := TATdxTabFrameChild.Create(Self, AFrameClass, Self);
  AddTabChild(ATab);
end;

procedure TfrmMain.AfterRibbonMerge;
begin
  //Do nothing...
end;

procedure TfrmMain.AfterRibbonUnmerge;
begin
  //Do nothing...
end;

procedure TfrmMain.BeforeRibbonMerge;
begin
  //Do nothing...
end;

procedure TfrmMain.BeforeRibbonUnmerge;
begin
  //Do nothing...
end;

procedure TfrmMain.BeginUpdate;
begin
  if (FRibbonUpdate) then
    Exit;

  FRibbonUpdate := True;

  barmgrMain.BeginUpdate;
  ribMain.BeginUpdate;
end;

procedure TfrmMain.CloseBackStageView;
begin
  bsvMain.ClosePopup;
end;

procedure TfrmMain.CloseChildren;
var
  Idx: Integer;
begin
  if (TabChildCount <= 0) then
    Exit;

  for Idx := (TabChildCount - 1) downto 0 do
    begin
      pcMain.CloseTab(Idx);
    end;
end;

function TfrmMain.CloseQuery: Boolean;
var
  AGC: IATGarbageCollector;
begin
  FWantsToClose := True;

  TATGC.Cleanup(procedure
    begin
      FWantsToClose := False;
    end, AGC);

  Result := ( (inherited CloseQuery) AND CanCloseChildren);
end;

procedure TfrmMain.EndUpdate;
begin
  if (NOT FRibbonUpdate) then
    Exit;

  ribMain.EndUpdate;
  barmgrMain.EndUpdate;

  FRibbonUpdate := False;
end;

procedure TfrmMain.FormClose(Sender: TObject;
    var Action: TCloseAction);
begin
  FIsClosing := True;

  CloseChildren;
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  TdlgSplashDX.HideSplash(500);
end;

function TfrmMain.GetActiveRibbonTabIndex: Integer;
begin
  Result := Ribbon.ActiveTab.Index;
end;

function TfrmMain.GetActiveTabChild: TcxTabSheet;
begin
  Result := pcMain.ActivePage;
end;

function TfrmMain.GetCanCloseChildren: Boolean;
var
  Idx: Integer;
begin
  if (TabChildCount <= 0) then
    Exit(True);

  Result := True;

  for Idx := 0 to (TabChildCount - 1) do
    begin
      Result := _CanChildClose(Idx);

      if (NOT Result) then
        Exit(False);
    end;
end;

function TfrmMain.GetHasStatusBar: Boolean;
begin
  Result := True;
end;

function TfrmMain.GetIsClosing: Boolean;
begin
  Result := FIsClosing;
end;

function TfrmMain.GetIsStatusBarVisible: Boolean;
begin
  Result := sbarMain.Visible;
end;

function TfrmMain.GetRibbon: TdxRibbon;
begin
  Result := ribMain;
end;

function TfrmMain.GetRibbonMode: TATRibbonMode;
begin
  if (RibbonAutoHideMode.Active) then
    Result := rmAutoHide
  else if (Ribbon.ShowTabGroups) then
    Result := rmTabsAndCmds
  else
    Result := rmTabsOnly;
end;

function TfrmMain.GetTabChildCount: Integer;
begin
  Result := pcMain.PageCount;
end;

function TfrmMain.GetTabChildren(Index: Integer): TcxTabSheet;
begin
  Result := pcMain.Pages[Index];
end;

function TfrmMain.GetWantsToClose: Boolean;
begin
  Result := FWantsToClose;
end;

procedure TfrmMain.pcMainCanCloseEx(Sender: TObject; ATabIndex:
    Integer; var ACanClose: Boolean);
begin
  ACanClose := _CanChildClose(ATabIndex);

  if (NOT ACanClose) then
    Exit;

  BeginUpdate;

  if (pcMain.ActivePageIndex = ATabIndex) then
    _DeactivateActiveTabChild;
end;

procedure TfrmMain.pcMainChange(Sender: TObject);
begin
  _ActivateActiveTabChild;
  TabCaptionChanged(pcMain.ActivePage.Caption);
  EndUpdate;
end;

procedure TfrmMain.pcMainGetTabHint(Sender: TObject; ATabIndex:
    Integer; var AHint: String; var ACanShow: Boolean);
var
  ATab: TcxTabSheet;
  AFraIntf: IATTabFrameChildUI;
  AFraHIntf: IATTabFrameTabHint;
  AFrmIntf: IATTabFormChildUI;
  AFrmHIntf: IATTabFormTabHint;
begin
  ATab := pcMain.Pages[ATabIndex];

  if (Supports(ATab, IATTabFrameChildUI, AFraIntf)) then
    begin
      if (Supports(AFraIntf.Frame, IATTabFrameTabHint, AFraHIntf)) then
        AHint := AFraHIntf.TabHint;
    end
  else if (Supports(ATab, IATTabFormChildUI, AFrmIntf)) then
    begin
      if (Supports(AFrmIntf.Form, IATTabFormTabHint, AFrmHIntf)) then
        AHint := AFrmHIntf.TabHint;
    end;

  ACanShow := (NOT AHint.IsEmpty);
end;

procedure TfrmMain.pcMainPageChanging(Sender: TObject; NewPage:
    TcxTabSheet; var AllowChange: Boolean);
begin
  BeginUpdate;
  _DeactivateActiveTabChild;
end;

procedure TfrmMain.ribMainHelpButtonClick(Sender: TdxCustomRibbon);
begin
  AppServices.HelpShowTOC;
end;

procedure TfrmMain.ribMainTabChanged(Sender: TdxCustomRibbon);
var
  AIntf: IATTabFormRibbon;
begin
  if (AppServices.ActiveChildFormSupports(IATTabFormRibbon,
      AIntf)) then
    AIntf.ActiveRibbonTabIndex := Sender.ActiveTab.Index;
end;

procedure TfrmMain.SetActiveRibbonTabIndex(Value: Integer);
var
  Idx: Integer;
begin
  if (Value < 0) then
    Idx := 0
  else if (Value > (Ribbon.TabCount - 1)) then
    Idx := (Ribbon.TabCount -1)
  else
    Idx := Value;

  Ribbon.ActiveTab := Ribbon.Tabs[Idx];
end;

procedure TfrmMain.SetActiveTabChild(const Value: TcxTabSheet);
begin
  pcMain.ActivePage := Value;
end;

procedure TfrmMain.SetRibbonMode(Value: TATRibbonMode);
begin
  case Value of
    rmAutoHide   : begin
                     Ribbon.ShowTabGroups := True;
                     RibbonAutoHideMode.Active := True;
                   end;
    rmTabsOnly   : begin
                     RibbonAutoHideMode.Active := False;
                     Ribbon.ShowTabGroups := False;
                   end;
    rmTabsAndCmds: begin;
                     RibbonAutoHideMode.Active := False;
                     Ribbon.ShowTabGroups := True;
                   end;
  else
    RibbonAutoHideMode.Active := False;
    Ribbon.ShowTabGroups := True;
  end;
end;

procedure TfrmMain.SynchronizeUIObjects;
begin
  barClipboard.Visible := Actions.ShowClipboard;
  barEditing.Visible := Actions.ShowEditing;
end;

procedure TfrmMain.TabCaptionChanged(const Value: String);
begin
  ribMain.DocumentName := Value;
end;

procedure TfrmMain.ThemeChanged(const ASkinName: string);
begin
  if (SameText(ASkinName, 'Office2013LightGray')) then
    ribMain.ColorSchemeName := 'LightGray'
  else if (SameText(ASkinName, 'Office2013White')) then
    ribMain.ColorSchemeName := 'White'
  else if (SameText(ASkinName, 'Office2016Colorful')) then
    ribMain.ColorSchemeName := 'Colorful'
  else
    ribMain.ColorSchemeName := ASkinName;
end;

procedure TfrmMain.ToggleStatusBarVisible;
begin
  sbarMain.Visible := (NOT IsStatusBarVisible);
end;

procedure TfrmMain.UpdateRibbonContextStates;
begin
  { TODO : Add code to update ribbon context states. }
end;

procedure TfrmMain._ActivateActiveTabChild;
var
  ATab: TcxTabSheet;
  AChildFrm: IATTabFormChildUI;
  AForm: IATFormActivate;
  AChildFra: IATTabFrameChildUI;
  AFrame: IATFrameActivate;
begin
  ATab := pcMain.ActivePage;

  if (Supports(ATab, IATTabFormChildUI, AChildFrm))  then
    begin
      if (Supports(AChildFrm.Form, IATFormActivate, AForm)) then
        AForm.ActivateForm;
      Exit;
    end;

  if (Supports(ATab, IATTabFrameChildUI, AChildFra))  then
    begin
      if (Supports(AChildFra.Frame, IATFrameActivate, AFrame)) then
        AFrame.ActivateFrame;
      Exit;
    end;
end;

function TfrmMain._CanChildClose(Index: Integer): Boolean;
var
  ATab: TcxTabSheet;
  AFrmIntf: IATTabFormChildUI;
  AFraIntf: IATTabFrameChildUI;
  AFraCQIntf: IATTabFrameCloseQuery;
begin
  if (Index < 0) then
    Exit(True);

  if (Index >= TabChildCount) then
    Exit(True);

  ATab := TabChildren[Index];

  if (Supports(ATab, IATTabFormChildUI, AFrmIntf)) then
    begin
       Result := AFrmIntf.Form.CloseQuery;
    end
  else if (Supports(ATab, IATTabFrameChildUI, AFraIntf)) then
    begin
      if (Supports(AFraIntf.Frame, IATTabFrameCloseQuery,
          AFraCQIntf)) then
        Result := AFraCQIntf.CloseQuery
      else
        Result := True;
    end
  else
    Result := True;
end;

procedure TfrmMain._DeactivateActiveTabChild;
var
  ATab: TcxTabSheet;
  AChildFrm: IATTabFormChildUI;
  AForm: IATFormDeactivate;
  AChildFra: IATTabFrameChildUI;
  AFrame: IATFrameDeactivate;
begin
  ATab := pcMain.ActivePage;


  if (Supports(ATab, IATTabFormChildUI, AChildFrm))  then
    begin
      if (Supports(AChildFrm.Form, IATFormDeactivate, AForm)) then
        AForm.DeactivateForm;
      Exit;
    end;

  if (Supports(ATab, IATTabFrameChildUI, AChildFra))  then
    begin
      if (Supports(AChildFra.Frame, IATFrameDeactivate, AFrame)) then
        AFrame.DeactivateFrame;
      Exit;
    end;
end;

procedure TfrmMain._LoadBarManagerState;
var
  AValue: string;
  AStream: TStringStream;
  AGC: IATGarbageCollector;
begin
  Exit;

  //todo:
  TdlgSplashDX.ChangeStartMessage(rstrStartLoadBarMgrSt,
      cStartMsgDelay);

  AValue := ConfigServices.CurrentUser.ReadString(cCfgSecBarManager,
      cCfgKeyMainData, EmptyStr);
  if (not AValue.IsEmpty) then
    begin
      AStream := TATGC.Collect(TStringStream.Create(AValue), AGC);
      AStream.Seek(0, 0);
      barmgrMain.LoadFromStream(AStream);
    end;
end;

procedure TfrmMain._LoadFormState;
begin
  TdlgSplashDX.ChangeStartMessage(rstrStartLoadMainFrmSt,
      cStartMsgDelay);

  ConfigServices.LoadFormState(Self);
end;

procedure TfrmMain._LoadRibbonState;
var
  BValue: Boolean;
  IValue: Integer;
  AMode: Integer;
begin
  TdlgSplashDX.ChangeStartMessage(rstrStartLoadRibState,
      cStartMsgDelay);

  IValue := Ord(ribMain.CapitalizeTabCaptions);
  IValue := ConfigServices.CurrentUser.ReadInteger(
      cCfgSecRibbonMain, cCfgKeyCapTabCaps, IValue);
  if (IValue <> Ord(ribMain.CapitalizeTabCaptions)) then
    ribMain.CapitalizeTabCaptions := TdxDefaultBoolean(IValue);

  IValue := Ord(ribMain.ColorSchemeAccent);
  IValue := ConfigServices.CurrentUser.ReadInteger(
      cCfgSecRibbonMain, cCfgKeyClrSchAcc, IValue);
  if (IValue <> Ord(ribMain.ColorSchemeAccent)) then
    ribMain.ColorSchemeAccent := TdxRibbonColorSchemeAccent(IValue);

  BValue := ribMain.QuickAccessToolbar.Visible;
  BValue := ConfigServices.CurrentUser.ReadBoolean(
      cCfgSecRibbonMain, cCfgKeyQATVisible, BValue);
  if (BValue <> ribMain.QuickAccessToolbar.Visible) then
    ribMain.QuickAccessToolbar.Visible := BValue;

  IValue := Ord(ribMain.Style);
  IValue := ConfigServices.CurrentUser.ReadInteger(
      cCfgSecRibbonMain, cCfgKeyStyle, IValue);
  if (IValue <> Ord(ribMain.Style)) then
    ribMain.Style := TdxRibbonStyle(IValue);

  BValue := ribMain.TabAreaToolbar.Visible;
  BValue := ConfigServices.CurrentUser.ReadBoolean(
      cCfgSecRibbonMain, cCfgKeyTATVisible, BValue);
  if (BValue <> ribMain.TabAreaToolbar.Visible) then
    ribMain.TabAreaToolbar.Visible := BValue;

  AMode := ConfigServices.CurrentUser.ReadInteger(cCfgSecRibbonMain,
      cCfgKeyMode, 0);
  RibbonAutoHideMode.Active := (AMode = 2);
  ribMain.ShowTabGroups := (AMode <> 1);
end;

procedure TfrmMain._SaveBarManagerState;
var
  AStream: TStringStream;
  AGC: IATGarbageCollector;
begin
  Exit;

  //todo:
  AStream := TATGC.Collect(TStringStream.Create, AGC);
  barmgrMain.SaveToStream(AStream);
  AStream.Seek(0, 0);
  ConfigServices.CurrentUser.WriteString(cCfgSecBarManager,
      cCfgKeyMainData, AStream.DataString);
end;

procedure TfrmMain._SaveFormState;
begin
  ConfigServices.SaveFormState(Self);
end;

procedure TfrmMain._SaveRibbonState;
begin
  ConfigServices.CurrentUser.WriteInteger(cCfgSecRibbonMain,
      cCfgKeyCapTabCaps, Ord(ribMain.CapitalizeTabCaptions));

  ConfigServices.CurrentUser.WriteInteger(cCfgSecRibbonMain,
      cCfgKeyClrSchAcc, Ord(ribMain.ColorSchemeAccent));

  ConfigServices.CurrentUser.WriteBoolean(cCfgSecRibbonMain,
      cCfgKeyQATVisible, ribMain.QuickAccessToolbar.Visible);

  ConfigServices.CurrentUser.WriteInteger(cCfgSecRibbonMain,
      cCfgKeyStyle, Ord(ribMain.Style));

  ConfigServices.CurrentUser.WriteBoolean(cCfgSecRibbonMain,
      cCfgKeyTATVisible, ribMain.TabAreaToolbar.Visible);

  if (RibbonAutoHideMode.Active) then
    begin
      ConfigServices.CurrentUser.WriteInteger(cCfgSecRibbonMain,
          cCfgKeyMode, 2);
    end
  else if (not ribMain.ShowTabGroups) then
    begin
      ConfigServices.CurrentUser.WriteInteger(cCfgSecRibbonMain,
          cCfgKeyMode, 1);
    end
  else
    begin
      ConfigServices.CurrentUser.WriteInteger(cCfgSecRibbonMain,
          cCfgKeyMode, 0);
    end;
end;

end.
