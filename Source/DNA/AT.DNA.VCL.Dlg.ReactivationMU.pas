unit AT.DNA.VCL.Dlg.ReactivationMU;

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
  TDNAReactivationMUDlg = class(TDNABaseDlg)
    actClearPwd: TAction;
    actShowPwd: TAction;
    btnForgotPwd: TcxButton;
    lblCurrentPwd: TcxLabel;
    txtCurrentPwd: TcxButtonEdit;
    procedure actClearPwdExecute(Sender: TObject);
    procedure actShowPwdExecute(Sender: TObject);
    procedure actShowPwdUpdate(Sender: TObject);
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

uses
  System.UITypes, AT.DNA.ResourceStrings, AT.GarbageCollector;

{$R *.dfm}

procedure TDNAReactivationMUDlg.actClearPwdExecute(Sender: TObject);
begin
  EmptyTextField(txtCurrentPwd);
end;

procedure TDNAReactivationMUDlg.actShowPwdExecute(Sender: TObject);
begin
  case txtCurrentPwd.Properties.EchoMode of
    eemNormal: txtCurrentPwd.Properties.EchoMode := eemPassword;
    eemPassword: txtCurrentPwd.Properties.EchoMode := eemNormal;
  end;
end;

procedure TDNAReactivationMUDlg.actShowPwdUpdate(Sender: TObject);
var
  AAct: TAction;
begin
  AAct := (Sender AS TAction);

  case txtCurrentPwd.Properties.EchoMode of
    eemNormal: SetPwdActionMode(AAct, False);
    eemPassword: SetPwdActionMode(AAct, True);
  end;
end;

procedure TDNAReactivationMUDlg.AttachForgotPwdHandler
  (AHandler: TDNAForgotPwdHandler);
begin
  FForgotPwdHandler := AHandler;  //Set forgot password handler...
end;

procedure TDNAReactivationMUDlg.ForgotPwdButtonClicked(Sender: TObject);
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

function TDNAReactivationMUDlg.GetPassword: String;
begin
  Result := TrimTextField(txtCurrentPwd); //Get current password...
end;

procedure TDNAReactivationMUDlg.InitControls;
begin
  inherited InitControls; //Call inherited...

  //Change OK button caption TO Re-Activate...
  btnOK.Caption := rstrReactivate;

  ActiveControl := txtCurrentPwd; //Set focus to current password field......
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
  ACurrPwd := TrimTextField(txtCurrentPwd);
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
