// ******************************************************************
//
// Program Name   : $ProgramName$
// Platform(s)    : $Platforms$
// Framework      : None
//
// Filename       : AT.$ShortName$.Attribs.pas
// File Version   : 1.00
// Date Created   : $CreateDate$
// Author         : Matthew Vesperman
//
// Description:
//
// Custom attribute definitions.
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
///   $ProgramName$'s custom attribute definitions.
/// </summary>
unit AT.ShortName.Attribs;

interface

type
  /// <summary>
  ///   This attribute is used to determine if a form is a
  ///   non-closing form.
  /// </summary>
  /// <remarks>
  ///   A non-closing form can only be closed when the program's main
  ///   form is closed.
  /// </remarks>
  ATNonClosingFormAttribute = class(TCustomAttribute)
  strict private
    /// <summary>
    ///   Stores the attribute's value.
    /// </summary>
    FValue: Boolean;
  public
    /// <summary>
    ///   Initializes the attribute object.
    /// </summary>
    /// <param name="AValue">
    ///   Pass TRUE to indicate that the form is a non-closing form,
    ///   FALSE to indicate a normal form.
    /// </param>
    /// <remarks>
    ///   Passing FALSE to the constructor is considered the same as
    ///   omitting this attribute.
    /// </remarks>
    constructor Create(AValue: Boolean);
    /// <value>
    ///   This property is TRUE if the attribute indicates that the
    ///   form is a non-closing form, FALSE otherwise.
    /// </value>
    property Value: Boolean read FValue;
  end;

implementation

{ ATNonClosingFormAttribute }

constructor ATNonClosingFormAttribute.Create(AValue: Boolean);
begin
  //Save the attribute's value...
  FValue := AValue;
end;

end.
