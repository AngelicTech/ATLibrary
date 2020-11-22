// ******************************************************************
//
// Program Name   : $ProgramName$
// Platform(s)    : $Platforms$
// Framework      : VCL
//
// Filename       : AT.$ShortName$.DM.Services.Config.pas/.dfm
// File Version   : 1.00
// Date Created   : $CreateDate$
// Author         : Matthew Vesperman
//
// Description:
//
// $ProgramName$'s global config services data module.
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
///   $ProgramName$'s global config services data module.
/// </summary>
unit AT.ShortName.DM.Services.Config;

interface

uses
  System.SysUtils, System.Classes, AT.Config.Storage.Custom,
  Vcl.Forms;

type
  /// <summary>
  ///   Global config services data module.
  /// </summary>
  TdmConfigServices = class(TDataModule)
    /// <summary>
    ///   Data module's OnCreate event handler.
    /// </summary>
    /// <remarks>
    ///   Initializes the ConfigServices data module.
    /// </remarks>
    procedure DataModuleCreate(Sender: TObject);
  strict private
    /// <summary>
    ///   Common property getter.
    /// </summary>
    function GetCommon: TATCustomConfigStorage;
    /// <summary>
    ///   CurrentUser property getter.
    /// </summary>
    function GetCurrentUser: TATCustomConfigStorage;
  public
    /// <summary>
    ///   Loads a form's position/size/windowstate from the
    ///   CurrentUser config file.
    /// </summary>
    /// <param name="AForm">
    ///   A reference to a TCustomForm instance whose
    ///   position/size/windowstate needs to be loaded from the
    ///   config file.
    /// </param>
    /// <remarks>
    ///   Form properties are loaded from a config section with the
    ///   name of the form's class.
    /// </remarks>
    procedure LoadFormState(const AForm: TCustomForm);
    /// <summary>
    ///   Saves a form's position/size/windowstate to the CurrentUser
    ///   config file.
    /// </summary>
    /// <param name="AForm">
    ///   A reference to a TCustomForm instance whose
    ///   position/size/windowstate needs to be saved to the config
    ///   file.
    /// </param>
    /// <remarks>
    ///   Form properties are saved to a config section with the name
    ///   of the form's class.
    /// </remarks>
    procedure SaveFormState(const AForm: TCustomForm);
    /// <summary>
    ///   Provides access to the Common configuration file.
    /// </summary>
    property Common: TATCustomConfigStorage read GetCommon;
    /// <summary>
    ///   Provides access to the Current User's configuration file.
    /// </summary>
    property CurrentUser: TATCustomConfigStorage read GetCurrentUser;
  end;

var
  /// <summary>
  ///   Holds a reference to the global config services data module.
  /// </summary>
  dmConfigServices: TdmConfigServices;

/// <summary>
///   Returns a reference to the global config services data module.
/// </summary>
function ConfigServices: TdmConfigServices;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses
  System.Math, AT.GarbageCollector, AT.ShortName.Config,
  AT.ShortName.ResourceStrings, AT.ShortName.Vcl.Dialogs.SplashDX,
  AT.ShortName.Config.Consts;

{$R *.dfm}

var
  /// <summary>
  ///   Module level garbage collector object.
  /// </summary>
  MGC: IATGarbageCollector;

function ConfigServices: TdmConfigServices;
begin
  if (NOT Assigned(dmConfigServices)) then
    begin
      dmConfigServices := TATGC.Collect(TdmConfigServices.Create(NIL),
          MGC);
    end;

  Result := dmConfigServices;
end;

procedure TdmConfigServices.DataModuleCreate(Sender: TObject);
begin
  //Display startup message in splash screen...
  TdlgSplashDX.ChangeStartMessage(rstrStartInitCfgSvc, 500);
end;

function TdmConfigServices.GetCommon: TATCustomConfigStorage;
begin
  Result := Config(True);
end;

function TdmConfigServices.GetCurrentUser: TATCustomConfigStorage;
begin
  Result := Config(False);
end;

procedure TdmConfigServices.LoadFormState(const AForm: TCustomForm);
var
  ADefLeft: Integer;
  ADefTop: Integer;
  AWS: Integer;
  ALeft: Integer;
  AHeight: Integer;
  ATop: Integer;
  AWidth: Integer;
begin
  if (NOT Assigned(AForm)) then
    Exit;

  ADefLeft := ( (Screen.Width - AForm.Width) DIV 2 );
  ADefLeft := Max(0, ADefLeft);

  ADefTop := ( (Screen.Height - AForm.Height) DIV 2 );
  ADefTop := Max(0, ADefTop);

  ALeft := ConfigServices.CurrentUser.ReadInteger(
      AForm.ClassName, cCfgKeyPosLeft, ADefLeft);

  ATop := ConfigServices.CurrentUser.ReadInteger(
      AForm.ClassName, cCfgKeyPosTop, ADefTop);

  AHeight := AForm.Height;
  AHeight := ConfigServices.CurrentUser.ReadInteger(
      AForm.ClassName, cCfgKeySizeHgt, AHeight);

  AWidth := AForm.Width;
  AWidth := ConfigServices.CurrentUser.ReadInteger(
      AForm.ClassName, cCfgKeySizeWid, AWidth);

  AForm.SetBounds(ALeft, ATop, AWidth, AHeight);

  AWS := Ord(AForm.WindowState);
  AWS := ConfigServices.CurrentUser.ReadInteger(
      AForm.ClassName, cCfgKeyWindowState, AWS);
  AForm.WindowState := TWindowState(AWS);
end;

procedure TdmConfigServices.SaveFormState(const AForm: TCustomForm);
var
  AWS: Integer;
begin
  if (NOT Assigned(AForm)) then
    Exit;

  ConfigServices.CurrentUser.WriteInteger(AForm.ClassName,
      cCfgKeyPosLeft, AForm.Left);

  ConfigServices.CurrentUser.WriteInteger(AForm.ClassName,
      cCfgKeyPosTop, AForm.Top);

  ConfigServices.CurrentUser.WriteInteger(AForm.ClassName,
      cCfgKeySizeHgt, AForm.Height);

  ConfigServices.CurrentUser.WriteInteger(AForm.ClassName,
      cCfgKeySizeWid, AForm.Width);

  case AForm.WindowState of
    TWindowState.wsMinimized: AWS := Ord(wsNormal);
  else
    AWS := Ord(AForm.WindowState);
  end;

  ConfigServices.CurrentUser.WriteInteger(AForm.ClassName,
      cCfgKeyWindowState, AWS);
end;

end.
