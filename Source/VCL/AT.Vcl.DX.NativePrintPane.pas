unit AT.Vcl.DX.NativePrintPane;

interface

uses
  Winapi.ShlObj,
  System.Classes, System.UITypes, System.SysUtils,
  Vcl.Controls, Vcl.ImgList,
  cxControls, dxShellBreadcrumbEdit, dxLayoutLookAndFeels,
  cxShellListView, cxShellTreeView, cxShellControls, dxRibbon,
  dxRichEdit.Control, dxPSCore, AT.Vcl.DX.NativePrintPane.Frame;

type
  [ComponentPlatformsAttribute(pidWin32 OR pidWin64)]
  TATdxNativePrintPane = class(TcxControl)
  strict private
    FFrame: TATdxNativePrintPaneFrame;
    function _IsAllPagesCaptionStored: Boolean;
    function _IsCollateCaptionStored: Boolean;
    function _IsCopiesCaptionStored: Boolean;
    function _IsCustomPageCaptionStored: Boolean;
    function _IsDesignReportCaptionStored: Boolean;
    function _IsLandscapeCaptionStored: Boolean;
    function _IsOrientAutoCaptionStored: Boolean;
    function _IsPagesCaptionStored: Boolean;
    function _IsPageSetupCaptionStored: Boolean;
    function _IsPortraitCaptionStored: Boolean;
    function _IsPrintButtonCaptionStored: Boolean;
    function _IsPrinterCaptionStored: Boolean;
    function _IsPrinterPropertiesCaptionStored: Boolean;
    function _IsRebuildReportCaptionStored: Boolean;
    function _IsSettingsCaptionStored: Boolean;
    function _IsSinglePageCaptionStored: Boolean;
    function _IsUncollateCaptionStored: Boolean;
  strict protected
    function GetAllPagesCaption: String;
    function GetAllPagesImageIndex: System.UITypes.TImageIndex;
    function GetCollateCaption: String;
    function GetCollateImageIndex: System.UITypes.TImageIndex;
    function GetComponentPrinter: TCustomdxComponentPrinter;
    function GetCopiesCaption: String;
    function GetCustomPageCaption: String;
    function GetCustomPageImageIndex: System.UITypes.TImageIndex;
    function GetDesignReportCaption: String;
    function GetDesignReportImageIndex: System.UITypes.TImageIndex;
    function GetEnableDesigner: Boolean;
    function GetImages: TCustomImageList;
    function GetLandscapeCaption: String;
    function GetLargeImages: TCustomImageList;
    function GetLayoutLookAndFeel: TdxCustomLayoutLookAndFeel;
    function GetOrientAutoCaption: String;
    function GetOrientAutoImageIndex: System.UITypes.TImageIndex;
    function GetOrientLandscapeImageIndex: System.UITypes.TImageIndex;
    function GetOrientPortraitImageIndex: System.UITypes.TImageIndex;
    function GetPagesCaption: String;
    function GetPageSetupCaption: String;
    function GetPageSizeImageIndex: System.UITypes.TImageIndex;
    function GetPortraitCaption: String;
    function GetPrintButtonCaption: String;
    function GetPrinterCaption: String;
    function GetPrinterPropertiesCaption: String;
    function GetPrinterSelectImageIndex: System.UITypes.TImageIndex;
    function GetPrintImageIndex: System.UITypes.TImageIndex;
    function GetRebuildReportCaption: String;
    function GetRebuildReportImageIndex: System.UITypes.TImageIndex;
    function GetRibbon: TdxRibbon;
    function GetRichEdit: TdxRichEditControl;
    function GetSettingsCaption: String;
    function GetSinglePageCaption: String;
    function GetSinglePageImageIndex: System.UITypes.TImageIndex;
    function GetThumbnailPaneVisible: Boolean;
    function GetUncollateCaption: String;
    function GetUncollateImageIndex: System.UITypes.TImageIndex;
    procedure SetAllPagesCaption(const Value: String);
    procedure SetAllPagesImageIndex(const Value: System.UITypes.TImageIndex);
    procedure SetCollateCaption(const Value: String);
    procedure SetCollateImageIndex(const Value: System.UITypes.TImageIndex);
    procedure SetComponentPrinter(const Value: TCustomdxComponentPrinter);
    procedure SetCopiesCaption(const Value: String);
    procedure SetCustomPageCaption(const Value: String);
    procedure SetCustomPageImageIndex(const Value: System.UITypes.TImageIndex);
    procedure SetDesignReportCaption(const Value: String);
    procedure SetDesignReportImageIndex(const Value: System.UITypes.TImageIndex);
    procedure SetEnableDesigner(const Value: Boolean);
    procedure SetImages(const Value: TCustomImageList);
    procedure SetLandscapeCaption(const Value: String);
    procedure SetLargeImages(const Value: TCustomImageList);
    procedure SetLayoutLookAndFeel(const Value: TdxCustomLayoutLookAndFeel);
    procedure SetOrientAutoCaption(const Value: String);
    procedure SetOrientAutoImageIndex(const Value: System.UITypes.TImageIndex);
    procedure SetOrientLandscapeImageIndex(const Value: System.UITypes.TImageIndex);
    procedure SetOrientPortraitImageIndex(const Value: System.UITypes.TImageIndex);
    procedure SetPagesCaption(const Value: String);
    procedure SetPageSetupCaption(const Value: String);
    procedure SetPageSizeImageIndex(const Value: System.UITypes.TImageIndex);
    procedure SetPortraitCaption(const Value: String);
    procedure SetPrintButtonCaption(const Value: String);
    procedure SetPrinterCaption(const Value: String);
    procedure SetPrinterPropertiesCaption(const Value: String);
    procedure SetPrinterSelectImageIndex(const Value: System.UITypes.TImageIndex);
    procedure SetPrintImageIndex(const Value: System.UITypes.TImageIndex);
    procedure SetRebuildReportCaption(const Value: String);
    procedure SetRebuildReportImageIndex(const Value: System.UITypes.TImageIndex);
    procedure SetRibbon(const Value: TdxRibbon);
    procedure SetRichEdit(const Value: TdxRichEditControl);
    procedure SetSettingsCaption(const Value: String);
    procedure SetSinglePageCaption(const Value: String);
    procedure SetSinglePageImageIndex(const Value: System.UITypes.TImageIndex);
    procedure SetThumbnailPaneVisible(const Value: Boolean);
    procedure SetUncollateCaption(const Value: String);
    procedure SetUncollateImageIndex(const Value: System.UITypes.TImageIndex);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure DesignReport;
  published
    property Align;
    property AllPagesCaption: String
        read GetAllPagesCaption
        write SetAllPagesCaption
        stored _IsAllPagesCaptionStored;
    property AllPagesImageIndex: System.UITypes.TImageIndex
        read GetAllPagesImageIndex
        write SetAllPagesImageIndex
        default -1;
    property CollateCaption: String
        read GetCollateCaption
        write SetCollateCaption
        stored _IsCollateCaptionStored;
    property CollateImageIndex: System.UITypes.TImageIndex
        read GetCollateImageIndex
        write SetCollateImageIndex
        default -1;
    property ComponentPrinter: TCustomdxComponentPrinter
        read GetComponentPrinter
        write SetComponentPrinter;
    property CopiesCaption: String
        read GetCopiesCaption
        write SetCopiesCaption
        stored _IsCopiesCaptionStored;
    property CustomPageCaption: String
        read GetCustomPageCaption
        write SetCustomPageCaption
        stored _IsCustomPageCaptionStored;
    property CustomPageImageIndex: System.UITypes.TImageIndex
        read GetCustomPageImageIndex
        write SetCustomPageImageIndex
        default -1;
    property DesignReportCaption: String
        read GetDesignReportCaption
        write SetDesignReportCaption
        stored _IsDesignReportCaptionStored;
    property DesignReportImageIndex: System.UITypes.TImageIndex
        read GetDesignReportImageIndex
        write SetDesignReportImageIndex
        default -1;
    property EnableDesigner: Boolean
        read GetEnableDesigner
        write SetEnableDesigner
        default True;
    property Images: TCustomImageList
        read GetImages
        write SetImages;
    property LandscapeCaption: String
        read GetLandscapeCaption
        write SetLandscapeCaption
        stored _IsLandscapeCaptionStored;
    property LargeImages: TCustomImageList
        read GetLargeImages
        write SetLargeImages;
    property LayoutLookAndFeel: TdxCustomLayoutLookAndFeel
        read GetLayoutLookAndFeel
        write SetLayoutLookAndFeel;
    property OrientAutoCaption: String
        read GetOrientAutoCaption
        write SetOrientAutoCaption
        stored _IsOrientAutoCaptionStored;
    property OrientAutoImageIndex: System.UITypes.TImageIndex
        read GetOrientAutoImageIndex
        write SetOrientAutoImageIndex
        default -1;
    property OrientLandscapeImageIndex: System.UITypes.TImageIndex
        read GetOrientLandscapeImageIndex
        write SetOrientLandscapeImageIndex
        default -1;
    property OrientPortraitImageIndex: System.UITypes.TImageIndex
        read GetOrientPortraitImageIndex
        write SetOrientPortraitImageIndex
        default -1;
    property PagesCaption: String
        read GetPagesCaption
        write SetPagesCaption
        stored _IsPagesCaptionStored;
    property PageSetupCaption: String
        read GetPageSetupCaption
        write SetPageSetupCaption
        stored _IsPageSetupCaptionStored;
    property PageSizeImageIndex: System.UITypes.TImageIndex
        read GetPageSizeImageIndex
        write SetPageSizeImageIndex
        default -1;
    property PortraitCaption: String
        read GetPortraitCaption
        write SetPortraitCaption
        stored _IsPortraitCaptionStored;
    property PrintButtonCaption: String
        read GetPrintButtonCaption
        write SetPrintButtonCaption
        stored _IsPrintButtonCaptionStored;
    property PrinterCaption: String
        read GetPrinterCaption
        write SetPrinterCaption
        stored _IsPrinterCaptionStored;
    property PrinterPropertiesCaption: String
        read GetPrinterPropertiesCaption
        write SetPrinterPropertiesCaption
        stored _IsPrinterPropertiesCaptionStored;
    property PrinterSelectImageIndex: System.UITypes.TImageIndex
        read GetPrinterSelectImageIndex
        write SetPrinterSelectImageIndex
        default -1;
    property PrintImageIndex: System.UITypes.TImageIndex
        read GetPrintImageIndex
        write SetPrintImageIndex
        default -1;
    property RebuildReportCaption: String
        read GetRebuildReportCaption
        write SetRebuildReportCaption
        stored _IsRebuildReportCaptionStored;
    property RebuildReportImageIndex: System.UITypes.TImageIndex
        read GetRebuildReportImageIndex
        write SetRebuildReportImageIndex
        default -1;
    property Ribbon: TdxRibbon
        read GetRibbon
        write SetRibbon;
    property RichEdit: TdxRichEditControl
        read GetRichEdit
        write SetRichEdit;
    property SettingsCaption: String
        read GetSettingsCaption
        write SetSettingsCaption
        stored _IsSettingsCaptionStored;
    property SinglePageCaption: String
        read GetSinglePageCaption
        write SetSinglePageCaption
        stored _IsSinglePageCaptionStored;
    property SinglePageImageIndex: System.UITypes.TImageIndex
        read GetSinglePageImageIndex
        write SetSinglePageImageIndex
        default -1;
    property ThumbnailPaneVisible: Boolean
        read GetThumbnailPaneVisible
        write SetThumbnailPaneVisible
        default False;
    property UncollateCaption: String
        read GetUncollateCaption
        write SetUncollateCaption
        stored _IsUncollateCaptionStored;
    property UncollateImageIndex: System.UITypes.TImageIndex
        read GetUncollateImageIndex
        write SetUncollateImageIndex
        default -1;
  end;


implementation


constructor TATdxNativePrintPane.Create(AOwner: TComponent);
begin
  inherited;

  FFrame := TATdxNativePrintPaneFrame.Create(Self);

  FFrame.Parent := Self;

  FFrame.Align := alClient;
  FFrame.Visible := True;

  Ribbon := NIL;
  ComponentPrinter := NIL;

  AllPagesCaption := cAllPagesCaption;
  CollateCaption := cCollateCaption;
  CopiesCaption := cCopiesCaption;
  CustomPageCaption := cCustomPageCaption;
  DesignReportCaption := cDesignReportCaption;
  LandscapeCaption := cLandscapeCaption;
  OrientAutoCaption := cOrientAutoCaption;
  PagesCaption := cPagesCaption;
  PageSetupCaption := cPageSetupCaption;
  PortraitCaption := cPortraitCaption;
  PrintButtonCaption := cPrintButtonCaption;
  PrinterCaption := cPrinterCaption;
  PrinterPropertiesCaption := cPrinterPropertiesCaption;
  RebuildReportCaption := cRebuildReportCaption;
  SettingsCaption := cSettingsCaption;
  SinglePageCaption := cSinglePageCaption;
  UncollateCaption := cUncollateCaption;

  AllPagesImageIndex := -1;
  CollateImageIndex := -1;
  CustomPageImageIndex := -1;
  DesignReportImageIndex := -1;
  OrientAutoImageIndex := -1;
  OrientLandscapeImageIndex := -1;
  OrientPortraitImageIndex := -1;
  PageSizeImageIndex := -1;
  PrintImageIndex := -1;
  PrinterSelectImageIndex := -1;
  RebuildReportImageIndex := -1;
  SinglePageImageIndex := -1;
  UncollateImageIndex := -1;

  RichEdit := NIL;

  ThumbnailPaneVisible := False;

end;

destructor TATdxNativePrintPane.Destroy;
begin
  FreeAndNil(FFrame);

  inherited;
end;

procedure TATdxNativePrintPane.DesignReport;
begin
  FFrame.DesignReport;
end;

function TATdxNativePrintPane.GetAllPagesCaption: String;
begin
  Result := FFrame.AllPagesCaption;
end;

function TATdxNativePrintPane.GetAllPagesImageIndex: System.UITypes.TImageIndex;
begin
  Result := FFrame.AllPagesImageIndex;
end;

function TATdxNativePrintPane.GetCollateCaption: String;
begin
  Result := FFrame.CollateCaption;
end;

function TATdxNativePrintPane.GetCollateImageIndex: System.UITypes.TImageIndex;
begin
  Result := FFrame.CollateImageIndex;
end;

function TATdxNativePrintPane.GetComponentPrinter: TCustomdxComponentPrinter;
begin
  Result := FFrame.ComponentPrinter;
end;

function TATdxNativePrintPane.GetCopiesCaption: String;
begin
  Result := FFrame.CopiesCaption;
end;

function TATdxNativePrintPane.GetCustomPageCaption: String;
begin
  Result := FFrame.CustomPageCaption;
end;

function TATdxNativePrintPane.GetCustomPageImageIndex:
    System.UITypes.TImageIndex;
begin
  Result := FFrame.CustomPageImageIndex;
end;

function TATdxNativePrintPane.GetDesignReportCaption: String;
begin
  Result := FFrame.DesignReportCaption;
end;

function TATdxNativePrintPane.GetDesignReportImageIndex:
    System.UITypes.TImageIndex;
begin
  Result := FFrame.DesignReportImageIndex;
end;

function TATdxNativePrintPane.GetEnableDesigner: Boolean;
begin
  Result := FFrame.EnableDesigner;
end;

function TATdxNativePrintPane.GetImages: TCustomImageList;
begin
  Result := FFrame.Images;
end;

function TATdxNativePrintPane.GetLandscapeCaption: String;
begin
  Result := FFrame.LandscapeCaption;
end;

function TATdxNativePrintPane.GetLargeImages: TCustomImageList;
begin
  Result := FFrame.LargeImages;
end;

function TATdxNativePrintPane.GetLayoutLookAndFeel:
    TdxCustomLayoutLookAndFeel;
begin
  Result := FFrame.LayoutLookAndFeel;
end;

function TATdxNativePrintPane.GetOrientAutoCaption: String;
begin
  Result := FFrame.OrientAutoCaption;
end;

function TATdxNativePrintPane.GetOrientAutoImageIndex:
    System.UITypes.TImageIndex;
begin
  Result := FFrame.OrientAutoImageIndex;
end;

function TATdxNativePrintPane.GetOrientLandscapeImageIndex:
    System.UITypes.TImageIndex;
begin
  Result := FFrame.OrientLandscapeImageIndex;
end;

function TATdxNativePrintPane.GetOrientPortraitImageIndex:
    System.UITypes.TImageIndex;
begin
  Result := FFrame.OrientPortraitImageIndex;
end;

function TATdxNativePrintPane.GetPagesCaption: String;
begin
  Result := FFrame.PagesCaption;
end;

function TATdxNativePrintPane.GetPageSetupCaption: String;
begin
  Result := FFrame.PageSetupCaption;
end;

function TATdxNativePrintPane.GetPageSizeImageIndex: System.UITypes.TImageIndex;
begin
  Result := FFrame.PageSizeImageIndex;
end;

function TATdxNativePrintPane.GetPortraitCaption: String;
begin
  Result := FFrame.PortraitCaption;
end;

function TATdxNativePrintPane.GetPrintButtonCaption: String;
begin
  Result := FFrame.PrintButtonCaption;
end;

function TATdxNativePrintPane.GetPrinterCaption: String;
begin
  Result := FFrame.PrinterCaption;
end;

function TATdxNativePrintPane.GetPrinterPropertiesCaption: String;
begin
  Result := FFrame.PrinterPropertiesCaption;
end;

function TATdxNativePrintPane.GetPrinterSelectImageIndex:
    System.UITypes.TImageIndex;
begin
  Result := FFrame.PrinterSelectImageIndex;
end;

function TATdxNativePrintPane.GetPrintImageIndex: System.UITypes.TImageIndex;
begin
  Result := FFrame.PrintImageIndex;
end;

function TATdxNativePrintPane.GetRebuildReportCaption: String;
begin
  Result := FFrame.RebuildReportCaption;
end;

function TATdxNativePrintPane.GetRebuildReportImageIndex:
    System.UITypes.TImageIndex;
begin
  Result := FFrame.RebuildReportImageIndex;
end;

function TATdxNativePrintPane.GetRibbon: TdxRibbon;
begin
  Result := FFrame.Ribbon;
end;

function TATdxNativePrintPane.GetRichEdit: TdxRichEditControl;
begin
  Result := FFrame.RichEdit;
end;

function TATdxNativePrintPane.GetSettingsCaption: String;
begin
  Result := FFrame.SettingsCaption;
end;

function TATdxNativePrintPane.GetSinglePageCaption: String;
begin
  Result := FFrame.SinglePageCaption;
end;

function TATdxNativePrintPane.GetSinglePageImageIndex:
    System.UITypes.TImageIndex;
begin
  Result := FFrame.SinglePageImageIndex;
end;

function TATdxNativePrintPane.GetThumbnailPaneVisible: Boolean;
begin
  Result := FFrame.ThumbnailPaneVisible;
end;

function TATdxNativePrintPane.GetUncollateCaption: String;
begin
  Result := FFrame.UncollateCaption;
end;

function TATdxNativePrintPane.GetUncollateImageIndex:
    System.UITypes.TImageIndex;
begin
  Result := FFrame.UncollateImageIndex;
end;

procedure TATdxNativePrintPane.SetAllPagesCaption(const Value: String);
begin
  FFrame.AllPagesCaption := Value;
end;

procedure TATdxNativePrintPane.SetAllPagesImageIndex(const Value:
    System.UITypes.TImageIndex);
begin
  FFrame.AllPagesImageIndex := Value;
end;

procedure TATdxNativePrintPane.SetCollateCaption(const Value: String);
begin
  FFrame.CollateCaption := Value;
end;

procedure TATdxNativePrintPane.SetCollateImageIndex(const Value:
    System.UITypes.TImageIndex);
begin
  FFrame.CollateImageIndex := Value;
end;

procedure TATdxNativePrintPane.SetComponentPrinter(const Value:
    TCustomdxComponentPrinter);
begin
  FFrame.ComponentPrinter := Value;
end;

procedure TATdxNativePrintPane.SetCopiesCaption(const Value: String);
begin
  FFrame.CopiesCaption := Value;
end;

procedure TATdxNativePrintPane.SetCustomPageCaption(const Value: String);
begin
  FFrame.CustomPageCaption := Value;
end;

procedure TATdxNativePrintPane.SetCustomPageImageIndex(const Value:
    System.UITypes.TImageIndex);
begin
  FFrame.CustomPageImageIndex := Value;
end;

procedure TATdxNativePrintPane.SetDesignReportCaption(const Value: String);
begin
  FFrame.DesignReportCaption := Value;
end;

procedure TATdxNativePrintPane.SetDesignReportImageIndex(const Value:
    System.UITypes.TImageIndex);
begin
  FFrame.DesignReportImageIndex := Value;
end;

procedure TATdxNativePrintPane.SetEnableDesigner(const Value: Boolean);
begin
  FFrame.EnableDesigner := Value;
end;

procedure TATdxNativePrintPane.SetImages(const Value: TCustomImageList);
begin
  FFrame.Images := Value;
end;

procedure TATdxNativePrintPane.SetLandscapeCaption(const Value: String);
begin
  FFrame.LandscapeCaption := Value
end;

procedure TATdxNativePrintPane.SetLargeImages(const Value: TCustomImageList);
begin
  FFrame.LargeImages := Value;
end;

procedure TATdxNativePrintPane.SetLayoutLookAndFeel(const Value:
    TdxCustomLayoutLookAndFeel);
begin
  FFrame.LayoutLookAndFeel := Value;
end;

procedure TATdxNativePrintPane.SetOrientAutoCaption(const Value: String);
begin
  FFrame.OrientAutoCaption := Value;
end;

procedure TATdxNativePrintPane.SetOrientAutoImageIndex(const Value:
    System.UITypes.TImageIndex);
begin
  FFrame.OrientAutoImageIndex := Value;
end;

procedure TATdxNativePrintPane.SetOrientLandscapeImageIndex(const Value:
    System.UITypes.TImageIndex);
begin
  FFrame.OrientLandscapeImageIndex := Value
end;

procedure TATdxNativePrintPane.SetOrientPortraitImageIndex(const Value:
    System.UITypes.TImageIndex);
begin
  FFrame.OrientPortraitImageIndex := Value
end;

procedure TATdxNativePrintPane.SetPagesCaption(const Value: String);
begin
  FFrame.PagesCaption := Value;
end;

procedure TATdxNativePrintPane.SetPageSetupCaption(const Value: String);
begin
  FFrame.PageSetupCaption := Value;
end;

procedure TATdxNativePrintPane.SetPageSizeImageIndex(const Value:
    System.UITypes.TImageIndex);
begin
  FFrame.PageSizeImageIndex := Value;
end;

procedure TATdxNativePrintPane.SetPortraitCaption(const Value: String);
begin
  FFrame.PortraitCaption := Value
end;

procedure TATdxNativePrintPane.SetPrintButtonCaption(const Value: String);
begin
  FFrame.PrintButtonCaption := Value;
end;

procedure TATdxNativePrintPane.SetPrinterCaption(const Value: String);
begin
  FFrame.PrinterCaption := Value;
end;

procedure TATdxNativePrintPane.SetPrinterPropertiesCaption(const Value: String);
begin
  FFrame.PrinterPropertiesCaption := Value;
end;

procedure TATdxNativePrintPane.SetPrinterSelectImageIndex(const Value:
    System.UITypes.TImageIndex);
begin
  FFrame.PrinterSelectImageIndex := Value;
end;

procedure TATdxNativePrintPane.SetPrintImageIndex(const Value:
    System.UITypes.TImageIndex);
begin
  FFrame.PrintImageIndex := Value;
end;

procedure TATdxNativePrintPane.SetRebuildReportCaption(const Value: String);
begin
  FFrame.RebuildReportCaption := Value;
end;

procedure TATdxNativePrintPane.SetRebuildReportImageIndex(const Value:
    System.UITypes.TImageIndex);
begin
  FFrame.RebuildReportImageIndex := Value;
end;

procedure TATdxNativePrintPane.SetRibbon(const Value: TdxRibbon);
begin
  FFrame.Ribbon := Value;
end;

procedure TATdxNativePrintPane.SetRichEdit(const Value: TdxRichEditControl);
begin
  FFrame.RichEdit := Value;
end;

procedure TATdxNativePrintPane.SetSettingsCaption(const Value: String);
begin
  FFrame.SettingsCaption := Value;
end;

procedure TATdxNativePrintPane.SetSinglePageCaption(const Value: String);
begin
  FFrame.SinglePageCaption := Value;
end;

procedure TATdxNativePrintPane.SetSinglePageImageIndex(const Value:
    System.UITypes.TImageIndex);
begin
  FFrame.SinglePageImageIndex := Value;
end;

procedure TATdxNativePrintPane.SetThumbnailPaneVisible(const Value: Boolean);
begin
  FFrame.ThumbnailPaneVisible := Value;
end;

procedure TATdxNativePrintPane.SetUncollateCaption(const Value: String);
begin
  FFrame.UncollateCaption := Value;
end;

procedure TATdxNativePrintPane.SetUncollateImageIndex(const Value:
    System.UITypes.TImageIndex);
begin
  FFrame.UncollateImageIndex := Value;
end;

function TATdxNativePrintPane._IsAllPagesCaptionStored: Boolean;
begin
  Result := ( NOT SameStr(AllPagesCaption, cAllPagesCaption) );
end;

function TATdxNativePrintPane._IsCollateCaptionStored: Boolean;
begin
  Result := ( NOT SameStr(CollateCaption, cCollateCaption) );
end;

function TATdxNativePrintPane._IsCopiesCaptionStored: Boolean;
begin
  Result := ( NOT SameStr(CopiesCaption, cCopiesCaption) );
end;

function TATdxNativePrintPane._IsCustomPageCaptionStored: Boolean;
begin
  Result := ( NOT SameStr(CustomPageCaption, cCustomPageCaption) );
end;

function TATdxNativePrintPane._IsDesignReportCaptionStored: Boolean;
begin
  Result := ( NOT SameStr(DesignReportCaption, cDesignReportCaption) );
end;

function TATdxNativePrintPane._IsLandscapeCaptionStored: Boolean;
begin
  Result := ( NOT SameStr(LandscapeCaption, cLandscapeCaption) );
end;

function TATdxNativePrintPane._IsOrientAutoCaptionStored: Boolean;
begin
  Result := ( NOT SameStr(OrientAutoCaption, cOrientAutoCaption) );
end;

function TATdxNativePrintPane._IsPagesCaptionStored: Boolean;
begin
  Result := ( NOT SameStr(PagesCaption, cPagesCaption) );
end;

function TATdxNativePrintPane._IsPageSetupCaptionStored: Boolean;
begin
  Result := ( NOT SameStr(PageSetupCaption, cPageSetupCaption) );
end;

function TATdxNativePrintPane._IsPortraitCaptionStored: Boolean;
begin
  Result := ( NOT SameStr(PortraitCaption, cPortraitCaption) );
end;

function TATdxNativePrintPane._IsPrintButtonCaptionStored: Boolean;
begin
  Result := ( NOT SameStr(PrintButtonCaption, cPrintButtonCaption) );
end;

function TATdxNativePrintPane._IsPrinterCaptionStored: Boolean;
begin
  Result := ( NOT SameStr(PrinterCaption, cPrinterCaption) );
end;

function TATdxNativePrintPane._IsPrinterPropertiesCaptionStored: Boolean;
begin
  Result := ( NOT SameStr(PrinterPropertiesCaption, cPrinterPropertiesCaption) );
end;

function TATdxNativePrintPane._IsRebuildReportCaptionStored: Boolean;
begin
  Result := ( NOT SameStr(RebuildReportCaption, cRebuildReportCaption) );
end;

function TATdxNativePrintPane._IsSettingsCaptionStored: Boolean;
begin
  Result := ( NOT SameStr(SettingsCaption, cSettingsCaption) );
end;

function TATdxNativePrintPane._IsSinglePageCaptionStored: Boolean;
begin
  Result := ( NOT SameStr(SinglePageCaption, cSinglePageCaption) );
end;

function TATdxNativePrintPane._IsUncollateCaptionStored: Boolean;
begin
  Result := ( NOT SameStr(UncollateCaption, cUncollateCaption) );
end;

end.
