unit AT.DNA.VCL.Dlg.ActivationCode;

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
  cxButtons, dxBevel, cxTextEdit, cxMaskEdit, cxButtonEdit,
  AT.SoftwareDNA.Types, System.Win.TaskbarCore, Vcl.Taskbar,
  dxTaskbarProgress;

type
  TDNAActivationCodeDlg = class(TDNABaseDlg)
    actClearCode: TAction;
    actPasteCode: TAction;
    btnEvaluate: TcxButton;
    btnProxy: TcxButton;
    lblCode: TcxLabel;
    txtCode: TcxButtonEdit;
    procedure actClearCodeExecute(Sender: TObject);
    procedure actPasteCodeExecute(Sender: TObject);
    procedure actPasteCodeUpdate(Sender: TObject);
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

{$R *.dfm}

uses
  System.UITypes, Vcl.Clipbrd, AT.DNA.ResourceStrings,
  AT.GarbageCollector;

procedure TDNAActivationCodeDlg.actClearCodeExecute(Sender: TObject);
begin
  EmptyTextField(txtCode);
end;

procedure TDNAActivationCodeDlg.actPasteCodeExecute(Sender: TObject);
begin
  PasteTextField(txtCode);
end;

procedure TDNAActivationCodeDlg.actPasteCodeUpdate(Sender: TObject);
var
  bEnable: Boolean;
begin
  bEnable := Clipboard.HasFormat(CF_TEXT);
  (Sender AS TAction).Enabled := bEnable;
end;

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

procedure TDNAActivationCodeDlg.EvaluateButtonClicked(Sender: TObject);
var
  AGC: IATGarbageCollector;
begin
  tskbrDlg.Active := True;
  TATGC.Cleanup(procedure
    begin
      tskbrDlg.Active := False;
    end, AGC);


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
  btnOK.Caption := rstrNext;

  ActiveControl := txtCode; //set focus to activation code field...
end;

procedure TDNAActivationCodeDlg.InitFields;
begin
  inherited InitFields; //call inherited...

  //Set fields to empty string...
  ActivationCode := EmptyStr;
end;

procedure TDNAActivationCodeDlg.ProxyButtonClicked(Sender: TObject);
var
  AGC: IATGarbageCollector;
begin
  tskbrDlg.Active := True;
  TATGC.Cleanup(procedure
    begin
      tskbrDlg.Active := False;
    end, AGC);


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
      lblInstructCap.Caption := rstrACodeEvalInsCap;
      lblInstruct.Caption := rstrACodeEvalInstruct;
    end
  else
    begin
      lblInstructCap.Caption := rstrACodeInstructCap;
      lblInstruct.Caption := rstrACodeInstruct;
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
  //TODO: Add code validation anonymous method handler.

  //Check if email address is empty...
  ACode := TrimTextField(txtCode);
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
