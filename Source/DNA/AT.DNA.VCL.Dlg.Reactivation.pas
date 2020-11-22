unit AT.DNA.VCL.Dlg.Reactivation;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  AT.DNA.VCL.Dlg.Base, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Vcl.Menus, dxSkinsCore, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxControls, cxContainer,
  cxEdit, dxSkinsdxBarPainter, dxBar, cxClasses, Vcl.StdActns,
  System.Actions, Vcl.ActnList, System.ImageList, Vcl.ImgList,
  dxGDIPlusClasses, Vcl.ExtCtrls, cxLabel, cxGroupBox, Vcl.StdCtrls,
  cxButtons, dxBevel, dxTaskbarProgress, cxTextEdit, cxMaskEdit,
  cxButtonEdit, AT.SoftwareDNA.Types;

type
  TDNAReactivationDlg = class(TDNABaseDlg)
    actClearConfPwd: TAction;
    actClearCurrPwd: TAction;
    actClearNewPwd: TAction;
    actShowConfPwd: TAction;
    actShowCurrPwd: TAction;
    actShowNewPwd: TAction;
    bevContentSep: TdxBevel;
    btnForgotPwd: TcxButton;
    lblConfirmNewPwd: TcxLabel;
    lblCurrentPwd: TcxLabel;
    lblNewPassword: TcxLabel;
    txtConfirmPassword: TcxButtonEdit;
    txtCurrentPwd: TcxButtonEdit;
    txtNewPassword: TcxButtonEdit;
    procedure actClearConfPwdExecute(Sender: TObject);
    procedure actClearCurrPwdExecute(Sender: TObject);
    procedure actClearNewPwdExecute(Sender: TObject);
    procedure actShowConfPwdExecute(Sender: TObject);
    procedure actShowConfPwdUpdate(Sender: TObject);
    procedure actShowCurrPwdExecute(Sender: TObject);
    procedure actShowCurrPwdUpdate(Sender: TObject);
    procedure actShowNewPwdExecute(Sender: TObject);
    procedure actShowNewPwdUpdate(Sender: TObject);
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

uses
  System.UITypes, AT.DNA.ResourceStrings, AT.GarbageCollector;

{$R *.dfm}

procedure TDNAReactivationDlg.actClearConfPwdExecute(Sender: TObject);
begin
  EmptyTextField(txtConfirmPassword);
end;

procedure TDNAReactivationDlg.actClearCurrPwdExecute(Sender: TObject);
begin
  EmptyTextField(txtCurrentPwd);
end;

procedure TDNAReactivationDlg.actClearNewPwdExecute(Sender: TObject);
begin
  EmptyTextField(txtNewPassword);
end;

procedure TDNAReactivationDlg.actShowConfPwdExecute(Sender: TObject);
begin
  case txtConfirmPassword.Properties.EchoMode of
    eemNormal: txtConfirmPassword.Properties.EchoMode := eemPassword;
    eemPassword: txtConfirmPassword.Properties.EchoMode := eemNormal;
  end;
end;

procedure TDNAReactivationDlg.actShowConfPwdUpdate(Sender: TObject);
var
  AAct: TAction;
begin
  AAct := (Sender AS TAction);

  case txtConfirmPassword.Properties.EchoMode of
    eemNormal: SetPwdActionMode(AAct, False);
    eemPassword: SetPwdActionMode(AAct, True);
  end;
end;

procedure TDNAReactivationDlg.actShowCurrPwdExecute(Sender: TObject);
begin
  case txtCurrentPwd.Properties.EchoMode of
    eemNormal: txtCurrentPwd.Properties.EchoMode := eemPassword;
    eemPassword: txtCurrentPwd.Properties.EchoMode := eemNormal;
  end;
end;

procedure TDNAReactivationDlg.actShowCurrPwdUpdate(Sender: TObject);
var
  AAct: TAction;
begin
  AAct := (Sender AS TAction);

  case txtCurrentPwd.Properties.EchoMode of
    eemNormal: SetPwdActionMode(AAct, False);
    eemPassword: SetPwdActionMode(AAct, True);
  end;
end;

procedure TDNAReactivationDlg.actShowNewPwdExecute(Sender: TObject);
begin
  case txtNewPassword.Properties.EchoMode of
    eemNormal: txtNewPassword.Properties.EchoMode := eemPassword;
    eemPassword: txtNewPassword.Properties.EchoMode := eemNormal;
  end;end;

procedure TDNAReactivationDlg.actShowNewPwdUpdate(Sender: TObject);
var
  AAct: TAction;
begin
  AAct := (Sender AS TAction);

  case txtNewPassword.Properties.EchoMode of
    eemNormal: SetPwdActionMode(AAct, False);
    eemPassword: SetPwdActionMode(AAct, True);
  end;
end;

procedure TDNAReactivationDlg.AttachForgotPwdHandler
  (AHandler: TDNAForgotPwdHandler);
begin
  FForgotPwdHandler := AHandler;  //Set forgot password handler...
end;

procedure TDNAReactivationDlg.ForgotPwdButtonClicked(Sender: TObject);
var
  AGC: IATGarbageCollector;
begin
  tskbrDlg.Active := True;
  TATGC.Cleanup(procedure
    begin
      tskbrDlg.Active := False;
    end, AGC);

  //Check for OnForgotPassword handler...
  if (Assigned(FOnForgotPassword)) then
    FOnForgotPassword(Self);  //We have one, so call it...

  //Check for forgot password handler...
  if (Assigned(FForgotPwdHandler)) then
    FForgotPwdHandler(Self);  //We have one, so call it...
end;

function TDNAReactivationDlg.GetCurrentPassword: String;
begin
  Result := TrimTextField(txtCurrentPwd); //Get current password...
end;

function TDNAReactivationDlg.GetNewPassword: String;
begin
  Result := TrimTextField(txtNewPassword); //Get new password...
end;

procedure TDNAReactivationDlg.InitControls;
begin
  inherited InitControls; //Call inherited...

  //Change OK button caption TO Re-Activate...
  btnOK.Caption := rstrReactivate;

  ActiveControl := txtCurrentPwd; //Set focus to current password field......
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
  ACurrPwd := TrimTextField(txtCurrentPwd);
  if (ACurrPwd.IsEmpty) then
    begin
      //Current password is blank, inform user...
      MessageDlg(rstrValCPwdEmpty, TMsgDlgType.mtError,
        [TMsgDlgBtn.mbOK], 0, TMsgDlgBtn.mbOK);
      txtCurrentPwd.SetFocus; //set focus to current pwd control...
      Exit(False);            //Validation failure...
    end;

  //Check for empty new password field...
  ANewPwd := TrimTextField(txtNewPassword);
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
  AConfirmPwd := TrimTextField(txtConfirmPassword);
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
