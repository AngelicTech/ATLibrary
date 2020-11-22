//Only compile for the iOS platform.
{$IF NOT Defined(IOS)}
  {$MESSAGE Fatal 'AT.iOS.App.pas only compiles for the iOS platform.'}
{$ENDIF}

// ******************************************************************
//
// Program Name   : Angelic Tech iOS Library
// Program Version: 2017
// Platform(s)    : iOS
// Framework      : None
//
// Filename       : AT.iOS.App.pas
// File Version   : 2017.04
// Date Created   : 10-Apr-2017
// Author         : Matthew Vesperman
//
// Description:
//
// iOS application routines.
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
///   Contains application level routines for the iOS platform.
/// </summary>
unit AT.iOS.App;

interface

uses
  iOSapi.Foundation;

/// <summary>
///   Returns the NSBundle reference for the application's bundle.
/// </summary>
/// <seealso cref="AT.iOS.Folders|GetAppDirectory">
///   GetAppDirectory
/// </seealso>
/// <seealso cref="AT.iOS.Folders|GetBundleDirectory">
///   GetBundleDirectory
/// </seealso>
function GetAppBundle: NSBundle;

implementation

function GetAppBundle: NSBundle;
begin
  //Returns the NSBundle reference for the app.
  Result := TNSBundle.Wrap(TNSBundle.OCClass.mainBundle);
end;


end.
