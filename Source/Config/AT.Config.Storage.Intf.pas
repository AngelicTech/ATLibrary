//************************************************************************
//
// Program Name   : AT Library
// Platform(s)    : Android, iOS, Linux, MacOS, Windows
// Framework      : Console, FMX, VCL
//
// Filename       : AT.Config.Storage.Intf.pas
// Date Created   : 01-AUG-2014
// Author         : Matthew Vesperman
//
// Description:
//
// Configuration storage interfaces.
//
// Revision History:
//
// v1.00   :   Initial version
//
//************************************************************************
//
// COPYRIGHT © 2014 Angelic Technology
// ALL RIGHTS RESERVED WORLDWIDE
//
//************************************************************************

/// <summary>
///   Configuration storage interfaces.
/// </summary>
unit AT.Config.Storage.Intf;

interface

type
  ICfgStgDelete = interface
    ['{C641AF92-A0FE-4ECF-A0B7-27B6662B31F4}']
    procedure DeleteEntry(const sSection: String;
        const sEntry: String);
    procedure DeleteSection(const sSection: String);
  end;

  ICfgStgQuery = interface
    ['{B6366DDA-9ECB-459C-988F-339128AEC09B}']
    function HasEntry(const sSection: String; const
        sEntry: String): Boolean;
    function HasSection(const sSection: String): Boolean;
  end;

  ICfgStgRead = interface
    ['{817B7FE0-37BC-4BC4-9DB3-95371116805E}']
    function ReadBoolean(const sSection: String; const sEntry: String;
        const bDefault: Boolean): Boolean;
    function ReadCurrency(const sSection: String; const sEntry: String;
        const cDefault: Currency): Currency;
    function ReadDate(const sSection: String; const sEntry: String;
        const dtDefault: TDateTime): TDateTime;
    function ReadDateTime(const sSection: String; const sEntry: String;
        const dtDefault: TDateTime): TDateTime;
    function ReadDouble(const sSection: String; const sEntry: String;
        const rDefault: Double): Double;
    function ReadInteger(const sSection: String; const sEntry: String;
        const iDefault: Integer): Integer;
    function ReadString(const sSection: String; const sEntry: String;
        const sDefault: String): string;
    function ReadTime(const sSection: String; const sEntry: String;
        const dtDefault: TDateTime): TDateTime;
  end;

  ICfgStgWrite = interface
    ['{3A6988B5-D337-409C-B558-D7467C673E2A}']
    procedure WriteBoolean(const sSection: String; const sEntry: String;
        const bValue: Boolean);
    procedure WriteCurrency(const sSection: String; const sEntry: String;
        const cValue: Currency);
    procedure WriteDate(const sSection: String; const sEntry: String;
        const dtValue: TDateTime);
    procedure WriteDateTime(const sSection: String; const sEntry: String;
        const dtValue: TDateTime);
    procedure WriteDouble(const sSection: String; const sEntry: String;
        const rValue: Double);
    procedure WriteInteger(const sSection: String; const sEntry: String;
        const iValue: Integer);
    procedure WriteString(const sSection: String; const sEntry: String;
        const sValue: String);
    procedure WriteTime(const sSection: String; const sEntry: String;
        const dtValue: TDateTime);
  end;

implementation

end.
