// ******************************************************************
//
// Program Name   : AT Library
// Program Version: 1.00
// Platform(s)    : Android, iOS, OSX, Win32, Win64
// Framework      : none
//
// Filename       : AT.XPlatform.Internet.pas
// File Version   : 1.00
// Date Created   : 06-MAY-2016
// Author         : Matthew S. Vesperman
//
// Description:
//
// Cross-platform internet routines...
//
// Revision History:
//
// v1.00   :   Initial version
//
// ******************************************************************
//
// COPYRIGHT © 2015 - PRESENT Angelic Technology
// ALL RIGHTS RESERVED WORLDWIDE
//
// ******************************************************************


unit AT.XPlatform.Internet;

interface

/// <summary>
///   Checks AEmail to ensure it has a valid e-mail address format.
/// </summary>
/// <param name="AEmail">
///   A string containing the e-mail address to check.
/// </param>
/// <returns>
///   TRUE if e-mail address is valid, FALSE otherwise.
/// </returns>
function CheckEmailFormat(AEmail: string): Boolean;
function CheckProxy(AServer: string; APortNum: Integer; AUsername, APassword:
    string): Boolean;
function OpenURL(const AURL: String): Boolean;

implementation

uses
  {$IF Defined(MSWINDOWS)}
  AT.Windows,
  {$ENDIF}
  {$IF Defined(MACOS) AND NOT Defined(IOS)}
  AT.MacOS,
  {$ENDIF}
  {$IF Defined(LINUX)}
  AT.Linux,
  {$ENDIF}
  System.RegularExpressions, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, AT.GarbageCollector;

function CheckEmailFormat(AEmail: string): Boolean;
const
  cRegEx = '^((?>[a-zA-Z\d!#$%&''*+\-/=?^_`{|}~]+\x20*' +
    '|"((?=[\x01-\x7f])[^"\\]|\\[\x01-\x7f])*"\' +
    'x20*)*(?<angle><))?((?!\.)(?>\.?[a-zA-Z\d!' +
    '#$%&''*+\-/=?^_`{|}~]+)+|"((?=[\x01-\x7f])' +
    '[^"\\]|\\[\x01-\x7f])*")@(((?!-)[a-zA-Z\d\' +
    '-]+(?<!-)\.)+[a-zA-Z]{2,}|\[(((?(?<!\[)\.)' +
    '(25[0-5]|2[0-4]\d|[01]?\d?\d)){4}|[a-zA-Z\' +
    'd\-]*[a-zA-Z\d]:((?=[\x01-\x7f])[^\\\[\]]|' +
    '\\[\x01-\x7f])+)\])(?(angle)>)$';
begin
  Result := TRegEx.IsMatch(AEmail, cRegEx);
end;

function CheckProxy(AServer: string; APortNum: Integer; AUsername, APassword:
    string): Boolean;
{$IF Defined(MSWINDOWS)}
var
  HTTPCon: TIdHTTP;
  AGC: IATGarbageCollector;
{$ENDIF}
begin
  {$IF Defined(MSWINDOWS)}
    //Create a HTTP connection...
    HTTPCon := TATGC.Collect(TIdHTTP.Create(NIL), AGC);

    //Assign cleanup routine...
    TATGC.Cleanup(
      procedure
      begin
        //Do we have a HTTP connection???
        if (Assigned(HTTPCon)) then
          begin
            //Yes, if connected then disconnect...
            if (HTTPCon.Connected) then
              HTTPCon.Disconnect;
          end;
      end, AGC);

    //Set HTTP connection proxy params...
    HTTPCon.ProxyParams.ProxyServer := AServer;
    HTTPCon.ProxyParams.ProxyPort := APortNum;
    HTTPCon.ProxyParams.BasicAuthentication := True;
    HTTPCon.ProxyParams.ProxyUsername := AUsername;
    HTTPCon.ProxyParams.ProxyPassword := APassword;

    //Attempt to make a connection to google.com
    HTTPCon.HandleRedirects := True;
    HTTPCon.ConnectTimeout := 1000;
    HTTPCon.Request.Connection := 'close';
    HTTPCon.Head('http://google.com');

    //Return true if response code is 200, false otherwise...
    Result := (HTTPCon.ResponseCode = 200);
  {$ELSE}
    //TODO: figure out implementation for Android, iOS, OS X...
    Result := True;
  {$ENDIF}
end;

function OpenURL(const AURL: String): Boolean;
begin
  {$IF Defined(MSWINDOWS)}
    Exit(AT.Windows.GotoURL(AURL));
  {$ELSEIF (Defined(MACOS) AND (NOT Defined(IOS)))}
    AT.MacOS.OpenURL(AURL);
    Exit(True);
  {$ELSEIF Defined(LINUX)}
    AT.Linux.OpenURL(AURL);
    Exit(True);
  {$ELSE}
    Result := False;
  {$ENDIF}
end;

end.
