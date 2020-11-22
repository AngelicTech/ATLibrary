unit AT.XPlatform;

interface

uses
  System.UITypes, System.UIConsts, FMX.Graphics;

type
  TATAppFramework = (fwkNone, fwkVCL, fwkFMX, fwkIW14);
  TATAppArchitecture = (archUnknown, archMacOS32, archMacOS64,
     archAndroid, archIOS, archWin32, archWin64);

function ColorToHTMLColor(AColor: TAlphaColor): String; overload;
function ColorToHTMLColor(AColor: TColor): String; overload;
function GetAppArchitecture: TATAppArchitecture;
function GetComputerName: String;
function GetFrameworkType: TATAppFramework;
function GetOSUserName: String;
function HTMLColorToAlphaColor(AColor: String; AAlpha: Byte = 255;
    ADefault: TAlphaColor = claNull): TAlphaColor;
function HTMLColorToColor(AColor: String; ADefault: TColor = TColor(0)):
    TColor;
function SelectFolder(const ATitle: string; var ADir: string): Boolean;


implementation

uses
  {$IFDEF MacOS} {$IFNDEF IOS}
  AT.MacOS,
  {$ENDIF} {$ENDIF}
  {$IFNDEF MSWINDOWS}
    AT.Posix.SystemInfo, AT.Posix.SystemInfo.Kernel,
    AT.Posix.SystemInfo.Hardware,
  {$ENDIF}
  {$IFDEF MSWINDOWS}
  AT.Windows, AT.Windows.System,
  {$ENDIF}
  System.SysUtils, Rtti;

function ColorToHTMLColor(AColor: TAlphaColor): String; overload;
var
  AlphaRec: TAlphaColorRec;
  AR, AG, AB: Byte;
  SR: String;
  SG: string;
  SB: string;
begin
  AlphaRec.Color := AColor;

  AR := AlphaRec.R;
  AG := AlphaRec.G;
  AB := AlphaRec.B;

  SR := IntToHex(AR, 2);
  SG := IntToHex(AG, 2);
  SB := IntToHex(AB, 2);

  Result := Format('#%s%s%s', [SR, SG, SB]);
end;

function ColorToHTMLColor(AColor: TColor): String; overload;
var
  ColorRec: TColorRec;
  AR, AG, AB: Byte;
  SR: string;
  SG: string;
  SB: string;
begin
  ColorRec.Color := AColor;

  AR := ColorRec.R;
  AG := ColorRec.G;
  AB := ColorRec.B;

  SR := IntToHex(AR, 2);
  SG := IntToHex(AG, 2);
  SB := IntToHex(AB, 2);

  Result := Format('#%s%s%s', [SR, SG, SB]);
end;

function GetAppArchitecture: TATAppArchitecture;
begin
  {$IFDEF WIN32}
  Exit(archWin32);

  {$ELSEIF WIN64}
  Exit(archWin64);

  {$ELSEIF ANDROID}
  Exit(archAndroid);

  {$ELSEIF MACOS32} {$IFNDEF IOS}
  Exit(archMacOS32);
  {$ENDIF}

  {$ELSEIF IOS}
  Exit(archIOS);

  {$ELSE}
  Result := archUnknown;

  {$ENDIF}
end;

function GetComputerName: String;
begin
  {$IFDEF MSWINDOWS}
  Result := AT.Windows.GetComputer;
  {$ELSEIF ( (Defined(ANDROID)) OR (Defined(LINUX)) )}
  //todo:
  Result := '';
  {$ELSE}
  Result := AT.Posix.SystemInfo.Kernel.Hostname;
  {$ENDIF}
end;


function GetFrameworkType: TATAppFramework;
var
  AContext: TRttiContext;
  AType: TRttiType;
begin
  AContext := TRttiContext.Create;

  //Check for IntraWeb...
  AType := AContext.FindType('IWApplication.TIWApplication');
  if (Assigned(AType)) then Exit(fwkIW14);

  //Check for VCL...
  AType := AContext.FindType('Vcl.Forms.TApplication');
  if (Assigned(AType)) then Exit(fwkVCL);

  //Check for Firemonkey...
  AType := AContext.FindType('FMX.Forms.TApplication');
  if (Assigned(AType)) then Exit(fwkFMX);


  Result := fwkNone;
end;

function GetOSUserName: String;
begin
  {$IFDEF WIN32}
  Exit(AT.Windows.GetOSUserName);
  {$ENDIF}

  {$IFDEF WIN64}
  Exit(AT.Windows.GetOSUserName);
  {$ENDIF}

  {$IFDEF ANDROID}
  Exit('');
  {$ENDIF}

  {$IFDEF MACOS32} {$IFNDEF IOS}
  Exit(AT.MacOS.GetUserName);
  {$ENDIF} {$ENDIF}

  {$IFDEF IOS}
  Exit('');
  {$ENDIF}

  Result := '';

end;

function HTMLColorToAlphaColor(AColor: String; AAlpha: Byte = 255;
   ADefault: TAlphaColor = claNull): TAlphaColor;
var
  SR: String;
  SG: String;
  SB: String;
  AAlphaColor: TAlphaColorRec;
begin
  if (AColor.Length <> 7) then
    Exit(ADefault);

  if (Pos('#', AColor) <> 1) then
    Exit(ADefault);

  SR := Copy(AColor, 2, 2);
  SR := Format('$%s', [SR]);

  SG := Copy(AColor, 4, 2);
  SG := Format('$%s', [SG]);

  SB := Copy(AColor, 6, 2);
  SB := Format('$%s', [SB]);

  AAlphaColor.R := SR.ToInteger;
  AAlphaColor.G := SG.ToInteger;
  AAlphaColor.B := SB.ToInteger;
  AAlphaColor.A := AAlpha;

  Result := AAlphaColor.Color;
end;

function HTMLColorToColor(AColor: String; ADefault: TColor = TColor(0)):
TColor;
var
  SR: String;
  SG: String;
  SB: String;
  AColorRec: TColorRec;
begin
  if (AColor.Length <> 7) then
    Exit(ADefault);

  if (Pos('#', AColor) <> 1) then
    Exit(ADefault);

  SR := Copy(AColor, 2, 2);
  SR := Format('$%s', [SR]);

  SG := Copy(AColor, 4, 2);
  SG := Format('$%s', [SG]);

  SB := Copy(AColor, 6, 2);
  SB := Format('$%s', [SB]);

  AColorRec.R := SR.ToInteger;
  AColorRec.G := SG.ToInteger;
  AColorRec.B := SB.ToInteger;

  Result := AColorRec.Color;
end;


function SelectFolder(const ATitle: string; var ADir: string): Boolean;
begin
  {$IFDEF ANDROID}
  { TODO : Add Android functionality. }

  {$ELSEIF MACOS}
    {$IFDEF IOS}
    { TODO : Add iOS functionality. }
    {$ELSE}
    Exit(AT.MacOS.SelectFolder(ATitle, ADir));
    {$ENDIF}

  {$ELSEIF MSWINDOWS}
    Exit(AT.Windows.SelectFolder(ATitle, ADir));

  {$ELSE}
  Result := False;

  {$ENDIF}
end;

end.
