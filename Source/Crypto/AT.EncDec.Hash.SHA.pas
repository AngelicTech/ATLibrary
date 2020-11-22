// ******************************************************************
//
// Program Name   : AT Library
// Program Version:
// Platform(s)    : Win32, Win64, OSX, Android, IOS
// Framework      : None
//
// Filename       : AT.EncDec.Hash.SHA.pas
// File Version   : 2.00
// Date Created   : 26-APR-2016
// Author         : Matthew S. Vesperman
//
// Description:
//
// SHA Hashing functions...
//
// Revision History:
//
// v1.00   :   Initial version
// v2.00   :   Refactored code and added ability to Hash files...
//
// ******************************************************************
//
// COPYRIGHT © 2015 - PRESENT Angelic Technology
// ALL RIGHTS RESERVED WORLDWIDE
//
// ******************************************************************


unit AT.EncDec.Hash.SHA;

interface

function HashSHA1ofFile(const AFileName: String): string; inline;
function HashSHA224ofFile(const AFileName: String): string; inline;
function HashSHA256ofFile(const AFileName: String): string; inline;
function HashSHA384ofFile(const AFileName: String): string; inline;
function HashSHA512ofFile(const AFileName: String): string; inline;

function PasswordHashSHA1(const APwd: String): string; inline;
function PasswordHashSHA224(const APwd: String): string; inline;
function PasswordHashSHA256(const APwd: String): string; inline;
function PasswordHashSHA384(const APwd: String): string; inline;
function PasswordHashSHA512(const APwd: String): string; inline;

function StringHashSHA1(const Value: String): string; inline;
function StringHashSHA224(const Value: String): string; inline;
function StringHashSHA256(const Value: String): string; inline;
function StringHashSHA384(const Value: String): string; inline;
function StringHashSHA512(const Value: String): string; inline;

implementation

uses
  IdHash, IdHashSHA, System.SysUtils, System.Classes,
  AT.GarbageCollector;

function _HashSHAofFile(const AFileName: String;
    AHash: TIdHashIntF): string; inline;
var
  AFile: TFileStream;
  AGC: IATGarbageCollector;
begin
  if (NOT FileExists(AFileName)) then
    Exit(EmptyStr);

  if (NOT Assigned(AHash)) then
    Exit(EmptyStr);

  AFile := TATGC.Collect(TFileStream.Create(AFileName, fmOpenRead),
      AGC);

  Result := AHash.HashStreamAsHex(AFile);
end;



function HashSHA1ofFile(const AFileName: String): string; inline;
var
  AHash: TIdHashSHA1;
  AGC: IATGarbageCollector;
begin
  AHash := TATGC.Collect(TIdHashSHA1.Create, AGC);
  Result := _HashSHAofFile(AFileName, AHash);
end;

function HashSHA224ofFile(const AFileName: String): string; inline;
var
  AHash: TIdHashSHA224;
  AGC: IATGarbageCollector;
begin
  AHash := TATGC.Collect(TIdHashSHA224.Create, AGC);
  Result := _HashSHAofFile(AFileName, AHash);
end;

function HashSHA256ofFile(const AFileName: String): string; inline;
var
  AHash: TIdHashSHA256;
  AGC: IATGarbageCollector;
begin
  AHash := TATGC.Collect(TIdHashSHA256.Create, AGC);
  Result := _HashSHAofFile(AFileName, AHash);
end;

function HashSHA384ofFile(const AFileName: String): string; inline;
var
  AHash: TIdHashSHA384;
  AGC: IATGarbageCollector;
begin
  AHash := TATGC.Collect(TIdHashSHA384.Create, AGC);
  Result := _HashSHAofFile(AFileName, AHash);
end;

function HashSHA512ofFile(const AFileName: String): string; inline;
var
  AHash: TIdHashSHA512;
  AGC: IATGarbageCollector;
begin
  AHash := TATGC.Collect(TIdHashSHA512.Create, AGC);
  Result := _HashSHAofFile(AFileName, AHash);
end;



function PasswordHashSHA1(const APwd: String): string;
var
  AHash: TIdHashSHA1;
  AGC: IATGarbageCollector;
begin
  AHash := TATGC.Collect(TIdHashSHA1.Create, AGC);
  Result := AHash.HashStringAsHex(APwd);
end;

function PasswordHashSHA224(const APwd: String): string;
var
  AHash: TIdHashSHA224;
  AGC: IATGarbageCollector;
begin
  AHash := TATGC.Collect(TIdHashSHA224.Create, AGC);
  Result := AHash.HashStringAsHex(APwd);
end;

function PasswordHashSHA256(const APwd: String): string;
var
  AHash: TIdHashSHA256;
  AGC: IATGarbageCollector;
begin
  AHash := TATGC.Collect(TIdHashSHA256.Create, AGC);
  Result := AHash.HashStringAsHex(APwd);
end;

function PasswordHashSHA384(const APwd: String): string;
var
  AHash: TIdHashSHA384;
  AGC: IATGarbageCollector;
begin
  AHash := TATGC.Collect(TIdHashSHA384.Create, AGC);
  Result := AHash.HashStringAsHex(APwd);
end;

function PasswordHashSHA512(const APwd: String): string;
var
  AHash: TIdHashSHA512;
  AGC: IATGarbageCollector;
begin
  AHash := TATGC.Collect(TIdHashSHA512.Create, AGC);
  Result := AHash.HashStringAsHex(APwd);
end;



function StringHashSHA1(const Value: String): string;
begin
  Result := PasswordHashSHA1(Value);
end;

function StringHashSHA224(const Value: String): string;
begin
  Result := PasswordHashSHA224(Value);
end;

function StringHashSHA256(const Value: String): string;
begin
  Result := PasswordHashSHA256(Value);
end;

function StringHashSHA384(const Value: String): string;
begin
  Result := PasswordHashSHA384(Value);
end;

function StringHashSHA512(const Value: String): string;
begin
  Result := PasswordHashSHA512(Value);
end;

end.
