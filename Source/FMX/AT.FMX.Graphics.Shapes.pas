unit AT.FMX.Graphics.Shapes;

interface

uses
  System.Types, System.SysUtils, System.Classes, System.Math, FMX.Types,
  FMX.Controls, FMX.Objects, FMX.Graphics;

const
  pidATPlatforms = pidWin32 OR pidWin64 OR pidOSX32 OR
                   pidiOSSimulator32 OR pidiOSSimulator64 OR
                   pidiOSDevice32 OR pidiOSDevice64 OR
                   pidAndroid32Arm OR pidAndroid64Arm OR
                   pidLinux64;

type
  [ComponentPlatformsAttribute(pidATPlatforms)]
  TATRoundRect = class(TRoundRect)
  strict private
    FCornerRadius: Integer;
    procedure SetCornerRadius(const Value: Integer);
  strict protected
    procedure Paint; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property CornerRadius: Integer read FCornerRadius write SetCornerRadius;
  end;

  [ComponentPlatformsAttribute(pidATPlatforms)]
  TATPolygon = class(TShape)
  strict private
    FNumberOfSides: Integer;
    FPath: TPathData;
    procedure SetNumberOfSides(const Value: Integer);
  strict protected
    procedure CreatePath;
    procedure Paint; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function PointInObject(X, Y: Single): Boolean; override;
  published
    property Align;
    property Anchors;
    property ClipChildren;
    property ClipParent;
    property Cursor;
    property DragMode;
    property Enabled;
    property EnableDragHighlight;
    property Fill;
    property Height;
    property HitTest;
    property Locked;
    property Margins;
    property NumberOfSides: Integer read FNumberOfSides write SetNumberOfSides;
    property Opacity;
    property Padding;
    property PopupMenu;
    property Position;
    property RotationAngle;
    property RotationCenter;
    property Scale;
    property Size;
    property Stroke;
    property Visible;
    property Width;
  end;


implementation

{ TATRoundRect }

constructor TATRoundRect.Create(AOwner: TComponent);
begin
  inherited;

  FCornerRadius := 8;
end;

procedure TATRoundRect.Paint;
var
  Radius: Single;
begin
  Radius := FCornerRadius;
  Canvas.FillRect(GetShapeRect, Radius, Radius, Corners, AbsoluteOpacity, Fill);
  Canvas.DrawRect(GetShapeRect, Radius, Radius, Corners, AbsoluteOpacity, Stroke);
end;

procedure TATRoundRect.SetCornerRadius(const Value: Integer);
begin
  if FCornerRadius <> Value then
  begin
    FCornerRadius := Value;
    Repaint;
  end;
end;


{ TATPolygon }

constructor TATPolygon.Create(AOwner: TComponent);
begin
  inherited;

  FNumberOfSides := 3;
  FPath := TPathData.Create;
end;

destructor TATPolygon.Destroy;
begin
  FreeAndNil(FPath);

  inherited;
end;

procedure TATPolygon.CreatePath;

  procedure GoToAVertex(n: Integer; Angle, Radius: Double; IsLineTo: Boolean =
     True);
  var
    NewLocation: TPointF;
  begin
    NewLocation.X := Width / 2 + Cos(n * Angle) * Radius;
    NewLocation.Y := Height / 2 - Sin(n * Angle) * Radius;

    if (IsLineTo) then
      FPath.LineTo(NewLocation)
    else
      FPath.MoveTo(NewLocation);
  end;

var
  i: Integer;
  Angle: Double;
  Radius: Double;
begin
  Angle := 2 * Pi / FNumberOfSides;
  Radius := Min(ShapeRect.Width / 2, ShapeRect.Height / 2);

  FPath.Clear;

  GoToAVertex(0, Angle, Radius, False);

  for i := 1 to FNumberOfSides do
    begin
      GoToAVertex(i, Angle, Radius);
    end;

  FPath.ClosePath;
end;

procedure TATPolygon.Paint;
begin
  CreatePath;
  Canvas.FillPath(FPath, AbsoluteOpacity, Fill);
  Canvas.DrawPath(FPath, AbsoluteOpacity, Stroke);
end;

function TATPolygon.PointInObject(X, Y: Single): Boolean;
begin
  CreatePath;
  Result := Canvas.PtInPath(AbsoluteToLocal(PointF(X, Y)), FPath);
end;

procedure TATPolygon.SetNumberOfSides(const Value: Integer);
begin
  if ( (FNumberOfSides <> Value) AND (Value >= 3) ) then
    begin
      FNumberOfSides := Value;
      Repaint;
    end;
end;

end.
