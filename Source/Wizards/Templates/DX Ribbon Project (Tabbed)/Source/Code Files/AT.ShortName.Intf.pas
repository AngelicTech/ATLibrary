// ******************************************************************
//
// Program Name   : $ProgramName$
// Platform(s)    : $Platforms$
// Framework      : VCL
//
// Filename       : AT.$ShortName$.Intf.pas
// File Version   : 1.00
// Date Created   : $CreateDate$
// Author         : Matthew Vesperman
//
// Description:
//
// $ProgramName$'s interface definitions.
//
// Revision History:
//
// v1.00   :   Initial version
//
// ******************************************************************
//
// COPYRIGHT © $Year$ - PRESENT Angelic Technology
// ALL RIGHTS RESERVED WORLDWIDE
//
// ******************************************************************


/// <summary>
///   $ProgramName$'s interface definitions.
/// </summary>
unit AT.ShortName.Intf;

interface

uses
  Vcl.Forms, dxRibbon, AT.ShortName.Types, cxPC,
  AT.ShortName.Vcl.Forms.Generic.TabForm;

type
  /// <summary>
  ///   Defines an interface for clipboard commands.
  /// </summary>
  /// <remarks>
  ///   This interface allows the main UI window to send clipboard
  ///   commands to child windows.
  /// </remarks>
  IATClipboard = interface(IInterface)
    ['{A9E870F1-690F-4832-8C32-14969070A20F}']
    procedure CopyToClipboard;
    procedure CutToClipboard;
    procedure PasteFromClipboard;
  end;

  /// <summary>
  ///   Defines an interface to query an object for clipboard
  ///   capabilities.
  /// </summary>
  /// <remarks>
  ///   This interface allows the main UI window to ask a child
  ///   window for its clipboard capabilities.
  /// </remarks>
  IATClipboardCaps = interface(IInterface)
    ['{89A359AA-BC58-4E0C-915C-105EFB5A2740}']
    function GetHasCopy: Boolean;
    function GetHasCut: Boolean;
    function GetHasPaste: Boolean;
    property HasCopy: Boolean read GetHasCopy;
    property HasCut: Boolean read GetHasCut;
    property HasPaste: Boolean read GetHasPaste;
  end;

  /// <summary>
  ///   Defines an object to query an object for clipboard command
  ///   status.
  /// </summary>
  /// <remarks>
  ///   This interface allows the main UI window to ask a child
  ///   window for the status of its clipboard commands.
  /// </remarks>
  IATClipboardQuery = interface(IInterface)
    ['{EC75205C-F36E-47E2-99B3-FCED7E384158}']
    function GetCanCopy: Boolean;
    function GetCanCut: Boolean;
    function GetCanPaste: Boolean;
    property CanCopy: Boolean read GetCanCopy;
    property CanCut: Boolean read GetCanCut;
    property CanPaste: Boolean read GetCanPaste;
  end;

  /// <summary>
  ///   Defines an interface for dialog box commands.
  /// </summary>
  /// <remarks>
  ///   This interface allows a descendant of the base dialog type to
  ///   provide additional functionality that will be called by the
  ///   base form's code.
  /// </remarks>
  IATDialog = interface(IInterface)
    ['{55705EAA-492A-4C7F-B6F3-B2E136FE7261}']
    procedure ExecuteCancel;
    procedure ExecuteOk;
    procedure UpdateProperties;
  end;

  /// <summary>
  ///   Defines an interface to allow a descendant of the base dialog
  ///   type to programmatically provide its dialog box title.
  /// </summary>
  IATDialogCaption = interface(IInterface)
    ['{7668A876-38B3-4839-B555-4152169CAFE9}']
    function GetDialogCaption: String;
    property DialogCaption: String read GetDialogCaption;
  end;

  /// <summary>
  ///   Defines an interface to allow a descendant of the base dialog
  ///   type to provide dialog box data validation.
  /// </summary>
  IATDialogValidate = interface(IInterface)
    ['{0998E56F-8D9E-467C-B223-6E99EC3B78FD}']
    function ValidateFields: Boolean;
  end;

  IATDocFile = interface
    ['{BB0FB321-347B-4D18-A8D5-7A96B6CC9D29}']
    procedure NewDocument;
    procedure OpenDocument(const AFileName: String);
    procedure SaveDocument;
    procedure SaveDocumentAs;
  end;

  IATDocFileQuery = interface
    ['{9C00F022-6C29-40B3-9FB6-FFAC993D0C34}']
    function GetCanSaveDocument: Boolean;
    function GetCanSaveDocumentAs: Boolean;
    property CanSaveDocument: Boolean read GetCanSaveDocument;
    property CanSaveDocumentAs: Boolean read GetCanSaveDocumentAs;
  end;

  IATDocPrint = interface
    ['{75128444-7BF2-4C2D-B3F7-4F489A6E4939}']
    procedure Print;
    procedure PrinterSetup;
    procedure QuickPrint;
  end;

  IATDocPrintCaps = interface
    ['{A71269D0-62F3-416F-B27A-7F34215C6D42}']
    function GetHasPrint: Boolean;
    function GetHasPrinterSetup: Boolean;
    function GetHasQuickPrint: Boolean;
    property HasPrint: Boolean read GetHasPrint;
    property HasPrinterSetup: Boolean read GetHasPrinterSetup;
    property HasQuickPrint: Boolean read GetHasQuickPrint;
  end;

  IATDocPrintQuery = interface
    ['{9D5EA17B-7B1F-4F88-90C4-C8FDC2013E17}']
    function GetCanPrint: Boolean;
    function GetCanPrinterSetup: Boolean;
    function GetCanQuickPrint: Boolean;
    property CanPrint: Boolean read GetCanPrint;
    property CanPrinterSetup: Boolean read GetCanPrinterSetup;
    property CanQuickPrint: Boolean read GetCanQuickPrint;
  end;

  /// <summary>
  ///   Defines an interface to inform a tab form to activate itself.
  /// </summary>
  IATFormActivate = interface(IInterface)
    ['{FC3A32BF-C94B-48C4-A3B2-48AA2FD3D338}']
    procedure ActivateForm;
  end;

  /// <summary>
  ///   Defines an interface to allow a tab form to inform the
  ///   tabsheet that its caption has changed.
  /// </summary>
  IATFormCaptionChanged = interface
    ['{DAB30246-CF85-455E-87AD-90514569DFEB}']
    procedure FormCaptionChanged(const Value: String);
  end;

  /// <summary>
  ///   Defines an interface to inform a tab form to deactivate
  ///   itself.
  /// </summary>
  IATFormDeactivate = interface(IInterface)
    ['{02B759A9-0697-4D5F-A248-DB437B761883}']
    procedure DeactivateForm;
  end;

  /// <summary>
  ///   Defines an interface to provide basic interactions with a
  ///   form's frame.
  /// </summary>
  IATFormFrame = interface(IInterface)
    ['{243D1AEB-9E2F-416B-B63F-5B3501965324}']
    procedure CreateFrame;
    procedure DestroyFrame;
    function GetFrame: TCustomFrame;
    property Frame: TCustomFrame read GetFrame;
  end;

  /// <summary>
  ///   Defines an interface to allow a frame type to be activated
  ///   when its parent window is activated.
  /// </summary>
  IATFrameActivate = interface(IInterface)
    ['{DBE44D2C-907F-4BD0-ABC8-039D87088B6B}']
    procedure ActivateFrame;
  end;

  /// <summary>
  ///   Defines an interface to support captions for frames.
  /// </summary>
  /// <remarks>
  ///   This allows a frame to have a caption property for use in
  ///   embedding in the main form's client tabs.
  /// </remarks>
  IATFrameCaption = interface
    ['{107B06AB-85E7-41B1-9393-DC25978657E2}']
    function GetCaption: String;
    procedure SetCaption(const Value: String);
    property Caption: String read GetCaption write SetCaption;
  end;

  /// <summary>
  ///   Defines an interface to allow a frame to inform its
  ///   parent/owner that its caption has changed.
  /// </summary>
  IATFrameCaptionChanged = interface
    ['{EF42D393-6979-42FD-BDB9-57EE5360AEE0}']
    procedure FrameCaptionChanged(const Value: String);
  end;

  /// <summary>
  ///   Defines an interface to allow a frame type to be deactivated
  ///   when its parent window is deactivated.
  /// </summary>
  IATFrameDeactivate = interface(IInterface)
    ['{A0121469-FE4A-4863-8401-24E9BAE2A002}']
    procedure DeactivateFrame;
  end;

  /// <summary>
  ///   Defines an interface to allow a frame to perform finalization
  ///   cleanup when its parent window is destroyed.
  /// </summary>
  IATFrameFinalize = interface(IInterface)
    ['{0D063910-EC96-4245-96B4-4EFC03014803}']
    procedure FinalizeFrame;
  end;

  /// <summary>
  ///   Defines an interface to allow a frame to perform
  ///   initialization when its parent window is created.
  /// </summary>
  IATFrameInitialize = interface(IInterface)
    ['{CD92C00F-4D59-4AEF-AF68-0C4EB73B7BDB}']
    procedure InitializeFrame;
  end;

  /// <summary>
  ///   Defines an interface to allow automatic control
  ///   initialization during the creation of a descendant of one of
  ///   the base child window types.
  /// </summary>
  IATInitControls = interface(IInterface)
    ['{3EDE5871-A4C3-4B82-AC7B-9303157A31A3}']
    procedure InitControls;
  end;

  /// <summary>
  ///   Defines an interface to allow automatic field initialization
  ///   during the creation of a descendant of one of the base child
  ///   window types.
  /// </summary>
  IATInitFields = interface(IInterface)
    ['{30B8123E-ACEF-4E0B-8F2B-E171A9D1A76A}']
    procedure InitFields;
  end;

  /// <summary>
  ///   Defines an interface to allow programmatic setting of the
  ///   window caption during the creation of a descendant of one of
  ///   the base child window types.
  /// </summary>
  IATInitFormCaption = interface(IInterface)
    ['{34508A17-47AC-4B11-9825-358A630B16BD}']
    procedure SetFormCaption;
  end;

  /// <summary>
  ///   Defines an interface to allow the main UI window to toggle
  ///   the state of a child window's insert/overwrite edit mode.
  /// </summary>
  IATInsOvr = interface(IInterface)
    ['{A6112B9E-D6DF-4753-9C69-A4BF4EEA0BC8}']
    procedure ToggleInsertMode;
  end;

  /// <summary>
  ///   Defines an interface to allow the main UI window to query/set
  ///   the state of a child window's insert/overwrite edit mode.
  /// </summary>
  IATInsOvrQuery = interface(IInterface)
    ['{1EEAFFD5-6DEF-47DC-8E93-7BAAE63365D6}']
    function GetInsertMode: Boolean;
    procedure SetInsertMode(const Value: Boolean);
    property InsertMode: Boolean read GetInsertMode write SetInsertMode;
  end;

  /// <summary>
  ///   Defines an interface to allow a child window to provide
  ///   LiveBinding initialization and notification.
  /// </summary>
  IATLiveBindings = interface(IInterface)
    ['{CE941279-4474-4CE7-B473-E6F1920C03BF}']
    procedure InitLiveBindings;
    procedure NotifyVM(const AProperty: String = '');
  end;

  /// <summary>
  ///   Defines an interface to inform the main UI window to close
  ///   its child windows.
  /// </summary>
  IATMainCloseChildren = interface(IInterface)
    ['{1EEB76FE-C73C-456F-8A41-884136AAB01B}']
    procedure CloseChildren;
  end;

  /// <summary>
  ///   Defines an interface to determine if the main UI window's
  ///   child forms can close.
  /// </summary>
  IATMainCloseChildrenQuery = interface(IInterface)
    ['{745DF92A-645D-4333-8336-B97205C42818}']
    function GetCanCloseChildren: Boolean;
    property CanCloseChildren: Boolean read GetCanCloseChildren;
  end;

  /// <summary>
  ///   Defines an interface to ask the main UI window if it wants to
  ///   close/if it is closing.
  /// </summary>
  IATMainCloseQuery = interface(IInterface)
    ['{8872C52D-9269-43F1-97AD-FAEFB2C90960}']
    function GetIsClosing: Boolean;
    function GetWantsToClose: Boolean;
    property IsClosing: Boolean read GetIsClosing;
    property WantsToClose: Boolean read GetWantsToClose;
  end;

  /// <summary>
  ///   Defines an interface to allow programmatic interaction with
  ///   the main UI window's ribbon controls.
  /// </summary>
  IATMainRibbon = interface(IInterface)
    ['{9C759814-662E-4A9E-AD97-880E68CC877B}']
    procedure CloseBackStageView;
    function GetRibbon: TdxRibbon;
    procedure SetActiveRibbonTabIndex(Value: Integer);
    procedure SetRibbonMode(Value: TATRibbonMode);
    procedure UpdateRibbonContextStates;
    property ActiveRibbonTabIndex: Integer write SetActiveRibbonTabIndex;
    property Ribbon: TdxRibbon read GetRibbon;
    property RibbonMode: TATRibbonMode write SetRibbonMode;
  end;

  /// <summary>
  ///   Defines an interface to provide child window ribbon merge
  ///   notifications to the main UI window.
  /// </summary>
  IATMainRibbonMerge = interface(IInterface)
    ['{56B3BBEB-BA1B-4C96-AE91-46D78A02E6F4}']
    procedure AfterRibbonMerge;
    procedure AfterRibbonUnmerge;
    procedure BeforeRibbonMerge;
    procedure BeforeRibbonUnmerge;
  end;

  /// <summary>
  ///   Defines an interface to query the main UI window's ribbon
  ///   properties.
  /// </summary>
  IATMainRibbonQuery = interface(IInterface)
    ['{5903A433-3E62-41BF-AEBB-8F5D3E80B6E9}']
    function GetActiveRibbonTabIndex: Integer;
    function GetRibbonMode: TATRibbonMode;
    property ActiveRibbonTabIndex: Integer read GetActiveRibbonTabIndex;
    property RibbonMode: TATRibbonMode read GetRibbonMode;
  end;

  /// <summary>
  ///   Defines an interface to allow interaction with the main
  ///   form's client tab UI.
  /// </summary>
  IATMainTabUI = interface
    ['{088DB4BA-F27B-4A69-8865-A2F0C6D7FE21}']
    procedure AddTabChild(ATabSheet: TcxTabSheet);
    procedure AddTabFormChild(AFormClass: TfrmGenericTabFormClass);
    procedure AddTabFrameChild(AFrameClass: TCustomFrameClass);
    function GetActiveTabChild: TcxTabSheet;
    function GetTabChildCount: Integer;
    function GetTabChildren(Index: Integer): TcxTabSheet;
    procedure SetActiveTabChild(const Value: TcxTabSheet);
    property ActiveTabChild: TcxTabSheet read GetActiveTabChild write
        SetActiveTabChild;
    property TabChildCount: Integer read GetTabChildCount;
    property TabChildren[Index: Integer]: TcxTabSheet read GetTabChildren;
  end;

  /// <summary>
  ///   Defines an interface to provide basic interactions with the
  ///   main UI window.
  /// </summary>
  IATMainUI = interface(IInterface)
    ['{28B08A49-CA04-43E5-A065-F3925EB9EE19}']
    procedure BeginUpdate;
    procedure EndUpdate;
    procedure SynchronizeUIObjects;
    procedure ToggleStatusBarVisible;
  end;

  /// <summary>
  ///   Defines an interface to determine main UI window
  ///   capabilities.
  /// </summary>
  IATMainUICaps = interface(IInterface)
    ['{AA15A111-508A-4C43-BFA5-6298BFDFB802}']
    function GetHasStatusBar: Boolean;
    property HasStatusBar: Boolean read GetHasStatusBar;
  end;

  /// <summary>
  ///   Defines an interface to query the main UI window's
  ///   properties.
  /// </summary>
  IATMainUIQuery = interface(IInterface)
    ['{E54467FA-F322-4DD5-85D8-E43C42A73146}']
    function GetIsStatusBarVisible: Boolean;
    property IsStatusBarVisible: Boolean read GetIsStatusBarVisible;
  end;

  /// <summary>
  ///   Defines an interface to allow a form to save/load its
  ///   settings.
  /// </summary>
  IATPersistentForm = interface(IInterface)
    ['{56E48192-40AD-4531-BE1A-A20346104A8E}']
    procedure LoadFormState;
    procedure SaveFormState;
  end;

  /// <summary>
  ///   Defines an interface to allow a child form to provide
  ///   search/replace functionality.
  /// </summary>
  IATSearch = interface(IInterface)
    ['{A6274827-128F-4A3E-8DDF-383BA46FAA7D}']
    procedure Find;
    procedure Replace;
  end;

  /// <summary>
  ///   Defines an interface to determine a child form's
  ///   search/replace capabilities.
  /// </summary>
  IATSearchCaps = interface(IInterface)
    ['{085509BE-A31F-41A3-8A8E-010995A16D65}']
    function GetHasFind: Boolean;
    function GetHasReplace: Boolean;
    property HasFind: Boolean read GetHasFind;
    property HasReplace: Boolean read GetHasReplace;
  end;

  /// <summary>
  ///   Defines an interface to query the status of a child window's
  ///   find/replace commands.
  /// </summary>
  IATSearchQuery = interface(IInterface)
    ['{6740749E-7CB2-467F-B9A1-6CAA90B0FC82}']
    function GetCanFind: Boolean;
    function GetCanReplace: Boolean;
    property CanFind: Boolean read GetCanFind;
    property CanReplace: Boolean read GetCanReplace;
  end;

  /// <summary>
  ///   Defines an interface to allow a child form to provide item
  ///   selection functionality.
  /// </summary>
  IATSelection = interface(IInterface)
    ['{9BE70EBD-F0E1-4D10-9519-9F15DBB0FF35}']
    function GetSelectedText: String;
    procedure InvertSelection;
    procedure SelectAll;
    procedure SelectNone;
    procedure SetSelectedText(const Value: String);
    property SelectedText: String read GetSelectedText write SetSelectedText;
  end;

  /// <summary>
  ///   Defines an interface to determine a child form's item
  ///   selection capabilities.
  /// </summary>
  IATSelectionCaps = interface(IInterface)
    ['{21AEFB61-711A-4583-B7D5-B14957DE7ACD}']
    function GetHasInvertSelection: Boolean;
    function GetHasSelectAll: Boolean;
    function GetHasSelectNone: Boolean;
    property HasInvertSelection: Boolean read GetHasInvertSelection;
    property HasSelectAll: Boolean read GetHasSelectAll;
    property HasSelectNone: Boolean read GetHasSelectNone;
  end;

  /// <summary>
  ///   Defines an interface to query the status of a child window's
  ///   item selection commands.
  /// </summary>
  IATSelectionQuery = interface(IInterface)
    ['{D5F5A2EC-5AA5-4156-8221-1363F8A7EA21}']
    function GetCanInvertSelection: Boolean;
    function GetCanSelectAll: Boolean;
    function GetCanSelectNone: Boolean;
    function GetHasSelection: Boolean;
    property CanInvertSelection: Boolean read GetCanInvertSelection;
    property CanSelectAll: Boolean read GetCanSelectAll;
    property CanSelectNone: Boolean read GetCanSelectNone;
    property HasSelection: Boolean read GetHasSelection;
  end;

  /// <summary>
  ///   Defines an interface to allow a form/frame tabsheet to inform
  ///   the main form that its caption has changed.
  /// </summary>
  IATTabCaptionChanged = interface
    ['{34D4936E-EE54-4D11-B586-92F5DE967D4A}']
    procedure TabCaptionChanged(const Value: String);
  end;

  /// <summary>
  ///   Defines an interface to provide basic interactions with a
  ///   form based Tab child.
  /// </summary>
  IATTabFormChildUI = interface(IInterface)
    ['{184C0CB2-EFBD-4D6F-8C3F-18F8DBC38D05}']
    function GetForm: TfrmGenericTabForm;
    property Form: TfrmGenericTabForm read GetForm;
  end;

  /// <summary>
  ///   Defines an interface to allow programmatic interaction with
  ///   an tab child form's ribbon controls.
  /// </summary>
  IATTabFormRibbon = interface(IInterface)
    ['{F7AFC116-B875-4D7B-A92A-56F921C97DC9}']
    function GetActiveRibbonTabIndex: Integer;
    function GetRibbon: TdxRibbon;
    procedure MergeToRibbon(ARibbon: TdxRibbon);
    procedure SetActiveRibbonTabIndex(Value: Integer);
    procedure UnmergeFromRibbon(ARibbon: TdxRibbon);
    property ActiveRibbonTabIndex: Integer read GetActiveRibbonTabIndex write
        SetActiveRibbonTabIndex;
    property Ribbon: TdxRibbon read GetRibbon;
  end;

  /// <summary>
  ///   Defines an interface to allow the main UI window to ask a
  ///   child tab form's tab hint.
  /// </summary>
  IATTabFormTabHint = interface(IInterface)
    ['{342688EF-324D-4EB7-AB4F-5C33DD13365A}']
    function GetTabHint: String;
    property TabHint: String read GetTabHint;
  end;

  /// <summary>
  ///   Defines an interface to provide basic interactions with a
  ///   Tab child's frame.
  /// </summary>
  IATTabFormUI = interface(IInterface)
    ['{B59DDA75-D464-44B0-8A9D-9D85BA4014D5}']
    procedure BeginUpdate;
    procedure EndUpdate;
    procedure SynchronizeUIObjects;
  end;

  /// <summary>
  ///   Defines an interface to provide basic interactions with a
  ///   frame based Tab child.
  /// </summary>
  IATTabFrameChildUI = interface(IInterface)
    ['{CB6428A9-2B51-4A39-8DF6-5483515A008A}']
    function GetFrame: TCustomFrame;
    property Frame: TCustomFrame read GetFrame;
  end;

  /// <summary>
  ///   Defines an interface to ask a frame if it can close.
  /// </summary>
  IATTabFrameCloseQuery = interface
    ['{AD8DFC9C-201D-4914-9389-E5A199ECB1BB}']
    function CloseQuery: Boolean;
  end;

  /// <summary>
  ///   Defines an interface to ask a frame if it is a non-closing
  ///   frame.
  /// </summary>
  IATTabFrameNonClosing = interface
    ['{15D81409-F525-49A9-8D82-58D23A590607}']
    function GetIsNonClosing: Boolean;
    property IsNonClosing: Boolean read GetIsNonClosing;
  end;

  /// <summary>
  ///   Defines an interface to allow the main UI window to ask a
  ///   child tab frame's tab hint.
  /// </summary>
  IATTabFrameTabHint = interface(IInterface)
    ['{BF4B8BC2-2120-4F41-82A8-72D9457A0845}']
    function GetTabHint: String;
    property TabHint: String read GetTabHint;
  end;

  /// <summary>
  ///   Defines an interface to provide basic interactions with a
  ///   Tab child's frame.
  /// </summary>
  IATTabFrameUI = interface(IInterface)
    ['{A457D532-5596-41B6-91F7-3824897C5AB9}']
    procedure BeginUpdate;
    procedure EndUpdate;
    procedure SynchronizeUIObjects;
  end;

  /// <summary>
  ///   Defines an interface to ask a tab form/frame for the image
  ///   index to use for the associated tabsheet.
  /// </summary>
  IATTabImageIndex = interface
    ['{520428E6-0358-4CE3-8A5A-FC1BC9259B2A}']
    function GetTabImageIndex: Integer;
    property TabImageIndex: Integer read GetTabImageIndex;
  end;

  IATThemedForm = interface(IInterface)
    ['{A2AC1955-CC27-4BD4-B993-DAAB8694E572}']
    /// <summary>
    ///   Defines an interface to allow a window to be informed about
    ///   a change in the themeing sub-system.
    /// </summary>
    procedure ThemeChanged(const ASkinName: string);
  end;

  /// <summary>
  ///   Defines an interface to allow a child form to provide
  ///   undo/redo functionality.
  /// </summary>
  IATUndo = interface(IInterface)
    ['{84CBF16B-A08B-4A17-AF3F-FB7E6C4D1C06}']
    procedure Redo;
    procedure Undo;
  end;

  /// <summary>
  ///   Defines an interface to determine a child form's undo/redo
  ///   capabilities.
  /// </summary>
  IATUndoCaps = interface(IInterface)
    ['{EA9F3331-1312-4CE5-9292-0BBB4AEA5710}']
    function GetHasRedo: Boolean;
    function GetHasUndo: Boolean;
    property HasRedo: Boolean read GetHasRedo;
    property HasUndo: Boolean read GetHasUndo;
  end;

  /// <summary>
  ///   Defines an interface to query the status of a child window's
  ///   undo/redo commands.
  /// </summary>
  IATUndoQuery = interface(IInterface)
    ['{BA332FEF-EFA0-4DA3-97CC-B235209A5DF8}']
    function GetCanRedo: Boolean;
    function GetCanUndo: Boolean;
    property CanRedo: Boolean read GetCanRedo;
    property CanUndo: Boolean read GetCanUndo;
  end;


implementation

end.
