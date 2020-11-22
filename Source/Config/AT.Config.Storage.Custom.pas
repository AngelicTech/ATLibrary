//************************************************************************
//
// Program Name   : AT Library
// Platform(s)    : Android, iOS, Linux, MacOS, Windows
// Framework      : Console, FMX, VCL
//
// Filename       : AT.Config.Storage.Custom.pas
// Date Created   : 01-AUG-2014
// Author         : Matthew Vesperman
//
// Description:
//
// Custom config storage class.
//
// Revision History:
//
// v1.00   :   Initial version
// v1.10   :   Added DeleteSection method
// v1.20   :   Changed base class to TInterfacedPersistent (08-Apr-2018)
//
//************************************************************************
//
// COPYRIGHT © 2014 Angelic Technology
// ALL RIGHTS RESERVED WORLDWIDE
//
//************************************************************************

/// <summary>
///   Custom configuration storage class.
/// </summary>
unit AT.Config.Storage.Custom;

interface

uses
  System.Classes;

type
  TATCustomConfigStorage = class(TInterfacedPersistent)
  strict private
    FCanCreateSection: Boolean;
    FDefaultBoolean: Boolean;
    FDefaultCurrency: Currency;
    FDefaultDate: TDateTime;
    FDefaultDateTime: TDateTime;
    FDefaultDouble: Double;
    FDefaultInteger: Integer;
    FDefaultSection: string;
    FDefaultString: string;
    FDefaultTime: TDateTime;
    FUpdating: Boolean;
  strict protected
    procedure BeginUpdate; virtual;
    procedure EndUpdate; virtual;
    function GetBooleanValues(Entry: String): Boolean; virtual;
    function GetCurrencyValues(Entry: String): Currency; virtual;
    function GetDates(Entry: String): TDateTime; virtual;
    function GetDateTimeValues(Entry: String): TDateTime; virtual;
    function GetDoubles(Entry: String): Double; virtual;
    function GetIntegers(Entry: String): Integer; virtual;
    function GetStrings(Entry: String): string; virtual;
    function GetTimes(Entry: String): TDateTime; virtual;
    procedure SetBooleanValues(Entry: String; Value: Boolean); virtual;
    procedure SetCurrencyValues(Entry: String; Value: Currency); virtual;
    procedure SetDates(Entry: String; Value: TDateTime); virtual;
    procedure SetDateTimeValues(Entry: String; Value: TDateTime); virtual;
    procedure SetDoubles(Entry: String; Value: Double); virtual;
    procedure SetIntegers(Entry: String; Value: Integer); virtual;
    procedure SetStrings(Entry: String; Value: string); virtual;
    procedure SetTimes(Entry: String; Value: TDateTime); virtual;
    property Updating: Boolean read FUpdating;
  public
    constructor Create; overload; virtual;
    destructor Destroy; override;
    procedure DeleteEntry(const sSection: String; const sEntry: String);
        virtual; abstract;
    procedure DeleteSection(const sSection: String); virtual; abstract;
    function ReadBoolean(const sSection: String; const sEntry: String; const
        bDefault: Boolean): Boolean; virtual; abstract;
    function ReadCurrency(const sSection: String; const sEntry: String; const
        cDefault: Currency): Currency; virtual; abstract;
    function ReadDate(const sSection: String; const sEntry: String; const
        dtDefault: TDateTime): TDateTime; virtual; abstract;
    function ReadDateTime(const sSection: String; const sEntry: String; const
        dtDefault: TDateTime): TDateTime; virtual; abstract;
    function ReadDouble(const sSection: String; const sEntry: String; const
        rDefault: Double): Double; virtual; abstract;
    function ReadInteger(const sSection: String; const sEntry: String; const
        iDefault: Integer): Integer; virtual; abstract;
    function ReadString(const sSection, sEntry, sDefault: String): string; virtual;
        abstract;
    function ReadTime(const sSection: String; const sEntry: String; const
        dtDefault: TDateTime): TDateTime; virtual; abstract;
    procedure WriteBoolean(const sSection: String; const sEntry: String; const
        bValue: Boolean); virtual; abstract;
    procedure WriteCurrency(const sSection: String; const sEntry: String; const
        cValue: Currency); virtual; abstract;
    procedure WriteDate(const sSection: String; const sEntry: String; const
        dtValue: TDateTime); virtual; abstract;
    procedure WriteDateTime(const sSection: String; const sEntry: String; const
        dtValue: TDateTime); virtual; abstract;
    procedure WriteDouble(const sSection: String; const sEntry: String; const
        rValue: Double); virtual; abstract;
    procedure WriteInteger(const sSection: String; const sEntry: String; const
        iValue: Integer); virtual; abstract;
    procedure WriteString(const sSection: String; const sEntry: String; const
        sValue: String); virtual; abstract;
    procedure WriteTime(const sSection: String; const sEntry: String; const
        dtValue: TDateTime); virtual; abstract;
    property BooleanValues[Entry: String]: Boolean read GetBooleanValues write
        SetBooleanValues;
    property CurrencyValues[Entry: String]: Currency read GetCurrencyValues
        write SetCurrencyValues;
    property Dates[Entry: String]: TDateTime read GetDates write SetDates;
    property DateTimeValues[Entry: String]: TDateTime read GetDateTimeValues
        write SetDateTimeValues;
    property Doubles[Entry: String]: Double read GetDoubles write SetDoubles;
    property Integers[Entry: String]: Integer read GetIntegers write
        SetIntegers;
    property Strings[Entry: String]: string read GetStrings write SetStrings;
    property Times[Entry: String]: TDateTime read GetTimes write SetTimes;
  published
    property CanCreateSection: Boolean read FCanCreateSection write
        FCanCreateSection default True;
    property DefaultBoolean: Boolean read FDefaultBoolean write FDefaultBoolean
        default False;
    property DefaultCurrency: Currency read FDefaultCurrency write
        FDefaultCurrency;
    property DefaultDate: TDateTime read FDefaultDate write FDefaultDate;
    property DefaultDateTime: TDateTime read FDefaultDateTime write
        FDefaultDateTime;
    property DefaultDouble: Double read FDefaultDouble write FDefaultDouble;
    property DefaultInteger: Integer read FDefaultInteger write FDefaultInteger
        default 0;
    property DefaultSection: string read FDefaultSection write FDefaultSection;
    property DefaultString: string read FDefaultString write FDefaultString;
    property DefaultTime: TDateTime read FDefaultTime write FDefaultTime;
  end;


implementation

uses System.SysUtils;

{
**************************** TATCustomConfigStorage ****************************
}
constructor TATCustomConfigStorage.Create;
begin
  inherited Create;
  FCanCreateSection := True;
  FDefaultBoolean := False;
  FDefaultCurrency := 0.0;
  FDefaultDate := Date;
  FDefaultDateTime := Now;
  FDefaultDouble := 0.0;
  FDefaultInteger := 0;
  FDefaultSection := '';
  FDefaultString := '';
  FDefaultTime := Time;
end;

destructor TATCustomConfigStorage.Destroy;
begin
  inherited Destroy;
end;

procedure TATCustomConfigStorage.BeginUpdate;
begin
  FUpdating := True;
end;

procedure TATCustomConfigStorage.EndUpdate;
begin
  FUpdating := False;
end;

function TATCustomConfigStorage.GetBooleanValues(Entry: String): Boolean;
begin
  Result := ReadBoolean(DefaultSection, Entry, DefaultBoolean);
end;

function TATCustomConfigStorage.GetCurrencyValues(Entry: String): Currency;
begin
  Result := ReadCurrency(DefaultSection, Entry, DefaultCurrency);
end;

function TATCustomConfigStorage.GetDates(Entry: String): TDateTime;
begin
  Result := ReadDate(DefaultSection, Entry, DefaultDate);
end;

function TATCustomConfigStorage.GetDateTimeValues(Entry: String): TDateTime;
begin
  Result := ReadDateTime(DefaultSection, Entry, DefaultDateTime);
end;

function TATCustomConfigStorage.GetDoubles(Entry: String): Double;
begin
  Result := ReadDouble(DefaultSection, Entry, DefaultDouble);
end;

function TATCustomConfigStorage.GetIntegers(Entry: String): Integer;
begin
  Result := ReadInteger(DefaultSection, Entry, DefaultInteger);
end;

function TATCustomConfigStorage.GetStrings(Entry: String): string;
begin
  Result := ReadString(DefaultSection, Entry, DefaultString);
end;

function TATCustomConfigStorage.GetTimes(Entry: String): TDateTime;
begin
  Result := ReadTime(DefaultSection, Entry, DefaultTime);
end;

procedure TATCustomConfigStorage.SetBooleanValues(Entry: String; Value:
    Boolean);
begin
  WriteBoolean(DefaultSection, Entry, Value);
end;

procedure TATCustomConfigStorage.SetCurrencyValues(Entry: String; Value:
    Currency);
begin
  WriteCurrency(DefaultSection, Entry, Value);
end;

procedure TATCustomConfigStorage.SetDates(Entry: String; Value: TDateTime);
begin
  WriteDate(DefaultSection, Entry, Value);
end;

procedure TATCustomConfigStorage.SetDateTimeValues(Entry: String; Value:
    TDateTime);
begin
  WriteDateTime(DefaultSection, Entry, Value);
end;

procedure TATCustomConfigStorage.SetDoubles(Entry: String; Value: Double);
begin
  WriteDouble(DefaultSection, Entry, Value);
end;

procedure TATCustomConfigStorage.SetIntegers(Entry: String; Value: Integer);
begin
  WriteInteger(DefaultSection, Entry, Value);
end;

procedure TATCustomConfigStorage.SetStrings(Entry: String; Value: string);
begin
  WriteString(DefaultSection, Entry, Value);
end;

procedure TATCustomConfigStorage.SetTimes(Entry: String; Value: TDateTime);
begin
  WriteTime(DefaultSection, Entry, Value);
end;

end.
