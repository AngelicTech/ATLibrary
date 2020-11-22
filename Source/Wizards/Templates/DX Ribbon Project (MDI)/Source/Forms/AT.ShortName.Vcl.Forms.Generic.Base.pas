// ******************************************************************
//
// Program Name   : $ProgramName$
// Platform(s)    : $Platforms$
// Framework      : VCL
//
// Filename       : AT.$ShortName$.Vcl.Forms.Generic.Base.pas/.dfm
// File Version   : 1.00
// Date Created   : $CreateDate$
// Author         : Matthew Vesperman
//
// Description:
//
// $ProgramName$'s base form class.
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
///   $ProgramName$'s base form class.
/// </summary>
unit AT.ShortName.Vcl.Forms.Generic.Base;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  AT.ShortName.Intf, AT.ShortName.DM.Actions;

type
  /// <summary>
  ///   Generic base form class.
  /// </summary>
  /// <remarks>
  ///   <para>
  ///     A descendant form class can be set to non-closing mode by
  ///     using the ATNonClosingForm attribute.
  ///   </para>
  ///   <para>
  ///     Descendant forms can implement several different
  ///     interfaces that will influence how the base code works.
  ///   </para>
  /// </remarks>
  TfrmGenericBase = class(TForm)
    /// <summary>
    ///   Base form's OnActivate event handler.
    /// </summary>
    /// <remarks>
    ///   <para>
    ///     If a descendant class implements both the
    ///     IATMDIFrameChild and IATFrameActivate interfaces then
    ///     this handler will call the
    ///     IATFrameActivate.ActivateFrame method.
    ///   </para>
    ///   <para>
    ///     This event handler informs the global Actions object to
    ///     update all of its actions.
    ///   </para>
    /// </remarks>
    procedure FormActivate(Sender: TObject);
    /// <summary>
    ///   Base form's OnDeactivate event handler.
    /// </summary>
    /// <remarks>
    ///   If a descendant class implements both the IATMDIFrameChild
    ///   and IATFrameDeactivate interfaces then this handler will
    ///   call the IATFrameDeactivate.DeactivateFrame method.
    /// </remarks>
    procedure FormDeactivate(Sender: TObject);
  strict private
    /// <summary>
    ///   If a descendant class implements both the IATMDIFrameChild
    ///   and IATFrameActivate interfaces then this method will call
    ///   the IATFrameActivate.ActivateFrame method.
    /// </summary>
    procedure _ActivateFrame;
    /// <summary>
    ///   Allows descendant classes to create and optionally
    ///   initialize frames.
    /// </summary>
    /// <remarks>
    ///   <para>
    ///     If a descendant class implements the IATMDIFrameChild
    ///     interface then this will call the
    ///     IATMDIFrameChild.CreateFrame method.
    ///   </para>
    ///   <para>
    ///     If the descendant class also implements the
    ///     IATFrameInitialize interface then this will also call
    ///     the IATFrameInitialize.InitializeFrame method.
    ///   </para>
    /// </remarks>
    procedure _CreateFrame;
    /// <summary>
    ///   If a descendant class implements both the IATMDIFrameChild
    ///   and IATFrameDeactivate interfaces then this method will
    ///   call the IATFrameDeactivate.DeactivateFrame method.
    /// </summary>
    procedure _DeactivateFrame;
    /// <summary>
    ///   Allows descendant classes to destroy (optionally
    ///   finalizing) frames.
    /// </summary>
    /// <remarks>
    ///   <para>
    ///     If a descendant class implements the IATMDIFrameChild
    ///     interface then this will call the
    ///     IATMDIFrameChild.DestroyFrame method.
    ///   </para>
    ///   <para>
    ///     If the descendant class also implements the
    ///     IATFrameFinalize interface then this will also call the
    ///     IATFrameFinalize.FinalizeFrame method before calling
    ///     the IATMDIFrameChild.DestroyFrame method.
    ///   </para>
    /// </remarks>
    procedure _DestroyFrame;
    /// <summary>
    ///   Allows descendant classes to initialize controls at
    ///   instance creation.
    /// </summary>
    /// <remarks>
    ///   If a descendant class implements the IATInitControls
    ///   interface then this method will call the
    ///   IATInitControls.InitControls method.
    /// </remarks>
    procedure _InitControls;
    /// <summary>
    ///   Allows descendant classes to initialize class fields at
    ///   instance creation.
    /// </summary>
    /// <remarks>
    ///   If a descendant class implements the IATInitFields
    ///   interface then this method will call the
    ///   IATInitFields.InitFields method.
    /// </remarks>
    procedure _InitFields;
    /// <summary>
    ///   Allows descendant classes to initialize LiveBindings at
    ///   instance creation.
    /// </summary>
    /// <remarks>
    ///   If a descendant class implements the IATInitLiveBindings
    ///   interface then this method will call the
    ///   IATInitLiveBindings.InitLiveBindings method.
    /// </remarks>
    procedure _InitLiveBindings;
    /// <summary>
    ///   Allows descendant classes to load form state from config
    ///   storage at instance creation.
    /// </summary>
    /// <remarks>
    ///   If a descendant class implements the IATPersistentForm
    ///   interface then this method will call the
    ///   IATPersistentForm.LoadFormState method.
    /// </remarks>
    procedure _LoadFormState;
    /// <summary>
    ///   Allows descendant classes to notify the LiveBindings system
    ///   about property changes.
    /// </summary>
    /// <remarks>
    ///   If a descendant class implements the IATLiveBindings
    ///   interface then this method will call the
    ///   IATLiveBindings.NotifyVM method.
    /// </remarks>
    procedure _NotifyVM;
    /// <summary>
    ///   Allows descendant classes to save form state to config
    ///   storage at instance destruction.
    /// </summary>
    /// <remarks>
    ///   If a descendant class implements the IATPersistentForm
    ///   interface then this method will call the
    ///   IATPersistentForm.SaveFormState method.
    /// </remarks>
    procedure _SaveFormState;
    /// <summary>
    ///   Allows descendant classes to programmatically change the
    ///   form caption at instance creation.
    /// </summary>
    /// <remarks>
    ///   If a descendant class implements the IATInitFormCaption
    ///   interface then this method will call the
    ///   IATInitFormCaption.SetFormCaption method.
    /// </remarks>
    procedure _SetFormCaption;
  strict protected
    /// <summary>
    ///   IsNonClosing property getter.
    /// </summary>
    function GetIsNonClosing: Boolean;
  public
    /// <summary>
    ///   Creates and initializes an instance.
    /// </summary>
    /// <remarks>
    ///   The constructor will call the following methods in the
    ///   order shown:
    ///   <list type="bullet">
    ///     <item>
    ///       _CreateFrame
    ///     </item>
    ///     <item>
    ///       _SetFormCaption
    ///     </item>
    ///     <item>
    ///       _LoadFormState
    ///     </item>
    ///     <item>
    ///       _InitFields
    ///     </item>
    ///     <item>
    ///       _InitControls
    ///     </item>
    ///     <item>
    ///       _InitLiveBindings
    ///     </item>
    ///     <item>
    ///       _NotifyVM
    ///     </item>
    ///   </list>
    ///   Descendant forms must implement the interfaces required by
    ///   these methods if the desired functionality is needed. <br />
    ///   Any interfaces that are not defined will cause the related
    ///   method to return without doing anything.
    /// </remarks>
    constructor Create(AOwner: TComponent); override;
    /// <summary>
    ///   Frees the resources allocated with an instance.
    /// </summary>
    /// <remarks>
    ///   The destructor will call the following methods in the order
    ///   shown:
    ///   <list type="bullet">
    ///     <item>
    ///       _SaveFormState
    ///     </item>
    ///     <item>
    ///       _DestroyFrame
    ///     </item>
    ///   </list>
    ///   Descendant forms must implement the interfaces required by
    ///   these methods if the desired functionality is needed. <br />
    ///   Any interfaces that are not defined will cause the related
    ///   method to return without doing anything.
    /// </remarks>
    destructor Destroy; override;
    /// <summary>
    ///   CloseQuery is called automatically when an attempt is made
    ///   to close the form.
    /// </summary>
    /// <remarks>
    ///   <para>
    ///     This method calls the inherited method first to see if
    ///     it can close.
    ///   </para>
    ///   <para>
    ///     If the inherited method indicates that the form can
    ///     close and a descendant has the ATNonClosingForm
    ///     attribute then the main form is queried to see if it
    ///     implements the IATMainCloseQuery interface. If the main
    ///     form implements the ATNonClosingForm interface then the
    ///     main form is queried to see if it either wants to close
    ///     or is closing. The result is then modified to indicate
    ///     if the form can close and either the main form wants to
    ///     close or it is closing. <br />
    ///   </para>
    /// </remarks>
    function CloseQuery: Boolean; override;
    /// <summary>
    ///   Specifies if the form is a Non-Closing form. A non-closing
    ///   form will only want to close if the main form either wants
    ///   to close or is closing.
    /// </summary>
    property IsNonClosing: Boolean read GetIsNonClosing;
  end;

var
  frmGenericBase: TfrmGenericBase;

implementation

{$R *.dfm}

uses
  AT.GarbageCollector, AT.ShortName.DM.Services.Application,
  System.Rtti, AT.ShortName.Attribs;

constructor TfrmGenericBase.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  _CreateFrame;
  _SetFormCaption;
  _LoadFormState;
  _InitFields;
  _InitControls;
  _InitLiveBindings;
  _NotifyVM;
end;

destructor TfrmGenericBase.Destroy;
begin
  _SaveFormState;

  _DestroyFrame;

  inherited Destroy;
end;

function TfrmGenericBase.CloseQuery: Boolean;
var
  AIntf: IATMainCloseQuery;
begin
  Result := inherited CloseQuery;

  if (NOT Result) then
    Exit(Result);

  if (NOT IsNonClosing) then
    Exit(Result);

  if (NOT AppServices.MainFormSupports(IATMainCloseQuery, AIntf)) then
    Exit(Result);

  Result := ( (AIntf.WantsToClose OR AIntf.IsClosing) AND Result );
end;

procedure TfrmGenericBase.FormActivate(Sender: TObject);
begin
  _ActivateFrame;

  Actions.UpdateAllActions;
end;

procedure TfrmGenericBase.FormDeactivate(Sender: TObject);
begin
  _DeactivateFrame;
end;

function TfrmGenericBase.GetIsNonClosing: Boolean;
var
  AGC: IATGarbageCollector;
  AContext: TRttiContext;
  AType: TRttiType;
  AAttr: TCustomAttribute;
  ANCAttr: ATNonClosingFormAttribute;
begin
  AContext := TRttiContext.Create;

  TATGC.Cleanup(procedure
    begin
      AContext.Free;
    end, AGC);

  AType := AContext.GetType(Self.ClassType);

  Result := False;
  ANCAttr := NIL;

  for AAttr in AType.GetAttributes do
    begin
      Result := (AAttr IS ATNonClosingFormAttribute);

      if (Result) then
        begin
          ANCAttr := (AAttr AS ATNonClosingFormAttribute);
          Break;
        end;
    end;

  if ( Result AND (Assigned(ANCAttr)) ) then
    Result := ANCAttr.Value;
end;

procedure TfrmGenericBase._ActivateFrame;
var
  AFIntf: IATMDIFrameChild;
  AAIntf: IATFrameActivate;
begin
  if (NOT Supports(Self, IATMDIFrameChild, AFIntf)) then
    Exit;

  if (NOT Supports(AFIntf.Frame, IATFrameActivate, AAIntf)) then
    Exit;

  AAIntf.ActivateFrame;
end;

procedure TfrmGenericBase._CreateFrame;
var
  AFIntf: IATMDIFrameChild;
  AIIntf: IATFrameInitialize;
begin
  if (NOT Supports(Self, IATMDIFrameChild, AFIntf)) then
    Exit;

  AFIntf.CreateFrame;

  if (NOT Supports(AFIntf.Frame, IATFrameInitialize, AIIntf)) then
    Exit;

  AIIntf.InitializeFrame;
end;

procedure TfrmGenericBase._DeactivateFrame;
var
  AFIntf: IATMDIFrameChild;
  ADIntf: IATFrameDeactivate;
begin
  if (NOT Supports(Self, IATMDIFrameChild, AFIntf)) then
    Exit;

  if (NOT Supports(AFIntf.Frame, IATFrameDeactivate, ADIntf)) then
    Exit;

  ADIntf.DeactivateFrame;
end;

procedure TfrmGenericBase._DestroyFrame;
var
  AFraIntf: IATMDIFrameChild;
  AFinIntf: IATFrameFinalize;
begin
  if (NOT Supports(Self, IATMDIFrameChild, AFraIntf)) then
    Exit;

  if (Supports(AFraIntf.Frame, IATFrameFinalize, AFinIntf)) then
    AFinIntf.FinalizeFrame;

  AFraIntf.DestroyFrame;
end;

procedure TfrmGenericBase._InitControls;
var
  AIntf: IATInitControls;
begin
  if (NOT Supports(Self, IATInitControls)) then
    Exit;

  AIntf.InitControls;
end;

procedure TfrmGenericBase._InitFields;
var
  AIntf: IATInitFields;
begin
  if (NOT Supports(Self, IATInitFields)) then
    Exit;

  AIntf.InitFields;
end;

procedure TfrmGenericBase._InitLiveBindings;
var
  AIntf: IATLiveBindings;
begin
  if (NOT Supports(Self, IATLiveBindings)) then
    Exit;

  AIntf.InitLiveBindings;
end;

procedure TfrmGenericBase._LoadFormState;
var
  AIntf: IATPersistentForm;
begin
  if (NOT Supports(Self, IATPersistentForm)) then
    Exit;

  AIntf.LoadFormState;
end;

procedure TfrmGenericBase._NotifyVM;
var
  AIntf: IATLiveBindings;
begin
  if (NOT Supports(Self, IATLiveBindings)) then
    Exit;

  AIntf.NotifyVM;
end;

procedure TfrmGenericBase._SaveFormState;
var
  AIntf: IATPersistentForm;
begin
  if (NOT Supports(Self, IATPersistentForm)) then
    Exit;

  AIntf.SaveFormState;
end;

procedure TfrmGenericBase._SetFormCaption;
var
  AIntf: IATInitFormCaption;
begin
  if (NOT Supports(Self, IATInitFormCaption)) then
    Exit;

  AIntf.SetFormCaption;
end;

end.
