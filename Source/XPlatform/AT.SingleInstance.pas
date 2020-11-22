// ******************************************************************
//
// Program Name   : Single Instance Framework
// Platform(s)    : Android, iOS, OSX, Linux64, Win32, Win64
// Framework      : FMX
//
// Filename       : AT.SingleInstance.pas
// File Version   : 1.00
// Date Created   : 08-Dec-2017
// Author         : Matthew Vesperman
//
// Description:
//
// Defines the main single instance class that all applications will
// reference.
//
// The actual implementation is based on the platform that is being
// compiled.
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
///   <para>
///     Defines the main single instance class that all
///     applications will reference.
///   </para>
///   <para>
///     Also defines a global function that should be used to
///     access the global SingleInstance object.
///   </para>
/// </summary>
/// <remarks>
///   <para>
///     The actual implementation is based on the platform that is
///     being compiled.
///   </para>
///   <para>
///     You should NOT create an instance of TATSingleInstance in
///     your code. You should only access it using the
///     SingleInstance function.
///   </para>
/// </remarks>
unit AT.SingleInstance;

interface

uses
  {$IF ( (Defined(MACOS)) AND (NOT Defined(IOS)) )}
  AT.SingleInstance.MacOS,
  {$ELSEIF Defined(MSWINDOWS)}
  AT.SingleInstance.Windows,
  {$ELSEIF Defined(LINUX)}
  AT.SingleInstance.Linux,
  {$ENDIF}
  AT.SingleInstance.Base;

type
  {$IF ( (Defined(MACOS)) AND (NOT Defined(IOS)) )}
  TATSingleInstance = class(TATMacOSSingleInstance);
  {$ELSEIF Defined(MSWINDOWS)}
  TATSingleInstance = class(TATWindowsSingleInstance);
  {$ELSEIF Defined(LINUX)}
  TATSingleInstance = class(TATLinuxSingleInstance);
  {$ELSE}
  TATSingleInstance = class(TATCustomSingleInstance);
  {$ENDIF}


/// <summary>
///   Returns a reference to the global single instance object.
/// </summary>
function SingleInstance: TATSingleInstance;

implementation

uses
  System.SysUtils;

var
  MSingleInstance: TATSingleInstance;

function SingleInstance: TATSingleInstance;
begin
  if (NOT Assigned(MSingleInstance)) then
    MSingleInstance := TATSingleInstance.Create;

  Result := MSingleInstance;
end;


initialization

finalization

  if (Assigned(MSingleInstance)) then
    begin
      FreeAndNil(MSingleInstance);
    end;

end.
