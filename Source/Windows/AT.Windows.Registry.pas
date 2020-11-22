//****************************************************************************
//
//  Program Name   : - AT Library -
//  Program Version: 1.00
//  Filenames      : AT.Windows.Registry.pas
//  File Version   : 1.00
//  Date Created   : 28-JAN-2014
//  Author         : Matthew S. Vesperman
//
//  Description:
//
//  Angelic Tech registry access classes... (Migrated from SSRegistry.pas)
//
//  Revision History:
//
//    v1.00   :   Initial version for Delphi XE5.
//
//****************************************************************************
//
//  COPYRIGHT © 2013-Present Angelic Technology
//  ALL RIGHTS RESERVED WORLDWIDE
//
//****************************************************************************



unit AT.Windows.Registry;

interface

uses
  System.Win.Registry;

type
  ///	<summary>
  ///	  A descendant of TRegistry that defines read functions that allow
  ///	  defaults to be specified.
  ///	</summary>
  ///	<remarks>
  ///	  Inherits all method/properties of TRegistry.
  ///	</remarks>
  TATRegistry = class(TRegistry)
  public
    ///	<summary>
    ///	  Retrieves a boolean value from the registry.
    ///	</summary>
    ///	<param name="Name">
    ///	  Registry key to retrieve.
    ///	</param>
    ///	<param name="bUseDefault">
    ///	  If key could not be read, should a default be returned?
    ///	</param>
    ///	<param name="bDefault">
    ///	  The value to return if the key could not be read.
    ///	</param>
    ///	<returns>
    ///	  Returns the value of the registry key if the key exists and is a
    ///	  boolean value. If the value could not be read and bUseDefault is TRUE
    ///	  then return bDefault, otherwise raise an exception.
    ///	</returns>
    function ReadBool(const Name: String; bUseDefault: Boolean = False;
                      const bDefault: Boolean = False): Boolean; overload; virtual;

    ///	<summary>
    ///	  Retrieves a currency value from the registry.
    ///	</summary>
    ///	<param name="Name">
    ///	  Registry key to retrieve.
    ///	</param>
    ///	<param name="bUseDefault">
    ///	  If key could not be read, should a default be returned?
    ///	</param>
    ///	<param name="cDefault">
    ///	  The value to return if the key could not be read.
    ///	</param>
    ///	<returns>
    ///	  Returns the value of the registry key if the key exists and is a 
    ///	  currency value. If the value could not be read and bUseDefault is
    ///	  TRUE then return cDefault, otherwise raise an exception.
    ///	</returns>
    function ReadCurrency(const Name: String; bUseDefault: Boolean = False;
                          const cDefault: Currency = 0.00): Currency; overload; virtual;

    ///	<summary>
    ///	  Retrieves a date value from the registry.
    ///	</summary>
    ///	<param name="Name">
    ///	  Registry key to retrieve.
    ///	</param>
    ///	<param name="bUseDefault">
    ///	  If key could not be read, should a default be returned?
    ///	</param>
    ///	<param name="dDefault">
    ///	  The value to return if the key could not be read.
    ///	</param>
    ///	<returns>
    ///	  Returns the value of the registry key if the key exists and is a date
    ///	  value. If the value could not be read and bUseDefault is TRUE then
    ///	  return dDefault, otherwise raise an exception.
    ///	</returns>
    function ReadDate(const Name: String; bUseDefault: Boolean = False;
                      const dDefault: TDateTime = 0.0): TDateTime; overload; virtual;

    ///	<summary>
    ///	  Retrieves a date/time value from the registry.
    ///	</summary>
    ///	<param name="Name">
    ///	  Registry key to retrieve.
    ///	</param>
    ///	<param name="bUseDefault">
    ///	  If key could not be read, should a default be returned?
    ///	</param>
    ///	<param name="dtDefault">
    ///	  The value to return if the key could not be read.
    ///	</param>
    ///	<returns>
    ///	  Returns the value of the registry key if the key exists and is a 
    ///	  date/time value. If the value could not be read and bUseDefault is
    ///	  TRUE then return dtDefault, otherwise raise an exception.
    ///	</returns>
    function ReadDateTime(const Name: String; bUseDefault: Boolean = False;
                          const dtDefault: TDateTime = 0.0): TDateTime; overload; virtual;

    ///	<summary>
    ///	  Retrieves a float value from the registry.
    ///	</summary>
    ///	<param name="Name">
    ///	  Registry key to retrieve.
    ///	</param>
    ///	<param name="bUseDefault">
    ///	  If key could not be read, should a default be returned?
    ///	</param>
    ///	<param name="fDefault">
    ///	  The value to return if the key could not be read.
    ///	</param>
    ///	<returns>
    ///	  Returns the value of the registry key if the key exists and is a 
    ///	  float value. If the value could not be read and bUseDefault is TRUE
    ///	  then return fDefault, otherwise raise an exception.
    ///	</returns>
    function ReadFloat(const Name: String; bUseDefault: Boolean = False;
                       const fDefault: Double = 0.0): Double; overload; virtual;

    ///	<summary>
    ///	  Retrieves a integer value from the registry.
    ///	</summary>
    ///	<param name="Name">
    ///	  Registry key to retrieve.
    ///	</param>
    ///	<param name="bUseDefault">
    ///	  If key could not be read, should a default be returned?
    ///	</param>
    ///	<param name="iDefault">
    ///	  The value to return if the key could not be read.
    ///	</param>
    ///	<returns>
    ///	  Returns the value of the registry key if the key exists and is a 
    ///	  integer value. If the value could not be read and bUseDefault is TRUE
    ///	  then return iDefault, otherwise raise an exception.
    ///	</returns>
    function ReadInteger(const Name: String; bUseDefault: Boolean = False;
                         const iDefault: Integer = 0): Integer; overload; virtual;

    ///	<summary>
    ///	  Retrieves a string value from the registry
    ///	</summary>
    ///	<param name="Name">
    ///	  Registry key to retrieve.
    ///	</param>
    ///	<param name="bUseDefault">
    ///	  If key could not be read, should a default be returned?
    ///	</param>
    ///	<param name="sDefault">
    ///	  The value to return if the key could not be read.
    ///	</param>
    ///	<returns>
    ///	  Returns the value of the registry key if the key exists and is a
    ///	  string value. If the value could not be read and bUseDefault is TRUE
    ///	  then return sDefault, otherwise raise an exception.
    ///	</returns>
    function ReadString(const Name: String; bUseDefault: Boolean = False;
                        const sDefault: String = ''): String; overload; virtual;

    ///	<summary>
    ///	  Retrieves a time value from the registry.
    ///	</summary>
    ///	<param name="Name">
    ///	  Registry key to retrieve.
    ///	</param>
    ///	<param name="bUseDefault">
    ///	  If key could not be read, should a default be returned?
    ///	</param>
    ///	<param name="tDefault">
    ///	  The value to return if the key could not be read.
    ///	</param>
    ///	<returns>
    ///	  Returns the value of the registry key if the key exists and is a time
    ///	  value. If the value could not be read and bUseDefault is TRUE then
    ///	  return tDefault, otherwise raise an exception.
    ///	</returns>
    function ReadTime(const Name: String; bUseDefault: Boolean = False;
                      const tDefault: TDateTime = 0.0): TDateTime; overload; virtual;
  end;

  ///	<summary>
  ///	  This is a descendant of TATRegistry which is defined for backward
  ///	  compatability with the original StarSoft library.
  ///	</summary>
  TSSRegistry = class(TATRegistry);

implementation

{ TSSRegistry }

function TATRegistry.ReadBool(const Name: String; bUseDefault: Boolean;
  const bDefault: Boolean): Boolean;
begin
  try
    Result := inherited ReadBool(Name);
  except
    if (bUseDefault) then
      Result := bDefault
    else
      raise;
  end;
end;

function TATRegistry.ReadCurrency(const Name: String; bUseDefault: Boolean;
  const cDefault: Currency): Currency;
begin
  try
    Result := inherited ReadCurrency(Name);
  except
    if (bUseDefault) then
      Result := cDefault
    else
      raise;
  end;
end;

function TATRegistry.ReadDate(const Name: String; bUseDefault: Boolean;
  const dDefault: TDateTime): TDateTime;
begin
  try
    Result := inherited ReadDate(Name);
  except
    if (bUseDefault) then
      Result := dDefault
    else
      raise;
  end;
end;

function TATRegistry.ReadDateTime(const Name: String; bUseDefault: Boolean;
  const dtDefault: TDateTime): TDateTime;
begin
  try
    Result := inherited ReadDateTime(Name);
  except
    if (bUseDefault) then
      Result := dtDefault
    else
      raise;
  end;
end;

function TATRegistry.ReadFloat(const Name: String; bUseDefault: Boolean;
  const fDefault: Double): Double;
begin
  try
    Result := inherited ReadFloat(Name);
  except
    if (bUseDefault) then
      Result := fDefault
    else
      raise;
  end;
end;

function TATRegistry.ReadInteger(const Name: String; bUseDefault: Boolean;
  const iDefault: Integer): Integer;
begin
  try
    Result := inherited ReadInteger(Name);
  except
    if (bUseDefault) then
      Result := iDefault
    else
      raise;
  end;
end;

function TATRegistry.ReadString(const Name: String; bUseDefault: Boolean;
  const sDefault: String): String;
begin
  try
    Result := inherited ReadString(Name);
  except
    if (bUseDefault) then
      Result := sDefault
    else
      raise;
  end;
end;

function TATRegistry.ReadTime(const Name: String; bUseDefault: Boolean;
  const tDefault: TDateTime): TDateTime;
begin
  try
    Result := inherited ReadTime(Name);
  except
    if (bUseDefault) then
      Result := tDefault
    else
      raise;
  end;
end;

end.

