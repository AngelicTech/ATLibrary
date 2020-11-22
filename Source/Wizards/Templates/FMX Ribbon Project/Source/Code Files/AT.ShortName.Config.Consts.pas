// ******************************************************************
//
// Program Name   : $ProgramName$
// Platform(s)    : $Platforms$
// Framework      : None
//
// Filename       : AT.$ShortName$.Config.Consts.pas
// File Version   : 1.00
// Date Created   : $CreateDate$
// Author         : Matthew Vesperman
//
// Description:
//
// Configuration sub-system constants.
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
///   Configuration sub-system constants.
/// </summary>
unit AT.ShortName.Config.Consts;

interface

uses
  AT.ShortName.Consts;

const
  /// <summary>
  ///   Configuration file encryption key.
  /// </summary>
  /// <remarks>
  ///   Leave this empty if no encryption is desired.
  /// </remarks>
  cCfgEncryptKey = '$EncryptKey$';
  /// <summary>
  ///   Configuration file access mutex.
  /// </summary>
  cCfgMutex = '$ShortName$';
  /// <summary>
  ///   Configuration filename formatting string.
  /// </summary>
  cConfigFNFmt = '%sconfig.dat';


//Configuration sections...
const
  /// <summary>
  ///   Configuration Section: BarManager
  /// </summary>
  cCfgSecBarManager = 'BarManager';
  /// <summary>
  ///   Configuration Section: Ribbon.Main
  /// </summary>
  cCfgSecRibbonMain = 'Ribbon.Main';
  /// <summary>
  ///   Configuration Section: Themeing
  /// </summary>
  cCfgSecThemeing   = 'Themeing';

const
  /// <summary>
  ///   Configuration Key: Active
  /// </summary>
  cCfgKeyActive      = 'Active';
  /// <summary>
  ///   Configuration Key: CapitalizeTabCaption
  /// </summary>
  cCfgKeyCapTabCaps  = 'CapitalizeTabCaption';
  /// <summary>
  ///   Configuration Key: ColorSchemeAccent
  /// </summary>
  cCfgKeyClrSchAcc   = 'ColorSchemeAccent';
  /// <summary>
  ///   Configuration Key: Enabled
  /// </summary>
  cCfgKeyEnabled     = 'Enabled';
  /// <summary>
  ///   Configuration Key: Main.Data
  /// </summary>
  cCfgKeyMainData    = 'Main.Data';
  /// <summary>
  ///   Configuration Key: Mode
  /// </summary>
  cCfgKeyMode        = 'Mode';
  /// <summary>
  ///   Configuration Key: NativeStyle
  /// </summary>
  cCfgKeyNativeStyle = 'NativeStyle';
  /// <summary>
  ///   Configuration Key: Left
  /// </summary>
  cCfgKeyPosLeft     = 'Left';
  /// <summary>
  ///   Configuration Key: Top
  /// </summary>
  cCfgKeyPosTop      = 'Top';
  /// <summary>
  ///   Configuration Key: QATVisible
  /// </summary>
  cCfgKeyQATVisible  = 'QATVisible';
  /// <summary>
  ///   Configuration Key: Height
  /// </summary>
  cCfgKeySizeHgt     = 'Height';
  /// <summary>
  ///   Configuration Key: Width
  /// </summary>
  cCfgKeySizeWid     = 'Width';
  /// <summary>
  ///   Configuration Key: Style
  /// </summary>
  cCfgKeyStyle       = 'Style';
  /// <summary>
  ///   Configuration Key: TATVisible
  /// </summary>
  cCfgKeyTATVisible  = 'TATVisible';
  /// <summary>
  ///   Configuration Key: ThemeName
  /// </summary>
  cCfgKeyThemeName   = 'ThemeName';
  /// <summary>
  ///   Configuration Key: TouchMode
  /// </summary>
  cCfgKeyTouchMode   = 'TouchMode';
  /// <summary>
  ///   Configuration Key: WindowState
  /// </summary>
  cCfgKeyWindowState = 'WindowState';

implementation

end.
