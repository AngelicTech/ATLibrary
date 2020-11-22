//Only compile for the LINUX platform.
{$IF NOT Defined(LINUX)}
  {$MESSAGE Fatal 'AT.Linux.Folders.pas only compiles for the LINUX platform.'}
{$ENDIF}

// ******************************************************************
//
// Program Name   : Angelic Tech Linux Library
// Program Version: 2017
// Platform(s)    : Linux
// Framework      : None
//
// Filename       : AT.Linux.Folders.pas
// File Version   : 2017.04
// Date Created   : 21-Apr-2017
// Author         : Matthew Vesperman
//
// Description:
//
// Linux folder routines.
//
// Revision History:
//
// v1.00   :   Initial version
//
// ******************************************************************
//
// COPYRIGHT © 2017 - PRESENT Angelic Technology
// ALL RIGHTS RESERVED WORLDWIDE
//
// ******************************************************************

/// <summary>
///   Contains routines that return folder paths for the Linux
///   platform.
/// </summary>
unit AT.Linux.Folders;

interface

/// <summary>
///   Calculates the path to the application's data folder.
/// </summary>
/// <param name="AAppID">
///   The name of the folder to store the application's data.
/// </param>
/// <returns>
///   A string containing the application's data path.
/// </returns>
/// <remarks>
///   Linux does not have a "COMMON" app data folder option.
/// </remarks>
function GetAppDataDirectory(const AAppID: String = ''): string;

/// <summary>
///   Retrieves the location of the app's executable file.
/// </summary>
/// <returns>
///   A string containing the absolute path to the app's executable
///   file.
/// </returns>
function GetAppDirectory: string;

/// <summary>
///   Calculates the path to the application's documents folder.
/// </summary>
/// <param name="ADocPath">
///   The name of the folder to store the application's documents.
/// </param>
/// <returns>
///   A string containing the application's documents path.
/// </returns>
/// <remarks>
///   Linux does not have a "COMMON" app documents folder option.
/// </remarks>
function GetDocumentDirectory(const ADocPath: String = ''): string;

/// <summary>
///   Retrieves the current user's home folder.
/// </summary>
/// <returns>
///   A String containing the current user's home folder.
/// </returns>
function GetHomeDirectory: string;


implementation

uses
  System.IOUtils, System.SysUtils;

function GetAppDataDirectory(const AAppID: String = ''): string;
begin
  Result := IncludeTrailingPathDelimiter(GetHomeDirectory);

  if (NOT AAppID.IsEmpty) then
    begin
      Result := Format('%s.%s', [Result, AAppID]);
      Result := IncludeTrailingPathDelimiter(Result);
      TDirectory.CreateDirectory(Result);
    end;
end;

function GetAppDirectory: string;
begin
  Result := ParamStr(0);
  Result := TPath.GetDirectoryName(Result);
  Result := IncludeTrailingPathDelimiter(Result);
end;

function GetDocumentDirectory(const ADocPath: String = ''): string;
begin
  Result := IncludeTrailingPathDelimiter(GetHomeDirectory);

  Result := Format('%sDocuments', [Result]);
  Result := IncludeTrailingPathDelimiter(Result);

  if (NOT ADocPath.IsEmpty) then
    begin
      Result := Format('%s%s', [Result, ADocPath]);
      Result := IncludeTrailingPathDelimiter(Result);
    end;

  TDirectory.CreateDirectory(Result);
end;

function GetHomeDirectory: string;
begin
  Result := TPath.GetHomePath;
end;

end.
