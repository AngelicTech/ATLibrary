// ******************************************************************
//
// Program Name   : AT Software_DNA Library
// Program Version: 1.00
// Platform(s)    : OS X, Win32, Win64
// Framework      : FireMonkey
//
// Filenames      : AT.DNA.FMX.Dlg.Deactivate.pas/.fmx
// File Version   : 1.20
// Date Created   : 04-MAY-2016
// Author         : Matthew S. Vesperman
//
// Description:
//
// Deactivate dialog for Software_DNA - FireMonkey version for
// cross-platform.
//
// Revision History:
//
// v1.00   :   Initial version
// v1.10   :   31-MAY-2016
//               + text field trimming
//               + password field max length (16)
//               + password field validity check
// v1.20   :   29-JUN-2016
//               * Implemented resource strings
//
// ******************************************************************
//
// COPYRIGHT © 2015 - PRESENT Angelic Technology
// ALL RIGHTS RESERVED WORLDWIDE
//
// ******************************************************************

unit AT.DNA.FMX.Dlg.Deactivate;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants, FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms,
  FMX.Dialogs, FMX.StdCtrls, AT.DNA.FMX.Dlg.Base, FMX.Edit,
  System.ImageList, FMX.ImgList, FMX.Objects, FMX.Layouts,
  FMX.Controls.Presentation;

type
  /// <summary>
  ///   Deactivation dialog for Software_DNA.
  /// </summary>
  TDNADeactivateDlg = class(TDNABaseDlg)
    btnPwdClear: TClearEditButton;
    btnPwdShow: TPasswordEditButton;
    lblPassword: TLabel;
    txtPassword: TEdit;
  strict private
    /// <summary>
    ///   Stores the value of the ActivationCode property.
    /// </summary>
    FActivationCode: String;
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
    /// <summary>
    ///   Retrieves the activation code from the license file.
    /// </summary>
    function _GetActivationCode: string;
  published
    /// <summary>
    ///   Sets/Gets the activation code for the dialog box.
    /// </summary>
    property ActivationCode: String read FActivationCode
      write SetActivationCode;
    /// <summary>
    ///   Sets/Gets the password for the dialog box.
    /// </summary>
    property Password: String read GetPassword write SetPassword;
  end;

var
  DNADeactivateDlg: TDNADeactivateDlg;

implementation

{$R *.fmx}

uses
  AT.XPlatform.Internet, AT.SoftwareDNA.XPlatform,
  AT.SoftwareDNA.Types, AT.DNA.ResourceStrings;

function TDNADeactivateDlg.GetPassword: String;
begin
  Result := txtPassword.Text.Trim; //Return the password field...
end;

procedure TDNADeactivateDlg.InitControls;
begin
  inherited InitControls; //call inherited...

  //Set OK button caption to 'Deactivate'...
  btnOK.Text := rstrDeactivate;

  txtPassword.SetFocus; //Set focus to the password field...
end;

procedure TDNADeactivateDlg.InitFields;
begin
  inherited InitFields; //call inherited...

  //Attempt to get the activation code from the license file...
  ActivationCode := _GetActivationCode;

  //Set password field to empty string...
  Password := EmptyStr;
end;

procedure TDNADeactivateDlg.SetActivationCode(const Value: String);
begin
  //Store activation code...
  FActivationCode := Value.Trim;

  //Set dialog caption to include activation code...
  Self.Caption := Format(rstrDActivateCapFmt, [FActivationCode]);
end;

procedure TDNADeactivateDlg.SetPassword(const Value: String);
begin
  txtPassword.Text := Value.Trim;  //Set password field...
end;

function TDNADeactivateDlg.ValidateFields: Boolean;
var
  APwd: String;
begin
  //Check for empty password field...
  APwd := txtPassword.Text.Trim;
  if (APwd.IsEmpty) then
    begin
      //Password is blank, inform user...
      MessageDlg(rstrValPwdEmpty, TMsgDlgType.mtError,
        [TMsgDlgBtn.mbOK], 0, TMsgDlgBtn.mbOK);
      txtPassword.SetFocus; //Set focus to password field...
      Exit(False);          //Validation failure...
    end;

  Result := inherited ValidateFields; //Call inherited...
end;

function TDNADeactivateDlg._GetActivationCode: string;
var
  Err: Integer;
  sResult: String;
begin
  //Try and get activation code from license file...
  if (NOT DNAParam(TDNAParams.parmActivationCode, sResult, Err)) then
    sResult := EmptyStr;  //Couldn't retrieve, use empty string...

  Result := sResult;  //Return result...
end;

end.
