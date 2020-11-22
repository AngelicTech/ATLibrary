//Only compile for the iOS platform.
{$IF NOT Defined(IOS)}
  {$MESSAGE Fatal 'AT.iOS.Folders.pas only compiles for the iOS platform.'}
{$ENDIF}

// ******************************************************************
//
// Program Name   : Angelic Tech iOS Library
// Program Version: 2017
// Platform(s)    : iOS
// Framework      : None
//
// Filename       : AT.iOS.Folders.pas
// File Version   : 2017.04
// Date Created   : 10-Apr-2017
// Author         : Matthew Vesperman
//
// Description:
//
// iOS folder routines.
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
///   Contains routines that return folder paths for the iOS
///   platform.
/// </summary>
unit AT.iOS.Folders;

interface

/// <summary>
///   Returns the documents folder on the iOS platform.
/// </summary>
/// <param name="AAppPath">
///   The path to append to the documents folder path. The folder
///   tree passed here will be created if it does not exist. Pass an
///   empty string to get just the documents path.
/// </param>
/// <returns>
///   The full path to the documents folder for an iOS device.
/// </returns>
/// <remarks>
///   If the AAppPath parameter is an empty string then this function
///   returns just the documents folder. If AAppPath contains a value
///   then it is appended to the documents path and the full path is
///   created if it does not exist.
/// </remarks>
/// <seealso cref="AT.iOS.Folders|GetDocumentDirectory(string)">
///   GetDocumentDirectory
/// </seealso>
function GetAppDataDirectory(AAppPath: String = ''): String;
/// <summary>
///   Returns the full path to the application's executable within
///   its bundle.
/// </summary>
/// <returns>
///   The full path to the application's executable within its
///   bundle.
/// </returns>
/// <seealso cref="AT.iOS.Folders|GetBundleDirectory">
///   GetBundleDirectory
/// </seealso>
/// <seealso cref="AT.iOS.App|GetAppBundle">
///   GetAppBundle
/// </seealso>
function GetAppDirectory: String;
/// <summary>
///   Returns the full path to the application's bundle.
/// </summary>
/// <returns>
///   The full path to the application's bundle.
/// </returns>
/// <seealso cref="AT.iOS.Folders|GetAppDirectory">
///   GetAppDirectory
/// </seealso>
/// <seealso cref="AT.iOS.App|GetAppBundle">
///   GetAppBundle
/// </seealso>
function GetBundleDirectory: String;
/// <summary>
///   Returns the documents folder on the iOS platform.
/// </summary>
/// <param name="ADocPath">
///   The path to append to the documents folder path. The folder
///   tree passed here will be created if it does not exist. Pass an
///   empty string to get just the documents path.
/// </param>
/// <returns>
///   <para>
///     The full path to the documents folder for an iOS device.
///   </para>
///   <para>
///     On the iOS platform GetDocumentDirectory is an alias to
///     GetAppDataDirectory.
///   </para>
/// </returns>
/// <remarks>
///   If the AAppPath parameter is an empty string then this function
///   returns just the documents folder. If AAppPath contains a value
///   then it is appended to the documents path and the full path is
///   created if it does not exist.
/// </remarks>
/// <seealso cref="AT.iOS.Folders|GetAppDataDirectory(string)">
///   GetAppDataDirectory
/// </seealso>
function GetDocumentDirectory(const ADocPath: String = ''): String;

implementation

uses
  iOSapi.Foundation, AT.iOS.App, Macapi.Helpers, System.IOUtils,
  System.SysUtils;


function GetAppDataDirectory(AAppPath: String = ''): String;
begin
  //Get the documents folder path and Ensure trailing path delimeter
  //is added to the path...
  Result := IncludeTrailingPathDelimiter(TPath.GetDocumentsPath);

  if (NOT AAppPath.IsEmpty) then
    begin
      //Append the AAppPath value to the path...
      Result := Format('%s%s', [Result, AAppPath]);

      //Ensure trailing path delimeter is added to the path...
      Result := IncludeTrailingPathDelimiter(Result);

      //Make sure the path actually exists...
      TDirectory.CreateDirectory(Result);
    end;
end;

function GetAppDirectory: String;
var
  ABundle: NSBundle;  //App bundle reference...
  AValue: String;     //Temp string value...
begin
  //Get a reference to the app's bundle...
  ABundle := GetAppBundle;

  //Retrieve the bundle's executable path...
  AValue := NSStrToStr(ABundle.executablePath);

  //Ensure the trailing path delimeter is added...
  AValue := IncludeTrailingPathDelimiter(AValue);

  //Return the path...
  Result := AValue;
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

  //Ensure the trailing path delimeter is added...
  AValue := IncludeTrailingPathDelimiter(AValue);

  //Return the path...
  Result := AValue;
end;

function GetDocumentDirectory(const ADocPath: String = ''): String;
begin
  //Return the value from GetAppDataDirectory...
  Result := GetAppDataDirectory(ADocPath);
end;


end.
