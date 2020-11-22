unit AT.ShortName.DX.TabFrameChild;

interface

uses
  AT.ShortName.Intf, cxPC, Vcl.Forms, System.Classes, Vcl.Controls;

type
  TATdxTabFrameChild = class(TcxTabSheet, IATTabFrameChildUI,
      IATFrameCaptionChanged)
  strict private
    FFrame: TCustomFrame;
    FLinkForm: TCustomForm;
  strict protected
    function GetText: TCaption;
    function GetFrame: TCustomFrame;
    function GetNonClosing: Boolean;
    procedure SetText(const Value: TCaption);
    procedure _SetFrameAndProperties(AFrame: TCustomFrame; ALinkForm:
        TCustomForm; ANonClosing: Boolean);
  public
    constructor Create(AOwner: TComponent; AFrame: TCustomFrame;
        ALinkForm: TCustomForm = NIL; ANonClosing: Boolean = False);
        reintroduce; overload; virtual;
    constructor Create(AOwner: TComponent; AFrameClass:
        TCustomFrameClass; ALinkForm: TCustomForm = NIL; ANonClosing:
        Boolean = False); reintroduce; overload; virtual;
    procedure FrameCaptionChanged(const AValue: String);
    property Caption read GetText write SetText;
    property Frame: TCustomFrame read GetFrame;
    property NonClosing: Boolean read GetNonClosing;
  end;




implementation

uses
  System.SysUtils;


constructor TATdxTabFrameChild.Create(AOwner: TComponent; AFrame:
    TCustomFrame; ALinkForm: TCustomForm = NIL; ANonClosing: Boolean
    = False);
begin
  inherited Create(AOwner);

  _SetFrameAndProperties(AFrame, ALinkForm, ANonClosing);
end;

constructor TATdxTabFrameChild.Create(AOwner: TComponent; AFrameClass:
    TCustomFrameClass; ALinkForm: TCustomForm = NIL; ANonClosing:
    Boolean = False);
begin
  inherited Create(AOwner);

  _SetFrameAndProperties(AFrameClass.Create(Self), ALinKForm,
      ANonClosing);
end;

procedure TATdxTabFrameChild.FrameCaptionChanged(const AValue: String);
begin
  Caption := AValue;
end;

function TATdxTabFrameChild.GetText: TCaption;
var
  Len: Integer;
begin
  Len := GetTextLen;
  SetString(Result, PChar(nil), Len);
  if Len <> 0 then
    begin
      Len := Len - GetTextBuf(PChar(Result), Len + 1);
      if Len > 0 then
        SetLength(Result, Length(Result) - Len);
    end;
end;

function TATdxTabFrameChild.GetFrame: TCustomFrame;
begin
  Result := FFrame;
end;

function TATdxTabFrameChild.GetNonClosing: Boolean;
var
  AIntf: IATTabFrameNonClosing;
begin
  if (Assigned(Frame)) then
    begin
      Result := (Supports(Frame, IATTabFrameNonClosing, AIntf));

      if (Result) then
        Result := AIntf.IsNonClosing;
    end
  else
    Result := False;
end;

procedure TATdxTabFrameChild.SetText(const Value: TCaption);
var
  AIntf: IATTabCaptionChanged;
begin
  if (GetText <> Value) then
    SetTextBuf(PChar(Value));

  if (Supports(FLinkForm, IATTabCaptionChanged, AIntf)) then
    AIntf.TabCaptionChanged(Value);
end;

procedure TATdxTabFrameChild._SetFrameAndProperties(AFrame: TCustomFrame;
    ALinkForm: TCustomForm; ANonClosing: Boolean);
var
  ANCIntf: IATTabFrameNonClosing;
  ACapIntf: IATFrameCaption;
begin
  FLinkForm := ALinkForm;

  FFrame := AFrame;

  if (Assigned(FFrame)) then
    begin
      if (Supports(FFrame, IATTabFrameNonClosing, ANCIntf)) then
        AllowCloseButton := (NOT ANCIntf.IsNonClosing);

      FFrame.Name := EmptyStr;
      FFrame.Parent := Self;
      FFrame.Align := alClient;
      FFrame.AlignWithMargins := True;
      FFrame.Margins.Left := 8;
      FFrame.Margins.Top := 8;
      FFrame.Margins.Right := 8;
      FFrame.Margins.Bottom := 8;
      FFrame.Show;

      if (Supports(FFrame, IATFrameCaption, ACapIntf)) then
        Caption := ACapIntf.Caption
      else
        Caption := 'New Child Tab';
    end
  else
    begin
      Caption := 'New Child Tab';
    end;
end;

end.
