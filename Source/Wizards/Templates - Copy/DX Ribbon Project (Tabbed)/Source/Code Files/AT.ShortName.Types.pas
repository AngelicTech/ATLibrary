// ******************************************************************
//
// Program Name   : $ProgramName$
// Platform(s)    : $Platforms$
// Framework      : VCL
//
// Filename       : AT.$ShortName$.Types.pas
// File Version   : 1.00
// Date Created   : $CreateDate$
// Author         : Matthew Vesperman
//
// Description:
//
// Miscellaneous type definitions.
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
///   Miscellaneous type definitions.
/// </summary>
unit AT.ShortName.Types;

interface

type
  /// <summary>
  ///   Represents the current view mode for a ribbon control.
  /// </summary>
  TATRibbonMode = (
    /// <summary>
    ///   Ribbon is in auto-hide mode.
    /// </summary>
    rmAutoHide,
    /// <summary>
    ///   Ribbon will only show tabs. To show groups/commands you
    ///   must click on a tab.
    /// </summary>
    rmTabsOnly,
    /// <summary>
    ///   Ribbon will show both tabs and groups/commands.
    /// </summary>
    rmTabsAndCmds);

  /// <summary>
  ///   A generic function definition to allow updating actions based
  ///   on an interface.
  /// </summary>
  /// <typeparam name="T">
  ///   The interface type used in the generic function.
  /// </typeparam>
  /// <remarks>
  ///   <para>
  ///     Used in the following function:
  ///   </para>
  ///   <para>
  ///     procedure TdmActions._UpdateIntfAction&lt;TCapIntf,
  ///     TQryIntf&gt;(Sender: TObject; <br />Target: TObject;
  ///     AVisibleIID: TGUID; AVisibleFunc: <br />
  ///     TATUpdateIntfFunc&lt;TCapIntf&gt;; AEnableIID: TGUID;
  ///     AEnableFunc: <br />TATUpdateIntfFunc&lt;TQryIntf&gt;); <br />
  ///   </para>
  /// </remarks>
  /// <example>
  ///   _UpdateIntfAction&lt;IATClipboardCaps, IATClipboardQuery&gt;(
  ///   <br />Sender, <br />AppServices.ActiveChild, <br />
  ///   IATClipboardCaps, <br />function (AIntf: IATClipboardCaps):
  ///   Boolean <br />begin <br />Result := AIntf.HasCopy; <br />end,
  ///   <br />IATClipboardQuery, <br />function (AIntf:
  ///   IATClipboardQuery): Boolean <br />begin <br />Result :=
  ///   AIntf.CanCopy; <br />end);
  /// </example>
  TATUpdateIntfFunc<T> = reference to function(AIntf: T): Boolean;

implementation

end.
