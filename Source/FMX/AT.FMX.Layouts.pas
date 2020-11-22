unit AT.FMX.Layouts;

interface

uses
  System.SysUtils, System.Classes, FMX.Types, FMX.Controls;

const
  pidATPlatforms = pidWin32 OR pidWin64 OR pidOSX32 OR
                   pidiOSSimulator32 OR pidiOSSimulator64 OR
                   pidiOSDevice32 OR pidiOSDevice64 OR
                   pidAndroid32Arm OR pidAndroid64Arm OR
                   pidLinux64;

type
  [ComponentPlatformsAttribute(pidATPlatforms)]
  TATListLayout = class(TControl)
  strict private
    FVerticalGap: Single;
    procedure SetVerticalGap(const Value: Single);
  private
    FAutoSize: Boolean;
    procedure SetAutoSize(const Value: Boolean);
  protected
    procedure DoRealign; override;
    procedure DoAddObject(const AObject: TFmxObject); override;
    procedure DoRemoveObject(const AObject: TFmxObject); override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property Align;
    property Anchors;
    property AutoSize: Boolean read FAutoSize write SetAutoSize default True;
    property ClipChildren;
    property ClipParent;
    property Cursor;
    property DragMode;
    property EnableDragHighlight;
    property Enabled;
    property Locked;
    property Height;
    property HitTest;
    property Margins;
    property Opacity;
    property Padding;
    property PopupMenu;
    property Position;
    property RotationAngle;
    property RotationCenter;
    property Scale;
    property TouchTargetExpansion;
    property VerticalGap: Single read FVerticalGap write SetVerticalGap;
    property Visible;
    property Width;
    property OnApplyStyleLookup;
    property OnDragEnter;
    property OnDragLeave;
    property OnDragOver;
    property OnDragDrop;
    property OnDragEnd;
    property OnClick;
    property OnDblClick;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnMouseWheel;
    property OnMouseEnter;
    property OnMouseLeave;
    property OnPainting;
    property OnPaint;
    property OnResize;
  end;



implementation

uses
  AT.GarbageCollector;


{ TATListLayout }

constructor TATListLayout.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FAutoSize := True;
end;

procedure TATListLayout.DoAddObject(const AObject: TFmxObject);
begin
  inherited;
  Realign;
end;

procedure TATListLayout.DoRealign;
var
  AGC            : IATGarbageCollector;
  Control        : TControl;
  NextY, StdWidth: Single;
  ASpacingHgt    : Single;
  ANewHeight     : Single;
  ACtlHeight     : Single;
begin
  if (ControlsCount = 0) then
    Exit;

  FDisableAlign := True;

  TATGC.Cleanup(
      procedure
    begin
      FDisableAlign := False;
    end, AGC);

  if (AutoSize) then
    begin
      ASpacingHgt := (ControlsCount - 1) * VerticalGap;
      ANewHeight := 0 + Padding.Top + Padding.Bottom + ASpacingHgt;
    end
  else
    ANewHeight := Height;

  NextY := Margins.Top;
  StdWidth := Width - Margins.Left - Margins.Right;

  for Control in Controls do
    begin
      if (Control.Visible) then
        begin
          NextY := NextY + Control.Padding.Top;

          Control.SetBounds(Margins.Left + Control.Padding.Left, NextY,
            StdWidth - Control.Padding.Right - Control.Padding.Left,
            Control.Height);

          NextY := NextY + Control.Height + Control.Padding.Bottom +
            VerticalGap;

          if (AutoSize) then
            begin
              ACtlHeight := Control.Margins.Top + Control.Height + Control.Margins.Bottom;
              ANewHeight := ANewHeight + ACtlHeight;
            end;
        end;
    end;

  Height := ANewHeight;
end;

procedure TATListLayout.DoRemoveObject(const AObject: TFmxObject);
begin
  inherited;
  Realign;
end;

procedure TATListLayout.SetAutoSize(const Value: Boolean);
begin
  FAutoSize := Value;
  Realign;
end;

procedure TATListLayout.SetVerticalGap(const Value: Single);
begin
  if Value = FVerticalGap then
    Exit;

  FVerticalGap := Value;

  Realign;
end;

initialization
  RegisterClass(TATListLayout);
end.
