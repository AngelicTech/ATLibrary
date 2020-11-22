//************************************************************************
//
// Program Name   : @Library
// Program Version: 1.00
// Platforms      : Win32, Win64
// Framework      : VCL, FireMonkey
// Filename       : AT.Config.Storage.INI.pas
// File Version   : 1.10
// Date Created   : 01-AUG-2014
// Author         : Matthew S. Vesperman
//
// Description:
//
// INI config storage class.
//
// Revision History:
//
// v1.00   :   Initial version
// v1.10   :   Added DeleteSection method
//
//************************************************************************
//
// COPYRIGHT © 2014 Angelic Technology
// ALL RIGHTS RESERVED WORLDWIDE
//
//************************************************************************

unit AT.Config.Storage.INI;

interface

uses
  System.Classes, AT.Config.Storage.Custom, System.SysUtils,
  System.IniFiles;

type
  TATConfigIniStorage = class(TATCustomConfigStorage)
  strict private
    FFileName: TFileName;
    function CreateIni: TIniFile; virtual;
  strict protected
    procedure WriteCfgHeaderComment(const AHandle: Integer; const AValue:
        String); virtual;
  public
    constructor Create; overload; override;
    constructor Create(const sFileName: TFileName); overload; virtual;
    destructor Destroy; override;
    procedure DeleteEntry(const sSection: String; const sEntry: String);
        override;
    procedure DeleteSection(const sSection: String); override;
    function ReadBoolean(const sSection: String; const sEntry: String; const
        bDefault: Boolean): Boolean; override;
    function ReadCurrency(const sSection: String; const sEntry: String; const
        cDefault: Currency): Currency; override;
    function ReadDate(const sSection: String; const sEntry: String; const
        dtDefault: TDateTime): TDateTime; override;
    function ReadDateTime(const sSection: String; const sEntry: String; const
        dtDefault: TDateTime): TDateTime; override;
    function ReadDouble(const sSection: String; const sEntry: String; const
        rDefault: Double): Double; override;
    function ReadInteger(const sSection: String; const sEntry: String; const
        iDefault: Integer): Integer; override;
    function ReadString(const sSection, sEntry, sDefault: String): string; override;
    function ReadTime(const sSection: String; const sEntry: String; const
        dtDefault: TDateTime): TDateTime; override;
    procedure WriteBoolean(const sSection: String; const sEntry: String; const
        bValue: Boolean); override;
    procedure WriteCurrency(const sSection: String; const sEntry: String; const
        cValue: Currency); override;
    procedure WriteDate(const sSection: String; const sEntry: String; const
        dtValue: TDateTime); override;
    procedure WriteDateTime(const sSection: String; const sEntry: String; const
        dtValue: TDateTime); override;
    procedure WriteDouble(const sSection: String; const sEntry: String; const
        rValue: Double); override;
    procedure WriteInteger(const sSection: String; const sEntry: String; const
        iValue: Integer); override;
    procedure WriteString(const sSection: String; const sEntry: String; const
        sValue: String); override;
    procedure WriteTime(const sSection: String; const sEntry: String; const
        dtValue: TDateTime); override;
  published
    property FileName: TFileName read FFileName write FFileName;
  end;


implementation

{$IF Defined(MSWINDOWS)}
uses
  Winapi.Windows;
{$ENDIF}

{
***************************** TATConfigIniStorage ******************************
}
constructor TATConfigIniStorage.Create;
begin
  inherited Create;
end;

constructor TATConfigIniStorage.Create(const sFileName: TFileName);
resourcestring
  resCfgHdrComnt1  = '; **********************************************************************************' + #13#10;
  resCfgHdrComnt2  = ';  UNLESS INSTRUCTED TO DO SO, DO NOT MAKE ANY MANUAL CHANGES TO THIS FILE.         ' + #13#10;
  resCfgHdrComnt3  = ';  DOING SO CAN MAKE YOUR SOFTWARE RUN INCORRECTLY, OR COULD EVEN MAKE IT UNUSABLE. ' + #13#10;
  resCfgHdrComnt4  = ';  IF YOU MAKE MANUAL CHANGES YOU DO SO AT YOUR OWN RISK!                           ' + #13#10;
  resCfgHdrComnt5  = '; **********************************************************************************' + #13#10;
var
  aHandle:  Integer;
begin
  Self.Create;
  Self.FileName := sFileName;
  if (NOT FileExists(Self.FileName)) then
    begin
      aHandle := FileCreate(Self.FileName);

      WriteCfgHeaderComment(aHandle, resCfgHdrComnt1);
      WriteCfgHeaderComment(aHandle, resCfgHdrComnt2);
      WriteCfgHeaderComment(aHandle, resCfgHdrComnt3);
      WriteCfgHeaderComment(aHandle, resCfgHdrComnt4);
      WriteCfgHeaderComment(aHandle, resCfgHdrComnt5);

      FileClose(aHandle);
    end;
end;

destructor TATConfigIniStorage.Destroy;
begin
  inherited Destroy;
end;

function TATConfigIniStorage.CreateIni: TIniFile;
begin
  if (Self.FileName <> '') then
    begin
      Result := TIniFile.Create(Self.FileName);
    end
  else
    Result := NIL;
end;

procedure TATConfigIniStorage.DeleteEntry(const sSection: String; const sEntry:
    String);
var
  Ini: TIniFile;
begin
  Ini := CreateIni;
  try
    if (Assigned(Ini)) then
      begin
        Ini.DeleteKey(sSection, sEntry);
      end;
  finally
    Ini.Free;
  end;
end;

procedure TATConfigIniStorage.DeleteSection(const sSection: String);
var
  Ini: TIniFile;
begin
  Ini := CreateIni;
  try
    if (Assigned(Ini)) then
      begin
        Ini.EraseSection(sSection);
      end;
  finally
    Ini.Free;
  end;
end;

function TATConfigIniStorage.ReadBoolean(const sSection: String; const sEntry:
    String; const bDefault: Boolean): Boolean;
var
  Ini: TIniFile;
begin
  Ini := CreateIni;
  try
    try
      Result := bDefault;
      if (Assigned(Ini)) then
        begin
          Result := Ini.ReadBool(sSection, sEntry, bDefault);
        end;
    except
      Result := bDefault;
    end;
  finally
    Ini.Free;
  end;
end;

function TATConfigIniStorage.ReadCurrency(const sSection: String; const sEntry:
    String; const cDefault: Currency): Currency;
var
  Ini: TIniFile;
  sVal: string;
begin
  Ini := CreateIni;
  try
    try
      Result := cDefault;
      if (Assigned(Ini)) then
        begin
          sVal := CurrToStr(cDefault);
          sVal := Ini.ReadString(sSection, sEntry, sVal);
          Result := StrToCurr(sVal);
        end;
    except
      Result := cDefault;
    end;
  finally
    Ini.Free;
  end;
end;

function TATConfigIniStorage.ReadDate(const sSection: String; const sEntry:
    String; const dtDefault: TDateTime): TDateTime;
var
  Ini: TIniFile;
begin
  Ini := CreateIni;
  try
    try
      Result := dtDefault;
      if (Assigned(Ini)) then
        begin
          Result := Ini.ReadDate(sSection, sEntry, dtDefault);
        end;
    except
      Result := dtDefault;
    end;
  finally
    Ini.Free;
  end;
end;

function TATConfigIniStorage.ReadDateTime(const sSection: String; const sEntry:
    String; const dtDefault: TDateTime): TDateTime;
var
  Ini: TIniFile;
begin
  Ini := CreateIni;
  try
    try
      Result := dtDefault;
      if (Assigned(Ini)) then
        begin
          Result := Ini.ReadDateTime(sSection, sEntry, dtDefault);
        end;
    except
      Result := dtDefault;
    end;
  finally
    Ini.Free;
  end;
end;

function TATConfigIniStorage.ReadDouble(const sSection: String; const sEntry:
    String; const rDefault: Double): Double;
var
  Ini: TIniFile;
begin
  Ini := CreateIni;
  try
    try
      Result := rDefault;
      if (Assigned(Ini)) then
        begin
          Result := Ini.ReadFloat(sSection, sEntry, rDefault);
        end;
    except
      Result := rDefault;
    end;
  finally
    Ini.Free;
  end;
end;

function TATConfigIniStorage.ReadInteger(const sSection: String; const sEntry:
    String; const iDefault: Integer): Integer;
var
  Ini: TIniFile;
begin
  Ini := CreateIni;
  try
    try
      Result := iDefault;
      if (Assigned(Ini)) then
        begin
          Result := Ini.ReadInteger(sSection, sEntry, iDefault);
        end;
    except
      Result := iDefault;
    end;
  finally
    Ini.Free;
  end;
end;

function TATConfigIniStorage.ReadString(const sSection, sEntry,
    sDefault: String): string;
var
  Ini: TIniFile;
begin
  Ini := CreateIni;
  try
    try
      Result := sDefault;
      if (Assigned(Ini)) then
        begin
          Result := Ini.ReadString(sSection, sEntry, sDefault);
        end;
    except
      Result := sDefault;
    end;
  finally
    Ini.Free;
  end;
end;

function TATConfigIniStorage.ReadTime(const sSection: String; const sEntry:
    String; const dtDefault: TDateTime): TDateTime;
var
  Ini: TIniFile;
begin
  Ini := CreateIni;
  try
    try
      Result := dtDefault;
      if (Assigned(Ini)) then
        begin
          Result := Ini.ReadTime(sSection, sEntry, dtDefault);
        end;
    except
      Result := dtDefault;
    end;
  finally
    Ini.Free;
  end;
end;

procedure TATConfigIniStorage.WriteBoolean(const sSection: String; const
    sEntry: String; const bValue: Boolean);
var
  Ini: TIniFile;
begin
  Ini := CreateIni;
  try
    try
      if (Assigned(Ini)) then
        begin
          Ini.WriteBool(sSection, sEntry, bValue);
        end;
    except
    end;
  finally
    Ini.Free;
  end;
end;

procedure TATConfigIniStorage.WriteCfgHeaderComment(const AHandle: Integer;
    const AValue: String);
var
  sValue: String;
begin
  sValue := AValue;
  FileWrite(AHandle, sValue[1], Length(sValue));
end;

procedure TATConfigIniStorage.WriteCurrency(const sSection: String; const
    sEntry: String; const cValue: Currency);
var
  Ini: TIniFile;
  sVal: string;
begin
  Ini := CreateIni;
  try
    try
      if (Assigned(Ini)) then
        begin
          sVal := CurrToStr(cValue);
          Ini.WriteString(sSection, sEntry, sVal);
        end;
    except
    end;
  finally
    Ini.Free;
  end;
end;

procedure TATConfigIniStorage.WriteDate(const sSection: String; const sEntry:
    String; const dtValue: TDateTime);
var
  Ini: TIniFile;
begin
  Ini := CreateIni;
  try
    try
      if (Assigned(Ini)) then
        begin
          Ini.WriteDate(sSection, sEntry, dtValue);
        end;
    except
    end;
  finally
    Ini.Free;
  end;
end;

procedure TATConfigIniStorage.WriteDateTime(const sSection: String; const
    sEntry: String; const dtValue: TDateTime);
var
  Ini: TIniFile;
begin
  Ini := CreateIni;
  try
    try
      if (Assigned(Ini)) then
        begin
          Ini.WriteDateTime(sSection, sEntry, dtValue);
        end;
    except
    end;
  finally
    Ini.Free;
  end;
end;

procedure TATConfigIniStorage.WriteDouble(const sSection: String; const sEntry:
    String; const rValue: Double);
var
  Ini: TIniFile;
begin
  Ini := CreateIni;
  try
    try
      if (Assigned(Ini)) then
        begin
          Ini.WriteFloat(sSection, sEntry, rValue);
        end;
    except
    end;
  finally
    Ini.Free;
  end;
end;

procedure TATConfigIniStorage.WriteInteger(const sSection: String; const
    sEntry: String; const iValue: Integer);
var
  Ini: TIniFile;
begin
  Ini := CreateIni;
  try
    try
      if (Assigned(Ini)) then
        begin
          Ini.WriteInteger(sSection, sEntry, iValue);
        end;
    except
    end;
  finally
    Ini.Free;
  end;
end;

procedure TATConfigIniStorage.WriteString(const sSection: String; const sEntry:
    String; const sValue: String);
var
  Ini: TIniFile;
begin
  Ini := CreateIni;
  try
    try
      if (Assigned(Ini)) then
        begin
          Ini.WriteString(sSection, sEntry, sValue);
        end;
    except
    end;
  finally
    Ini.Free;
  end;
end;

procedure TATConfigIniStorage.WriteTime(const sSection: String; const sEntry:
    String; const dtValue: TDateTime);
var
  Ini: TIniFile;
begin
  Ini := CreateIni;
  try
    try
      if (Assigned(Ini)) then
        begin
          Ini.WriteTime(sSection, sEntry, dtValue);
        end;
    except
    end;
  finally
    Ini.Free;
  end;
end;

end.
