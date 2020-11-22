unit AT.Vcl.Actions;

interface

uses
  System.Classes, System.Variants,
  Vcl.ActnList,
  AT.Vcl.Actions.Consts, AT.Vcl.Actions.Types;

type
  [ComponentPlatformsAttribute(pidCurrentPlatforms)]
  TATActionAction = class(TCustomAction)
  strict private
    FAction: TBasicAction;
  protected
    function GetChecked: Boolean;
    function GetEnabled: Boolean;
    function GetVisible: Boolean;
  public
    function Execute: Boolean; override;
    function Update: Boolean; override;
  published
    property Action: TBasicAction read FAction write FAction;
    property AutoCheck;
    property Caption;
    property GroupIndex;
    property HelpContext;
    property HelpKeyword;
    property HelpType;
    property Hint;
    property ImageIndex;
    property ImageName;
    property SecondaryShortCuts;
    property ShortCut;
  end;


implementation

uses
  System.SysUtils, System.Actions, System.Rtti,
  AT.Rtti;





{ TATActionAction }

function TATActionAction.Execute: Boolean;
begin
  if (NOT Assigned(FAction)) then
    exit(False);

  if (FAction = Self) then
    exit(False);

  Result := FAction.Execute;
end;

function TATActionAction.GetChecked: Boolean;
begin
  if (NOT Assigned(FAction)) then
    exit(False);

  if (FAction = Self) then
    exit(False);

  var AVal: TValue;

  if (NOT GetPropertyValue(FAction, 'Checked', AVal)) then
    exit(False);

  Result := AVal.AsBoolean;
end;

function TATActionAction.GetEnabled: Boolean;
begin
  if (NOT Assigned(FAction)) then
    exit(False);

  if (FAction = Self) then
    exit(False);

  var AVal: TValue;

  if (NOT GetPropertyValue(FAction, 'Enabled', AVal)) then
    exit(False);

  Result := AVal.AsBoolean;
end;

function TATActionAction.GetVisible: Boolean;
begin
  if (NOT Assigned(FAction)) then
    exit(False);

  if (FAction = Self) then
    exit(False);

  var AVal: TValue;

  if (NOT GetPropertyValue(FAction, 'Visible', AVal)) then
    exit(False);

  Result := AVal.AsBoolean;
end;

function TATActionAction.Update: Boolean;
begin
  if (NOT Assigned(FAction)) then
    exit(False);

  if (FAction = Self) then
    exit(False);

  Result := FAction.Update;

  Self.Checked := GetChecked;
  Self.Enabled := GetEnabled;
  Self.Visible := GetVisible;
end;

end.
