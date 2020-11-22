unit AT.Vcl.DX.NativeFileSelector;

interface

uses
  Winapi.ShlObj,
  System.Classes, System.UITypes, System.SysUtils,
  Vcl.Controls, Vcl.ImgList,
  cxControls, dxShellBreadcrumbEdit, dxLayoutLookAndFeels,
  cxShellListView, cxShellTreeView, cxShellControls,
  AT.Vcl.DX.NativeFileSelector.Frame;

type
  [ComponentPlatformsAttribute(pidWin32 OR pidWin64)]
  TATdxNativeFileSelector = class(TcxControl)
  strict private
    FFrame: TATdxNativeFileSelectorFrame;
    function _IsAcceptButtonCaptionStored: Boolean;
    function _IsAcceptButtonHintStored: Boolean;
    function _IsCancelButtonCaptionStored: Boolean;
    function _IsCancelButtonHintStored: Boolean;
    function _IsFilterStored: Boolean;
    function _IsNewFolderButtonCaptionStored: Boolean;
    function _IsNewFolderButtonHintStored: Boolean;
    function _IsParentFolderButtonHintStored: Boolean;
    function _IsRefreshButtonHintStored: Boolean;
    function _IsViewsButtonHintStored: Boolean;
  strict protected
    function GetAcceptButtonCaption: String;
    function GetAcceptButtonHint: String;
    function GetAcceptButtonImageIndex: System.UITypes.TImageIndex;
    function GetAcceptButtonWidth: Integer;
    function GetBreadCrumbBar: TdxShellBreadcrumbEdit;
    function GetCanBrowseParentFolder: Boolean;
    function GetCancelButtonCaption: String;
    function GetCancelButtonHint: String;
    function GetCancelButtonImageIndex: System.UITypes.TImageIndex;
    function GetCancelButtonVisible: Boolean;
    function GetCancelButtonWidth: Integer;
    function GetCanCreateNewFolder: Boolean;
    function GetCurrentPath: String;
    function GetExtraLargeIconSize: Integer;
    function GetFileName: System.SysUtils.TFileName;
    function GetFilter: String;
    function GetFilterIndex: Integer;
    function GetImages: TCustomImageList;
    function GetLargeIconSize: Integer;
    function GetLayoutLookAndFeel: TdxCustomLayoutLookAndFeel;
    function GetListView: TcxShellListView;
    function GetMediumIconSize: Integer;
    function GetNewFolderButtonCaption: String;
    function GetNewFolderButtonHint: String;
    function GetNewFolderButtonVisible: Boolean;
    function GetNewFolderButtonWidth: Integer;
    function GetNewFolderImageIndex: System.UITypes.TImageIndex;
    function GetOnAcceptButtonClick: TNotifyEvent;
    function GetOnCancelButtonClick: TNotifyEvent;
    function GetOnExecuteItem: TcxShellExecuteItemEvent;
    function GetParentFolderButtonHint: String;
    function GetParentFolderImageIndex: System.UITypes.TImageIndex;
    function GetRefreshButtonHint: String;
    function GetRefreshImageIndex: System.UITypes.TImageIndex;
    function GetTreeView: TcxShellTreeView;
    function GetViewMode: TATFileSelectorViewMode;
    function GetViewsButtonHint: String;
    function GetViewsDropDownMenu: TComponent;
    function GetViewsImageIndex: System.UITypes.TImageIndex;
    function GetZipFilesAreFolders: Boolean;
    procedure SetAcceptButtonCaption(const Value: String);
    procedure SetAcceptButtonHint(const Value: String);
    procedure SetAcceptButtonImageIndex(const Value: System.UITypes.TImageIndex);
    procedure SetAcceptButtonWidth(const Value: Integer);
    procedure SetCancelButtonCaption(const Value: String);
    procedure SetCancelButtonHint(const Value: String);
    procedure SetCancelButtonImageIndex(const Value: System.UITypes.TImageIndex);
    procedure SetCancelButtonVisible(const Value: Boolean);
    procedure SetCancelButtonWidth(const Value: Integer);
    procedure SetCurrentPath(const Value: String);
    procedure SetExtraLargeIconSize(const Value: Integer);
    procedure SetFileName(const Value: System.SysUtils.TFileName);
    procedure SetFilter(const Value: String);
    procedure SetFilterIndex(const Value: Integer);
    procedure SetImages(const Value: TCustomImageList);
    procedure SetLargeIconSize(const Value: Integer);
    procedure SetLayoutLookAndFeel(const Value: TdxCustomLayoutLookAndFeel);
    procedure SetMediumIconSize(const Value: Integer);
    procedure SetNewFolderButtonCaption(const Value: String);
    procedure SetNewFolderButtonHint(const Value: String);
    procedure SetNewFolderButtonVisible(const Value: Boolean);
    procedure SetNewFolderButtonWidth(const Value: Integer);
    procedure SetNewFolderImageIndex(const Value: System.UITypes.TImageIndex);
    procedure SetOnAcceptButtonClick(const Value: TNotifyEvent);
    procedure SetOnCancelButtonClick(const Value: TNotifyEvent);
    procedure SetOnExecuteItem(const Value: TcxShellExecuteItemEvent); protected
  protected
    procedure SetParentFolderButtonHint(const Value: String);
    procedure SetParentFolderImageIndex(
      const Value: System.UITypes.TImageIndex);
    procedure SetRefreshButtonHint(const Value: String);
    procedure SetRefreshImageIndex(const Value: System.UITypes.TImageIndex);
    procedure SetViewMode(const Value: TATFileSelectorViewMode);
    procedure SetViewsButtonHint(const Value: String);
    procedure SetViewsDropDownMenu(const Value: TComponent);
    procedure SetViewsImageIndex(const Value: System.UITypes.TImageIndex);
    procedure SetZipFilesAreFolders(const Value: Boolean);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure BrowseParentFolder;
    function CreateNewFolder: Boolean; overload;
    function CreateNewFolder(out NewPath: String): Boolean; overload;
    procedure RefreshLists;
    property BreadCrumbBar: TdxShellBreadcrumbEdit
        read GetBreadCrumbBar;
    property CanBrowseParentFolder: Boolean
        read GetCanBrowseParentFolder;
    property CanCreateNewFolder: Boolean
        read GetCanCreateNewFolder;
    property ListView: TcxShellListView
        read GetListView;
    property TreeView: TcxShellTreeView
        read GetTreeView;
  published
    property AcceptButtonCaption: String
        read GetAcceptButtonCaption
        write SetAcceptButtonCaption
        stored _IsAcceptButtonCaptionStored;
    property AcceptButtonHint: String
        read GetAcceptButtonHint
        write SetAcceptButtonHint
        stored _IsAcceptButtonHintStored;
    property AcceptButtonImageIndex: System.UITypes.TImageIndex
        read GetAcceptButtonImageIndex
        write SetAcceptButtonImageIndex
        default -1;
    property AcceptButtonWidth: Integer
        read GetAcceptButtonWidth
        write SetAcceptButtonWidth
        default 100;
    property Align;
    property CancelButtonCaption: String
        read GetCancelButtonCaption
        write SetCancelButtonCaption
        stored _IsCancelButtonCaptionStored;
    property CancelButtonHint: String
        read GetCancelButtonHint
        write SetCancelButtonHint
        stored _IsCancelButtonHintStored;
    property CancelButtonImageIndex: System.UITypes.TImageIndex
        read GetCancelButtonImageIndex
        write SetCancelButtonImageIndex
        default -1;
    property CancelButtonVisible: Boolean
        read GetCancelButtonVisible
        write SetCancelButtonVisible
        default True;
    property CancelButtonWidth: Integer
        read GetCancelButtonWidth
        write SetCancelButtonWidth
        default 100;
    property CurrentPath: String
        read GetCurrentPath
        write SetCurrentPath;
    property ExtraLargeIconSize: Integer
        read GetExtraLargeIconSize
        write SetExtraLargeIconSize
        default 256;
    property FileName: System.SysUtils.TFileName
        read GetFileName
        write SetFileName;
    property Filter: String
        read GetFilter
        write SetFilter
        stored _IsFilterStored;
    property FilterIndex: Integer
        read GetFilterIndex
        write SetFilterIndex
        default 1;
    property Images: TCustomImageList
        read GetImages
        write SetImages;
    property LargeIconSize: Integer
        read GetLargeIconSize
        write SetLargeIconSize
        default 96;
    property LayoutLookAndFeel: TdxCustomLayoutLookAndFeel
        read GetLayoutLookAndFeel
        write SetLayoutLookAndFeel;
    property MediumIconSize: Integer
        read GetMediumIconSize
        write SetMediumIconSize
        default 64;
    property NewFolderButtonCaption: String
        read GetNewFolderButtonCaption
        write SetNewFolderButtonCaption
        stored _IsNewFolderButtonCaptionStored;
    property NewFolderButtonHint: String
        read GetNewFolderButtonHint
        write SetNewFolderButtonHint
        stored _IsNewFolderButtonHintStored;
    property NewFolderButtonVisible: Boolean
        read GetNewFolderButtonVisible
        write SetNewFolderButtonVisible
        default True;
    property NewFolderButtonWidth: Integer
        read GetNewFolderButtonWidth
        write SetNewFolderButtonWidth
        default 100;
    property NewFolderImageIndex: System.UITypes.TImageIndex
        read GetNewFolderImageIndex
        write SetNewFolderImageIndex
        default -1;
    property ParentFolderButtonHint: String
        read GetParentFolderButtonHint
        write SetParentFolderButtonHint
        stored _IsParentFolderButtonHintStored;
    property ParentFolderImageIndex: System.UITypes.TImageIndex
        read GetParentFolderImageIndex
        write SetParentFolderImageIndex
        default -1;
    property RefreshButtonHint: String
        read GetRefreshButtonHint
        write SetRefreshButtonHint
        stored _IsRefreshButtonHintStored;
    property RefreshImageIndex: System.UITypes.TImageIndex
        read GetRefreshImageIndex
        write SetRefreshImageIndex
        default -1;
    property ViewMode: TATFileSelectorViewMode
        read GetViewMode
        write SetViewMode
        default fsvmDetails;
    property ViewsButtonHint: String
        read GetViewsButtonHint
        write SetViewsButtonHint
        stored _IsViewsButtonHintStored;
    property ViewsDropDownMenu: TComponent
        read GetViewsDropDownMenu
        write SetViewsDropDownMenu;
    property ViewsImageIndex: System.UITypes.TImageIndex
        read GetViewsImageIndex
        write SetViewsImageIndex
        default -1;
    property ZipFilesAreFolders: Boolean
        read GetZipFilesAreFolders
        write SetZipFilesAreFolders
        default False;
    property OnAcceptButtonClick: TNotifyEvent
        read GetOnAcceptButtonClick
        write SetOnAcceptButtonClick;
    property OnCancelButtonClick: TNotifyEvent
        read GetOnCancelButtonClick
        write SetOnCancelButtonClick;
    property OnExecuteItem: TcxShellExecuteItemEvent
        read GetOnExecuteItem
        write SetOnExecuteItem;
  end;


implementation


constructor TATdxNativeFileSelector.Create(AOwner: TComponent);
begin
  inherited;

  FFrame := TATdxNativeFileSelectorFrame.Create(Self);

  FFrame.Parent := Self;

  FFrame.Align := alClient;
  FFrame.Visible := True;

  AcceptButtonImageIndex := -1;
  AcceptButtonWidth := 100;

  CancelButtonImageIndex := -1;
  CancelButtonVisible := True;
  CancelButtonWidth := 100;

  ExtraLargeIconSize := 256;

  FilterIndex := 1;

  LargeIconSize := 96;

  MediumIconSize := 64;

  NewFolderButtonVisible := True;
  NewFolderButtonWidth := 100;
  NewFolderImageIndex := -1;

  ParentFolderImageIndex := -1;

  RefreshImageIndex := -1;

  ViewMode := fsvmDetails;

  ViewsImageIndex := -1;

  ZipFilesAreFolders := False;
end;

destructor TATdxNativeFileSelector.Destroy;
begin
  FreeAndNil(FFrame);

  inherited;
end;

procedure TATdxNativeFileSelector.BrowseParentFolder;
begin
  FFrame.BrowseParentFolder;
end;

function TATdxNativeFileSelector.CreateNewFolder: Boolean;
begin
  Result := FFrame.CreateNewFolder;
end;

function TATdxNativeFileSelector.CreateNewFolder(out NewPath: String): Boolean;
begin
  Result := FFrame.CreateNewFolder(NewPath);
end;

function TATdxNativeFileSelector.GetAcceptButtonCaption: String;
begin
  Result := FFrame.AcceptButtonCaption;
end;

function TATdxNativeFileSelector.GetAcceptButtonHint: String;
begin
  Result := FFrame.AcceptButtonHint;
end;

function TATdxNativeFileSelector.GetAcceptButtonImageIndex:
    System.UITypes.TImageIndex;
begin
  Result := FFrame.AcceptButtonImageIndex;
end;

function TATdxNativeFileSelector.GetAcceptButtonWidth: Integer;
begin
  Result := FFrame.AcceptButtonWidth;
end;

function TATdxNativeFileSelector.GetBreadCrumbBar: TdxShellBreadcrumbEdit;
begin
  Result := FFrame.BreadCrumbBar;
end;

function TATdxNativeFileSelector.GetCanBrowseParentFolder: Boolean;
begin
  Result := FFrame.CanBrowseParentFolder;
end;

function TATdxNativeFileSelector.GetCancelButtonCaption: String;
begin
  Result := FFrame.CancelButtonCaption;
end;

function TATdxNativeFileSelector.GetCancelButtonHint: String;
begin
  Result := FFrame.CancelButtonHint;
end;

function TATdxNativeFileSelector.GetCancelButtonImageIndex:
    System.UITypes.TImageIndex;
begin
  Result := FFrame.CancelButtonImageIndex;
end;

function TATdxNativeFileSelector.GetCancelButtonVisible: Boolean;
begin
  Result := FFrame.CancelButtonVisible;
end;

function TATdxNativeFileSelector.GetCancelButtonWidth: Integer;
begin
  Result := FFrame.CancelButtonWidth;
end;

function TATdxNativeFileSelector.GetCanCreateNewFolder: Boolean;
begin
  Result := FFrame.CanCreateNewFolder;
end;

function TATdxNativeFileSelector.GetCurrentPath: String;
begin
  Result := FFrame.CurrentPath;
end;

function TATdxNativeFileSelector.GetExtraLargeIconSize: Integer;
begin
  Result := FFrame.ExtraLargeIconSize;
end;

function TATdxNativeFileSelector.GetFileName: System.SysUtils.TFileName;
begin
  Result := FFrame.FileName;
end;

function TATdxNativeFileSelector.GetFilter: String;
begin
  Result := FFrame.Filter;
end;

function TATdxNativeFileSelector.GetFilterIndex: Integer;
begin
  Result := FFrame.FilterIndex;
end;

function TATdxNativeFileSelector.GetImages: TCustomImageList;
begin
  Result := FFrame.Images;
end;

function TATdxNativeFileSelector.GetLargeIconSize: Integer;
begin
  Result := FFrame.LargeIconSize;
end;

function TATdxNativeFileSelector.GetLayoutLookAndFeel:
    TdxCustomLayoutLookAndFeel;
begin
  Result := FFrame.LayoutLookAndFeel;
end;

function TATdxNativeFileSelector.GetListView: TcxShellListView;
begin
  Result := FFrame.ListView;
end;

function TATdxNativeFileSelector.GetMediumIconSize: Integer;
begin
  Result := FFrame.MediumIconSize;
end;

function TATdxNativeFileSelector.GetNewFolderButtonCaption: String;
begin
  Result := FFrame.NewFolderButtonCaption;
end;

function TATdxNativeFileSelector.GetNewFolderButtonHint: String;
begin
  Result := FFrame.NewFolderButtonHint;
end;

function TATdxNativeFileSelector.GetNewFolderButtonVisible: Boolean;
begin
  Result := FFrame.NewFolderButtonVisible;
end;

function TATdxNativeFileSelector.GetNewFolderButtonWidth: Integer;
begin
  Result := FFrame.NewFolderButtonWidth;
end;

function TATdxNativeFileSelector.GetNewFolderImageIndex:
    System.UITypes.TImageIndex;
begin
  Result := FFrame.NewFolderImageIndex;
end;

function TATdxNativeFileSelector.GetOnAcceptButtonClick: TNotifyEvent;
begin
  Result := FFrame.OnAcceptButtonClick;
end;

function TATdxNativeFileSelector.GetOnCancelButtonClick: TNotifyEvent;
begin
  Result := FFrame.OnCancelButtonClick;
end;

function TATdxNativeFileSelector.GetOnExecuteItem: TcxShellExecuteItemEvent;
begin
  Result := FFrame.OnExecuteItem;
end;

function TATdxNativeFileSelector.GetParentFolderButtonHint: String;
begin
  Result := FFrame.ParentFolderButtonHint;
end;

function TATdxNativeFileSelector.GetParentFolderImageIndex: System.UITypes.TImageIndex;
begin
  Result := FFrame.ParentFolderImageIndex;
end;

function TATdxNativeFileSelector.GetRefreshButtonHint: String;
begin
  Result := FFrame.RefreshButtonHint;
end;

function TATdxNativeFileSelector.GetRefreshImageIndex: System.UITypes.TImageIndex;
begin
  Result := FFrame.RefreshImageIndex;
end;

function TATdxNativeFileSelector.GetTreeView: TcxShellTreeView;
begin
  Result := FFrame.TreeView;
end;

function TATdxNativeFileSelector.GetViewMode: TATFileSelectorViewMode;
begin
  Result := FFrame.ViewMode;
end;

function TATdxNativeFileSelector.GetViewsButtonHint: String;
begin
  Result := FFrame.ViewsButtonHint;
end;

function TATdxNativeFileSelector.GetViewsDropDownMenu: TComponent;
begin
  Result := FFrame.ViewsDropDownMenu;
end;

function TATdxNativeFileSelector.GetViewsImageIndex: System.UITypes.TImageIndex;
begin
  Result := FFrame.ViewsImageIndex;
end;

function TATdxNativeFileSelector.GetZipFilesAreFolders: Boolean;
begin
  Result := FFrame.ZipFilesAreFolders;
end;

procedure TATdxNativeFileSelector.RefreshLists;
begin
  FFrame.RefreshLists;
end;

procedure TATdxNativeFileSelector.SetAcceptButtonCaption(const Value: String);
begin
  FFrame.AcceptButtonCaption := Value;
end;

procedure TATdxNativeFileSelector.SetAcceptButtonHint(const Value: String);
begin
  FFrame.AcceptButtonHint := Value;
end;

procedure TATdxNativeFileSelector.SetAcceptButtonImageIndex(const Value:
    System.UITypes.TImageIndex);
begin
  FFrame.AcceptButtonImageIndex := Value;
end;

procedure TATdxNativeFileSelector.SetAcceptButtonWidth(const Value: Integer);
begin
  FFrame.AcceptButtonWidth := Value;
end;

procedure TATdxNativeFileSelector.SetCancelButtonCaption(const Value: String);
begin
  FFrame.CancelButtonCaption := Value;
end;

procedure TATdxNativeFileSelector.SetCancelButtonHint(const Value: String);
begin
  FFrame.CancelButtonHint := Value;
end;

procedure TATdxNativeFileSelector.SetCancelButtonImageIndex(const Value:
    System.UITypes.TImageIndex);
begin
  FFrame.CancelButtonImageIndex := Value;
end;

procedure TATdxNativeFileSelector.SetCancelButtonVisible(const Value: Boolean);
begin
  FFrame.CancelButtonVisible := Value;
end;

procedure TATdxNativeFileSelector.SetCancelButtonWidth(const Value: Integer);
begin
  FFrame.CancelButtonWidth := Value;
end;

procedure TATdxNativeFileSelector.SetCurrentPath(const Value: String);
begin
  FFrame.CurrentPath := Value;
end;

procedure TATdxNativeFileSelector.SetExtraLargeIconSize(const Value: Integer);
begin
  FFrame.ExtraLargeIconSize := Value;
end;

procedure TATdxNativeFileSelector.SetFileName(const Value:
    System.SysUtils.TFileName);
begin
  FFrame.FileName := Value;
end;

procedure TATdxNativeFileSelector.SetFilter(const Value: String);
begin
  FFrame.Filter := Value;
end;

procedure TATdxNativeFileSelector.SetFilterIndex(const Value: Integer);
begin
  FFrame.FilterIndex := Value;
end;

procedure TATdxNativeFileSelector.SetImages(const Value: TCustomImageList);
begin
  FFrame.Images := Value;
end;

procedure TATdxNativeFileSelector.SetLargeIconSize(const Value: Integer);
begin
  FFrame.LargeIconSize := Value;
end;

procedure TATdxNativeFileSelector.SetLayoutLookAndFeel(const Value:
    TdxCustomLayoutLookAndFeel);
begin
  FFrame.LayoutLookAndFeel := Value;
end;

procedure TATdxNativeFileSelector.SetMediumIconSize(const Value: Integer);
begin
  FFrame.MediumIconSize := Value;
end;

procedure TATdxNativeFileSelector.SetNewFolderButtonCaption(const Value:
    String);
begin
  FFrame.NewFolderButtonCaption := Value;
end;

procedure TATdxNativeFileSelector.SetNewFolderButtonHint(const Value: String);
begin
  FFrame.NewFolderButtonHint := Value;
end;

procedure TATdxNativeFileSelector.SetNewFolderButtonVisible(const Value:
    Boolean);
begin
  FFrame.NewFolderButtonVisible := Value;
end;

procedure TATdxNativeFileSelector.SetNewFolderButtonWidth(const Value: Integer);
begin
  FFrame.NewFolderButtonWidth := Value;
end;

procedure TATdxNativeFileSelector.SetNewFolderImageIndex(const Value:
    System.UITypes.TImageIndex);
begin
  FFrame.NewFolderImageIndex := Value;
end;

procedure TATdxNativeFileSelector.SetOnAcceptButtonClick(
  const Value: TNotifyEvent);
begin
  FFrame.OnAcceptButtonClick := Value;
end;

procedure TATdxNativeFileSelector.SetOnCancelButtonClick(
  const Value: TNotifyEvent);
begin
  FFrame.OnCancelButtonClick := Value;
end;

procedure TATdxNativeFileSelector.SetOnExecuteItem(
  const Value: TcxShellExecuteItemEvent);
begin
  FFrame.OnExecuteItem := Value;
end;

procedure TATdxNativeFileSelector.SetParentFolderButtonHint(const Value:
    String);
begin
  FFrame.ParentFolderButtonHint := Value;
end;

procedure TATdxNativeFileSelector.SetParentFolderImageIndex(
  const Value: System.UITypes.TImageIndex);
begin
  FFrame.ParentFolderImageIndex := Value;
end;

procedure TATdxNativeFileSelector.SetRefreshButtonHint(const Value: String);
begin
  FFrame.RefreshButtonHint := Value;
end;

procedure TATdxNativeFileSelector.SetRefreshImageIndex(
  const Value: System.UITypes.TImageIndex);
begin
  FFrame.RefreshImageIndex := Value;
end;

procedure TATdxNativeFileSelector.SetViewMode(const Value:
    TATFileSelectorViewMode);
begin
  FFrame.ViewMode := Value;
end;

procedure TATdxNativeFileSelector.SetViewsButtonHint(const Value: String);
begin
  FFrame.ViewsButtonHint := Value;
end;

procedure TATdxNativeFileSelector.SetViewsDropDownMenu(const Value: TComponent);
begin
  FFrame.ViewsDropDownMenu := Value;
end;

procedure TATdxNativeFileSelector.SetViewsImageIndex(const Value:
    System.UITypes.TImageIndex);
begin
  FFrame.ViewsImageIndex := Value;
end;

procedure TATdxNativeFileSelector.SetZipFilesAreFolders(const Value: Boolean);
begin
  FFrame.ZipFilesAreFolders := Value;
end;

function TATdxNativeFileSelector._IsAcceptButtonCaptionStored: Boolean;
begin
  Result := ( NOT SameStr(AcceptButtonCaption, 'Accept') );
end;

function TATdxNativeFileSelector._IsAcceptButtonHintStored: Boolean;
begin
  Result := ( NOT AcceptButtonHint.IsEmpty );
end;

function TATdxNativeFileSelector._IsCancelButtonCaptionStored: Boolean;
begin
  Result := ( NOT SameStr(CancelButtonCaption, 'Cancel') );
end;

function TATdxNativeFileSelector._IsCancelButtonHintStored: Boolean;
begin
  Result := ( NOT CancelButtonHint.IsEmpty );
end;

function TATdxNativeFileSelector._IsFilterStored: Boolean;
var
  ADefFilter: String;
begin
  ADefFilter := AT.Vcl.DX.NativeFileSelector.Frame.cAllFilesFilter;

  Result := ( NOT SameStr(Filter, ADefFilter) );
end;

function TATdxNativeFileSelector._IsNewFolderButtonCaptionStored: Boolean;
begin
  Result := ( NOT SameStr(NewFolderButtonCaption, 'New Folder') );
end;

function TATdxNativeFileSelector._IsNewFolderButtonHintStored: Boolean;
begin
  Result := ( NOT NewFolderButtonHint.IsEmpty );
end;

function TATdxNativeFileSelector._IsParentFolderButtonHintStored: Boolean;
begin
  Result := ( NOT ParentFolderButtonHint.IsEmpty );
end;

function TATdxNativeFileSelector._IsRefreshButtonHintStored: Boolean;
begin
  Result := ( NOT RefreshButtonHint.IsEmpty );
end;

function TATdxNativeFileSelector._IsViewsButtonHintStored: Boolean;
begin
  Result := ( NOT ViewsButtonHint.IsEmpty );
end;

end.
