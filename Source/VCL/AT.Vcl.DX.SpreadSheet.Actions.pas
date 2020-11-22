unit AT.Vcl.DX.SpreadSheet.Actions;

interface

uses
  System.Classes,
  AT.Vcl.DX.SpreadSheet.ActionsTypes,
  cxClasses,
  dxSpreadSheetCoreStyles, dxGDIPlusClasses, dxCoreGraphics,
  dxSpreadSheetCore, dxSpreadSheetActions, dxSpreadSheetContainers;


type
  TATdxSpreadSheetCustomNumberFormatAction = class(TdxSpreadSheetCustomFormatCellsAction)
  protected
    FFormatCodeID: Integer;
    procedure DoExecute; override;
    procedure DoResetState; override;
    procedure DoUpdateState; override;
  published
    property AutoCheck default True;
  end;

  TATdxSpreadSheetCustomFormatCellsDialogAction = class(
      TdxSpreadSheetCustomFormatCellsAction)
  protected
    FDialogPage: Integer;
    procedure DoExecute; override;
  end;

  TATdxSpreadSheetNumberFormatGeneralAction = class(TATdxSpreadSheetCustomNumberFormatAction)
  public
    constructor Create(AOwner: TComponent); override;
  end;

  TATdxSpreadSheetNumberFormatNumberAction = class(TATdxSpreadSheetCustomNumberFormatAction)
  public
    constructor Create(AOwner: TComponent); override;
  end;

  TATdxSpreadSheetNumberFormatCurrencyAction = class(TATdxSpreadSheetCustomNumberFormatAction)
  public
    constructor Create(AOwner: TComponent); override;
  end;

  TATdxSpreadSheetNumberFormatAccountingAction = class(TATdxSpreadSheetCustomNumberFormatAction)
  public
    constructor Create(AOwner: TComponent); override;
  end;

  TATdxSpreadSheetNumberFormatDateAction = class(TATdxSpreadSheetCustomNumberFormatAction)
  public
    constructor Create(AOwner: TComponent); override;
  end;

  TATdxSpreadSheetNumberFormatTimeAction = class(TATdxSpreadSheetCustomNumberFormatAction)
  public
    constructor Create(AOwner: TComponent); override;
  end;

  TATdxSpreadSheetNumberFormatPercentAction = class(TATdxSpreadSheetCustomNumberFormatAction)
  public
    constructor Create(AOwner: TComponent); override;
  end;

  TATdxSpreadSheetNumberFormatFractionAction = class(TATdxSpreadSheetCustomNumberFormatAction)
  public
    constructor Create(AOwner: TComponent); override;
  end;

  TATdxSpreadSheetNumberFormatScientificAction = class(TATdxSpreadSheetCustomNumberFormatAction)
  public
    constructor Create(AOwner: TComponent); override;
  end;

  TATdxSpreadSheetNumberFormatTextAction = class(TATdxSpreadSheetCustomNumberFormatAction)
  public
    constructor Create(AOwner: TComponent); override;
  end;

  TATdxSpreadSheetFormatCellsNumberDialogAction = class(TATdxSpreadSheetCustomFormatCellsDialogAction)
  public
    constructor Create(AOwner: TComponent); override;
  end;

  TATdxSpreadSheetFormatCellsAlignDialogAction = class(TATdxSpreadSheetCustomFormatCellsDialogAction)
  public
    constructor Create(AOwner: TComponent); override;
  end;

  TATdxSpreadSheetFormatCellsFontDialogAction = class(TATdxSpreadSheetCustomFormatCellsDialogAction)
  public
    constructor Create(AOwner: TComponent); override;
  end;

  TATdxSpreadSheetFormatCellsFillDialogAction = class(TATdxSpreadSheetCustomFormatCellsDialogAction)
  public
    constructor Create(AOwner: TComponent); override;
  end;

  TATdxSpreadSheetFormatCellsProtectDialogAction = class(TATdxSpreadSheetCustomFormatCellsDialogAction)
  public
    constructor Create(AOwner: TComponent); override;
  end;

  TATdxSpreadSheetInsertCells = class(TdxSpreadSheetCustomEditAction)
  protected
    procedure DoExecute; override;
    function IsEnabled: Boolean; override;
  public
    constructor Create(AOwner: TComponent); override;
  end;

  TATdxSpreadSheetDeleteCells = class(TdxSpreadSheetAction)
  protected
    procedure DoExecute; override;
    function IsEnabled: Boolean; override;
  public
    constructor Create(AOwner: TComponent); override;
  end;

  TATdxSpreadSheetLockCells = class(
      TdxSpreadSheetCustomFormatCellsAction)
  protected
    procedure DoExecute; override;
    procedure DoResetState; override;
    procedure DoUpdateState; override;
  public
    constructor Create(AOwner: TComponent); override;
  end;

  TATdxSpreadSheetProtectSheet = class(TdxSpreadSheetProtectSheet)
  strict private
    FProtectCaption: string;
    FUnprotectCaption: string;
  protected
    procedure DoUpdateState; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property ProtectCaption: string read FProtectCaption write FProtectCaption;
    property UnprotectCaption: string read FUnprotectCaption write
        FUnprotectCaption;
  end;

  TATdxSpreadSheetProtectWorkbook = class(TdxSpreadSheetProtectWorkbook)
  strict private
    FProtectCaption: string;
    FUnprotectCaption: string;
  protected
    procedure DoUpdateState; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property ProtectCaption: string read FProtectCaption write FProtectCaption;
    property UnprotectCaption: string read FUnprotectCaption write
        FUnprotectCaption;
  end;

  TATdxSpreadSheetFillData = class(TdxSpreadSheetAction)
  strict private
    FFillDir: TcxDirection;
  protected
    procedure DoExecute; override;
    function IsEnabled: Boolean; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property FillDir: TcxDirection read FFillDir write FFillDir default dirNone;
  end;

  TATdxSpreadSheetFindAndReplace = class(TdxSpreadSheetAction)
  strict private
    FDialogPage: TATdxFindReplacePage;
  protected
    procedure DoExecute; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property DialogPage: TATdxFindReplacePage read FDialogPage write FDialogPage default frpFind;
  end;

  TATdxSpreadSheetSelectAll = class(TdxSpreadSheetAction)
  protected
    procedure DoExecute; override;
  public
    constructor Create(AOwner: TComponent); override;
  end;

  TATdxSpreadSheetSelectNone = class(TdxSpreadSheetAction)
  protected
    procedure DoExecute; override;
    function IsEnabled: Boolean; override;
  public
    constructor Create(AOwner: TComponent); override;
  end;

  TATdxSpreadSheetInsertFunction = class(TdxSpreadSheetAction)
  protected
    procedure DoExecute; override;
  public
    constructor Create(AOwner: TComponent); override;
  end;

  TATdxSpreadSheetPasteSpecial = class(TdxSpreadSheetAction)
  protected
    procedure DoExecute; override;
    function IsEnabled: Boolean; override;
  public
    constructor Create(AOwner: TComponent); override;
  end;

  TATdxSpreadSheetRenameSheet = class(TdxSpreadSheetAction)
  protected
    procedure DoExecute; override;
    function IsEnabled: Boolean; override;
  public
    constructor Create(AOwner: TComponent); override;
  end;

  TATdxSpreadSheetHistoryInsertTextBoxAction = class(TdxSpreadSheetHistoryAction)
  protected
    class function GetDescription: String; override;
  end;

  TATdxSpreadSheetHistoryEditTextBoxAction = class(TdxSpreadSheetHistoryAction)
  protected
    class function GetDescription: String; override;
  end;

  TATdxSpreadSheetCustomTextBoxAction = class(TdxSpreadSheetCustomContainerAction)
  strict private
    FDefaultAlignHorz: TAlignment;
    FDefaultAlignVert: TVerticalAlignment;
    FDefaultBrush: TdxGPBrush;
    FDefaultPen: TdxGPPen;
    FShapeType: TdxSpreadSheetShapeType;
  strict protected
    function CanEditTextBox: Boolean;
    function FindTextBoxContainer(ACell: TdxSpreadSheetCell; out AContainer:
        TdxSpreadSheetContainer): Boolean;
    procedure HistoryBeginAction(AHistory: TdxSpreadSheetHistory); virtual;
  protected
    procedure DoExecute; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property DefaultBrush: TdxGPBrush read FDefaultBrush write FDefaultBrush;
    property DefaultPen: TdxGPPen read FDefaultPen write FDefaultPen;
  published
    property DefaultAlignHorz: TAlignment read FDefaultAlignHorz write
        FDefaultAlignHorz default taCenter;
    property DefaultAlignVert: TVerticalAlignment read FDefaultAlignVert write
        FDefaultAlignVert default taVerticalCenter;
    property ShapeType: TdxSpreadSheetShapeType read FShapeType write FShapeType default stRect;
  end;

  TATdxSpreadSheetInsertTextBox = class(TATdxSpreadSheetCustomTextBoxAction)
  protected
    function IsEnabled: Boolean; override;
  public
    constructor Create(AOwner: TComponent); override;
  end;

  TATdxSpreadSheetEditTextBox = class(TATdxSpreadSheetCustomTextBoxAction)
  strict protected
    procedure HistoryBeginAction(AHistory: TdxSpreadSheetHistory); override;
  protected
    function IsEnabled: Boolean; override;
  public
    constructor Create(AOwner: TComponent); override;
  end;

  TATdxSpreadSheetHistoryInsertShapeAction = class(TdxSpreadSheetHistoryAction)
  protected
    class function GetDescription: String; override;
  end;

  TATdxSpreadSheetHistoryEditShapeAction = class(TdxSpreadSheetHistoryAction)
  protected
    class function GetDescription: String; override;
  end;

  TATdxSpreadSheetCustomShapeAction = class(TdxSpreadSheetCustomContainerAction)
  strict private
    FDefaultBrush: TdxGPBrush;
    FDefaultPen: TdxGPPen;
    FShapeType: TdxSpreadSheetShapeType;
  strict protected
    function CanEditShape: Boolean;
    function FindShapeContainer(ACell: TdxSpreadSheetCell; out AContainer:
        TdxSpreadSheetContainer): Boolean;
    procedure HistoryBeginAction(AHistory: TdxSpreadSheetHistory); virtual;
  protected
    procedure DoExecute; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property DefaultBrush: TdxGPBrush read FDefaultBrush write FDefaultBrush;
    property DefaultPen: TdxGPPen read FDefaultPen write FDefaultPen;
  published
    property ShapeType: TdxSpreadSheetShapeType read FShapeType write FShapeType default stRect;
  end;

  TATdxSpreadSheetInsertShape = class(TATdxSpreadSheetCustomShapeAction)
  protected
    function IsEnabled: Boolean; override;
  public
    constructor Create(AOwner: TComponent); override;
  end;

  TATdxSpreadSheetEditShape = class(TATdxSpreadSheetCustomShapeAction)
  strict protected
    procedure HistoryBeginAction(AHistory: TdxSpreadSheetHistory); override;
  protected
    function IsEnabled: Boolean; override;
  public
    constructor Create(AOwner: TComponent); override;
  end;

  TATdxSpreadSheetHistoryInsertPictureAction = class(TdxSpreadSheetHistoryAction)
  protected
    class function GetDescription: String; override;
  end;

  TATdxSpreadSheetHistoryEditPictureAction = class(TdxSpreadSheetHistoryAction)
  protected
    class function GetDescription: String; override;
  end;

  TATdxSpreadSheetCustomPictureAction = class(TdxSpreadSheetCustomContainerAction)
  strict private
    FDefaultBrush: TdxGPBrush;
    FDefaultPen: TdxGPPen;
    FShapeType: TdxSpreadSheetShapeType;
  strict protected
    function AddPictureContainer(AWidth, AHeight: Integer):
        TdxSpreadSheetPictureContainer;
    function CanEditPicture: Boolean;
    procedure DoInsertPictureFromFile(const AFileName: string);
    function FindPictureContainer(ACell: TdxSpreadSheetCell; out AContainer:
        TdxSpreadSheetContainer): Boolean;
    procedure HistoryBeginAction(AHistory: TdxSpreadSheetHistory); virtual;
  protected
    procedure DoExecute; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property DefaultBrush: TdxGPBrush read FDefaultBrush write FDefaultBrush;
    property DefaultPen: TdxGPPen read FDefaultPen write FDefaultPen;
  published
    property ShapeType: TdxSpreadSheetShapeType read FShapeType write FShapeType default stRect;
  end;

  TATdxSpreadSheetInsertPicture = class(TATdxSpreadSheetCustomPictureAction)
  protected
    function IsEnabled: Boolean; override;
  public
    constructor Create(AOwner: TComponent); override;
  end;

  TATdxSpreadSheetEditPicture = class(TATdxSpreadSheetCustomPictureAction)
  strict protected
    procedure HistoryBeginAction(AHistory: TdxSpreadSheetHistory); override;
  protected
    function IsEnabled: Boolean; override;
  public
    constructor Create(AOwner: TComponent); override;
  end;

  TATdxSpreadSheetGridlinesPrint = class(TdxSpreadSheetAction)
  protected
    procedure DoExecute; override;
    procedure DoUpdateState; override;
  public
    constructor Create(AOwner: TComponent); override;
  end;

  TATdxSpreadSheetGridlinesView = class(TdxSpreadSheetAction)
  protected
    procedure DoExecute; override;
    procedure DoUpdateState; override;
  public
    constructor Create(AOwner: TComponent); override;
  end;

  TATdxSpreadSheetHeadingsPrint = class(TdxSpreadSheetAction)
  protected
    procedure DoExecute; override;
    procedure DoUpdateState; override;
  public
    constructor Create(AOwner: TComponent); override;
  end;

  TATdxSpreadSheetHeadingsView = class(TdxSpreadSheetAction)
  protected
    procedure DoExecute; override;
    procedure DoUpdateState; override;
  public
    constructor Create(AOwner: TComponent); override;
  end;

  TATdxSpreadSheetShowFormulas = class(TdxSpreadSheetAction)
  protected
    procedure DoExecute; override;
    procedure DoUpdateState; override;
  public
    constructor Create(AOwner: TComponent); override;
  end;

  TATdxSpreadSheetAutoCalc = class(TdxSpreadSheetAction)
  protected
    procedure DoExecute; override;
    procedure DoUpdateState; override;
  public
    constructor Create(AOwner: TComponent); override;
  end;

  TATdxSpreadSheetCalcStatus = class(TdxSpreadSheetAction)
  protected
    procedure DoExecute; override;
    procedure DoUpdateState; override;
  public
    constructor Create(AOwner: TComponent); override;
  end;

  TATdxSpreadSheetCalcNow = class(TdxSpreadSheetAction)
  protected
    procedure DoExecute; override;
  public
    constructor Create(AOwner: TComponent); override;
  end;






implementation

uses
  System.Types, System.SysUtils, System.UITypes,
  Vcl.Dialogs, Vcl.ExtDlgs,
  AT.Vcl.DX.SpreadSheet.ActionsStrs,
  cxEdit,
  dxInputDialogs, dxSpreadSheetActionsStrs, dxSpreadSheetStrs,
  dxSpreadSheetFunctions, dxSpreadSheetContainerCustomizationDialog,
  dxSpreadSheetFindAndReplaceDialog, dxCore, dxSpreadSheetCoreStrs,
  dxSpreadSheetFormatCellsDialog, dxSpreadSheetPasteSpecialDialog,
  dxSpreadSheetStyles, dxSpreadSheetClasses, dxSpreadSheetInplaceEdit,
  dxSpreadSheetFormulasHelpers, dxSpreadSheetInsertFunctionDialog;

procedure TATdxSpreadSheetCustomNumberFormatAction.DoExecute;
begin
  ProcessSelectedCellStyles( procedure
      (ACellStyle: TdxSpreadSheetCellStyle; ARow, AColumn: Integer;
       const AArea: TRect)
      begin
        if (Checked) then
          ACellStyle.DataFormat.FormatCodeID := FFormatCodeID
        else
          ACellStyle.DataFormat.FormatCodeID := $00;
      end);
end;

procedure TATdxSpreadSheetCustomNumberFormatAction.DoResetState;
begin
  inherited DoResetState;

  Checked := False;
end;

procedure TATdxSpreadSheetCustomNumberFormatAction.DoUpdateState;
begin
  inherited;

  Checked := (ActiveCellStyle.DataFormat.FormatCodeID = FFormatCodeID);
end;

procedure TATdxSpreadSheetCustomFormatCellsDialogAction.DoExecute;
begin
  ShowFormatCellsDialog(ActiveTable, FDialogPage);
end;

constructor TATdxSpreadSheetNumberFormatGeneralAction.Create(
  AOwner: TComponent);
begin
  inherited Create(AOwner);

  AutoCheck := True;

  FDefaultCaptionResString := @sATdxSpreadSheetActionNumberGeneralCaption;
  FDefaultHintResString := @sATdxSpreadSheetActionNumberGeneralHint;
  FDefaultImageNameInIconLibrary := '';

  FFormatCodeID := $00;
end;

constructor TATdxSpreadSheetNumberFormatNumberAction.Create(
  AOwner: TComponent);
begin
  inherited Create(AOwner);

  AutoCheck := True;

  FDefaultCaptionResString := @sATdxSpreadSheetActionNumberNumberCaption;
  FDefaultHintResString := @sATdxSpreadSheetActionNumberNumberHint;
  FDefaultImageNameInIconLibrary := '';

  FFormatCodeID := $02;
end;

constructor TATdxSpreadSheetNumberFormatCurrencyAction.Create(
  AOwner: TComponent);
begin
  inherited Create(AOwner);

  AutoCheck := True;

  FDefaultCaptionResString := @sATdxSpreadSheetActionNumberCurrencyCaption;
  FDefaultHintResString := @sATdxSpreadSheetActionNumberCurrencyHint;
  FDefaultImageNameInIconLibrary := '';

  FFormatCodeID := $05;
end;

constructor TATdxSpreadSheetNumberFormatAccountingAction.Create(
  AOwner: TComponent);
begin
  inherited Create(AOwner);

  AutoCheck := True;

  FDefaultCaptionResString := @sATdxSpreadSheetActionNumberAccountingCaption;
  FDefaultHintResString := @sATdxSpreadSheetActionNumberAccountingHint;
  FDefaultImageNameInIconLibrary := '';

  FFormatCodeID := $29;
end;

constructor TATdxSpreadSheetNumberFormatDateAction.Create(
  AOwner: TComponent);
begin
  inherited Create(AOwner);

  AutoCheck := True;

  FDefaultCaptionResString := @sATdxSpreadSheetActionNumberDateCaption;
  FDefaultHintResString := @sATdxSpreadSheetActionNumberDateHint;
  FDefaultImageNameInIconLibrary := '';

  FFormatCodeID := $0E;
end;

constructor TATdxSpreadSheetNumberFormatTimeAction.Create(
  AOwner: TComponent);
begin
  inherited Create(AOwner);

  AutoCheck := True;

  FDefaultCaptionResString := @sATdxSpreadSheetActionNumberTimeCaption;
  FDefaultHintResString := @sATdxSpreadSheetActionNumberTimeHint;
  FDefaultImageNameInIconLibrary := '';

  FFormatCodeID := $12;
end;

constructor TATdxSpreadSheetNumberFormatPercentAction.Create(
  AOwner: TComponent);
begin
  inherited Create(AOwner);

  AutoCheck := True;

  FDefaultCaptionResString := @sATdxSpreadSheetActionNumberPercentCaption;
  FDefaultHintResString := @sATdxSpreadSheetActionNumberPercentHint;
  FDefaultImageNameInIconLibrary := '';

  FFormatCodeID := $0A;
end;

constructor TATdxSpreadSheetNumberFormatFractionAction.Create(
  AOwner: TComponent);
begin
  inherited Create(AOwner);

  AutoCheck := True;

  FDefaultCaptionResString := @sATdxSpreadSheetActionNumberFractionCaption;
  FDefaultHintResString := @sATdxSpreadSheetActionNumberFractionHint;
  FDefaultImageNameInIconLibrary := '';

  FFormatCodeID := $0C;
end;

constructor TATdxSpreadSheetNumberFormatScientificAction.Create(
  AOwner: TComponent);
begin
  inherited Create(AOwner);

  AutoCheck := True;

  FDefaultCaptionResString := @sATdxSpreadSheetActionNumberScientificCaption;
  FDefaultHintResString := @sATdxSpreadSheetActionNumberScientificHint;
  FDefaultImageNameInIconLibrary := '';

  FFormatCodeID := $0B;
end;

constructor TATdxSpreadSheetNumberFormatTextAction.Create(
  AOwner: TComponent);
begin
  inherited Create(AOwner);

  AutoCheck := True;

  FDefaultCaptionResString := @sATdxSpreadSheetActionNumberTextCaption;
  FDefaultHintResString := @sATdxSpreadSheetActionNumberTextHint;
  FDefaultImageNameInIconLibrary := '';

  FFormatCodeID := $31;
end;

constructor TATdxSpreadSheetFormatCellsNumberDialogAction.Create(
  AOwner: TComponent);
begin
  inherited Create(AOwner);

  FDefaultCaptionResString := @sATdxSpreadSheetActionNumberDialogCaption;
  FDefaultHintResString := @sATdxSpreadSheetActionNumberDialogHint;

  FDialogPage := 0;
end;

constructor TATdxSpreadSheetFormatCellsAlignDialogAction.Create(
  AOwner: TComponent);
begin
  inherited Create(AOwner);

  FDefaultCaptionResString := @sATdxSpreadSheetActionAlignDialogCaption;
  FDefaultHintResString := @sATdxSpreadSheetActionAlignDialogHint;

  FDialogPage := 1;
end;

constructor TATdxSpreadSheetFormatCellsFontDialogAction.Create(
  AOwner: TComponent);
begin
  inherited Create(AOwner);

  FDefaultCaptionResString := @sATdxSpreadSheetActionFontDialogCaption;
  FDefaultHintResString := @sATdxSpreadSheetActionFontDialogHint;

  FDialogPage := 2;
end;

constructor TATdxSpreadSheetFormatCellsFillDialogAction.Create(
  AOwner: TComponent);
begin
  inherited Create(AOwner);

  FDefaultCaptionResString := @sATdxSpreadSheetActionFillDialogCaption;
  FDefaultHintResString := @sATdxSpreadSheetActionFillDialogHint;

  FDialogPage := 4;
end;

constructor TATdxSpreadSheetFormatCellsProtectDialogAction.Create(
  AOwner: TComponent);
begin
  inherited Create(AOwner);

  FDefaultCaptionResString := @sATdxSpreadSheetActionCellProtectDialogCaption;
  FDefaultHintResString := @sATdxSpreadSheetActionCellProtectDialogHint;

  FDialogPage := 5;
end;

constructor TATdxSpreadSheetInsertCells.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  FDefaultCaptionResString := @sATdxSpreadSheetActionInsertCellsCaption;
  FDefaultHintResString := @sATdxSpreadSheetActionInsertCellsHint;
end;

procedure TATdxSpreadSheetInsertCells.DoExecute;
begin
  if (ActiveSelection.Count <> 1) then
    raise EdxSpreadSheetError.Create(cxGetResourceString(@sdxErrorInvalidSelection));

  ActiveTable.InsertCells;
end;

function TATdxSpreadSheetInsertCells.IsEnabled: Boolean;
begin
  Result := inherited IsEnabled;

  Result := ( Result AND (ActiveTable.CanInsert) );
end;

constructor TATdxSpreadSheetDeleteCells.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  FDefaultCaptionResString := @sATdxSpreadSheetActionDeleteCellsCaption;
  FDefaultHintResString := @sATdxSpreadSheetActionDeleteCellsHint;
end;

procedure TATdxSpreadSheetDeleteCells.DoExecute;
begin
  if (ActiveSelection.Count <> 1) then
    raise EdxSpreadSheetError.Create(cxGetResourceString(@sdxErrorInvalidSelection));

  ActiveTable.DeleteCells;
end;

function TATdxSpreadSheetDeleteCells.IsEnabled: Boolean;
begin
  Result := inherited IsEnabled;

  Result := ( Result AND (ActiveTable.CanDelete) );
end;

constructor TATdxSpreadSheetLockCells.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  FDefaultCaptionResString := @sATdxSpreadSheetActionLockCellsCaption;
  FDefaultHintResString := @sATdxSpreadSheetActionLockCellsHint;
end;

procedure TATdxSpreadSheetLockCells.DoExecute;
begin
  ProcessSelectedCellStyles( procedure
      (ACellStyle: TdxSpreadSheetCellStyle; ARow, AColumn: Integer;
       const AArea: TRect)
      begin
        ACellStyle.Locked := Checked;
      end);
end;

procedure TATdxSpreadSheetLockCells.DoResetState;
begin
  inherited DoResetState;

  Checked := False;
end;

procedure TATdxSpreadSheetLockCells.DoUpdateState;
begin
  inherited;

  Checked := ActiveCellStyle.Locked;
end;

constructor TATdxSpreadSheetProtectSheet.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  FProtectCaption := sATdxSpreadSheetActionProtectSheetCaption;
  FUnprotectCaption := sATdxSpreadSheetActionUnprotectSheetCaption;
end;

procedure TATdxSpreadSheetProtectSheet.DoUpdateState;
begin
  inherited DoUpdateState;

  if (Checked) then
    Caption := FUnprotectCaption
  else
    Caption := FProtectCaption;
end;

constructor TATdxSpreadSheetProtectWorkbook.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  FProtectCaption := sATdxSpreadSheetActionProtectWorkbookCaption;
  FUnprotectCaption := sATdxSpreadSheetActionUnprotectWorkbookCaption;
end;

procedure TATdxSpreadSheetProtectWorkbook.DoUpdateState;
begin
  inherited DoUpdateState;

  if (Checked) then
    Caption := FUnprotectCaption
  else
    Caption := FProtectCaption;
end;

constructor TATdxSpreadSheetFillData.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  FFillDir := dirNone;
end;

procedure TATdxSpreadSheetFillData.DoExecute;
begin
  if (ActiveSelection.Count <> 1) then
    raise EdxSpreadSheetError.Create(cxGetResourceString(@sdxErrorInvalidSelection));

  var AArea := ActiveSelection.Items[0];

  var ACols := AArea.Right - AArea.Left;
  var ARows := AArea.Bottom - AArea.Top;

  case FFillDir of
    dirNone: exit;

    dirLeft,
    dirRight: begin
      if (ACols < 1) then
        exit;
    end;

    dirUp,
    dirDown: begin
      if (ARows < 1) then
        exit;
    end;
  else
    exit;
  end;

  var ACount := 0;

  case FFillDir of
    dirLeft,
    dirRight: ACount := ACols;

    dirUp,
    dirDown: ACount := ARows;
  end;

  var ASrcArea: TRect;

  case FFillDir of
    dirLeft: ASrcArea := TRect.Create(AArea.Right, AArea.Top, AArea.Right, AArea.Bottom);
    dirRight: ASrcArea := TRect.Create(AArea.Left, AArea.Top, AArea.Left, AArea.Bottom);
    dirUp: ASrcArea := TRect.Create(AArea.Left, AArea.Bottom, AArea.Right, AArea.Bottom);
    dirDown: ASrcArea := TRect.Create(AArea.Left, AArea.Top, AArea.Right, AArea.Top);
  end;

  if (ACount > 0) then
    ActiveTable.FillData(ASrcArea, FFillDir, ACount);
end;

function TATdxSpreadSheetFillData.IsEnabled: Boolean;
begin
  Result := inherited IsEnabled;

  Result := ( Result AND (ActiveTable.CanFillData) );

  if (NOT Result) then
    exit(Result);

  var AArea := ActiveSelection.Items[0];

  case FFillDir of
    dirNone: exit(False);

    dirLeft,
    dirRight: begin
      var ALeft := AArea.Left;
      var ARight := AArea.Right;

      var ACols := ARight - ALeft;

      Result := (ACols >= 1);
    end;

    dirUp,
    dirDown: begin
      var ATop := AArea.Top;
      var ABottom := AArea.Bottom;

      var ARows := ABottom - ATop;

      Result := (ARows >= 1);
    end;
  else
    Result := False;
  end;
end;

constructor TATdxSpreadSheetFindAndReplace.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  FDefaultCaptionResString := @sdxSpreadSheetActionFindAndReplaceCaption;
  FDefaultHintResString := @sdxSpreadSheetActionFindAndReplaceHint;
  FIsSelectionNeeded := False;
end;

procedure TATdxSpreadSheetFindAndReplace.DoExecute;
begin
  ShowFindAndReplaceDialog(Control, Ord(FDialogPage));
end;

constructor TATdxSpreadSheetSelectAll.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  FDefaultCaptionResString := @sATdxSpreadSheetActionSelectAllCaption;
  FDefaultHintResString := @sATdxSpreadSheetActionSelectAllHint;
end;

procedure TATdxSpreadSheetSelectAll.DoExecute;
begin
  ActiveTable.Selection.SelectAll;
end;

constructor TATdxSpreadSheetSelectNone.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  FDefaultCaptionResString := @sATdxSpreadSheetActionSelectNoneCaption;
  FDefaultHintResString := @sATdxSpreadSheetActionSelectNoneHint;
end;

procedure TATdxSpreadSheetSelectNone.DoExecute;
begin
  var ACurrCol := ActiveTable.Selection.FocusedColumn;
  var ACurrRow := ActiveTable.Selection.FocusedRow;

  ActiveTable.Selection.Clear;

  ActiveTable.Selection.SelectCell(ACurrRow, ACurrCol);
end;

function TATdxSpreadSheetSelectNone.IsEnabled: Boolean;
begin
  Result := inherited IsEnabled;

  Result := ( Result AND (ActiveTable.Selection.Count > 0) );
end;

constructor TATdxSpreadSheetInsertFunction.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  FDefaultCaptionResString := @sATdxSpreadSheetActionInsertFunctionCaption;
  FDefaultHintResString := @sATdxSpreadSheetActionInsertFunctionHint;
end;

procedure TATdxSpreadSheetInsertFunction.DoExecute;
begin
  var AInfo: TdxSpreadSheetFunctionInfo;

  if (NOT ShowInsertFunctionDialog(Control, AInfo)) then
    exit;

  var AEditingController: TdxSpreadSheetTableViewEditingController;
  AEditingController := ActiveTable.Controller.EditingController;

  var AInplaceEdit: TdxSpreadSheetCustomInplaceEdit;
  var AEdit: TcxCustomEdit;

  if (NOT AEditingController.GetActualInplaceEdit(ActiveTable, AInplaceEdit) ) then
    begin
      ActiveTable.Controller.FocusedContainer := NIL;
      ActiveTable.ShowEdit;
      AEdit := AEditingController.Edit;
    end
  else
    begin
      AEdit := (AInplaceEdit AS TcxCustomEdit);
    end;

  if (Assigned(AEdit)) then
    begin
      TdxModifyFormulasHelper.Insert(AInfo.Name, AEdit);
    end;
end;

constructor TATdxSpreadSheetPasteSpecial.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  FDefaultCaptionResString := @sATdxSpreadSheetActionPasteSpecialCaption;
  FDefaultHintResString := @sATdxSpreadSheetActionPasteSpecialHint;
end;

procedure TATdxSpreadSheetPasteSpecial.DoExecute;
begin
  ShowPasteSpecialDialog(Control);
end;

function TATdxSpreadSheetPasteSpecial.IsEnabled: Boolean;
begin
  Result := inherited IsEnabled;

  Result := ( Result AND ActiveTable.CanPasteFromClipboard );
end;

constructor TATdxSpreadSheetRenameSheet.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  FDefaultCaptionResString := @sATdxSpreadSheetActionRenameSheetCaption;
  FDefaultHintResString := @sATdxSpreadSheetActionRenameSheetHint;
end;

procedure TATdxSpreadSheetRenameSheet.DoExecute;
var
  AValue: string;
begin
  AValue := ActiveTable.Caption;

  while True do
  try
    if dxInputQuery(cxGetResourceString(@sdxRenameDialogCaption), cxGetResourceString(@sdxRenameDialogSheetName), AValue) then
    begin
      AValue := Trim(AValue);
      if AValue <> '' then
        ActiveTable.Caption := AValue;
    end;
    Break;
  except
    MessageDlg(cxGetResourceString(@sdxErrorCannotRenameSheet), mtWarning, [mbOK], 0);
  end;
end;

function TATdxSpreadSheetRenameSheet.IsEnabled: Boolean;
begin
  Result := inherited IsEnabled;

  Result := ( Result AND Control.OptionsProtection.ActualAllowChangeStructure );
end;

class function TATdxSpreadSheetHistoryInsertTextBoxAction.GetDescription: String;
begin
  Result := cxGetResourceString(@sATdxtActionInsertTextBox);
end;

class function TATdxSpreadSheetHistoryEditTextBoxAction.GetDescription: String;
begin
  Result := cxGetResourceString(@sATdxtActionEditTextBox);
end;

constructor TATdxSpreadSheetCustomTextBoxAction.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  FShapeType := stRect;

  FDefaultAlignHorz := taCenter;
  FDefaultAlignVert := taVerticalCenter;

  FDefaultPen := TdxGPPen.Create(TdxAlphaColors.Black);

  FDefaultBrush := TdxGPBrush.Create;
  FDefaultBrush.Color := TdxAlphaColors.White;
end;

destructor TATdxSpreadSheetCustomTextBoxAction.Destroy;
begin
  FreeAndNil(FDefaultBrush);
  FreeAndNil(FDefaultPen);

  inherited Destroy;
end;

function TATdxSpreadSheetCustomTextBoxAction.CanEditTextBox: Boolean;
begin
  Result := ActiveTable.CanEditContainers;

  if (NOT Result) then
    exit(Result);

  var ASelection := ActiveTable.Selection;

  var AFocusedContainer := ASelection.FocusedContainer;
  var AFocusedRow := ASelection.FocusedRow;
  var AFocusedColumn := ASelection.FocusedColumn;

  Result := (
      (AFocusedContainer IS TdxSpreadSheetTextBoxContainer) OR
      (AFocusedRow >= 0) AND (AFocusedColumn >= 0) );
end;

procedure TATdxSpreadSheetCustomTextBoxAction.DoExecute;
begin
  if (NOT CanEditTextBox) then
    exit;

  var AHistory := ActiveTable.History;

  HistoryBeginAction(AHistory);

  try

    ActiveTable.BeginUpdate;

    try

      var ASelection := ActiveTable.Selection;
      var AFocusedContainer := ASelection.FocusedContainer;

      if (AFocusedContainer IS TdxSpreadSheetTextBoxContainer) then
        begin
          ShowContainerCustomizationDialog(AFocusedContainer, -1);
        end
      else
        begin

          var AFocusedRow := ASelection.FocusedRow;
          var AFocusedColumn := ASelection.FocusedColumn;

          var AMergedCells := ActiveTable.MergedCells;

          var ACellRect := AMergedCells.CheckCell(AFocusedRow, AFocusedColumn);
          var ACellPos := ACellRect.TopLeft;

          var ACell := ActiveTable.CreateCell(ACellPos.Y, ACellPos.X);

          var AContainers := ActiveTable.Containers;

          var AContainer: TdxSpreadSheetContainer;

          if (FindTextBoxContainer(ACell, AContainer)) then
            begin
              ShowContainerCustomizationDialog(AContainer, -1);
            end
          else
            begin
              AContainer := AContainers.Add(TdxSpreadSheetTextBoxContainer);

              if (NOT Assigned(AContainer)) then
                exit;

              AContainer.AnchorType := catOneCell;

              AContainer.AnchorPoint1.Cell := ACell;

              var ATBContainer := (AContainer AS TdxSpreadSheetTextBoxContainer);

              ATBContainer.Shape.ShapeType := FShapeType;
              ATBContainer.Shape.Pen.Assign(FDefaultPen);
              ATBContainer.Shape.Brush.Assign(FDefaultBrush);

              ATBContainer.TextBox.AutoSize := True;
              ATBContainer.TextBox.AlignHorz := FDefaultAlignHorz;
              ATBContainer.TextBox.AlignVert := FDefaultAlignVert;

              if (NOT ShowContainerCustomizationDialog(AContainer, -1)) then
                begin
                  AContainer.Free;
                end
              else
                begin
                  var AText := ATBContainer.TextBox.TextAsString;

                  if (AText.Trim.IsEmpty) then
                    begin

                      ATBContainer.TextBox.AutoSize := False;

                      var AOffset := TPoint.Create(150, 100);
                      ATBContainer.AnchorPoint2.Offset := AOffset;

                    end;

                  ASelection.BeginUpdate;
                  try
                    ASelection.Clear;
                    ASelection.SelectCell(ACell.RowIndex, ACell.ColumnIndex);
                    ASelection.FocusedContainer := AContainer;
                  finally
                    ASelection.EndUpdate;
                  end;
                end;
            end;

        end;

    finally

      ActiveTable.EndUpdate;

    end;

  finally

    AHistory.EndAction;

  end;
end;

function TATdxSpreadSheetCustomTextBoxAction.FindTextBoxContainer(ACell:
    TdxSpreadSheetCell; out AContainer: TdxSpreadSheetContainer): Boolean;
begin
  Result := False;
  AContainer := NIL;

  var AContainers := ActiveTable.Containers;

  var ACount := AContainers.Count;

  if (ACount < 1) then
    exit(False);

  var Idx : Integer;

  for Idx := 0 to (ACount - 1) do
    begin

      AContainer := AContainers.Items[Idx];

      if (NOT (AContainer IS TdxSpreadSheetTextBoxContainer) ) then
        Continue;

      Result := (AContainer.AnchorPoint1.Cell = ACell);

      if (Result) then
        begin
          exit(Result);
        end
      else
        begin
          AContainer := NIL;
        end;
    end;
end;

procedure TATdxSpreadSheetCustomTextBoxAction.HistoryBeginAction(AHistory:
    TdxSpreadSheetHistory);
begin
  AHistory.BeginAction(TATdxSpreadSheetHistoryInsertTextBoxAction);
end;

constructor TATdxSpreadSheetInsertTextBox.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  FDefaultCaptionResString := @sATdxSpreadSheetActionInsertTextBoxCaption;
  FDefaultHintResString := @sATdxSpreadSheetActionInsertTextBoxHint;
end;

function TATdxSpreadSheetInsertTextBox.IsEnabled: Boolean;
begin
  Result := inherited IsEnabled;

  if (NOT Result) then
    exit(Result);

  var AFocusedContainer := ActiveSelection.FocusedContainer;

  Result := (NOT Assigned(AFocusedContainer));
end;

constructor TATdxSpreadSheetEditTextBox.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  FIsContainerSelectionSupported := True;

  FDefaultCaptionResString := @sATdxSpreadSheetActionEditTextBoxCaption;
  FDefaultHintResString := @sATdxSpreadSheetActionEditTextBoxHint;
end;

procedure TATdxSpreadSheetEditTextBox.HistoryBeginAction(
  AHistory: TdxSpreadSheetHistory);
begin
  AHistory.BeginAction(TATdxSpreadSheetHistoryEditTextBoxAction);
end;

function TATdxSpreadSheetEditTextBox.IsEnabled: Boolean;
begin
  Result := inherited IsEnabled;

  if (NOT Result) then
    exit(Result);

  var AFocusedContainer := ActiveSelection.FocusedContainer;

  Result := ( Assigned(AFocusedContainer) AND
             (AFocusedContainer IS TdxSpreadSheetTextBoxContainer) );
end;

class function TATdxSpreadSheetHistoryInsertShapeAction.GetDescription: String;
begin
  Result := cxGetResourceString(@sATdxtActionInsertShape);
end;

class function TATdxSpreadSheetHistoryEditShapeAction.GetDescription: String;
begin
  Result := cxGetResourceString(@sATdxtActionEditShape);
end;

constructor TATdxSpreadSheetCustomShapeAction.Create(
  AOwner: TComponent);
begin
  inherited Create(AOwner);

  FShapeType := stRect;

  FDefaultPen := TdxGPPen.Create(TdxAlphaColors.Black);

  FDefaultBrush := TdxGPBrush.Create;
  FDefaultBrush.Color := TdxAlphaColors.White;
end;

destructor TATdxSpreadSheetCustomShapeAction.Destroy;
begin
  FreeAndNil(FDefaultBrush);
  FreeAndNil(FDefaultPen);

  inherited Destroy;
end;

function TATdxSpreadSheetCustomShapeAction.CanEditShape: Boolean;
begin
  Result := ActiveTable.CanEditContainers;

  if (NOT Result) then
    exit(Result);

  var ASelection := ActiveTable.Selection;

  var AFocusedContainer := ASelection.FocusedContainer;
  var AFocusedRow := ASelection.FocusedRow;
  var AFocusedColumn := ASelection.FocusedColumn;

  Result := (
      (AFocusedContainer IS TdxSpreadSheetShapeContainer) OR
      (AFocusedRow >= 0) AND (AFocusedColumn >= 0) );
end;

procedure TATdxSpreadSheetCustomShapeAction.DoExecute;
begin
  if (NOT CanEditShape) then
    exit;

  var AHistory := ActiveTable.History;

  HistoryBeginAction(AHistory);

  try

    ActiveTable.BeginUpdate;

    try

      var ASelection := ActiveTable.Selection;
      var AFocusedContainer := ASelection.FocusedContainer;

      if (AFocusedContainer IS TdxSpreadSheetShapeContainer) then
        begin
          ShowContainerCustomizationDialog(AFocusedContainer, -1);
        end
      else
        begin

          var AFocusedRow := ASelection.FocusedRow;
          var AFocusedColumn := ASelection.FocusedColumn;

          var AMergedCells := ActiveTable.MergedCells;

          var ACellRect := AMergedCells.CheckCell(AFocusedRow, AFocusedColumn);
          var ACellPos := ACellRect.TopLeft;

          var ACell := ActiveTable.CreateCell(ACellPos.Y, ACellPos.X);

          var AContainers := ActiveTable.Containers;

          var AContainer: TdxSpreadSheetContainer;

          if (FindShapeContainer(ACell, AContainer)) then
            begin
              ShowContainerCustomizationDialog(AContainer, -1);
            end
          else
            begin
              AContainer := AContainers.Add(TdxSpreadSheetShapeContainer);

              if (NOT Assigned(AContainer)) then
                exit;

              AContainer.AnchorType := catOneCell;

              AContainer.AnchorPoint1.Cell := ACell;

              var AShpContainer := (AContainer AS TdxSpreadSheetShapeContainer);

              AShpContainer.Shape.ShapeType := FShapeType;
              AShpContainer.Shape.Pen.Assign(FDefaultPen);
              AShpContainer.Shape.Brush.Assign(FDefaultBrush);

              var AOffset := TPoint.Create(150, 100);
              AShpContainer.AnchorPoint2.Offset := AOffset;

              if (NOT ShowContainerCustomizationDialog(AContainer, -1)) then
                begin
                  AContainer.Free;
                end
              else
                begin
                  ASelection.BeginUpdate;
                  try
                    ASelection.Clear;
                    ASelection.SelectCell(ACell.RowIndex, ACell.ColumnIndex);
                    ASelection.FocusedContainer := AContainer;
                  finally
                    ASelection.EndUpdate;
                  end;
                end;
            end;

        end;

    finally

      ActiveTable.EndUpdate;

    end;

  finally

    AHistory.EndAction;

  end;
end;

function TATdxSpreadSheetCustomShapeAction.FindShapeContainer(
  ACell: TdxSpreadSheetCell;
  out AContainer: TdxSpreadSheetContainer): Boolean;
begin
  Result := False;
  AContainer := NIL;

  var AContainers := ActiveTable.Containers;

  var ACount := AContainers.Count;

  if (ACount < 1) then
    exit(False);

  var Idx : Integer;

  for Idx := 0 to (ACount - 1) do
    begin

      AContainer := AContainers.Items[Idx];

      if (NOT (AContainer IS TdxSpreadSheetShapeContainer) ) then
        Continue;

      Result := (AContainer.AnchorPoint1.Cell = ACell);

      if (Result) then
        begin
          exit(Result);
        end
      else
        begin
          AContainer := NIL;
        end;
    end;
end;

procedure TATdxSpreadSheetCustomShapeAction.HistoryBeginAction(
  AHistory: TdxSpreadSheetHistory);
begin
  AHistory.BeginAction(TATdxSpreadSheetHistoryInsertShapeAction);
end;

constructor TATdxSpreadSheetInsertShape.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  FDefaultCaptionResString := @sATdxSpreadSheetActionInsertShapeCaption;
  FDefaultHintResString := @sATdxSpreadSheetActionInsertShapeHint;
end;

function TATdxSpreadSheetInsertShape.IsEnabled: Boolean;
begin
  Result := inherited IsEnabled;

  if (NOT Result) then
    exit(Result);

  var AFocusedContainer := ActiveSelection.FocusedContainer;

  Result := (NOT Assigned(AFocusedContainer));
end;

constructor TATdxSpreadSheetEditShape.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  FIsContainerSelectionSupported := True;

  FDefaultCaptionResString := @sATdxSpreadSheetActionEditShapeCaption;
  FDefaultHintResString := @sATdxSpreadSheetActionEditShapeHint;
end;

procedure TATdxSpreadSheetEditShape.HistoryBeginAction(
  AHistory: TdxSpreadSheetHistory);
begin
  AHistory.BeginAction(TATdxSpreadSheetHistoryEditShapeAction);
end;

function TATdxSpreadSheetEditShape.IsEnabled: Boolean;
begin
  Result := inherited IsEnabled;

  if (NOT Result) then
    exit(Result);

  var AFocusedContainer := ActiveSelection.FocusedContainer;

  Result := ( Assigned(AFocusedContainer) AND
             (AFocusedContainer IS TdxSpreadSheetShapeContainer) );
end;

class function TATdxSpreadSheetHistoryInsertPictureAction.GetDescription: String;
begin
  Result := cxGetResourceString(@sATdxtActionInsertPicture);
end;

class function TATdxSpreadSheetHistoryEditPictureAction.GetDescription: String;
begin
  Result := cxGetResourceString(@sATdxtActionEditPicture);
end;

constructor TATdxSpreadSheetCustomPictureAction.Create(
  AOwner: TComponent);
begin
  inherited Create(AOwner);

  FShapeType := stRect;

  FDefaultPen := TdxGPPen.Create(TdxAlphaColors.Transparent);

  FDefaultBrush := TdxGPBrush.Create;
  FDefaultBrush.Color := TdxAlphaColors.Transparent;
end;

destructor TATdxSpreadSheetCustomPictureAction.Destroy;
begin
  FreeAndNil(FDefaultBrush);
  FreeAndNil(FDefaultPen);

  inherited Destroy;
end;

function TATdxSpreadSheetCustomPictureAction.AddPictureContainer(AWidth,
    AHeight: Integer): TdxSpreadSheetPictureContainer;
begin
  Result := TdxSpreadSheetPictureContainer(
      ActiveTable.Containers.Add(TdxSpreadSheetPictureContainer));

  Result.AnchorType := catAbsolute;
  Result.AnchorPoint2.Offset := Point(AWidth, AHeight);
  Result.Shape.ShapeType := FShapeType;
  Result.Shape.Pen.Assign(FDefaultPen);
  Result.Shape.Brush.Assign(FDefaultBrush);
end;

function TATdxSpreadSheetCustomPictureAction.CanEditPicture: Boolean;
begin
  Result := ActiveTable.CanEditContainers;

  if (NOT Result) then
    exit(Result);

  var ASelection := ActiveTable.Selection;

  var AFocusedContainer := ASelection.FocusedContainer;
  var AFocusedRow := ASelection.FocusedRow;
  var AFocusedColumn := ASelection.FocusedColumn;

  Result := (
      (AFocusedContainer IS TdxSpreadSheetPictureContainer) OR
      (AFocusedRow >= 0) AND (AFocusedColumn >= 0) );
end;

procedure TATdxSpreadSheetCustomPictureAction.DoExecute;
begin
  if (NOT CanEditPicture) then
    exit;

  var AHistory := ActiveTable.History;

  HistoryBeginAction(AHistory);

  try

    ActiveTable.BeginUpdate;

    try

      var ASelection := ActiveTable.Selection;
      var AFocusedContainer := ASelection.FocusedContainer;

      if (AFocusedContainer IS TdxSpreadSheetPictureContainer) then
        begin
          ShowContainerCustomizationDialog(AFocusedContainer, -1);
        end
      else
        begin

          var AFocusedRow := ASelection.FocusedRow;
          var AFocusedColumn := ASelection.FocusedColumn;

          var AMergedCells := ActiveTable.MergedCells;

          var ACellRect := AMergedCells.CheckCell(AFocusedRow, AFocusedColumn);
          var ACellPos := ACellRect.TopLeft;

          var ACell := ActiveTable.CreateCell(ACellPos.Y, ACellPos.X);

          var AContainer: TdxSpreadSheetContainer;

          if (FindPictureContainer(ACell, AContainer)) then
            begin
              ShowContainerCustomizationDialog(AContainer, -1);
            end
          else
            begin
              var ADlg := TOpenPictureDialog.Create(NIL);
              try
                ADlg.Title := sATdxActionInsertPictureDlgCaption;

                if (ADlg.Execute) then
                  DoInsertPictureFromFile(ADlg.FileName);

              finally
                ADlg.Free;
              end;
            end;

        end;

    finally

      ActiveTable.EndUpdate;

    end;

  finally

    AHistory.EndAction;

  end;
end;

procedure TATdxSpreadSheetCustomPictureAction.DoInsertPictureFromFile(const
    AFileName: string);
var
  AContainer: TdxSpreadSheetPictureContainer;
  AImage: TdxSmartImage;
begin
  AImage := TdxSmartImage.Create;
  try
    AImage.LoadFromFile(AFileName);
    AContainer := AddPictureContainer(AImage.Width, AImage.Height);
    AContainer.BeginChanging;
    try
      AContainer.Picture.Image := AImage;
      AContainer.Focused := True;
    finally
      AContainer.EndChanging;
    end;
  finally
    AImage.Free;
  end;
end;

function TATdxSpreadSheetCustomPictureAction.FindPictureContainer(
  ACell: TdxSpreadSheetCell;
  out AContainer: TdxSpreadSheetContainer): Boolean;
begin
  Result := False;
  AContainer := NIL;

  var AContainers := ActiveTable.Containers;

  var ACount := AContainers.Count;

  if (ACount < 1) then
    exit(False);

  var Idx : Integer;

  for Idx := 0 to (ACount - 1) do
    begin

      AContainer := AContainers.Items[Idx];

      if (NOT (AContainer IS TdxSpreadSheetPictureContainer) ) then
        Continue;

      Result := (AContainer.AnchorPoint1.Cell = ACell);

      if (Result) then
        begin
          exit(Result);
        end
      else
        begin
          AContainer := NIL;
        end;
    end;
end;

procedure TATdxSpreadSheetCustomPictureAction.HistoryBeginAction(
  AHistory: TdxSpreadSheetHistory);
begin
  AHistory.BeginAction(TATdxSpreadSheetHistoryInsertPictureAction);
end;

constructor TATdxSpreadSheetInsertPicture.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  FDefaultCaptionResString := @sATdxSpreadSheetActionInsertPictureCaption;
  FDefaultHintResString := @sATdxSpreadSheetActionInsertPictureHint;
end;

function TATdxSpreadSheetInsertPicture.IsEnabled: Boolean;
begin
  Result := inherited IsEnabled;

  if (NOT Result) then
    exit(Result);

  var AFocusedContainer := ActiveSelection.FocusedContainer;

  Result := (NOT Assigned(AFocusedContainer));
end;

constructor TATdxSpreadSheetEditPicture.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  FIsContainerSelectionSupported := True;

  FDefaultCaptionResString := @sATdxSpreadSheetActionEditPictureCaption;
  FDefaultHintResString := @sATdxSpreadSheetActionEditPictureHint;
end;

procedure TATdxSpreadSheetEditPicture.HistoryBeginAction(
  AHistory: TdxSpreadSheetHistory);
begin
  AHistory.BeginAction(TATdxSpreadSheetHistoryEditPictureAction);
end;

function TATdxSpreadSheetEditPicture.IsEnabled: Boolean;
begin
  Result := inherited IsEnabled;

  if (NOT Result) then
    exit(Result);

  var AFocusedContainer := ActiveSelection.FocusedContainer;

  Result := ( Assigned(AFocusedContainer) AND
             (AFocusedContainer IS TdxSpreadSheetPictureContainer) );
end;

constructor TATdxSpreadSheetGridlinesPrint.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  FDefaultCaptionResString := @sATdxSpreadSheetActionGridlinesPrintCaption;
  FDefaultHintResString := @sATdxSpreadSheetActionGridlinesPrintHint;
end;

procedure TATdxSpreadSheetGridlinesPrint.DoExecute;
begin
  var AGridlines := ActiveTable.OptionsPrint.Source.ActualGridLines;

  var ANewGridlines: TdxDefaultBoolean;

  if (AGridlines) then
    ANewGridlines := bFalse
  else
    ANewGridlines := bTrue;

  ActiveTable.OptionsPrint.Source.GridLines := ANewGridlines;
end;

procedure TATdxSpreadSheetGridlinesPrint.DoUpdateState;
begin
  inherited;

  Checked := ActiveTable.OptionsPrint.Source.ActualGridLines;
end;

constructor TATdxSpreadSheetGridlinesView.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  FDefaultCaptionResString := @sATdxSpreadSheetActionGridlinesViewCaption;
  FDefaultHintResString := @sATdxSpreadSheetActionGridlinesViewHint;
end;

procedure TATdxSpreadSheetGridlinesView.DoExecute;
begin
  var AGridlines := ActiveTable.Options.ActualGridLines;

  var ANewGridlines: TdxDefaultBoolean;

  if (AGridlines) then
    ANewGridlines := bFalse
  else
    ANewGridlines := bTrue;

  ActiveTable.Options.GridLines := ANewGridlines;
end;

procedure TATdxSpreadSheetGridlinesView.DoUpdateState;
begin
  inherited;

  Checked := ActiveTable.Options.ActualGridLines;
end;

constructor TATdxSpreadSheetHeadingsPrint.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  FDefaultCaptionResString := @sATdxSpreadSheetActionHeadingsPrintCaption;
  FDefaultHintResString := @sATdxSpreadSheetActionHeadingsPrintHint;
end;

procedure TATdxSpreadSheetHeadingsPrint.DoExecute;
begin
  var AHeadings := ActiveTable.OptionsPrint.Source.ActualHeaders;

  var ANewHeadings: TdxDefaultBoolean;

  if (AHeadings) then
    ANewHeadings := bFalse
  else
    ANewHeadings := bTrue;

  ActiveTable.OptionsPrint.Source.Headers := ANewHeadings;
end;

procedure TATdxSpreadSheetHeadingsPrint.DoUpdateState;
begin
  inherited;

  Checked := ActiveTable.OptionsPrint.Source.ActualHeaders;
end;

constructor TATdxSpreadSheetHeadingsView.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  FDefaultCaptionResString := @sATdxSpreadSheetActionHeadingsViewCaption;
  FDefaultHintResString := @sATdxSpreadSheetActionHeadingsViewHint;
end;

procedure TATdxSpreadSheetHeadingsView.DoExecute;
begin
  var AHeadings := ActiveTable.Options.ActualHeaders;

  var ANewHeadings: TdxDefaultBoolean;

  if (AHeadings) then
    ANewHeadings := bFalse
  else
    ANewHeadings := bTrue;

  ActiveTable.Options.Headers := ANewHeadings;
end;

procedure TATdxSpreadSheetHeadingsView.DoUpdateState;
begin
  inherited;

  Checked := ActiveTable.Options.ActualHeaders;
end;

constructor TATdxSpreadSheetShowFormulas.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  FDefaultCaptionResString := @sATdxSpreadSheetActionShowFormulasCaption;
  FDefaultHintResString := @sATdxSpreadSheetActionShowFormulasHint;
end;

procedure TATdxSpreadSheetShowFormulas.DoExecute;
begin
  var AShowFormulas := ActiveTable.Options.ActualShowFormulas;

  var ANewShowFormulas: TdxDefaultBoolean;

  if (AShowFormulas) then
    ANewShowFormulas := bFalse
  else
    ANewShowFormulas := bTrue;

  ActiveTable.Options.ShowFormulas := ANewShowFormulas;
end;

procedure TATdxSpreadSheetShowFormulas.DoUpdateState;
begin
  inherited;

  Checked := ActiveTable.Options.ActualShowFormulas;
end;

constructor TATdxSpreadSheetAutoCalc.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  FDefaultCaptionResString := @sATdxSpreadSheetActionAutoCalcCaption;
  FDefaultHintResString := @sATdxSpreadSheetActionAutoCalcHint;
end;

procedure TATdxSpreadSheetAutoCalc.DoExecute;
begin
  var AAutoCalc := Control.OptionsBehavior.AutomaticCalculation;

  AAutoCalc := (NOT AAutoCalc);

  Control.OptionsBehavior.AutomaticCalculation := AAutoCalc;

  if (AAutoCalc) then
    Control.FormulaController.Calculate;
end;

procedure TATdxSpreadSheetAutoCalc.DoUpdateState;
begin
  inherited;

  Checked := Control.OptionsBehavior.AutomaticCalculation;
end;

{ TATdxSpreadSheetCalcStatus }

constructor TATdxSpreadSheetCalcStatus.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  FDefaultCaptionResString := @sATdxSpreadSheetActionCalcStatusCaption;
  FDefaultHintResString := @sATdxSpreadSheetActionCalcStatusHint;
end;

procedure TATdxSpreadSheetCalcStatus.DoExecute;
begin
  //do nothing...
end;

procedure TATdxSpreadSheetCalcStatus.DoUpdateState;
begin
  inherited;

  Visible := Control.FormulaController.CalculationInProcess;

end;

{ TATdxSpreadSheetCalcNow }

constructor TATdxSpreadSheetCalcNow.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  FDefaultCaptionResString := @sATdxSpreadSheetActionCalcNowCaption;
  FDefaultHintResString := @sATdxSpreadSheetActionCalcNowHint;
end;

procedure TATdxSpreadSheetCalcNow.DoExecute;
begin
  Control.FormulaController.Calculate;
end;

end.
