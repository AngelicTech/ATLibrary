// ******************************************************************
//
// Program Name   : $ProgramName$
// Platform(s)    : $Platforms$
// Framework      : VCL
//
// Filename       : AT.$ShortName$.Vcl.Forms.Generic.MDIChild.pas/.dfm
// File Version   : 1.00
// Date Created   : $CreateDate$
// Author         : Matthew Vesperman
//
// Description:
//
// $ProgramName$'s base MDI child form class.
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
///   $ProgramName$'s base MDI child form class.
/// </summary>
unit AT.ShortName.Vcl.Forms.Generic.MDIChild;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  AT.ShortName.Vcl.Forms.Generic.Base, AT.ShortName.Intf,
  Vcl.StdCtrls;


type
  /// <summary>
  ///   Generic base MDI child form class.
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
  TfrmGenericMDIChild = class(TfrmGenericBase)
    /// <summary>
    ///   Handles the OnClose event. Frees the MDI child form when it
    ///   closes.
    /// </summary>
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  end;

var
  frmGenericMDIChild: TfrmGenericMDIChild;

implementation

{$R *.dfm}

procedure TfrmGenericMDIChild.FormClose(Sender: TObject;
    var Action: TCloseAction);
begin
  inherited;

  Action := caFree;
end;

end.




