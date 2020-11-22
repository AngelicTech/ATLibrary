// ******************************************************************
//
// Program Name   : AT Library
// Program Version:
// Platform(s)    : Win32, Win64, OSX, Android, IOS
// Framework      : None
//
// Filename       : AT.EncDec.Hash.MD.pas
// File Version   : 2.00
// Date Created   : 26-APR-2016
// Author         : Matthew S. Vesperman
//
// Description:
//
// MD Hashing functions...
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


unit AT.EncDec.Hash.MD;

interface

function HashMD2ofFile(AFileName: String): String; inline;
function HashMD4ofFile(AFileName: String): String; inline;
function HashMD5ofFile(AFileName: String): String; inline;

function StringHashMD2(Value: String): String; inline;
function StringHashMD4(Value: String): String; inline;
function StringHashMD5(Value: String): String; inline;


implementation

uses
  IdHash, IdHashMessageDigest, System.SysUtils, System.Classes,
  AT.GarbageCollector;

function _HashMDofFile(const AFileName: String;
    AHash: TIdHashMessageDigest): String; inline;
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

function HashMD2ofFile(AFileName: String): String; inline;
var
  AHash: TIdHashMessageDigest2;
  AGC: IATGarbageCollector;
begin
  AHash := TATGC.Collect(TIdHashMessageDigest2.Create, AGC);
  Result := _HashMDofFile(AFileName, AHash)
end;

function HashMD4ofFile(AFileName: String): String; inline;
var
  AHash: TIdHashMessageDigest4;
  AGC: IATGarbageCollector;
begin
  AHash := TATGC.Collect(TIdHashMessageDigest4.Create, AGC);
  Result := _HashMDofFile(AFileName, AHash)
end;

function HashMD5ofFile(AFileName: String): String; inline;
var
  AHash: TIdHashMessageDigest5;
  AGC: IATGarbageCollector;
begin
  AHash := TATGC.Collect(TIdHashMessageDigest5.Create, AGC);
  Result := _HashMDofFile(AFileName, AHash)
end;



function StringHashMD2(Value: String): String; inline;
var
  AHash: TIdHashMessageDigest2;
  AGC: IATGarbageCollector;
begin
  AHash := TATGC.Collect(TIdHashMessageDigest2.Create, AGC);
  Result := AHash.HashStringAsHex(Value);
end;

function StringHashMD4(Value: String): String; inline;
var
  AHash: TIdHashMessageDigest4;
  AGC: IATGarbageCollector;
begin
  AHash := TATGC.Collect(TIdHashMessageDigest4.Create, AGC);
  Result := AHash.HashStringAsHex(Value);
end;

function StringHashMD5(Value: String): String; inline;
var
  AHash: TIdHashMessageDigest5;
  AGC: IATGarbageCollector;
begin
  AHash := TATGC.Collect(TIdHashMessageDigest5.Create, AGC);
  Result := AHash.HashStringAsHex(Value);
end;



end.
