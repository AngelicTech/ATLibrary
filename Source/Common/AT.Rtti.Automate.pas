unit AT.Rtti.Automate;

interface

uses
  System.Classes, System.SysUtils, System.Rtti;

type
  TATRttiAutoFreeCtx = record
  private
    FContext: TRttiContext;
  public
    constructor Create(var AContext: TRttiContext);
    class operator Initialize(out ADest: TATRttiAutoFreeCtx);
    class operator Finalize(var ADest: TATRttiAutoFreeCtx);
    class operator Assign(var ADest: TATRttiAutoFreeCtx;
      const [ref] ASrc: TATRttiAutoFreeCtx);
  end;

implementation

constructor TATRttiAutoFreeCtx.Create(var AContext: TRttiContext);
begin
  FContext := AContext;
end;

class operator TATRttiAutoFreeCtx.Initialize(out ADest: TATRttiAutoFreeCtx);
begin
  FillChar(ADest.FContext, SizeOf(TRttiContext), 0);// := nil;
end;

class operator TATRttiAutoFreeCtx.Finalize(var ADest: TATRttiAutoFreeCtx);
begin
  ADest.FContext.Free;
end;

class operator TATRttiAutoFreeCtx.Assign(var ADest: TATRttiAutoFreeCtx;
  const [ref] ASrc: TATRttiAutoFreeCtx);
begin
  raise EInvalidOperation.Create(
    'TATRttiAutoFreeCtx records cannot be copied')
end;

end.
