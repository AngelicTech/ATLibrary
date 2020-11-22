unit AT.DX.Ribbon;

interface

uses
  dxRibbon;

type
  TATdxRibbonHeightEvent = procedure (Sender: TdxCustomRibbon) of object;

  TATdxRibbon = class(TdxRibbon)
  strict private
    FOnRibbonHeightChanged: TATdxRibbonHeightEvent;
  strict protected
    procedure DoRibbonHeightChangedEvent(Sender: TdxCustomRibbon); virtual;
  protected
    procedure UpdateHeight; override;
  published
    property OnRibbonHeightChanged: TATdxRibbonHeightEvent read
        FOnRibbonHeightChanged write FOnRibbonHeightChanged;
  end;

implementation

procedure TATdxRibbon.DoRibbonHeightChangedEvent(Sender: TdxCustomRibbon);
begin
  if (Assigned(FOnRibbonHeightChanged)) then
    FOnRibbonHeightChanged(Sender);
end;

procedure TATdxRibbon.UpdateHeight;
begin
  inherited;

  DoRibbonHeightChangedEvent(Self);
end;

end.
