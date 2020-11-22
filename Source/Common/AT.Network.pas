// ******************************************************************
//
// Program Name   : Angelic Tech Common Library
// Program Version: 2017
// Platform(s)    : Android, iOS, Linux, OS X, Windows
// Framework      : None
//
// Filename       : AT.Network.pas
// File Version   : 2017.04
// Date Created   : 11-Apr-2017
// Author         : Matthew Vesperman
//
// Description:
//
// Networking routines.
//
// Revision History:
//
// v1.00   :   Initial version
//
// ******************************************************************
//
// COPYRIGHT © 2017 - PRESENT Angelic Technology
// ALL RIGHTS RESERVED WORLDWIDE
//
// ******************************************************************

/// <summary>
///   Contains network routines.
/// </summary>
unit AT.Network;

interface

uses
  System.Classes;

type
  /// <summary>
  ///   Enumeration to indicate what type of IP address you are
  ///   requesting.
  /// </summary>
  /// <seealso cref="AT.Network|LocalIPAddresses(TStrings,TATIPAddressType)">
  ///   LocalIPAddresses
  /// </seealso>
  TATIPAddressType = (
    /// <summary>
    ///   Return only IPv4 addresses.
    /// </summary>
    iptIPV4,
    /// <summary>
    ///   Return only IPv6 addresses.
    /// </summary>
    iptIPV6,
    /// <summary>
    ///   Return both IPv4 and IPv6 addresses.
    /// </summary>
    iptBoth);

/// <summary>
///   Returns a list of the local machine's IP addresses.
/// </summary>
/// <param name="AddressList">
///   A reference to a TString variable. If the variable is NIL it
///   will be initialized with a TStringList object. This will
///   receive the list of IP addresses.
/// </param>
/// <param name="IPType">
///   (Optional) The type of IP addresses to return. You can specify
///   one of iptIPV4, iptIPV6 or iptBoth. Default value is iptBoth if
///   this parameter is omitted.
/// </param>
/// <remarks>
///   The data is return as a list of ket/value pairs formatted as
///   &lt;ip_address&gt;=&lt;ip_type&gt;. where &lt;ip_type&gt; is a
///   string containing either "IPV4" or "IPV6".
/// </remarks>
/// <seealso cref="AT.Network|TATIPAddressType">
///   TATIPAddressType enumeration.
/// </seealso>
procedure LocalIPAddresses(var AddressList: TStrings; IPType: TATIPAddressType
    = iptBoth);

implementation

uses
  AT.GarbageCollector, IdGlobal, IdStack;

procedure LocalIPAddresses(var AddressList: TStrings; IPType: TATIPAddressType
    = iptBoth);
var
  AGC: IATGarbageCollector;                //Local garbage collector...
  AAddrList: TIdStackLocalAddressList;     //Local IP address list...
  AAddrTypesDesired: set of TIdIPVersion;  //Type of addresses to return...
  Cnt, Idx: Integer;                       //Temp for loop vars...
  AAddr: TIdStackLocalAddress;             //Temp IP address storage...
  AAddrType: String;                       //String var for addr type...
begin
  //Tell indy stack we want to use it...
  TIdStack.IncUsage;
  //Setup cleanup procedure...
  TATGC.Cleanup(procedure
    begin
      TIdStack.DecUsage;  //Tell indy stack we are done...
    end, AGC);

  //Check if address list var param is valid...
  if (NOT Assigned(AddressList)) then
    AddressList := TStringList.Create   //No, create TStringList...
  else
    AddressList.Clear;                  //Yes, clear it...

  //Create indy stack address list object and add it to garbage collector...
  AAddrList := TATGC.Collect(TIdStackLocalAddressList.Create, AGC);

  //Retrieve local IP address list from indy stack...
  GStack.GetLocalAddressList(AAddrList);

  //Init set indicating type of IP addresses to return...
  case IPType of
    iptIPV4: AAddrTypesDesired := [Id_IPv4];
    iptIPV6: AAddrTypesDesired := [Id_IPv6];
    iptBoth: AAddrTypesDesired := [Id_IPv4, Id_IPv6];
  end;

  //Init counter variable...
  Cnt := AAddrList.Count;

  //Process all IP addresses returned by indy stack...
  for Idx := 0 to (Cnt - 1) do
    begin
      //Get individual IP address data...
      AAddr := AAddrList.Addresses[Idx];

      //Is IP address one we need to return???
      if (AAddr.IPVersion IN AAddrTypesDesired) then
        begin
          //Yes, determine type...
          case AAddr.IPVersion of
            Id_IPv4: AAddrType := 'IPV4';
            Id_IPv6: AAddrType := 'IPV6';
          end;

          //Add IP address info to list  we want to return...
          AddressList.Values[AAddr.IPAddress] := AAddrType;
        end;
    end;
end;


end.
