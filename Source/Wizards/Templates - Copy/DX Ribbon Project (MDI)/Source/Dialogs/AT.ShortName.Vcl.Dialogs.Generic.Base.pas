// ******************************************************************
//
// Program Name   : $ProgramName$
// Platform(s)    : $Platforms$
// Framework      : VCL
//
// Filename       : AT.$ShortName$.Vcl.Dialogs.Generic.Base.pas/.dfm
// File Version   : 1.00
// Date Created   : $CreateDate$
// Author         : Matthew Vesperman
//
// Description:
//
// $ProgramName$'s base generic dialog box class.
//
// Revision History:
//
// v1.00   :   Initial version
//
// ******************************************************************
//
// COPYRIGHT © $Year$ - PRESENT Angelic Technology
// ALL RIGHTS RESERVED WORLDWIDE
//
// ******************************************************************

/// <summary>
///   $ProgramName$'s base generic dialog box class.
/// </summary>
unit AT.ShortName.Vcl.Dialogs.Generic.Base;

interface

uses
  Winapi.Messages, System.SysUtils, Vcl.Controls, Vcl.Forms,
  System.Classes, AT.ShortName.Vcl.Forms.Generic.Base, dxSkinsCore,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary,
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
  dxSkinWhiteprint, dxSkinXmas2008Blue, dxSkinscxPCPainter,
  dxBarBuiltInMenu, cxLookAndFeels, cxLookAndFeelPainters, cxPC,
  dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, cxGraphics, cxControls, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.WinXCtrls;

type
  /// <summary>
  ///   Generic dialog box base class.
  /// </summary>
  TdlgGenericBase = class(TfrmGenericBase)
    btnCancel: TButton;
    btnOk: TButton;
    pcDialog: TcxPageControl;
    pnlDlg: TRelativePanel;
    pnlDlgFooter: TPanel;
    tshtHome: TcxTabSheet;
    /// <summary>
    ///   Cancel button's OnClick event handler.
    /// </summary>
    procedure btnCancelClick(Sender: TObject);
    /// <summary>
    ///   Ok button's OnClick event handler.
    /// </summary>
    procedure btnOkClick(Sender: TObject);
    /// <summary>
    ///   Form's OnClose event handler.
    /// </summary>
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    /// <summary>
    ///   Form's OnCreate event handler.
    /// </summary>
    /// <remarks>
    ///   If a descendant form implements the IATDialogCaption
    ///   interface the dialog's caption is set to the result of a
    ///   call to the interface's DialogCaption method, otherwise it
    ///   is set to the application's title.
    /// </remarks>
    procedure FormCreate(Sender: TObject);
    /// <summary>
    ///   Form's OnKeyPress event handler.
    /// </summary>
    /// <remarks>
    ///   <para>
    ///     If the user presses the ENTER key, focus is moved to
    ///     the next control in the tab order.
    ///   </para>
    ///   <para>
    ///     If the user presses the ESC key the cancel button's
    ///     Click method is called.
    ///   </para>
    /// </remarks>
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  strict protected
    /// <summary>
    ///   Implements the logic for the dialog's Cancel button.
    /// </summary>
    /// <remarks>
    ///   If a descendant form implements the IATDialog interface the
    ///   interface's ExecuteCancel method is called, otherwise the
    ///   dialog's ModalResult is set to mrCancel.
    /// </remarks>
    procedure _CancelClicked; virtual;
    /// <summary>
    ///   Implements the logic for the dialog's Ok button.
    /// </summary>
    /// <remarks>
    ///   <para>
    ///     If a descendant form implements the IATDialogValidate
    ///     interface the interface's ValidateFields method is
    ///     called to determine if the dialog can be closed,
    ///     otherwise the dialog assumes it can close.
    ///   </para>
    ///   <para>
    ///     If a descendant form implements the IATDialog interface
    ///     the interface's UpdateProperties method is called
    ///     followed by the ExecuteOk method, otherwise the
    ///     dialog's ModalResult is set to mrOk.
    ///   </para>
    /// </remarks>
    procedure _OkClicked; virtual;
  end;

var
  dlgGenericBase: TdlgGenericBase;

implementation

uses
  AT.ShortName.Intf;

{$R *.dfm}

procedure TdlgGenericBase.btnCancelClick(Sender: TObject);
begin
  _CancelClicked;
end;

procedure TdlgGenericBase.btnOkClick(Sender: TObject);
begin
  _OkClicked;
end;

procedure TdlgGenericBase.FormClose(Sender: TObject;
    var Action: TCloseAction);
begin
  Action := caHide;
end;

procedure TdlgGenericBase.FormCreate(Sender: TObject);
var
  AIntf: IATDialogCaption;
begin
  if (Supports(Self, IATDialogCaption, AIntf)) then
    Caption := AIntf.DialogCaption
  else
    Caption := Application.Title;
end;

procedure TdlgGenericBase.FormKeyPress(Sender: TObject;
    var Key: Char);
begin
  case Key of
    #13:
      begin
        Perform(WM_NEXTDLGCTL, 0, 0);
        Key := #0;
      end;
    #27:
      begin
        btnCancel.Click;
        Key := #0;
      end;
  end;
end;

procedure TdlgGenericBase._CancelClicked;
var
  AIntf: IATDialog;
begin
  if (Supports(Self, IATDialog, AIntf)) then
    AIntf.ExecuteCancel
  else
    ModalResult := mrCancel;
end;

procedure TdlgGenericBase._OkClicked;
var
  AValIntf: IATDialogValidate;
  bContinue: Boolean;
  AIntf: IATDialog;
begin
  if (Supports(Self, IATDialogValidate, AValIntf)) then
    bContinue := AValIntf.ValidateFields
  else
    bContinue := True;

  if (bContinue) then
    begin
      if (Supports(Self, IATDialog, AIntf)) then
        begin
          AIntf.UpdateProperties;
          AIntf.ExecuteOk;
        end
      else
        ModalResult := mrOk;
    end;
end;

end.
