// ****************************************************************************
//
// Program Name   : n/a
// Program Version: 1.00
// Filenames      : AT.EncDec.Base64.pas
// File Version   : 1.00
// Date Created   : 21-APR-2014
// Author         : Matthew S. Vesperman
//
// Description:
//
// Contains routines for Base64 encode/decode.
//
// Revision History:
//
// v1.00   :   Initial version
//
// ****************************************************************************
//
// COPYRIGHT © 2014 Angelic Technology
// ALL RIGHTS RESERVED WORLDWIDE
//
// ****************************************************************************

unit AT.EncDec.Base64;

interface

/// <summary>
/// Performs a Base64 decode on AVal
/// </summary>
/// <param name="AVal">
/// A string that is Base64 encoded.
/// </param>
/// <returns>
/// A Base64 decoded version of AVal.
/// </returns>
function Base64DecodeA(AVal: AnsiString): AnsiString;
function Base64DecodeW(AVal: String): String;

/// <summary>
/// Performs a Base64 encode on AVal
/// </summary>
/// <param name="AVal">
/// A string to Base64 encode.
/// </param>
/// <returns>
/// A Base64 encoded version of AVal.
/// </returns>
function Base64EncodeA(AVal: AnsiString): AnsiString;
function Base64EncodeW(AVal: String): String;

implementation

uses
  System.SysUtils;

const
  B64Table: AnsiString =
    'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/';

function Base64DecodeA(AVal: AnsiString): AnsiString;
var
  OutBuf: array [0 .. 2] of Byte;
  InBuf : array [0 .. 3] of Byte;
  iI, iJ: Integer;
begin
{$IFDEF WIN32}
  // Begin nanomites - Software Passport
  asm DB $EB,$03,$D6,$D7,$01
  end;
{$ENDIF}
  if Length(AVal) mod 4 <> 0 then
    raise Exception.Create('Base64: Incorrect string format');
  SetLength(Result, ((Length(AVal) div 4) - 1) * 3);
  for iI := 1 to (Length(AVal) div 4) - 1 do
    begin
      Move(AVal[(iI - 1) * 4 + 1], InBuf, 4);
      for iJ := 0 to 3 do
        case InBuf[iJ] of
          43:
            InBuf[iJ] := 62;
          48 .. 57:
            Inc(InBuf[iJ], 4);
          65 .. 90:
            Dec(InBuf[iJ], 65);
          97 .. 122:
            Dec(InBuf[iJ], 71);
        else
          InBuf[iJ] := 63;
        end;
      OutBuf[0] := (InBuf[0] shl 2) or ((InBuf[1] shr 4) and $3);
      OutBuf[1] := (InBuf[1] shl 4) or ((InBuf[2] shr 2) and $F);
      OutBuf[2] := (InBuf[2] shl 6) or (InBuf[3] and $3F);
      Move(OutBuf, Result[(iI - 1) * 3 + 1], 3);
    end;
  if Length(AVal) <> 0 then
    begin
      Move(AVal[Length(AVal) - 3], InBuf, 4);
      if InBuf[2] = 61 then
        begin
          for iJ := 0 to 1 do
            case InBuf[iJ] of
              43:
                InBuf[iJ] := 62;
              48 .. 57:
                Inc(InBuf[iJ], 4);
              65 .. 90:
                Dec(InBuf[iJ], 65);
              97 .. 122:
                Dec(InBuf[iJ], 71);
            else
              InBuf[iJ] := 63;
            end;
          OutBuf[0] := (InBuf[0] shl 2) or ((InBuf[1] shr 4) and $3);
          Result := Result + AnsiChar(OutBuf[0]);
        end
      else if InBuf[3] = 61 then
        begin
          for iJ := 0 to 2 do
            case InBuf[iJ] of
              43:
                InBuf[iJ] := 62;
              48 .. 57:
                Inc(InBuf[iJ], 4);
              65 .. 90:
                Dec(InBuf[iJ], 65);
              97 .. 122:
                Dec(InBuf[iJ], 71);
            else
              InBuf[iJ] := 63;
            end;
          OutBuf[0] := (InBuf[0] shl 2) or ((InBuf[1] shr 4) and $3);
          OutBuf[1] := (InBuf[1] shl 4) or ((InBuf[2] shr 2) and $F);
          Result := Result + AnsiChar(OutBuf[0]) + AnsiChar(OutBuf[1]);
        end
      else
        begin
          for iJ := 0 to 3 do
            case InBuf[iJ] of
              43:
                InBuf[iJ] := 62;
              48 .. 57:
                Inc(InBuf[iJ], 4);
              65 .. 90:
                Dec(InBuf[iJ], 65);
              97 .. 122:
                Dec(InBuf[iJ], 71);
            else
              InBuf[iJ] := 63;
            end;
          OutBuf[0] := (InBuf[0] shl 2) or ((InBuf[1] shr 4) and $3);
          OutBuf[1] := (InBuf[1] shl 4) or ((InBuf[2] shr 2) and $F);
          OutBuf[2] := (InBuf[2] shl 6) or (InBuf[3] and $3F);
          Result := Result + AnsiChar(OutBuf[0]) + AnsiChar(OutBuf[1]) +
            AnsiChar(OutBuf[2]);
        end;
    end;

{$IFDEF WIN32}
  // End nanomites - Software Passport
  asm DB $EB,$03,$D6,$D7,$00
  end;
{$ENDIF}
end;

function Base64DecodeW(AVal: String): String;
var
  ASVal: AnsiString;
begin
  ASVal := AnsiString(AVal);
  ASVal := Base64DecodeA(ASVal);
  Result := String(ASVal);
end;

function Base64EncodeA(AVal: AnsiString): AnsiString;
var
  InBuf : array [0 .. 2] of Byte;
  OutBuf: array [0 .. 3] of AnsiChar;
  iI    : Integer;
begin
{$IFDEF WIN32}
  // Begin nanomites - Software Passport
  asm DB $EB,$03,$D6,$D7,$01
  end;
{$ENDIF}
  SetLength(Result, ((Length(AVal) + 2) div 3) * 4);
  for iI := 1 to ((Length(AVal) + 2) div 3) do
    begin
      if Length(AVal) < (iI * 3) then
        Move(AVal[(iI - 1) * 3 + 1], InBuf, Length(AVal) - (iI - 1) * 3)
      else
        Move(AVal[(iI - 1) * 3 + 1], InBuf, 3);
      OutBuf[0] := B64Table[((InBuf[0] and $FC) shr 2) + 1];
      OutBuf[1] := B64Table
        [(((InBuf[0] and $3) shl 4) or ((InBuf[1] and $F0) shr 4)) + 1];
      OutBuf[2] := B64Table
        [(((InBuf[1] and $F) shl 2) or ((InBuf[2] and $C0) shr 6)) + 1];
      OutBuf[3] := B64Table[(InBuf[2] and $3F) + 1];
      Move(OutBuf, Result[(iI - 1) * 4 + 1], 4);
    end;
  if Length(AVal) mod 3 = 1 then
    begin
      Result[Length(Result) - 1] := '=';
      Result[Length(Result)] := '=';
    end
  else if Length(AVal) mod 3 = 2 then
    Result[Length(Result)] := '=';

{$IFDEF WIN32}
  // End nanomites - Software Passport
  asm DB $EB,$03,$D6,$D7,$00
  end;
{$ENDIF}
end;

function Base64EncodeW(AVal: String): String;
var
  ASVal: AnsiString;
begin
  ASVal := AnsiString(AVal);
  ASVal := Base64EncodeA(ASVal);
  Result := String(ASVal);
end;

end.
