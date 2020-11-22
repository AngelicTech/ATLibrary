// ******************************************************************
//
// Program Name   : AT Software_DNA Library
// Program Version: 1.00
// Platform(s)    : OS X, Win32, Win64
// Framework      : FireMonkey
//
// Filenames      : AT.DNA.FMX.Dlg.ActivationCode.pas/.fmx
// File Version   : 1.30
// Date Created   : 04-MAY-2016
// Author         : Matthew S. Vesperman
//
// Description:
//
// Activation code dialog for Software_DNA - FireMonkey version for
// cross-platform.
//
// Revision History:
//
// v1.00   :   Initial version
// v1.10   :   31-MAY-2016
//               + text field trimming
//               + code field max length (50)
//               + field validation
// v1.20   :   28-JUN-2016
//               * Refactored code
// v1.30   :   29-JUN-2016
//               * Implemented resource strings
//               + Made dialog evaluation aware.
//
// ******************************************************************
//
// COPYRIGHT © 2015 - PRESENT Angelic Technology
// ALL RIGHTS RESERVED WORLDWIDE
//
// ******************************************************************

unit AT.DNA.FMX.Dlg.ActivationCode;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants, FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms,
  FMX.Dialogs, FMX.StdCtrls, AT.DNA.FMX.Dlg.Base,
  FMX.Controls.Presentation, FMX.Objects, FMX.Layouts,
  FMX.TMSHTMLText, FMX.Edit, System.ImageList, FMX.ImgList,
  AT.SoftwareDNA.Types;

type
  /// <summary>
  ///   Activation ActivationCode dialog for Software_DNA.
  /// </summary>
  TDNAActivationCodeDlg = class(TDNABaseDlg)
    btnClearCode: TClearEditButton;
    btnEvaluate: TButton;
    btnPasteCode: TSpeedButton;
    btnProxy: TButton;
    lblCode: TLabel;
    txtCode: TEdit;
    procedure btnPasteCodeClick(Sender: TObject);
    procedure EvaluateButtonClicked(Sender: TObject);
    procedure ProxyButtonClicked(Sender: TObject);
  strict private
    /// <summary>
    ///   Stores a reference to the OnChangeProxySettings event
    ///   handler.
    /// </summary>
    FOnChangeProxySettings: TNotifyEvent;
    /// <summary>
    ///   Stores a reference to the OnRequestEvaluation event
    ///   handler.
    /// </summary>
    FOnRequestEvaluation: TNotifyEvent;
    /// <summary>
    ///   Stores a reference to the proxy settings handler.
    /// </summary>
    FProxySettingsHandler: TDNAProxySettingHandler;
    /// <summary>
    ///   Stores a reference to the request evaluation handler.
    /// </summary>
    FRequestEvalHandler: TDNARequestEvalHandler;
    /// <summary>
    ///   ActivationCode property getter.
    /// </summary>
    function GetActivationCode: String;
    /// <summary>
    ///   EvaluateButtonVisible property getter.
    /// </summary>
    function GetEvaluateButtonVisible: Boolean;
    /// <summary>
    ///   ProxyButtonVisible property getter.
    /// </summary>
    function GetProxyButtonVisible: Boolean;
    /// <summary>
    ///   ActivationCode property setter.
    /// </summary>
    procedure SetActivationCode(const Value: String);
    /// <summary>
    ///   EvaluateButtonVisible property setter.
    /// </summary>
    procedure SetEvaluateButtonVisible(const Value: Boolean);
    /// <summary>
    ///   ProxyButtonVisible property setter.
    /// </summary>
    procedure SetProxyButtonVisible(const Value: Boolean);
  strict protected
    procedure InitControls; override;
    procedure InitFields; override;
    function ValidateFields: Boolean; override;
  public
    /// <summary>
    ///   Called to attach a handler to the dialog to be called when
    ///   the proxy settings button is clicked.
    /// </summary>
    procedure AttachProxySettingHandler
      (AHandler: TDNAProxySettingHandler);
    /// <summary>
    ///   Called to attach a handler to the dialog to be called when
    ///   the request evaluation button is clicked.
    /// </summary>
    procedure AttachRequestEvalHandler
      (AHandler: TDNARequestEvalHandler);
  published
    /// <summary>
    ///   Sets/Gets the activation code field.
    /// </summary>
    property ActivationCode: String read GetActivationCode
      write SetActivationCode;
    /// <summary>
    ///   Gets/Sets the visibility of the request evaluation button.
    /// </summary>
    property EvaluateButtonVisible: Boolean
      read GetEvaluateButtonVisible write SetEvaluateButtonVisible;
    /// <summary>
    ///   Gets/sets the visibility of the proxy settings button.
    /// </summary>
    property ProxyButtonVisible: Boolean read GetProxyButtonVisible
      write SetProxyButtonVisible;
    /// <summary>
    ///   Sets/Gets the reference to the OnChangeProxySettings event
    ///   handler.
    /// </summary>
    property OnChangeProxySettings: TNotifyEvent
      read FOnChangeProxySettings write FOnChangeProxySettings;
    /// <summary>
    ///   Sets/Gets the reference to the OnRequestEvaluation event
    ///   handler.
    /// </summary>
    property OnRequestEvaluation: TNotifyEvent
      read FOnRequestEvaluation write FOnRequestEvaluation;
  end;

var
  DNAActivationCodeDlg: TDNAActivationCodeDlg;

implementation

{$R *.fmx}

uses
  AT.DNA.ResourceStrings;

procedure TDNAActivationCodeDlg.AttachProxySettingHandler
  (AHandler: TDNAProxySettingHandler);
begin
  //Set the reference to the proxy settings handler...
  FProxySettingsHandler := AHandler;
end;

procedure TDNAActivationCodeDlg.AttachRequestEvalHandler
  (AHandler: TDNARequestEvalHandler);
begin
  //Set the reference to the request evaluation handler...
  FRequestEvalHandler := AHandler;
end;

procedure TDNAActivationCodeDlg.btnPasteCodeClick(Sender: TObject);
begin
  PasteTextField(txtCode);
end;

procedure TDNAActivationCodeDlg.EvaluateButtonClicked
  (Sender: TObject);
begin
  //Check for OnRequestEvaluation event handler...
  if (Assigned(FOnRequestEvaluation)) then
    FOnRequestEvaluation(Self); //We have one, call it...

  //Check for request evaluation handler...
  if (Assigned(FRequestEvalHandler)) then
    FRequestEvalHandler(Self);  //We have one, call it...
end;

function TDNAActivationCodeDlg.GetActivationCode: String;
begin
  Result := TrimTextField(txtCode); //Return activation code...
end;

function TDNAActivationCodeDlg.GetEvaluateButtonVisible: Boolean;
begin
  //Return visibility of request evaluation button...
  Result := btnEvaluate.Visible;
end;

function TDNAActivationCodeDlg.GetProxyButtonVisible: Boolean;
begin
  //Return visibility of proxy settings button...
  Result := btnProxy.Visible;
end;

procedure TDNAActivationCodeDlg.InitControls;
begin
  inherited InitControls; //call inherited...

  //Set OK button caption to 'Next >'...
  btnOK.Text := rstrNext;

  txtCode.SetFocus; //set focus to activation code field...
end;

procedure TDNAActivationCodeDlg.InitFields;
begin
  inherited InitFields; //call inherited...

  //Set fields to empty string...
  ActivationCode := EmptyStr;
end;

procedure TDNAActivationCodeDlg.ProxyButtonClicked(Sender: TObject);
begin
  //Check for OnChangeProxySettings event handler...
  if (Assigned(FOnChangeProxySettings)) then
    FOnChangeProxySettings(Self); //We have one, call it...

  //Check for proxy settings handler...
  if (Assigned(FProxySettingsHandler)) then
    FProxySettingsHandler(Self);  //We have one, call it...
end;

procedure TDNAActivationCodeDlg.SetActivationCode
  (const Value: String);
begin
  txtCode.Text := Value.Trim;  //Set Activation code field...
end;

procedure TDNAActivationCodeDlg.SetEvaluateButtonVisible
  (const Value: Boolean);
begin
  //Set visibility of the request evaluation button...
  btnEvaluate.Visible := Value;

  if (Value) then
    begin
      lblInstructCap.Text := rstrACodeEvalInsCap;
      lblInstruct.Text := rstrACodeEvalInstruct;
    end
  else
    begin
      lblInstructCap.Text := rstrACodeInstructCap;
      lblInstruct.Text := rstrACodeInstruct;
    end;
end;

procedure TDNAActivationCodeDlg.SetProxyButtonVisible
  (const Value: Boolean);
begin
  //Set visibility of the proxy settings dialog...
  btnProxy.Visible := Value;
end;

function TDNAActivationCodeDlg.ValidateFields: Boolean;
var
  ACode: String;
begin
  //Check if email address is empty...
  ACode := txtCode.Text.Trim;
  if (ACode.IsEmpty) then
    begin
      //Code is blank, inform user...
      MessageDlg(rstrValCodeEmpty, TMsgDlgType.mtError,
        [TMsgDlgBtn.mbOK], 0, TMsgDlgBtn.mbOK);
      txtCode.SetFocus;  //Set focus to code...
      Exit(False);        //Validation failure...
    end;

  Result := inherited ValidateFields; //call inherited...
end;

end.
