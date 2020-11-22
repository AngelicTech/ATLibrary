// ******************************************************************
//
// Program Name   : AT Software_DNA Library
// Program Version: 1.00
// Platform(s)    : OS X, Win32, Win64
// Framework      : FireMonkey
//
// Filenames      : AT.DNA.FMX.Dlg.Reactivation.pas/.fmx
// File Version   : 1.30
// Date Created   : 04-MAY-2016
// Author         : Matthew S. Vesperman
//
// Description:
//
// Re-activation dialog for Software_DNA - FireMonkey version for
// cross-platform.
//
// Revision History:
//
// v1.00   :   Initial version
// v1.10   :   01-JUN-2016
//               + text field trimming
// v1.20   :   28-JUN-2016
//               * Refactored code
// v1.30   :   02-JUL-2016
//               * Implemented resource strings
//
// ******************************************************************
//
// COPYRIGHT © 2015 - PRESENT Angelic Technology
// ALL RIGHTS RESERVED WORLDWIDE
//
// ******************************************************************

unit AT.DNA.FMX.Dlg.Reactivation;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants, FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms,
  FMX.Dialogs, FMX.StdCtrls, AT.DNA.FMX.Dlg.Base, System.ImageList,
  FMX.ImgList, FMX.Objects, FMX.Layouts, FMX.Controls.Presentation,
  FMX.Edit, AT.SoftwareDNA.Types;

type
  /// <summary>
  ///   Reactivation dialog for Software_DNA.
  /// </summary>
  TDNAReactivationDlg = class(TDNABaseDlg)
    btnClearConfNewPwd: TClearEditButton;
    btnClearCurrPwd: TClearEditButton;
    btnClearNewPwd: TClearEditButton;
    btnForgotPwd: TButton;
    btnShowConfNewPwd: TPasswordEditButton;
    btnShowCurrPwd: TPasswordEditButton;
    btnShowNewPwd: TPasswordEditButton;
    lblConfirmNewPwd: TLabel;
    lblCurrentPwd: TLabel;
    lblNewPassword: TLabel;
    shpInfoDivider: TLine;
    txtConfirmPassword: TEdit;
    txtCurrentPwd: TEdit;
    txtNewPassword: TEdit;
    procedure ForgotPwdButtonClicked(Sender: TObject);
  strict private
    /// <summary>
    ///   Stores the value of the ActivationCode property.
    /// </summary>
    FActivationCode: String;
    /// <summary>
    ///   Stores a reference to the forgot password handler.
    /// </summary>
    FForgotPwdHandler: TDNAForgotPwdHandler;
    /// <summary>
    ///   Stores a reference to the OnForgotPassword event handler.
    /// </summary>
    FOnForgotPassword: TNotifyEvent;
    /// <summary>
    ///   CurrentPassword property getter.
    /// </summary>
    function GetCurrentPassword: String;
    /// <summary>
    ///   NewPassword property getter.
    /// </summary>
    function GetNewPassword: String;
    /// <summary>
    ///   ActivationCode property setter.
    /// </summary>
    procedure SetActivationCode(const Value: String);
    /// <summary>
    ///   CurrentPassword property setter.
    /// </summary>
    procedure SetCurrentPassword(const Value: String);
    /// <summary>
    ///   NewPassword property setter.
    /// </summary>
    procedure SetNewPassword(const Value: String);
  strict protected
    procedure InitControls; override;
    procedure InitFields; override;
    function ValidateFields: Boolean; override;
  public
    /// <summary>
    ///   Called to attach a handler to the dialog to be called when
    ///   the forgot password button is clicked.
    /// </summary>
    /// <param name="AHandler">
    ///   Pass a reference to a procedure to set the handler, pass
    ///   NIL to clear it.
    /// </param>
    /// <remarks>
    ///   AHandler MUST match the signature of TDNAForgotPwdHandler.
    /// </remarks>
    /// <seealso cref="TDNAForgotPwdHandler" />
    procedure AttachForgotPwdHandler(AHandler: TDNAForgotPwdHandler);
  published
    /// <summary>
    ///   Sets/Gets the activation code for the dialog box.
    /// </summary>
    property ActivationCode: String read FActivationCode
      write SetActivationCode;
    /// <summary>
    ///   Sets/Gets the current password field of the dialog box.
    /// </summary>
    property CurrentPassword: String read GetCurrentPassword
      write SetCurrentPassword;
    /// <summary>
    ///   Sets/Gets the new password field of the dialog box.
    /// </summary>
    property NewPassword: String read GetNewPassword
      write SetNewPassword;
    /// <summary>
    ///   Sets/Gets the reference to the OnForgotPassword event
    ///   handler.
    /// </summary>
    property OnForgotPassword: TNotifyEvent read FOnForgotPassword
      write FOnForgotPassword;
  end;

var
  DNAReactivationDlg: TDNAReactivationDlg;

implementation

{$R *.fmx}

uses
  AT.DNA.ResourceStrings;


procedure TDNAReactivationDlg.AttachForgotPwdHandler
  (AHandler: TDNAForgotPwdHandler);
begin
  FForgotPwdHandler := AHandler;  //Set forgot password handler...
end;

procedure TDNAReactivationDlg.ForgotPwdButtonClicked(Sender: TObject);
begin
  //Check for OnForgotPassword handler...
  if (Assigned(FOnForgotPassword)) then
    FOnForgotPassword(Self);  //We have one, so call it...

  //Check for forgot password handler...
  if (Assigned(FForgotPwdHandler)) then
    FForgotPwdHandler(Self);  //We have one, so call it...
end;

function TDNAReactivationDlg.GetCurrentPassword: String;
begin
  Result := txtCurrentPwd.Text.Trim; //Get current password...
end;

function TDNAReactivationDlg.GetNewPassword: String;
begin
  Result := txtNewPassword.Text.Trim; //Get new password...
end;

procedure TDNAReactivationDlg.InitControls;
begin
  inherited InitControls; //Call inherited...

  //Change OK button caption TO Re-Activate...
  btnOK.Text := rstrReactivate;

  txtCurrentPwd.SetFocus; //Set focus to current password field......
end;

procedure TDNAReactivationDlg.InitFields;
begin
  inherited InitFields;   //call inherited...

  //Set all fields to empty string...
  ActivationCode := EmptyStr;
  CurrentPassword := EmptyStr;
  NewPassword := EmptyStr;
end;

procedure TDNAReactivationDlg.SetActivationCode(const Value: String);
begin
  //Store activation code...
  FActivationCode := Value.Trim;

  //Set dialog caption to include activation code...
  Self.Caption := Format(rstrRActivateCapFmt, [FActivationCode]);
end;

procedure TDNAReactivationDlg.SetCurrentPassword(const Value: String);
begin
  //Set current password field...
  txtCurrentPwd.Text := Value.Trim;
end;

procedure TDNAReactivationDlg.SetNewPassword(const Value: String);
begin
  //Set new password and confirm new password fields...
  txtNewPassword.Text := Value.Trim;
  txtConfirmPassword.Text := Value.Trim;
end;

function TDNAReactivationDlg.ValidateFields: Boolean;
var
  ACurrPwd, ANewPwd, AConfirmPwd: String;
begin
  //Check for empty current password...
  ACurrPwd := txtCurrentPwd.Text.Trim;
  if (ACurrPwd.IsEmpty) then
    begin
      //Current password is blank, inform user...
      MessageDlg(rstrValCPwdEmpty, TMsgDlgType.mtError,
        [TMsgDlgBtn.mbOK], 0, TMsgDlgBtn.mbOK);
      txtCurrentPwd.SetFocus; //set focus to current pwd control...
      Exit(False);            //Validation failure...
    end;

  //Check for empty new password field...
  ANewPwd := txtNewPassword.Text.Trim;
  if (ANewPwd.IsEmpty) then
    begin
      //New password is blank, inform user...
      MessageDlg(rstrValNPwdEmpty, TMsgDlgType.mtError,
        [TMsgDlgBtn.mbOK], 0, TMsgDlgBtn.mbOK);
      txtNewPassword.SetFocus;  //Set focus to new pwd control...
      Exit(False);              //Validation failure...
    end;

  //Ensure new password is different than current pwd...
  if (ANewPwd.CompareTo(ACurrPwd) = 0) then
    begin
      //New and current passwords match, inform user...
      MessageDlg(rstrValCPwdNPwdMatch, TMsgDlgType.mtError,
        [TMsgDlgBtn.mbOK], 0, TMsgDlgBtn.mbOK);
      txtNewPassword.SetFocus;  //Set focus to new pwd control...
      Exit(False);              //Validation failure...
    end;

  //Check if confirm password is blank...
  AConfirmPwd := txtConfirmPassword.Text.Trim;
  if (AConfirmPwd.IsEmpty) then
    begin
      //Confirm pwd is blank, inform user...
      MessageDlg(rstrValNPwdConfirmEmpty, TMsgDlgType.mtError,
        [TMsgDlgBtn.mbOK], 0, TMsgDlgBtn.mbOK);
      txtConfirmPassword.SetFocus;  //Set focus to confirm pwd...
      Exit(False);                  //Validation failure...
    end;

  //Make sure confirm password does not match current pwd...
  if (AConfirmPwd.CompareTo(ACurrPwd) = 0) then
    begin
      //Confirm matches current pwd, inform user...
      MessageDlg(rstrValPwdConfirmWrong, TMsgDlgType.mtError,
        [TMsgDlgBtn.mbOK], 0, TMsgDlgBtn.mbOK);
      txtConfirmPassword.SetFocus;  //Set focus to confirm pwd...
      Exit(False);                  //Validation failure...
    end;

  //Ensure new password and confirm passwords match...
  if (ANewPwd.CompareTo(AConfirmPwd) <> 0)
  then
    begin
      //new and confirm pwds do not match, inform user...
      MessageDlg(rstrValNPwdMismatch, TMsgDlgType.mtError,
        [TMsgDlgBtn.mbOK], 0, TMsgDlgBtn.mbOK);
      txtConfirmPassword.SetFocus; //Set focus to confirm pwd...
      Exit(False);                 //Validation failure...
    end;

  Result := inherited ValidateFields; //call inherited...
end;

end.
