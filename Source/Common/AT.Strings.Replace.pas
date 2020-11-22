// ******************************************************************
//
// Program Name   : Angelic Tech Common Library
// Program Version: 2017
// Platform(s)    : Android, iOS, Linux, OS X, Windows
// Framework      : None
//
// Filename       : AT.Strings.Replace.pas
// File Version   : 2017.04
// Date Created   : 11-Apr-2017
// Author         : Matthew Vesperman
//
// Description:
//
// String replace routines.
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
///   Contains string replacement routines.
/// </summary>
unit AT.Strings.Replace;

interface

uses
  System.Classes, System.Types;

///	<summary>
///	  Strips all single apersand (&amp;) characters from AStr. Leave all double
///	  ampersand (&amp;&amp;) instances alone.
///	</summary>
///	<param name="AStr">
///	  The string to modify.
///	</param>
///	<returns>
///	  Returns a string with all single &amp; characters removed.
///	</returns>
function StripAmpersands(const AStr: String): String;

///	<summary>
///	  Strips all single backslash (\) characters from AStr. Convert all double
///	  backslash (\\) to single backslash (\).
///	</summary>
///	<param name="AStr">
///	  The string to modify.
///	</param>
///	<returns>
///	  Returns a string with all single \ characters removed.
///	</returns>
function StripBackslashes(const AStr: String): String;

///	<summary>
///	  Searches ASource for all instances of ALookFor and replaces them
///	  withAReplaceWith. If ANoCase is TRUE then a case-insensitive replace is
///	  done, otherwise the replace is case-sensitive.
///	</summary>
///	<param name="ASource">
///	  The string to search in.
///	</param>
///	<param name="ALookFor">
///	  The string to search for.
///	</param>
///	<param name="AReplaceWith">
///	  The string to replace ALookFor with.
///	</param>
///	<param name="ANoCase">
///	  If TRUE the replace is case-insensitive, otherwise the replace is
///	  case-sensitive.
///	</param>
///	<returns>
///	  Returns ASource with all instances of ALookFor replaced with AReplaceWith.
///	</returns>
function StrReplace(ASource, ALookFor, AReplaceWith: string;
    ANoCase: Boolean = True): string;

/// <summary>
///   Replaces all month names in AStr with their numeric equivalent.
/// </summary>
/// <param name="AStr">
///   The string to modify.
/// </param>
/// <param name="ALocale">
///   The locale for use in determining the month names. Default:
///   'en-us'
/// </param>
/// <returns>
///   Returns AStr with all month names replaced with the numeric
///   equivalent.
/// </returns>
function StrReplaceMonthNames(const AStr: String; ALocale: String = 'en-us'): String;


implementation

uses
  System.SysUtils;


function StripAmpersands(const AStr: String): String;
var
  Idx : Integer;
  iLen: Integer;
begin
  //Set result to empty string...
  Result := EmptyStr;

  //Set starting index to 1...
  Idx := 1;

  //Get length of input string...
  iLen := Length(AStr);

  //Repeat until the index is greater than the length...
  while (Idx <= iLen) do
    begin
      //Did we find an ampersand???
      if (AStr[Idx] = '&') then
        begin
          //Yes, is next char also ampersand???
          if (Idx < iLen) AND (AStr[Idx + 1] = '&') then
            begin
              //Yes, add double ampersand to result...
              Result := Result + '&&';
              //Increment index by 2...
              Inc(Idx, 2);
            end
          else
            begin
              //No, increment index by 1...
              Inc(Idx);
            end;
        end
      else
        begin
          //No, append char to result...
          Result := Result + AStr[Idx];
          //Increment index by 1...
          Inc(Idx);
        end;
    end;
end;

function StripBackslashes(const AStr: String): String;
var
  Idx : Integer;
  iLen: Integer;
begin
  //Set result to empty string...
  Result := EmptyStr;

  //Set starting index to 1...
  Idx := 1;

  //Get length of input string...
  iLen := Length(AStr);

  //Repeat until index is greater than the length...
  while (Idx <= iLen) do
    begin
      //Did we find a backslash???
      if (AStr[Idx] = '\') then
        begin
          //Yes, is the next char also a backslash???
          if (Idx < iLen) AND (AStr[Idx + 1] = '\') then
            begin
              //Add single backslash to result...
              Result := Result + '\';
              //Increment index by 2...
              Inc(Idx, 2);
            end
          else
            begin
              //No, increment index by 1...
              Inc(Idx);
            end;
        end
      else
        begin
          //No, append char to result...
          Result := Result + AStr[Idx];
          //Increment index by 1...
          Inc(Idx);
        end;
    end;
end;

function StrReplace(ASource, ALookFor, AReplaceWith: string;
    ANoCase: Boolean = True): string;
var
  aPos        : Integer;
  sSourceText : string;
  sSearchText : string;
  sValue      : String;
begin

  //Searches sSource for the text specified in sLookFor and replaces it with
  //the text specified in sReplaceWith...

  sValue := EmptyStr;  //Initialize temporary result variable...

  //For case insensitive replacement...
  if ANoCase then
    begin
      sSourceText := LowerCase(ASource);  //Change source to all lowercase...
      sSearchText := LowerCase(ALookFor); //Change search text to all lowercase.
    end
  else  //case-sensitive replace...
    begin
      sSourceText := ASource;   //Set source text...
      sSearchText := ALookFor;  //Set search text...
    end;

  //Check to see if search text occurs in source text...
  aPos   := Pos(sSearchText, sSourceText);

  //Perform the following for every occurence of the search text...
  while (aPos <> 0) do
    begin
      //Set temp result value to the portion of text in temp source text
      //before the search text...
      sValue := sValue + Copy(ASource, 1, aPos-1);
      //Add the replacement text to the temp result value...
      sValue := sValue + AReplaceWith;

      //Remove the portion already copied to the temp result value...
      Delete(ASource, 1, aPos + Length(ALookFor)-1);
      Delete(sSourceText, 1, aPos + Length(ALookFor)-1);

      //Check for more occurrences of search text...
      aPos := Pos(sSearchText, sSourceText);
    end;

  //Add the remainder of the source text to the temp result value...
  sValue := sValue + ASource;

  //Assign the final result...
  Result := sValue;

end;

function StrReplaceMonthNames(const AStr: String; ALocale: String = 'en-us'): String;
var
  FS: TFormatSettings;
  Idx: Integer;
begin
  //Set result to input string...
  Result := AStr;

  //Create a TFormatSettings object for the desired locale...
  FS := TFormatSettings.Create(ALocale);

  //Iterate for all long month names...
  for Idx := Low(FS.LongMonthNames) to High(FS.LongMonthNames) do
    begin
      //Replace the long month name with it's numeric value if found...
      Result := StrReplace(Result, FS.LongMonthNames[Idx], IntToStr(Idx));
    end;

  //Iterate for all short month names...
  for Idx := Low(FS.ShortMonthNames) to High(FS.ShortMonthNames) do
    begin
      //Replace the short month name with it's numeric value if found...
      Result := StrReplace(Result, FS.ShortMonthNames[Idx], IntToStr(Idx));
    end;
end;


end.

