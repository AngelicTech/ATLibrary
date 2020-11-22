// ******************************************************************
//
// Program Name   : AT Software_DNA Library
// Program Version: 1.00
// Platform(s)    : OS X, Win32, Win64
// Framework      : FireMonkey
//
// Filenames      : AT.DNA.FMX.Dlg.Activation.pas/.fmx
// File Version   : 1.20
// Date Created   : 04-MAY-2016
// Author         : Matthew S. Vesperman
//
// Description:
//
// Activation dialog for Software_DNA - FireMonkey version for
// cross-platform.
//
// Revision History:
//
// v1.00   :   Initial version
// v1.10   :   30-MAY-2016
//               + text field trimming
//               + password field validity check
// v1.20   :   28-JUN-2016
//               * Implemented resource strings
//
// ******************************************************************
//
// COPYRIGHT © 2015 - PRESENT Angelic Technology
// ALL RIGHTS RESERVED WORLDWIDE
//
// ******************************************************************

unit AT.DNA.FMX.Dlg.Activation;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants, FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms,
  FMX.Dialogs, FMX.StdCtrls, AT.DNA.FMX.Dlg.Base, FMX.Objects,
  FMX.Edit, System.ImageList, FMX.ImgList, FMX.Layouts,
  FMX.Controls.Presentation;

type
  TDNAActivationDlg = class(TDNABaseDlg)
    btnConfirmEmailClear: TClearEditButton;
    btnConfirmPwdClear: TClearEditButton;
    btnConfirmPwdShow: TPasswordEditButton;
    btnEmailClear: TClearEditButton;
    btnPwdClear: TClearEditButton;
    btnPwdShow: TPasswordEditButton;
    lblConfirmEmail: TLabel;
    lblConfirmPwd: TLabel;
    lblEmail: TLabel;
    lblPassword: TLabel;
    Line1: TLine;
    txtConfirmEmail: TEdit;
    txtConfirmPassword: TEdit;
    txtEmail: TEdit;
    txtPassword: TEdit;
  strict private
    /// <summary>
    ///   Stores the value of the ActivationCode property.
    /// </summary>
    FActivationCode: string;
    /// <summary>
    ///   EmailAddress property getter.
    /// </summary>
    function GetEmailAddress: String;
    /// <summary>
    ///   Password property getter.
    /// </summary>
    function GetPassword: string;
    /// <summary>
    ///   ActivationCode property setter.
    /// </summary>
    procedure SetActivationCode(const Value: string);
    /// <summary>
    ///   EmailAddress property setter.
    /// </summary>
    procedure SetEmailAddress(const Value: String);
    /// <summary>
    ///   Password property setter.
    /// </summary>
    procedure SetPassword(const Value: string);
  strict protected
    procedure InitControls; override;
    procedure InitFields; override;
    function ValidateFields: Boolean; override;
  published
    /// <summary>
    ///   Gets/Sets the activation code for the dialog box.
    /// </summary>
    property ActivationCode: string read FActivationCode
      write SetActivationCode;
    /// <summary>
    ///   Gets/Sets the email address field of the dialog box.
    /// </summary>
    property EmailAddress: String read GetEmailAddress
      write SetEmailAddress;
    /// <summary>
    ///   Gets/Sets the password field of the dialog box.
    /// </summary>
    property Password: string read GetPassword write SetPassword;
  end;

var
  DNAActivationDlg: TDNAActivationDlg;

implementation

{$R *.fmx}

uses
  AT.XPlatform.Internet, AT.DNA.ResourceStrings;


function TDNAActivationDlg.GetEmailAddress: String;
begin
  Result := TrimTextField(txtEmail);  //Return the email address...
end;

function TDNAActivationDlg.GetPassword: string;
begin
  Result := TrimTextField(txtPassword); //Return the password...
end;

procedure TDNAActivationDlg.InitControls;
begin
  inherited InitControls; //call inherited...

  //Set OK button caption to 'Activate'...
  btnOK.Text := rstrActivate;

  txtEmail.SetFocus;  //set focus to email address field...
end;

procedure TDNAActivationDlg.InitFields;
begin
  inherited InitFields; //call inherited...

  //Set all fields to empty string...
  ActivationCode := EmptyStr;
  EmailAddress := EmptyStr;
  Password := EmptyStr;
end;

procedure TDNAActivationDlg.SetActivationCode(const Value: string);
begin
  //Store activation code...
  FActivationCode := Value;

  //Set dialog caption to include activation code...
  Self.Caption := Format(rstrActivateCapFmt, [Value]);
end;

procedure TDNAActivationDlg.SetEmailAddress(const Value: String);
begin
  //Set email and confirm email to value...
  txtEmail.Text := Value.Trim;
  txtConfirmEmail.Text := Value.Trim;
end;

procedure TDNAActivationDlg.SetPassword(const Value: string);
begin
  //Set pwd and confirm pwd fields to value...
  txtPassword.Text := Value.Trim;
  txtConfirmPassword.Text := Value.Trim;
end;

function TDNAActivationDlg.ValidateFields: Boolean;
var
  AEmail, AConfirmEmail, APwd, AConfirmPwd: String;
begin
  //Check if email address is empty...
  AEmail := TrimTextField(txtEmail);
  if (AEmail.IsEmpty) then
    begin
      //Email address is blank, inform user...
      MessageDlg(rstrValEmailEmpty, TMsgDlgType.mtError,
        [TMsgDlgBtn.mbOK], 0, TMsgDlgBtn.mbOK);
      txtEmail.SetFocus;  //Set focus to email address...
      Exit(False);        //Validation failure...
    end;

  //Check format of email address...
  if (NOT CheckEmailFormat(AEmail)) then
    begin
      //Email address format invalid, inform user...
      MessageDlg(rstrValEmailInvalid, TMsgDlgType.mtError,
        [TMsgDlgBtn.mbOK], 0, TMsgDlgBtn.mbOK);
      txtEmail.SetFocus;  //Set focus to email address...
      Exit(False);        //Validation failure...
    end;

  //Check if confirm email address is empty...
  AConfirmEmail := TrimTextField(txtConfirmEmail);
  if (AConfirmEmail.IsEmpty) then
    begin
      //Confirm email is blank, inform user...
      MessageDlg(rstrValEmailConfirmEmpty, TMsgDlgType.mtError,
        [TMsgDlgBtn.mbOK], 0, TMsgDlgBtn.mbOK);
      txtConfirmEmail.SetFocus;   //Set focus to confirm email...
      Exit(False);                //Validation failure...
    end;

  //Check format of confirm email...
  if (NOT CheckEmailFormat(AConfirmEmail)) then
    begin
      //Confirm email format invalid...
      MessageDlg(rstrValEmailConfirmInvalid, TMsgDlgType.mtError,
        [TMsgDlgBtn.mbOK], 0, TMsgDlgBtn.mbOK);
      txtConfirmEmail.SetFocus; //Set focus to confirm email...
      Exit(False);              //Validation failure...
    end;

  //Check if email and confirm email are the same, case-insensitive...
  if (CompareText(AEmail, AConfirmEmail) <> 0) then
    begin
      //Emails do not match, inform user...
      MessageDlg(rstrValEmailMismatch, TMsgDlgType.mtError,
        [TMsgDlgBtn.mbOK], 0, TMsgDlgBtn.mbOK);
      txtConfirmEmail.SetFocus; //Set focus to confirm email...
      Exit(False);              //Validation failure...
    end;

  //Check if password is empty...
  APwd := TrimTextField(txtPassword);
  if (APwd.IsEmpty) then
    begin
      //Password is blank, inform user...
      MessageDlg(rstrValPwdEmpty, TMsgDlgType.mtError,
        [TMsgDlgBtn.mbOK], 0, TMsgDlgBtn.mbOK);
      txtPassword.SetFocus; //Set focus to password...
      Exit(False);          //Validation failure...
    end;

  //Check for valid password...
  if (NOT IsPasswordValid(APwd)) then
    begin
      //Password is invalid...
      MessageDlg(rstrValPwdInvalid, TMsgDlgType.mtError,
        [TMsgDlgBtn.mbOK], 0, TMsgDlgBtn.mbOK);
      txtPassword.SetFocus; //Set focus to password...
      Exit(False);              //Validation failure...
    end;

  //Check if confirm password is blank...
  AConfirmPwd := TrimTextField(txtConfirmPassword);
  if (AConfirmPwd.IsEmpty) then
    begin
      //Confirm pwd is blank, inform user...
      MessageDlg(rstrValPwdConfirmEmpty, TMsgDlgType.mtError,
        [TMsgDlgBtn.mbOK], 0, TMsgDlgBtn.mbOK);
      txtConfirmPassword.SetFocus;  //Set focus to confirm pwd...
      Exit(False);                  //Validation failure...
    end;

  //Check if pwd and confirm pwd match, case-sensitive...
  if (APwd.CompareTo(AConfirmPwd) <> 0) then
    begin
      //Passwords do NOT match, inform user...
      MessageDlg(rstrValPwdMismatch, TMsgDlgType.mtError,
        [TMsgDlgBtn.mbOK], 0, TMsgDlgBtn.mbOK);
      txtPassword.SetFocus; //Set focus to password field...
      Exit(False);          //Validation failure...
    end;

  Result := inherited ValidateFields; //call inherited...
end;

end.
