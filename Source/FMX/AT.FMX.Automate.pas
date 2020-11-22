unit AT.FMX.Automate;

interface

uses
  System.Classes,
  Vcl.Controls;

type
  TATAutoUpdate = record
  private
    FControl: TControl;
  public
    constructor Create(const AControl: TControl);
  public
    class operator Initialize(out ADest: TATAutoUpdate);
    class operator Finalize(var ADest: TATAutoUpdate);
    class operator Assign(var ADest: TATAutoUpdate;
      const [ref] ASrc: TATAutoUpdate);
  end;

implementation

uses
  System.Rtti,
  AT.Rtti;

constructor TATAutoUpdate.Create(const AControl: TControl);
var
  AResult: TValue;
begin
  Assert(Assigned(AControl));
  FControl := AControl;

  AT.Rtti.ExecuteMethod(FControl, 'BeginUpdate', [], AResult);
//  FControl.BeginUpdate;
end;

class operator TATAutoUpdate.Initialize(out ADest: TATAutoUpdate);
begin
  ADest.FControl := nil;
end;

class operator TATAutoUpdate.Finalize(var ADest: TATAutoUpdate);
var
  AResult: TValue;
begin
  if (NOT Assigned(ADest.FControl)) then
    exit;

  AT.Rtti.ExecuteMethod(ADest.FControl, 'EndUpdate', [], AResult);
//  ADest.FControl.EndUpdate;
end;

class operator TATAutoUpdate.Assign(var ADest: TATAutoUpdate;
  const [ref] ASrc: TATAutoUpdate);
begin
  raise EInvalidOperation.Create(
    'TAutoUpdate records cannot be copied')
end;
end.
