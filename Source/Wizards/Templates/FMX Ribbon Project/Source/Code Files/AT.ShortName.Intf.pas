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
  Fmx.Forms, AT.ShortName.Types;

type
  /// <summary>
  ///   Defines an interface for clipboard commands.
  /// </summary>
  /// <remarks>
  ///   This interface allows the main UI window to send clipboard
  ///   commands to child windows.
  /// </remarks>
  IATClipboard = interface(IInterface)
    ['{D4BBEABE-59AD-4CCD-A592-76FE54C928D4}']
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
    ['{5F1FC6E4-8C27-4EA6-A318-ED3DFE578EF5}']
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
    ['{CEF43977-D5C0-45EF-B3FE-8E1624E7CFA7}']
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
    ['{944C3ACB-EA69-49E5-93C5-B4961ECE74C5}']
    procedure ExecuteCancel;
    procedure ExecuteOk;
    procedure UpdateProperties;
  end;

  /// <summary>
  ///   Defines an interface to allow a descendant of the base dialog
  ///   type to programmatically provide its dialog box title.
  /// </summary>
  IATDialogCaption = interface(IInterface)
    ['{C4712317-167F-4E61-9A15-5242CE0FAE70}']
    function GetDialogCaption: String;
    property DialogCaption: String read GetDialogCaption;
  end;

  /// <summary>
  ///   Defines an interface to allow a descendant of the base dialog
  ///   type to provide dialog box data validation.
  /// </summary>
  IATDialogValidate = interface(IInterface)
    ['{90904BC7-9D13-4FA8-A939-EF569258DE85}']
    function ValidateFields: Boolean;
  end;

  /// <summary>
  ///   Defines an interface to inform a tab form to activate itself.
  /// </summary>
  IATFormActivate = interface(IInterface)
    ['{B594D564-B2BE-48C2-9879-E4A05B7622D9}']
    procedure ActivateForm;
  end;

  /// <summary>
  ///   Defines an interface to allow a tab form to inform the
  ///   tabsheet that its caption has changed.
  /// </summary>
  IATFormCaptionChanged = interface
    ['{C71C2C7E-9283-411A-B5B8-2F89CE40DC6A}']
    procedure FormCaptionChanged(const Value: String);
  end;

  /// <summary>
  ///   Defines an interface to inform a tab form to deactivate
  ///   itself.
  /// </summary>
  IATFormDeactivate = interface(IInterface)
    ['{8CA4C45A-88B6-4388-AA3B-34349EE95387}']
    procedure DeactivateForm;
  end;

  /// <summary>
  ///   Defines an interface to provide basic interactions with a
  ///   form's frame.
  /// </summary>
  IATFormFrame = interface(IInterface)
    ['{3949FD6D-B483-409D-BA2B-8011AB1153A3}']
    procedure CreateFrame;
    procedure DestroyFrame;
    function GetFrame: TFrame;
    property Frame: TFrame read GetFrame;
  end;

  /// <summary>
  ///   Defines an interface to allow a frame type to be activated
  ///   when its parent window is activated.
  /// </summary>
  IATFrameActivate = interface(IInterface)
    ['{66B97E44-38E5-4DE5-852B-4FCEDF5389BF}']
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
    ['{AEAB2274-87F0-455A-B50C-7C147EE20DA2}']
    function GetCaption: String;
    procedure SetCaption(const Value: String);
    property Caption: String read GetCaption write SetCaption;
  end;

  /// <summary>
  ///   Defines an interface to allow a frame to inform its
  ///   parent/owner that its caption has changed.
  /// </summary>
  IATFrameCaptionChanged = interface
    ['{F6795F5C-3CC2-49DB-A55A-9DE55FA15674}']
    procedure FrameCaptionChanged(const Value: String);
  end;

  /// <summary>
  ///   Defines an interface to allow a frame type to be deactivated
  ///   when its parent window is deactivated.
  /// </summary>
  IATFrameDeactivate = interface(IInterface)
    ['{C4BA4CF2-421A-4F0A-B3AE-47B7C8689C6E}']
    procedure DeactivateFrame;
  end;

  /// <summary>
  ///   Defines an interface to allow a frame to perform finalization
  ///   cleanup when its parent window is destroyed.
  /// </summary>
  IATFrameFinalize = interface(IInterface)
    ['{CFBA6D99-9F87-49F8-B3A4-9E219FE6CF4A}']
    procedure FinalizeFrame;
  end;

  /// <summary>
  ///   Defines an interface to allow a frame to perform
  ///   initialization when its parent window is created.
  /// </summary>
  IATFrameInitialize = interface(IInterface)
    ['{0A36383A-35C4-4354-A348-C420E6513030}']
    procedure InitializeFrame;
  end;

  /// <summary>
  ///   Defines an interface to allow automatic control
  ///   initialization during the creation of a descendant of one of
  ///   the base child window types.
  /// </summary>
  IATInitControls = interface(IInterface)
    ['{1843EA6B-8D40-44EE-8FB7-B73734B09070}']
    procedure InitControls;
  end;

  /// <summary>
  ///   Defines an interface to allow automatic field initialization
  ///   during the creation of a descendant of one of the base child
  ///   window types.
  /// </summary>
  IATInitFields = interface(IInterface)
    ['{52F8F1E1-9E33-423B-BA4D-B56FB4F48B28}']
    procedure InitFields;
  end;

  /// <summary>
  ///   Defines an interface to allow programmatic setting of the
  ///   window caption during the creation of a descendant of one of
  ///   the base child window types.
  /// </summary>
  IATInitFormCaption = interface(IInterface)
    ['{B38BA72F-49A0-4E3F-8735-C646845F0F65}']
    procedure SetFormCaption;
  end;

  /// <summary>
  ///   Defines an interface to allow the main UI window to toggle
  ///   the state of a child window's insert/overwrite edit mode.
  /// </summary>
  IATInsOvr = interface(IInterface)
    ['{E114E35B-4966-450B-8B50-AB1F3ED19AC6}']
    procedure ToggleInsertMode;
  end;

  /// <summary>
  ///   Defines an interface to allow the main UI window to query/set
  ///   the state of a child window's insert/overwrite edit mode.
  /// </summary>
  IATInsOvrQuery = interface(IInterface)
    ['{DC807C16-71C0-45F7-9DB1-F8611DB056C0}']
    function GetInsertMode: Boolean;
    procedure SetInsertMode(const Value: Boolean);
    property InsertMode: Boolean read GetInsertMode write SetInsertMode;
  end;

  /// <summary>
  ///   Defines an interface to allow a child window to provide
  ///   LiveBinding initialization and notification.
  /// </summary>
  IATLiveBindings = interface(IInterface)
    ['{D6DB350F-AF6D-49C7-9238-BBFC35A0C28F}']
    procedure InitLiveBindings;
    procedure NotifyVM(const AProperty: String = '');
  end;

  /// <summary>
  ///   Defines an interface to inform the main UI window to close
  ///   its child windows.
  /// </summary>
  IATMainCloseChildren = interface(IInterface)
    ['{5A7CA6A0-99AD-4F4B-82F3-87CB2E68F0AF}']
    procedure CloseChildren;
  end;

  /// <summary>
  ///   Defines an interface to determine if the main UI window's
  ///   child forms can close.
  /// </summary>
  IATMainCloseChildrenQuery = interface(IInterface)
    ['{6FC622D7-A286-4A01-8784-683342EC73F8}']
    function GetCanCloseChildren: Boolean;
    property CanCloseChildren: Boolean read GetCanCloseChildren;
  end;

  /// <summary>
  ///   Defines an interface to ask the main UI window if it wants to
  ///   close/if it is closing.
  /// </summary>
  IATMainCloseQuery = interface(IInterface)
    ['{6CD57EB2-854F-493A-9C64-4FA822CAC27D}']
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
    ['{1B2D8F9C-AC87-4D7B-BF3C-377C3D10115F}']
//    procedure CloseBackStageView;
//    function GetRibbon: TdxRibbon;
//    procedure SetActiveRibbonTabIndex(Value: Integer);
//    procedure SetRibbonMode(Value: TATRibbonMode);
//    procedure UpdateRibbonContextStates;
//    property ActiveRibbonTabIndex: Integer write SetActiveRibbonTabIndex;
//    property Ribbon: TdxRibbon read GetRibbon;
//    property RibbonMode: TATRibbonMode write SetRibbonMode;
  end;

  /// <summary>
  ///   Defines an interface to provide child window ribbon merge
  ///   notifications to the main UI window.
  /// </summary>
  IATMainRibbonMerge = interface(IInterface)
    ['{9BE7EE48-C3F6-45FC-A861-AD4B257A2375}']
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
    ['{C30B3C66-4CBD-4DE3-9144-E878AD261B34}']
//    function GetActiveRibbonTabIndex: Integer;
//    function GetRibbonMode: TATRibbonMode;
//    property ActiveRibbonTabIndex: Integer read GetActiveRibbonTabIndex;
//    property RibbonMode: TATRibbonMode read GetRibbonMode;
  end;

  /// <summary>
  ///   Defines an interface to allow interaction with the main
  ///   form's client tab UI.
  /// </summary>
  IATMainTabUI = interface
    ['{23FB43F2-321C-45C2-993D-CD83DB53B024}']
//    procedure AddTabChild(ATabSheet: TcxTabSheet);
//    procedure AddTabFormChild(AFormClass: TfrmGenericTabFormClass);
//    procedure AddTabFrameChild(AFrameClass: TCustomFrameClass);
//    function GetActiveTabChild: TcxTabSheet;
//    function GetTabChildCount: Integer;
//    function GetTabChildren(Index: Integer): TcxTabSheet;
//    procedure SetActiveTabChild(const Value: TcxTabSheet);
//    property ActiveTabChild: TcxTabSheet read GetActiveTabChild write
//        SetActiveTabChild;
//    property TabChildCount: Integer read GetTabChildCount;
//    property TabChildren[Index: Integer]: TcxTabSheet read GetTabChildren;
  end;

  /// <summary>
  ///   Defines an interface to provide basic interactions with the
  ///   main UI window.
  /// </summary>
  IATMainUI = interface(IInterface)
    ['{CB634F7A-A5AC-4625-8AF2-87B11A40B7D7}']
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
    ['{9D0F6965-B885-4CFA-834E-866EBB9BBACD}']
    function GetHasStatusBar: Boolean;
    property HasStatusBar: Boolean read GetHasStatusBar;
  end;

  /// <summary>
  ///   Defines an interface to query the main UI window's
  ///   properties.
  /// </summary>
  IATMainUIQuery = interface(IInterface)
    ['{1C85BA4D-BDEE-4F15-A2DD-2DA8C75FC32A}']
    function GetIsStatusBarVisible: Boolean;
    property IsStatusBarVisible: Boolean read GetIsStatusBarVisible;
  end;

  /// <summary>
  ///   Defines an interface to allow a form to save/load its
  ///   settings.
  /// </summary>
  IATPersistentForm = interface(IInterface)
    ['{DDC20C2B-C369-4DA5-915A-A3AD5E7E62C4}']
    procedure LoadFormState;
    procedure SaveFormState;
  end;

  /// <summary>
  ///   Defines an interface to allow a child form to provide
  ///   search/replace functionality.
  /// </summary>
  IATSearch = interface(IInterface)
    ['{C34DF058-4E8D-4F56-B1B6-AA8C7A044355}']
    procedure Find;
    procedure Replace;
  end;

  /// <summary>
  ///   Defines an interface to determine a child form's
  ///   search/replace capabilities.
  /// </summary>
  IATSearchCaps = interface(IInterface)
    ['{E4C594CD-826F-44B6-A939-930C9A13B9D1}']
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
    ['{2D4F7955-AF65-41AC-804C-C5CA0A4D2D92}']
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
    ['{EE7B0693-4782-4FB0-8AF5-DB8BD46D49C4}']
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
    ['{18D2B8D5-EB93-4BD5-B8D5-45718313D555}']
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
    ['{A59DC9D0-EE73-45E7-9722-47EBA7A4F608}']
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
    ['{8DCED7E1-752A-4851-9D9E-E7065B33B03B}']
    procedure TabCaptionChanged(const Value: String);
  end;

  /// <summary>
  ///   Defines an interface to provide basic interactions with a
  ///   form based Tab child.
  /// </summary>
  IATTabFormChildUI = interface(IInterface)
    ['{D5FA5E49-BF31-45FA-BACB-C40B9AC47253}']
//    function GetForm: TfrmGenericTabForm;
//    property Form: TfrmGenericTabForm read GetForm;
  end;

  /// <summary>
  ///   Defines an interface to allow programmatic interaction with
  ///   an tab child form's ribbon controls.
  /// </summary>
  IATTabFormRibbon = interface(IInterface)
    ['{7BA09177-F52F-48EA-9EDD-48D416863889}']
//    function GetActiveRibbonTabIndex: Integer;
//    function GetRibbon: TdxRibbon;
//    procedure MergeToRibbon(ARibbon: TdxRibbon);
//    procedure SetActiveRibbonTabIndex(Value: Integer);
//    procedure UnmergeFromRibbon(ARibbon: TdxRibbon);
//    property ActiveRibbonTabIndex: Integer read GetActiveRibbonTabIndex write
//        SetActiveRibbonTabIndex;
//    property Ribbon: TdxRibbon read GetRibbon;
  end;

  /// <summary>
  ///   Defines an interface to allow the main UI window to ask a
  ///   child tab form's tab hint.
  /// </summary>
  IATTabFormTabHint = interface(IInterface)
    ['{6FD730F1-91CA-4282-8EFE-E28C8A6BDAA0}']
    function GetTabHint: String;
    property TabHint: String read GetTabHint;
  end;

  /// <summary>
  ///   Defines an interface to provide basic interactions with a
  ///   Tab child's frame.
  /// </summary>
  IATTabFormUI = interface(IInterface)
    ['{E1C2FA18-4F08-4021-B2C1-77856B863D13}']
    procedure BeginUpdate;
    procedure EndUpdate;
    procedure SynchronizeUIObjects;
  end;

  /// <summary>
  ///   Defines an interface to provide basic interactions with a
  ///   frame based Tab child.
  /// </summary>
  IATTabFrameChildUI = interface(IInterface)
    ['{4AE7C5FD-B4E5-424F-B589-EF4E81232F9D}']
    function GetFrame: TFrame;
    property Frame: TFrame read GetFrame;
  end;

  /// <summary>
  ///   Defines an interface to ask a frame if it can close.
  /// </summary>
  IATTabFrameCloseQuery = interface
    ['{F3C13925-6BA5-4B41-9D7F-425C337B987F}']
    function CloseQuery: Boolean;
  end;

  /// <summary>
  ///   Defines an interface to ask a frame if it is a non-closing
  ///   frame.
  /// </summary>
  IATTabFrameNonClosing = interface
    ['{57948E3A-C978-4A33-BEC5-45CD7BE86A18}']
    function GetIsNonClosing: Boolean;
    property IsNonClosing: Boolean read GetIsNonClosing;
  end;

  /// <summary>
  ///   Defines an interface to allow the main UI window to ask a
  ///   child tab frame's tab hint.
  /// </summary>
  IATTabFrameTabHint = interface(IInterface)
    ['{B1E3D227-F005-43A6-B935-CC53939468BD}']
    function GetTabHint: String;
    property TabHint: String read GetTabHint;
  end;

  /// <summary>
  ///   Defines an interface to provide basic interactions with a
  ///   Tab child's frame.
  /// </summary>
  IATTabFrameUI = interface(IInterface)
    ['{EC7BDC4C-F93A-4924-822A-B8BD180E1301}']
    procedure BeginUpdate;
    procedure EndUpdate;
    procedure SynchronizeUIObjects;
  end;

  /// <summary>
  ///   Defines an interface to ask a tab form/frame for the image
  ///   index to use for the associated tabsheet.
  /// </summary>
  IATTabImageIndex = interface
    ['{FBAE777B-DD8F-4743-8DB4-1ABAB32D4ECE}']
    function GetTabImageIndex: Integer;
    property TabImageIndex: Integer read GetTabImageIndex;
  end;

  IATThemedForm = interface(IInterface)
    ['{021D02CF-DCE1-4277-9A43-4BC6E661D941}']
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
    ['{54952B5B-D7A0-43C3-9A05-4BB2E6B17231}']
    procedure Redo;
    procedure Undo;
  end;

  /// <summary>
  ///   Defines an interface to determine a child form's undo/redo
  ///   capabilities.
  /// </summary>
  IATUndoCaps = interface(IInterface)
    ['{550907A9-783F-4AA0-92DF-709393000B91}']
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
    ['{D593D5F7-1171-4079-ADEC-F7FC5ECED414}']
    function GetCanRedo: Boolean;
    function GetCanUndo: Boolean;
    property CanRedo: Boolean read GetCanRedo;
    property CanUndo: Boolean read GetCanUndo;
  end;


implementation

end.
