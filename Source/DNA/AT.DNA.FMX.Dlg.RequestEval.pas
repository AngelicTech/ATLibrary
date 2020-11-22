// ******************************************************************
//
// Program Name   : AT Software_DNA Library
// Program Version: 1.00
// Platform(s)    : OS X, Win32, Win64
// Framework      : FireMonkey
//
// Filenames      : AT.DNA.FMX.Dlg.RequestEval.pas/.fmx
// File Version   : 1.20
// Date Created   : 04-MAY-2016
// Author         : Matthew S. Vesperman
//
// Description:
//
// Evaluation request dialog for Software_DNA - FireMonkey version for
// cross-platform.
//
// Revision History:
//
// v1.00   :   Initial version
// v1.10   :   02-JUN-2016
//               + text field trimming
// v1.20   :   02-JUL-2016
//               * Implemented resource strings
//
// ******************************************************************
//
// COPYRIGHT © 2015 - PRESENT Angelic Technology
// ALL RIGHTS RESERVED WORLDWIDE
//
// ******************************************************************

unit AT.DNA.FMX.Dlg.RequestEval;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants, FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms,
  FMX.Dialogs, FMX.StdCtrls, AT.DNA.FMX.Dlg.Base, System.ImageList,
  FMX.ImgList, FMX.Objects, FMX.Layouts, FMX.Controls.Presentation,
  FMX.Edit;

type
  /// <summary>
  ///   Request Evaluation dialog for Software_DNA.
  /// </summary>
  /// <remarks>
  ///   When the dialog box's OK button is clicked the dialog box
  ///   validates the email address the user has input.
  /// </remarks>
  TDNARequestEvalDlg = class(TDNABaseDlg)
    txtConfirmEmail: TEdit;
    ClearEditButton1: TClearEditButton;
    lblConfirmEmail: TLabel;
    txtEmail: TEdit;
    ClearEditButton2: TClearEditButton;
    lblEmail: TLabel;
  strict private
    /// <summary>
    ///   EmailAddress property getter.
    /// </summary>
    /// <seealso cref="EmailAddress" />
    function GetEmailAddress: String;
    /// <summary>
    ///   EmailAddress property setter.
    /// </summary>
    /// <seealso cref="EmailAddress" />
    procedure SetEmailAddress(const Value: String);
  strict protected
    procedure InitControls; override;
    procedure InitFields; override;
    procedure InitMacControls; override;
    function ValidateFields: Boolean; override;
  published
    /// <summary>
    ///   Gets/Sets the email address field of the dialog box.
    /// </summary>
    property EmailAddress: String read GetEmailAddress
      write SetEmailAddress;
  end;

var
  DNARequestEvalDlg: TDNARequestEvalDlg;

implementation

{$R *.fmx}

uses
  AT.XPlatform.Internet, AT.DNA.ResourceStrings;

function TDNARequestEvalDlg.GetEmailAddress: String;
begin
  //Return the email address...
  Result := txtEmail.Text.Trim;
end;

procedure TDNARequestEvalDlg.InitControls;
begin
  inherited InitControls;  //call inherited...

  txtEmail.SetFocus;   //Set the focus to the email address field...
end;

procedure TDNARequestEvalDlg.InitFields;
begin
  inherited InitFields; //call inherited...

  //Init the email address field to empty string...
  EmailAddress := EmptyStr;
end;

procedure TDNARequestEvalDlg.InitMacControls;
begin
  //Only called on Mac OS X platform...

  inherited InitMacControls;  //call inherited...

  btnOK.Text := 'Send';  //Change OK button caption to Send...
end;

procedure TDNARequestEvalDlg.SetEmailAddress(const Value: String);
begin
  //Set both the email and confirm email fields to Value...
  txtEmail.Text := Value.Trim;
  txtConfirmEmail.Text := Value.Trim;
end;

function TDNARequestEvalDlg.ValidateFields: Boolean;
var
  AEmail, AConfirmEmail: String;
begin
  //Check if email control is empty...
  AEmail := txtEmail.Text.Trim;
  if (AEmail.IsEmpty) then
    begin
      //Email control is blank so inform user...
      MessageDlg(rstrValEmailEmpty, TMsgDlgType.mtError,
        [TMsgDlgBtn.mbOK], 0, TMsgDlgBtn.mbOK);
      txtEmail.SetFocus;  //Set focus to email control
      Exit(False);        //Validation failure...
    end;

  //Ensure email address is valid...
  if (NOT CheckEmailFormat(AEmail)) then
    begin
      //Invalid email address, inform user...
      MessageDlg(rstrValEmailInvalid, TMsgDlgType.mtError,
        [TMsgDlgBtn.mbOK], 0, TMsgDlgBtn.mbOK);
      txtEmail.SetFocus;  //Set focus to email control...
      Exit(False);        //Validation failure...
    end;

  //Check if confirm email control is empty...
  AConfirmEmail := txtConfirmEmail.Text.Trim;
  if (AConfirmEmail.IsEmpty) then
    begin
      //Confirm email control is blank, inform user...
      MessageDlg(rstrValEmailConfirmEmpty, TMsgDlgType.mtError,
        [TMsgDlgBtn.mbOK], 0, TMsgDlgBtn.mbOK);
      txtConfirmEmail.SetFocus; //Set focus to confirm email control..
      Exit(False);              //Validation failure...
    end;

  //Ensure confirm email address is valid...
  if (NOT CheckEmailFormat(AConfirmEmail)) then
    begin
      //Invalid confirm email address, inform user...
      MessageDlg(rstrValEmailConfirmInvalid, TMsgDlgType.mtError,
        [TMsgDlgBtn.mbOK], 0, TMsgDlgBtn.mbOK);
      txtConfirmEmail.SetFocus; //Set focus to confirm email control..
      Exit(False);              //Validation failure...
    end;

  //Ensure email and confirm email values are the same...
  //NOT case-sensitive...
  if (CompareText(AEmail, AConfirmEmail) <> 0) then
    begin
      //Email addresses do NOT match, inform user...
      MessageDlg(rstrValEmailMismatch, TMsgDlgType.mtError,
        [TMsgDlgBtn.mbOK], 0, TMsgDlgBtn.mbOK);
      txtConfirmEmail.SetFocus; //Set focus to confirm email control..
      Exit(False);              //Validation failure...
    end;

  //Call inherited...
  Result := inherited ValidateFields;
end;

end.
