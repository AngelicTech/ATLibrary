//****************************************************************************
//
//  Program Name   : - AT Library -
//  Program Version: 1.00
//  Filenames      : AT.Math.BitOps.pas
//  File Version   : 1.00
//  Date Created   : 28-JAN-2014
//  Author         : Matthew S. Vesperman
//
//  Description:
//
//  Angelic Tech bit operations... (Migrated from SSMath.pas)
//
//  Revision History:
//
//    v1.00   :   Initial version for Delphi XE5.
//
//****************************************************************************
//
//  COPYRIGHT © 2013-Present Angelic Technology
//  ALL RIGHTS RESERVED WORLDWIDE
//
//****************************************************************************


unit AT.Math.BitOps;

interface

const
  //Byte bits...
  ///	<summary>
  ///	  Constant value used to specify the 1st bit position in a value.
  ///	</summary>
  ///	<value>
  ///	  1
  ///	</value>
  ATBitPos0  =     1;

  ///	<summary>
  ///	  Constant value used to specify the 2nd bit position in a value.
  ///	</summary>
  ///	<value>
  ///	  2
  ///	</value>
  ATBitPos1  =     2;

  ///	<summary>
  ///	  Constant value used to specify the 3rd bit position in a value.
  ///	</summary>
  ///	<value>
  ///	  4
  ///	</value>
  ATBitPos2  =     4;

  ///	<summary>
  ///	  Constant value used to specify the 4th bit position in a value.
  ///	</summary>
  ///	<value>
  ///	  8
  ///	</value>
  ATBitPos3  =     8;

  ///	<summary>
  ///	  Constant value used to specify the 5th bit position in a value.
  ///	</summary>
  ///	<value>
  ///	  16
  ///	</value>
  ATBitPos4  =    16;

  ///	<summary>
  ///	  Constant value used to specify the 6th bit position in a value.
  ///	</summary>
  ///	<value>
  ///	  32
  ///	</value>
  ATBitPos5  =    32;

  ///	<summary>
  ///	  Constant value used to specify the 8th bit position in a value.
  ///	</summary>
  ///	<value>
  ///	  64
  ///	</value>
  ATBitPos6  =    64;

  ///	<summary>
  ///	  Constant value used to specify the 8th bit position in a value.
  ///	</summary>
  ///	<value>
  ///	  128
  ///	</value>
  ATBitPos7  =   128;


  //Additional bits for Word (16bit)...

  ///	<summary>
  ///	  Constant value used to specify the 9th bit position in a value.
  ///	</summary>
  ///	<value>
  ///	  256
  ///	</value>
  ATBitPos8  =   256;

  ///	<summary>
  ///	  Constant value used to specify the 10th bit position in a value.
  ///	</summary>
  ///	<value>
  ///	  512
  ///	</value>
  ATBitPos9  =   512;

  ///	<summary>
  ///	  Constant value used to specify the 11th bit position in a value.
  ///	</summary>
  ///	<value>
  ///	  1024
  ///	</value>
  ATBitPos10 =  1024;

  ///	<summary>
  ///	  Constant value used to specify the 12th bit position in a value.
  ///	</summary>
  ///	<value>
  ///	  2048
  ///	</value>
  ATBitPos11 =  2048;

  ///	<summary>
  ///	  Constant value used to specify the 13th bit position in a value.
  ///	</summary>
  ///	<value>
  ///	  4096
  ///	</value>
  ATBitPos12 =  4096;

  ///	<summary>
  ///	  Constant value used to specify the 14th bit position in a value.
  ///	</summary>
  ///	<value>
  ///	  8192
  ///	</value>
  ATBitPos13 =  8192;

  ///	<summary>
  ///	  Constant value used to specify the 15th bit position in a value.
  ///	</summary>
  ///	<value>
  ///	  16384
  ///	</value>
  ATBitPos14 = 16384;

  ///	<summary>
  ///	  Constant value used to specify the 16th bit position in a value.
  ///	</summary>
  ///	<value>
  ///	  32768
  ///	</value>
  ATBitPos15 = 32768;

///	<summary>
///	  Sets the bit in position ABit to zero (0). This function is for single
///	  byte values.
///	</summary>
///	<param name="AByte">
///	  A variable containing the value to modify.
///	</param>
///	<param name="ABit">
///	  The bit position to clear. Should be specified using one of the
///	  ATBitPosxx constants.
///	</param>
procedure ClearByteBit(var AByte: Byte; ABit: Byte);

///	<summary>
///	  Sets the bit in position ABit to zero (0). This function is for double
///	  byte (word) values.
///	</summary>
///	<param name="AWord">
///	  A variable containing the value to modify.
///	</param>
///	<param name="ABit">
///	  The bit position to clear. Should be specified using one of the
///	  ATBitPosxx constants.
///	</param>
procedure ClearWordBit(var AWord: Word; ABit: Word);

///	<summary>
///	  Check AByte to see if the bit in position ABit is set (1).
///	</summary>
///	<param name="AByte">
///	  The value to check.
///	</param>
///	<param name="ABit">
///	  The bit position to check. Should be specified using one of the
///	  ATBitPosxx constants.
///	</param>
///	<returns>
///	  Returns TRUE if the bit in position ABit is set to 1, FALSE otherwise.
///	</returns>
function IsByteBitSet(var AByte: Byte; ABit: Byte): Boolean;

///	<summary>
///	  Check AWord
///	</summary>
///	<param name="AWord">
///	  The value to check.
///	</param>
///	<param name="ABit">
///	  The bit position to check. Should be specified using one of the
///	  ATBitPosxx constants.
///	</param>
///	<returns>
///	  Returns TRUE if the bit in position ABit is set to 1, FALSE otherwise.
///	</returns>
function IsWordBitSet(var AWord: Word; ABit: Word): Boolean;

///	<summary>
///	  Sets the value of ABit in AByte to 1.
///	</summary>
///	<param name="AByte">
///	  A variable containing the value to modify.
///	</param>
///	<param name="ABit">
///	  The bit position to set to 1. Should be specified using one of the
///	  ATBitPosxx constants.
///	</param>
procedure SetByteBit(var AByte: Byte; ABit: Byte);

///	<summary>
///	  Sets the value of ABit in AWord to 1.
///	</summary>
///	<param name="AWord">
///	  A variable containing the value to modify.
///	</param>
///	<param name="ABit">
///	  The bit position to set to 1. Should be specified using one of the
///	  ATBitPosxx constants.
///	</param>
procedure SetWordBit(var AWord: Word; ABit: Word);

///	<summary>
///	  Toggles the value of ABit in AByte.
///	</summary>
///	<param name="AByte">
///	  A variable containing the value to modify.
///	</param>
///	<param name="ABit">
///	  The bit position to set to toggle. Should be specified using one of the
///	  ATBitPosxx constants.
///	</param>
procedure ToggleByteBit(var AByte: Byte; ABit: Byte);

///	<summary>
///	  Toggles the value of ABit in AWord.
///	</summary>
///	<param name="AWord">
///	  A variable containing the value to modify.
///	</param>
///	<param name="ABit">
///	  The bit position to set to toggle. Should be specified using one of the
///	  ATBitPosxx constants.
///	</param>
procedure ToggleWordBit(var AWord: Word; ABit: Word);

implementation

procedure ClearByteBit(var AByte: Byte; ABit: Byte);
begin
  SetByteBit(AByte, ABit);
  ToggleByteBit(AByte, ABit);
end;

procedure ClearWordBit(var AWord: Word; ABit: Word);
begin
  SetWordBit(AWord, ABit);
  ToggleWordBit(AWord, ABit);
end;

function IsByteBitSet(var AByte: Byte; ABit: Byte): Boolean;
begin
  Result := ((AByte AND ABit) <> 0);
end;

function IsWordBitSet(var AWord: Word; ABit: Word): Boolean;
begin
  Result := ((AWord AND ABit) <> 0);
end;

procedure SetByteBit(var AByte: Byte; ABit: Byte);
begin
  AByte := AByte OR ABit;
end;

procedure SetWordBit(var AWord: Word; ABit: Word);
begin
  AWord := AWord OR ABit;
end;

procedure ToggleByteBit(var AByte: Byte; ABit: Byte);
begin
  AByte := AByte XOR ABit;
end;

procedure ToggleWordBit(var AWord: Word; ABit: Word);
begin
  AWord := AWord XOR ABit;
end;

end.

