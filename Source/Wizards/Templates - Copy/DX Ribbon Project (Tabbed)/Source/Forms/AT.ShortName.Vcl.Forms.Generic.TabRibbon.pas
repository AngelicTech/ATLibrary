unit AT.ShortName.Vcl.Forms.Generic.TabRibbon;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  AT.ShortName.Vcl.Forms.Generic.TabForm, Vcl.StdCtrls, Vcl.ExtCtrls,
  AT.ShortName.Intf, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxRibbonSkins, dxSkinsCore, dxSkinBlueprint,
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
  dxSkinsdxRibbonPainter, dxRibbonCustomizationForm,
  dxSkinscxPCPainter, dxSkinsdxBarPainter, dxBar, cxClasses, dxRibbon,
  cxCheckBox, cxBarEditItem, AT.ShortName.Attribs;

type
  TfrmTabRibbonForm = class(TfrmGenericTabForm, IATTabFormRibbon,
      IATFormActivate, IATFormDeactivate)
    ribChild: TdxRibbon;
    ribtabHome: TdxRibbonTab;
    barmgrChild: TdxBarManager;
    barQAT: TdxBar;
    barTAT: TdxBar;
  strict private
    FActiveRibbonTabIndex: Integer;
  strict protected
    procedure ActivateForm;
    procedure DeactivateForm;
    function GetActiveRibbonTabIndex: Integer;
    function GetRibbon: TdxRibbon;
    procedure MergeToRibbon(ARibbon: TdxRibbon);
    procedure SetActiveRibbonTabIndex(Value: Integer);
    procedure UnmergeFromRibbon(ARibbon: TdxRibbon);
    procedure _MergeChildRibbonWithMainRibbon;
    procedure _UnmergeChildRibbonFromMainRibbon;
  public
    constructor Create(AOwner: TComponent); override;
    property ActiveRibbonTabIndex: Integer read GetActiveRibbonTabIndex
        write SetActiveRibbonTabIndex;
    property Ribbon: TdxRibbon read GetRibbon;
  end;

var
  frmTabRibbonForm: TfrmTabRibbonForm;

implementation

{$R *.dfm}

uses AT.ShortName.DM.Actions, AT.ShortName.DM.Services.Application;

constructor TfrmTabRibbonForm.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  FActiveRibbonTabIndex := 0;
end;

procedure TfrmTabRibbonForm.ActivateForm;
begin
  _MergeChildRibbonWithMainRibbon;

  Actions.UpdateAllActions;
end;

procedure TfrmTabRibbonForm.DeactivateForm;
begin
  _UnmergeChildRibbonFromMainRibbon;
end;

function TfrmTabRibbonForm.GetActiveRibbonTabIndex: Integer;
begin
  Result := FActiveRibbonTabIndex;
end;

function TfrmTabRibbonForm.GetRibbon: TdxRibbon;
begin
  Result := ribChild;
end;

procedure TfrmTabRibbonForm.MergeToRibbon(ARibbon: TdxRibbon);
var
  AIntf: IATMainRibbonMerge;
begin
  if (NOT Assigned(ARibbon)) then
    Exit;

  if (AppServices.MainFormSupports(IATMainRibbonMerge, AIntf)) then
    AIntf.BeforeRibbonMerge;

  ARibbon.Merge(Ribbon,
      [rmoCanCreateNewTab,
       rmoCanCreateNewGroup,
       rmoCanCreateQATToolbar,
       rmoCanCreateTabAreaToolbar]);

  if (Assigned(AIntf)) then
    AIntf.AfterRibbonMerge;
end;

procedure TfrmTabRibbonForm.SetActiveRibbonTabIndex(Value: Integer);
begin
  FActiveRibbonTabIndex := Value;
end;

procedure TfrmTabRibbonForm.UnmergeFromRibbon(ARibbon: TdxRibbon);
var
  AIntf: IATMainRibbonMerge;
begin
  if (NOT Assigned(ARibbon)) then
    Exit;

  if (AppServices.MainFormSupports(IATMainRibbonMerge, AIntf)) then
    AIntf.BeforeRibbonUnmerge;

  ARibbon.Unmerge(Ribbon);

  if (Assigned(AIntf)) then
    AIntf.AfterRibbonUnmerge;
end;

procedure TfrmTabRibbonForm._MergeChildRibbonWithMainRibbon;
var
  AIntf: IATMainRibbon;
begin
  if (NOT AppServices.MainFormSupports(IATMainRibbon, AIntf)) then
    Exit;

  MergeToRibbon(AIntf.Ribbon);

  AIntf.ActiveRibbonTabIndex := ActiveRibbonTabIndex;
end;

procedure TfrmTabRibbonForm._UnmergeChildRibbonFromMainRibbon;
var
  AQry: IATMainRibbonQuery;
  AIntf: IATMainRibbon;
begin
  if (AppServices.MainFormSupports(IATMainRibbonQuery, AQry)) then
    ActiveRibbonTabIndex := AQry.ActiveRibbonTabIndex;

  if (NOT AppServices.MainFormSupports(IATMainRibbon, AIntf)) then
    Exit;

  UnmergeFromRibbon(AIntf.Ribbon);
end;

end.
