// ******************************************************************
//
// Program Name   : AT Software_DNA Library
// Program Version: 1.00
// Platform(s)    : OS X, Win32, Win64
// Framework      : FireMonkey
//
// Filenames      : AT.DNA.FMX.Dlg.ForgotPwd.pas/.fmx
// File Version   : 1.20
// Date Created   : 04-MAY-2016
// Author         : Matthew S. Vesperman
//
// Description:
//
// Forgot password dialog for Software_DNA - FireMonkey version for
// cross-platform.
//
// Revision History:
//
// v1.00   :   Initial version
// v1.10   :   01-JUN-2016
//               + text field trimming
// v1.20   :   01-JUL-2016
//               * Implemented resource strings
//
// ******************************************************************
//
// COPYRIGHT © 2015 - PRESENT Angelic Technology
// ALL RIGHTS RESERVED WORLDWIDE
//
// ******************************************************************

unit AT.DNA.FMX.Dlg.ForgotPwd;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants, FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms,
  FMX.Dialogs, FMX.StdCtrls, AT.DNA.FMX.Dlg.Base, FMX.Edit,
  System.ImageList, FMX.ImgList, FMX.Objects, FMX.Layouts,
  FMX.Controls.Presentation;

type
  /// <summary>
  ///   Forgot Password dialog for Software_DNA.
  /// </summary>
  TDNAForgotPasswordDlg = class(TDNABaseDlg)
    btnClearEmail: TClearEditButton;
    lblEmail: TLabel;
    txtEmail: TEdit;
  strict private
    /// <summary>
    ///   Stores the value of the ActivationCode property.
    /// </summary>
    FActivationCode: String;
    /// <summary>
    ///   Email address getter.
    /// </summary>
    function GetEmailAddress: String;
    /// <summary>
    ///   ActivationCode property setter.
    /// </summary>
    procedure SetActivationCode(const Value: String);
    /// <summary>
    ///   EmailAddress property setter.
    /// </summary>
    procedure SetEmailAddress(const Value: String);
  strict protected
    procedure InitControls; override;
    procedure InitFields; override;
    procedure InitMacControls; override;
    function ValidateFields: Boolean; override;
  published
    /// <summary>
    ///   Sets/Gets the activation code for the dialog box.
    /// </summary>
    property ActivationCode: String read FActivationCode
      write SetActivationCode;
    /// <summary>
    ///   Gets/Sets the email address for the dialog box.
    /// </summary>
    property EmailAddress: String read GetEmailAddress
      write SetEmailAddress;
  end;

var
  DNAForgotPasswordDlg: TDNAForgotPasswordDlg;

implementation

{$R *.fmx}

uses
  AT.XPlatform.Internet, AT.DNA.ResourceStrings;

function TDNAForgotPasswordDlg.GetEmailAddress: String;
begin
  Result := txtEmail.Text.Trim;  //Return the email address...
end;

procedure TDNAForgotPasswordDlg.InitControls;
begin
  inherited InitControls; //Call inherited...

  txtEmail.SetFocus;  //Set focus to email address field...
end;

procedure TDNAForgotPasswordDlg.InitFields;
begin
  inherited InitFields;   //call inherited...

  //Set all fields to empty string...
  ActivationCode := EmptyStr;
  EmailAddress := EmptyStr;
end;

procedure TDNAForgotPasswordDlg.InitMacControls;
begin
  //This is only called on Mac OS X...

  inherited InitMacControls;  //call inherited...

  btnOK.Text := rstrRetrieve;  //Set OK button caption to 'Retrieve'...
end;

procedure TDNAForgotPasswordDlg.SetActivationCode
  (const Value: String);
begin
  //Store activation code...
  FActivationCode := Value.Trim;

  //Set dialog caption to include activation code...
  Self.Caption := Format(rstrForgotPwdCapFmt, [FActivationCode]);
end;

procedure TDNAForgotPasswordDlg.SetEmailAddress(const Value: String);
begin
  txtEmail.Text := Value.Trim; //Set email address field...
end;

function TDNAForgotPasswordDlg.ValidateFields: Boolean;
var
  AEmail: String;
begin
  //Check if email address field is empty...
  AEmail := txtEmail.Text.Trim;
  if (AEmail.IsEmpty) then
    begin
      //Email address is blank, inform user...
      MessageDlg(rstrValEmailEmpty, TMsgDlgType.mtError,
        [TMsgDlgBtn.mbOK], 0, TMsgDlgBtn.mbOK);
      txtEmail.SetFocus;  //Set focus to email address...
      Exit(False);        //Validation failure...
    end;

  //Check email address format...
  if (NOT CheckEmailFormat(AEmail)) then
    begin
      //Email address format incorrect, inform user...
      MessageDlg(rstrValEmailInvalid, TMsgDlgType.mtError,
        [TMsgDlgBtn.mbOK], 0, TMsgDlgBtn.mbOK);
      txtEmail.SetFocus;  //Set focus to email address...
      Exit(False);        //Validation failure...
    end;

  Result := inherited ValidateFields; //Call inherited...
end;

end.
