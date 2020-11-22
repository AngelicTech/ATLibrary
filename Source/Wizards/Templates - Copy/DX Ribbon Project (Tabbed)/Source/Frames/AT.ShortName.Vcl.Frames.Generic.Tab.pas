unit AT.ShortName.Vcl.Frames.Generic.Tab;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  AT.ShortName.Vcl.Frames.Generic.Base, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light,
  dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue,
  cxClasses, AT.ShortName.Intf, Vcl.StdCtrls, AT.ShortName.Attribs;

type
  TfraGenericTab = class(TfraGenericBase, IATTabFrameNonClosing)
  strict protected
    function GetIsNonClosing: Boolean;
  public
    function CloseQuery: Boolean; override;
    property IsNonClosing: Boolean read GetIsNonClosing;
  end;

var
  fraGenericTab: TfraGenericTab;

implementation

uses
  System.Rtti, AT.ShortName.DM.Services.Application,
  AT.GarbageCollector;

{$R *.dfm}

function TfraGenericTab.CloseQuery: Boolean;
var
  AIntf: IATMainCloseQuery;
begin
  if (NOT IsNonClosing) then
    Exit(True);

  if (NOT AppServices.MainFormSupports(IATMainCloseQuery, AIntf)) then
    Exit(True);

  Result := (AIntf.WantsToClose OR AIntf.IsClosing);
end;

function TfraGenericTab.GetIsNonClosing: Boolean;
var
  AGC: IATGarbageCollector;
  AContext: TRttiContext;
  AType: TRttiType;
  AAttr: TCustomAttribute;
  ANCAttr: ATNonClosingFormAttribute;
begin
  AContext := TRttiContext.Create;

  TATGC.Cleanup(procedure
    begin
      AContext.Free;
    end, AGC);

  AType := AContext.GetType(Self.ClassType);

  Result := False;
  ANCAttr := NIL;

  for AAttr in AType.GetAttributes do
    begin
      Result := (AAttr IS ATNonClosingFormAttribute);

      if (Result) then
        begin
          ANCAttr := (AAttr AS ATNonClosingFormAttribute);
          Break;
        end;
    end;

  if ( Result AND (Assigned(ANCAttr)) ) then
    Result := ANCAttr.Value;
end;

end.
