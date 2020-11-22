// ******************************************************************
//
// Program Name   : AT Software_DNA Library
// Program Version: 1.00
// Platform(s)    : OS X, Win32, Win64
// Framework      : FireMonkey
//
// Filenames      : AT.DNA.FMX.Dlg.ReactivationMU.pas/.fmx
// File Version   : 1.30
// Date Created   : 04-MAY-2016
// Author         : Matthew S. Vesperman
//
// Description:
//
// Re-activation dialog for Software_DNA (Multi-User)
// FireMonkey version for cross-platform.
//
// Revision History:
//
// v1.00   :   Initial version
// v1.10   :   02-JUN-2016
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

unit AT.DNA.FMX.Dlg.ReactivationMU;

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
  TDNAReactivationMUDlg = class(TDNABaseDlg)
    btnClearPwd: TClearEditButton;
    btnForgowPwd: TButton;
    btnShowPwd: TPasswordEditButton;
    lblCurrentPwd: TLabel;
    txtCurrentPwd: TEdit;
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
    ///   Password property getter.
    /// </summary>
    function GetPassword: String;
    /// <summary>
    ///   ActivationCode property setter.
    /// </summary>
    procedure SetActivationCode(const Value: String);
    /// <summary>
    ///   Password property setter.
    /// </summary>
    procedure SetPassword(const Value: String);
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
    property Password: String read GetPassword write SetPassword;
    /// <summary>
    ///   Sets/Gets the reference to the OnForgotPassword event
    ///   handler.
    /// </summary>
    property OnForgotPassword: TNotifyEvent read FOnForgotPassword
      write FOnForgotPassword;
  end;

var
  DNAReactivationMUDlg: TDNAReactivationMUDlg;

implementation

{$R *.fmx}

uses
  AT.DNA.ResourceStrings;


procedure TDNAReactivationMUDlg.AttachForgotPwdHandler
  (AHandler: TDNAForgotPwdHandler);
begin
  FForgotPwdHandler := AHandler;  //Set forgot password handler...
end;

procedure TDNAReactivationMUDlg.ForgotPwdButtonClicked(Sender: TObject);
begin
  //Check for OnForgotPassword handler...
  if (Assigned(FOnForgotPassword)) then
    FOnForgotPassword(Self);  //We have one, so call it...

  //Check for forgot password handler...
  if (Assigned(FForgotPwdHandler)) then
    FForgotPwdHandler(Self);  //We have one, so call it...
end;

function TDNAReactivationMUDlg.GetPassword: String;
begin
  Result := txtCurrentPwd.Text.Trim; //Get current password...
end;

procedure TDNAReactivationMUDlg.InitControls;
begin
  inherited InitControls; //Call inherited...

  //Change OK button caption TO Re-Activate...
  btnOK.Text := rstrReactivate;

  txtCurrentPwd.SetFocus; //Set focus to current password field......
end;

procedure TDNAReactivationMUDlg.InitFields;
begin
  inherited InitFields;   //call inherited...

  //Set all fields to empty string...
  ActivationCode := EmptyStr;
  Password := EmptyStr;
end;

procedure TDNAReactivationMUDlg.SetActivationCode(const Value: String);
begin
  //Store activation code...
  FActivationCode := Value;

  //Set dialog caption to include activation code...
  Self.Caption := Format(rstrRActivateCapFmt, [Value]);
end;

procedure TDNAReactivationMUDlg.SetPassword(const Value: String);
begin
  //Set current password field...
  txtCurrentPwd.Text := Value.Trim;
end;

function TDNAReactivationMUDlg.ValidateFields: Boolean;
var
  ACurrPwd: String;
begin
  //Check for empty current password...
  ACurrPwd := txtCurrentPwd.Text.Trim;
  if (ACurrPwd.IsEmpty) then
    begin
      //Current password is blank, inform user...
      MessageDlg(rstrValYPwdEmpty, TMsgDlgType.mtError,
        [TMsgDlgBtn.mbOK], 0, TMsgDlgBtn.mbOK);
      txtCurrentPwd.SetFocus; //set focus to current pwd control...
      Exit(False);            //Validation failure...
    end;

  Result := inherited ValidateFields; //call inherited...
end;

end.
