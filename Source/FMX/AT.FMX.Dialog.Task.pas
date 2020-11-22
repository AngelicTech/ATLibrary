// ******************************************************************
//
// Program Name   : Angelic Tech Components
// Program Version: 1.00
// Platform(s)    : Android, iOS, OSX, Win32, Win64
// Framework      : FireMonkey
//
// Filenames      : AT.FMX.Dialog.Task.pas/.fmx
// File Version   : 1.00
// Date Created   : 12-OCT-2015
// Author         : Matthew S. Vesperman
//
// Description:
//
// Task dialog for FireMonkey.
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
///   display a custom FireMonkey task dialog.
/// </summary>
unit AT.FMX.Dialog.Task;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants, FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms,
  FMX.Dialogs, FMX.StdCtrls, FMX.Layouts, FMX.Effects, FMX.Objects,
  Spring.Collections, AT.FMX.Dialog.Message, ksTypes, ksSpeedButton,
  FMX.Controls.Presentation, System.ImageList, FMX.ImgList;

const
  /// <summary>
  ///   Constant definition for first task dialog button.
  /// </summary>
  TDID_BUTTON1 = 100;
  /// <summary>
  ///   Constant definition for second task dialog button.
  /// </summary>
  TDID_BUTTON2 = 101;
  /// <summary>
  ///   Constant definition for third task dialog button.
  /// </summary>
  TDID_BUTTON3 = 102;
  /// <summary>
  ///   Constant definition for fourth task dialog button.
  /// </summary>
  TDID_BUTTON4 = 103;
  /// <summary>
  ///   Constant definition for fifth task dialog button.
  /// </summary>
  TDID_BUTTON5 = 104;

type
  TfrmATFMXTaskDlg = class;

  /// <summary>
  ///   Defines an array of string type for hold captions for the
  ///   task dialog buttons.
  /// </summary>
  TATFMXTaskDlgButtons = array of string;

  /// <summary>
  ///   Defines a procedure type for the task dialog OnButtonClick
  ///   event.
  /// </summary>
  TATFMXTaskDialogButtonClickEvent = reference to procedure(
      Sender: TObject; TaskDialog: TfrmATFMXTaskDlg;
      ButtonID: Integer);

  /// <summary>
  ///   Defines a procedure type for the task dialog
  ///   OnDialogCloseQuery event.
  /// </summary>
  TATFMXTaskDialogCloseQueryEvent = reference to procedure(
      Sender: TObject; TaskDialog: TfrmATFMXTaskDlg;
      ButtonID: Integer; var CanClose: Boolean);

  /// <summary>
  ///   Defines a custom FireMonkey task dialog class.
  /// </summary>
  /// <remarks>
  ///   The calling code is responsible for freeing the task dialog.
  /// </remarks>
  TfrmATFMXTaskDlg = class(TForm)
    /// <summary>
    ///   Verification checkbox object.
    /// </summary>
    chkVerify: TCheckBox;
    /// <summary>
    ///   Imagelist object.
    /// </summary>
    ilstTask: TImageList;
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
    ///   Button layout object.
    /// </summary>
    layButtons: TLayout;
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
    /// <summary>
    ///   Event handler for the dialog's OnFormClose event.
    /// </summary>
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    /// <summary>
    ///   Event handler for the dialog's OnCloseQuery event.
    /// </summary>
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  strict private
    /// <summary>
    ///   Dictionary object to hold the task dialog's buttons.
    /// </summary>
    FButtonDictionary: IDictionary<String, TksSpeedButton>;
    /// <summary>
    ///   TStrings object to hold the dialog button captions.
    /// </summary>
    FButtons: TStrings;
    /// <summary>
    ///   Holds the dialog's result code.
    /// </summary>
    /// <value>
    ///   The ID of the button that closed the dialog.
    /// </value>
    FDialogResult: Integer;
    /// <summary>
    ///   Which icon should be displayed.
    /// </summary>
    FIcon: TATFMXMsgDlgIcon;
    /// <summary>
    ///   Holds a reference to the dialog's OnButtonClick event
    ///   handler.
    /// </summary>
    FOnButtonClick: TATFMXTaskDialogButtonClickEvent;
    /// <summary>
    ///   Holds a reference to the dialog's OnDialogCloseQuery event
    ///   handler.
    /// </summary>
    FOnDialogCloseQuery: TATFMXTaskDialogCloseQueryEvent;
    /// <summary>
    ///   The task dialog's button click handler.
    /// </summary>
    procedure ButtonClicked(Sender: TObject);
    /// <summary>
    ///   Getter for the ContentText property.
    /// </summary>
    function GetContentText: string;
    /// <summary>
    ///   Getter for the Instruction property.
    /// </summary>
    function GetInstruct: string;
    /// <summary>
    ///   Getter for the Reflections property.
    /// </summary>
    function GetReflect: Boolean;
    /// <summary>
    ///   Getter for the Title property.
    /// </summary>
    function GetTitle: string;
    /// <summary>
    ///   Getter for the VerifyResult property.
    /// </summary>
    function GetVerifyResult: Boolean;
    /// <summary>
    ///   Getter for the VerificationText property.
    /// </summary>
    function GetVerifyText: string;
    /// <summary>
    ///   Handler for the Button caption stringlist's OnChanged
    ///   event.
    /// </summary>
    procedure OnButtonListChanged(Sender: TObject);
    /// <summary>
    ///   Setter for the ContentText property.
    /// </summary>
    procedure SetContentText(const Value: string);
    /// <summary>
    ///   Setter for the Icon property.
    /// </summary>
    procedure SetIcon(const Value: TATFMXMsgDlgIcon);
    /// <summary>
    ///   Setter for the Instruction property.
    /// </summary>
    procedure SetInstruct(const Value: string);
    /// <summary>
    ///   Setter for the Instructions property.
    /// </summary>
    procedure SetReflect(const Value: Boolean);
    /// <summary>
    ///   Setter for the Title property.
    /// </summary>
    procedure SetTitle(const Value: string);
    /// <summary>
    ///   Setter for the VerifyResult property.
    /// </summary>
    procedure SetVerifyResult(const Value: Boolean);
    /// <summary>
    ///   Setter for the VerificationText property.
    /// </summary>
    procedure SetVerifyText(const Value: string);
    /// <summary>
    ///   Creates the task buttons based on the captions in the
    ///   Buttons property and adds them to the internal buttons
    ///   dictionary.
    /// </summary>
    /// <remarks>
    ///   If the dictionary is already populated then it is first
    ///   cleared.
    /// </remarks>
    procedure _BuildButtonDictionary;
    /// <summary>
    ///   Clearsthe button dictionary.
    /// </summary>
    procedure _ClearButtonDictionary;
    /// <summary>
    ///   Executes the OnButtonClick event handler (if one exists).
    /// </summary>
    procedure _DoButtonClick(AButtonID: Integer);
    /// <summary>
    ///   Ensures that the dialog is tall enough to display the
    ///   buttons.
    /// </summary>
    procedure _UpdateDialogHeight;
  public
    /// <summary>
    ///   Task dialog Create constructor.
    /// </summary>
    /// <param name="AOwner">
    ///   The task dialog's owner.
    /// </param>
    constructor Create(AOwner: TComponent); override;
    /// <summary>
    ///   Task dialog;s Destroy destructor.
    /// </summary>
    destructor Destroy; override;
    /// <summary>
    ///   The captions of the task dialog buttons.
    /// </summary>
    property Buttons: TStrings read FButtons;
    /// <summary>
    ///   The ID of the button that was clicked in the dialog.
    /// </summary>
    /// <remarks>
    ///   Button IDs start at 100. This property may also be set to
    ///   mrCancel if the caption Close button is clicked.
    /// </remarks>
    property DialogResult: Integer read FDialogResult;
  published
    /// <summary>
    ///   The main content text to display.
    /// </summary>
    property ContentText: string read GetContentText write SetContentText;
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
    ///   The title of the task dialog.
    /// </summary>
    property Title: string read GetTitle write SetTitle;
    /// <summary>
    ///   The text to display next to the verification checkbox.
    /// </summary>
    property VerificationText: string read GetVerifyText
      write SetVerifyText;
    /// <summary>
    ///   The state of the verification checkbox.
    /// </summary>
    property VerifyResult: Boolean read GetVerifyResult
      write SetVerifyResult;
    /// <summary>
    ///   An event that indicates if a task button was clicked.
    /// </summary>
    property OnButtonClick: TATFMXTaskDialogButtonClickEvent
      read FOnButtonClick write FOnButtonClick;
    /// <summary>
    ///   An event that indicates that the task dialog wants to
    ///   close.
    /// </summary>
    /// <remarks>
    ///   This event provides the ability to prevent the dialog from
    ///   closing if it should not be closed. (ie. Verification
    ///   checkbox is not checked)
    /// </remarks>
    property OnDialogCloseQuery: TATFMXTaskDialogCloseQueryEvent
      read FOnDialogCloseQuery write FOnDialogCloseQuery;
  end;


/// <summary>
///   Displays a FMX task dialog to the user.
/// </summary>
/// <param name="AOwner">
///   The owner form for the message dialog. ( <i>If you pass NIL,
///   the application main form, if one exists, will be used.</i>)
/// </param>
/// <param name="AContent">
///   The content text for the message dialog.
/// </param>
/// <param name="AButtons">
///   An array of strings containing the captions for the task
///   buttons.
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
/// <param name="AReflections">
///   Display reflections in the message dialog? <i>Default: True</i>
/// </param>
/// <param name="AOnButtonClick">
///   A reference to a procedure to use for handling the
///   OnButtonClick event. <br />
/// </param>
/// <param name="AOnCloseQuery">
///   A reference to a procedure to use for handling the
///   OnDialogCloseQuery event.
/// </param>
/// <returns>
///   The ID of the task button that was clicked.
/// </returns>
function FMXTaskDlg(AOwner: TCustomForm; AContent: String;
    AButtons: TATFMXTaskDlgButtons; AInstruct: String = '';
    ATitle: String = ''; AIcon: TATFMXMsgDlgIcon = miNone;
    AReflections: Boolean = True;
    AOnButtonClick: TATFMXTaskDialogButtonClickEvent = NIL;
    AOnCloseQuery: TATFMXTaskDialogCloseQueryEvent = NIL
    ): Integer; overload;

/// <summary>
///   Displays a FMX task dialog to the user.
/// </summary>
/// <param name="AOwner">
///   The owner form for the message dialog. ( <i>If you pass NIL,
///   the application main form, if one exists, will be used.</i>)
/// </param>
/// <param name="AContent">
///   The content text for the message dialog.
/// </param>
/// <param name="AButtons">
///   An array of strings containing the captions for the task
///   buttons.
/// </param>
/// <param name="AVerifyText">
///   The text to display next to the verification text box.
/// </param>
/// <param name="AVerifyResult">
///   A variable to init/receive the state of the verification
///   checkbox.
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
/// <param name="AReflections">
///   Display reflections in the message dialog? <i>Default: True</i>
/// </param>
/// <param name="AOnButtonClick">
///   A reference to a procedure to use for handling the
///   OnButtonClick event. <br />
/// </param>
/// <param name="AOnCloseQuery">
///   A reference to a procedure to use for handling the
///   OnDialogCloseQuery event.
/// </param>
/// <returns>
///   The ID of the task button that was clicked.
/// </returns>
function FMXTaskDlg(AOwner: TCustomForm; AContent: String;
    AButtons: TATFMXTaskDlgButtons; AVerifyText: String;
    var AVerifyResult: Boolean; AInstruct: String = '';
    ATitle: String = ''; AIcon: TATFMXMsgDlgIcon = miNone;
    AReflections: Boolean = True;
    AOnButtonClick: TATFMXTaskDialogButtonClickEvent = NIL;
    AOnCloseQuery: TATFMXTaskDialogCloseQueryEvent = NIL
    ): Integer; overload;


var
  frmATFMXTaskDlg: TfrmATFMXTaskDlg;



implementation

uses
  Math, AT.Rtti, System.Rtti, AT.GarbageCollector;

{$R *.fmx}

/// <summary>
///   Private, unit level, function to create and initialize a basic
///   task dialog.
/// </summary>
/// <param name="AOwner">
///   The owner form for the message dialog. ( <i>If you pass NIL,
///   the application main form, if one exists, will be used.</i>)
/// </param>
/// <param name="AContent">
///   The content text for the message dialog.
/// </param>
/// <param name="AButtons">
///   An array of strings containing the captions for the task
///   buttons.
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
/// <param name="AReflections">
///   Display reflections in the message dialog? <i>Default: True</i>
/// </param>
/// <returns>
///   A properly created/initialized basic task dialog object.
/// </returns>
function _CreateTaskDialog(AOwner: TCustomForm; AContent: String; AButtons:
    TATFMXTaskDlgButtons; AInstruct, ATitle: String; AIcon: TATFMXMsgDlgIcon;
    AReflections: Boolean): TfrmATFMXTaskDlg;
var
  AStr: String;
  AOwnerObj: TCommonCustomForm;
begin
  //Did an owner get passed in???
  if (Assigned(AOwner)) then
    //Yes, assign it as our owner...
    AOwnerObj := AOwner
  else
    //No, assign app main form as our owner form...
    AOwnerObj := Application.MainForm;

  Result := TfrmATFMXTaskDlg.Create(AOwnerObj);

  //Did we assign an owner object???
  if (Assigned(AOwnerObj)) then
    //Yes, set position to owner form center
    Result.Position := TFormPosition.OwnerFormCenter
  else
    //No, set form position to screen center...
    Result.Position := TFormPosition.ScreenCenter;

  Result.ContentText := AContent;     //Set content text...
  Result.Instruction := AInstruct;    //Set instruction text...
  Result.Title := ATitle;             //Set dialog title...
  Result.Icon := AIcon;               //Set dialog icon...
  Result.Reflections := AReflections; //Set use of reflections...

  //Initialize task buttons...
  Result.Buttons.Clear;
  for AStr in AButtons do
    begin
      Result.Buttons.Add(AStr);
    end;
end;


function FMXTaskDlg(AOwner: TCustomForm; AContent: String;
    AButtons: TATFMXTaskDlgButtons; AInstruct: String = '';
    ATitle: String = ''; AIcon: TATFMXMsgDlgIcon = miNone;
    AReflections: Boolean = True;
    AOnButtonClick: TATFMXTaskDialogButtonClickEvent = NIL;
    AOnCloseQuery: TATFMXTaskDialogCloseQueryEvent = NIL): Integer;
var
  AGC: IATGarbageCollector;
  ADlg: TfrmATFMXTaskDlg;
begin
  //Create basic task dialog...
  ADlg := TATGC.Collect(_CreateTaskDialog(AOwner, AContent, AButtons,
      AInstruct, ATitle, AIcon, AReflections), AGC);

  //Set event handlers...
  ADlg.OnButtonClick := AOnButtonClick;
  ADlg.OnDialogCloseQuery := AOnCloseQuery;

  //Show task dialog modally and return result...
  Result := ADlg.ShowModal;
end;

function FMXTaskDlg(AOwner: TCustomForm; AContent: String;
    AButtons: TATFMXTaskDlgButtons; AVerifyText: String;
    var AVerifyResult: Boolean; AInstruct: String = '';
    ATitle: String = ''; AIcon: TATFMXMsgDlgIcon = miNone;
    AReflections: Boolean = True;
    AOnButtonClick: TATFMXTaskDialogButtonClickEvent = NIL;
    AOnCloseQuery: TATFMXTaskDialogCloseQueryEvent = NIL): Integer;
var
  AGC: IATGarbageCollector;
  ADlg: TfrmATFMXTaskDlg;
begin
  //Create basic task dialog...
  ADlg := TATGC.Collect(_CreateTaskDialog(AOwner, AContent, AButtons,
      AInstruct, ATitle, AIcon, AReflections), AGC);

  //Set verification text and init checkbox...
  ADlg.VerificationText := AVerifyText;
  ADlg.VerifyResult := AVerifyResult;

  //Set event handlers...
  ADlg.OnButtonClick := AOnButtonClick;
  ADlg.OnDialogCloseQuery := AOnCloseQuery;

  //Show task dialog modally and set result...
  Result := ADlg.ShowModal;

  //Copy verification result to AVerifyResult variable...
  AVerifyResult := ADlg.VerifyResult;
end;





{ TfrmATFMXTaskDlg }

constructor TfrmATFMXTaskDlg.Create(AOwner: TComponent);
var
  AValue: TValue;
begin
  //Call inherited method...
  inherited Create(AOwner);

  //Create dictionary object to hold task buttons...
  FButtonDictionary := TCollections.CreateDictionary<String,
    TksSpeedButton>([doOwnsValues]);

  //Create stringlist to hold button captions...
  FButtons := TStringList.Create;

  //Set OnChange handler for button caption stringlist...
  AValue := TValue.From<TNotifyEvent>(Self.OnButtonListChanged);
  SetPropertyValue(FButtons, 'OnChange', AValue);

  //Init dialog result to 0...
  FDialogResult := 0;

  //Set initial property states...
  Buttons.Clear;
  ContentText := EmptyStr;
  Icon := miNone;
  Instruction := EmptyStr;
  Reflections := False;
  Title := Application.Title;
  VerificationText := EmptyStr;
  VerifyResult := False;
end;

destructor TfrmATFMXTaskDlg.Destroy;
begin
  //Clear button dictionary to ensure memory for buttons is freed.
  _ClearButtonDictionary;

  //Free the button caption stringlist...
  FreeAndNil(FButtons);

  //Call inherited method...
  inherited Destroy;
end;

procedure TfrmATFMXTaskDlg.ButtonClicked(Sender: TObject);
var
  AValue: TValue;
  ATag: Integer;
begin
  //Attempt to get tag property of sender button...
  if (NOT GetPropertyValue(Sender, 'Tag', AValue)) then
    Exit; //Tag property not found, shouldn't happen...

  //Retrieve tag value...
  ATag := AValue.AsInteger;

  //Set dialog result to button object's tag value...
  FDialogResult := ATag;

  //Set dialog's modal result to button's tag value...
  Self.ModalResult := ATag;

  //Call OnButtonClick handler...
  _DoButtonClick(ATag);
end;

procedure TfrmATFMXTaskDlg.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  //Hide dialog, creating code must free it.
  Action := TCloseAction.caHide;
end;

procedure TfrmATFMXTaskDlg.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  //Attempt to call OnDialogCloseQuery event handler (if supplied)...
  if (Assigned(FOnDialogCloseQuery)) then
    FOnDialogCloseQuery(Self, Self, DialogResult, CanClose);
end;

function TfrmATFMXTaskDlg.GetContentText: string;
begin
  //Return content text...
  Result := lblContentText.Text;
end;

function TfrmATFMXTaskDlg.GetInstruct: string;
begin
  //Return instruction text...
  Result := lblInstruct.Text;
end;

function TfrmATFMXTaskDlg.GetReflect: Boolean;
begin
  //Return reflections state...
  Result := reffInstruct.Enabled;
end;

function TfrmATFMXTaskDlg.GetTitle: string;
begin
  //Return dialog title...
  Result := Self.Caption;
end;

function TfrmATFMXTaskDlg.GetVerifyResult: Boolean;
begin
  //Is verification checkbox visible???
  if (chkVerify.IsVisible) then
    Result := chkVerify.IsChecked   //Yes, return checked state...
  else
    Result := True;                 //No, always return true...
end;

function TfrmATFMXTaskDlg.GetVerifyText: string;
begin
  //Return verification text...
  Result := chkVerify.Text;
end;

procedure TfrmATFMXTaskDlg.OnButtonListChanged(Sender: TObject);
begin
  //Build task button dictionary...
  _BuildButtonDictionary;

  //Update height of dialog...
  _UpdateDialogHeight;
end;

procedure TfrmATFMXTaskDlg.SetContentText(const Value: string);
begin
  //Save content text...
  lblContentText.Text := Value;
end;

procedure TfrmATFMXTaskDlg.SetIcon(const Value: TATFMXMsgDlgIcon);
begin
  //Save icon value...
  FIcon := Value;

  //Make appropriate icon visible...
  imgError.Visible := (Value = miError);
  imgInfo.Visible := (Value = miInfo);
  imgQuestion.Visible := (Value = miQuestion);
  imgShield.Visible := (Value = miShield);
  imgWarning.Visible := (Value = miWarning);
end;

procedure TfrmATFMXTaskDlg.SetInstruct(const Value: string);
begin
  //Save instruction text...
  lblInstruct.Text := Value;
end;

procedure TfrmATFMXTaskDlg.SetReflect(const Value: Boolean);
begin
  //Set reflection state...
  reffInstruct.Enabled := Value;
  reffError.Enabled := Value;
  reffInfo.Enabled := Value;
  reffQuestion.Enabled := Value;
  reffShield.Enabled := Value;
  reffWarn.Enabled := Value;
end;

procedure TfrmATFMXTaskDlg.SetTitle(const Value: string);
begin
  //Save dialog title...
  Self.Caption := Value;
end;

procedure TfrmATFMXTaskDlg.SetVerifyResult(const Value: Boolean);
begin
  //Set verification checkbox state...
  chkVerify.IsChecked := Value;
end;

procedure TfrmATFMXTaskDlg.SetVerifyText(const Value: string);
begin
  //Save verification text...
  chkVerify.Text := Value;

  //Checkbox is only visible if the text is not empty...
  chkVerify.Visible := (NOT Value.IsEmpty);

  //Update dialog height...
  _UpdateDialogHeight;
end;

procedure TfrmATFMXTaskDlg._BuildButtonDictionary;
var
  ABtnValue: Integer;
  ABtnText : String;
  ABtn     : TksSpeedButton;
  AKey     : String;
begin
  //Ensure the button dictionary is empty first...
  _ClearButtonDictionary;

  //Are there any button captions to process???
  if (FButtons.Count <= 0) then
    Exit;   //No, exit method...

  //Set initial button ID...
  ABtnValue := TDID_BUTTON1;

  //Process button captions...
  for ABtnText in FButtons do
    begin
      //Create new button...
      ABtn := TksSpeedButton.Create(Self);

      //Set button properties...
      ABtn.Align := TAlignLayout.Top;
      ABtn.Height := 40;
      ABtn.ImageIndex := 0;
      ABtn.Images := ilstTask;
      ABtn.Margins.Bottom := 8;
      ABtn.Position.Y := 10000;
      ABtn.Tag := ABtnValue;
      ABtn.Text := ABtnText;
      ABtn.TextSettings.Font.Size := 16;
      ABtn.TextSettings.HorzAlign := TTextAlign.Leading;
      ABtn.TextSettings.WordWrap := True;

      //Set event handlers...
      ABtn.OnClick := Self.ButtonClicked;

      //Set parent...
      ABtn.Parent := layButtons;

      //Add button to dictionary...
      AKey := Format('%s%d', [ABtnText, ABtnValue]);
      FButtonDictionary.Add(AKey, ABtn);

      //Increment button id...
      Inc(ABtnValue);
    end;
end;

procedure TfrmATFMXTaskDlg._ClearButtonDictionary;
begin
  //Does the button dictionary have any buttons???
  if (NOT FButtonDictionary.IsEmpty) then
    FButtonDictionary.Clear;  //Yes, clear it...
end;

procedure TfrmATFMXTaskDlg._DoButtonClick(AButtonID: Integer);
begin
  //Do we have a button click handler???
  if (Assigned(FOnButtonClick)) then
    FOnButtonClick(Self, Self, AButtonID);  //Yes, call it...
end;

procedure TfrmATFMXTaskDlg._UpdateDialogHeight;
var
  ANewHgt: Integer;
  ABtnCnt: Integer;
  ABtnHgt: Integer;
begin
  //Initialize local variables...
  ANewHgt := 150;
  ABtnHgt := 0;

  //Get number of buttons...
  ABtnCnt := FButtonDictionary.Count;

  //Do we have any buttons???
  if (ABtnCnt > 0) then
    begin
      //Calculate height of all buttons...
      ABtnHgt := ABtnCnt * 48;
      ABtnHgt := Trunc(ABtnHgt + layButtons.Padding.Top +
          layButtons.Padding.Bottom);
    end;

  //Set button layout height...
  layButtons.Height := ABtnHgt;

  //Calculate new dialog height...
  ANewHgt := Trunc(ANewHgt + layButtons.Height +
      layButtons.Margins.Bottom);

  //Is verify checkbox visible???
  if (chkVerify.Visible) then
    //Yes, add appropriate amount to height...
    ANewHgt := Trunc(ANewHgt + chkVerify.Height + chkVerify.Margins.Top +
        chkVerify.Margins.Bottom);

  //Set height to either current height or new height,
  //whichever is greater...
  Self.Height := Max(ANewHgt, Self.Height);
end;

end.

