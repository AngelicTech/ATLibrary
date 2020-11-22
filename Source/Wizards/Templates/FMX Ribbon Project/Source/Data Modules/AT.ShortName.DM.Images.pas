unit AT.ShortName.DM.Images;

interface

uses
  System.SysUtils, System.Classes, System.ImageList, FMX.ImgList;

type
  TdmImages = class(TDataModule)
    ilstDocTypeLg: TImageList;
    ilstDocTypeSm: TImageList;
    ilstLarge: TImageList;
    ilstSmall: TImageList;
  strict protected
    function GetDocTypeLarge: TImageList;
    function GetDocTypeSmall: TImageList;
    function GetLarge: TImageList;
    function GetSmall: TImageList;
  public
    property DocTypeLarge: TImageList read GetDocTypeLarge;
    property DocTypeSmall: TImageList read GetDocTypeSmall;
    property Large: TImageList read GetLarge;
    property Small: TImageList read GetSmall;
  end;

var
  dmImages: TdmImages;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

function TdmImages.GetDocTypeLarge: TImageList;
begin
  Result := ilstDocTypeLg;
end;

function TdmImages.GetDocTypeSmall: TImageList;
begin
  Result := ilstDocTypeSm;
end;

function TdmImages.GetLarge: TImageList;
begin
  Result := ilstLarge;
end;

function TdmImages.GetSmall: TImageList;
begin
  Result := ilstSmall;;
end;

end.
