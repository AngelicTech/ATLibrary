unit AT.Automate;

interface

uses
  System.Classes, System.SysUtils, System.SyncObjs;

type
  TATAutoCleanupP = record
  private
    FProc: TProc;
  public
    constructor Create(const AProc: TProc);
    class operator Initialize(out ADest: TATAutoCleanupP);
    class operator Finalize(var ADest: TATAutoCleanupP);
    class operator Assign(var ADest: TATAutoCleanupP;
      const [ref] ASrc: TATAutoCleanupP);
  end;

  TATAutoFree = record
  private
    FInstance: TObject;
  public
    constructor Create(const AInstance: TObject);
    class operator Initialize(out ADest: TATAutoFree);
    class operator Finalize(var ADest: TATAutoFree);
    class operator Assign(var ADest: TATAutoFree;
      const [ref] ASrc: TATAutoFree);
  end;

  TATAutoLock = record
  private
    FSyncObj: TSynchroObject;
  public
    constructor Create(const ASyncObj: TSynchroObject);
  public
    class operator Initialize(out ADest: TATAutoLock);
    class operator Finalize(var ADest: TATAutoLock);
    class operator Assign(var ADest: TATAutoLock;
      const [ref] ASrc: TATAutoLock);
  end;

implementation

constructor TATAutoCleanupP.Create(const AProc: TProc);
begin
  Assert(Assigned(AProc));
  FProc := AProc;
end;

class operator TATAutoCleanupP.Initialize(out ADest: TATAutoCleanupP);
begin
  ADest.FProc := nil;
end;

class operator TATAutoCleanupP.Finalize(var ADest: TATAutoCleanupP);
begin
  ADest.FProc();
end;

class operator TATAutoCleanupP.Assign(var ADest: TATAutoCleanupP;
  const [ref] ASrc: TATAutoCleanupP);
begin
  raise EInvalidOperation.Create(
    'TATAutoCleanupP records cannot be copied')
end;

constructor TATAutoFree.Create(const AInstance: TObject);
begin
  Assert(Assigned(AInstance));
  FInstance := AInstance;
end;

class operator TATAutoFree.Initialize(out ADest: TATAutoFree);
begin
  ADest.FInstance := nil;
end;

class operator TATAutoFree.Finalize(var ADest: TATAutoFree);
begin
  ADest.FInstance.Free;
end;

class operator TATAutoFree.Assign(var ADest: TATAutoFree;
  const [ref] ASrc: TATAutoFree);
begin
  raise EInvalidOperation.Create(
    'TATAutoFree records cannot be copied')
end;

constructor TATAutoLock.Create(const ASyncObj: TSynchroObject);
begin
  Assert(Assigned(ASyncObj));
  FSyncObj := ASyncObj;
  FSyncObj.Acquire;
end;

class operator TATAutoLock.Initialize(out ADest: TATAutoLock);
begin
  ADest.FSyncObj := nil;
end;

class operator TATAutoLock.Finalize(var ADest: TATAutoLock);
begin
  if (ADest.FSyncObj <> nil) then
    ADest.FSyncObj.Release;
end;

class operator TATAutoLock.Assign(var ADest: TATAutoLock;
  const [ref] ASrc: TATAutoLock);
begin
  raise EInvalidOperation.Create(
    'TATAutoLock records cannot be copied');
end;

end.
