unit AT.FMX.Forms;

interface

uses
  FMX.Forms, System.Classes;


procedure ProcessFormEnterKeyPress(AFrm: TCustomForm; var AKey: Word;
    var AKeyChar: Char; AShift: TShiftState);

implementation

uses
  System.UITypes;

procedure ProcessFormEnterKeyPress(AFrm: TCustomForm; var AKey: Word;
    var AKeyChar: Char; AShift: TShiftState);
var
  ANewKey: Word;
  ANewKeyChar: Char;
begin
  if (NOT Assigned(AFrm)) then
    Exit;



  if ( (AShift = []) AND (AKey = vkReturn) ) then
    begin
      AKey := 0;
      AKeyChar := #0;

      ANewKey := vkTab;
      ANewKeyChar := Char(vkTab);

      AFrm.KeyDown(ANewKey, ANewKeyChar, []);
    end;
end;

end.
