// ******************************************************************
//
// Program Name   : Angelic Tech Components
// Program Version: 1.00
// Platform(s)    : Android, iOS, OSX, Win32, Win64
// Framework      : FireMonkey
//
// Filenames      : AT.FMX.Dialog.Message.pas/.fmx
// File Version   : 1.00
// Date Created   : 12-OCT-2015
// Author         : Matthew S. Vesperman
//
// Description:
//
// Message dialog for FireMonkey.
//
// Revision History:
//
// v1.00   :   Initial version
//
// ******************************************************************
//
// COPYRIGHT © 2015 - PRESENT Angelic Technology
// ALL RIGHTS RESERVED WORLDWIDE
//
// ******************************************************************


/// <summary>
///   Defines classes, types, constants, variables and functions to
///   display a custom FireMonkey message dialog.
/// </summary>
unit AT.FMX.Dialog.Message;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants, FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms,
  FMX.Dialogs, FMX.StdCtrls, FMX.Objects, FMX.Layouts, FMX.Effects,
  FMX.Controls.Presentation;

type
  /// <summary>
  ///   Defines an enumeration to identify the message box buttons.
  /// </summary>
  TATFMXMsgDlgBtn = (
    /// <summary>
    ///   OK button.
    /// </summary>
    fmbOK,
    /// <summary>
    ///   Yes button.
    /// </summary>
    fmbYes,
    /// <summary>
    ///   No button.
    /// </summary>
    fmbNo,
    /// <summary>
    ///   Cancel button.
    /// </summary>
    fmbCancel,
    /// <summary>
    ///   Retry button.
    /// </summary>
    fmbRetry,
    /// <summary>
    ///   Close button.
    /// </summary>
    fmbClose);
  /// <summary>
  ///   Defines a set of <see cref="TATFMXMsgDlgBtn" /> to display in
  ///   the message dialog.
  /// </summary>
  TATFMXMsgDlgBtns = set of TATFMXMsgDlgBtn;
  /// <summary>
  ///   Defines an enumeration to indicate which icon to show in the
  ///   message dialog.
  /// </summary>
  TATFMXMsgDlgIcon = (
    /// <summary>
    ///   Don't display an icon.
    /// </summary>
    miNone,
    /// <summary>
    ///   <img src="E:\Components\XE8\AngelicTech\Images\error.png" />
    ///    Display an error icon.
    /// </summary>
    miError,
    /// <summary>
    ///   <img src="E:\Components\XE8\AngelicTech\Images\info.png" />
    ///   Display an info icon.
    /// </summary>
    miInfo,
    /// <summary>
    ///   <img src="E:\Components\XE8\AngelicTech\Images\question.png" />
    ///   Display a question icon.
    /// </summary>
    miQuestion,
    /// <summary>
    ///   <img src="E:\Components\XE8\AngelicTech\Images\shield.png" />
    ///    Display a shield icon.
    /// </summary>
    miShield,
    /// <summary>
    ///   <img src="E:\Components\XE8\AngelicTech\Images\warning.png" />
    ///    Display a warning icon.
    /// </summary>
    miWarning);

  /// <summary>
  ///   Defines a custom FireMonkey message dialog class.
  /// </summary>
  /// <remarks>
  ///   The calling code is responsible for freeing the message
  ///   dialog.
  /// </remarks>
  TfrmATFMXMessageDlg = class(TForm)
    /// <summary>
    ///   Cancel button object.
    /// </summary>
    btnCancel: TButton;
    /// <summary>
    ///   Close button object.
    /// </summary>
    btnClose: TButton;
    /// <summary>
    ///   No button object.
    /// </summary>
    btnNo: TButton;
    /// <summary>
    ///   OK button object.
    /// </summary>
    btnOK: TButton;
    /// <summary>
    ///   Retry button object.
    /// </summary>
    btnRetry: TButton;
    /// <summary>
    ///   Yes button object.
    /// </summary>
    btnYes: TButton;
    /// <summary>
    ///   Error icon image object.
    /// </summary>
    imgError: TImage;
    /// <summary>
    ///   Info icon image object.
    /// </summary>
    imgInfo: TImage;
    /// <summary>
    ///   Question icon image object.
    /// </summary>
    imgQuestion: TImage;
    /// <summary>
    ///   Shield icon image object.
    /// </summary>
    imgShield: TImage;
    /// <summary>
    ///   Warning icon image object.
    /// </summary>
    imgWarning: TImage;
    /// <summary>
    ///   Button flow layout object.
    /// </summary>
    layButtons: TFlowLayout;
    /// <summary>
    ///   Contents layout object.
    /// </summary>
    layContent: TLayout;
    /// <summary>
    ///   Left layout object.
    /// </summary>
    layLeft: TLayout;
    /// <summary>
    ///   Content label object.
    /// </summary>
    lblContentText: TLabel;
    /// <summary>
    ///   Instruction label object.
    /// </summary>
    lblInstruct: TLabel;
    /// <summary>
    ///   Reflection effect for error icon.
    /// </summary>
    reffError: TReflectionEffect;
    /// <summary>
    ///   Reflection effect for info icon.
    /// </summary>
    reffInfo: TReflectionEffect;
    /// <summary>
    ///   Reflection effect for instruction label.
    /// </summary>
    reffInstruct: TReflectionEffect;
    /// <summary>
    ///   Reflection effect for question icon.
    /// </summary>
    reffQuestion: TReflectionEffect;
    /// <summary>
    ///   Reflection effect for shield icon.
    /// </summary>
    reffShield: TReflectionEffect;
    /// <summary>
    ///   Reflection effect for warning icon.
    /// </summary>
    reffWarn: TReflectionEffect;
  strict private
    /// <summary>
    ///   Set containing buttons to display.
    /// </summary>
    FButtons: TATFMXMsgDlgBtns;
    /// <summary>
    ///   Flag indicating which button is default.
    /// </summary>
    FDefaultButton: TATFMXMsgDlgBtn;
    /// <summary>
    ///   Which icon should be displayed.
    /// </summary>
    FIcon: TATFMXMsgDlgIcon;
    /// <summary>
    ///   Returns the number of visible buttons in the message
    ///   dialog.
    /// </summary>
    function _GetVisibleButtonCount: Byte;
    /// <summary>
    ///   Ensures the message dialog's width can display all visible
    ///   buttons.
    /// </summary>
    procedure _UpdateDialogWidth;
  strict protected
    /// <summary>
    ///   Getter for ContentText property.
    /// </summary>
    function GetContentText: string;
    /// <summary>
    ///   Getter for instruction property.
    /// </summary>
    function GetInstruct: string;
    /// <summary>
    ///   Getter for reflections property.
    /// </summary>
    function GetReflect: Boolean;
    /// <summary>
    ///   Getter for dialog title property.
    /// </summary>
    function GetTitle: string;
    /// <summary>
    ///   Setter for the Buttons property.
    /// </summary>
    /// <param name="Value">
    ///   The set of buttons to display.
    /// </param>
    procedure SetButtons(const Value: TATFMXMsgDlgBtns);
    /// <summary>
    ///   Setter for the ContentText property.
    /// </summary>
    /// <param name="Value">
    ///   The content text to display.
    /// </param>
    procedure SetContentText(const Value: string);
    /// <summary>
    ///   Setter for the DefaultButton property.
    /// </summary>
    procedure SetDefaultButton(const Value: TATFMXMsgDlgBtn);
    /// <summary>
    ///   Setter for the icon property.
    /// </summary>
    procedure SetIcon(const Value: TATFMXMsgDlgIcon);
    /// <summary>
    ///   Setter for the instruction property.
    /// </summary>
    procedure SetInstruct(const Value: string);
    /// <summary>
    ///   Setter for the reflection property.
    /// </summary>
    procedure SetReflect(const Value: Boolean);
    /// <summary>
    ///   Setter for the title property.
    /// </summary>
    procedure SetTitle(const Value: string);
  public
    /// <summary>
    ///   Message dialog Create constructor.
    /// </summary>
    /// <param name="AOwner">
    ///   The message dialog's owner.
    /// </param>
    constructor Create(AOwner: TComponent); override;
  published
    /// <summary>
    ///   Indicates which buttons to display.
    /// </summary>
    property Buttons: TATFMXMsgDlgBtns read FButtons write SetButtons;
    /// <summary>
    ///   The main content text to display.
    /// </summary>
    property ContentText: string read GetContentText write SetContentText;
    /// <summary>
    ///   Indicates which button is the default one.
    /// </summary>
    property DefaultButton: TATFMXMsgDlgBtn read FDefaultButton write
        SetDefaultButton;
    /// <summary>
    ///   Indicates which icon to display.
    /// </summary>
    property Icon: TATFMXMsgDlgIcon read FIcon write SetIcon;
    /// <summary>
    ///   The instruction text to display.
    /// </summary>
    property Instruction: string read GetInstruct write SetInstruct;
    /// <summary>
    ///   Should reflections be used?
    /// </summary>
    /// <remarks>
    ///   Set this property to True to use reflections, False
    ///   otherwise.
    /// </remarks>
    property Reflections: Boolean read GetReflect write SetReflect;
    /// <summary>
    ///   The title of the message dialog.
    /// </summary>
    property Title: string read GetTitle write SetTitle;
  end;

/// <summary>
///   Displays a FMX message dialog to the user.
/// </summary>
/// <param name="AOwner">
///   The owner form for the message dialog. ( <i>If you pass NIL,
///   the application main form, if one exists, will be used.</i>)
/// </param>
/// <param name="AContent">
///   The content text for the message dialog.
/// </param>
/// <param name="AInstruct">
///   The instruction text for the message dialog. <i>Default: empty
///   string</i>
/// </param>
/// <param name="ATitle">
///   The title of the message dialog.Default: empty string
/// </param>
/// <param name="AIcon">
///   The icon to display in the message dialog. <i>Default: miNone</i>
/// </param>
/// <param name="AButtons">
///   The set of buttons to display in the message dialog. <i>
///   Default: [fmbOK]</i>
/// </param>
/// <param name="ADefault">
///   The default button for the message dialog. <i>Default: fmbOK</i>
/// </param>
/// <param name="AReflections">
///   Display reflections in the message dialog? <i>Default: True</i>
/// </param>
/// <returns>
///   The modal result of the message dialog.
/// </returns>
function FMXMessageDlg(AOwner: TCustomForm; AContent: String;
    AInstruct: String = ''; ATitle: String = '';
    AIcon: TATFMXMsgDlgIcon = miNone; AButtons:
    TATFMXMsgDlgBtns = [fmbOK]; ADefault: TATFMXMsgDlgBtn = fmbOK;
    AReflections: Boolean = True): TModalResult; overload;

/// <summary>
///   Displays a FMX message dialog to the user.
/// </summary>
/// <param name="AContent">
///   The content text for the message dialog.
/// </param>
/// <param name="AInstruct">
///   The instruction text for the message dialog. <i>Default: empty
///   string</i>
/// </param>
/// <param name="ATitle">
///   The title of the message dialog.Default: empty string
/// </param>
/// <param name="AIcon">
///   The icon to display in the message dialog. <i>Default: miNone</i>
/// </param>
/// <param name="AButtons">
///   The set of buttons to display in the message dialog. <i>
///   Default: [fmbOK]</i>
/// </param>
/// <param name="ADefault">
///   The default button for the message dialog. <i>Default: fmbOK</i>
/// </param>
/// <param name="AReflections">
///   Display reflections in the message dialog? <i>Default: True</i>
/// </param>
/// <returns>
///   The modal result of the message dialog.
/// </returns>
/// <remarks>
///   This version of the FMXMessageDlg function is provided for
///   backwards compatibility.
/// </remarks>
function FMXMessageDlg(AContent: String; AInstruct: String = '';
    ATitle: String = ''; AIcon: TATFMXMsgDlgIcon = miNone; AButtons:
    TATFMXMsgDlgBtns = [fmbOK]; ADefault: TATFMXMsgDlgBtn = fmbOK;
    AReflections: Boolean = True): TModalResult; overload;

var
  frmATFMXMessageDlg: TfrmATFMXMessageDlg;

implementation

uses
  Math, AT.GarbageCollector;

{$R *.fmx}

function FMXMessageDlg(AOwner: TCustomForm; AContent: String;
    AInstruct: String = ''; ATitle: String = '';
    AIcon: TATFMXMsgDlgIcon = miNone; AButtons:
    TATFMXMsgDlgBtns = [fmbOK]; ADefault: TATFMXMsgDlgBtn = fmbOK;
    AReflections: Boolean = True): TModalResult;
var
  ACaption: String;               //Caption text...
  AGC     : IATGarbageCollector;  //Local garbage collector...
  AFrm    : TfrmATFMXMessageDlg;  //Dialog form reference...
  AOwnerObj: TCommonCustomForm;         //Owner object for msg dialog...
begin
  //Is the ATitle param empty???
  if (ATitle.IsEmpty) then
    ACaption := Application.Title  //Yes, use application's title...
  else
    ACaption := ATitle;   //No, use the ATitle parameter...

  //Did an owner get passed in???
  if (Assigned(AOwner)) then
    //Yes, assign it as our owner...
    AOwnerObj := AOwner
  else
    //No, assign app main form as our owner form...
    AOwnerObj := Application.MainForm;

  //Create message dialog object and add to local gc...
  AFrm := TATGC.Collect(TfrmATFMXMessageDlg.Create(AOwnerObj), AGC);

  //Did we assign an owner object???
  if (Assigned(AOwnerObj)) then
    //Yes, set position to owner form center
    AFrm.Position := TFormPosition.OwnerFormCenter
  else
    //No, set form position to screen center...
    AFrm.Position := TFormPosition.ScreenCenter;

  AFrm.Buttons := AButtons;         //Set buttons to display...
  AFrm.ContentText := AContent;     //Set content text...
  AFrm.DefaultButton := ADefault;   //Set default button...
  AFrm.Icon := AIcon;               //Set icon...
  AFrm.Instruction := AInstruct;    //Set instruction text...
  AFrm.Reflections := AReflections; //Set reflections...
  AFrm.Title := ACaption;           //Set title...

  //Display message dialog and return ModalResult...
  Result := AFrm.ShowModal;
end;

function FMXMessageDlg(AContent: String; AInstruct: String = '';
    ATitle: String = ''; AIcon: TATFMXMsgDlgIcon = miNone; AButtons:
    TATFMXMsgDlgBtns = [fmbOK]; ADefault: TATFMXMsgDlgBtn = fmbOK;
    AReflections: Boolean = True): TModalResult;
begin
  //Call other function to display, pass NIL as owner...
  Result := FMXMessageDlg(NIL, AContent, AInstruct, ATitle, AIcon,
      AButtons, ADefault, AReflections);
end;



{ TfrmATFMXMessageDlg }

constructor TfrmATFMXMessageDlg.Create(AOwner: TComponent);
begin
  //Call inherited method...
  inherited Create(AOwner);

  Buttons := [fmbOK];         //Init button set...
  ContentText := EmptyStr;    //Init content text...
  DefaultButton := fmbOK;     //Init default button...
  Icon := miNone;             //Init message icon...
  Instruction := EmptyStr;    //Init instruction text...
  Reflections := False;       //Init reflection display...
  Title := Application.Title; //Init dialog title...
end;

function TfrmATFMXMessageDlg.GetContentText: string;
begin
  //Return content text...
  Result := lblContentText.Text;
end;

function TfrmATFMXMessageDlg.GetInstruct: string;
begin
  //Return instruction text...
  Result := lblInstruct.Text;
end;

function TfrmATFMXMessageDlg.GetReflect: Boolean;
begin
  //Return reflection value...
  Result := reffInstruct.Enabled;
end;

function TfrmATFMXMessageDlg.GetTitle: string;
begin
  //Return dialog caption...
  Result := Self.Caption;
end;

function TfrmATFMXMessageDlg._GetVisibleButtonCount: Byte;
begin
  //Init result to zero...
  Result := 0;

  //Is OK button visible???
  if (btnOK.Visible) then
    Inc(Result);  //Yes, increment count...

  //Is Yes button visible???
  if (btnYes.Visible) then
    Inc(Result);  //Yes, increment count...

  //Is No button visible???
  if (btnNo.Visible) then
    Inc(Result);  //Yes, increment count...

  //Is Retry button visible???
  if (btnRetry.Visible) then
    Inc(Result);  //Yes, increment count...

  //Is Cancel button visible???
  if (btnCancel.Visible) then
    Inc(Result);  //Yes, increment count...

  //Is Close button visible???
  if (btnClose.Visible) then
    Inc(Result);  //Yes, increment count...
end;

procedure TfrmATFMXMessageDlg.SetButtons(const Value: TATFMXMsgDlgBtns);
begin
  //Save the set into the field...
  FButtons := Value;

  //Update button visibility...
  btnOK.Visible := (fmbOK IN FButtons);
  btnYes.Visible := (fmbYes IN FButtons);
  btnNo.Visible := (fmbNo IN FButtons);
  btnRetry.Visible := (fmbRetry IN FButtons);
  btnCancel.Visible := (fmbCancel IN FButtons);
  btnClose.Visible := (fmbClose IN FButtons);

  //Update the dialog box width...
  _UpdateDialogWidth;
end;

procedure TfrmATFMXMessageDlg.SetContentText(const Value: string);
begin
  //Set the content text...
  lblContentText.Text := Value;
end;

procedure TfrmATFMXMessageDlg.SetDefaultButton(const Value: TATFMXMsgDlgBtn);
begin
  //Save the default button...
  FDefaultButton := Value;

  //Set the default value of all buttons...
  btnOK.Default := (Value = fmbOK);
  btnYes.Default := (Value = fmbYes);
  btnNo.Default := (Value = fmbNo);
  btnRetry.Default := (Value = fmbRetry);
  btnCancel.Default := (Value = fmbCancel);
  btnClose.Default := (Value = fmbClose);
end;

procedure TfrmATFMXMessageDlg.SetIcon(const Value: TATFMXMsgDlgIcon);
begin
  //Save the icon value...
  FIcon := Value;

  //Set the correct icon as visible...
  imgError.Visible := (Value = miError);
  imgInfo.Visible := (Value = miInfo);
  imgQuestion.Visible := (Value = miQuestion);
  imgShield.Visible := (Value = miShield);
  imgWarning.Visible := (Value = miWarning);
end;

procedure TfrmATFMXMessageDlg.SetInstruct(const Value: string);
begin
  //Save the instruction text value...
  lblInstruct.Text := Value;
end;

procedure TfrmATFMXMessageDlg.SetReflect(const Value: Boolean);
begin
  //Set the enabled property of the reflection effects...
  reffInstruct.Enabled := Value;
  reffError.Enabled := Value;
  reffInfo.Enabled := Value;
  reffQuestion.Enabled := Value;
  reffShield.Enabled := Value;
  reffWarn.Enabled := Value;
end;

procedure TfrmATFMXMessageDlg.SetTitle(const Value: string);
begin
  //Save the title...
  Self.Caption := Value;
end;

procedure TfrmATFMXMessageDlg._UpdateDialogWidth;
var
  ABtnCnt : Byte;     //Number of visible buttons...
  AHGap   : Integer;  //Distance between buttons...
  AHMargin: Integer;  //Total left/right margin distance...
  AWid    : Integer;  //Calculated width of buttons...
begin
  //Get number of visible buttons...
  ABtnCnt := _GetVisibleButtonCount;

  //Get distance between buttons...
  AHGap := Trunc(layButtons.HorizontalGap);

  //Get total of left/right layout margins...
  AHMargin := Trunc(layButtons.Margins.Left + layButtons.Margins.Right);

  //Calculate minumum width needed by buttons...
  AWid := Trunc((btnOK.Width * ABtnCnt) + ((ABtnCnt - 1) * AHGap) + AHMargin);

  //Add an additional 20px space...
  AWid := AWid + 20;

  //Set width to calculated width or 350, whichever is bigger...
  Self.Width := Max(350, AWid);
end;

end.
