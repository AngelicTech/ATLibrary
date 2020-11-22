unit AT.DNA.VCL.Dlg.Deactivate;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
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
  cxButtons, dxBevel, cxTextEdit, cxMaskEdit, cxButtonEdit,
  dxTaskbarProgress;

type
  TDNADeactivateDlg = class(TDNABaseDlg)
    actClearPwd: TAction;
    actPwdVisible: TAction;
    lblPassword: TcxLabel;
    txtPassword: TcxButtonEdit;
    procedure actClearPwdExecute(Sender: TObject);
    procedure actPwdVisibleExecute(Sender: TObject);
    procedure actPwdVisibleUpdate(Sender: TObject);
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

{$R *.dfm}

uses
  System.UITypes, AT.XPlatform.Internet, AT.SoftwareDNA.Windows,
  AT.SoftwareDNA.Types, AT.DNA.ResourceStrings;

procedure TDNADeactivateDlg.actClearPwdExecute(Sender: TObject);
begin
  EmptyTextField(txtPassword);
end;

procedure TDNADeactivateDlg.actPwdVisibleExecute(Sender: TObject);
begin
  case txtPassword.Properties.EchoMode of
    eemNormal: txtPassword.Properties.EchoMode := eemPassword;
    eemPassword: txtPassword.Properties.EchoMode := eemNormal;
  end;
end;

procedure TDNADeactivateDlg.actPwdVisibleUpdate(Sender: TObject);
var
  AAct: TAction;
begin
  AAct := (Sender AS TAction);

  case txtPassword.Properties.EchoMode of
    eemNormal: SetPwdActionMode(AAct, False);
    eemPassword: SetPwdActionMode(AAct, True);
  end;
end;

function TDNADeactivateDlg.GetPassword: String;
begin
  Result := TrimTextField(txtPassword); //Return the password field...
end;

procedure TDNADeactivateDlg.InitControls;
begin
  inherited InitControls; //call inherited...

  //Set OK button caption to 'Deactivate'...
  btnOK.Caption := rstrDeactivate;

  ActiveControl := txtPassword; //Set focus to the password field...
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
  APwd := TrimTextField(txtPassword);
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
