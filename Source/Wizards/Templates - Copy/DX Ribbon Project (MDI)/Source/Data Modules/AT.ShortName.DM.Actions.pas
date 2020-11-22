// ******************************************************************
//
// Program Name   : $ProgramName$
// Platform(s)    : $Platforms$
// Framework      : VCL
//
// Filename       : AT.$ShortName$.DM.Actions.pas/.dfm
// File Version   : 1.00
// Date Created   : $CreateDate$
// Author         : Matthew Vesperman
//
// Description:
//
// $ProgramName$'s global actions.
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
///   $ProgramName$'s global actions.
/// </summary>
unit AT.ShortName.DM.Actions;

interface

uses
  System.SysUtils, System.Classes, System.Actions, Vcl.ActnList,
  AT.Vcl.Actions.Data, AT.ShortName.Types;

type
  /// <summary>
  ///   Global actions data module class.
  /// </summary>
  TdmActions = class(TDataModule)
    actClipCopy: TATBooleanDataAction;
    actClipCut: TATBooleanDataAction;
    actClipPaste: TATBooleanDataAction;
    actEditRedo: TATBooleanDataAction;
    actEditUndo: TATBooleanDataAction;
    actHelpTOC: TATBooleanDataAction;
    actKbdCapsState: TATBooleanDataAction;
    actKbdNumState: TATBooleanDataAction;
    actKbdOvrMode: TATBooleanDataAction;
    actKbdScrlState: TATBooleanDataAction;
    actQATEditRedo: TATBooleanDataAction;
    actQATEditUndo: TATBooleanDataAction;
    actSearchFind: TATBooleanDataAction;
    actSearchReplace: TATBooleanDataAction;
    actSelect: TATBooleanDataAction;
    actSelectAll: TATBooleanDataAction;
    actSelectInvert: TATBooleanDataAction;
    actSelectNone: TATBooleanDataAction;
    actTATHelpTOC: TATBooleanDataAction;
    actTATSearchFind: TATBooleanDataAction;
    actTATSearchReplace: TATBooleanDataAction;
    actUIQATTouchMode: TATBooleanDataAction;
    actUIRibbon: TATBooleanDataAction;
    actUIRibModeAH: TATMultiDataAction;
    actUIRibModeTC: TATMultiDataAction;
    actUIRibModeTO: TATMultiDataAction;
    actUIStatusBar: TATBooleanDataAction;
    actUITouchMode: TATBooleanDataAction;
    alstMain: TActionList;
    /// <summary>
    ///   Data module's OnCreate event handler.
    /// </summary>
    /// <remarks>
    ///   Initializes the Actions data module.
    /// </remarks>
    procedure DataModuleCreate(Sender: TObject);
    /// <summary>
    ///   Default action execution event handler.
    /// </summary>
    /// <param name="Action">
    ///   A reference to an action that needs to be executed.
    /// </param>
    /// <param name="Handled">
    ///   Returns the result of the event handler execution.
    /// </param>
    /// <example>
    ///   <para>
    ///     This event handler attempts to invoke the action's
    ///     OnExecute event handler if one exists.
    ///   </para>
    ///   <para>
    ///     If the action did not have an OnExecute handler then a
    ///     default message is constructed and displayed to
    ///     indicate that the action has not been implemented yet.
    ///   </para>
    /// </example>
    procedure ExecuteActionListAction(Action: TBasicAction;
        var Handled: Boolean);
    procedure ExecuteCapsStateAction(Sender: TObject);
    procedure ExecuteClipCopyAction(Sender: TObject);
    procedure ExecuteClipCutAction(Sender: TObject);
    procedure ExecuteClipPasteAction(Sender: TObject);
    procedure ExecuteDoNothing(Sender: TObject);
    procedure ExecuteEditRedoAction(Sender: TObject);
    procedure ExecuteEditUndoAction(Sender: TObject);
    procedure ExecuteHelpTOCAction(Sender: TObject);
    procedure ExecuteInsModeStateAction(Sender: TObject);
    procedure ExecuteNumStateAction(Sender: TObject);
    procedure ExecuteRibbonModeAction(Sender: TObject);
    procedure ExecuteScrollStateAction(Sender: TObject);
    procedure ExecuteSearchFindAction(Sender: TObject);
    procedure ExecuteSearchReplaceAction(Sender: TObject);
    procedure ExecuteSelectAllAction(Sender: TObject);
    procedure ExecuteSelectInvertAction(Sender: TObject);
    procedure ExecuteSelectNoneAction(Sender: TObject);
    procedure ExecuteTouchModeAction(Sender: TObject);
    procedure ExecuteUIStatusBarAction(Sender: TObject);
    procedure UpdateActionListActions(Action: TBasicAction;
        var Handled: Boolean);
    procedure UpdateCapsStateAction(Sender: TObject);
    procedure UpdateClipCopyAction(Sender: TObject);
    procedure UpdateClipCutAction(Sender: TObject);
    procedure UpdateClipPasteAction(Sender: TObject);
    procedure UpdateEditRedoAction(Sender: TObject);
    procedure UpdateEditUndoAction(Sender: TObject);
    procedure UpdateInsModeStateAction(Sender: TObject);
    procedure UpdateNumStateAction(Sender: TObject);
    procedure UpdateRibbonAction(Sender: TObject);
    procedure UpdateRibbonModeAction(Sender: TObject);
    procedure UpdateSearchFindAction(Sender: TObject);
    procedure UpdateSearchReplaceAction(Sender: TObject);
    procedure UpdateSelectAction(Sender: TObject);
    procedure UpdateSelectAllAction(Sender: TObject);
    procedure UpdateSelectInvertAction(Sender: TObject);
    procedure UpdateSelectNoneAction(Sender: TObject);
    procedure UpdateSrollStateAction(Sender: TObject);
    procedure UpdateTouchModeAction(Sender: TObject);
    procedure UpdateUIStatusBarAction(Sender: TObject);
  strict protected
    /// <summary>
    ///   ShowClipboard property getter.
    /// </summary>
    function GetShowClipboard: Boolean;
    /// <summary>
    ///   ShowEditing property getter.
    /// </summary>
    function GetShowEditing: Boolean;
    /// <summary>
    ///   Informs the main form and active child form to synchronize
    ///   their UI controls with the current application state.
    /// </summary>
    procedure _SynchronizeUIObjects;
    /// <summary>
    ///   Updates an individual action object.
    /// </summary>
    /// <param name="Action">
    ///   A reference to the action object that needs to be updated.
    /// </param>
    /// <returns>
    ///   Returns TRUE if the action is successfully updated, FALSE
    ///   otherwise.
    /// </returns>
    /// <remarks>
    ///   <para>
    ///     If the app has an active child form the action's update
    ///     handler is called directly (using RTTI).
    ///   </para>
    ///   <para>
    ///     If there is NO active child form, then it checks to see
    ///     if the action is a TATBooleanDataAction. If it is, it
    ///     check its DATA property. If its DATA property id TRUE
    ///     it calls the action's update handler using rtti. If its
    ///     DATA property is FALSE its ENABLED property is set to
    ///     FALSE.
    ///   </para>
    ///   <para>
    ///     Next it will check if the action is a
    ///     TATMultiDataAction. If it is, it check its BOOLEANDATA
    ///     property. If its BOOLEANDATA property id TRUE it calls
    ///     the action's update handler using rtti. If its
    ///     BOOLEANDATA property is FALSE its ENABLED property is
    ///     set to FALSE.
    ///   </para>
    ///   <para>
    ///     Finally, if none of the above conditions are true, it
    ///     checks the action's TAG property. If the TAG property
    ///     is -1 then it call;s the action's update handler using
    ///     rtti. If the TAG property is not -1 then the action's
    ///     ENABLED property is set to FALSE.
    ///   </para>
    /// </remarks>
    function _UpdateAction(Action: TContainedAction): Boolean;
    /// <summary>
    ///   Updates an individual action object if there is an active
    ///   child window.
    /// </summary>
    /// <param name="Action">
    ///   A reference to the action object that needs to be updated.
    /// </param>
    /// <param name="AValue">
    ///   Receives the result of invoking the action's update handler
    ///   if there is an active child window. Otherwise FALSE is
    ///   returned in this parameter.
    /// </param>
    /// <returns>
    ///   Returns TRUE if there is an active child window, FALSE
    ///   otherwise.
    /// </returns>
    /// <remarks>
    ///   If the app has an active child form the action's update
    ///   handler is called directly (using RTTI).
    /// </remarks>
    function _UpdateHasActiveChildAction(Action: TContainedAction;
        out AValue: Boolean): Boolean;
    procedure _UpdateIntfAction<TCapIntf, TQryIntf>(Sender: TObject;
        Target: TObject; AVisibleIID: TGUID;
        AVisibleFunc: TATUpdateIntfFunc<TCapIntf>;
        AEnableIID: TGUID; AEnableFunc: TATUpdateIntfFunc<TQryIntf>);
    /// <summary>
    ///   Updates an individual action object if its TAG property is
    ///   -1, otherwise the action's ENABLED property is set to
    ///   FALSE.
    /// </summary>
    /// <param name="Action">
    ///   A reference to the action object that needs to be updated.
    /// </param>
    /// <param name="AValue">
    ///   Receives the result of invoking the action's update handler
    ///   if the action's TAG property is -1. Otherwise FALSE is
    ///   returned in this parameter.
    /// </param>
    /// <remarks>
    ///   Checks the action's TAG property. If the TAG property is -1
    ///   then it call;s the action's update handler using rtti. If
    ///   the TAG property is not -1 then the action's ENABLED
    ///   property is set to TRUE.
    /// </remarks>
    procedure _UpdateNormalAction(Action: TContainedAction;
        out AValue: Boolean);
    /// <summary>
    ///   Updates a state action's hint and checked properties to
    ///   indicate the current state of the action.
    /// </summary>
    /// <param name="Sender">
    ///   A reference to an action object.
    /// </param>
    /// <param name="IsOn">
    ///   Is the state of the action on?
    /// </param>
    /// <param name="AOnHint">
    ///   The hint to use when the action is on.
    /// </param>
    /// <param name="AOffHint">
    ///   The hint to use when the action is off.
    /// </param>
    /// <remarks>
    ///   This method is used to update the Caps, Num and Scroll lock
    ///   keyboard state actions.
    /// </remarks>
    procedure _UpdateStateAction(Sender: TObject; const IsOn: Boolean;
        const AOnHint: String; const AOffHint: String);
    /// <summary>
    ///   Updates an individual action object if the action is of
    ///   type TATBooleanDataAction.
    /// </summary>
    /// <param name="Action">
    ///   A reference to the action object that needs to be updated.
    /// </param>
    /// <param name="AValue">
    ///   Receives the result of invoking the action's update handler
    ///   if the action is a TATBooleanDataAction and its DATA
    ///   property is TRUE. If its DATA property is FALSE then TRUE
    ///   is returned in this parameter. If the action is NOT a
    ///   TATBooleanDataAction then FALSE is returned in this
    ///   parameter.
    /// </param>
    /// <returns>
    ///   Returns TRUE if the action is successfully updated, FALSE
    ///   otherwise.
    /// </returns>
    /// <remarks>
    ///   Checks to see if the action is a TATBooleanDataAction. If
    ///   it is, check its DATA property. If its DATA property is
    ///   TRUE it calls the action's update handler using rtti. If
    ///   its DATA property is FALSE its ENABLED property is set to
    ///   FALSE.
    /// </remarks>
    function _UpdateTATBooleanDataAction(Action: TContainedAction;
        out AValue: Boolean): Boolean;
    /// <summary>
    ///   Updates an individual action object if the action is of
    ///   type TATMultiDataAction.
    /// </summary>
    /// <param name="Action">
    ///   A reference to the action object that needs to be updated.
    /// </param>
    /// <param name="AValue">
    ///   Receives the result of invoking the action's update handler
    ///   if the action is a TATMultiDataAction and its BOOLEANDATA
    ///   property is TRUE. If its BOOLEANDATA property is FALSE then
    ///   TRUE is returned in this parameter. If the action is NOT a
    ///   TATMultiDataAction then FALSE is returned in this
    ///   parameter.
    /// </param>
    /// <returns>
    ///   Returns TRUE if the action is successfully updated, FALSE
    ///   otherwise.
    /// </returns>
    /// <remarks>
    ///   Checks to see if the action is a TATMultiDataAction. If it
    ///   is, check its BOOLEANDATA property. If its BOOLEAN DATA
    ///   property is TRUE it calls the action's update handler using
    ///   rtti. If its BOOLEANDATA property is FALSE its ENABLED
    ///   property is set to FALSE.
    /// </remarks>
    function _UpdateTATMultiDataAction(Action: TContainedAction;
        out AValue: Boolean): Boolean;
  public
    /// <summary>
    ///   Opens the local help file and displays the table of
    ///   contents.
    /// </summary>
    procedure HelpShowTOC;
    /// <summary>
    ///   Updates all global actions.
    /// </summary>
    procedure UpdateAllActions;
    /// <summary>
    ///   Read-Only property indicating if the main UI should show
    ///   the clipboard toolbar in the ribbon.
    /// </summary>
    property ShowClipboard: Boolean read GetShowClipboard;
    /// <summary>
    ///   Read-Only property indicating if the main UI should show
    ///   the editing toolbar in the ribbon.
    /// </summary>
    property ShowEditing: Boolean read GetShowEditing;
  end;

var
  /// <summary>
  ///   Holds a reference to the global Actions data module.
  /// </summary>
  dmActions: TdmActions;

/// <summary>
///   Returns a reference to the global Actions data module.
/// </summary>
function Actions: TdmActions;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses
  AT.GarbageCollector, AT.ShortName.Vcl.Dialogs.SplashDX,
  AT.ShortName.ResourceStrings, System.Rtti,
  AT.ShortName.ObjectServices, AT.ShortName.Intf,
  AT.ShortName.DM.Services.Application, AT.ShortName.DM.Images,
  AT.ShortName.DM.Services.Dialogs, AT.ShortName.DM.Services.Themes,
  AT.Windows;

{$R *.dfm}

var
  /// <summary>
  ///   Module level garbage collector object.
  /// </summary>
  MGC: IATGarbageCollector;

function Actions: TdmActions;
begin
  if (NOT Assigned(dmActions)) then
    begin
      dmActions := TATGC.Collect(TdmActions.Create(NIL), MGC);
    end;

  Result := dmActions;
end;

procedure TdmActions.DataModuleCreate(Sender: TObject);
begin
  //Display startup message in splash screen...
  TdlgSplashDX.ChangeStartMessage(rstrStartInitActions, 500);

  //Update all actions...
  UpdateAllActions;
end;

procedure TdmActions.ExecuteActionListAction(Action: TBasicAction;
    var Handled: Boolean);
var
  AValue: TValue;
  AMsg: String;
begin
  //Try and invoke the OnExecute event handler of the action...
  Handled := ObjectServices.InvokeNotifyEvent(Action, 'OnExecute');

  //Did the action execute???
  if (NOT Handled) then
    //No...
    begin
      //Initialize message variable...
      AMsg := EmptyStr;

      //Try and get the action's category name...
      if (ObjectServices.GetObjectPropValue(Action, 'Category',
          AValue)) then
        begin
          //Set message to category name...
          AMsg := AValue.AsString;
        end;

      //Try and get the action's caption...
      if (ObjectServices.GetObjectPropValue(Action, 'Caption',
          AValue)) then
        begin
          //Is message empty???
          if (NOT AMsg.IsEmpty) then
            //No, append caption to message...
            AMsg := Format('%s|%s', [AMsg, AValue.AsString])
          else
            //Yes, set message to caption...
            AMsg := AValue.AsString;
        end;

      //Is message still empty???
      if (NOT AMsg.IsEmpty) then
        //No, format message string...
        AMsg := Format('%s is not yet implemented!', [AMsg])
      else
        //Yes, use default message string...
        AMsg := 'Action is not yet implemented!';

      //Display message to user...
      TDlgServices.ShowMessage(AMsg);
    end;
end;

procedure TdmActions.ExecuteCapsStateAction(Sender: TObject);
begin
  ToggleCapsLock;
end;

procedure TdmActions.ExecuteClipCopyAction(Sender: TObject);
var
  AIntf: IATClipboard;
begin
  if (AppServices.ActiveChildSupports(IATClipboard, AIntf)) then
    AIntf.CopyToClipboard;
end;

procedure TdmActions.ExecuteClipCutAction(Sender: TObject);
var
  AIntf: IATClipboard;
begin
  if (AppServices.ActiveChildSupports(IATClipboard, AIntf)) then
    AIntf.CutToClipboard;
end;

procedure TdmActions.ExecuteClipPasteAction(Sender: TObject);
var
  AIntf: IATClipboard;
begin
  if (AppServices.ActiveChildSupports(IATClipboard, AIntf)) then
    AIntf.PasteFromClipboard;
end;

procedure TdmActions.ExecuteDoNothing(Sender: TObject);
begin
  //Do nothing...
end;

procedure TdmActions.ExecuteEditRedoAction(Sender: TObject);
var
  AIntf: IATUndo;
begin
  if (AppServices.ActiveChildSupports(IATUndo, AIntf)) then
    AIntf.Redo;
end;

procedure TdmActions.ExecuteEditUndoAction(Sender: TObject);
var
  AIntf: IATUndo;
begin
  if (AppServices.ActiveChildSupports(IATUndo, AIntf)) then
    AIntf.Undo;
end;

procedure TdmActions.ExecuteHelpTOCAction(Sender: TObject);
begin
  HelpShowTOC;
end;

procedure TdmActions.ExecuteInsModeStateAction(Sender: TObject);
var
  AIntf: IATInsOvr;
begin
  if (NOT AppServices.ActiveChildSupports(IATInsOvr, AIntf)) then
    Exit;

  AIntf.ToggleInsertMode;
end;

procedure TdmActions.ExecuteNumStateAction(Sender: TObject);
begin
  ToggleNumLock;
end;

procedure TdmActions.ExecuteRibbonModeAction(Sender: TObject);
var
  AIntf: IATMainRibbon;
  AValue: TValue;
begin
  if (AppServices.MainFormSupports(IATMainRibbon, AIntf)) then
    begin
      if (ObjectServices.GetObjectPropValue(
          Sender, 'Int32Data', AValue)) then
        begin
          AIntf.RibbonMode := TATRibbonMode(AValue.AsInteger);
        end;
    end;
end;

procedure TdmActions.ExecuteScrollStateAction(Sender: TObject);
begin
  ToggleScrollLock;
end;

procedure TdmActions.ExecuteSearchFindAction(Sender: TObject);
var
  AIntf: IATSearch;
begin
  if (AppServices.ActiveChildSupports(IATSearch, AIntf)) then
    AIntf.Find;
end;

procedure TdmActions.ExecuteSearchReplaceAction(Sender: TObject);
var
  AIntf: IATSearch;
begin
  if (AppServices.ActiveChildSupports(IATSearch, AIntf)) then
    AIntf.Replace;
end;

procedure TdmActions.ExecuteSelectAllAction(Sender: TObject);
var
  AIntf: IATSelection;
begin
  if (AppServices.ActiveChildSupports(IATSelection, AIntf)) then
    AIntf.SelectAll;
end;

procedure TdmActions.ExecuteSelectInvertAction(Sender: TObject);
var
  AIntf: IATSelection;
begin
  if (AppServices.ActiveChildSupports(IATSelection, AIntf)) then
    AIntf.InvertSelection;
end;

procedure TdmActions.ExecuteSelectNoneAction(Sender: TObject);
var
  AIntf: IATSelection;
begin
  if (AppServices.ActiveChildSupports(IATSelection, AIntf)) then
    AIntf.SelectNone;
end;

procedure TdmActions.ExecuteTouchModeAction(Sender: TObject);
begin
  ThemeServices.TouchMode := (NOT ThemeServices.TouchMode);
end;

procedure TdmActions.ExecuteUIStatusBarAction(Sender: TObject);
var
  AIntf: IATMainUI;
begin
  if (AppServices.MainFormSupports(IATMainUI, AIntf)) then
    AIntf.ToggleStatusBarVisible;
end;

function TdmActions.GetShowClipboard: Boolean;
begin
  Result := ( actClipCopy.Visible OR
              actClipCut.Visible OR
              actClipPaste.Visible );
end;

function TdmActions.GetShowEditing: Boolean;
begin
  Result := ( actEditRedo.Visible OR
              actEditUndo.Visible OR
              actSearchFind.Visible OR
              actSearchReplace.Visible OR
              actSelect.Visible
              );

end;

procedure TdmActions.HelpShowTOC;
begin
  AppServices.HelpShowTOC;
end;

procedure TdmActions.UpdateActionListActions(Action: TBasicAction;
    var Handled: Boolean);
begin
  Handled := True;
end;

procedure TdmActions.UpdateAllActions;
var
  bSynchronize: Boolean;
  Action: TContainedAction;
  bTemp: Boolean;
begin
  bSynchronize := False;

  for Action in alstMain do
    begin
      bTemp := _UpdateAction(Action);

      bSynchronize := (bTemp OR bSynchronize);
    end;

  if (bSynchronize) then
    _SynchronizeUIObjects;
end;

procedure TdmActions.UpdateCapsStateAction(Sender: TObject);
begin
  _UpdateStateAction(Sender, IsCapsLockOn, rstrHintKbdCapsOn,
      rstrHintKbdCapsOff);
end;

procedure TdmActions.UpdateClipCopyAction(Sender: TObject);
begin
  _UpdateIntfAction<IATClipboardCaps, IATClipboardQuery>(Sender,
      AppServices.ActiveChild,
      IATClipboardCaps,
      function (AIntf: IATClipboardCaps): Boolean
        begin
          Result := AIntf.HasCopy;
        end,
      IATClipboardQuery,
      function (AIntf: IATClipboardQuery): Boolean
        begin
          Result := AIntf.CanCopy;
        end);
end;

procedure TdmActions.UpdateClipCutAction(Sender: TObject);
begin
  _UpdateIntfAction<IATClipboardCaps, IATClipboardQuery>(Sender,
      AppServices.ActiveChild,
      IATClipboardCaps,
      function (AIntf: IATClipboardCaps): Boolean
        begin
          Result := AIntf.HasCut;
        end,
      IATClipboardQuery,
      function (AIntf: IATClipboardQuery): Boolean
        begin
          Result := AIntf.CanCut;
        end);
end;

procedure TdmActions.UpdateClipPasteAction(Sender: TObject);
begin
  _UpdateIntfAction<IATClipboardCaps, IATClipboardQuery>(Sender,
      AppServices.ActiveChild,
      IATClipboardCaps,
      function (AIntf: IATClipboardCaps): Boolean
        begin
          Result := AIntf.HasPaste;
        end,
      IATClipboardQuery,
      function (AIntf: IATClipboardQuery): Boolean
        begin
          Result := AIntf.CanPaste;
        end);
end;

procedure TdmActions.UpdateEditRedoAction(Sender: TObject);
begin
  _UpdateIntfAction<IATUndoCaps, IATUndoQuery>(Sender,
      AppServices.ActiveChild,
      IATUndoCaps,
      function (AIntf: IATUndoCaps): Boolean
        begin
          Result := AIntf.HasRedo;
        end,
      IATUndoQuery,
      function (AIntf: IATUndoQuery): Boolean
        begin
          Result := AIntf.CanRedo;
        end);
end;

procedure TdmActions.UpdateEditUndoAction(Sender: TObject);
begin
  _UpdateIntfAction<IATUndoCaps, IATUndoQuery>(Sender,
      AppServices.ActiveChild,
      IATUndoCaps,
      function (AIntf: IATUndoCaps): Boolean
        begin
          Result := AIntf.HasUndo;
        end,
      IATUndoQuery,
      function (AIntf: IATUndoQuery): Boolean
        begin
          Result := AIntf.CanUndo;
        end);
end;

procedure TdmActions.UpdateInsModeStateAction(Sender: TObject);
var
  AVisible: Boolean;
  AIntf: IATInsOvrQuery;
  AOvr: Boolean;
begin
  AVisible := AppServices.ActiveChildSupports(IATInsOvrQuery, AIntf);

  TATObjectServices.SetObjectVisible(Sender, AVisible);

  if (NOT AVisible) then
    Exit;

  AOvr := (NOT AIntf.InsertMode);

  if (AOvr) then
    begin
      TATObjectServices.SetObjectCaption(Sender, rstrCapKbdInsOff);
      TATObjectServices.SetObjectHint(Sender, rstrHintKbdInsOff);
    end
  else
    begin
      TATObjectServices.SetObjectCaption(Sender, rstrCapKbdInsOn);
      TATObjectServices.SetObjectHint(Sender, rstrHintKbdInsOn);
    end;
end;

procedure TdmActions.UpdateNumStateAction(Sender: TObject);
begin
  _UpdateStateAction(Sender, IsNumLockOn, rstrHintKbdNumOn,
      rstrHintKbdNumOff);
end;

procedure TdmActions.UpdateRibbonAction(Sender: TObject);
var
  AIntf: IATMainRibbon;
  AOk: Boolean;
begin
  if (AppServices.MainFormSupports(IATMainRibbon, AIntf)) then
    AOk := (Assigned(AIntf.Ribbon))
  else
    AOk := False;

  ObjectServices.SetObjectEnabled(Sender, AOk);
  ObjectServices.SetObjectVisible(Sender, AOk);
end;

procedure TdmActions.UpdateRibbonModeAction(Sender: TObject);
var
  AIntf: IATMainRibbon;
  AOk: Boolean;
  AQry: IATMainRibbonQuery;
  AValue: TValue;
begin
  if (AppServices.MainFormSupports(IATMainRibbon, AIntf)) then
    AOk := (Assigned(AIntf.Ribbon))
  else
    AOk := False;

  ObjectServices.SetObjectEnabled(Sender, AOk);
  ObjectServices.SetObjectVisible(Sender, AOk);

  if (AppServices.MainFormSupports(IATMainRibbonQuery, AQry)) then
    begin
      if (ObjectServices.GetObjectPropValue(
          Sender, 'Int32Data', AValue)) then
        AOk := (AValue.AsInteger = Ord(AQry.RibbonMode))
      else
        AOk := False;
    end
  else
    AOk := False;

  ObjectServices.SetObjectChecked(Sender, AOk);
end;

procedure TdmActions.UpdateSearchFindAction(Sender: TObject);
begin
  _UpdateIntfAction<IATSearchCaps, IATSearchQuery>(Sender,
      AppServices.ActiveChild,
      IATSearchCaps,
      function (AIntf: IATSearchCaps): Boolean
        begin
          Result := AIntf.HasFind;
        end,
      IATSearchQuery,
      function (AIntf: IATSearchQuery): Boolean
        begin
          Result := AIntf.CanFind;
        end);
end;

procedure TdmActions.UpdateSearchReplaceAction(Sender: TObject);
begin
  _UpdateIntfAction<IATSearchCaps, IATSearchQuery>(Sender,
      AppServices.ActiveChild,
      IATSearchCaps,
      function (AIntf: IATSearchCaps): Boolean
        begin
          Result := AIntf.HasReplace;
        end,
      IATSearchQuery,
      function (AIntf: IATSearchQuery): Boolean
        begin
          Result := AIntf.CanReplace;
        end);
end;

procedure TdmActions.UpdateSelectAction(Sender: TObject);
begin
  _UpdateIntfAction<IATSelectionCaps, IATSelectionQuery>(Sender,
      AppServices.ActiveChild,
      IATSelectionCaps,
      function (AIntf: IATSelectionCaps): Boolean
        begin
          Result := ( AIntf.HasSelectAll OR
                      AIntf.HasSelectNone OR
                      AIntf.HasInvertSelection );
        end,
      IATSelectionQuery,
      function (AIntf: IATSelectionQuery): Boolean
        begin
          Result := ( AIntf.CanSelectAll OR
                      AIntf.CanSelectNone OR
                      AIntf.CanInvertSelection );
        end);
end;

procedure TdmActions.UpdateSelectAllAction(Sender: TObject);
begin
  _UpdateIntfAction<IATSelectionCaps, IATSelectionQuery>(Sender,
      AppServices.ActiveChild,
      IATSelectionCaps,
      function (AIntf: IATSelectionCaps): Boolean
        begin
          Result := AIntf.HasSelectAll;
        end,
      IATSelectionQuery,
      function (AIntf: IATSelectionQuery): Boolean
        begin
          Result := AIntf.CanSelectAll;
        end);
end;

procedure TdmActions.UpdateSelectInvertAction(Sender: TObject);
begin
  _UpdateIntfAction<IATSelectionCaps, IATSelectionQuery>(Sender,
      AppServices.ActiveChild,
      IATSelectionCaps,
      function (AIntf: IATSelectionCaps): Boolean
        begin
          Result := AIntf.HasInvertSelection;
        end,
      IATSelectionQuery,
      function (AIntf: IATSelectionQuery): Boolean
        begin
          Result := AIntf.CanInvertSelection;
        end);
end;

procedure TdmActions.UpdateSelectNoneAction(Sender: TObject);
begin
  _UpdateIntfAction<IATSelectionCaps, IATSelectionQuery>(Sender,
      AppServices.ActiveChild,
      IATSelectionCaps,
      function (AIntf: IATSelectionCaps): Boolean
        begin
          Result := AIntf.HasSelectNone;
        end,
      IATSelectionQuery,
      function (AIntf: IATSelectionQuery): Boolean
        begin
          Result := AIntf.CanSelectNone;
        end);
end;

procedure TdmActions.UpdateSrollStateAction(Sender: TObject);
begin
  _UpdateStateAction(Sender, IsScrollLockOn, rstrHintKbdScrlOn,
      rstrHintKbdScrlOff);
end;

procedure TdmActions.UpdateTouchModeAction(Sender: TObject);
begin
  TATObjectServices.SetObjectChecked(Sender, ThemeServices.TouchMode);
end;

procedure TdmActions.UpdateUIStatusBarAction(Sender: TObject);
var
  AQry: IATMainUIQuery;
begin
  _UpdateIntfAction<IATMainUICaps, IATMainUIQuery>(Sender,
      AppServices.MainForm,
      IATMainUICaps,
      function (AIntf: IATMainUICaps): Boolean
        begin
          Result := AIntf.HasStatusBar;
        end,
      IATMainUIQuery,
      function (AIntf: IATMainUIQuery): Boolean
        begin
          Result := True;
        end);

  if (AppServices.MainFormSupports(IATMainUIQuery, AQry)) then
    ObjectServices.SetObjectChecked(Sender, AQry.IsStatusBarVisible);
end;

procedure TdmActions._SynchronizeUIObjects;
var
  AFrm: IATMainUI;
  AChild: IATMDIChildUI;
begin
  //Tell main form to synchronize its UI.
  if (AppServices.MainFormSupports(IATMainUI, AFrm)) then
    AFrm.SynchronizeUIObjects;

  //Tell active child form to synchronize its UI.
  if (AppServices.ActiveChildSupports(IATMDIChildUI, AChild)) then
    AChild.SynchronizeUIObjects;
end;

function TdmActions._UpdateAction(Action: TContainedAction): Boolean;
var
  bResult: Boolean;
begin
  //Does the application currently have an active child form???
  if (_UpdateHasActiveChildAction(Action, bResult)) then
    //Exit and pass the result...
    Exit(bResult)

  //No active child... Is the Action a TATBooleanDataAction???
  else if (_UpdateTATBooleanDataAction(Action, bResult)) then
    //Exit and pass the result...
    Exit(bResult)

  //No active child and action is NOT TATBooleanDataAction...
  //Is the Action a TATMultiDataAction???
  else if (_UpdateTATMultiDataAction(Action, bResult)) then
    //Exit and pass the result...
    Exit(bResult)

  //No active child and action is NOT TATBooleanDataAction or
  //TATMultiDataAction. Process a normal action then...
  else
    _UpdateNormalAction(Action, Result);
end;

function TdmActions._UpdateHasActiveChildAction(
  Action: TContainedAction; out AValue: Boolean): Boolean;
begin
  //Does the application currently have an active child form???
  Result := AppServices.HasActiveChild;
  if (Result) then
    //Yes...
    begin
      //Invoke the action's OnUpdate event handler (if any).
      AValue := ObjectServices.InvokeNotifyEvent(Action, 'OnUpdate');
    end
  else
    AValue := False;
end;

//TdmActions._UpdateAction

procedure TdmActions._UpdateIntfAction<TCapIntf, TQryIntf>(
    Sender: TObject; Target: TObject; AVisibleIID: TGUID;
    AVisibleFunc: TATUpdateIntfFunc<TCapIntf>; AEnableIID: TGUID;
    AEnableFunc: TATUpdateIntfFunc<TQryIntf>);
var
  bVisible: Boolean;
  ACaps: TCapIntf;
  AQry: TQryIntf;
  bEnable: Boolean;
begin
  bVisible := (Assigned(Target));

  if (bVisible) then
    begin
      bVisible := (Supports(Target, AVisibleIID, ACaps));

      if (bVisible) then
        bVisible := AVisibleFunc(ACaps);
    end;

  ObjectServices.SetObjectVisible(Sender, bVisible);

  bEnable := (Supports(Target, AEnableIID, AQry));

  if (bEnable) then
    begin
      if (bEnable) then
        bEnable := AEnableFunc(AQry);
    end;

  bEnable := (bVisible AND bEnable);

  ObjectServices.SetObjectEnabled(Sender, bEnable);
end;

procedure TdmActions._UpdateNormalAction(Action: TContainedAction;
  out AValue: Boolean);
var
  AProp: TValue;
begin
  //Get the value of the action's TAG property...
  ObjectServices.GetObjectPropValue(Action, 'Tag', AProp);

  //Is the action's TAG property -1???
  if (AProp.AsInteger = -1) then
    //Yes...
    begin
      //Invoke the action's OnUpdate event handler (if any).
      AValue := ObjectServices.InvokeNotifyEvent(Action,
          'OnUpdate');
    end
  else
    //No...
    begin
      //Disable the action...
      TATObjectServices.SetObjectPropValue(Action, 'Enabled',
          False);
      AValue := True;
    end;
end;

procedure TdmActions._UpdateStateAction(Sender: TObject;
    const IsOn: Boolean; const AOnHint: String;
    const AOffHint: String);
var
  AHint: String;
begin
  TATObjectServices.SetObjectChecked(Sender, IsOn);

  if (IsOn) then
    AHint := AOnHint
  else
    AHint := AOffHint;

  TATObjectServices.SetObjectHint(Sender, AHint);
end;

function TdmActions._UpdateTATBooleanDataAction(
  Action: TContainedAction; out AValue: Boolean): Boolean;
var
  AProp: TValue;
begin
  //Is the Action a TATBooleanDataAction???
  Result := (Action IS TATBooleanDataAction);
  if (Result) then
    //Yes...
    begin
      //Get the value of the action's DATA property...
      ObjectServices.GetObjectPropValue(Action, 'Data', AProp);

      //Is the action's DATA property TRUE???
      if (AProp.AsBoolean) then
        //Yes...
        begin
          //Invoke the action's OnUpdate event handler (if any).
          AValue := ObjectServices.InvokeNotifyEvent(Action,
              'OnUpdate');
        end
      else
        //No...
        begin
          //Disable the action...
          TATObjectServices.SetObjectPropValue(Action, 'Enabled',
              False);

          AValue := True;
        end;
    end
  else
    AValue := False;
end;

function TdmActions._UpdateTATMultiDataAction(
  Action: TContainedAction; out AValue: Boolean): Boolean;
var
  AProp: TValue;
begin
  //Is the Action a TATMultiDataAction???
  Result := (Action IS TATMultiDataAction);
  if (Result) then
    //Yes...
    begin
      //Get the value of the action's BOOLEANDATA property...
      ObjectServices.GetObjectPropValue(Action, 'BooleanData', AProp);

      //Is the action's BOOLEANDATA property TRUE???
      if (AProp.AsBoolean) then
        //Yes...
        begin
          //Invoke the action's OnUpdate event handler (if any).
          AValue := ObjectServices.InvokeNotifyEvent(Action,
              'OnUpdate');
        end
      else
        //No...
        begin
          //Disable the action...
          TATObjectServices.SetObjectPropValue(Action, 'Enabled',
              False);

          AValue := True;
        end;
    end
  else
    AValue := False;
end;

end.
