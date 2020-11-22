unit AT.FMX.Controls.Dialogs.ATSplashScreenHD;

interface

uses
  System.SysUtils, System.Classes, System.UITypes, FMX.Graphics,
  FMX.TMSBitmapContainer, AT.FMX.Dialogs.SplashHD, FMX.StdCtrls,
  FMX.Ani, System.UIConsts;

type
  TATSplashScreenHD = class(TComponent)
  private
    FSplash: TdlgATSplashHD;
    FVersion: string;
    FWaitMS: Integer;
    FCRFont: TFont;
    FAppTitle: string;
    FFormColor2: TAlphaColor;
    FBmpContainer: TTMSFMXBitmapContainer;
    FVersionFont: TFont;
    FCornerRadius: Integer;
    FFormColor1: TAlphaColor;
    FMsgFont: TFont;
    FCopyright: string;
    FStartMsg: string;
    FImageID: String;
    FTitleFont: TFont;
    FCRColor: TAlphaColor;
    FVerColor: TAlphaColor;
    FMsgColor: TAlphaColor;
    FTitleColor: TAlphaColor;
    FFormStroke: TStrokeBrush;
    FProgressStyle: TAniIndicatorStyle;
    function GetShowing: Boolean;
    procedure SetAppTitle(const Value: string);
    procedure SetBmpContainer(const Value: TTMSFMXBitmapContainer);
    procedure SetCopyright(const Value: string);
    procedure SetCornerRadius(const Value: Integer);
    procedure SetCRFont(const Value: TFont);
    procedure SetFontProps(var AFont: TFont; AName: TFontName;
                           ASize: Integer; AStyle: TFontStyles);
    procedure SetFormColor1(const Value: TAlphaColor);
    procedure SetFormColor2(const Value: TAlphaColor);
    procedure SetImageID(const Value: String);
    procedure SetMsgFont(const Value: TFont);
    procedure SetStartMsg(const Value: string);
    procedure SetTitleFont(const Value: TFont);
    procedure SetVersion(const Value: string);
    procedure SetVersionFont(const Value: TFont);
    procedure SetCRColor(const Value: TAlphaColor);
    procedure SetMsgColor(const Value: TAlphaColor);
    procedure SetTitleColor(const Value: TAlphaColor);
    procedure SetVerColor(const Value: TAlphaColor);
    procedure SetFormStroke(const Value: TStrokeBrush);
    procedure UpdateSplashForm;
    procedure SetProgressStyle(const Value: TAniIndicatorStyle);
  protected
    { Protected declarations }
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure AddStartMessage(const AMsg: String); virtual;
    procedure HideSplash;
    procedure ShowSplash;
  published
    property AppTitle: string read FAppTitle write SetAppTitle;
    property BitmapContainer: TTMSFMXBitmapContainer read FBmpContainer write SetBmpContainer;
    property Copyright: string read FCopyright write SetCopyright;
    property CopyrightColor: TAlphaColor read FCRColor write SetCRColor;
    property CopyrightFont: TFont read FCRFont write SetCRFont;
    property CornerRadius: Integer
      read   FCornerRadius
      write  SetCornerRadius;
    property FormColor1: TAlphaColor read FFormColor1 write SetFormColor1 default claWhite;
    property FormColor2: TAlphaColor read FFormColor2 write SetFormColor2 default claWhite;
    property FormStroke: TStrokeBrush read FFormStroke write SetFormStroke;
    property ImageID: String read FImageID write SetImageID;
    property MessageColor: TAlphaColor read FMsgColor write SetMsgColor;
    property MessageFont: TFont read FMsgFont write SetMsgFont;
    property ProgressStyle: TAniIndicatorStyle read FProgressStyle write SetProgressStyle;
    property Showing: Boolean read GetShowing;
    property StartMessage: string read FStartMsg write SetStartMsg;
    property TitleColor: TAlphaColor read FTitleColor write SetTitleColor;
    property TitleFont: TFont read FTitleFont write SetTitleFont;
    property Version: string read FVersion write SetVersion;
    property VersionColor: TAlphaColor read FVerColor write SetVerColor;
    property VersionFont: TFont read FVersionFont write SetVersionFont;
    property WaitMS: Integer read FWaitMS write FWaitMS default 500;
  end;

procedure Register;

implementation

uses
  FMX.Forms;

procedure Register;
begin
  RegisterComponents('AT FMX Dialogs', [TATSplashScreenHD]);
end;

{ TATSplashScreenHD }

procedure TATSplashScreenHD.AddStartMessage(const AMsg: String);
var
  Cnt, Idx: Integer;
begin

  if (AMsg <> FStartMsg) then
    FStartMsg := AMsg;

  if (Assigned(FSplash)) then
    begin
      FSplash.StartMessage := AMsg;

      Cnt := FWaitMS DIV 10;

      if (Cnt < 1) then Cnt := 1;

      for Idx := 0 to (Cnt - 1) do
        begin
          Application.ProcessMessages;
          Sleep(10);
        end;
    end;
end;

constructor TATSplashScreenHD.Create(AOwner: TComponent);
var
  AFS: TFontStyles;
begin
  inherited Create(AOwner);

  FImageID := '';
  FBmpContainer := NIL;

  AFS := [];

  FCRFont := TFont.Create;
  SetFontProps(FCRFont, 'Arial', 8, AFS);
  FCRColor := claBlack;

  FMsgFont := TFont.Create;
  SetFontProps(FMsgFont, 'Arial', 12, AFS);
  FMsgColor := claBlack;

  AFS := [TFontStyle.fsBold];

  FTitleFont := TFont.Create;
  SetFontProps(FTitleFont, 'Arial', 28, AFS);
  FTitleColor := claBlack;

  FVersionFont := TFont.Create;
  SetFontProps(FVersionFont, 'Arial', 20, AFS);
  FVerColor := claBlack;

  FFormColor1 := claWhite;
  FFormColor2 := claWhite;

  FWaitMS := 500;

  FFormStroke := TStrokeBrush.Create(TBrushKind.None, claBlack);

  FSplash := TdlgATSplashHD.Create(NIL);
end;

destructor TATSplashScreenHD.Destroy;
begin

  if (Assigned(FSplash)) then
    FSplash.Release;

  FSplash := NIL;

  FreeAndNil(FCRFont);
  FreeAndNil(FMsgFont);
  FreeAndNil(FTitleFont);
  FreeAndNil(FVersionFont);

  inherited Destroy;
end;

function TATSplashScreenHD.GetShowing: Boolean;
begin
  if (Assigned(FSplash)) then
    Result := FSplash.Visible
  else
    Result := False;
end;

procedure TATSplashScreenHD.HideSplash;
begin
  if ( (Assigned(FSplash)) AND (Self.Showing) ) then
    FSplash.Hide;
end;

procedure TATSplashScreenHD.SetAppTitle(const Value: string);
begin
  FAppTitle := Value;
  UpdateSplashForm;
end;

procedure TATSplashScreenHD.SetBmpContainer(
  const Value: TTMSFMXBitmapContainer);
begin
  FBmpContainer := Value;
  UpdateSplashForm;
end;

procedure TATSplashScreenHD.SetCopyright(const Value: string);
begin
  FCopyright := Value;
  UpdateSplashForm;
end;

procedure TATSplashScreenHD.SetCornerRadius(const Value: Integer);
begin
  FCornerRadius := Value;
  UpdateSplashForm;
end;

procedure TATSplashScreenHD.SetCRColor(const Value: TAlphaColor);
begin
  FCRColor := Value;
  UpdateSplashForm;
end;

procedure TATSplashScreenHD.SetCRFont(const Value: TFont);
begin
  FCRFont := Value;
  UpdateSplashForm;
end;

procedure TATSplashScreenHD.SetFontProps(var AFont: TFont; AName: TFontName;
  ASize: Integer; AStyle: TFontStyles);
begin
  AFont.Family := AName;
  AFont.Size := ASize;
  AFont.Style := AStyle;
end;

procedure TATSplashScreenHD.SetFormColor1(const Value: TAlphaColor);
begin
  FFormColor1 := Value;
  UpdateSplashForm;
end;

procedure TATSplashScreenHD.SetFormColor2(const Value: TAlphaColor);
begin
  FFormColor2 := Value;
  UpdateSplashForm;
end;

procedure TATSplashScreenHD.SetFormStroke(const Value: TStrokeBrush);
begin
  FFormStroke := Value;
  UpdateSplashForm;
end;

procedure TATSplashScreenHD.SetImageID(const Value: String);
begin
  FImageID := Value;
  UpdateSplashForm;
end;

procedure TATSplashScreenHD.SetMsgColor(const Value: TAlphaColor);
begin
  FMsgColor := Value;
  UpdateSplashForm;
end;

procedure TATSplashScreenHD.SetMsgFont(const Value: TFont);
begin
  FMsgFont := Value;
  UpdateSplashForm;
end;

procedure TATSplashScreenHD.SetProgressStyle(const Value: TAniIndicatorStyle);
begin
  FProgressStyle := Value;
  UpdateSplashForm;
end;

procedure TATSplashScreenHD.SetStartMsg(const Value: string);
begin
  FStartMsg := Value;
  AddStartMessage(Value);
end;

procedure TATSplashScreenHD.SetTitleColor(const Value: TAlphaColor);
begin
  FTitleColor := Value;
  UpdateSplashForm;
end;

procedure TATSplashScreenHD.SetTitleFont(const Value: TFont);
begin
  FTitleFont := Value;
  UpdateSplashForm;
end;

procedure TATSplashScreenHD.SetVerColor(const Value: TAlphaColor);
begin
  FVerColor := Value;
  UpdateSplashForm;
end;

procedure TATSplashScreenHD.SetVersion(const Value: string);
begin
  FVersion := Value;
  UpdateSplashForm;
end;

procedure TATSplashScreenHD.SetVersionFont(const Value: TFont);
begin
  FVersionFont := Value;
  UpdateSplashForm;
end;

procedure TATSplashScreenHD.ShowSplash;
begin
  if ( (Assigned(FSplash)) AND (NOT Self.Showing) ) then
    begin
      FSplash.Show;
      UpdateSplashForm;
    end;
end;

procedure TATSplashScreenHD.UpdateSplashForm;
begin
  if (Assigned(FSplash)) then
    begin
      FSplash.AppTitle := FAppTitle;
      FSplash.Copyright := FCopyright;
      FSplash.StartMessage := FStartMsg;
      FSplash.Version := FVersion;

      FSplash.FormColor1 := FFormColor1;
      FSplash.FormColor2 := FFormColor2;

      //TODO: Reimplement properties...
//      if ( (Assigned(FFormStroke)) AND (Assigned(FSplash.FormStroke)) ) then
//        FSplash.FormStroke.Assign(FFormStroke);
//
//      FSplash.BitmapContainer := FBmpContainer;
//      FSplash.ImageID := FImageID;
//
//      if ( (Assigned(FCRFont)) AND (Assigned(FSplash.CopyrightFont)) ) then
//        FSplash.CopyrightFont.Assign(FCRFont);
//      FSplash.CopyrightColor := FCRColor;
//
//      if ( (Assigned(FMsgFont)) AND (Assigned(FSplash.MessageFont)) ) then
//        FSplash.MessageFont.Assign(FMsgFont);
//      FSplash.MessageColor := FMsgColor;
//
//      if ( (Assigned(FTitleFont)) AND (Assigned(FSplash.TitleFont)) ) then
//        FSplash.TitleFont.Assign(FTitleFont);
//      FSplash.TitleColor := FTitleColor;
//
//      if ( (Assigned(FVersionFont)) AND (Assigned(FSplash.VersionFont)) )then
//        FSplash.VersionFont.Assign(FVersionFont);
//      FSplash.VersionColor := FVerColor;
//
//      FSplash.CornerRadius := FCornerRadius;
//
//      FSplash.ProgressStyle := FProgressStyle;
      

    end;
end;

end.
