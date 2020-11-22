//Only compile for the OS X platform.
{$IF ( (NOT Defined(MACOS)) OR (Defined(IOS)) )}
  {$MESSAGE Fatal 'AT.MacOS.Folders.pas only compiles for the OS X platform.'}
{$ENDIF}

// ******************************************************************
//
// Program Name   : Angelic Tech Mac OS X Library
// Program Version: 2017
// Platform(s)    : OS X
// Framework      : None
//
// Filename       : AT.MacOS.Folders.pas
// File Version   : 2017.04
// Date Created   : 13-Apr-2017
// Author         : Matthew Vesperman
//
// Description:
//
// Mac OS X folder routines.
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
///   Contains routines that return folder paths for the Mac OS X
///   platform.
/// </summary>
unit AT.MacOS.Folders;

interface

/// <summary>
///   <para>
///     Calculates the path to the application's data folder.
///   </para>
///   <para>
///     If the ACommon parameter is true, then we return a path
///     under /Users/Shared/Library, otherwise we return a path
///     under the user's library folder.
///   </para>
/// </summary>
/// <param name="AAppID">
///   The name of the folder to store the application's data.
/// </param>
/// <param name="ACommon">
///   Specifies whether you want the shared folder or the user's
///   folder.
/// </param>
/// <returns>
///   <para>
///     A String containing the application's data path.
///   </para>
///   <para>
///     /Users/Shared/Library/Application Support/(AAppId) or
///     /Users/(User Name)/Library/Application Support/(AAppId)
///   </para>
/// </returns>
function GetAppDataDirectory(AAppID: String = ''; ACommon: Boolean =
   False): String;
/// <summary>Retrieves the path to the app bundle's executable folder.
/// </summary>
/// <returns>A String containing the path to the bundle's executable folder.
/// </returns>
function GetAppDirectory: String;
/// <summary>Retrieves the path to the app bundle's folder.
/// </summary>
/// <returns>A String containing the path to the bundle's folder.
/// </returns>
function GetBundleDirectory: String;
/// <summary>
///   <para>
///     Calculates the path to the application's documents folder.
///   </para>
///   <para>
///     If the ACommon parameter is true, then we return a path
///     under /Users/Shared/Documents, otherwise we return a path
///     under the user's documents folder.
///   </para>
/// </summary>
/// <param name="ADocPath">
///   The name of the app's document folder. If an empty string is
///   passed then the Documents folder will be returned.
/// </param>
/// <param name="ACommon">
///   Specifies whether you want the shared folder or the user's
///   folder.
/// </param>
/// <returns>
///   <para>
///     A String containing the application's documents folder.
///   </para>
///   <para>
///     /Users/Shared/Documents/(ADocPath) or /Users/(User
///     Name)/Documents /(ADocPath)
///   </para>
/// </returns>
function GetDocumentDirectory(const ADocPath: String = '';
  ACommon: Boolean = False): String;
/// <summary>Retrieves the path to the current user's home folder.
/// </summary>
/// <returns>A String containing the path to the current user's home folder.
/// </returns>
function GetHomeDirectory: String;

implementation

uses
  System.IOUtils, System.SysUtils, Macapi.CoreFoundation, Macapi.Foundation,
  Macapi.Helpers, AT.MacOS.App;


//Load from Foundation library...
function NSHomeDirectory: Pointer; cdecl;
  external '/System/Library/Frameworks/Foundation.framework/Foundation'
  name _PU + 'NSHomeDirectory';


function GetAppDataDirectory(AAppID: String = '';
  ACommon: Boolean = False): String;
begin
  //Determine if we need Common or User path...
  if (ACommon) then
    Result := '/Users/Shared/Library'   //Common path...
  else
    Result := TPath.GetLibraryPath;     //User's path...

  //Build app data path string...
  Result := IncludeTrailingPathDelimiter(Result);
  Result := Format('%sApplication Support', [Result]);
  Result := IncludeTrailingPathDelimiter(Result);

  if (NOT AAppID.IsEmpty) then
    begin
      Result := Format('%s%s', [Result, AAppID]);
      Result := IncludeTrailingPathDelimiter(Result);
    end;

  //Make sure the path actually exists...
  TDirectory.CreateDirectory(Result);
end;

function GetAppDirectory: String;
var
  ABundle: NSBundle;
  AValue: String;
begin
  //Get a reference to the app's bundle...
  ABundle := GetAppBundle;

  //Retrieve the bundle's executable path...
  AValue := NSStrToStr(ABundle.executablePath);

  Result := ExtractFileDir(AValue);
end;

function GetBundleDirectory: String;
var
  ABundle: NSBundle;
  AValue: String;
begin
  //Get a reference to the app's bundle...
  ABundle := GetAppBundle;

  //Retrieve the bundle's path...
  AValue:= NSStrToStr(ABundle.bundlePath);

  Result := AValue;
end;

function GetDocumentDirectory(const ADocPath: String = '';
  ACommon: Boolean = False): String;
begin
  if (ACommon) then
    Result := '/Users/Shared/Documents'
  else
    Result := TPath.GetDocumentsPath;

  Result := IncludeTrailingPathDelimiter(Result);

  if (NOT ADocPath.IsEmpty) then
    begin
      Result := Format('%s%s', [Result, ADocPath]);
      Result := IncludeTrailingPathDelimiter(Result);
      TDirectory.CreateDirectory(Result);
    end;
end;

function GetHomeDirectory: String;
begin
  //Retrieve and return the current user's home folder...
  Result := String(TNSString.Wrap(NSHomeDirectory).UTF8String);
end;

end.
