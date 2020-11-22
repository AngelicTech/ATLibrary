unit AT.Vcl.Actions.Data;

interface

uses
  System.Classes, System.Variants, Vcl.ActnList,
  AT.Vcl.Actions.Consts, AT.Vcl.Actions.Types;

type
  [ComponentPlatformsAttribute(pidCurrentPlatforms)]
  TATCustomDataAction = class(TAction)
  strict private
    FDescription: String;
  strict protected
    function GetDescription: String;
    procedure SetDescription(const Value: String);
  published
    property Description: String read GetDescription write SetDescription;
  end;

  [ComponentPlatformsAttribute(pidCurrentPlatforms)]
  TATBooleanDataAction = class(TATCustomDataAction)
  strict private
    FAfterDataChange: TATBoolDataAfterChangedEvent;
    FBeforeDataChange: TATBoolDataBeforeChangedEvent;
    FData: Boolean;
    procedure SetData(Value: Boolean);
  strict protected
    procedure _AfterDataChange(const Value: Boolean);
    procedure _BeforeDataChange(const OldValue: Boolean;
        const NewValue: Boolean);
  public
    constructor Create(AOwner: TComponent); override;
  published
    property AfterDataChanged: TATBoolDataAfterChangedEvent
        read FAfterDataChange write FAfterDataChange;
    property BeforeDataChanged: TATBoolDataBeforeChangedEvent
        read FBeforeDataChange write FBeforeDataChange;
    property Data: Boolean read FData write SetData default False;
  end;

  [ComponentPlatformsAttribute(pidCurrentPlatforms)]
  TATDataAction = class(TATCustomDataAction)
  strict private
    FAfterDataChange: TATDataAfterChangedEvent;
    FBeforeDataChange: TATDataBeforeChangedEvent;
    FData: Variant;
    procedure SetData(Value: Variant);
  strict protected
    procedure _AfterDataChange(const Value: Variant);
    procedure _BeforeDataChange(const OldValue: Variant;
        const NewValue: Variant);
  public
    constructor Create(AOwner: TComponent); override;
  published
    property AfterDataChanged: TATDataAfterChangedEvent
        read FAfterDataChange write FAfterDataChange;
    property BeforeDataChanged: TATDataBeforeChangedEvent
        read FBeforeDataChange write FBeforeDataChange;
    property Data: Variant read FData write SetData;
  end;

  [ComponentPlatformsAttribute(pidCurrentPlatforms)]
  TATDateTimeDataAction = class(TATCustomDataAction)
  strict private
    FAfterDataChange: TATDateTimeDataAfterChangedEvent;
    FBeforeDataChange: TATDateTimeDataBeforeChangedEvent;
    FData: TDateTime;
    procedure SetData(Value: TDateTime);
  strict protected
    procedure _AfterDataChange(const Value: TDateTime);
    procedure _BeforeDataChange(const OldValue: TDateTime;
        const NewValue: TDateTime);
  public
    constructor Create(AOwner: TComponent); override;
  published
    property AfterDataChanged: TATDateTimeDataAfterChangedEvent
        read FAfterDataChange write FAfterDataChange;
    property BeforeDataChanged: TATDateTimeDataBeforeChangedEvent
        read FBeforeDataChange write FBeforeDataChange;
    property Data: TDateTime read FData write SetData;
  end;

  [ComponentPlatformsAttribute(pidCurrentPlatforms)]
  TATInt32DataAction = class(TATCustomDataAction)
  strict private
    FAfterDataChange: TATInt32DataAfterChangedEvent;
    FBeforeDataChange: TATInt32DataBeforeChangedEvent;
    FData: Integer;
    procedure SetData(Value: Integer);
  strict protected
    procedure _AfterDataChange(const Value: Integer);
    procedure _BeforeDataChange(const OldValue: Integer;
        const NewValue: Integer);
  public
    constructor Create(AOwner: TComponent); override;
  published
    property AfterDataChanged: TATInt32DataAfterChangedEvent
        read FAfterDataChange write FAfterDataChange;
    property BeforeDataChanged: TATInt32DataBeforeChangedEvent
        read FBeforeDataChange write FBeforeDataChange;
    property Data: Integer read FData write SetData default 0;
  end;

  [ComponentPlatformsAttribute(pidCurrentPlatforms)]
  TATInt64DataAction = class(TATCustomDataAction)
  strict private
    FAfterDataChange: TATInt64DataAfterChangedEvent;
    FBeforeDataChange: TATInt64DataBeforeChangedEvent;
    FData: Int64;
    procedure SetData(Value: Int64);
  strict protected
    procedure _AfterDataChange(const Value: Int64);
    procedure _BeforeDataChange(const OldValue: Int64;
        const NewValue: Int64);
  public
    constructor Create(AOwner: TComponent); override;
  published
    property AfterDataChanged: TATInt64DataAfterChangedEvent
        read FAfterDataChange write FAfterDataChange;
    property BeforeDataChanged: TATInt64DataBeforeChangedEvent
        read FBeforeDataChange write FBeforeDataChange;
    property Data: Int64 read FData write SetData default 0;
  end;

  [ComponentPlatformsAttribute(pidCurrentPlatforms)]
  TATMultiDataAction = class(TATCustomDataAction)
  strict private
    FAfterDataChange: TATDataAfterChangedEvent;
    FBeforeDataChange: TATDataBeforeChangedEvent;
    FBoolData: Boolean;
    FDTData: TDateTime;
    FInt32Data: Integer;
    FInt64Data: Int64;
    FStringData: String;
    FVarData: Variant;
    procedure SetBoolData(Value: Boolean);
    procedure SetDTData(Value: TDateTime);
    procedure SetInt32Data(Value: Integer);
    procedure SetInt64Data(Value: Int64);
    procedure SetStringData(Value: String);
    procedure SetVarData(Value: Variant);
  strict protected
    procedure _AfterDataChange(const Value: Variant);
    procedure _BeforeDataChange(const OldValue: Variant;
        const NewValue: Variant);
  public
    constructor Create(AOwner: TComponent); override;
  published
    property AfterDataChanged: TATDataAfterChangedEvent
        read FAfterDataChange write FAfterDataChange;
    property BeforeDataChanged: TATDataBeforeChangedEvent
        read FBeforeDataChange write FBeforeDataChange;
    property BooleanData: Boolean read FBoolData write SetBoolData;
    property DateTimeData: TDateTime read FDTData write SetDTData;
    property Int32Data: Integer read FInt32Data write SetInt32Data;
    property Int64Data: Int64 read FInt64Data write SetInt64Data;
    property StringData: String read FStringData write SetStringData;
    property VariantData: Variant read FVarData write SetVarData;
  end;

  [ComponentPlatformsAttribute(pidCurrentPlatforms)]
  TATStrDataAction = class(TATCustomDataAction)
  strict private
    FAfterDataChange: TATStrDataAfterChangedEvent;
    FBeforeDataChange: TATStrDataBeforeChangedEvent;
    FData: String;
    procedure SetData(Value: String);
  strict protected
    procedure _AfterDataChange(const Value: String);
    procedure _BeforeDataChange(const OldValue: String;
        const NewValue: String);
  public
    constructor Create(AOwner: TComponent); override;
  published
    property AfterDataChanged: TATStrDataAfterChangedEvent
        read FAfterDataChange write FAfterDataChange;
    property BeforeDataChanged: TATStrDataBeforeChangedEvent
        read FBeforeDataChange write FBeforeDataChange;
    property Data: String read FData write SetData;
  end;


implementation

uses
  System.SysUtils, System.Actions, AT.Rtti;


{ TATCustomDataAction }

function TATCustomDataAction.GetDescription: String;
begin
  Result := FDescription;
end;

procedure TATCustomDataAction.SetDescription(const Value: String);
var
  Idx: Integer;
  ALink: TBasicActionLink;
begin
  if (Value <> FDescription) then
    begin
      for Idx := 0 to (ClientCount - 1) do
        begin
          ALink := Clients[Idx];

          if (HasProperty(ALink, 'Description')) then
            SetPropertyValue(ALink, 'Description', Value);
        end;

      FDescription := Value;
      Change;
    end;
end;

{ TATBooleanDataAction }

constructor TATBooleanDataAction.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FData := False;
end;

procedure TATBooleanDataAction.SetData(Value: Boolean);
begin
  _BeforeDataChange(FData, Value);
  FData := Value;
  _AfterDataChange(FData);
end;

procedure TATBooleanDataAction._AfterDataChange(const Value: Boolean);
begin
  if (NOT Assigned(FAfterDataChange)) then
    Exit;

  FAfterDataChange(Self, Value);
end;

procedure TATBooleanDataAction._BeforeDataChange(const OldValue,
  NewValue: Boolean);
begin
  if (NOT Assigned(FBeforeDataChange)) then
    Exit;

  FBeforeDataChange(Self, OldValue, NewValue);
end;

{ TATDataAction }

constructor TATDataAction.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FData := Unassigned;
end;

procedure TATDataAction.SetData(Value: Variant);
begin
  _BeforeDataChange(FData, Value);
  FData := Value;
  _AfterDataChange(FData);
end;


procedure TATDataAction._AfterDataChange(const Value: Variant);
begin
  if (NOT Assigned(FAfterDataChange)) then
    Exit;

  FAfterDataChange(Self, Value);
end;

procedure TATDataAction._BeforeDataChange(const OldValue: Variant;
        const NewValue: Variant);
begin
  if (NOT Assigned(FBeforeDataChange)) then
    Exit;

  FBeforeDataChange(Self, OldValue, NewValue);
end;

{ TATDateTimeDataAction }

constructor TATDateTimeDataAction.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FData := Now;
end;

procedure TATDateTimeDataAction.SetData(Value: TDateTime);
begin
  _BeforeDataChange(FData, Value);
  FData := Value;
  _AfterDataChange(FData);
end;

procedure TATDateTimeDataAction._AfterDataChange(
  const Value: TDateTime);
begin
  if (NOT Assigned(FAfterDataChange)) then
    Exit;

  FAfterDataChange(Self, Value);
end;

procedure TATDateTimeDataAction._BeforeDataChange(
  const OldValue: TDateTime; const NewValue: TDateTime);
begin
  if (NOT Assigned(FBeforeDataChange)) then
    Exit;

  FBeforeDataChange(Self, OldValue, NewValue);
end;

{ TATInt32DataAction }

constructor TATInt32DataAction.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  FData := 0;
end;

procedure TATInt32DataAction.SetData(Value: Integer);
begin
  _BeforeDataChange(FData, Value);
  FData := Value;
  _AfterDataChange(FData);
end;

procedure TATInt32DataAction._AfterDataChange(const Value: Integer);
begin
  if (NOT Assigned(FAfterDataChange)) then
    Exit;

  FAfterDataChange(Self, Value);
end;

procedure TATInt32DataAction._BeforeDataChange(const OldValue,
  NewValue: Integer);
begin
  if (NOT Assigned(FBeforeDataChange)) then
    Exit;

  FBeforeDataChange(Self, OldValue, NewValue);
end;

{ TATInt64DataAction }

constructor TATInt64DataAction.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  FData := 0;
end;

procedure TATInt64DataAction.SetData(Value: Int64);
begin
  _BeforeDataChange(FData, Value);
  FData := Value;
  _AfterDataChange(FData);
end;

procedure TATInt64DataAction._AfterDataChange(const Value: Int64);
begin
  if (NOT Assigned(FAfterDataChange)) then
    Exit;

  FAfterDataChange(Self, Value);
end;

procedure TATInt64DataAction._BeforeDataChange(const OldValue: Int64;
  const NewValue: Int64);
begin
  if (NOT Assigned(FBeforeDataChange)) then
    Exit;

  FBeforeDataChange(Self, OldValue, NewValue);
end;

{ TATMultiDataAction }

constructor TATMultiDataAction.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  FBoolData := False;
  FDTData := Now;
  FInt32Data := 0;
  FInt64Data := 0;
  FStringData := EmptyStr;
  FVarData := Unassigned;
end;

procedure TATMultiDataAction.SetBoolData(Value: Boolean);
begin
  _BeforeDataChange(FBoolData, Value);
  FBoolData := Value;
  _AfterDataChange(FBoolData);
end;

procedure TATMultiDataAction.SetDTData(Value: TDateTime);
begin
  _BeforeDataChange(FDTData, Value);
  FDTData := Value;
  _AfterDataChange(FDTData);
end;

procedure TATMultiDataAction.SetInt32Data(Value: Integer);
begin
  _BeforeDataChange(FInt32Data, Value);
  FInt32Data := Value;
  _AfterDataChange(FInt32Data);
end;

procedure TATMultiDataAction.SetInt64Data(Value: Int64);
begin
  _BeforeDataChange(FInt64Data, Value);
  FInt64Data := Value;
  _AfterDataChange(FInt64Data);
end;

procedure TATMultiDataAction.SetStringData(Value: String);
begin
  _BeforeDataChange(FStringData, Value);
  FStringData := Value;
  _AfterDataChange(FStringData);
end;

procedure TATMultiDataAction.SetVarData(Value: Variant);
begin
  _BeforeDataChange(FVarData, Value);
  FVarData := Value;
  _AfterDataChange(FVarData);
end;

procedure TATMultiDataAction._AfterDataChange(const Value: Variant);
begin
  if (NOT Assigned(FAfterDataChange)) then
    Exit;

  FAfterDataChange(Self, Value);
end;

procedure TATMultiDataAction._BeforeDataChange(
  const OldValue: Variant; const NewValue: Variant);
begin
  if (NOT Assigned(FBeforeDataChange)) then
    Exit;

  FBeforeDataChange(Self, OldValue, NewValue);
end;

{ TATStrDataAction }

constructor TATStrDataAction.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  FData := EmptyStr;
end;

procedure TATStrDataAction.SetData(Value: String);
begin
  _BeforeDataChange(FData, Value);
  FData := Value;
  _AfterDataChange(FData);
end;

procedure TATStrDataAction._AfterDataChange(const Value: String);
begin
  if (NOT Assigned(FAfterDataChange)) then
    Exit;

  FAfterDataChange(Self, Value);
end;

procedure TATStrDataAction._BeforeDataChange(const OldValue,
  NewValue: String);
begin
  if (NOT Assigned(FBeforeDataChange)) then
    Exit;

  FBeforeDataChange(Self, OldValue, NewValue);
end;



end.
