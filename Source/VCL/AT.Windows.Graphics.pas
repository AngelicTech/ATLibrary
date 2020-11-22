//****************************************************************************
//
//  Program Name   : - AT Library -
//  Program Version: 1.00
//  Filenames      : AT.Windows.Graphics.pas
//  File Version   : 1.00
//  Date Created   : 28-JAN-2014
//  Author         : Matthew S. Vesperman
//
//  Description:
//
//  Angelic Tech generic graphics operations... (Migrated from SSGraphics.pas)
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

//TODO: Convert routines to use faster bit manipulations.

unit AT.Windows.Graphics;

interface

uses
  System.Types, Vcl.Graphics;

///	<summary>
///	  Converts a Font Style set into an integer value.
///	</summary>
///	<param name="AStyles">
///	  The font style to convert.
///	</param>
///	<returns>
///	  An integer where each value in AStyles is represented by a bit position.
///	</returns>
///	<remarks>
///	  <para>
///	    Bit positions are set as follows.
///	  </para>
///	  <para>
///	    fsBold        : Bit position 0
///	  </para>
///	  <para>
///	    fsItalic        : Bit position 1
///	  </para>
///	  <para>
///	    fsUnderline : Bit position 2
///	  </para>
///	  <para>
///	    fsStrikeout : Bit position 4
///	  </para>
///	</remarks>
function FontStyleToInt(const AStyles: TFontStyles): Integer;

///	<summary>
///	  Converts an integer value into a Font Style set.
///	</summary>
///	<param name="AValue">
///	  The value to convert.
///	</param>
///	<returns>
///	  Returns a font style set containing font styles whos bits were set in
///	  AValue.
///	</returns>
///	<remarks>
///	  <para>
///	    The set contains font styles based on which bits are set in AValue.
///	  </para>
///	  <para>
///	    Bit position 0 : fsBold 
///	  </para>
///	  <para>
///	    Bit position 1 : fsItalic
///	  </para>
///	  <para>
///	    Bit position 2 : fsUnderline
///	  </para>
///	  <para>
///	    Bit position 4 : fsStrikeout
///	  </para>
///	</remarks>
function IntToFontStyles(const AValue: Integer): TFontStyles;

///	<summary>
///	  Determines if a point is inside a rectangle.
///	</summary>
///	<param name="APoint">
///	  The point to check for.
///	</param>
///	<param name="ARect">
///	  The rectangle to check.
///	</param>
///	<returns>
///	  Returns TRUE if APoint lies inside ARect, FALSE otherwise.
///	</returns>
function PointInRect(const APoint: TPoint; const ARect: TRect): Boolean;

///	<summary>
///	  Converts a color specified by RGB values to TColor format.
///	</summary>
///	<param name="R">
///	  The red value.
///	</param>
///	<param name="G">
///	  The green value.
///	</param>
///	<param name="B">
///	  The blue value.
///	</param>
///	<returns>
///	  The RGB values converted to a TColor.
///	</returns>
function RGBToTColor(const R, G, B: Integer): TColor;

///	<summary>
///	  Converts a TColor to its RGB values.
///	</summary>
///	<param name="AColor">
///	  A color in TColor format.
///	</param>
///	<param name="R">
///	  A variable to receive the red value.
///	</param>
///	<param name="G">
///	  A variable to receive the green value.
///	</param>
///	<param name="B">
///	  A variable to receive the blue value.
///	</param>
procedure TColorToRGB(const AColor: TColor; var R, G, B: Integer);

implementation

uses
  System.UITypes;

const
  iFSBold      = 1;
  iFSItalic    = 2;
  iFSUnderline = 4;
  iFSStrikeOut = 8;

function FontStyleToInt(const AStyles: TFontStyles): Integer;
begin
  Result := 0;
  if (fsBold IN AStyles) then
    Inc(Result, iFSBold);
  if (fsItalic IN AStyles) then
    Inc(Result, iFSItalic);
  if (fsUnderline IN AStyles) then
    Inc(Result, iFSUnderline);
  if (fsStrikeOut IN AStyles) then
    Inc(Result, iFSStrikeOut);
end;

function IntToFontStyles(const AValue: Integer): TFontStyles;
begin
  Result := [];
  if ((iFSBold AND AValue) = iFSBold) then
    Result := Result + [fsBold];
  if ((iFSItalic AND AValue) = iFSItalic) then
    Result := Result + [fsItalic];
  if ((iFSUnderline AND AValue) = iFSUnderline) then
    Result := Result + [fsUnderline];
  if ((iFSStrikeOut AND AValue) = iFSStrikeOut) then
    Result := Result + [fsStrikeOut];
end;

function PointInRect(const APoint: TPoint; const ARect: TRect): Boolean;
begin
  Result := (APoint.X >= ARect.Left) AND (APoint.X <= ARect.Right) AND
            (APoint.Y >= ARect.Top) AND (APoint.Y <= ARect.Bottom);
end;

function RGBToTColor(const R, G, B: Integer): TColor;
begin
  Result := R OR (G SHL 8) OR (B SHL 16);
end;

procedure TColorToRGB(const AColor: TColor; var R, G, B: Integer);
begin
  R := AColor AND $000000FF;
  G := (AColor SHR 8) AND $000000FF;
  B := (AColor SHR 16) AND $000000FF;
end;

end.

