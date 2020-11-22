// ******************************************************************
//
// Program Name   : AT Software_DNA Library
// Program Version: 1.00
// Platform(s)    : OS X, Win32, Win64
// Framework      : FireMonkey
//
// Filenames      : AT.DNA.FMX.Dlg.Base.pas/.fmx
// File Version   : 1.20
// Date Created   : 04-MAY-2016
// Author         : Matthew S. Vesperman
//
// Description:
//
// Base dialog for Software_DNA - FireMonkey version for
// cross-platform.
//
// Revision History:
//
// v1.00   :   Initial version
// v1.10   :   30-MAY-2016
//               + EditExit
//               + EmptyTextField
//               + IsPasswordValid
//               + PasteTextField
//               + TrimTextField
// v1.20   :   28-JUN-2016
//               * Implemented resource strings
//
// ******************************************************************
//
// COPYRIGHT © 2015 - PRESENT Angelic Technology
// ALL RIGHTS RESERVED WORLDWIDE
//
// ******************************************************************

unit AT.DNA.FMX.Dlg.Base;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants, FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics,
  FMX.Dialogs, FMX.StdCtrls, FMX.Controls.Presentation, FMX.Layouts,
  FMX.Objects, FMX.TMSHTMLText, System.ImageList, FMX.ImgList,
  FMX.Edit;

type
  /// <summary>
  ///   Base UI dialog for Software_DNA.
  /// </summary>
  TDNABaseDlg = class(TForm)
    btnCancel: TButton;
    btnOK: TButton;
    copnlInstruct: TCalloutPanel;
    gbxInfo: TGroupBox;
    ilstDlg: TImageList;
    imgLogo: TImage;
    layContents: TLayout;
    layIcon: TLayout;
    lblInstruct: TLabel;
    lblInstructCap: TLabel;
    pnlButtons: TPanel;
    procedure CancelButtonClicked(Sender: TObject);
    procedure EditExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure OKButtonClicked(Sender: TObject);
  strict protected
    /// <summary>
    ///   Called when the user clicks the dialog's CANCEL button.
    /// </summary>
    /// <remarks>
    ///   <para>
    ///     Default behaviour is to set the dialog's modal result
    ///     to mrCancel.
    ///   </para>
    ///   <para>
    ///     This method may be overridden in descendant classes to
    ///     allow for custom cancel behaviour.
    ///   </para>
    /// </remarks>
    procedure CancelClicked; virtual;
    procedure EmptyTextField(AField: TEdit); virtual;
    /// <summary>
    ///   Called by the create constructor to initialize control
    ///   properties.
    /// </summary>
    /// <remarks>
    ///   This method should be overridden in descendant classes to
    ///   properly initialize control properties.
    /// </remarks>
    procedure InitControls; virtual;
    /// <summary>
    ///   Called by the create constructor to initialize fields and
    ///   properties.
    /// </summary>
    /// <remarks>
    ///   This method should be overridden in descendant classes to
    ///   properly initialize class fields and properties.
    /// </remarks>
    procedure InitFields; virtual;
    /// <summary>
    ///   Called by the InitConrols property to initialize controls
    ///   on the Mac OS X platform.
    /// </summary>
    /// <remarks>
    ///   This method only gets called on the Mac OS X platform.
    /// </remarks>
    /// <seealso cref="InitControls" />
    procedure InitMacControls; virtual;
    /// <summary>
    ///   Called by the InitConrols property to initialize controls
    ///   on the MS Windows platform.
    /// </summary>
    /// <remarks>
    ///   This method only gets called on the MS Windows platform.
    /// </remarks>
    /// <seealso cref="InitControls" />
    procedure InitWinControls; virtual;
    function IsPasswordValid(Value: String; MaxLen: Integer = 16): Boolean; virtual;
    /// <summary>
    ///   Called when the user clicks the dialog's OK button.
    /// </summary>
    /// <remarks>
    ///   <para>
    ///     Default behaviour is to check for valid field entries
    ///     by calling ValidateFields.
    ///   </para>
    ///   <para>
    ///     If ValidateFields returns TRUE then this method calls
    ///     the UpdateProperties method and sets the dialog's modal
    ///     result to mrOK
    ///   </para>
    /// </remarks>
    /// <seealso cref="ValidateFields" />
    /// <seealso cref="UpdateProperties" />
    procedure OKClicked; virtual;
    procedure PasteTextField(AField: TEdit); virtual;
    function TrimTextField(AField: TEdit): String; virtual;
    /// <summary>
    ///   Called by the OKClicked method after all class fields have
    ///   been validated by the ValidateFields method.
    /// </summary>
    /// <remarks>
    ///   This method should be overridden in descendant classes that
    ///   need to update class properties when the OK button is
    ///   clicked.
    /// </remarks>
    /// <seealso cref="OKClicked" />
    /// <seealso cref="ValidateFields" />
    procedure UpdateProperties;
    /// <summary>
    ///   Called by the OKClicked method to determine if all fields
    ///   are valid.
    /// </summary>
    /// <returns>
    ///   Base class always returns TRUE. Descendant classes should
    ///   return TRUE when fields are valid, otherwise they should
    ///   return FALSE.
    /// </returns>
    /// <remarks>
    ///   <para>
    ///     This method should be overridden in descendant classes
    ///     that need check for valid field entries when the OK
    ///     button is clicked.
    ///   </para>
    ///   <para>
    ///     NOTE: Base class always returns TRUE.
    ///   </para>
    /// </remarks>
    /// <seealso cref="OKClicked" />
    function ValidateFields: Boolean; virtual;
  public
    constructor Create(AOwner: TComponent); override;
  end;

var
  DNABaseDlg: TDNABaseDlg;

implementation

{$R *.fmx}

uses
  AT.FMX.Forms, System.RegularExpressions, AT.DNA.ResourceStrings;

constructor TDNABaseDlg.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  Self.Visible := False;

  InitControls;   //Initialize all control properties...
  InitFields;     //Initialize all fields...
end;

procedure TDNABaseDlg.CancelButtonClicked(Sender: TObject);
begin
  CancelClicked;  //Call CancelClicked method...
end;

procedure TDNABaseDlg.CancelClicked;
begin
  ModalResult := mrCancel;  //Set modal result...
end;

procedure TDNABaseDlg.EditExit(Sender: TObject);
begin
  if (NOT Assigned(Sender)) then
    Exit;

  //todo: use RTTI instead...
  if (Sender IS TCustomEdit) then
    (Sender AS TCustomEdit).Text := (Sender AS TCustomEdit).Text.Trim;
end;

procedure TDNABaseDlg.EmptyTextField(AField: TEdit);
begin
  if (Assigned(AField)) then
    AField.Text := EmptyStr;
end;

procedure TDNABaseDlg.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  //Make sure form is hidden when closed...
  //Owner is responsible for freeing memory...

  Action := TCloseAction.caHide;
end;

procedure TDNABaseDlg.FormKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  //Check for Escape key...
  case Key of
    vkEscape: //on Escape key...
      begin
        CancelClicked;    //Call CancelClicked...
        Key := 0;         //Set Key to zero...
        KeyChar := #0;    //Set KeyChar to NULL character...
      end;
  else      //For all other keys...
    begin
      //Process all other keys checking for the Enter key
      //so it can be converted to a TAB key...
      ProcessFormEnterKeyPress(Self, Key, KeyChar, Shift);
    end;
  end;
end;

procedure TDNABaseDlg.InitControls;
begin
{$IF (Defined(MACOS) AND (NOT Defined(IOS))) }
  InitMacControls;  //Mac OS X specific...
{$IFEND}
{$IF Defined(MSWINDOWS) }
  InitWinControls;  //MS Windows specific...
{$IFEND}
end;

procedure TDNABaseDlg.InitFields;
begin
  // Do nothing in the base implementation...
end;

procedure TDNABaseDlg.InitMacControls;
begin
  //This method is only called on the Mac OS X platform...

  //Set OK button caption to SAVE and move it to far right...
  btnOK.Text := rstrSave;
  btnOK.Align := TAlignLayout.MostRight;

  //Make sure the CANCEL button is to the left of the OK button...
  btnCancel.Align := TAlignLayout.Right;
  btnCancel.Align := TAlignLayout.MostRight;
  btnCancel.Margins.Left := 24;
end;

procedure TDNABaseDlg.InitWinControls;
begin
  //This method is only called on the MS Windows platform...

  //Make sure the OK button is to the left of the CANCEL button...
  btnOK.Align := TAlignLayout.Right;
  btnOK.Align := TAlignLayout.MostRight;
end;

function TDNABaseDlg.IsPasswordValid(Value: String;
  MaxLen: Integer = 16): Boolean;
const
  cRegEx = '^([A-Za-z0-9\-@]{1,16})$';
begin
  if (Value.IsEmpty) then
    Exit(False);

  if (Value.Length > MaxLen) then
    Exit(False);

  Result := TRegEx.IsMatch(Value, cRegEx);
end;

procedure TDNABaseDlg.OKButtonClicked(Sender: TObject);
begin
  OKClicked;    //Call OKCLicked method...
end;

procedure TDNABaseDlg.OKClicked;
begin
  //Check if fields are valid...
  if (ValidateFields) then
    begin
      //Fields are valid...

      //Make sure properties are updated...
      UpdateProperties;

      //Set modal result...
      ModalResult := mrOk;
    end;
end;

procedure TDNABaseDlg.PasteTextField(AField: TEdit);
begin
  if (Assigned(AField)) then
    AField.PasteFromClipboard;
end;

function TDNABaseDlg.TrimTextField(AField: TEdit): String;
begin
  if (NOT Assigned(AField)) then
    Exit(EmptyStr);

  Result := Trim(AField.Text);
end;

procedure TDNABaseDlg.UpdateProperties;
begin
  // Do nothing in the base implementation...
end;

function TDNABaseDlg.ValidateFields: Boolean;
begin
  Result := True;   //Default is to return TRUE....
end;

end.
