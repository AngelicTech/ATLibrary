unit AT.ShortName.DX.TabFormChild;

interface

uses
  AT.ShortName.Intf, cxPC, Vcl.Forms, System.Classes, Vcl.Controls,
  Vcl.ExtCtrls, AT.ShortName.Vcl.Forms.Generic.TabForm;

type
  TATdxTabFormChild = class(TcxTabSheet, IATTabFormChildUI,
      IATFormCaptionChanged)
  strict private
    FForm: TfrmGenericTabForm;
    FFormWasCreated: Boolean;
    FLinkForm: TCustomForm;
    FPanel: TPanel;
  strict protected
    procedure FormCaptionChanged(const AValue: String);
    function GetForm: TfrmGenericTabForm;
    function GetText: TCaption;
    function GetNonClosing: Boolean;
    procedure SetText(const Value: TCaption);
    procedure _SetFormAndProperties(AForm: TfrmGenericTabForm;
        ALinkForm: TCustomForm);
  public
    constructor Create(AOwner: TComponent; AForm: TfrmGenericTabForm;
        ALinkForm: TCustomForm = NIL); reintroduce; overload; virtual;
    constructor Create(AOwner: TComponent; AFormClass:
        TfrmGenericTabFormClass; ALinkForm: TCustomForm = NIL);
        reintroduce; overload; virtual;
    destructor Destroy; override;
    property Caption read GetText write SetText;
    property Form: TfrmGenericTabForm read GetForm;
    property NonClosing: Boolean read GetNonClosing;
  end;




implementation

uses
  System.SysUtils, Winapi.Windows;


constructor TATdxTabFormChild.Create(AOwner: TComponent; AForm:
    TfrmGenericTabForm; ALinkForm: TCustomForm = NIL);
begin
  inherited Create(AOwner);

  FFormWasCreated := False;

  _SetFormAndProperties(AForm, ALinkForm);
end;

constructor TATdxTabFormChild.Create(AOwner: TComponent; AFormClass:
    TfrmGenericTabFormClass; ALinkForm: TCustomForm = NIL);
var
  AFrm: TfrmGenericTabForm;
begin
  inherited Create(AOwner);

  AFrm := AFormClass.Create(Self);
  _SetFormAndProperties(AFrm, ALinkForm);

  FFormWasCreated := True;
end;

destructor TATdxTabFormChild.Destroy;
begin
  if (Assigned(FForm)) then
    begin
      if (Assigned(FPanel)) then
        begin
          FPanel.Parent := FForm;
          FPanel := NIL;
        end;

      if (FFormWasCreated) then
        begin
          FForm.Release;
        end;

      FForm := NIL;
    end;

  inherited Destroy;
end;

procedure TATdxTabFormChild.FormCaptionChanged(const AValue: String);
begin
  Caption := AValue;
end;

function TATdxTabFormChild.GetForm: TfrmGenericTabForm;
begin
  Result := FForm;
end;

function TATdxTabFormChild.GetText: TCaption;
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

function TATdxTabFormChild.GetNonClosing: Boolean;
begin
  if (Assigned(Form)) then
    Result := Form.IsNonClosing
  else
    Result := False;
end;

procedure TATdxTabFormChild.SetText(const Value: TCaption);
var
  AIntf: IATTabCaptionChanged;
begin
  if (GetText <> Value) then
    SetTextBuf(PChar(Value));

  if (Supports(FLinkForm, IATTabCaptionChanged, AIntf)) then
    AIntf.TabCaptionChanged(Value);
end;

procedure TATdxTabFormChild._SetFormAndProperties(AForm:
    TfrmGenericTabForm; ALinkForm: TCustomForm);
var
  AIdxIntf: IATTabImageIndex;
begin
  FLinkForm := ALinkForm;

  FForm := AForm;


  if (Assigned(FForm)) then
    begin
      AllowCloseButton := (NOT FForm.IsNonClosing);

      if (Supports(FForm, IATTabImageIndex, AIdxIntf)) then
        ImageIndex := AIdxIntf.TabImageIndex
      else
        ImageIndex := 0;

      FForm.Visible := False;
      Caption := FForm.Caption;

      FPanel := FForm.Contents;
      FPanel.Parent := Self;
    end
  else
    begin
      Caption := 'New Child Tab';
    end;
end;

end.
