//****************************************************************************
//
//  Program Name   : - AT Library -
//  Program Version: 1.00
//  Filenames      : AT.Windows.Graphics.Watermark.pas
//  File Version   : 1.00
//  Date Created   : 26-JAN-2014
//  Author         : Matthew S. Vesperman
//
//  Description:
//
//  Windows graphics watermarking functions... (Migrated from SSWatermark.pas)
//
//  Revision History:
//
//    v1.00   :   Initial version for Delphi XE5
//
//****************************************************************************
//
//  COPYRIGHT © 2013-Present Angelic Technology
//  ALL RIGHTS RESERVED WORLDWIDE
//
//****************************************************************************

unit AT.Windows.Graphics.Watermark;

interface

uses
  Vcl.Graphics;

type
  ///	<summary>
  ///	  The type of watermark to create.
  ///	</summary>
  TwmType = (
    ///	<summary>
    ///	  Place watermark in the top/left corner of the image.
    ///	</summary>
    wmTopLeft,

    ///	<summary>
    ///	  Place watermark in the center of the top of the watermark.
    ///	</summary>
    wmTopCenter,

    ///	<summary>
    ///	  Place watermark in the top/right corner of the image.
    ///	</summary>
    wmTopRight,

    ///	<summary>
    ///	  Place watermark in the center of the left side of the image.
    ///	</summary>
    wmCenterLeft,

    ///	<summary>
    ///	  Place watermark in the center of the image.
    ///	</summary>
    wmCenter,

    ///	<summary>
    ///	  Place watermark in the center of the right side of the image.
    ///	</summary>
    wmCenterRight,

    ///	<summary>
    ///	  Place watermark in the bottom/left corner of the image.
    ///	</summary>
    wmBottomLeft,

    ///	<summary>
    ///	  Place watermark in the center of the bottom of the watermark.
    ///	</summary>
    wmBottomCenter,

    ///	<summary>
    ///	  Place watermark in the bottom/right corner of the image.
    ///	</summary>
    wmBottomRight,

    ///	<summary>
    ///	  Place the watermark in a random x,y position on the image.
    ///	</summary>
    wmRndXRndY,

    ///	<summary>
    ///	  Place the watermark at a set X position and a random Y position.
    ///	</summary>
    wmSetXRndY,

    ///	<summary>
    ///	  Place the watermark at a random X position and a set Y position.
    ///	</summary>
    wmRndXSetY,

    ///	<summary>
    ///	  Place the watermark at a set X position and a set Y position.
    ///	</summary>
    wmSetXSetY
  );

///	<summary>
///	  Places a watermark on a bitmap image.
///	</summary>
///	<param name="wmMode">
///	  The watermark type to use.
///	</param>
///	<param name="ABmp">
///	  A variable containing the image to place the watermark on.
///	</param>
///	<param name="ATxt">
///	  The text to use for the watermark.
///	</param>
///	<param name="AFntName">
///	  The name of the font to use for watermarking the image.
///	</param>
///	<param name="AFntStyle">
///	  The set of font styles to use for watermarking the image.
///	</param>
///	<param name="AFntSize">
///	  The font size (in pixels) to use when watermarking the image.
///	</param>
///	<param name="X">
///	  The X position to place the watermark at when wmMode is wmSetXRndY or
///	  wmSetXSetY
///	</param>
///	<param name="Y">
///	  The Y position to place the watermark at when wmMode is wmRndXSetY or
///	  wmSetXSetY
///	</param>
procedure WatermarkImage(const wmMode: TwmType; var ABmp: TBitmap;
                             const ATxt: string; const AFntName: string;
                             const AFntStyle: TFontStyles;
                             const AFntSize: integer; X: integer;
                             Y: integer; const AdjRed: integer;
                             const AdjGrn: integer;
                             const AdjBlu: integer); overload;

implementation

uses
  Vcl.Dialogs, Vcl.ExtCtrls, System.SysUtils, AT.Windows.Graphics;

type
  TWMRGB32 = packed record
    R, G, B, A: Byte;
  end;

  TWMRGB32Array = packed array[0..MaxInt DIV SizeOf(TWMRGB32) - 1] of TWMRGB32;
  PWMRGB32Array = ^TWMRGB32Array;

function Limit256(I:integer):integer;
begin
  if I<0 then I:=0;
  if I>255 then I:=255;
  Limit256:=I;
end;

procedure WatermarkImage(const wmMode: TwmType; var ABmp: TBitmap;
                             const ATxt: string; const AFntName: string;
                             const AFntStyle: TFontStyles;
                             const AFntSize: integer; X: integer;
                             Y: integer; const AdjRed: integer;
                             const AdjGrn: integer;
                             const AdjBlu: integer); overload;
var
 I      : integer;
 Y2     : integer;
 X2     : integer;
 IH     : integer;
 IW     : integer;
 TH     : integer;
 TW     : integer;
 TmpImg : TImage;
 TmpBmp : TBitmap;
 OldPF  : TPixelFormat;
 Line1  : PWMRGB32Array;
 Line2  : PWMRGB32Array;
begin
  TmpImg:=TImage.Create(NIL);
  try
    TmpImg.Picture:=nil;
    with TmpImg do
      begin
        Canvas.Pen.Color := clWhite;
        Canvas.Pen.Style := psSolid;
        Canvas.Font.Name := AFntName;
        Canvas.Font.Color := clBlack;
        Canvas.Font.Style := AFntStyle;
        if (AFntSize > 0) then
          begin
            Canvas.Font.Size := AFntSize;
            TW := Canvas.TextWidth(ATxt);
            TH := Canvas.TextHeight(ATxt);
          end
        else
          begin
            TW := ABmp.Width;
            TH := ABmp.Height;
            I := 7;
            repeat
              inc(I);
              Canvas.Font.Size := I;
            until (Canvas.TextWidth(ATxt) > TW) or (Canvas.TextHeight(ATxt) > TH);
            dec(I);
            Canvas.Font.Size := I;
            TW := Canvas.TextWidth(ATxt);
            TH := Canvas.TextHeight(ATxt);
          end;
      end;
    TmpImg.Width := TW;
    TmpImg.Picture.Bitmap.Width := TW;
    TmpImg.Height := TH;
    TmpImg.Picture.Bitmap.Height := TH;
    TmpImg.Repaint;
    TmpImg.Canvas.TextOut(0, 0, ATxt);
    TmpImg.Refresh;
    if (TmpImg.Canvas.Pixels[0,0] < 0) then
      ShowMessage('TmpImg pixel error.');
    if (ABmp.Canvas.Pixels[0,0] < 0) then
      ShowMessage('vImage pixel error.');
    IW := ABmp.Width;
    IH := ABmp.Height;
    case wmMode of
      wmTopLeft     : begin
                        X := 0;
                        Y := 0;
                      end;
      wmTopCenter   : begin
                        X := IW div 2 - TW div 2;
                        Y := 0;
                      end;
      wmTopRight    : begin
                        X := IW -TW;
                        Y := 0;
                      end;
      wmCenterLeft  : begin
                        X := 0;
                        Y := IH div 2 - TH div 2;
                      end;
      wmCenter      : begin
                        X := IW div 2 - TW div 2;
                        Y := IH div 2 - TH div 2;
                      end;
      wmCenterRight : begin
                        X := IW -TW;
                        Y := IH div 2 - TH div 2;
                      end;
      wmBottomLeft  : begin
                        X := 0;
                        Y := IH -TH;
                      end;
      wmBottomCenter: begin
                        X := IW div 2 - TW div 2;
                        Y := IH -TH;
                      end;
      wmBottomRight : begin
                        X := IW -TW;
                        Y := IH -TH;
                      end;
      wmRndXRndY    : begin
                        X := Random(IW-TW);
                        Y := Random(IH-TH);
                      end;
      wmSetXRndY    : begin
                        {X passed}
                        Y := Random(IH-TH);
                      end;
      wmRndXSetY    : begin
                        X := Random(IW-TW);
                        {Y passed}
                      end;
      wmSetXSetY    : begin
                        {X passed}
                        {Y passed}
                        //DoNothing;
                      end;
    end;
    TmpBmp := TBitmap.Create;
    try
      TmpBmp.Assign(TmpImg.Picture.Graphic);
      TmpBmp.PixelFormat := pf32bit;
      OldPF := ABmp.PixelFormat;
      ABmp.PixelFormat := pf32bit;
      for Y2 := 0 to (TH - 1) do
        begin
          Line1 := TmpBmp.ScanLine[Y2];
          Line2 := ABmp.ScanLine[Y2 + Y];
          for X2 := 0 to (TW - 1) do
            begin
              if (RGBToTColor(Line1[X2].R, Line1[X2].G, Line1[X2].B) = clBlack) then
                begin
                  try
                    Line2[X2 + X].R := Limit256(Line2[X2 + X].R + AdjRed);
                    Line2[X2 + X].G := Limit256(Line2[X2 + X].G + AdjRed);
                    Line2[X2 + X].B := Limit256(Line2[X2 + X].B + AdjRed);
                  except
                    Continue;
                  end;
                end;
            end;
        end;
      ABmp.PixelFormat := OldPF;
    finally
      TmpBmp.Free;
    end;
  finally
    TmpImg.Free;
  end;
end;

end.

