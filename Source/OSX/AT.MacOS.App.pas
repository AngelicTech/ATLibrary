//Only compile for the OS X platform.
{$IF ( (NOT Defined(MACOS)) OR (Defined(IOS)) )}
  {$MESSAGE Fatal 'AT.MacOS.App.pas only compiles for the OS X platform.'}
{$ENDIF}

// ******************************************************************
//
// Program Name   : Angelic Tech Mac OS X Library
// Program Version: 2017
// Platform(s)    : OS X
// Framework      : None
//
// Filename       : AT.MacOS.App.pas
// File Version   : 2017.04
// Date Created   : 11-Apr-2017
// Author         : Matthew Vesperman
//
// Description:
//
// Mac OS X application related routines.
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
///   Contains Mac OS X application related routines.
/// </summary>
unit AT.MacOS.App;

interface

uses
  Macapi.CoreFoundation, Macapi.Foundation, Macapi.AppKit;

/// <summary>Retrieves a reference to this application's NSBundle interface.
/// </summary>
/// <returns> NSBundle
/// </returns>
function GetAppBundle: NSBundle;
/// <summary>Retrieves this application's bundle name.
/// </summary>
/// <returns>A String containing the value of the Info.plist CFBundleName key.
/// </returns>
function GetAppBundleName: String;
/// <summary>Retrieves a reference to this application's NSApplication
///  interface.
/// </summary>
/// <returns> NSApplication
/// </returns>
function GetApplication: NSApplication;
/// <summary>Retrieves this application's version string.
/// </summary>
/// <returns>A String containing the value of the Info.plist CFBundleVersion
///  key.
/// </returns>
function GetAppVersionString: String;

implementation

function GetAppBundle: NSBundle;
begin
  Result := TNSBundle.Wrap(TNSBundle.OCClass.mainBundle);
end;

function GetAppBundleName: String;
var
  CFStr: CFStringRef;
  Range: CFRange;
begin
  CFStr := CFBundleGetValueForInfoDictionaryKey(CFBundleGetMainBundle,
    kCFBundleNameKey);
  Range.location := 0;
  Range.Length := CFStringGetLength(CFStr);
  SetLength(Result, Range.Length);
  CFStringGetCharacters(CFStr, Range, PChar(Result));
end;

function GetApplication: NSApplication;
begin
  Result := TNSApplication.Wrap(TNSApplication.OCClass.sharedApplication);
end;

function GetAppVersionString: String;
var
  CFStr: CFStringRef;
  Range: CFRange;
begin
  CFStr := CFBundleGetValueForInfoDictionaryKey(CFBundleGetMainBundle,
    kCFBundleVersionKey);
  Range.location := 0;
  Range.Length := CFStringGetLength(CFStr);
  SetLength(Result, Range.Length);
  CFStringGetCharacters(CFStr, Range, PChar(Result));
end;

end.
