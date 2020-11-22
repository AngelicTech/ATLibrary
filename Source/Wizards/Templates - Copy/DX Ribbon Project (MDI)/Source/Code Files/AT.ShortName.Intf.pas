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
  Vcl.Forms, dxRibbon, AT.ShortName.Types;

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

  /// <summary>
  ///   Defines an interface to allow a frame type to be activated
  ///   when its parent window is activated.
  /// </summary>
  IATFrameActivate = interface(IInterface)
    ['{DBE44D2C-907F-4BD0-ABC8-039D87088B6B}']
    procedure ActivateFrame;
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
  ///   Defines an interface to allow programmatic interaction with
  ///   an MDI child window's ribbon controls.
  /// </summary>
  IATMDIChildRibbon = interface(IInterface)
    ['{F8618CD8-800D-4B87-A237-90DBFE3422CB}']
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
  ///   child window's tab hint.
  /// </summary>
  IATMDIChildTabHint = interface(IInterface)
    ['{4405A700-13D9-4A92-83CB-89B0DD22A272}']
    function GetTabHint: String;
    property TabHint: String read GetTabHint;
  end;

  /// <summary>
  ///   Defines an interface to provide basic interactions with an
  ///   MDI child window.
  /// </summary>
  IATMDIChildUI = interface(IInterface)
    ['{3D27FC0F-BE37-414A-A9B1-107102A4DC39}']
    procedure BeginUpdate;
    procedure EndUpdate;
    procedure SynchronizeUIObjects;
  end;

  /// <summary>
  ///   Defines an interface to allow programmatic interaction with
  ///   an MDI child form's frame.
  /// </summary>
  IATMDIFrameChild = interface(IInterface)
    ['{1A5C1659-8B55-4EE3-B941-36C520FC1489}']
    procedure CreateFrame;
    procedure DestroyFrame;
    function GetFrame: TCustomFrame;
    property Frame: TCustomFrame read GetFrame;
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
