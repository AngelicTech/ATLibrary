unit AT.Windows.DragDrop;

interface

uses
  Winapi.ShellAPI,
  System.Types;

type
  TATDropFiles = class
  strict private
    FDropHandle: HDROP;
  strict protected
    function GetCount: Integer;
    function GetDropHandle: HDROP;
    function GetDropPoint: TPoint;
    function GetFiles(Index: Integer): string;
  public
    constructor Create(ADropHandle: HDROP);
    destructor Destroy; override;
    property Count: Integer read GetCount;
    property DropHandle: HDROP read GetDropHandle;
    property DropPoint: TPoint read GetDropPoint;
    property Files[Index: Integer]: string read GetFiles; default;
  end;

implementation

constructor TATDropFiles.Create(ADropHandle: HDROP);
begin

  inherited Create;

  FDropHandle := ADropHandle;

end;

destructor TATDropFiles.Destroy;
begin

  DragFinish(FDropHandle);

  inherited Destroy;

end;

function TATDropFiles.GetCount: Integer;
begin

  Result := DragQueryFile(FDropHandle, $FFFFFFFF, NIL, 0);

end;

function TATDropFiles.GetDropHandle: HDROP;
begin

  Result := FDropHandle;

end;

function TATDropFiles.GetDropPoint: TPoint;
begin

  DragQueryPoint(FDropHandle, Result);

end;

function TATDropFiles.GetFiles(Index: Integer): string;
var
  iSize: Integer;
begin

  iSize := DragQueryFile(FDropHandle, Index, NIL, 0);

  SetLength(Result, iSize);

  DragQueryFile(FDropHandle, Index, PChar(Result), iSize + 1);

end;

end.
