unit at.ShortName.Vcl.Forms.Generic.TabForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmGenericTabForm = class(TForm)
    pnlContents: TPanel;
  strict protected
    property Align;
    property AlignWithMargins;
    property BorderIcons;
    property BorderStyle;
    property FormStyle;
    property GlassFrame;
    property Margins;
    property OnActivate;
    property OnDeactivate;
    property WindowState;
  strict protected
    function GetContents: TPanel;
    function GetText: TCaption;
    /// <summary>
    ///   IsNonClosing property getter.
    /// </summary>
    function GetIsNonClosing: Boolean;
    procedure SetText(const Value: TCaption);
    procedure _InitControls;
    procedure _InitFields;
    procedure _InitLiveBindings;
    procedure _LoadFormState;
    procedure _NotifyVM;
    procedure _SaveFormState;
    procedure _SetFormCaption;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function CloseQuery: Boolean; override;
    property Caption read GetText write SetText;
    property Contents: TPanel read GetContents;
    property IsNonClosing: Boolean read GetIsNonClosing;
  end;

  TfrmGenericTabFormClass = class of TfrmGenericTabForm;

var
  frmGenericTabForm: TfrmGenericTabForm;

implementation

uses
  AT.GarbageCollector, System.Rtti, AT.ShortName.Attribs,
  AT.ShortName.DM.Services.Application, AT.ShortName.Intf;

{$R *.dfm}

constructor TfrmGenericTabForm.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  inherited WindowState := wsNormal;
  inherited BorderIcons := [];
  inherited BorderStyle := bsNone;
  inherited FormStyle := fsNormal;
  inherited GlassFrame.Enabled := False;

  _SetFormCaption;
  _LoadFormState;
  _InitFields;
  _InitControls;
  _InitLiveBindings;
  _NotifyVM;
end;

destructor TfrmGenericTabForm.Destroy;
begin
  _SaveFormState;

  inherited Destroy;
end;

function TfrmGenericTabForm.CloseQuery: Boolean;
var
  AIntf: IATMainCloseQuery;
begin
  Result := inherited CloseQuery;

  if (NOT IsNonClosing) then
    Exit;

  if (NOT AppServices.MainFormSupports(IATMainCloseQuery, AIntf)) then
    Exit;

  Result := ( (AIntf.WantsToClose OR AIntf.IsClosing) AND Result );
end;

function TfrmGenericTabForm.GetContents: TPanel;
begin
  Result := pnlContents;
end;

function TfrmGenericTabForm.GetIsNonClosing: Boolean;
var
  AGC: IATGarbageCollector;
  AContext: TRttiContext;
  AType: TRttiType;
  AAttr: TCustomAttribute;
  ANCAttr: ATNonClosingFormAttribute;
begin
  AContext := TRttiContext.Create;

  TATGC.Cleanup(
    procedure
    begin
      AContext.Free;
    end, AGC);

  AType := AContext.GetType(Self.ClassType);

  Result := False;
  ANCAttr := NIL;

  for AAttr in AType.GetAttributes do
  begin
    Result := (AAttr is ATNonClosingFormAttribute);

    if (Result) then
    begin
      ANCAttr := (AAttr as ATNonClosingFormAttribute);
      Break;
    end;
  end;

  if (Result and (Assigned(ANCAttr))) then
    Result := ANCAttr.Value;
end;

function TfrmGenericTabForm.GetText: TCaption;
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

procedure TfrmGenericTabForm.SetText(const Value: TCaption);
var
  AIntf: IATFormCaptionChanged;
begin
  if (GetText <> Value) then
    SetTextBuf(PChar(Value));

  if (Supports(Parent, IATFormCaptionChanged, AIntf)) then
    AIntf.FormCaptionChanged(Value)
  else if (Supports(Owner, IATFormCaptionChanged, AIntf)) then
    AIntf.FormCaptionChanged(Value);
end;

procedure TfrmGenericTabForm._InitControls;
var
  AIntf: IATInitControls;
begin
  if (not Supports(Self, IATInitControls, AIntf)) then
    Exit;

  AIntf.InitControls;
end;

procedure TfrmGenericTabForm._InitFields;
var
  AIntf: IATInitFields;
begin
  if (not Supports(Self, IATInitFields, AIntf)) then
    Exit;

  AIntf.InitFields;
end;

procedure TfrmGenericTabForm._InitLiveBindings;
var
  AIntf: IATLiveBindings;
begin
  if (not Supports(Self, IATLiveBindings, AIntf)) then
    Exit;

  AIntf.InitLiveBindings;
end;

procedure TfrmGenericTabForm._LoadFormState;
var
  AIntf: IATPersistentForm;
begin
  if (not Supports(Self, IATPersistentForm, AIntf)) then
    Exit;

  AIntf.LoadFormState;
end;

procedure TfrmGenericTabForm._NotifyVM;
var
  AIntf: IATLiveBindings;
begin
  if (not Supports(Self, IATLiveBindings)) then
    Exit;

  AIntf.NotifyVM;
end;

procedure TfrmGenericTabForm._SaveFormState;
var
  AIntf: IATPersistentForm;
begin
  if (not Supports(Self, IATPersistentForm, AIntf)) then
    Exit;

  AIntf.SaveFormState;
end;

procedure TfrmGenericTabForm._SetFormCaption;
var
  AIntf: IATInitFormCaption;
begin
  if (not Supports(Self, IATInitFormCaption, AIntf)) then
    Exit;

  AIntf.SetFormCaption;
end;

end.

