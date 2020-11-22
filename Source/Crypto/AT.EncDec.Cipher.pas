unit AT.EncDec.Cipher;

interface

function XORCipherDecrypt(AKey, AValue: String): String;
function XORCipherEncrypt(AKey, AValue: String): String;

implementation

uses
  System.SysUtils;

procedure _XOR_Encode_Decode(const Key: AnsiString; Buf: PAnsiChar;
  Size: Cardinal);
var
  I: Cardinal;
  J: Cardinal;
begin
  if Key <> '' then
    begin
      J := 1;
      for I := 1 to Size do
        begin
          Buf[I - 1] := AnsiChar(Ord(Buf[I - 1]) xor Ord(Key[J]));
          J := (J mod Cardinal(Length(Key))) + 1;
        end;
    end;
end;

function _XOR_Encode_Decode_String(const Key, Value: AnsiString): AnsiString;
begin
  Result := Value;
  UniqueString(Result);
  _XOR_Encode_Decode(Key, PAnsiChar(Result), Length(Value));
end;

function XORCipherDecrypt(AKey, AValue: String): String;
var
  ASKey  : AnsiString;
  ASValue: AnsiString;
begin
  ASKey := AnsiString(AKey);
  ASValue := AnsiString(AValue);

  ASValue := _XOR_Encode_Decode_String(ASKey, ASValue);
  Result := String(ASValue);
end;

function XORCipherEncrypt(AKey, AValue: String): String;
var
  ASKey  : AnsiString;
  ASValue: AnsiString;
begin
  ASKey := AnsiString(AKey);
  ASValue := AnsiString(AValue);

  ASValue := _XOR_Encode_Decode_String(ASKey, ASValue);
  Result := String(ASValue);
end;

end.
