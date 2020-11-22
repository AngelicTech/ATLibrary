//****************************************************************************
//
// Program Name   : AT Library
// Platform(s)    : Android, iOS, Linux, MacOS, Windows
// Framework      : Console, FMX, VCL
//
// Filename       : AT.Inet.URLUtils.pas
// Date Created   : 28-JAN-2014
// Author         : Matthew Vesperman
//
// Description:
//
// Angelic Tech internet url functions... (Migrated from SSURLUtils.pas)
//
// Revision History:
//
//   v1.00   :   Initial version for Delphi XE5.
//
//****************************************************************************
//
//  COPYRIGHT © 2013-Present Angelic Technology
//  ALL RIGHTS RESERVED WORLDWIDE
//
//****************************************************************************



/// <summary>
///   Internet URL encoding/decoding functions.
/// </summary>
unit AT.Inet.URLUtils;

interface

///	<summary>
///	  Decodes a web URL.
///	</summary>
///	<param name="AURL">
///	  URL to decode.
///	</param>
///	<returns>
///	  Returns a string containing AURL decoded.
///	</returns>
///	<remarks>
///	  ie: 'Test%20URL.com' becomes 'Test URL.com'
///	</remarks>
function URLDecode (const AURL : String) : String;

///	<summary>
///	  Encodes a web URL.
///	</summary>
///	<param name="AURL">
///	  URL to encode.
///	</param>
///	<returns>
///	  Returns a string containing AURL encoded.
///	</returns>
///	<remarks>
///	  ie: 'Test URL.com' becomes 'Test%20URL.com'
///	</remarks>
function URLeNcode (const AURL : String) : String;

implementation

uses
  idURI;

function URLDecode(const AURL: String): String;
begin
  Result := idURI.TIdURI.URLDecode(AURL);
end;

function URLEncode(const AURL: String): String;
begin
  Result := idURI.TIdURI.URLEncode(AURL);
end;


end.


