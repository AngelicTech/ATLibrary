//****************************************************************************
//
//  Program Name   : - AT Library -
//  Program Version: 1.00
//  Filenames      : AT.Windows.Graphics.GradientDraw.pas
//  File Version   : 1.00
//  Date Created   : 28-JAN-2014
//  Author         : Matthew S. Vesperman
//
//  Description:
//
//  Angelic Tech gradient drawing reoutines... (Migrated from SSGradientDraw.pas)
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



unit AT.Windows.Graphics.GradientDraw;

interface

uses
  Winapi.Windows, Vcl.Graphics, System.Types;

type
  ///	<summary>
  ///	  Type of gradient to draw.
  ///	</summary>
  TATGradientStyle = (
    ///	<summary>
    ///	  Do not draw a gradient.
    ///	</summary>
    gsNone,

    ///	<summary>
    ///	  Draw a horizontal gradient.
    ///	</summary>
    gsHorizontal,

    ///	<summary>
    ///	  Draw a vertical gradient.
    ///	</summary>
    gsVertical,

    ///	<summary>
    ///	  Draw a horizontal gradient starting in the center and working out in both
    ///	  directions.
    ///	</summary>
    gsHorizCenter,

    ///	<summary>
    ///	  Draw a vertical gradient starting in the center and working out in both
    ///	  directions.
    ///	</summary>
    gsVertCenter,

    ///	<summary>
    ///	  Draw a diagonal gradient starting in the top/left corner working toward
    ///	  the bottom/right corner.
    ///	</summary>
    gsTopLeft,

    ///	<summary>
    ///	  Draw a diagonal gradient starting in the top/right corner working toward
    ///	  the bottom/left corner.
    ///	</summary>
    gsTopRight,

    ///	<summary>
    ///	  Draw a diagonal gradient starting in the top/left and bottom/right
    ///	  corners working toward the center.
    ///	</summary>
    gsTopLeftBottomRight,

    ///	<summary>
    ///	  Draw a diagonal gradient starting in the top/right and bottom/left
    ///	  corners working toward the center.
    ///	</summary>
    gsTopRightBottomLeft,

    ///	<summary>
    ///	  Draw a rectangular gradient starting at the edges working to the center.
    ///	</summary>
    gsRectangular,

    ///	<summary>
    ///	  Draw an elliptical gradient starting at the edges working to the center.
    ///	</summary>
    gsElliptical
  );


///	<summary>
///	  Draw an elliptical gradient on a canvas.
///	</summary>
///	<param name="ACanvas">
///	  The canvas to draw the gradient on.
///	</param>
///	<param name="AColorFrom">
///	  The start color for the gradient.
///	</param>
///	<param name="AColorTo">
///	  The end color for the gradient.
///	</param>
///	<param name="AWidth">
///	  The gradient's width.
///	</param>
///	<param name="AHeight">
///	  The gradient's height.
///	</param>
///	<param name="ASteps">
///	  The number of steps to use when drawing the gradient. (1-255) Default: 155
///	</param>
procedure DrawEllipticalGradient(const ACanvas: TCanvas;
                                 const AColorFrom, AColorTo: TColor;
                                 const AWidth, AHeight: Integer;
                                 const ASteps: Byte = 155);

///	<summary>
///	  Draw a gradient on a canvas.
///	</summary>
///	<param name="ACanvas">
///	  The canvas to draw the gradient on.
///	</param>
///	<param name="AStyle">
///	  The type of gradient to draw.
///	</param>
///	<param name="AColorFrom">
///	  The start color for the gradient.
///	</param>
///	<param name="AColorTo">
///	  The end color for the gradient.
///	</param>
///	<param name="AWidth">
///	  The gradient's width.
///	</param>
///	<param name="AHeight">
///	  The gradient's height.
///	</param>
///	<param name="ASteps">
///	  The number of steps to use when drawing the gradient. (1-255) Default: 0
///	</param>
procedure DrawGradient(const ACanvas: TCanvas; const AStyle: TATGradientStyle;
                       const AColorFrom, AColorTo: TColor;
                       const AWidth, AHeight: Integer;
                       const ASteps: Byte = 0); overload;

///	<summary>
///	  Draw a gradient on a canvas, optionally buffer the drawing in an
///	  off-screen image.
///	</summary>
///	<param name="Buffered">
///	  Should the gradient drawing routine be buffered?
///	</param>
///	<param name="ACanvas">
///	  The canvas to draw the gradient on.
///	</param>
///	<param name="AStyle">
///	  The type of gradient to draw.
///	</param>
///	<param name="AColorFrom">
///	  The start color for the gradient.
///	</param>
///	<param name="AColorTo">
///	  The end color for the gradient.
///	</param>
///	<param name="AWidth">
///	  The gradient's width.
///	</param>
///	<param name="AHeight">
///	  The gradient's height.
///	</param>
///	<param name="ASteps">
///	  The number of steps to use when drawing the gradient. (1-255) Default: 0
///	</param>
procedure DrawGradient(const Buffered: Boolean; const ACanvas: TCanvas;
                       const AStyle: TATGradientStyle;
                       const AColorFrom, AColorTo: TColor;
                       const AWidth, AHeight: Integer;
                       const ASteps: Byte = 0); overload;

///	<summary>
///	  Draw a horizontal gradient starting in the center and working outward.
///	</summary>
///	<param name="ACanvas">
///	  The canvas to draw the gradient on.
///	</param>
///	<param name="AColorFrom">
///	  The start color for the gradient.
///	</param>
///	<param name="AColorTo">
///	  The end color for the gradient.
///	</param>
///	<param name="AWidth">
///	  The gradient's width.
///	</param>
///	<param name="AHeight">
///	  The gradient's height.
///	</param>
///	<param name="ASteps">
///	  The number of steps to use when drawing the gradient. (1-255) Default: 255
///	</param>
procedure DrawHorizCenterGradient(const ACanvas: TCanvas;
                                 const AColorFrom, AColorTo: TColor;
                                 const AWidth, AHeight: Integer;
                                 const ASteps: Byte = 255);

///	<summary>
///	  Draw a horizontal gradient.
///	</summary>
///	<param name="ACanvas">
///	  The canvas to draw the gradient on.
///	</param>
///	<param name="AColorFrom">
///	  The start color for the gradient.
///	</param>
///	<param name="AColorTo">
///	  The end color for the gradient.
///	</param>
///	<param name="AWidth">
///	  The gradient's width.
///	</param>
///	<param name="AHeight">
///	  The gradient's height.
///	</param>
///	<param name="ASteps">
///	  The number of steps to use when drawing the gradient. (1-255) Default: 255
///	</param>
procedure DrawHorizontalGradient(const ACanvas: TCanvas;
                                 const AColorFrom, AColorTo: TColor;
                                 const AWidth, AHeight: Integer;
                                 const ASteps: Byte = 255);

///	<summary>
///	  Draw a rectangularl gradient starting at the edges and working to the
///	  center.
///	</summary>
///	<param name="ACanvas">
///	  The canvas to draw the gradient on.
///	</param>
///	<param name="AColorFrom">
///	  The start color for the gradient.
///	</param>
///	<param name="AColorTo">
///	  The end color for the gradient.
///	</param>
///	<param name="AWidth">
///	  The gradient's width.
///	</param>
///	<param name="AHeight">
///	  The gradient's height.
///	</param>
///	<param name="ASteps">
///	  The number of steps to use when drawing the gradient. (1-255) Default: 255
///	</param>
procedure DrawRectGradient(const ACanvas: TCanvas;
                           const AColorFrom, AColorTo: TColor;
                           const AWidth, AHeight: Integer);

///	<summary>
///	  Draw a diagonal gradient starting in the top/left and bottom/right
///	  corners working toward the center.
///	</summary>
///	<param name="ACanvas">
///	  The canvas to draw the gradient on.
///	</param>
///	<param name="AColorFrom">
///	  The start color for the gradient.
///	</param>
///	<param name="AColorTo">
///	  The end color for the gradient.
///	</param>
///	<param name="AWidth">
///	  The gradient's width.
///	</param>
///	<param name="AHeight">
///	  The gradient's height.
///	</param>
///	<param name="ASteps">
///	  The number of steps to use when drawing the gradient. (1-255) Default: 255
///	</param>
procedure DrawTopLeftBottomRightGradient(const ACanvas: TCanvas;
                                         const AColorFrom, AColorTo: TColor;
                                         const AWidth, AHeight: Integer;
                                         const ASteps: Byte = 255);

///	<summary>
///	  Draw a diagonal gradient starting in the top/left working toward the
///	  bottom/right.
///	</summary>
///	<param name="ACanvas">
///	  The canvas to draw the gradient on.
///	</param>
///	<param name="AColorFrom">
///	  The start color for the gradient.
///	</param>
///	<param name="AColorTo">
///	  The end color for the gradient.
///	</param>
///	<param name="AWidth">
///	  The gradient's width.
///	</param>
///	<param name="AHeight">
///	  The gradient's height.
///	</param>
///	<param name="ASteps">
///	  The number of steps to use when drawing the gradient. (1-255) Default: 255
///	</param>
procedure DrawTopLeftGradient(const ACanvas: TCanvas;
                              const AColorFrom, AColorTo: TColor;
                              const AWidth, AHeight: Integer;
                              const ASteps: Byte = 255);

///	<summary>
///	  Draw a diagonal gradient starting in the top/right and bottom/left
///	  corners working toward the center.
///	</summary>
///	<param name="ACanvas">
///	  The canvas to draw the gradient on.
///	</param>
///	<param name="AColorFrom">
///	  The start color for the gradient.
///	</param>
///	<param name="AColorTo">
///	  The end color for the gradient.
///	</param>
///	<param name="AWidth">
///	  The gradient's width.
///	</param>
///	<param name="AHeight">
///	  The gradient's height.
///	</param>
///	<param name="ASteps">
///	  The number of steps to use when drawing the gradient. (1-255) Default: 255
///	</param>
procedure DrawTopRightBottomLeftGradient(const ACanvas: TCanvas;
                                         const AColorFrom, AColorTo: TColor;
                                         const AWidth, AHeight: Integer;
                                         const ASteps: Byte = 255);

///	<summary>
///	  Draw a diagonal gradient starting in the top/right working toward the
///	  bottom/left.
///	</summary>
///	<param name="ACanvas">
///	  The canvas to draw the gradient on.
///	</param>
///	<param name="AColorFrom">
///	  The start color for the gradient.
///	</param>
///	<param name="AColorTo">
///	  The end color for the gradient.
///	</param>
///	<param name="AWidth">
///	  The gradient's width.
///	</param>
///	<param name="AHeight">
///	  The gradient's height.
///	</param>
///	<param name="ASteps">
///	  The number of steps to use when drawing the gradient. (1-255) Default: 255
///	</param>
procedure DrawTopRightGradient(const ACanvas: TCanvas;
                               const AColorFrom, AColorTo: TColor;
                               const AWidth, AHeight: Integer;
                               const ASteps: Byte = 255);

///	<summary>
///	  Draw a vertical gradient starting in the center and working outward.
///	</summary>
///	<param name="ACanvas">
///	  The canvas to draw the gradient on.
///	</param>
///	<param name="AColorFrom">
///	  The start color for the gradient.
///	</param>
///	<param name="AColorTo">
///	  The end color for the gradient.
///	</param>
///	<param name="AWidth">
///	  The gradient's width.
///	</param>
///	<param name="AHeight">
///	  The gradient's height.
///	</param>
///	<param name="ASteps">
///	  The number of steps to use when drawing the gradient. (1-255) Default: 255
///	</param>
procedure DrawVertCenterGradient(const ACanvas: TCanvas;
                                 const AColorFrom, AColorTo: TColor;
                                 const AWidth, AHeight: Integer;
                                 const ASteps: Byte = 255);

///	<summary>
///	  Draw a vertical gradient.
///	</summary>
///	<param name="ACanvas">
///	  The canvas to draw the gradient on.
///	</param>
///	<param name="AColorFrom">
///	  The start color for the gradient.
///	</param>
///	<param name="AColorTo">
///	  The end color for the gradient.
///	</param>
///	<param name="AWidth">
///	  The gradient's width.
///	</param>
///	<param name="AHeight">
///	  The gradient's height.
///	</param>
///	<param name="ASteps">
///	  The number of steps to use when drawing the gradient. (1-255) Default: 255
///	</param>
procedure DrawVerticalGradient(const ACanvas: TCanvas;
                               const AColorFrom, AColorTo: TColor;
                               const AWidth, AHeight: Integer;
                               const ASteps: Byte = 255);

implementation

uses
  AT.Windows.Graphics;

procedure DrawEllipticalGradient(const ACanvas: TCanvas;
                                 const AColorFrom, AColorTo: TColor;
                                 const AWidth, AHeight: Integer;
                                 const ASteps: Byte = 155);
var
  FromR, FromG, FromB: Integer;
  ToR, ToG, ToB      : Integer;
  DiffR, DiffG, DiffB: Integer;
  OldPen             : TPen;
  OldBrush           : TBrush;
  X1, Y1, X2, Y2     : Double;
  PW, PH             : Double;
  Idx                : Byte;
  R, G, B            : Byte;
begin
  TColorToRGB(AColorFrom, FromR, FromG, FromB);
  TColorToRGB(AColorTo, ToR, ToG, ToB);
  DiffR := ToR - FromR;
  DiffG := ToG - FromG;
  DiffB := ToB - FromB;

  OldPen := ACanvas.Pen;
  OldBrush := ACanvas.Brush;

  try
    ACanvas.Pen.Style := psClear;
    ACanvas.Pen.Mode := pmCopy;

    X1 := 0 - (AWidth / 4);
    X2 := AWidth + (AWidth / 4);
    Y1 := 0 - (AHeight / 4);
    Y2 := AHeight + (AHeight / 4);
    PW := ((AWidth / 4) + (AWidth / 2)) / ASteps;
    PH := ((AHeight / 4) + (AHeight / 2)) / ASteps;

    for Idx := 0 to ASteps do
      begin
        X1 := X1 + PW;
        X2 := X2 - PW;
        Y1 := Y1 + PH;
        Y2 := Y2 - PH;

        R := FromR + MulDiv(Idx, DiffR, ASteps);
        G := FromG + MulDiv(Idx, DiffG, ASteps);
        B := FromB + MulDiv(Idx, DiffB, ASteps);

        ACanvas.Brush.Color := RGBToTColor(R, G, B);
        ACanvas.Ellipse(Trunc(X1), Trunc(Y1), Trunc(X2), Trunc(Y2));
      end;
  finally
    ACanvas.Brush := OldBrush;
    ACanvas.Pen := OldPen;
  end;
end;

procedure DrawGradient(const ACanvas: TCanvas; const AStyle: TATGradientStyle;
                       const AColorFrom, AColorTo: TColor;
                       const AWidth, AHeight: Integer;
                       const ASteps: Byte = 0);
var
  iSteps : Byte;
begin
  iSteps := ASteps;

  if (iSteps <= 0) then
    case AStyle of
      gsHorizontal         : iSteps := 255;
      gsVertical           : iSteps := 255;
      gsHorizCenter        : iSteps := 255;
      gsVertCenter         : iSteps := 255;
      gsTopLeft            : iSteps := 255;
      gsTopRight           : iSteps := 255;
      gsTopLeftBottomRight : iSteps := 255;
      gsTopRightBottomLeft : iSteps := 255;
      gsElliptical         : iSteps := 155;
    end;

  case AStyle of
    gsHorizontal         : DrawHorizontalGradient(ACanvas, AColorFrom, AColorTo,
                                                  AWidth, AHeight, iSteps);
    gsVertical           : DrawVerticalGradient(ACanvas, AColorFrom, AColorTo,
                                                AWidth, AHeight, iSteps);
    gsHorizCenter        : DrawHorizCenterGradient(ACanvas, AColorFrom,
                                                   AColorTo, AWidth, AHeight,
                                                   iSteps);
    gsVertCenter         : DrawVertCenterGradient(ACanvas, AColorFrom, AColorTo,
                                                  AWidth, AHeight, iSteps);
    gsTopLeft            : DrawTopLeftGradient(ACanvas, AColorFrom, AColorTo,
                                               AWidth, AHeight, iSteps);
    gsTopRight           : DrawTopRightGradient(ACanvas, AColorFrom, AColorTo,
                                                AWidth, AHeight, iSteps);
    gsTopLeftBottomRight : DrawTopLeftBottomRightGradient(ACanvas, AColorFrom,
                                                          AColorTo, AWidth,
                                                          AHeight, iSteps);
    gsTopRightBottomLeft : DrawTopRightBottomLeftGradient(ACanvas, AColorFrom,
                                                          AColorTo, AWidth,
                                                          AHeight, iSteps);
    gsRectangular        : DrawRectGradient(ACanvas, AColorFrom, AColorTo,
                                            AWidth, AHeight);
    gsElliptical         : DrawEllipticalGradient(ACanvas, AColorFrom, AColorTo,
                                                  AWidth, AHeight, iSteps);
  end;
end;

procedure DrawGradient(const Buffered: Boolean; const ACanvas: TCanvas;
                       const AStyle: TATGradientStyle;
                       const AColorFrom, AColorTo: TColor;
                       const AWidth, AHeight: Integer;
                       const ASteps: Byte = 0); overload;
var
  Bmp : TBitmap;
begin
  if (Buffered) then
    begin
      Bmp := TBitmap.Create;
      try
        Bmp.Width := AWidth;
        Bmp.Height := AHeight;
        DrawGradient(Bmp.Canvas, AStyle, AColorFrom, AColorTo, AWidth, AHeight,
                     ASteps);
        ACanvas.Draw(0, 0, Bmp);
      finally
        Bmp.Free;
      end;
    end
  else
    begin
        DrawGradient(ACanvas, AStyle, AColorFrom, AColorTo, AWidth, AHeight,
                     ASteps);
    end;
end;

procedure DrawHorizCenterGradient(const ACanvas: TCanvas;
                                  const AColorFrom, AColorTo: TColor;
                                  const AWidth, AHeight: Integer;
                                  const ASteps: Byte = 255);
var
  FromR, FromG, FromB: Integer;
  ToR, ToG, ToB      : Integer;
  DiffR, DiffG, DiffB: Integer;
  OldPen             : TPen;
  OldBrush           : TBrush;
  Idx                : Integer;
  R, G, B            : Byte;
  FRect1, FRect2     : TRect;
begin
  TColorToRGB(AColorFrom, FromR, FromG, FromB);
  TColorToRGB(AColorTo, ToR, ToG, ToB);
  DiffR := ToR - FromR;
  DiffG := ToG - FromG;
  DiffB := ToB - FromB;

  OldPen := ACanvas.Pen;
  OldBrush := ACanvas.Brush;

  try
    ACanvas.Pen.Style := psClear;
    ACanvas.Pen.Mode := pmCopy;

    FRect1.Left := 0;
    FRect1.Right := AWidth;
    FRect1.Top := 0;
    FRect1.Bottom := AHeight;
    ACanvas.Brush.Color := AColorTo;
    ACanvas.FillRect(FRect1);

    FRect1.Top := 0;
    FRect1.Bottom := AHeight;
    FRect2 := FRect1;

    for Idx := 0 to ASteps do
      begin
        R := (FromR + Idx * DiffR DIV ASteps);
        G := (FromG + Idx * DiffG DIV ASteps);
        B := (FromB + Idx * DiffB DIV ASteps);

        FRect1.Left := Idx * AWidth DIV (ASteps * 2);
        FRect1.Right := (Idx + 1) * AWidth DIV (ASteps * 2);
        FRect2.Left := AWidth - Idx * AWidth DIV (ASteps * 2);
        FRect2.Right := AWidth - (Idx + 1) * AWidth DIV (ASteps * 2);
        ACanvas.Brush.Color := RGBToTColor(R, G, B);
        ACanvas.FillRect(FRect1);
        ACanvas.FillRect(FRect2);
      end;

  finally
    ACanvas.Brush := OldBrush;
    ACanvas.Pen := OldPen;
  end;
end;

procedure DrawHorizontalGradient(const ACanvas: TCanvas;
                                 const AColorFrom, AColorTo: TColor;
                                 const AWidth, AHeight: Integer;
                                 const ASteps: Byte = 255);
var
  FromR, FromG, FromB: Integer;
  ToR, ToG, ToB      : Integer;
  DiffR, DiffG, DiffB: Integer;
  OldPen             : TPen;
  OldBrush           : TBrush;
  X1, Y1, X2, Y2     : Integer;
  Idx                : Byte;
  R, G, B            : Byte;
  FRect              : TRect;
begin
  TColorToRGB(AColorFrom, FromR, FromG, FromB);
  TColorToRGB(AColorTo, ToR, ToG, ToB);
  DiffR := ToR - FromR;
  DiffG := ToG - FromG;
  DiffB := ToB - FromB;

  OldPen := ACanvas.Pen;
  OldBrush := ACanvas.Brush;

  try
    ACanvas.Pen.Style := psClear;
    ACanvas.Pen.Mode := pmCopy;

    Y1 := 0;
    Y2 := AHeight;
    for Idx := 0 to ASteps do
      begin
        X1 := (Idx * AWidth) DIV ASteps;
        X2 := ((Idx + 1) * AWidth) DIV ASteps;
        FRect.Top := Y1;
        FRect.Bottom := Y2;
        FRect.Left := X1;
        FRect.Right := X2;
        R := (FromR + Idx * DiffR DIV ASteps);
        G := (FromG + Idx * DiffG DIV ASteps);
        B := (FromB + Idx * DiffB DIV ASteps);
        ACanvas.Brush.Color := RGBToTColor(R, G, B);
        ACanvas.FillRect(FRect);
      end;
  finally
    ACanvas.Brush := OldBrush;
    ACanvas.Pen := OldPen;
  end;
end;

procedure DrawRectGradient(const ACanvas: TCanvas;
                           const AColorFrom, AColorTo: TColor;
                           const AWidth, AHeight: Integer);
var
  FromR, FromG, FromB: Integer;
  ToR, ToG, ToB      : Integer;
  DiffR, DiffG, DiffB: Integer;
  OldPen             : TPen;
  OldBrush           : TBrush;
  Cnt                : Integer;
  HalfCnt            : Integer;
  Idx                : Integer;
  R, G, B            : Byte;
  FRect              : TRect;
begin
  TColorToRGB(AColorFrom, FromR, FromG, FromB);
  TColorToRGB(AColorTo, ToR, ToG, ToB);
  DiffR := ToR - FromR;
  DiffG := ToG - FromG;
  DiffB := ToB - FromB;

  OldPen := ACanvas.Pen;
  OldBrush := ACanvas.Brush;

  try
    ACanvas.Pen.Style := psClear;
    ACanvas.Pen.Mode := pmCopy;

    if (AWidth > AHeight) then
      Cnt := AWidth
    else
      Cnt := AHeight;

    HalfCnt := Cnt DIV 2;

    for Idx := 0 to HalfCnt do
      begin
        R := (FromR + Idx * DiffR DIV HalfCnt);
        G := (FromG + Idx * DiffG DIV HalfCnt);
        B := (FromB + Idx * DiffB DIV HalfCnt);

        FRect.Top := Idx * AHeight DIV Cnt;
        FRect.Bottom := AHeight - Idx * AHeight DIV Cnt;
        FRect.Left := Idx * AWidth DIV Cnt;
        FRect.Right := AWidth - Idx * AWidth DIV Cnt;
        ACanvas.Brush.Color := RGBToTColor(R, G, B);
        ACanvas.FillRect(FRect);
      end;

  finally
    ACanvas.Brush := OldBrush;
    ACanvas.Pen := OldPen;
  end;
end;

procedure DrawTopLeftBottomRightGradient(const ACanvas: TCanvas;
                                         const AColorFrom, AColorTo: TColor;
                                         const AWidth, AHeight: Integer;
                                         const ASteps: Byte = 255);
var
  FromR, FromG, FromB: Integer;
  ToR, ToG, ToB      : Integer;
  DiffR, DiffG, DiffB: Integer;
  OldPen             : TPen;
  OldBrush           : TBrush;
  HalfCnt            : Integer;
  Idx                : Integer;
  R, G, B            : Byte;
  Pts                : Array[0..3] of TPoint;
begin
  TColorToRGB(AColorFrom, FromR, FromG, FromB);
  TColorToRGB(AColorTo, ToR, ToG, ToB);
  DiffR := ToR - FromR;
  DiffG := ToG - FromG;
  DiffB := ToB - FromB;

  OldPen := ACanvas.Pen;
  OldBrush := ACanvas.Brush;

  try
    ACanvas.Pen.Style := psClear;
    ACanvas.Pen.Mode := pmCopy;

    Pts[0].X := 0;
    Pts[0].Y := 0;
    Pts[1].X := AWidth;
    Pts[1].Y := 0;
    Pts[2].X := AWidth;
    Pts[2].Y := AHeight;
    Pts[3].X := 0;
    Pts[3].Y := AHeight;

    ACanvas.Brush.Color := AColorTO;
    ACanvas.Polygon(Pts);

    HalfCnt := ASteps DIV 2;

    for Idx := 0 to HalfCnt do
      begin
        R := (FromR + Idx * DiffR DIV HalfCnt);
        G := (FromG + Idx * DiffG DIV HalfCnt);
        B := (FromB + Idx * DiffB DIV HalfCnt);

        ACanvas.Brush.Color := RGBToTColor(R, G, B);

        Pts[0].X := 0;
        Pts[0].Y := Idx * AHeight DIV HalfCnt;
        Pts[1].X := 0;
        Pts[1].Y := (Idx + 1) * AHeight DIV HalfCnt;
        Pts[2].X := (Idx + 1) * AWidth DIV HalfCnt;
        Pts[2].Y := 0;
        Pts[3].X := Idx * AWidth DIV HalfCnt;
        Pts[3].Y := 0;
        ACanvas.Polygon(Pts);

        Pts[0].X := AWidth - Idx * AWidth DIV HalfCnt;
        Pts[0].Y := AHeight;
        Pts[1].X := AWidth - (Idx + 1) * AWidth DIV HalfCnt;
        Pts[1].Y := AHeight;
        Pts[2].X := AWidth;
        Pts[2].Y := AHeight - (Idx + 1) * AHeight DIV HalfCnt;
        Pts[3].X := AWidth;
        Pts[3].Y := AHeight - Idx * AHeight DIV HalfCnt;
        ACanvas.Polygon(Pts);
      end;

  finally
    ACanvas.Brush := OldBrush;
    ACanvas.Pen := OldPen;
  end;
end;

procedure DrawTopLeftGradient(const ACanvas: TCanvas;
                              const AColorFrom, AColorTo: TColor;
                              const AWidth, AHeight: Integer;
                              const ASteps: Byte = 255);
var
  FromR, FromG, FromB: Integer;
  ToR, ToG, ToB      : Integer;
  DiffR, DiffG, DiffB: Integer;
  OldPen             : TPen;
  OldBrush           : TBrush;
  HalfCnt            : Integer;
  Idx                : Integer;
  R, G, B            : Byte;
  Pts                : Array[0..3] of TPoint;
begin
  TColorToRGB(AColorFrom, FromR, FromG, FromB);
  TColorToRGB(AColorTo, ToR, ToG, ToB);
  DiffR := ToR - FromR;
  DiffG := ToG - FromG;
  DiffB := ToB - FromB;

  OldPen := ACanvas.Pen;
  OldBrush := ACanvas.Brush;

  try
    ACanvas.Pen.Style := psClear;
    ACanvas.Pen.Mode := pmCopy;

    HalfCnt := ASteps DIV 2;

    for Idx := 0 to ASteps do
      begin
        R := (FromR + Idx * DiffR DIV ASteps);
        G := (FromG + Idx * DiffG DIV ASteps);
        B := (FromB + Idx * DiffB DIV ASteps);

        if (Idx < HalfCnt) then
          begin
            Pts[0].X := 0;
            Pts[0].Y := Idx * AHeight DIV HalfCnt;
            Pts[1].X := 0;
            Pts[1].Y := (Idx + 1) * AHeight DIV HalfCnt;
            Pts[2].X := (Idx + 1) * AWidth DIV HalfCnt;
            Pts[2].Y := 0;
            Pts[3].X := Idx * AWidth DIV HalfCnt;
            Pts[3].Y := 0;
          end
        else
          begin
            Pts[0].X := (Idx - HalfCnt) * AWidth DIV HalfCnt;
            Pts[0].Y := AHeight;
            Pts[1].X := (Idx + 1 - HalfCnt) * AWidth DIV HalfCnt;
            Pts[1].Y := AHeight;
            Pts[2].X := AWidth;
            Pts[2].Y := (Idx + 1 - HalfCnt) * AHeight DIV HalfCnt;
            Pts[3].X := AWidth;
            Pts[3].Y := (Idx - HalfCnt) * AHeight DIV HalfCnt;
          end;

        ACanvas.Brush.Color := RGBToTColor(R, G, B);
        ACanvas.Polygon(Pts);
      end;

  finally
    ACanvas.Brush := OldBrush;
    ACanvas.Pen := OldPen;
  end;
end;

procedure DrawTopRightBottomLeftGradient(const ACanvas: TCanvas;
                                         const AColorFrom, AColorTo: TColor;
                                         const AWidth, AHeight: Integer;
                                         const ASteps: Byte = 255);
var
  FromR, FromG, FromB: Integer;
  ToR, ToG, ToB      : Integer;
  DiffR, DiffG, DiffB: Integer;
  OldPen             : TPen;
  OldBrush           : TBrush;
  HalfCnt            : Integer;
  Idx                : Integer;
  R, G, B            : Byte;
  Pts                : Array[0..3] of TPoint;
begin
  TColorToRGB(AColorFrom, FromR, FromG, FromB);
  TColorToRGB(AColorTo, ToR, ToG, ToB);
  DiffR := ToR - FromR;
  DiffG := ToG - FromG;
  DiffB := ToB - FromB;

  OldPen := ACanvas.Pen;
  OldBrush := ACanvas.Brush;

  try
    ACanvas.Pen.Style := psClear;
    ACanvas.Pen.Mode := pmCopy;

    Pts[0].X := 0;
    Pts[0].Y := 0;
    Pts[1].X := AWidth;
    Pts[1].Y := 0;
    Pts[2].X := AWidth;
    Pts[2].Y := AHeight;
    Pts[3].X := 0;
    Pts[3].Y := AHeight;

    ACanvas.Brush.Color := AColorTo;
    ACanvas.Polygon(Pts);

    HalfCnt := ASteps DIV 2;

    for Idx := 0 to HalfCnt do
      begin
        R := (FromR + Idx * DiffR DIV HalfCnt);
        G := (FromG + Idx * DiffG DIV HalfCnt);
        B := (FromB + Idx * DiffB DIV HalfCnt);

        ACanvas.Brush.Color := RGBToTColor(R, G, B);

        Pts[0].X := AWidth;
        Pts[0].Y := Idx * AHeight DIV HalfCnt;
        Pts[1].X := AWidth;
        Pts[1].Y := (Idx + 1) * AHeight DIV HalfCnt;
        Pts[2].X := AWidth - (Idx + 1) * AWidth DIV HalfCnt;
        Pts[2].Y := 0;
        Pts[3].X := AWidth - Idx * AWidth DIV HalfCnt;
        Pts[3].Y := 0;
        ACanvas.Polygon(Pts);

        Pts[0].X := Idx * AWidth DIV HalfCnt;
        Pts[0].Y := AHeight;
        Pts[1].X := (Idx + 1) * AWidth DIV HalfCnt;
        Pts[1].Y := AHeight;
        Pts[2].X := 0;
        Pts[2].Y := AHeight - (Idx + 1) * AHeight DIV HalfCnt;
        Pts[3].X := 0;
        Pts[3].Y := AHeight - Idx * AHeight DIV HalfCnt;
        ACanvas.Polygon(Pts);
      end;

  finally
    ACanvas.Brush := OldBrush;
    ACanvas.Pen := OldPen;
  end;
end;

procedure DrawTopRightGradient(const ACanvas: TCanvas;
                               const AColorFrom, AColorTo: TColor;
                               const AWidth, AHeight: Integer;
                               const ASteps: Byte = 255);
var
  FromR, FromG, FromB: Integer;
  ToR, ToG, ToB      : Integer;
  DiffR, DiffG, DiffB: Integer;
  OldPen             : TPen;
  OldBrush           : TBrush;
  HalfCnt            : Integer;
  Idx                : Integer;
  R, G, B            : Byte;
  Pts                : Array[0..3] of TPoint;
begin
  TColorToRGB(AColorFrom, FromR, FromG, FromB);
  TColorToRGB(AColorTo, ToR, ToG, ToB);
  DiffR := ToR - FromR;
  DiffG := ToG - FromG;
  DiffB := ToB - FromB;

  OldPen := ACanvas.Pen;
  OldBrush := ACanvas.Brush;

  try
    ACanvas.Pen.Style := psClear;
    ACanvas.Pen.Mode := pmCopy;

    HalfCnt := ASteps DIV 2;

    for Idx := 0 to ASteps do
      begin
        R := (FromR + Idx * DiffR DIV ASteps);
        G := (FromG + Idx * DiffG DIV ASteps);
        B := (FromB + Idx * DiffB DIV ASteps);

        if (Idx < HalfCnt) then
          begin
            Pts[0].X := AWidth;
            Pts[0].Y := Idx * AHeight DIV HalfCnt;
            Pts[1].X := AWidth;
            Pts[1].Y := (Idx + 1) * AHeight DIV HalfCnt;
            Pts[2].X := AWidth - (Idx + 1) * AWidth DIV HalfCnt;
            Pts[2].Y := 0;
            Pts[3].X := AWidth - Idx * AWidth DIV HalfCnt;
            Pts[3].Y := 0;
          end
        else
          begin
            Pts[0].X := AWidth - (Idx - HalfCnt) * AWidth DIV HalfCnt;
            Pts[0].Y := AHeight;
            Pts[1].X := AWidth - (Idx + 1 - HalfCnt) * AWidth DIV HalfCnt;
            Pts[1].Y := AHeight;
            Pts[2].X := 0;
            Pts[2].Y := (Idx + 1 - HalfCnt) * AHeight DIV HalfCnt;
            Pts[3].X := 0;
            Pts[3].Y := (Idx - HalfCnt) * AHeight DIV HalfCnt;
          end;

        ACanvas.Brush.Color := RGBToTColor(R, G, B);
        ACanvas.Polygon(Pts);
      end;

  finally
    ACanvas.Brush := OldBrush;
    ACanvas.Pen := OldPen;
  end;
end;

procedure DrawVertCenterGradient(const ACanvas: TCanvas;
                                 const AColorFrom, AColorTo: TColor;
                                 const AWidth, AHeight: Integer;
                                 const ASteps: Byte = 255);
var
  FromR, FromG, FromB: Integer;
  ToR, ToG, ToB      : Integer;
  DiffR, DiffG, DiffB: Integer;
  OldPen             : TPen;
  OldBrush           : TBrush;
  Idx                : Integer;
  R, G, B            : Byte;
  FRect1, FRect2     : TRect;
begin
  TColorToRGB(AColorFrom, FromR, FromG, FromB);
  TColorToRGB(AColorTo, ToR, ToG, ToB);
  DiffR := ToR - FromR;
  DiffG := ToG - FromG;
  DiffB := ToB - FromB;

  OldPen := ACanvas.Pen;
  OldBrush := ACanvas.Brush;

  try
    ACanvas.Pen.Style := psClear;
    ACanvas.Pen.Mode := pmCopy;

    FRect1.Left := 0;
    FRect1.Right := AWidth;
    FRect1.Top := 0;
    FRect1.Bottom := AHeight;
    ACanvas.Brush.Color := AColorTo;
    ACanvas.FillRect(FRect1);

    FRect1.Left := 0;
    FRect1.Right := AWidth;
    FRect2 := FRect1;

    for Idx := 0 to ASteps do
      begin
        R := (FromR + Idx * DiffR DIV ASteps);
        G := (FromG + Idx * DiffG DIV ASteps);
        B := (FromB + Idx * DiffB DIV ASteps);

        FRect1.Top := Idx * AHeight DIV (ASteps * 2);
        FRect1.Bottom := (Idx + 1) * AHeight DIV (ASteps * 2);
        FRect2.Top := AHeight - Idx * AHeight DIV (ASteps * 2);
        FRect2.Bottom := AHeight - (Idx + 1) * AHeight DIV (ASteps * 2);
        ACanvas.Brush.Color := RGBToTColor(R, G, B);
        ACanvas.FillRect(FRect1);
        ACanvas.FillRect(FRect2);
      end;

  finally
    ACanvas.Brush := OldBrush;
    ACanvas.Pen := OldPen;
  end;
end;

procedure DrawVerticalGradient(const ACanvas: TCanvas;
                               const AColorFrom, AColorTo: TColor;
                               const AWidth, AHeight: Integer;
                               const ASteps: Byte = 255);
var
  FromR, FromG, FromB: Integer;
  ToR, ToG, ToB      : Integer;
  DiffR, DiffG, DiffB: Integer;
  OldPen             : TPen;
  OldBrush           : TBrush;
  X1, Y1, X2, Y2     : Integer;
  Idx                : Byte;
  R, G, B            : Byte;
  FRect              : TRect;
begin
  TColorToRGB(AColorFrom, FromR, FromG, FromB);
  TColorToRGB(AColorTo, ToR, ToG, ToB);
  DiffR := ToR - FromR;
  DiffG := ToG - FromG;
  DiffB := ToB - FromB;

  OldPen := ACanvas.Pen;
  OldBrush := ACanvas.Brush;

  try
    ACanvas.Pen.Style := psClear;
    ACanvas.Pen.Mode := pmCopy;

    X1 := 0;
    X2 := AWidth;
    for Idx := 0 to ASteps do
      begin
        Y1 := (Idx * AHeight) DIV ASteps;
        Y2 := ((Idx + 1) * AHeight) DIV ASteps;
        FRect.Top := Y1;
        FRect.Bottom := Y2;
        FRect.Left := X1;
        FRect.Right := X2;
        R := (FromR + Idx * DiffR DIV ASteps);
        G := (FromG + Idx * DiffG DIV ASteps);
        B := (FromB + Idx * DiffB DIV ASteps);
        ACanvas.Brush.Color := RGBToTColor(R, G, B);
        ACanvas.FillRect(FRect);
      end;
  finally
    ACanvas.Brush := OldBrush;
    ACanvas.Pen := OldPen;
  end;
end;



end.

