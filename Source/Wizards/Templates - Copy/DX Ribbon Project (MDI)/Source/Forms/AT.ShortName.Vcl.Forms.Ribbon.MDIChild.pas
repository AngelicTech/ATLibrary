// ******************************************************************
//
// Program Name   : $ProgramName$
// Platform(s)    : $Platforms$
// Framework      : VCL
//
// Filename       : AT.$ShortName$.Vcl.Forms.Ribbon.MDIChild.pas/.dfm
// File Version   : 1.00
// Date Created   : $CreateDate$
// Author         : Matthew Vesperman
//
// Description:
//
// $ProgramName$'s base MDI ribbon form class.
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
///   $ProgramName$'s base MDI ribbon form class.
/// </summary>
unit AT.ShortName.Vcl.Forms.Ribbon.MDIChild;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.Forms,
  dxRibbonForm, AT.ShortName.Intf, cxClasses, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxRibbonSkins, dxSkinsCore,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light,
  dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue,
  dxSkinsdxRibbonPainter, dxRibbonCustomizationForm,
  dxSkinscxPCPainter, dxSkinsdxBarPainter, dxBar, dxRibbon;

type
  /// <summary>
  ///   Generic base MDI ribbon form class.
  /// </summary>
  /// <remarks>
  ///   <para>
  ///     Forms based on this class are able to automatically
  ///     merge/unmerge their child ribbons with the main form's
  ///     ribbon.
  ///   </para>
  ///   <para>
  ///     A descendant form class can be set to non-closing mode by
  ///     using the ATNonClosingForm attribute.
  ///   </para>
  ///   <para>
  ///     Descendant forms can implement several different
  ///     interfaces that will influence how the base code works.
  ///   </para>
  /// </remarks>
  TfrmRibbonMDIChild = class(TdxRibbonForm, IATMDIChildRibbon)
    barmgrMDIChild: TdxBarManager;
    barQAT: TdxBar;
    barTAT: TdxBar;
    ribMDIChild: TdxRibbon;
    ribtabHome: TdxRibbonTab;
    /// <summary>
    ///   Base form's OnActivate event handler.
    /// </summary>
    /// <remarks>
    ///   <para>
    ///     If the main form supports the IATMainRibbon interface
    ///     then the child will attempt to merge its ribbon into
    ///     the main form's ribbon.
    ///   </para>
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
    ///   Handles the OnClose event. Frees the MDI child form when it
    ///   closes.
    /// </summary>
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    /// <summary>
    ///   Base form's OnDeactivate event handler.
    /// </summary>
    /// <remarks>
    ///   <para>
    ///     If a descendant class implements both the
    ///     IATMDIFrameChild and IATFrameDeactivate interfaces then
    ///     this handler will call the
    ///     IATFrameDeactivate.DeactivateFrame method.
    ///   </para>
    ///   <para>
    ///     If the main form supports the IATMainRibbon interface
    ///     then the child will attempt to unmerge its ribbon from
    ///     the main form's ribbon.
    ///   </para>
    /// </remarks>
    procedure FormDeactivate(Sender: TObject);
  strict private
    /// <summary>
    ///   Sores a flag to indicate if the form is currently being
    ///   activated.
    /// </summary>
    FActivating: Boolean;
    /// <summary>
    ///   Stores the index of the currently selected main form ribbon
    ///   tab.
    /// </summary>
    FActiveRibbonTabIndex: Integer;
    /// <summary>
    ///   Sores a flag to indicate if the form is currently being
    ///   deactivated.
    /// </summary>
    FDeactivating: Boolean;
    FIsClosing: Boolean;
  strict protected
    /// <summary>
    ///   ActiveRibbonTabIndex property getter.
    /// </summary>
    function GetActiveRibbonTabIndex: Integer;
    /// <summary>
    ///   IsNonClosing property getter.
    /// </summary>
    function GetIsNonClosing: Boolean;
    /// <summary>
    ///   Ribbon property getter.
    /// </summary>
    function GetRibbon: TdxRibbon;
    /// <summary>
    ///   Merges the child ribbon into the ribbon specified by the
    ///   ARibbon parameter..
    /// </summary>
    /// <param name="ARibbon">
    ///   A reference to the ribbon to merge the child ribbon into.
    /// </param>
    procedure MergeToRibbon(ARibbon: TdxRibbon);
    /// <summary>
    ///   ActiveRibbonTabIndex property setter.
    /// </summary>
    procedure SetActiveRibbonTabIndex(Value: Integer);
    /// <summary>
    ///   Unmerges the child ribbon from the ribbon specified by the
    ///   ARibbon parameter..
    /// </summary>
    /// <param name="ARibbon">
    ///   A reference to the ribbon to unmerge the child ribbon from.
    /// </param>
    procedure UnmergeFromRibbon(ARibbon: TdxRibbon);
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
    ///   If the main form supports the IATMainRibbon interface then
    ///   this method will attempt to merge the child ribbon into the
    ///   main form's ribbon.
    /// </summary>
    procedure _MergeChildRibbonWithMainRibbon;
    procedure _NotifyMainBeginUpdate;
    procedure _NotifyMainEndUpdate;
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
    /// <summary>
    ///   If the main form supports the IATMainRibbon interface then
    ///   this method will attempt to unmerge the child ribbon from
    ///   the main form's ribbon.
    /// </summary>
    procedure _UnmergeChildRibbonFromMainRibbon;
    /// <summary>
    ///   Specifies a flag indicating if the form is activating.
    /// </summary>
    /// <value>
    ///   TRUE if the form is activating, FALSE otherwise.
    /// </value>
    property Activating: Boolean read FActivating;
    /// <summary>
    ///   Specifies a flag indicating if the form is deactivating.
    /// </summary>
    /// <value>
    ///   TRUE if the form is deactivating, FALSE otherwise.
    /// </value>
    property Deactivating: Boolean read FDeactivating;
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
    ///   Specifies the index of the currently selected main form
    ///   ribbon tab.
    /// </summary>
    property ActiveRibbonTabIndex: Integer
        read GetActiveRibbonTabIndex write SetActiveRibbonTabIndex;
    /// <summary>
    ///   Specifies if the form is a Non-Closing form. A non-closing
    ///   form will only want to close if the main form either wants
    ///   to close or is closing.
    /// </summary>
    property IsNonClosing: Boolean read GetIsNonClosing;
    /// <summary>
    ///   Returns a reference to the child form's ribbon.
    /// </summary>
    property Ribbon: TdxRibbon read GetRibbon;
  end;

var
  frmRibbonMDIChild: TfrmRibbonMDIChild;

implementation

uses
  System.Rtti, AT.GarbageCollector, AT.ShortName.DM.Actions,
  AT.ShortName.DM.Services.Application, AT.ShortName.Attribs;

{$R *.dfm}

constructor TfrmRibbonMDIChild.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  FActivating := False;

  FActiveRibbonTabIndex := 0;

  FDeactivating := False;

  Ribbon.ShowTabGroups := False;
  Ribbon.ShowTabHeaders := False;

  _CreateFrame;
  _SetFormCaption;
  _LoadFormState;
  _InitFields;
  _InitControls;
  _InitLiveBindings;
  _NotifyVM;
end;

destructor TfrmRibbonMDIChild.Destroy;
begin
  _SaveFormState;

  _DestroyFrame;

  inherited Destroy;
end;

function TfrmRibbonMDIChild.CloseQuery: Boolean;
var
  AIntf: IATMainCloseQuery;
begin
  Result := inherited CloseQuery;

  if (NOT IsNonClosing) then
    Exit;

  if (NOT AppServices.MainFormSupports(IATMainCloseQuery, AIntf)) then
    Exit;

  Result := ( (AIntf.WantsToClose OR AIntf.IsClosing) AND Result );
end;

procedure TfrmRibbonMDIChild.FormActivate(Sender: TObject);
begin
  if (FActivating) then
    Exit;

  FActivating := True;
  FDeactivating := False;

  _NotifyMainEndUpdate;

  _MergeChildRibbonWithMainRibbon;

  _ActivateFrame;

  Actions.UpdateAllActions;
end;

procedure TfrmRibbonMDIChild.FormClose(Sender: TObject; var Action:
    TCloseAction);
begin
  Action := caFree;
  FIsClosing := True;
  _NotifyMainBeginUpdate;
end;

procedure TfrmRibbonMDIChild.FormDeactivate(Sender: TObject);
begin
  if (FDeactivating) then
    Exit;

  FActivating := False;
  FDeactivating := True;

  if (FIsClosing AND (AppServices.MainForm.MDIChildCount > 1)) then
    _NotifyMainBeginUpdate;

  _DeactivateFrame;

  _UnmergeChildRibbonFromMainRibbon;
end;

function TfrmRibbonMDIChild.GetActiveRibbonTabIndex: Integer;
begin
  Result := FActiveRibbonTabIndex;
end;

function TfrmRibbonMDIChild.GetIsNonClosing: Boolean;
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

function TfrmRibbonMDIChild.GetRibbon: TdxRibbon;
begin
  Result := ribMDIChild;
end;

procedure TfrmRibbonMDIChild.MergeToRibbon(ARibbon: TdxRibbon);
var
  AIntf: IATMainRibbonMerge;
begin
  if (NOT Assigned(ARibbon)) then
    Exit;

  if (AppServices.MainFormSupports(IATMainRibbonMerge, AIntf)) then
    AIntf.BeforeRibbonMerge;

  ARibbon.Merge(Ribbon,
      [rmoCanCreateNewTab,
       rmoCanCreateNewGroup,
       rmoCanCreateQATToolbar,
       rmoCanCreateTabAreaToolbar]);

  if (Assigned(AIntf)) then
    AIntf.AfterRibbonMerge;
end;

procedure TfrmRibbonMDIChild.SetActiveRibbonTabIndex(Value: Integer);
begin
  FActiveRibbonTabIndex := Value;
end;

procedure TfrmRibbonMDIChild.UnmergeFromRibbon(ARibbon: TdxRibbon);
var
  AIntf: IATMainRibbonMerge;
begin
  if (NOT Assigned(ARibbon)) then
    Exit;

  if (AppServices.MainFormSupports(IATMainRibbonMerge, AIntf)) then
    AIntf.BeforeRibbonUnmerge;

  ARibbon.Unmerge(Ribbon);

  if (Assigned(AIntf)) then
    AIntf.AfterRibbonUnmerge;
end;

procedure TfrmRibbonMDIChild._ActivateFrame;
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

procedure TfrmRibbonMDIChild._CreateFrame;
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

procedure TfrmRibbonMDIChild._DeactivateFrame;
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

procedure TfrmRibbonMDIChild._DestroyFrame;
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

procedure TfrmRibbonMDIChild._InitControls;
var
  AIntf: IATInitControls;
begin
  if (NOT Supports(Self, IATInitControls, AIntf)) then
    Exit;

  AIntf.InitControls;
end;

procedure TfrmRibbonMDIChild._InitFields;
var
  AIntf: IATInitFields;
begin
  if (NOT Supports(Self, IATInitFields, AIntf)) then
    Exit;

  AIntf.InitFields;
end;

procedure TfrmRibbonMDIChild._InitLiveBindings;
var
  AIntf: IATLiveBindings;
begin
  if (NOT Supports(Self, IATLiveBindings, AIntf)) then
    Exit;

  AIntf.InitLiveBindings;
end;

procedure TfrmRibbonMDIChild._LoadFormState;
var
  AIntf: IATPersistentForm;
begin
  if (NOT Supports(Self, IATPersistentForm, AIntf)) then
    Exit;

  AIntf.LoadFormState;
end;

procedure TfrmRibbonMDIChild._MergeChildRibbonWithMainRibbon;
var
  AIntf: IATMainRibbon;
begin
  if (NOT AppServices.MainFormSupports(IATMainRibbon, AIntf)) then
    Exit;

  MergeToRibbon(AIntf.Ribbon);

  AIntf.ActiveRibbonTabIndex := ActiveRibbonTabIndex;
end;

procedure TfrmRibbonMDIChild._NotifyMainBeginUpdate;
var
  AIntf: IATMainUI;
begin
  if (AppServices.MainFormSupports(IATMainUI, AIntf)) then
    AIntf.BeginUpdate;
end;

procedure TfrmRibbonMDIChild._NotifyMainEndUpdate;
var
  AIntf: IATMainUI;
begin
  if (AppServices.MainFormSupports(IATMainUI, AIntf)) then
    AIntf.EndUpdate;
end;

procedure TfrmRibbonMDIChild._NotifyVM;
var
  AIntf: IATLiveBindings;
begin
  if (NOT Supports(Self, IATLiveBindings)) then
    Exit;

  AIntf.NotifyVM;
end;

procedure TfrmRibbonMDIChild._SaveFormState;
var
  AIntf: IATPersistentForm;
begin
  if (NOT Supports(Self, IATPersistentForm, AIntf)) then
    Exit;

  AIntf.SaveFormState;
end;

procedure TfrmRibbonMDIChild._SetFormCaption;
var
  AIntf: IATInitFormCaption;
begin
  if (NOT Supports(Self, IATInitFormCaption, AIntf)) then
    Exit;

  AIntf.SetFormCaption;
end;

procedure TfrmRibbonMDIChild._UnmergeChildRibbonFromMainRibbon;
var
  AQry: IATMainRibbonQuery;
  AIntf: IATMainRibbon;
begin
  if (AppServices.MainFormSupports(IATMainRibbonQuery, AQry)) then
    ActiveRibbonTabIndex := AQry.ActiveRibbonTabIndex;

  if (NOT AppServices.MainFormSupports(IATMainRibbon, AIntf)) then
    Exit;

  UnmergeFromRibbon(AIntf.Ribbon);
end;

end.
