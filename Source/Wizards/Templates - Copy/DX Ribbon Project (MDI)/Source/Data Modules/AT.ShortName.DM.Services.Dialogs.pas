// ******************************************************************
//
// Program Name   : $ProgramName$
// Platform(s)    : $Platforms$
// Framework      : VCL
//
// Filename       : AT.$ShortName$.DM.Services.Dialogs.pas/.dfm
// File Version   : 1.00
// Date Created   : $CreateDate$
// Author         : Matthew Vesperman
//
// Description:
//
// $ProgramName$'s global dialog services data module.
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

{$WARN SYMBOL_PLATFORM OFF}

/// <summary>
///   $ProgramName$'s global dialog services data module.
/// </summary>
unit AT.ShortName.DM.Services.Dialogs;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.Dialogs;

type
  /// <summary>
  ///   Type to define a reference to a procedure to execute
  ///   before/after a open dialog is displayed.
  /// </summary>
  TATOpenDialogExecProc = reference to procedure(
      var ADialog: TOpenDialog);

  /// <summary>
  ///   Type to define a reference to a procedure to execute
  ///   before/after a save dialog is displayed.
  /// </summary>
  TATSaveDialogExecProc = reference to procedure(
      var ADialog: TSaveDialog);

  /// <summary>
  ///   Type to define a reference to a procedure to execute
  ///   before/after a task dialog is displayed.
  /// </summary>
  TATTaskDialogExecProc = reference to procedure(
      var ATaskDialog: TTaskDialog);

  /// <summary>
  ///   Global dialog services data module.
  /// </summary>
  /// <remarks>
  ///   Several methods in this class require Enable Runtime Themes
  ///   to be enabled in the project options.
  /// </remarks>
  TDlgServices = class(TDataModule)
    dlgOpen: TOpenDialog;
    dlgSave: TSaveDialog;
    tskdlg1: TTaskDialog;
    /// <summary>
    ///   Data module's OnCreate event handler.
    /// </summary>
    /// <remarks>
    ///   Initializes the DlgServices data module.
    /// </remarks>
    procedure DataModuleCreate(Sender: TObject);
  public
    /// <summary>
    ///   Displays an Open File Dialog.
    /// </summary>
    /// <param name="AFileName">
    ///   Receives the name of the selected file if the Open (Ok)
    ///   button was clicked, otherwise it receives an empty string.
    /// </param>
    /// <param name="AFilter">
    ///   (Optional) File type filter string.
    /// </param>
    /// <param name="ACaption">
    ///   (Optional) Title for the open dialog.
    /// </param>
    /// <param name="ABeforeExecute">
    ///   (Optional) Reference to a procedure to call before the
    ///   dialog box is displayed.
    /// </param>
    /// <param name="AAfterExecute">
    ///   (Optional) Reference to a procedure to call after the
    ///   dialog box is displayed.
    /// </param>
    /// <returns>
    ///   TRUE if the dialog's Open (Ok) button was clicked, FALSE
    ///   otherwise.
    /// </returns>
    function OpenFile(out AFileName: String;
        const AFilter: String = 'All Files (*.*)|*.*';
        const ACaption: String = '';
        ABeforeExecute: TATOpenDialogExecProc = NIL;
        AAfterExecute: TATOpenDialogExecProc = NIL): Boolean;
    /// <summary>
    ///   Displays a Save File Dialog.
    /// </summary>
    /// <param name="AFileName">
    ///   Receives the name of the selected file if the Save (Ok)
    ///   button was clicked, otherwise it receives an empty string.
    /// </param>
    /// <param name="AFilter">
    ///   (Optional) File type filter string.
    /// </param>
    /// <param name="ACaption">
    ///   (Optional) Title for the save dialog.
    /// </param>
    /// <param name="ABeforeExecute">
    ///   (Optional) Reference to a procedure to call before the
    ///   dialog box is displayed.
    /// </param>
    /// <param name="AAfterExecute">
    ///   (Optional) Reference to a procedure to call after the
    ///   dialog box is displayed.
    /// </param>
    /// <returns>
    ///   TRUE if the dialog's Save (Ok) button was clicked, FALSE
    ///   otherwise.
    /// </returns>
    function SaveFile(out AFileName: String;
        const AFilter: String = 'All Files (*.*)|*.*';
        const ACaption: String = '';
        ABeforeExecute: TATSaveDialogExecProc = NIL;
        AAfterExecute: TATSaveDialogExecProc = NIL): Boolean;
    /// <summary>
    ///   Displays an error message dialog.
    /// </summary>
    /// <param name="AInstruct">
    ///   Instruction text for the error message dialog.
    /// </param>
    /// <param name="AContent">
    ///   Descriptive text for the error message dialog.
    /// </param>
    /// <param name="ACaption">
    ///   The caption for the error message dialog.
    /// </param>
    /// <param name="AExpText">
    ///   Detail text for the error message dialog.<br />If this
    ///   parameter is an empty string the Show Details button is
    ///   hidden.
    /// </param>
    /// <remarks>
    ///   This method requires Enable Runtime Themes to be
    ///   enabled in the project options.
    /// </remarks>
    class procedure ShowErrorDlg(const AInstruct: String = '';
        const AContent: String = ''; const ACaption: String = 'Error';
        const AExpText: String = '');
    /// <summary>
    ///   Displays an information message dialog.
    /// </summary>
    /// <param name="AInstruct">
    ///   Instruction text for the info message dialog.
    /// </param>
    /// <param name="AContent">
    ///   Descriptive text for the info message dialog.
    /// </param>
    /// <param name="ACaption">
    ///   The caption for the info message dialog.
    /// </param>
    /// <param name="AExpText">
    ///   Detail text for the info message dialog.<br />If this
    ///   parameter is an empty string the Show Details button is
    ///   hidden.
    /// </param>
    /// <remarks>
    ///   This method requires Enable Runtime Themes to be
    ///   enabled in the project options.
    /// </remarks>
    class procedure ShowInfoDlg(const AInstruct: String = '';
        const AContent: String = ''; const ACaption: String = '';
        const AExpText: String = '');
    /// <summary>
    ///   Displays a simple message box with an OK button. The
    ///   application's main window caption appears as the caption of
    ///   the message box.
    /// </summary>
    /// <param name="AMessage">
    ///   The message string that appears in the message box.
    /// </param>
    class procedure ShowMessage(const AMessage: String);
    /// <summary>
    ///   Displays a simple message box with a formatted message and
    ///   an OK button. The application's main window caption appears
    ///   as the caption of the message box.
    /// </summary>
    /// <param name="AMessage">
    ///   A format string for the message that appears in the message
    ///   box.
    /// </param>
    /// <param name="AParams">
    ///   Provides the parameters that are assembled into the message
    /// </param>
    class procedure ShowMessageFmt(const AMessage: String;
        AParams: Array of TVarRec);
    /// <summary>
    ///   Displays a simple message box with an OK button at a
    ///   specified location. The application's main window caption
    ///   appears as the caption of the message box.
    /// </summary>
    /// <param name="AMessage">
    ///   The message string that appears in the message box.
    /// </param>
    /// <param name="X">
    ///   The horizontal screen coordinate where the message box
    ///   should appear. A value of –1 means that the message box can
    ///   appear anywhere in the specified dimension.
    /// </param>
    /// <param name="Y">
    ///   The vertical screen coordinate where the message box should
    ///   appear. A value of –1 means that the message box can appear
    ///   anywhere in the specified dimension.
    /// </param>
    class procedure ShowMessagePos(const AMessage: String;
        X, Y: Integer);
    /// <summary>
    ///   Displays a message dialog to ask the user a Yes or No
    ///   question.
    /// </summary>
    /// <param name="AModalResult">
    ///   Receives the modal result of the query dialog.
    /// </param>
    /// <param name="AInstruct">
    ///   Instruction text for the query dialog.
    /// </param>
    /// <param name="AContent">
    ///   Descriptive text for the query dialog.
    /// </param>
    /// <param name="ACaption">
    ///   The caption for the query dialog.
    /// </param>
    /// <param name="AExpText">
    ///   Detail text for the query dialog.<br />If this parameter
    ///   is an empty string the Show Details button is hidden.
    /// </param>
    /// <param name="AMainIcon">
    ///   Indicates which standard main icon to display in the Task
    ///   Dialog.<br />Legal values include tdiNone, tdiWarning,
    ///   tdiError, tdiInformation, and tdiShield.
    /// </param>
    /// <param name="ABeforeExecute">
    ///   (Optional) Reference to a procedure to call before the
    ///   dialog box is displayed.
    /// </param>
    /// <param name="AAfterExecute">
    ///   (Optional) Reference to a procedure to call after the
    ///   dialog box is displayed.
    /// </param>
    /// <returns>
    ///   TRUE if the Yes button was clicked, FALSE otherwise.
    /// </returns>
    /// <remarks>
    ///   This method requires Enable Runtime Themes to be
    ///   enabled in the project options.
    /// </remarks>
    class function ShowQueryDlg(out AModalResult: TModalResult;
        const AInstruct: String = ''; const AContent: String = '';
        const ACaption: String = 'Query'; const AExpText: String = '';
        AMainIcon: TTaskDialogIcon = tdiInformation;
        ABeforeExecute: TATTaskDialogExecProc = NIL;
        AAfterExecute: TATTaskDialogExecProc = NIL): Boolean;
    /// <summary>
    ///   Displays a security (shield) message dialog.
    /// </summary>
    /// <param name="AInstruct">
    ///   Instruction text for the security message dialog.
    /// </param>
    /// <param name="AContent">
    ///   Descriptive text for the security message dialog.
    /// </param>
    /// <param name="ACaption">
    ///   The caption for the security message dialog.
    /// </param>
    /// <param name="AExpText">
    ///   Detail text for the security message dialog.<br />If this
    ///   parameter is an empty string the Show Details button is
    ///   hidden.
    /// </param>
    /// <remarks>
    ///   This method requires Enable Runtime Themes to be
    ///   enabled in the project options.
    /// </remarks>
    class procedure ShowShieldDlg(const AInstruct: String = '';
        const AContent: String = ''; const ACaption: String = '';
        const AExpText: String = '');
    /// <summary>
    ///   Displays a task message dialog with an OK button.
    /// </summary>
    /// <param name="AInstruct">
    ///   Instruction text for the message dialog.
    /// </param>
    /// <param name="AContent">
    ///   Descriptive text for the message dialog.
    /// </param>
    /// <param name="ACaption">
    ///   The caption for the message dialog.
    /// </param>
    /// <param name="AExpText">
    ///   Detail text for the message dialog.<br />If this parameter
    ///   is an empty string the Show Details button is hidden.
    /// </param>
    /// <param name="AMainIcon">
    ///   Indicates which standard main icon to display in the Task
    ///   Dialog.<br />Legal values include tdiNone, tdiWarning,
    ///   tdiError, tdiInformation, and tdiShield.
    /// </param>
    /// <param name="ABeforeExecute">
    ///   (Optional) Reference to a procedure to call before the
    ///   dialog box is displayed.
    /// </param>
    /// <param name="AAfterExecute">
    ///   (Optional) Reference to a procedure to call after the
    ///   dialog box is displayed.
    /// </param>
    /// <param name="AModalResult">
    ///   Receives the modal result of the message dialog.
    /// </param>
    /// <remarks>
    ///   This method requires Enable Runtime Themes to be
    ///   enabled in the project options.
    /// </remarks>
    class procedure ShowTaskMessageDlg(const AInstruct: String = '';
        const AContent: String = ''; const ACaption: String = '';
        const AExpText: String = '';
        const AMainIcon: TTaskDialogIcon = tdiNone;
        ABeforeExecute: TATTaskDialogExecProc = NIL;
        AAfterExecute: TATTaskDialogExecProc = NIL); overload;
    /// <summary>
    ///   Displays a task message dialog with an OK button.
    /// </summary>
    /// <param name="AModalResult">
    ///   Receives the modal result of the message dialog.
    /// </param>
    /// <param name="AInstruct">
    ///   Instruction text for the message dialog.
    /// </param>
    /// <param name="AContent">
    ///   Descriptive text for the message dialog.
    /// </param>
    /// <param name="ACaption">
    ///   The caption for the message dialog.
    /// </param>
    /// <param name="AExpText">
    ///   Detail text for the message dialog.<br />If this parameter
    ///   is an empty string the Show Details button is hidden.
    /// </param>
    /// <param name="AMainIcon">
    ///   Indicates which standard main icon to display in the Task
    ///   Dialog.<br />Legal values include tdiNone, tdiWarning,
    ///   tdiError, tdiInformation, and tdiShield.
    /// </param>
    /// <param name="ABeforeExecute">
    ///   (Optional) Reference to a procedure to call before the
    ///   dialog box is displayed.
    /// </param>
    /// <param name="AAfterExecute">
    ///   (Optional) Reference to a procedure to call after the
    ///   dialog box is displayed.
    /// </param>
    /// <returns>
    ///   TRUE if the OK button was clicked, FALSE otherwise.
    /// </returns>
    /// <remarks>
    ///   This method requires Enable Runtime Themes to be
    ///   enabled in the project options.
    /// </remarks>
    class function ShowTaskMessageDlg(out AModalResult: TModalResult;
      const AInstruct: String = ''; const AContent: String = '';
      const ACaption: String = ''; const AExpText: String = '';
      const AMainIcon: TTaskDialogIcon = tdiNone;
      ABeforeExecute: TATTaskDialogExecProc = NIL;
      AAfterExecute: TATTaskDialogExecProc = NIL): Boolean; overload;
    /// <summary>
    ///   Displays a warning message dialog.
    /// </summary>
    /// <param name="AInstruct">
    ///   Instruction text for the warning message dialog.
    /// </param>
    /// <param name="AContent">
    ///   Descriptive text for the warning message dialog.
    /// </param>
    /// <param name="ACaption">
    ///   The caption for the warning message dialog.
    /// </param>
    /// <param name="AExpText">
    ///   Detail text for the warning message dialog. <br />If this
    ///   parameter is an empty string the Show Details button is
    ///   hidden.
    /// </param>
    /// <remarks>
    ///   This method requires Enable Runtime Themes to be
    ///   enabled in the project options.
    /// </remarks>
    class procedure ShowWarningDlg(const AInstruct: String = '';
        const AContent: String = '';
        const ACaption: String = 'Warning';
        const AExpText: String = '');
  end;

/// <summary>
///   Returns a reference to the global DlgServices data module.
/// </summary>
function DlgServices: TDlgServices;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses
  AT.GarbageCollector, Vcl.Forms, AT.ShortName.Vcl.Dialogs.SplashDX,
  AT.ShortName.ResourceStrings;

{$R *.dfm}

var
  /// <summary>
  ///   Module level garbage collector object.
  /// </summary>
  MGC: IATGarbageCollector;
  /// <summary>
  ///   Holds a reference to the global DlgServices data module.
  /// </summary>
  dmDlgServices: TDlgServices;

function DlgServices: TDlgServices;
begin
  if (NOT Assigned(dmDlgServices)) then
  begin
    dmDlgServices := TATGC.Collect(TDlgServices.Create(NIL), MGC);
  end;

  Result := dmDlgServices;
end;

procedure TDlgServices.DataModuleCreate(Sender: TObject);
begin
  TdlgSplashDX.ChangeStartMessage(rstrStartInitDlgSvc, 500);
end;

function TDlgServices.OpenFile(out AFileName: String; const AFilter:
    String = 'All Files (*.*)|*.*'; const ACaption: String = '';
    ABeforeExecute: TATOpenDialogExecProc = NIL; AAfterExecute:
    TATOpenDialogExecProc = NIL): Boolean;
begin
  dlgOpen.Filter := AFilter;
  dlgOpen.Title := ACaption;

  if (Assigned(ABeforeExecute)) then
    ABeforeExecute(dlgOpen);

  Result := dlgOpen.Execute(Application.MainFormHandle);

  if (Assigned(AAfterExecute)) then
    AAfterExecute(dlgOpen);

  if (Result) then
    AFileName := dlgOpen.FileName
  else
    AFileName := EmptyStr;
end;

function TDlgServices.SaveFile(out AFileName: String; const AFilter:
    String = 'All Files (*.*)|*.*'; const ACaption: String = '';
    ABeforeExecute: TATSaveDialogExecProc = NIL; AAfterExecute:
    TATSaveDialogExecProc = NIL): Boolean;
begin
  dlgSave.Filter := AFilter;
  dlgSave.Title := ACaption;

  if (Assigned(ABeforeExecute)) then
    ABeforeExecute(dlgSave);

  Result := dlgSave.Execute(Application.MainFormHandle);

  if (Assigned(AAfterExecute)) then
    AAfterExecute(dlgSave);

  if (Result) then
    AFileName := dlgOpen.FileName
  else
    AFileName := EmptyStr;
end;

class procedure TDlgServices.ShowErrorDlg(const AInstruct: String =
    ''; const AContent: String = ''; const ACaption: String =
    'Error'; const AExpText: String = '');
begin
  TDlgServices.ShowTaskMessageDlg(AInstruct, AContent, ACaption,
      AExpText, tdiError);
end;

class procedure TDlgServices.ShowInfoDlg(const AInstruct: String =
    ''; const AContent: String = ''; const ACaption: String = '';
    const AExpText: String = '');
begin
  TDlgServices.ShowTaskMessageDlg(AInstruct, AContent, ACaption,
      AExpText, tdiInformation);
end;

class procedure TDlgServices.ShowMessage(const AMessage: String);
begin
  Vcl.Dialogs.ShowMessage(AMessage);
end;

class procedure TDlgServices.ShowMessageFmt(const AMessage: String;
    AParams: Array of TVarRec);
begin
  Vcl.Dialogs.ShowMessageFmt(AMessage, AParams);
end;

class procedure TDlgServices.ShowMessagePos(const AMessage: String;
    X, Y: Integer);
begin
  Vcl.Dialogs.ShowMessagePos(AMessage, X, Y);
end;

class function TDlgServices.ShowQueryDlg(out AModalResult:
    TModalResult; const AInstruct: String = ''; const AContent:
    String = ''; const ACaption: String = 'Query'; const AExpText:
    String = ''; AMainIcon: TTaskDialogIcon = tdiInformation;
    ABeforeExecute: TATTaskDialogExecProc = NIL; AAfterExecute:
    TATTaskDialogExecProc = NIL): Boolean;
var
  AGC: IATGarbageCollector;
  ADlg: TTaskDialog;
  ACap: String;
begin
  ADlg := TATGC.Collect(TTaskDialog.Create(NIL), AGC);

  if (ACaption.IsEmpty) then
    ACap := 'Query'
  else
    ACap := ACaption;

  ADlg.CommonButtons := [tcbYes, tcbNo];
  ADlg.DefaultButton := tcbYes;
  ADlg.Flags := [tfUseHiconMain, tfAllowDialogCancellation];
  ADlg.Title := AInstruct;
  ADlg.Text := AContent;
  ADlg.Caption := ACap;
  ADlg.ExpandedText := AExpText;
  ADlg.MainIcon := AMainIcon;

  if (Assigned(ABeforeExecute)) then
    ABeforeExecute(ADlg);

  if (ADlg.Execute) then
    Result := (ADlg.ModalResult = mrYes)
  else
    Result := False;

  AModalResult := ADlg.ModalResult;

  if (Assigned(AAfterExecute)) then
    AAfterExecute(ADlg);
end;

class procedure TDlgServices.ShowShieldDlg(const AInstruct: String =
    ''; const AContent: String = ''; const ACaption: String = '';
    const AExpText: String = '');
begin
  TDlgServices.ShowTaskMessageDlg(AInstruct, AContent, ACaption,
      AExpText, tdiShield);
end;

class procedure TDlgServices.ShowTaskMessageDlg(const AInstruct:
    String = ''; const AContent: String = ''; const ACaption: String
    = ''; const AExpText: String = ''; const AMainIcon:
    TTaskDialogIcon = tdiNone; ABeforeExecute: TATTaskDialogExecProc
    = NIL; AAfterExecute: TATTaskDialogExecProc = NIL);
var
  AJunk: TModalResult;
begin
  TDlgServices.ShowTaskMessageDlg(AJunk, AInstruct, AContent,
      ACaption, AExpText, AMainIcon, ABeforeExecute, AAfterExecute);
end;

class function TDlgServices.ShowTaskMessageDlg(
    out AModalResult: TModalResult; const AInstruct: String = '';
    const AContent: String = ''; const ACaption: String = '';
    const AExpText: String = '';
    const AMainIcon: TTaskDialogIcon = tdiNone;
    ABeforeExecute: TATTaskDialogExecProc = NIL;
    AAfterExecute: TATTaskDialogExecProc = NIL): Boolean;
var
  AGC: IATGarbageCollector;
  ADlg: TTaskDialog;
  ACap: String;
begin
  ADlg := TATGC.Collect(TTaskDialog.Create(NIL), AGC);

  if (ACaption.IsEmpty) then
    ACap := Application.Title
  else
    ACap := ACaption;

  ADlg.CommonButtons := [tcbOk];
  ADlg.DefaultButton := tcbOk;
  ADlg.Flags := [tfAllowDialogCancellation];
  ADlg.Title := AInstruct;
  ADlg.Text := AContent;
  ADlg.Caption := ACap;
  ADlg.ExpandedText := AExpText;
  ADlg.MainIcon := AMainIcon;

  if (Assigned(ABeforeExecute)) then
    ABeforeExecute(ADlg);

  Result := ADlg.Execute;
  AModalResult := ADlg.ModalResult;

  if (Assigned(AAfterExecute)) then
    AAfterExecute(ADlg);
end;

class procedure TDlgServices.ShowWarningDlg(const AInstruct: String =
    ''; const AContent: String = ''; const ACaption: String =
    'Warning'; const AExpText: String = '');
begin
  TDlgServices.ShowTaskMessageDlg(AInstruct, AContent, ACaption,
      AExpText, tdiWarning);
end;

{$WARN SYMBOL_PLATFORM ON}
end.
