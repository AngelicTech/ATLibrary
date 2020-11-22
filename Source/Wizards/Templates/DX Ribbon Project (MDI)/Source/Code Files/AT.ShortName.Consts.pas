// ******************************************************************
//
// Program Name   : $ProgramName$
// Platform(s)    : $Platforms$
// Framework      : VCL
//
// Filename       : AT.$ShortName$.Consts.pas
// File Version   : 1.00
// Date Created   : $CreateDate$
// Author         : Matthew Vesperman
//
// Description:
//
// $ProgramName$'s global constants.
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
///   $ProgramName$'s global constants.
/// </summary>
unit AT.ShortName.Consts;

interface

const
  /// <summary>
  ///   $ProgramName$'s help filename.
  /// </summary>
  cAppHelpFileName = '$ProjectName$.chm';
  /// <summary>
  ///   $ProgramName$'s internal application name.
  /// </summary>
  cInternalAppName = '$ShortName$';
  /// <summary>
  ///   $ProgramName$'s company identifier.
  /// </summary>
  cCompanyID = 'com.AngelicTech';
  /// <summary>
  ///   The name of the folder containing data related to ALL Angelic
  ///   Technology applications.
  /// </summary>
  cAllProductsFolder = cCompanyID;
  /// <summary>
  ///   The name of $ProgramName$'s appdata folder.
  /// </summary>
  cAppDataFolder = cCompanyID + '.' + cInternalAppName;
  /// <summary>
  ///   The string that represents a FALSE value.
  /// </summary>
  cFalseStr = '0';
  /// <summary>
  ///   The string that represents a TRUE value.
  /// </summary>
  cTrueStr = '1';
  cStartMsgDelay = 500;



/// <summary>
///   Calculates the full path/filename of $ProgramName$'s local help
///   file.
/// </summary>
/// <returns>
///   The full path/filename of $ProgramName$'s local help file.
/// </returns>
function HelpFileName: String;


implementation

uses
  System.SysUtils, AT.XPlatform.Folders;

function HelpFileName: String;
begin
  Result := IncludeTrailingPathDelimiter(GetExecutablePath);

  Result := Format('%s%s', [Result, cAppHelpFileName]);
end;

end.
