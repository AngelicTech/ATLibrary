unit AT.ShortName.Vcl.Frames.Generic.Base;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  dxSkinsCore, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans,
  dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinPumpkin,
  dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, cxClasses, AT.ShortName.Intf;

type
  TfraGenericBase = class(TFrame, IATFrameCaption,
      IATTabFrameCloseQuery)
  strict private
    FCaption: String;
  strict protected
    function GetCaption: String;
    procedure SetCaption(const Value: String);
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
    function CloseQuery: Boolean; virtual;
    property Caption: String read GetCaption write SetCaption;
  end;

implementation

{$R *.dfm}

constructor TfraGenericBase.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  Caption := 'New Frame';

  _LoadFormState;
  _InitFields;
  _InitControls;
  _InitLiveBindings;
  _NotifyVM;
end;

destructor TfraGenericBase.Destroy;
begin
  _SaveFormState;

  inherited Destroy;
end;

function TfraGenericBase.CloseQuery: Boolean;
begin
  Result := True;
end;

function TfraGenericBase.GetCaption: String;
begin
  Result := FCaption;
end;

procedure TfraGenericBase.SetCaption(const Value: String);
var
  AIntf: IATFrameCaptionChanged;
begin
  FCaption := Value;

  if (Supports(Parent, IATFrameCaptionChanged, AIntf)) then
    AIntf.FrameCaptionChanged(Value)
  else if (Supports(Owner, IATFrameCaptionChanged, AIntf)) then
    AIntf.FrameCaptionChanged(Value);
end;


procedure TfraGenericBase._InitControls;
var
  AIntf: IATInitControls;
begin
  if (NOT Supports(Self, IATInitControls, AIntf)) then
    Exit;

  AIntf.InitControls;
end;

procedure TfraGenericBase._InitFields;
var
  AIntf: IATInitFields;
begin
  if (NOT Supports(Self, IATInitFields, AIntf)) then
    Exit;

  AIntf.InitFields;
end;

procedure TfraGenericBase._InitLiveBindings;
var
  AIntf: IATLiveBindings;
begin
  if (NOT Supports(Self, IATLiveBindings, AIntf)) then
    Exit;

  AIntf.InitLiveBindings;
end;

procedure TfraGenericBase._LoadFormState;
var
  AIntf: IATPersistentForm;
begin
  if (NOT Supports(Self, IATPersistentForm, AIntf)) then
    Exit;

  AIntf.LoadFormState;
end;

procedure TfraGenericBase._NotifyVM;
var
  AIntf: IATLiveBindings;
begin
  if (NOT Supports(Self, IATLiveBindings, AIntf)) then
    Exit;

  AIntf.NotifyVM;
end;

procedure TfraGenericBase._SaveFormState;
var
  AIntf: IATPersistentForm;
begin
  if (NOT Supports(Self, IATPersistentForm, AIntf)) then
    Exit;

  AIntf.SaveFormState;
end;

procedure TfraGenericBase._SetFormCaption;
var
  AIntf: IATInitFormCaption;
begin
  if (not Supports(Self, IATInitFormCaption, AIntf)) then
    Exit;

  AIntf.SetFormCaption;
end;

end.
