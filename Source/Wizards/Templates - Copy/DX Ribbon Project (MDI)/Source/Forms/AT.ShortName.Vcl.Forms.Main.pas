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
  dxTabbedMDI, cxCheckBox, AT.ShortName.Types,
  AT.ShortName.DM.Services.Application, dxScreenTip;

type
  /// <summary>
  ///   Defines the main form class.
  /// </summary>
  TfrmMain = class(TdxRibbonForm, IATMainCloseQuery,
      IATMainCloseChildren, IATMainCloseChildrenQuery,
      IATMainRibbon, IATMainRibbonMerge, IATMainRibbonQuery,
      IATMainUI, IATMainUICaps, IATMainUIQuery, IATThemedForm)
    barClipboard: TdxBar;
    barEditing: TdxBar;
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
    cmdHelpContents: TdxBarLargeButton;
    cmdKbdCapsState: TdxBarButton;
    cmdKbdInsOvr: TdxBarButton;
    cmdKbdNumState: TdxBarButton;
    cmdKbdScrlState: TdxBarButton;
    cmdQATEditRedo: TdxBarButton;
    cmdQATEditUndo: TdxBarButton;
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
    mdimgrMain: TdxTabbedMDIManager;
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
    /// <summary>
    ///   This event is fired when a hint is about to be displayed
    ///   for the tab located under the mouse pointer.
    /// </summary>
    /// <remarks>
    ///   if the mdi child attached to the APage supports the
    ///   IATMDIChildTabHint interface then the child form is asked
    ///   for its tab hint, otherwise the tab hint is set to the mdi
    ///   child form caption.
    /// </remarks>
    procedure mdimgrMainGetTabHint(Sender: TdxTabbedMDIManager;
        APage: TdxTabbedMDIPage; var AHint: string;
        var ACanShow: Boolean);
    procedure mdimgrMainPageAdded(Sender: TdxTabbedMDIManager; APage:
        TdxTabbedMDIPage);
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
    FDefMDITabChangedEvent: TcxCustomTabControlPropertiesChangedEvent;
    /// <summary>
    ///   Stores a flag indicating if the main form is in the process
    ///   of closing.
    /// </summary>
    FIsClosing: Boolean;
    /// <summary>
    ///   Stores a flag indicating if the main form wants to close.
    /// </summary>
    FWantsToClose: Boolean;
    FRibbonUpdate: Boolean;
  strict protected
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
    /// <summary>
    ///   WantsToClose property getter.
    /// </summary>
    function GetWantsToClose: Boolean;
    procedure MDITabChanged(Sender: TObject; AType:
        TcxCustomTabControlPropertiesChangedType);
    procedure MDITabChanging(Sender: TObject; var AllowChange: Boolean);
    /// <summary>
    ///   ActiveRibbonTabIndex property setter.
    /// </summary>
    procedure SetActiveRibbonTabIndex(Value: Integer);
    /// <summary>
    ///   RibbonMode property setter.
    /// </summary>
    procedure SetRibbonMode(Value: TATRibbonMode);
    /// <summary>
    ///   Synchronizes the main form's UI controls.
    /// </summary>
    procedure SynchronizeUIObjects;
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
  AT.ShortName.Config.Consts, AT.ShortName.Vcl.Forms.Generic.MDIChild,
  AT.ShortName.DM.ScreenTips, AT.ShortName.Vcl.Forms.Ribbon.MDIChild,
  AT.ShortName.DM.Services.Dialogs;

type
  TATTabMDIMgrAccess = class(TdxTabbedMDIManager);
  TATTabMDITabCtlrAccess = class(TdxTabbedMDITabController);
  TATTabCtlPropAccess = class(TcxCustomTabControlProperties);

constructor TfrmMain.Create(AOwner: TComponent);
begin
  TdlgSplashDX.ChangeStartMessage(rstrStartInitMain, 500);

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
  AFrm: TCustomForm;
  Idx: Integer;
begin
  if (MDIChildCount <= 0) then
    Exit;

  for Idx := (MDIChildCount - 1) downto 0 do
    begin
      AFrm := MDIChildren[Idx];
      AFrm.Close;
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

  Result := inherited CloseQuery
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

  if (NOT CanCloseChildren) then
    begin
      FIsClosing := False;
      Abort;
    end
  else
    CloseChildren;
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  TATTabCtlPropAccess(TATTabMDITabCtlrAccess(
      mdimgrMain.Controller).
      Properties).OnChanging := MDITabChanging;

  FDefMDITabChangedEvent := TATTabCtlPropAccess(
      TATTabMDITabCtlrAccess(mdimgrMain.Controller).
      Properties).OnChanged;

  TATTabCtlPropAccess(TATTabMDITabCtlrAccess(
      mdimgrMain.Controller).
      Properties).OnChanged := MDITabChanged;

  TdlgSplashDX.HideSplash(500);
end;

function TfrmMain.GetActiveRibbonTabIndex: Integer;
begin
  Result := Ribbon.ActiveTab.Index;
end;

function TfrmMain.GetCanCloseChildren: Boolean;
var
  AFrm: TCustomForm;
  Idx: Integer;
begin
  if (MDIChildCount <= 0) then
    Exit(True);

  Result := False;

  for Idx := 0 to (MDIChildCount - 1) do
    begin
      AFrm := MDIChildren[Idx];

      Result := AFrm.CloseQuery;

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

function TfrmMain.GetWantsToClose: Boolean;
begin
  Result := FWantsToClose;
end;

procedure TfrmMain.mdimgrMainGetTabHint(Sender: TdxTabbedMDIManager;
    APage: TdxTabbedMDIPage; var AHint: string;
    var ACanShow: Boolean);
var
  AIntf: IATMDIChildTabHint;
begin
  if (Supports(APage.MDIChild, IATMDIChildTabHint, AIntf)) then
    AHint := AIntf.TabHint
  else
    AHint := APage.MDIChild.Caption;

  ACanShow := (NOT AHint.IsEmpty);
end;

procedure TfrmMain.mdimgrMainPageAdded(Sender: TdxTabbedMDIManager;
    APage: TdxTabbedMDIPage);
begin
  BeginUpdate;
end;

procedure TfrmMain.MDITabChanged(Sender: TObject; AType:
    TcxCustomTabControlPropertiesChangedType);
begin
  FDefMDITabChangedEvent(Sender, AType);

  if (NOT IsClosing) then
    EndUpdate;
end;

procedure TfrmMain.MDITabChanging(Sender: TObject; var AllowChange:
    Boolean);
begin
  BeginUpdate;
end;

procedure TfrmMain.ribMainHelpButtonClick(Sender: TdxCustomRibbon);
begin
  AppServices.HelpShowTOC;
end;

procedure TfrmMain.ribMainTabChanged(Sender: TdxCustomRibbon);
var
  AIntf: IATMDIChildRibbon;
begin
  if (AppServices.ActiveChildSupports(IATMDIChildRibbon, AIntf)) then
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

procedure TfrmMain.ThemeChanged(const ASkinName: string);
begin
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

procedure TfrmMain._LoadBarManagerState;
var
  AValue: string;
  AStream: TStringStream;
  AGC: IATGarbageCollector;
begin
  Exit;

  //todo:
  TdlgSplashDX.ChangeStartMessage(rstrStartLoadBarMgrSt, 500);

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
  TdlgSplashDX.ChangeStartMessage(rstrStartLoadMainFrmSt, 500);

  ConfigServices.LoadFormState(Self);
end;

procedure TfrmMain._LoadRibbonState;
var
  BValue: Boolean;
  IValue: Integer;
  AMode: Integer;
begin
  TdlgSplashDX.ChangeStartMessage(rstrStartLoadRibState, 500);

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
