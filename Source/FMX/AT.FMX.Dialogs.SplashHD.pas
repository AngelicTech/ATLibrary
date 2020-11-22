unit AT.FMX.Dialogs.SplashHD;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants, FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics,
  FMX.Dialogs, FMX.Objects, Radiant.Shapes, FMX.Layouts, FMX.Ani,
  FMX.Effects, FMX.StdCtrls, FMX.Controls.Presentation;

type
  TdlgATSplashHD = class(TForm)
    layMain: TLayout;
    shpBackground: TRadiantRectangle;
    faniBG: TFloatAnimation;
    lblAppTitle: TLabel;
    lblVersion: TLabel;
    aniSplash: TAniIndicator;
    layBottom: TLayout;
    imgLogo: TImage;
    lblStartMsg: TLabel;
    lblCopyright: TLabel;
    faniLogo: TFloatAnimation;
    faniAppTitle: TFloatAnimation;
    faniVersion: TFloatAnimation;
    faniAni: TFloatAnimation;
    faniCopyright: TFloatAnimation;
    faniStartMsg: TFloatAnimation;
    procedure FormCreate(Sender: TObject);
  strict private
    FBGGradPt1: TGradientPoint;
    FBGGradPt2: TGradientPoint;
    FBGGradPt3: TGradientPoint;
    FBGGradPt4: TGradientPoint;
    function GetAppTitle: String;
    function GetCopyright: String;
    function GetFormColor1: TAlphaColor;
    function GetFormColor2: TAlphaColor;
    function GetFormColor3: TAlphaColor;
    function GetFormColor4: TAlphaColor;
    function GetStartMessage: String;
    function GetVersion: String;
    procedure SetAppTitle(const Value: String);
    procedure SetCopyright(const Value: String);
    procedure SetFormColor1(const Value: TAlphaColor);
    procedure SetFormColor2(const Value: TAlphaColor);
    procedure SetFormColor3(const Value: TAlphaColor);
    procedure SetFormColor4(const Value: TAlphaColor);
    procedure SetStartMessage(const Value: String);
    procedure SetVersion(const Value: String);
    procedure _InitBG;
  published
    property AppTitle: String read GetAppTitle write SetAppTitle;
    property Copyright: String read GetCopyright write SetCopyright;
    property FormColor1: TAlphaColor read GetFormColor1 write SetFormColor1;
    property FormColor2: TAlphaColor read GetFormColor2 write SetFormColor2;
    property FormColor3: TAlphaColor read GetFormColor3 write SetFormColor3;
    property FormColor4: TAlphaColor read GetFormColor4 write SetFormColor4;
    property StartMessage: String read GetStartMessage write SetStartMessage;
    property Version: String read GetVersion write SetVersion;
  end;

var
  dlgATSplashHD: TdlgATSplashHD;

implementation

uses
  System.UIConsts;

{$R *.fmx}

procedure TdlgATSplashHD.FormCreate(Sender: TObject);
begin
  _InitBG;

  AppTitle := Application.Title;
  Copyright := EmptyStr;
  StartMessage := EmptyStr;
  Version := EmptyStr;
end;

function TdlgATSplashHD.GetAppTitle: String;
begin
  Result := lblAppTitle.Text;
end;

function TdlgATSplashHD.GetCopyright: String;
begin
  Result := lblCopyright.Text;
end;

function TdlgATSplashHD.GetFormColor1: TAlphaColor;
begin
  if (Assigned(FBGGradPt1)) then
    Result := FBGGradPt1.Color
  else
    Result := claNull;
end;

function TdlgATSplashHD.GetFormColor2: TAlphaColor;
begin
  if (Assigned(FBGGradPt2)) then
    Result := FBGGradPt2.Color
  else
    Result := claNull;
end;

function TdlgATSplashHD.GetFormColor3: TAlphaColor;
begin
  if (Assigned(FBGGradPt3)) then
    Result := FBGGradPt3.Color
  else
    Result := claNull;
end;

function TdlgATSplashHD.GetFormColor4: TAlphaColor;
begin
  if (Assigned(FBGGradPt4)) then
    Result := FBGGradPt4.Color
  else
    Result := claNull;
end;

function TdlgATSplashHD.GetStartMessage: String;
begin
  Result := lblStartMsg.Text;
end;

function TdlgATSplashHD.GetVersion: String;
begin
  Result := lblVersion.Text;
end;

procedure TdlgATSplashHD.SetAppTitle(const Value: String);
begin
  lblAppTitle.Text := Value;
end;

procedure TdlgATSplashHD.SetCopyright(const Value: String);
begin
  lblCopyright.Text := Value;
end;

procedure TdlgATSplashHD.SetFormColor1(const Value: TAlphaColor);
begin
  if (Assigned(FBGGradPt1)) then
    FBGGradPt1.Color := Value;
end;

procedure TdlgATSplashHD.SetFormColor2(const Value: TAlphaColor);
begin
  if (Assigned(FBGGradPt2)) then
    FBGGradPt2.Color := Value;
end;

procedure TdlgATSplashHD.SetFormColor3(const Value: TAlphaColor);
begin
  if (Assigned(FBGGradPt3)) then
    FBGGradPt3.Color := Value;
end;

procedure TdlgATSplashHD.SetFormColor4(const Value: TAlphaColor);
begin
  if (Assigned(FBGGradPt4)) then
    FBGGradPt4.Color := Value;
end;

procedure TdlgATSplashHD.SetStartMessage(const Value: String);
begin
  lblStartMsg.Text := Value;
end;

procedure TdlgATSplashHD.SetVersion(const Value: String);
begin
  lblVersion.Text := Value;
end;

procedure TdlgATSplashHD._InitBG;
begin
  shpBackground.Fill.Gradient.Points.Clear;
  FBGGradPt1 := shpBackground.Fill.Gradient.Points.Points
      [shpBackground.Fill.Gradient.Points.Add.Index];
  FBGGradPt1.Offset := 0;
  FBGGradPt1.IntColor := claWhite;

  FBGGradPt2 := shpBackground.Fill.Gradient.Points.Points
      [shpBackground.Fill.Gradient.Points.Add.Index];
  FBGGradPt2.Offset := 0.35;
  FBGGradPt2.IntColor := claWhite;

  FBGGradPt3 := shpBackground.Fill.Gradient.Points.Points
      [shpBackground.Fill.Gradient.Points.Add.Index];
  FBGGradPt3.Offset := 0.65;
  FBGGradPt3.IntColor := claWhite;

  FBGGradPt4 := shpBackground.Fill.Gradient.Points.Points
      [shpBackground.Fill.Gradient.Points.Add.Index];
  FBGGradPt4.Offset := 1.0;
  FBGGradPt4.IntColor := claWhite;
end;

end.
