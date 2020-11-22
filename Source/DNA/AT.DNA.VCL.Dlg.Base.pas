unit AT.DNA.VCL.Dlg.Base;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  dxBevel, Vcl.ExtCtrls, cxGraphics, cxLookAndFeels,
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
  dxSkinWhiteprint, dxSkinXmas2008Blue, Vcl.StdCtrls, cxButtons,
  cxControls, cxContainer, cxEdit, cxLabel, cxGroupBox,
  dxGDIPlusClasses, System.ImageList, Vcl.ImgList, System.Actions,
  Vcl.ActnList, Vcl.StdActns, dxSkinsdxBarPainter, dxBar, cxClasses,
  dxTaskbarProgress;

type
  TDNABaseDlg = class(TForm)
    actEditCopy: TEditCopy;
    actEditCut: TEditCut;
    actEditPaste: TEditPaste;
    actEditSelAll: TEditSelectAll;
    actEditUndo: TEditUndo;
    alstDlg: TActionList;
    barmgrDlg: TdxBarManager;
    bevFooterDivide: TdxBevel;
    btnCancel: TcxButton;
    btnEditCopy: TdxBarButton;
    btnEditCut: TdxBarButton;
    btnEditPaste: TdxBarButton;
    btnEditSelectAll: TdxBarButton;
    btnEditUndo: TdxBarButton;
    btnOK: TcxButton;
    gbxInfo: TcxGroupBox;
    gbxInstruct: TcxGroupBox;
    gpnlContents: TGridPanel;
    ilstDlg: TcxImageList;
    imgLogo: TImage;
    lblInstruct: TcxLabel;
    lblInstructCap: TcxLabel;
    pnlButtons: TPanel;
    pnlContents: TPanel;
    puDlgEdit: TdxBarPopupMenu;
    tskbrDlg: TdxTaskbarProgress;
    procedure CancelButtonClicked(Sender: TObject);
    procedure EditExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure OKButtonClicked(Sender: TObject);
  strict private
    FShiftState : TShiftState;
  strict protected
    /// <summary>
    ///   Called when the user clicks the dialog's CANCEL button.
    /// </summary>
    /// <remarks>
    ///   <para>
    ///     Default behaviour is to set the dialog's modal result
    ///     to mrCancel.
    ///   </para>
    ///   <para>
    ///     This method may be overridden in descendant classes to
    ///     allow for custom cancel behaviour.
    ///   </para>
    /// </remarks>
    procedure CancelClicked; virtual;
    procedure EmptyTextField(AField: TObject); virtual;
    function GetHidePwdImg: Integer; virtual;
    function GetShowPwdImg: Integer; virtual;
    /// <summary>
    ///   Called by the create constructor to initialize control
    ///   properties.
    /// </summary>
    /// <remarks>
    ///   This method should be overridden in descendant classes to
    ///   properly initialize control properties.
    /// </remarks>
    procedure InitControls; virtual;
    /// <summary>
    ///   Called by the create constructor to initialize fields and
    ///   properties.
    /// </summary>
    /// <remarks>
    ///   This method should be overridden in descendant classes to
    ///   properly initialize class fields and properties.
    /// </remarks>
    procedure InitFields; virtual;
    function IsPasswordValid(Value: String; MaxLen: Integer = 16): Boolean; virtual;
    /// <summary>
    ///   Called when the user clicks the dialog's OK button.
    /// </summary>
    /// <remarks>
    ///   <para>
    ///     Default behaviour is to check for valid field entries
    ///     by calling ValidateFields.
    ///   </para>
    ///   <para>
    ///     If ValidateFields returns TRUE then this method calls
    ///     the UpdateProperties method and sets the dialog's modal
    ///     result to mrOK
    ///   </para>
    /// </remarks>
    /// <seealso cref="ValidateFields" />
    /// <seealso cref="UpdateProperties" />
    procedure OKClicked; virtual;
    procedure PasteTextField(AField: TObject); virtual;
    procedure SetPwdActionMode(AAction: TAction; AShow: Boolean; AShowText: String
        = ''; AHideText: String = ''); virtual;
    function TrimTextField(AField: TObject): String; virtual;
    /// <summary>
    ///   Called by the OKClicked method after all class fields have
    ///   been validated by the ValidateFields method.
    /// </summary>
    /// <remarks>
    ///   This method should be overridden in descendant classes that
    ///   need to update class properties when the OK button is
    ///   clicked.
    /// </remarks>
    /// <seealso cref="OKClicked" />
    /// <seealso cref="ValidateFields" />
    procedure UpdateProperties;
    /// <summary>
    ///   Called by the OKClicked method to determine if all fields
    ///   are valid.
    /// </summary>
    /// <returns>
    ///   Base class always returns TRUE. Descendant classes should
    ///   return TRUE when fields are valid, otherwise they should
    ///   return FALSE.
    /// </returns>
    /// <remarks>
    ///   <para>
    ///     This method should be overridden in descendant classes
    ///     that need check for valid field entries when the OK
    ///     button is clicked.
    ///   </para>
    ///   <para>
    ///     NOTE: Base class always returns TRUE.
    ///   </para>
    /// </remarks>
    /// <seealso cref="OKClicked" />
    function ValidateFields: Boolean; virtual;
    property HidePwdImg: Integer read GetHidePwdImg;
    property ShowPwdImg: Integer read GetShowPwdImg;
  public
    constructor Create(AOwner: TComponent); override;
  end;

var
  DNABaseDlg: TDNABaseDlg;

implementation

{$R *.dfm}

uses
  System.Rtti, AT.VCL.Forms, System.RegularExpressions, AT.Rtti,
  AT.DNA.ResourceStrings, AT.GarbageCollector, Vcl.Clipbrd;



constructor TDNABaseDlg.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  Self.Visible := False;


  InitControls;   //Initialize all control properties...
  InitFields;     //Initialize all fields...
end;

procedure TDNABaseDlg.CancelButtonClicked(Sender: TObject);
begin
  CancelClicked;  //Call CancelClicked method...
end;

procedure TDNABaseDlg.CancelClicked;
begin
  ModalResult := mrCancel;  //Set modal result...
end;

procedure TDNABaseDlg.EditExit(Sender: TObject);
var
  AStr: String;
  AValue: TValue;
begin
  if (NOT Assigned(Sender)) then
    Exit;

  if (NOT GetPropertyValue(Sender, 'Text', AValue)) then
    Exit;

  AStr := AValue.AsString.Trim;

  AValue := AStr;

  SetPropertyValue(Sender, 'Text', AValue);
end;

procedure TDNABaseDlg.EmptyTextField(AField: TObject);
var
  AValue: TValue;
begin
  if (NOT Assigned(AField)) then
    Exit;

  if (HasMethod(AField, 'Clear')) then
    begin
      ExecuteMethod(AField, 'Clear', [], AValue)
    end
  else
    begin
      if (GetPropertyValue(AField, 'Text', AValue)) then
        begin
          AValue := EmptyStr;

          SetPropertyValue(AField, 'Text', AValue);
        end;
    end;
end;

procedure TDNABaseDlg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //Make sure form is hidden when closed...
  //Owner is responsible for freeing memory...

  Action := caHide;
end;

procedure TDNABaseDlg.FormKeyDown(Sender: TObject; var Key: Word; Shift:
    TShiftState);
begin
  FShiftState := Shift;
end;

procedure TDNABaseDlg.FormKeyPress(Sender: TObject; var Key: Char);
begin
  ProcessFormEnterKeyPress(Self, Key, FShiftState);
end;

procedure TDNABaseDlg.FormKeyUp(Sender: TObject; var Key: Word; Shift:
    TShiftState);
begin
  FShiftState := [];
end;

function TDNABaseDlg.GetHidePwdImg: Integer;
begin
  Result := 4;
end;

function TDNABaseDlg.GetShowPwdImg: Integer;
begin
  Result := 1;
end;

procedure TDNABaseDlg.InitControls;
begin
  // Do nothing in the base implementation...
end;

procedure TDNABaseDlg.InitFields;
begin
  // Do nothing in the base implementation...
end;

function TDNABaseDlg.IsPasswordValid(Value: String;
  MaxLen: Integer): Boolean;
const
  cRegEx = '^([A-Za-z0-9\-@]{1,16})$';
begin
  if (Value.IsEmpty) then
    Exit(False);

  if (Value.Length > MaxLen) then
    Exit(False);

  Result := TRegEx.IsMatch(Value, cRegEx);
end;

procedure TDNABaseDlg.OKButtonClicked(Sender: TObject);
begin
  OKClicked;    //Call OKClicked method...
end;

procedure TDNABaseDlg.OKClicked;
var
  AGC: IATGarbageCollector;
begin
  tskbrDlg.Active := True;
  TATGC.Cleanup(procedure
    begin
      tskbrDlg.Active := False;
    end, AGC);

  //Check if fields are valid...
  if (ValidateFields) then
    begin
      //Fields are valid...

      //Make sure properties are updated...
      UpdateProperties;

      //Set modal result...
      ModalResult := mrOk;
    end;
end;

procedure TDNABaseDlg.PasteTextField(AField: TObject);
var
  AValue: TValue;
begin
  if (NOT Clipboard.HasFormat(CF_TEXT)) then
    Exit;

  if (NOT Assigned(AField)) then
    Exit;

  EmptyTextField(AField);

  if (HasMethod(AField, 'PasteFromClipboard')) then
    begin
      ExecuteMethod(AField, 'PasteFromClipboard', [], AValue)
    end
  else
    begin

      if (GetPropertyValue(AField, 'Text', AValue)) then
        begin
          AValue :=  Clipboard.AsText;

          SetPropertyValue(AField, 'Text', AValue);
        end;
    end;
end;

procedure TDNABaseDlg.SetPwdActionMode(AAction: TAction; AShow: Boolean;
    AShowText: String = ''; AHideText: String = '');
var
  AStr: String;
begin
  if (NOT Assigned(AAction)) then
    Exit;

  if (AShow) then
    begin
      if (AShowText.IsEmpty) then
        AStr := rstrBtnShowPassword
      else
        AStr := AShowText;

      AAction.Caption := AStr;
      AAction.Hint := AStr;
      AAction.ImageIndex := ShowPwdImg;
    end
  else
    begin
      if (AHideText.IsEmpty) then
        AStr := rstrBtnHidePassword
      else
        AStr := AHideText;

      AAction.Caption := AStr;
      AAction.Hint := AStr;
      AAction.ImageIndex := HidePwdImg;
    end;
end;

function TDNABaseDlg.TrimTextField(AField: TObject): String;
var
  AValue: TValue;
begin
  if (NOT Assigned(AField)) then
    Exit(EmptyStr);

  if (NOT GetPropertyValue(AField, 'Text', AValue)) then
    Exit(EmptyStr);

  Result := AValue.AsString.Trim;
end;

procedure TDNABaseDlg.UpdateProperties;
begin
  // Do nothing in the base implementation...
end;

function TDNABaseDlg.ValidateFields: Boolean;
begin
  Result := True;   //Default is to return TRUE....
end;

end.
