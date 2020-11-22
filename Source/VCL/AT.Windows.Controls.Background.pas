//****************************************************************************
//
//  Program Name   : - AT Library -
//  Program Version: 1.00
//  Filenames      : AT.Windows.Controls.Background.pas
//  File Version   : 1.00
//  Date Created   : 28-JAN-2014
//  Author         : Matthew S. Vesperman
//
//  Description:
//
//  Angelic Tech gradient background control... (Migrated from SSBackground.pas)
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



unit AT.Windows.Controls.Background;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.Graphics;

type
  ///	<summary>
  ///	  BackgroundStyle values for TATBackground
  ///	</summary>
  TATBackgroundStyle = (
    bsNone,

    bsHorizontal,

    bsVertical,

    bsHorizCenter,

    bsVertCenter,

    bsTopLeft,

    bsTopRight,

    bsTopLeftBottomRight,

    bsTopRightBottomLeft,

    bsRectangular,

    bsElliptical
  );

  ///	<summary>
  ///	  Gradient background component.
  ///	</summary>
  TATBackground = class(TGraphicControl)
  private
    FBuffered: Boolean;
    FColorFrom: TColor;
    FColorTo: TColor;
    FSteps: Byte;
    FStyle: TATBackgroundStyle;
    procedure SetBuffered(const Value: Boolean);
    procedure SetColorFrom(const Value: TColor);
    procedure SetColorTo(const Value: TColor);
    procedure SetSteps(const Value: Byte);
    procedure SetStyle(const Value: TATBackgroundStyle);
  protected
    procedure DrawColored; virtual;
    procedure DrawGrad; virtual;
    procedure Paint; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property Align default alClient;
    property Buffered: Boolean read FBuffered write SetBuffered default True;
    property Color;
    property ColorFrom: TColor read FColorFrom write SetColorFrom default clBlue;
    property ColorTo: TColor read FColorTo write SetColorTo default clBlack;
    property PopupMenu;
    property Steps: Byte read FSteps write SetSteps default 0;
    property Style: TATBackgroundStyle read FStyle write SetStyle default bsNone;
  end;

implementation

uses
  AT.Windows.Graphics.GradientDraw;


{ TATBackground }

constructor TATBackground.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Self.Align := alClient;
  FBuffered := True;
  FColorFrom := clBlue;
  FColorTo := clBlack;
  FSteps := 0;
  FStyle := bsNone;
  Self.Invalidate;
end;

procedure TATBackground.DrawColored;
var
  OldPen   : TPen;
  OldBrush : TBrush;
begin
  OldPen := Self.Canvas.Pen;
  OldBrush := Self.Canvas.Brush;
  try
    Self.Canvas.Pen.Color := clNone;
    Self.Canvas.Pen.Style := psClear;
    Self.Canvas.Brush.Color := Self.Color;
    Self.Canvas.FillRect(Self.BoundsRect);
  finally
    Self.Canvas.Pen := OldPen;
    Self.Canvas.Brush := OldBrush;
  end;
end;

procedure TATBackground.DrawGrad;
begin
  DrawGradient(FBuffered, Self.Canvas, TATGradientStyle(FStyle) , FColorFrom,
               FColorTo, Self.Width, Self.Height, FSteps);
end;

procedure TATBackground.Paint;
begin
  inherited Paint;
  if (Style = bsNone) then
    DrawColored
  else
    DrawGrad;
end;

procedure TATBackground.SetBuffered(const Value: Boolean);
begin
  FBuffered := Value;
end;

procedure TATBackground.SetColorFrom(const Value: TColor);
begin
  FColorFrom := Value;
  Self.Invalidate;
end;

procedure TATBackground.SetColorTo(const Value: TColor);
begin
  FColorTo := Value;
  Self.Invalidate;
end;

procedure TATBackground.SetSteps(const Value: Byte);
begin
  FSteps := Value;
  Self.Invalidate;
end;

procedure TATBackground.SetStyle(const Value: TATBackgroundStyle);
begin
  FStyle := Value;
  Self.Invalidate;
end;

end.

