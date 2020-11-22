// ******************************************************************
//
// Program Name   : Angelic Tech - DevEx Native Print Pane
// Platform(s)    : Win32, Win64
// Framework      : VCL - DevExpress VCL
//
// Filename       : AT.Vcl.DX.NativePrintPane.Frame.pas/.dfm
// Date Created   : 11-Jul-2019
// Author         : Matthew Vesperman
//
// Description:
//
//    Frame class for the DevExpress style Backstage View Print Pane.
//
//    This is meant for use with the DevExpress VCL Ribbon/Backstage View
//    control.
//
// Revision History:
//
// v1.00   :   Initial version
//
// ******************************************************************
//
// COPYRIGHT © 2019 - PRESENT Angelic Technology
// ALL RIGHTS RESERVED WORLDWIDE
//
// ******************************************************************

/// <summary>
///   <para>
///     Frame class for the DevExpress style Backstage View Print Pane.
///   </para>
///   <para>
///     This is meant for use with the DevExpress VCL Ribbon/Backstage View
///     control.
///   </para>
/// </summary>
unit AT.Vcl.DX.NativePrintPane.Frame;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.UITypes, System.SysUtils, System.Variants, System.Classes,
  System.ImageList, System.Actions,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus,
  Vcl.StdCtrls, Vcl.ImgList, Vcl.ActnList,
  cxClasses, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxSpinEdit, cxButtons, cxImageList, cxDrawTextUtils,
  dxSkinsCore,
  dxBar, dxLayoutContainer, dxLayoutControlAdapters,
  dxLayoutcxEditAdapters, dxPSCore, dxPSPrvw, dxLayoutControl,
  dxLayoutLookAndFeels, dxRibbon, dxPSGlbl, dxPSUtl, dxPSEngn,
  dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider,
  dxPSFillPatterns, dxPSEdgePatterns, dxPSPDFExportCore,
  dxPSPDFExport, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxPageControlProducer, dxPScxEditorProducers,
  dxPScxExtEditorProducers, dxPSRELnk, dxCore, dxCoreClasses,
  dxGDIPlusAPI, dxGDIPlusClasses, dxRichEdit.NativeApi,
  dxRichEdit.Types, dxRichEdit.Options, dxRichEdit.Control,
  dxRichEdit.Control.SpellChecker, dxRichEdit.Dialogs.EventArgs,
  dxBarBuiltInMenu, dxRichEdit.Platform.Win.Control,
  dxRichEdit.Control.Core, dxActions, dxRichEdit.Actions;


const
  cAllPagesCaption = 'Print All Pages';
  cCollateCaption = 'Collate';
  cCopiesCaption = 'Copies';
  cCustomPageCaption = 'Custom';
  cDesignReportCaption = 'Design Report';
  cLandscapeCaption = 'Landscape';
  cOrientAutoCaption = 'Auto';
  cPagesCaption = 'Pages';
  cPageSetupCaption = 'Page Setup';
  cPortraitCaption = 'Portrait';
  cPrintButtonCaption = 'Print';
  cPrinterCaption= 'Printer';
  cPrinterPropertiesCaption = 'Printer Properties';
  cRebuildReportCaption = 'Rebuild Report';
  cSettingsCaption = 'Settings';
  cSinglePageCaption = 'Print Current Page';
  cUncollateCaption = 'Uncollate';

type

  { TfrmPrinting }

  /// <summary>
  ///   Frame class for the DevExpress style Backstage View Print
  ///   Pane.
  /// </summary>
  TATdxNativePrintPaneFrame = class(TFrame)
    actDesignReport: TAction;
    alstPrintPane: TActionList;
    barmgrPrintPane: TdxBarManager;
    btnPageOrientation: TcxButton;
    btnPaperSize: TcxButton;
    btnPrint: TcxButton;
    btnPrintCollate: TcxButton;
    btnPrinter: TcxButton;
    btnPrintPages: TcxButton;
    cmdCollation: TdxBarListItem;
    cmdCustomPaperSize: TdxBarButton;
    cmdDesignReport: TdxBarButton;
    cmdPageOrientation: TdxBarListItem;
    cmdPaperSizes: TdxBarListItem;
    cmdPrinters: TdxBarListItem;
    cmdPrintRanges: TdxBarListItem;
    cmdRebuildReport: TdxBarButton;
    dxLayoutAutoCreatedGroup1: TdxLayoutAutoCreatedGroup;
    dxLayoutEmptySpaceItem1: TdxLayoutEmptySpaceItem;
    dxLayoutEmptySpaceItem2: TdxLayoutEmptySpaceItem;
    dxLayoutEmptySpaceItem3: TdxLayoutEmptySpaceItem;
    dxLayoutEmptySpaceItem4: TdxLayoutEmptySpaceItem;
    dxLayoutGroup1: TdxLayoutGroup;
    dxLayoutItem1: TdxLayoutItem;
    dxLayoutItem2: TdxLayoutItem;
    dxLayoutItem4: TdxLayoutItem;
    dxLayoutItem5: TdxLayoutItem;
    dxLayoutItem6: TdxLayoutItem;
    dxLayoutSeparatorItem1: TdxLayoutSeparatorItem;
    laygrpPrintPreviewGroup_Root: TdxLayoutGroup;
    layitmCopies: TdxLayoutItem;
    layitmPageOrientation: TdxLayoutItem;
    layitmPages: TdxLayoutItem;
    layitmPaperSize: TdxLayoutItem;
    layPrintPreview: TdxLayoutControl;
    lblitmPageSetup: TdxLayoutLabeledItem;
    lblitmPrinter: TdxLayoutLabeledItem;
    lblitmPrinterProperties: TdxLayoutLabeledItem;
    lblitmSettings: TdxLayoutLabeledItem;
    PSPreviewWindow: TdxPSPreviewWindow;
    puPageOrientation: TdxRibbonPopupMenu;
    puPaperSizes: TdxRibbonPopupMenu;
    puPreview: TdxRibbonPopupMenu;
    puPrintCollate: TdxRibbonPopupMenu;
    puPrinters: TdxRibbonPopupMenu;
    puPrintRanges: TdxRibbonPopupMenu;
    sePrintCopies: TcxSpinEdit;
    txtPrintRange: TcxTextEdit;
    procedure CollationClickHandler(Sender: TObject);
    procedure DesignReportClickHandler(Sender: TObject);
    procedure PageOrientationClickHandler(Sender: TObject);
    procedure PageSetupCaptionClickHandler(Sender: TObject);
    procedure PaperSizesClickHandler(Sender: TObject);
    procedure PrintButtonClickHandler(Sender: TObject);
    procedure PrinterPropertiesCaptionClickHandler(Sender: TObject);
    procedure PrintersClickHandler(Sender: TObject);
    procedure PrintRangeChangeHandler(Sender: TObject);
    procedure PrintRangesClickHandler(Sender: TObject);
    procedure PSPreviewWindowUpdateControls(Sender: TObject);
    procedure RebuildReportClickHandler(Sender: TObject);
  strict private
    FAllPagesCaption: String;
    FAllPagesImageIndex: System.UITypes.TImageIndex;
    FCollateCaption: String;
    FCollateImageIndex: System.UITypes.TImageIndex;
    FCustomPageCaption: String;
    FCustomPageImageIndex: System.UITypes.TImageIndex;
    FLandscapeCaption: String;
    FOrientAutoCaption: String;
    FOrientAutoImageIndex: System.UITypes.TImageIndex;
    FOrientLandscapeImageIndex: System.UITypes.TImageIndex;
    FOrientPortraitImageIndex: System.UITypes.TImageIndex;
    FPortraitCaption: String;
    FRibbon: TdxRibbon;
    FRichEdit: TdxRichEditControl;
    FSinglePageCaption: String;
    FSinglePageImageIndex: System.UITypes.TImageIndex;
    FUncollateCaption: String;
    FUncollateImageIndex: System.UITypes.TImageIndex;
    procedure _NormalUpdateControlsHandler(Sender: TObject);
    procedure _RebuildCollateList;
    procedure _RebuildOrientationList;
    procedure _RebuildPrintRangeList;
    procedure _RichEditUpdateControlsHandler(Sender: TObject);
    procedure _UpdateCollateButton;
    procedure _UpdateOrientationButton;
    procedure _UpdatePrintRangeButton;
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
    function GetRichEditMode: Boolean;
    function GetSettingsCaption: String;
    function GetSinglePageCaption: String;
    function GetSinglePageImageIndex: System.UITypes.TImageIndex;
    function GetThumbnailPaneVisible: Boolean;
    function GetUncollateCaption: String;
    function GetUncollateImageIndex: System.UITypes.TImageIndex;
    procedure PopulatePaperSizes;
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
    /// <summary>
    ///   Opens the current report link in the ExpressPrinting System
    ///   report designer.
    /// </summary>
    procedure DesignReport;
    /// <summary>
    ///   Flag indicating if the print pane is operating in RichEdit
    ///   mode.
    /// </summary>
    /// <value>
    ///   TRUE if there is a TdxRichEditControl assigned to the print
    ///   pane's RichEdit property, False otherwise.
    /// </value>
    /// <remarks>
    ///   The print pane changes its behavior if there is a RichEdit
    ///   attached. This flag is used internally to inform the
    ///   control that it needs to behave differently.
    /// </remarks>
    property RichEditMode: Boolean read GetRichEditMode;
  published
    /// <summary>
    ///   A string value used to tell the print pane what to display
    ///   for the "All Pages" option in the page range settings
    ///   drop-down.
    /// </summary>
    property AllPagesCaption: String read GetAllPagesCaption write
        SetAllPagesCaption;
    /// <summary>
    ///   Specifies the image to use for the "All Pages" option of
    ///   the page range drop-down by its index within the Images
    ///   collection.
    /// </summary>
    property AllPagesImageIndex: System.UITypes.TImageIndex
        read GetAllPagesImageIndex
        write SetAllPagesImageIndex
        default -1;
    /// <summary>
    ///   A string value used to tell the print pane what to display
    ///   for the "Collate" option in the collation settings
    ///   drop-down.
    /// </summary>
    property CollateCaption: String
        read GetCollateCaption
        write SetCollateCaption;
    /// <summary>
    ///   Specifies the image to use for the "Collate" option of the
    ///   collation settings drop-down by its index within the Images
    ///   collection.
    /// </summary>
    property CollateImageIndex: System.UITypes.TImageIndex
        read GetCollateImageIndex
        write SetCollateImageIndex
        default -1;
    property ComponentPrinter: TCustomdxComponentPrinter
        read GetComponentPrinter
        write SetComponentPrinter;
    property CopiesCaption: String
        read GetCopiesCaption
        write SetCopiesCaption;
    /// <summary>
    ///   A string value used to tell the print pane what to display
    ///   for the "Custom" option in the page range settings
    ///   drop-down.
    /// </summary>
    property CustomPageCaption: String
        read GetCustomPageCaption
        write SetCustomPageCaption;
    /// <summary>
    ///   Specifies the image to use for the "Custom" option of the
    ///   page range drop-down by its index within the Images
    ///   collection. <br />
    /// </summary>
    property CustomPageImageIndex: System.UITypes.TImageIndex
        read GetCustomPageImageIndex
        write SetCustomPageImageIndex
        default -1;
    property DesignReportCaption: String
        read GetDesignReportCaption
        write SetDesignReportCaption;
    property DesignReportImageIndex: System.UITypes.TImageIndex
        read GetDesignReportImageIndex
        write SetDesignReportImageIndex
        default -1;
    property EnableDesigner: Boolean
        read GetEnableDesigner
        write SetEnableDesigner;
    property Images: TCustomImageList
        read GetImages
        write SetImages;
    property LandscapeCaption: String
        read GetLandscapeCaption
        write SetLandscapeCaption;
    property LargeImages: TCustomImageList
        read GetLargeImages
        write SetLargeImages;
    property LayoutLookAndFeel: TdxCustomLayoutLookAndFeel
        read GetLayoutLookAndFeel
        write SetLayoutLookAndFeel;
    property OrientAutoCaption: String
        read GetOrientAutoCaption
        write SetOrientAutoCaption;
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
        write SetPagesCaption;
    property PageSetupCaption: String
        read GetPageSetupCaption
        write SetPageSetupCaption;
    property PageSizeImageIndex: System.UITypes.TImageIndex
        read GetPageSizeImageIndex
        write SetPageSizeImageIndex
        default -1;
    property PortraitCaption: String
        read GetPortraitCaption
        write SetPortraitCaption;
    property PrintButtonCaption: String
        read GetPrintButtonCaption
        write SetPrintButtonCaption;
    property PrinterCaption: String
        read GetPrinterCaption
        write SetPrinterCaption;
    property PrinterPropertiesCaption: String
        read GetPrinterPropertiesCaption
        write SetPrinterPropertiesCaption;
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
        write SetRebuildReportCaption;
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
        write SetSettingsCaption;
    /// <summary>
    ///   A string value used to tell the print pane what to display
    ///   for the "Current Page" option in the page range settings
    ///   drop-down.
    /// </summary>
    property SinglePageCaption: String
        read GetSinglePageCaption
        write SetSinglePageCaption;
    /// <summary>
    ///   Specifies the image to use for the "Current Page" option of
    ///   the page range drop-down by its index within the Images
    ///   collection. <br />
    /// </summary>
    property SinglePageImageIndex: System.UITypes.TImageIndex
        read GetSinglePageImageIndex
        write SetSinglePageImageIndex
        default -1;
    property ThumbnailPaneVisible: Boolean
        read GetThumbnailPaneVisible
        write SetThumbnailPaneVisible
        default False;
    /// <summary>
    ///   A string value used to tell the print pane what to display
    ///   for the "Uncollate" option in the collation
    ///   settingsdrop-down.
    /// </summary>
    property UncollateCaption: String
        read GetUncollateCaption
        write SetUncollateCaption;
    /// <summary>
    ///   Specifies the image to use for the "Uncollate" option of
    ///   the collation settings drop-down by its index within the
    ///   Images collection.
    /// </summary>
    property UncollateImageIndex: System.UITypes.TImageIndex
        read GetUncollateImageIndex
        write SetUncollateImageIndex
        default -1;
  end;

implementation

uses
  System.Math,
  dxPrnDlg, dxPgsDlg, dxPSRes, dxRichEdit.Commands.Dialogs,
  dxRichEdit.View.Core, cxEditConsts;

{$R *.dfm}

function GetPaperInfo(DMPaper: Integer; out APaperInfo: TdxPaperInfo): Boolean;
var
  APaperIndex: Integer;
begin
  APaperIndex := dxPrintDevice.FindPaper(DMPaper);

  Result := (APaperIndex >= 0);

  if (Result) then
    APaperInfo := dxPrintDevice.Papers.Objects[APaperIndex] as TdxPaperInfo;
end;

{ TfrmPrinting }

constructor TATdxNativePrintPaneFrame.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

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

  dxGetPrinterList(cmdPrinters.Items);

  txtPrintRange.Hint := sdxPrintDialogRangeLegend;

end;

procedure TATdxNativePrintPaneFrame.CollationClickHandler(Sender: TObject);
begin
  _UpdateCollateButton;
end;

procedure TATdxNativePrintPaneFrame.DesignReport;
begin
  if (EnableDesigner) then
    PSPreviewWindow.DoDesignReport;
end;

procedure TATdxNativePrintPaneFrame.DesignReportClickHandler(Sender: TObject);
begin
  DesignReport;
end;

function TATdxNativePrintPaneFrame.GetAllPagesCaption: String;
begin
  Result := FAllPagesCaption;
end;

function TATdxNativePrintPaneFrame.GetAllPagesImageIndex:
    System.UITypes.TImageIndex;
begin
  Result := FAllPagesImageIndex;
end;

function TATdxNativePrintPaneFrame.GetCollateCaption: String;
begin
  Result := FCollateCaption;
end;

function TATdxNativePrintPaneFrame.GetCollateImageIndex:
    System.UITypes.TImageIndex;
begin
  Result := FCollateImageIndex;
end;

function TATdxNativePrintPaneFrame.GetComponentPrinter:
    TCustomdxComponentPrinter;
begin
  Result := PSPreviewWindow.ComponentPrinter;
end;

function TATdxNativePrintPaneFrame.GetCopiesCaption: String;
begin
  Result := layitmCopies.CaptionOptions.Text;
end;

function TATdxNativePrintPaneFrame.GetCustomPageCaption: String;
begin
  Result := FCustomPageCaption;
end;

function TATdxNativePrintPaneFrame.GetCustomPageImageIndex:
    System.UITypes.TImageIndex;
begin
  Result := FCustomPageImageIndex;
end;

function TATdxNativePrintPaneFrame.GetDesignReportCaption: String;
begin
  Result := actDesignReport.Caption;
end;

function TATdxNativePrintPaneFrame.GetDesignReportImageIndex:
    System.UITypes.TImageIndex;
begin
  Result := actDesignReport.ImageIndex;
end;

function TATdxNativePrintPaneFrame.GetEnableDesigner: Boolean;
begin
  Result := actDesignReport.Visible;
end;

function TATdxNativePrintPaneFrame.GetImages: TCustomImageList;
begin
  Result := barmgrPrintPane.ImageOptions.Images;
end;

function TATdxNativePrintPaneFrame.GetLandscapeCaption: String;
begin
  Result := FLandscapeCaption;
end;

function TATdxNativePrintPaneFrame.GetLargeImages: TCustomImageList;
begin
  Result := barmgrPrintPane.ImageOptions.LargeImages;
end;

function TATdxNativePrintPaneFrame.GetLayoutLookAndFeel: TdxCustomLayoutLookAndFeel;
begin
  Result := layPrintPreview.LayoutLookAndFeel;
end;

function TATdxNativePrintPaneFrame.GetOrientAutoCaption: String;
begin
  Result := FOrientAutoCaption;
end;

function TATdxNativePrintPaneFrame.GetOrientAutoImageIndex:
    System.UITypes.TImageIndex;
begin
  Result := FOrientAutoImageIndex;
end;

function TATdxNativePrintPaneFrame.GetOrientLandscapeImageIndex:
    System.UITypes.TImageIndex;
begin
  Result := FOrientLandscapeImageIndex;
end;

function TATdxNativePrintPaneFrame.GetOrientPortraitImageIndex:
    System.UITypes.TImageIndex;
begin
  Result := FOrientPortraitImageIndex;
end;

function TATdxNativePrintPaneFrame.GetPagesCaption: String;
begin
  Result := layitmPages.CaptionOptions.Text;
end;

function TATdxNativePrintPaneFrame.GetPageSetupCaption: String;
begin
  Result := lblitmPageSetup.CaptionOptions.Text;
end;

function TATdxNativePrintPaneFrame.GetPageSizeImageIndex:
    System.UITypes.TImageIndex;
begin
  Result := btnPaperSize.OptionsImage.ImageIndex;
end;

function TATdxNativePrintPaneFrame.GetPortraitCaption: String;
begin
  Result := FPortraitCaption;
end;

function TATdxNativePrintPaneFrame.GetPrintButtonCaption: String;
begin
  Result := btnPrint.Caption;
end;

function TATdxNativePrintPaneFrame.GetPrinterCaption: String;
begin
  Result := lblitmPrinter.CaptionOptions.Text;
end;

function TATdxNativePrintPaneFrame.GetPrinterPropertiesCaption: String;
begin
  Result := lblitmPrinterProperties.CaptionOptions.Text;
end;

function TATdxNativePrintPaneFrame.GetPrinterSelectImageIndex:
    System.UITypes.TImageIndex;
begin
  Result := btnPrinter.OptionsImage.ImageIndex;
end;

function TATdxNativePrintPaneFrame.GetPrintImageIndex:
    System.UITypes.TImageIndex;
begin
  Result := btnPrint.OptionsImage.ImageIndex;
end;

function TATdxNativePrintPaneFrame.GetRebuildReportCaption: String;
begin
  Result := cmdRebuildReport.Caption;
end;

function TATdxNativePrintPaneFrame.GetRebuildReportImageIndex:
    System.UITypes.TImageIndex;
begin
  Result := cmdRebuildReport.ImageIndex;
end;

function TATdxNativePrintPaneFrame.GetRibbon: TdxRibbon;
begin
  Result := FRibbon;;
end;

function TATdxNativePrintPaneFrame.GetRichEdit: TdxRichEditControl;
begin
  Result := FRichEdit;
end;

function TATdxNativePrintPaneFrame.GetRichEditMode: Boolean;
begin
  Result := (Assigned(FRichEdit));
end;

function TATdxNativePrintPaneFrame.GetSettingsCaption: String;
begin
  Result := lblitmSettings.CaptionOptions.Text;
end;

function TATdxNativePrintPaneFrame.GetSinglePageCaption: String;
begin
  Result := FSinglePageCaption;
end;

function TATdxNativePrintPaneFrame.GetSinglePageImageIndex:
    System.UITypes.TImageIndex;
begin
  Result := FSinglePageImageIndex;
end;

function TATdxNativePrintPaneFrame.GetThumbnailPaneVisible: Boolean;
begin
  Result := PSPreviewWindow.ThumbnailsPane.Visible;
end;

function TATdxNativePrintPaneFrame.GetUncollateCaption: String;
begin
  Result := FUncollateCaption;
end;

function TATdxNativePrintPaneFrame.GetUncollateImageIndex:
    System.UITypes.TImageIndex;
begin
  Result := FUncollateImageIndex;
end;

procedure TATdxNativePrintPaneFrame.PageOrientationClickHandler(Sender: TObject);
var
  AOrient: TdxPrinterOrientation;
  Idx: Integer;
begin
  Idx := cmdPageOrientation.ItemIndex;

  AOrient := TdxPrinterOrientation(Idx);

  PSPreviewWindow.PrinterPage.Orientation := AOrient;

  _UpdateOrientationButton;
end;

procedure TATdxNativePrintPaneFrame.PageSetupCaptionClickHandler(Sender: TObject);
begin
  if (NOT RichEditMode) then
    PSPreviewWindow.DoPageSetupReport(PSPreviewWindow.Preview.SelPageIndex);
end;

procedure TATdxNativePrintPaneFrame.PaperSizesClickHandler(Sender: TObject);
begin
  PSPreviewWindow.PrinterPage.DMPaper := Integer(cmdPaperSizes.Items.Objects[cmdPaperSizes.ItemIndex]);
end;

procedure TATdxNativePrintPaneFrame.PopulatePaperSizes;
const
  DefaultPapers: array[0..6] of Integer = (
    DMPAPER_LETTER, DMPAPER_A3, DMPAPER_A4, DMPAPER_A4SMALL, DMPAPER_A5, DMPAPER_B4, DMPAPER_B5
  );
var
  APaperInfo: TdxPaperInfo;
  I: Integer;
begin
  cmdPaperSizes.Items.BeginUpdate;
  try
    cmdPaperSizes.Items.Clear;
    for I := Low(DefaultPapers) to High(DefaultPapers) do
      if GetPaperInfo(DefaultPapers[I], APaperInfo) then
      begin
        cmdPaperSizes.Items.AddObject(
          Format('%s (%0.2f x %0.2f mm)', [APaperInfo.Name, APaperInfo.Width / 10, APaperInfo.Height / 10]),
          TObject(APaperInfo.DMPaper));
      end;
  finally
   cmdPaperSizes.Items.EndUpdate;
  end;
end;

procedure TATdxNativePrintPaneFrame.PrintButtonClickHandler(Sender: TObject);
var
  APageIndexes: TdxPSPageIndexes;
  APageIndexesAsString: string;
begin
  case cmdPrintRanges.ItemIndex of
    1: APageIndexesAsString := IntToStr(PSPreviewWindow.ReportLink.CurrentPage);
    2: APageIndexesAsString := txtPrintRange.Text;
  else
    APageIndexesAsString := '1-' + IntToStr(PSPreviewWindow.ReportLink.PageCount);
  end;

  if DecodePageIndexes(APageIndexesAsString, APageIndexes) then
  begin
    PSPreviewWindow.ComponentPrinter.PrintPagesEx(APageIndexes, pnAll, sePrintCopies.Value, cmdCollation.ItemIndex = 0);
    PSPreviewWindow.UpdateControls;
  end
  else
    MessageDlg(sdxPrintDialogInvalidPageRanges, mtWarning, [mbOK], 0);
end;

procedure TATdxNativePrintPaneFrame.PrinterPropertiesCaptionClickHandler(Sender: TObject);
begin
  if dxDocumentProperties(Handle) then
    PSPreviewWindow.UpdateControls;
end;

procedure TATdxNativePrintPaneFrame.PrintersClickHandler(Sender: TObject);
begin
  dxPrintDevice.PrinterIndex := cmdPrinters.ItemIndex;
  PSPreviewWindow.UpdateControls;
end;

procedure TATdxNativePrintPaneFrame.PrintRangeChangeHandler(Sender: TObject);
begin
  cmdPrintRanges.ItemIndex := 2;
  _UpdatePrintRangeButton;
end;

procedure TATdxNativePrintPaneFrame.PrintRangesClickHandler(Sender: TObject);
begin
  _UpdatePrintRangeButton;

  if cmdPrintRanges.ItemIndex = 2 then
    txtPrintRange.SetFocus;
end;

procedure TATdxNativePrintPaneFrame.PSPreviewWindowUpdateControls(Sender: TObject);
begin
  if (RichEditMode) then
    _RichEditUpdateControlsHandler(Sender)
  else
    _NormalUpdateControlsHandler(Sender);
end;

procedure TATdxNativePrintPaneFrame.RebuildReportClickHandler(Sender: TObject);
begin
  PSPreviewWindow.RebuildReport;
end;

procedure TATdxNativePrintPaneFrame.SetAllPagesCaption(const Value: String);
begin
  FAllPagesCaption := Value;

  _RebuildPrintRangeList;;
end;

procedure TATdxNativePrintPaneFrame.SetAllPagesImageIndex(const Value:
    System.UITypes.TImageIndex);
begin
  FAllPagesImageIndex := Value;

  _UpdatePrintRangeButton;
end;

procedure TATdxNativePrintPaneFrame.SetCollateCaption(const Value: String);
begin
  FCollateCaption := Value;

  _RebuildCollateList;
end;

procedure TATdxNativePrintPaneFrame.SetCollateImageIndex(const Value:
    System.UITypes.TImageIndex);
begin
  FCollateImageIndex := Value;

  _UpdateCollateButton;
end;

procedure TATdxNativePrintPaneFrame.SetComponentPrinter(const Value:
    TCustomdxComponentPrinter);
begin
  PSPreviewWindow.ComponentPrinter := Value;
end;

procedure TATdxNativePrintPaneFrame.SetCopiesCaption(const Value: String);
begin
  layitmCopies.CaptionOptions.Text := Value;
end;

procedure TATdxNativePrintPaneFrame.SetCustomPageCaption(const Value: String);
begin
  FCustomPageCaption := Value;

  _RebuildPrintRangeList;
end;

procedure TATdxNativePrintPaneFrame.SetCustomPageImageIndex(const Value:
    System.UITypes.TImageIndex);
begin
  FCustomPageImageIndex := Value;

  _UpdatePrintRangeButton
end;

procedure TATdxNativePrintPaneFrame.SetDesignReportCaption(const Value: String);
begin
  actDesignReport.Caption := Value;
end;

procedure TATdxNativePrintPaneFrame.SetDesignReportImageIndex(const Value:
    System.UITypes.TImageIndex);
begin
  actDesignReport.ImageIndex := Value;
end;

procedure TATdxNativePrintPaneFrame.SetEnableDesigner(const Value: Boolean);
begin
  actDesignReport.Enabled := Value;
  actDesignReport.Visible := Value;
end;

procedure TATdxNativePrintPaneFrame.SetImages(const Value: TCustomImageList);
begin
  barmgrPrintPane.ImageOptions.Images := Value;
end;

procedure TATdxNativePrintPaneFrame.SetLandscapeCaption(const Value: String);
begin
  FLandscapeCaption := Value;

  _RebuildOrientationList;
end;

procedure TATdxNativePrintPaneFrame.SetLargeImages(
  const Value: TCustomImageList);
begin
  barmgrPrintPane.ImageOptions.LargeImages := Value;

  btnPageOrientation.OptionsImage.Images := Value;
  btnPaperSize.OptionsImage.Images := Value;
  btnPrint.OptionsImage.Images := Value;
  btnPrintCollate.OptionsImage.Images := Value;
  btnPrinter.OptionsImage.Images := Value;
  btnPrintPages.OptionsImage.Images := Value;
end;

procedure TATdxNativePrintPaneFrame.SetLayoutLookAndFeel(
  const Value: TdxCustomLayoutLookAndFeel);
begin
  layPrintPreview.LayoutLookAndFeel := Value;
end;

procedure TATdxNativePrintPaneFrame.SetOrientAutoCaption(const Value: String);
begin
  FOrientAutoCaption := Value;

  _RebuildOrientationList;
end;

procedure TATdxNativePrintPaneFrame.SetOrientAutoImageIndex(const Value:
    System.UITypes.TImageIndex);
begin
  FOrientAutoImageIndex := Value;

  _UpdateOrientationButton;
end;

procedure TATdxNativePrintPaneFrame.SetOrientLandscapeImageIndex(const Value:
    System.UITypes.TImageIndex);
begin
  FOrientLandscapeImageIndex := Value;

  _UpdateOrientationButton
end;

procedure TATdxNativePrintPaneFrame.SetOrientPortraitImageIndex(const Value:
    System.UITypes.TImageIndex);
begin
  FOrientPortraitImageIndex := Value;

  _UpdateOrientationButton
end;

procedure TATdxNativePrintPaneFrame.SetPagesCaption(const Value: String);
begin
  layitmPages.CaptionOptions.Text := Value;
end;

procedure TATdxNativePrintPaneFrame.SetPageSetupCaption(const Value: String);
begin
  lblitmPageSetup.CaptionOptions.Text := Value;
end;

procedure TATdxNativePrintPaneFrame.SetPageSizeImageIndex(const Value:
    System.UITypes.TImageIndex);
begin
  btnPaperSize.OptionsImage.ImageIndex := Value;
end;

procedure TATdxNativePrintPaneFrame.SetPortraitCaption(const Value: String);
begin
  FPortraitCaption := Value;

  _RebuildOrientationList;
end;

procedure TATdxNativePrintPaneFrame.SetPrintButtonCaption(const Value: String);
begin
  btnPrint.Caption := Value;
end;

procedure TATdxNativePrintPaneFrame.SetPrinterCaption(const Value: String);
begin
  lblitmPrinter.CaptionOptions.Text := Value;
end;

procedure TATdxNativePrintPaneFrame.SetPrinterPropertiesCaption(const Value:
    String);
begin
  lblitmPrinterProperties.CaptionOptions.Text := Value;
end;

procedure TATdxNativePrintPaneFrame.SetPrinterSelectImageIndex(const Value:
    System.UITypes.TImageIndex);
begin
  btnPrinter.OptionsImage.ImageIndex := Value;
end;

procedure TATdxNativePrintPaneFrame.SetPrintImageIndex(const Value:
    System.UITypes.TImageIndex);
begin
  btnPrint.OptionsImage.ImageIndex := Value;
end;

procedure TATdxNativePrintPaneFrame.SetRebuildReportCaption(const Value:
    String);
begin
  cmdRebuildReport.Caption := Value;
end;

procedure TATdxNativePrintPaneFrame.SetRebuildReportImageIndex(const Value:
    System.UITypes.TImageIndex);
begin
  cmdRebuildReport.ImageIndex := Value;
end;

procedure TATdxNativePrintPaneFrame.SetRibbon(const Value: TdxRibbon);
begin
  FRibbon := Value;

  puPageOrientation.Ribbon := FRibbon;
  puPaperSizes.Ribbon := FRibbon;
  puPrintCollate.Ribbon := FRibbon;
  puPrinters.Ribbon := FRibbon;
  puPrintRanges.Ribbon := FRibbon;
  puPreview.Ribbon := FRibbon;
end;

procedure TATdxNativePrintPaneFrame.SetRichEdit(const Value:
    TdxRichEditControl);
begin
  FRichEdit := Value;
end;

procedure TATdxNativePrintPaneFrame.SetSettingsCaption(const Value: String);
begin
  lblitmSettings.CaptionOptions.Text := Value;
end;

procedure TATdxNativePrintPaneFrame.SetSinglePageCaption(const Value: String);
begin
  FSinglePageCaption := Value;

  _RebuildPrintRangeList;
end;

procedure TATdxNativePrintPaneFrame.SetSinglePageImageIndex(const Value:
    System.UITypes.TImageIndex);
begin
  FSinglePageImageIndex := Value;

  _UpdatePrintRangeButton;
end;

procedure TATdxNativePrintPaneFrame.SetThumbnailPaneVisible(const Value:
    Boolean);
begin
  PSPreviewWindow.ThumbnailsPane.Visible := Value;
  PSPreviewWindow.ThumbnailsSplitter.Visible := Value;
end;

procedure TATdxNativePrintPaneFrame.SetUncollateCaption(const Value: String);
begin
  FUncollateCaption := Value;

  _RebuildCollateList;
end;

procedure TATdxNativePrintPaneFrame.SetUncollateImageIndex(const Value:
    System.UITypes.TImageIndex);
begin
  FUncollateImageIndex := Value;

  _UpdateCollateButton;
end;

procedure TATdxNativePrintPaneFrame._NormalUpdateControlsHandler(Sender:
    TObject);
var
  APaperInfo: TdxPaperInfo;
begin
  cmdPrinters.ItemIndex := dxPrintDevice.PrinterIndex;
  btnPrinter.Caption := dxPrintDevice.CurrentDevice;
  btnPrint.Enabled := PSPreviewWindow.CanPrint;
  btnPrintPages.Enabled := PSPreviewWindow.CanPageSetup;
  btnPrintCollate.Enabled := PSPreviewWindow.CanPageSetup;
  txtPrintRange.Enabled := PSPreviewWindow.CanPageSetup;

  lblitmPageSetup.Visible := True;
  lblitmPageSetup.Enabled := PSPreviewWindow.CanPageSetup;

  lblitmPrinterProperties.Enabled := PSPreviewWindow.CanPrintDialog;

  sePrintCopies.Properties.MaxValue := dxPrintDevice.MaxCopies;
  sePrintCopies.Properties.MinValue := 1;
  sePrintCopies.Enabled := sePrintCopies.Properties.MaxValue > 1;
  _UpdatePrintRangeButton;

  // Page Orientation
  layitmPageOrientation.Visible := True;
  btnPageOrientation.Enabled := PSPreviewWindow.CanPageSetup;
  if PSPreviewWindow.ReportLink <> nil then
    cmdPageOrientation.ItemIndex := Ord(PSPreviewWindow.PrinterPage.Orientation);
  _UpdateOrientationButton;

  // Paper Size
  layitmPaperSize.Visible := True;
  PopulatePaperSizes;
  btnPaperSize.Enabled := PSPreviewWindow.CanPageSetup;
  if PSPreviewWindow.ReportLink <> nil then
  begin
    cmdPaperSizes.ItemIndex := cmdPaperSizes.Items.IndexOfObject(TObject(PSPreviewWindow.PrinterPage.DMPaper));
    if GetPaperInfo(PSPreviewWindow.PrinterPage.DMPaper, APaperInfo) then
    begin
      btnPaperSize.Caption := APaperInfo.Name;
      btnPaperSize.Description := Format('%0.2f x %0.2f mm', [APaperInfo.Width / 10, APaperInfo.Height / 10]);
    end;
  end;
end;

procedure TATdxNativePrintPaneFrame._RebuildCollateList;
var
  Idx: Integer;
begin
  Idx := cmdCollation.ItemIndex;

  cmdCollation.Items.Clear;
  cmdCollation.Items.Add(CollateCaption);
  cmdCollation.Items.Add(UncollateCaption);

  cmdCollation.ItemIndex := Idx;

  _UpdateCollateButton;
end;

procedure TATdxNativePrintPaneFrame._RebuildOrientationList;
var
  Idx: Integer;
begin
  Idx := cmdPageOrientation.ItemIndex;

  cmdPageOrientation.Items.Clear;
  cmdPageOrientation.Items.Add(PortraitCaption);
  cmdPageOrientation.Items.Add(LandscapeCaption);
  cmdPageOrientation.Items.Add(OrientAutoCaption);

  cmdPageOrientation.ItemIndex := Idx;

  _UpdateOrientationButton;
end;

procedure TATdxNativePrintPaneFrame._RebuildPrintRangeList;
var
  Idx: Integer;
begin
  Idx := cmdPrintRanges.ItemIndex;

  cmdPrintRanges.Items.Clear;
  cmdPrintRanges.Items.Add(AllPagesCaption);
  cmdPrintRanges.Items.Add(SinglePageCaption);
  cmdPrintRanges.Items.Add(CustomPageCaption);

  cmdPrintRanges.ItemIndex := Idx;

  _UpdatePrintRangeButton;
end;

procedure TATdxNativePrintPaneFrame._RichEditUpdateControlsHandler(Sender:
    TObject);
var
  APaperInfo: TdxPaperInfo;
begin
  cmdPrinters.ItemIndex := dxPrintDevice.PrinterIndex;
  btnPrinter.Caption := dxPrintDevice.CurrentDevice;
  btnPrint.Enabled := PSPreviewWindow.CanPrint;
  btnPrintPages.Enabled := True;
  btnPrintCollate.Enabled := True;
  txtPrintRange.Enabled := True;

  lblitmPageSetup.Visible := False;
  lblitmPageSetup.Enabled := False;

  lblitmPrinterProperties.Enabled := PSPreviewWindow.CanPrintDialog;

  sePrintCopies.Properties.MaxValue := dxPrintDevice.MaxCopies;
  sePrintCopies.Properties.MinValue := 1;
  sePrintCopies.Enabled := sePrintCopies.Properties.MaxValue > 1;
  _UpdatePrintRangeButton;

  // Page Orientation
  layitmPageOrientation.Visible := False;
  btnPageOrientation.Enabled := False;
  if PSPreviewWindow.ReportLink <> nil then
    cmdPageOrientation.ItemIndex := Ord(PSPreviewWindow.PrinterPage.Orientation);
  _UpdateOrientationButton;

  // Paper Size
  layitmPaperSize.Visible := False;
  PopulatePaperSizes;
  btnPaperSize.Enabled := False;
  if PSPreviewWindow.ReportLink <> nil then
  begin
    cmdPaperSizes.ItemIndex := cmdPaperSizes.Items.IndexOfObject(TObject(PSPreviewWindow.PrinterPage.DMPaper));
    if GetPaperInfo(PSPreviewWindow.PrinterPage.DMPaper, APaperInfo) then
    begin
      btnPaperSize.Caption := APaperInfo.Name;
      btnPaperSize.Description := Format('%0.2f x %0.2f mm', [APaperInfo.Width / 10, APaperInfo.Height / 10]);
    end;
  end;
end;

procedure TATdxNativePrintPaneFrame._UpdateCollateButton;
const
  cDescriptions: array[Boolean] of string = (
    '1,2,3    1,2,3    1,2,3',
    '1,1,1    2,2,2    3,3,3'
  );
var
  ACaption: String;
  ADescr: String;
  AImgIdx: Integer;
  Idx: Integer;
begin
  Idx := cmdCollation.ItemIndex;

  case Idx of
    0 : begin
          ACaption := CollateCaption;
          AImgIdx := CollateImageIndex;
        end;
    1 : begin
          ACaption := UncollateCaption;
          AImgIdx := UncollateImageIndex;
        end;
  else
    exit;
  end;

  ADescr := cDescriptions[Idx = 1];

  btnPrintCollate.Caption := ACaption;
  btnPrintCollate.Description := ADescr;
  btnPrintCollate.OptionsImage.ImageIndex := AImgIdx;
end;

procedure TATdxNativePrintPaneFrame._UpdateOrientationButton;
var
  AImgIdx: Integer;
  Idx: Integer;
begin

  Idx := cmdPageOrientation.ItemIndex;

  btnPageOrientation.Caption := cmdPageOrientation.Items[Idx];

  case Idx of
    0 : AImgIdx := OrientPortraitImageIndex;
    1 : AImgIdx := OrientLandscapeImageIndex;
    2 : AImgIdx := OrientAutoImageIndex;
  else
    exit;
  end;

  btnPageOrientation.OptionsImage.ImageIndex := AImgIdx;

end;

procedure TATdxNativePrintPaneFrame._UpdatePrintRangeButton;
var
  AImgIdx: Integer;
  Idx: Integer;
begin

  Idx := cmdPrintRanges.ItemIndex;

  btnPrintPages.Caption := cmdPrintRanges.Items[Idx];

  case Idx of
    0 : AImgIdx := AllPagesImageIndex;
    1 : AImgIdx := SinglePageImageIndex;
    2 : AImgIdx := CustomPageImageIndex;
  else
    exit;
  end;

  btnPrintPages.OptionsImage.ImageIndex := AImgIdx;

end;

end.
