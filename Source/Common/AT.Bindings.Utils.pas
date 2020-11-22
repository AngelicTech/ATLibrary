// ******************************************************************
//
// Program Name   : AT Library
// Platform(s)    : Android, iOS, Linux, MacOS, Windows
// Framework      : Console, FMX, VCL
//
// Filename       : AT.Bindings.Utils.pas
// Date Created   : 22-Nov-2020
// Author         : Matthew Vesperman
//
// Description:
//
// Contains LiveBindings helper routines.
//
// Revision History:
//
// v1.00   :   Initial version
//
// ******************************************************************
//
// COPYRIGHT © 2020 - PRESENT Angelic Technology
// ALL RIGHTS RESERVED WORLDWIDE
//
// ******************************************************************

/// <summary>
///   Contains LiveBindings helper routines.
/// </summary>
unit AT.Bindings.Utils;

interface

uses
  System.Classes, System.SysUtils, System.Bindings.Helper,
  System.Bindings.Expression, System.Bindings.EvalProtocol;

function BindObjects(ASource: TObject; ASrcProperty: String;
    ADestination: TObject; ADestProperty: String;
    out ABindExpr2: TBindingExpression;
    ABiDirectional: Boolean = True; ASrcExprPrefix: String = '';
    ASrcExprPostfix: String = ''; ADstExprPrefix: String = '';
    ADstExprPostfix: String = ''): TBindingExpression; overload;

function BindObjects(ASource: TObject; ASrcProperty: String;
    ADestination: TObject; ADestProperty: String;
    ABiDirectional: Boolean = True; ASrcExprPrefix: String = '';
    ASrcExprPostfix: String = ''; ADstExprPrefix: String = '';
    ADstExprPostfix: String = ''): TBindingExpression; overload;

procedure RemoveBindings(const ABindExpr1, ABindExpr2: TBindingExpression);

implementation


function BindObjects(ASource: TObject; ASrcProperty: String;
    ADestination: TObject; ADestProperty: String;
    out ABindExpr2: TBindingExpression;
    ABiDirectional: Boolean = True; ASrcExprPrefix: String = '';
    ASrcExprPostfix: String = ''; ADstExprPrefix: String = '';
    ADstExprPostfix: String = ''): TBindingExpression;
begin
  //Create first bind expression...
  Result := BindObjects(ASource, ASrcProperty, ADestination,
      ADestProperty, False, ASrcExprPrefix, ASrcExprPostfix,
      ADstExprPrefix, ADstExprPostfix);

  //Is this bidirectional???
  if (NOT ABiDirectional) then
    begin
      //No, set ABindExpr2 to nil...
      ABindExpr2 := NIL;
      //Exit method...
      Exit(Result);
    end;

  //Create opposite bind expression and return bind expression
  //object in the ABindExpr2 output parameter...
  ABindExpr2 :=  BindObjects(ADestination, ADestProperty, ASource,
      ASrcProperty, False, ASrcExprPrefix, ASrcExprPostfix,
      ADstExprPrefix, ADstExprPostfix);

end;

function BindObjects(ASource: TObject; ASrcProperty: String;
    ADestination: TObject; ADestProperty: String;
    ABiDirectional: Boolean = True; ASrcExprPrefix: String = '';
    ASrcExprPostfix: String = ''; ADstExprPrefix: String = '';
    ADstExprPostfix: String = ''): TBindingExpression;
const
  cSrcName = 'src';
  cDestName = 'dest';
var
  ASrcAssoc: TBindingAssociation;
  ASrcScope: IScope;
  ASrcExpr: String;
  ADestAssoc: TBindingAssociation;
  ADestScope: IScope;
  ADestExpr: String;
begin
  ASrcAssoc := Associate(ASource, cSrcName);
  ASrcScope := TBindings.CreateAssociationScope([ASrcAssoc]);
  ASrcExpr := Format('%s%s.%s%s',
    [ASrcExprPrefix, cSrcName, ASrcProperty, ASrcExprPostfix]);

  ADestAssoc := Associate(ADestination, cDestName);
  ADestScope := TBindings.CreateAssociationScope([ADestAssoc]);
  ADestExpr := Format('%s%s.%s%s',
    [ADstExprPrefix, cDestName, ADestProperty, ADstExprPostfix]);

  Result := TBindings.CreateManagedBinding([ASrcScope], ASrcExpr,
    [ADestScope], ADestExpr, NIL, NIL,  [coNotifyOutput, coEvaluate]);

  TBindings.Notify(ASource, ASrcProperty);

  if (ABiDirectional) then
    begin
      BindObjects(ADestination, ADestProperty, ASource, ASrcProperty,
        False, ASrcExprPrefix, ASrcExprPostfix, ADstExprPrefix,
        ADstExprPostfix);

      TBindings.Notify(ADestination, ADestProperty);
    end;

  TBindings.Notify(ASource, ASrcProperty);


end;

procedure RemoveBindings(const ABindExpr1, ABindExpr2: TBindingExpression);
begin
  if (Assigned(ABindExpr1)) then
    TBindings.RemoveBinding(ABindExpr1);

  if (Assigned(ABindExpr2)) then
    TBindings.RemoveBinding(ABindExpr2);
end;

end.
