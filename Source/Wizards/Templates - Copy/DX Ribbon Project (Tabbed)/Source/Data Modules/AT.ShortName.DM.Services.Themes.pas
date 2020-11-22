// ******************************************************************
//
// Program Name   : $ProgramName$
// Platform(s)    : $Platforms$
// Framework      : VCL
//
// Filename       : AT.$ShortName$.DM.ThemeServices.pas/.dfm
// File Version   : 1.00
// Date Created   : $CreateDate$
// Author         : Matthew Vesperman
//
// Description:
//
// $ProgramName$'s theme services data module.
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
///   $ProgramName$'s theme services data module.
/// </summary>
unit AT.ShortName.DM.Services.Themes;

interface

uses
  System.SysUtils, System.Classes, dxSkinsCore, dxSkinBlueprint,
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
  dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue, cxClasses,
  cxLookAndFeels, dxSkinsForm;

type
  /// <summary>
  ///   Theme services data module.
  /// </summary>
  TdmThemeServices = class(TDataModule)
    sknctlrMain: TdxSkinController;
    /// <summary>
    ///   Data module's OnCreate event handler.
    /// </summary>
    /// <remarks>
    ///   Initializes the ThemeServices data module.
    /// </remarks>
    procedure DataModuleCreate(Sender: TObject);
    /// <summary>
    ///   Data module's OnDestroy event handler.
    /// </summary>
    /// <remarks>
    ///   Finalizes the ThemeServices data module.
    /// </remarks>
    procedure DataModuleDestroy(Sender: TObject);
  strict protected
    /// <summary>
    ///   Enabled property getter.
    /// </summary>
    function GetEnabled: Boolean;
    /// <summary>
    ///   NativeStyle property getter.
    /// </summary>
    function GetNativeStyle: Boolean;
    /// <summary>
    ///   ThemeName property getter.
    /// </summary>
    function GetThemeName: String;
    /// <summary>
    ///   TouchMode property getter.
    /// </summary>
    function GetTouchMode: Boolean;
    /// <summary>
    ///   Enabled property setter.
    /// </summary>
    procedure SetEnabled(const Value: Boolean);
    /// <summary>
    ///   NativeStyle property setter.
    /// </summary>
    procedure SetNativeStyle(const Value: Boolean);
    /// <summary>
    ///   ThemeName property setter.
    /// </summary>
    procedure SetThemeName(const Value: String);
    /// <summary>
    ///   TouchMode property setter.
    /// </summary>
    procedure SetTouchMode(const Value: Boolean);
    /// <summary>
    ///   Loads themeing sub-system settings from the CurrentUser
    ///   config file.
    /// </summary>
    procedure _LoadSettings;
    /// <summary>
    ///   Saves themeing sub-system settings to the CurrentUser
    ///   config file.
    /// </summary>
    procedure _SaveSettings;
    /// <summary>
    ///   Informs all forms that support themeing that the current
    ///   theme name has changed.
    /// </summary>
    /// <remarks>
    ///   To support theme name change notifications a form must
    ///   implement the IATThemedForm interface.
    /// </remarks>
    procedure _ThemeNameChanged;
  public
    /// <summary>
    ///   Called at program startup to inform all forms about the
    ///   current theme name.
    /// </summary>
    procedure _StartupInit;
    /// <summary>
    ///   Determines if the themeing sub-system is enabled.
    /// </summary>
    /// <remarks>
    ///   When set to TRUE the themeing sub-system is enabled. When
    ///   set to FALSE the themeing sub-system is disabled.
    /// </remarks>
    property Enabled: Boolean read GetEnabled write SetEnabled;
    /// <summary>
    ///   Determines whether TcxControl descendants within the
    ///   current application use the native windows paint style by
    ///   default.
    /// </summary>
    property NativeStyle: Boolean read GetNativeStyle write SetNativeStyle;
    /// <summary>
    ///   Specifies the name of a skin to be applied to all
    ///   TcxControl descendants within the current application by
    ///   default.
    /// </summary>
    property ThemeName: String read GetThemeName write SetThemeName;
    /// <summary>
    ///   Toggles the Touch mode in an application.
    /// </summary>
    /// <remarks>
    ///   Set this property to True to enable the Touch mode in an
    ///   application. Setting the property to False reverts all the
    ///   size modifications made to DevExpress controls by enabling
    ///   the Touch mode.
    /// </remarks>
    property TouchMode: Boolean read GetTouchMode write SetTouchMode;
  end;

var
  /// <summary>
  ///   Holds a reference to the global ThemeServices data module.
  /// </summary>
  dmThemeServices: TdmThemeServices;

/// <summary>
///   Returns a reference to the global ThemeServices data module.
/// </summary>
function ThemeServices: TdmThemeServices;

implementation

uses
  Vcl.Forms, AT.ShortName.Intf, AT.GarbageCollector,
  AT.ShortName.Vcl.Dialogs.SplashDX, AT.ShortName.ResourceStrings,
  AT.ShortName.DM.Services.Config, AT.ShortName.Config.Consts;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

var
  /// <summary>
  ///   Module level garbage collector object.
  /// </summary>
  MGC: IATGarbageCollector;

function ThemeServices: TdmThemeServices;
begin
  if (NOT Assigned(dmThemeServices)) then
    begin
      dmThemeServices := TATGC.Collect(TdmThemeServices.Create(NIL),
          MGC);
    end;

  Result := dmThemeServices;
end;

procedure TdmThemeServices.DataModuleCreate(Sender: TObject);
begin
  TdlgSplashDX.ChangeStartMessage(rstrStartInitThemes, 500);

  _LoadSettings;
end;

procedure TdmThemeServices.DataModuleDestroy(Sender: TObject);
begin
  _SaveSettings;
end;

function TdmThemeServices.GetEnabled: Boolean;
begin
  Result := sknctlrMain.UseSkins;
end;

function TdmThemeServices.GetNativeStyle: Boolean;
begin
  Result := sknctlrMain.NativeStyle;
end;

function TdmThemeServices.GetThemeName: String;
begin
  Result := sknctlrMain.SkinName;
end;

function TdmThemeServices.GetTouchMode: Boolean;
begin
  Result := sknctlrMain.TouchMode;
end;

procedure TdmThemeServices.SetEnabled(const Value: Boolean);
begin
  sknctlrMain.UseSkins := Value;
end;

procedure TdmThemeServices.SetNativeStyle(const Value: Boolean);
begin
  sknctlrMain.NativeStyle := Value;
end;

procedure TdmThemeServices.SetThemeName(const Value: String);
begin
  sknctlrMain.SkinName := Value;
  _ThemeNameChanged;
end;

procedure TdmThemeServices.SetTouchMode(const Value: Boolean);
begin
  sknctlrMain.TouchMode := Value;
end;

procedure TdmThemeServices._LoadSettings;
var
  ATheme: String;
begin
  ATheme := ConfigServices.CurrentUser.ReadString(
      cCfgSecThemeing, cCfgKeyThemeName, ThemeName);

  if (NOT SameText(ATheme, ThemeName)) then
    begin
      TdlgSplashDX.ChangeStartMessage(rstrStartSetThemes, 500);
      ThemeName := ATheme;
    end;

  TouchMode := ConfigServices.CurrentUser.ReadBoolean(
      cCfgSecThemeing, cCfgKeyTouchMode, TouchMode);

  NativeStyle := ConfigServices.CurrentUser.ReadBoolean(
      cCfgSecThemeing, cCfgKeyNativeStyle, NativeStyle);

  Enabled := ConfigServices.CurrentUser.ReadBoolean(
      cCfgSecThemeing, cCfgKeyEnabled, Enabled);
end;

procedure TdmThemeServices._SaveSettings;
begin
  ConfigServices.CurrentUser.WriteString(cCfgSecThemeing,
      cCfgKeyThemeName, ThemeName);
  ConfigServices.CurrentUser.WriteBoolean(
      cCfgSecThemeing, cCfgKeyTouchMode, TouchMode);
  ConfigServices.CurrentUser.WriteBoolean(
      cCfgSecThemeing, cCfgKeyNativeStyle, NativeStyle);
  ConfigServices.CurrentUser.WriteBoolean(
      cCfgSecThemeing, cCfgKeyEnabled, Enabled);
end;

procedure TdmThemeServices._StartupInit;
begin
  _ThemeNameChanged;
end;

procedure TdmThemeServices._ThemeNameChanged;
var
  Cnt: Integer;
  Idx: Integer;
  AFrm: TCustomForm;
  IFrm: IATThemedForm;
begin
  Cnt := Screen.CustomFormCount;

  for Idx := 0 to (Cnt - 1) do
    begin
      AFrm := Screen.CustomForms[Idx];

      if (Supports(AFrm, IATThemedForm, IFrm)) then
        IFrm.ThemeChanged(ThemeName);
    end;
end;

end.
