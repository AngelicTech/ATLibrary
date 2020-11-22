unit AT.FMX.DlgButtonPanel;

interface

uses
  System.SysUtils, System.Classes, FMX.Types, FMX.Controls,
  System.UITypes;

const
  pidATPlatforms = pidWin32 OR pidWin64 OR pidOSX32 OR
                   pidiOSSimulator32 OR pidiOSSimulator64 OR
                   pidiOSDevice32 OR pidiOSDevice64 OR
                   pidAndroid32Arm OR pidAndroid64Arm OR
                   pidLinux64;

type
  [ComponentPlatformsAttribute(pidATPlatforms)]
  TATFMXDlgButtonPanel = class(TStyledControl)
  strict private
    FCancelButtonVisible: Boolean;
    FCancelCaption: String;
    FDoButtonVisible: Boolean;
    FDontButtonVisible: Boolean;
    FDontVerbCaption: String;
    FDoVerbCaption: String;
    function GetCancelButtonVisible: Boolean;
    function GetCancelCaption: String;
    function GetDoButtonVisible: Boolean;
    function GetDontButtonVisible: Boolean;
    function GetDontVerbCaption: String;
    function GetDoVerbCaption: String;
    procedure SetCancelButtonVisible(const Value: Boolean);
    procedure SetCancelCaption(const Value: String);
    procedure SetDoButtonVisible(const Value: Boolean);
    procedure SetDontButtonVisible(const Value: Boolean);
    procedure SetDontVerbCaption(const Value: String);
    procedure SetDoVerbCaption(const Value: String);
  strict protected
    procedure ApplyStyle; override;
    function GetStyleObject: TFMXObject; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property Align default TAlignLayout.MostBottom;
    property CancelButtonVisible: Boolean read GetCancelButtonVisible write
        SetCancelButtonVisible;
    property CancelCaption: String read GetCancelCaption write SetCancelCaption;
    property DoButtonVisible: Boolean read GetDoButtonVisible write
        SetDoButtonVisible;
    property DontButtonVisible: Boolean read GetDontButtonVisible write
        SetDontButtonVisible;
    property DontVerbCaption: String read GetDontVerbCaption write
        SetDontVerbCaption;
    property DoVerbCaption: String read GetDoVerbCaption write SetDoVerbCaption;
  end;


const
  mrDont = -mrOk;

implementation

uses
  System.Types, FMX.Styles, FMX.StdCtrls;

{$IF Defined(ANDROID)}
{$R TATFMXDlgButtonPanel.Android.res}
{$ENDIF}

{$IF Defined(IOS)}
{$R TATFMXDlgButtonPanel.iOS.res}
{$ENDIF}

{$IF ( (Defined(MACOS)) AND (NOT Defined(IOS)) )}
{$R TATFMXDlgButtonPanel.Mac.res}
{$ENDIF}

{$IF Defined(LINUX)}
{$R TATFMXDlgButtonPanel.Linux.res}
{$ENDIF}

{$IF Defined(MSWINDOWS)}
{$R TATFMXDlgButtonPanel.Win.res}
{$ENDIF}


const
  cCancelBtnName = 'CancelButton';
  cDoBtnName = 'DoButton';
  cDontBtnName = 'DontButton';



constructor TATFMXDlgButtonPanel.Create(AOwner: TComponent);
begin
  inherited;

  Height := 48;
  Align := TAlignLayout.MostBottom;
  CancelCaption := 'Cancel';
  DoVerbCaption := 'Verb';
  DontVerbCaption := 'Don''t Verb';
  CancelButtonVisible := True;
  DoButtonVisible := True;
  DontButtonVisible := True;
end;

procedure TATFMXDlgButtonPanel.ApplyStyle;
begin
  inherited;

  SetCancelButtonVisible(FCancelButtonVisible);
  SetCancelCaption(FCancelCaption);
  SetDoButtonVisible(FDoButtonVisible);
  SetDontButtonVisible(FDontButtonVisible);
  SetDontVerbCaption(FDontVerbCaption);
  SetDoVerbCaption(FDoVerbCaption);
end;

function TATFMXDlgButtonPanel.GetCancelButtonVisible: Boolean;
var
  Base: TFmxObject;
begin
  Base := FindStyleResource(cCancelBtnName);
  if ( (Assigned(Base)) AND (Base IS TButton) ) then
    FCancelButtonVisible := (Base AS TButton).Visible;

  Result := FCancelButtonVisible;
end;

function TATFMXDlgButtonPanel.GetCancelCaption: String;
var
  Base: TFmxObject;
begin
  Base := FindStyleResource(cCancelBtnName);
  if ( (Assigned(Base)) AND (Base IS TButton) ) then
    FCancelCaption := (Base AS TButton).Text;

  Result := FCancelCaption;
end;

function TATFMXDlgButtonPanel.GetDoButtonVisible: Boolean;
var
  Base: TFmxObject;
begin
  Base := FindStyleResource(cDoBtnName);
  if ( (Assigned(Base)) AND (Base IS TButton) ) then
    FDoButtonVisible := (Base AS TButton).Visible;

  Result := FDoButtonVisible;
end;

function TATFMXDlgButtonPanel.GetDontButtonVisible: Boolean;
var
  Base: TFmxObject;
begin
  Base := FindStyleResource(cDontBtnName);
  if ( (Assigned(Base)) AND (Base IS TButton) ) then
    FDontButtonVisible := (Base AS TButton).Visible;

  Result := FDontButtonVisible;
end;

function TATFMXDlgButtonPanel.GetDontVerbCaption: String;
var
  Base: TFmxObject;
begin
  Base := FindStyleResource(cDontBtnName);
  if ( (Assigned(Base)) AND (Base IS TButton) ) then
    FDontVerbCaption := (Base AS TButton).Text;

  Result := FDontVerbCaption;
end;

function TATFMXDlgButtonPanel.GetDoVerbCaption: String;
var
  Base: TFmxObject;
begin
  Base := FindStyleResource(cDoBtnName);
  if ( (Assigned(Base)) AND (Base IS TButton) ) then
    FDoVerbCaption := (Base AS TButton).Text;

  Result := FDoVerbCaption;
end;

function TATFMXDlgButtonPanel.GetStyleObject: TFMXObject;
const
  Style = 'ATFMXDlgButtonPanelStyle';
begin
  if (StyleLookup = '') then
  begin
    Result := TControl(TStyleStreaming.LoadFromResource(HInstance, Style,
      RT_RCDATA));
    Exit;
  end;
  Result := inherited GetStyleObject;
end;

procedure TATFMXDlgButtonPanel.SetCancelButtonVisible(const Value: Boolean);
var
  Base: TFmxObject;
begin
  FCancelButtonVisible := Value;

  Base := FindStyleResource(cCancelBtnName);
  if ( (Assigned(Base)) AND (Base IS TButton) ) then
    (Base AS TButton).Visible := Value;
end;

procedure TATFMXDlgButtonPanel.SetCancelCaption(const Value: String);
var
  Base: TFmxObject;
begin
  FCancelCaption := Value;

  Base := FindStyleResource(cCancelBtnName);
  if ( (Assigned(Base)) AND (Base IS TButton) ) then
    (Base AS TButton).Text := Value;
end;

procedure TATFMXDlgButtonPanel.SetDoButtonVisible(const Value: Boolean);
var
  Base: TFmxObject;
begin
  FDoButtonVisible := Value;

  Base := FindStyleResource(cDoBtnName);
  if ( (Assigned(Base)) AND (Base IS TButton) ) then
    (Base AS TButton).Visible := Value;
end;

procedure TATFMXDlgButtonPanel.SetDontButtonVisible(const Value: Boolean);
var
  Base: TFmxObject;
begin
  FDontButtonVisible := Value;

  Base := FindStyleResource(cDontBtnName);
  if ( (Assigned(Base)) AND (Base IS TButton) ) then
    (Base AS TButton).Visible := Value;
end;

procedure TATFMXDlgButtonPanel.SetDontVerbCaption(const Value: String);
var
  Base: TFmxObject;
begin
  FDontVerbCaption := Value;

  Base := FindStyleResource(cDontBtnName);
  if ( (Assigned(Base)) AND (Base IS TButton) ) then
    (Base AS TButton).Text := Value;
end;

procedure TATFMXDlgButtonPanel.SetDoVerbCaption(const Value: String);
var
  Base: TFmxObject;
begin
  FDoVerbCaption := Value;

  Base := FindStyleResource(cDoBtnName);
  if ( (Assigned(Base)) AND (Base IS TButton) ) then
    (Base AS TButton).Text := Value;
end;


end.
