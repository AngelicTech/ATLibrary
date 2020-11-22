unit AT.FMX.ClockLabel;

interface

uses
  System.SysUtils, System.Classes, FMX.Types, FMX.Controls, FMX.StdCtrls;

const
  pidATPlatforms = pidWin32 OR pidWin64 OR pidOSX32 OR
                   pidiOSSimulator32 OR pidiOSSimulator64 OR
                   pidiOSDevice32 OR pidiOSDevice64 OR
                   pidAndroid32Arm OR pidAndroid64Arm OR
                   pidLinux64;

type
  [ComponentPlatformsAttribute(pidATPlatforms)]
  TATFMXClockLabel = class(TLabel)
  strict private
    FFormat: String;
    FTimer: TTimer;
    procedure OnTimer(Sender: TObject);
    procedure SetFormat(const Value: String);
    procedure UpdateLabel;
  protected
    property Text;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property Format: String read FFormat write SetFormat;
  end;

implementation

constructor TATFMXClockLabel.Create(AOwner: TComponent);
begin
  inherited;

  FFormat := 'c';

  if (NOT (csDesigning IN ComponentState)) then
    begin
      FTimer := TTimer.Create(AOwner);
      FTimer.OnTimer := OnTimer;
      FTimer.Interval := 1000;
      FTimer.Enabled := True;
    end;

  UpdateLabel;
end;

destructor TATFMXClockLabel.Destroy;
begin
  FreeAndNil(FTimer);
  inherited;
end;

procedure TATFMXClockLabel.OnTimer(Sender: TObject);
begin
  UpdateLabel;
end;

procedure TATFMXClockLabel.SetFormat(const Value: String);
begin
  FFormat := Value;
  UpdateLabel;
end;

procedure TATFMXClockLabel.UpdateLabel;
begin
  Text := FormatDateTime(FFormat, Now);
end;

end.
