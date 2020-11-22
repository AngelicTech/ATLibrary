unit AT.Vcl.DX.FileSelector;

interface

uses
  System.Classes, System.UITypes, System.Generics.Collections,
  System.SysUtils, System.Rtti, System.Variants,
  Vcl.Controls, Vcl.ImgList, Vcl.ComCtrls,
  cxGraphics, cxControls, cxGroupBox, cxButtons, cxLookAndFeels,
  cxSplitter, cxScrollBox, cxTextEdit, cxLabel, cxDropDownEdit,
  ShellLink, JamShellBreadCrumbBar, ShellControls, Jam.Shell.Types;

type
  TATdxFileSelectorBCFlag = (
      fsbcfAutomaticRefresh,
      fsbcfFileSystemOnly,
      fsbcfHasComboButton,
      fsbcfOpenFilesExternally,
      fsbcfReadOnly,
      fsbcfShowErrorMessages,
      fsbcfShowHidden,
      fsbcfShowHistoryPane,
      fsbcfShowRefreshButton,
      fsbcfShowSearchEdit
    );
  TATdxFileSelectorBCFlags = set of TATdxFileSelectorBCFlag;

  TATdxFileSelectorListFlag = (
      fslfAutomaticRefresh,
      fslfCheckboxes,
      fslfColorCompressed,
      fslfColorEncrypted,
      fslfDetails,
      fslfFileSystemOnly,
      fslfGridlines,
      fslfHideSelection,
      fslfHotTrack,
      fslfIconsBasedOnFileExtension,
      fslfReadOnly,
      fslfRowSelect,
      fslfShellContextMenu,
      fslfShowColumnHeaders,
      fslfShowContextMenuOnTop,
      fslfShowErrorMessages,
      fslfShowFiles,
      fslfShowFolders,
      fslfShowHeaderContextMenu,
      fslfShowHidden,
      fslfShowNethood,
      fslfShowOverlayIcons,
      fslfShowParentFolder,
      fslfShowRecycleBin,
      fslfShowShellNames,
      fslfThumbnails
    );
  TATdxFileSelectorListFlags = set of TATdxFileSelectorListFlag;

  TATdxFileSelectorTreeFlag = (
      fstfAutomaticRefresh,
      fstfCheckboxes,
      fstfColorCompressed,
      fstfColorEncrypted,
      fstfExpandOnSelected,
      fstfFileSystemOnly,
      fstfHotTrack,
      fstfReadOnly,
      fstfRightClickSelect,
      fstfRowSelect,
      fstfShellContextMenu,
      fstfShowButtons,
      fstfShowContextMenuOnTop,
      fstfShowErrorMessages,
      fstfShowFiles,
      fstfShowHidden,
      fstfShowLines,
      fstfShowNethood,
      fstfShowOverlayIcons,
      fstfShowRecycleBin,
      fstfShowRoot,
      fstfShowShellNames,
      fstfToolTips
    );
  TATdxFileSelectorTreeFlags = set of TATdxFileSelectorTreeFlag;

  TATFSNewFolderButtonClickEvent = procedure(Sender: TObject;
      var AName: String; var AEditing: Boolean;
      var AHandled: Boolean) of object;

  TATOnShowMessageEvent = procedure(Sender: TObject;
      const AMessage: String) of object;

  TATViewStyle = (atvsIcon, atvsList, atvsReport);



const
  cDefFileSelectorBCFlags = [
      fsbcfAutomaticRefresh,
      fsbcfFileSystemOnly,
      fsbcfHasComboButton,
      fsbcfShowHistoryPane,
      fsbcfShowRefreshButton,
      fsbcfShowSearchEdit
    ];

  cDefFileSelectorListFlags = [
      fslfAutomaticRefresh,
      fslfDetails,
      fslfHideSelection,
      fslfRowSelect,
      fslfShellContextMenu,
      fslfShowColumnHeaders,
      fslfShowFiles,
      fslfShowFolders,
      fslfShowHeaderContextMenu,
      fslfShowNethood,
      fslfShowOverlayIcons,
      fslfShowRecycleBin,
      fslfShowShellNames
    ];

  cDefFileSelectorTreeFlags = [
      fstfAutomaticRefresh,
      fstfRightClickSelect,
      fstfRowSelect,
      fstfShellContextMenu,
      fstfShowButtons,
      fstfShowNethood,
      fstfShowOverlayIcons,
      fstfShowRecycleBin,
      fstfShowRoot,
      fstfShowShellNames,
      fstfToolTips
    ];


type
  [ComponentPlatformsAttribute(pidWin32 OR pidWin64)]
  TATdxFileSelector = class(TcxControl)
  strict private
    FAcceptButton: TcxButton;
    FBreadCrumbBar: TJamShellBreadCrumbBar;
    FButtonsLayout: TcxGroupBox;
    FCancelButton: TcxButton;
    FCommandLayout: TcxGroupBox;
    FEditsLayout: TcxGroupBox;
    FFileName: System.SysUtils.TFileName;
    FFileNameEdit: TcxTextEdit;
    FFileNameLabel: TcxLabel;
    FFileTypeCombo: TcxComboBox;
    FFileTypeLabel: TcxLabel;
    FFilter: string;
    FFilterDict: TDictionary<String, String>;
    FFilterIndex: Integer;
    FLargeImageList: TCustomImageList;
    FLeftPaneLayout: TcxGroupBox;
    FMainLayout: TcxScrollBox;
    FNewFolderButton: TcxButton;
    FOnAcceptButtonClick: TNotifyEvent;
    FOnCancelButtonClick: TNotifyEvent;
    FOnNewFolderButtonClick: TATFSNewFolderButtonClickEvent;
    FOnShowMessage: TATOnShowMessageEvent;
    FRightPaneLayout: TcxGroupBox;
    FShellLink: TJamShellLink;
    FShellList: TJamShellList;
    FShellTree: TJamShellTree;
    FSmallImageList: TCustomImageList;
    FSplitter: TcxSplitter;
    FUseSkins: Boolean;
    FViewStyleButton: TcxButton;
    procedure AcceptButtonClickHandler(Sender: TObject);
    procedure CancelButtonClickHandler(Sender: TObject);
    procedure DoAcceptButtonClick;
    procedure DoCancelButtonClick;
    procedure DoNewFolderButtonClick;
    procedure DoShowMessage(const AMessage: String);
    procedure FileTypeChangedHandler(Sender: TObject);
    function GetAcceptButtonCaption: TCaption;
    function GetAcceptButtonEnabled: Boolean;
    function GetAcceptButtonHint: String;
    function GetAcceptButtonImageIndex: TcxImageIndex;
    function GetAcceptButtonVisible: Boolean;
    function GetAcceptButtonWidth: Integer;
    function GetAutoArrangeIcons: Boolean;
    function GetBreadCrumbFlags: TATdxFileSelectorBCFlags;
    function GetCancelButtonCaption: TCaption;
    function GetCancelButtonEnabled: Boolean;
    function GetCancelButtonHint: String;
    function GetCancelButtonImageIndex: TcxImageIndex;
    function GetCancelButtonVisible: Boolean;
    function GetCancelButtonWidth: Integer;
    function GetFileName: System.SysUtils.TFileName;
    function GetFileNameHint: String;
    function GetFileTypeDropDownSizeable: Boolean;
    function GetFileTypeHint: String;
    function GetFileTypeWidth: Integer;
    function GetFilter: String;
    function GetFilterIndex: Integer;
    function GetListFlags: TATdxFileSelectorListFlags;
    function GetListViewExtraLargeIcons: Boolean;
    function GetListViewJumboIcons: Boolean;
    function GetListViewStyle: TATViewStyle;
    function GetNewFolderButtonCaption: TCaption;
    function GetNewFolderButtonEnabled: Boolean;
    function GetNewFolderButtonHint: String;
    function GetNewFolderButtonVisible: Boolean;
    function GetNewFolderButtonWidth: Integer;
    function GetThumbnailHeight: Integer;
    function GetThumbnailWidth: Integer;
    function GetTreeFlags: TATdxFileSelectorTreeFlags;
    function GetViewsButtonHint: String;
    function GetViewsButtonImageIndex: TcxImageIndex;
    function GetViewsDropDownMenu: TComponent;
    procedure NewFolderButtonClickHandler(Sender: TObject);
    procedure SetAcceptButtonCaption(const Value: TCaption);
    procedure SetAcceptButtonEnabled(const Value: Boolean);
    procedure SetAcceptButtonHint(const Value: String);
    procedure SetAcceptButtonImageIndex(const Value: TcxImageIndex);
    procedure SetAcceptButtonVisible(const Value: Boolean);
    procedure SetAcceptButtonWidth(const Value: Integer);
    procedure SetAutoArrangeIcons(const Value: Boolean);
    procedure SetBreadCrumbFlags(const Value: TATdxFileSelectorBCFlags);
    procedure SetCancelButtonCaption(const Value: TCaption);
    procedure SetCancelButtonEnabled(const Value: Boolean);
    procedure SetCancelButtonHint(const Value: String);
    procedure SetCancelButtonImageIndex(const Value: TcxImageIndex);
    procedure SetCancelButtonVisible(const Value: Boolean);
    procedure SetCancelButtonWidth(const Value: Integer);
    procedure SetFileName(const Value: System.SysUtils.TFileName);
    procedure SetFileNameHint(const Value: String);
    procedure SetFileTypeDropDownSizeable(const Value: Boolean);
    procedure SetFileTypeHint(const Value: String);
    procedure SetFileTypeWidth(const Value: Integer);
    procedure SetFilter(const Value: String);
    procedure SetFilterIndex(const Value: Integer);
    procedure SetLargeImageList(const Value: TCustomImageList);
    procedure SetListFlags(const Value: TATdxFileSelectorListFlags);
    procedure SetListViewExtraLargeIcons(const Value: Boolean);
    procedure SetListViewJumboIcons(const Value: Boolean);
    procedure SetListViewStyle(const Value: TATViewStyle);
    procedure SetNewFolderButtonCaption(const Value: TCaption);
    procedure SetNewFolderButtonEnabled(const Value: Boolean);
    procedure SetNewFolderButtonHint(const Value: String);
    procedure SetNewFolderButtonVisible(const Value: Boolean);
    procedure SetNewFolderButtonWidth(const Value: Integer);
    procedure SetSmallImageList(const Value: TCustomImageList);
    procedure SetThumbnailHeight(const Value: Integer);
    procedure SetThumbnailWidth(const Value: Integer);
    procedure SetTreeFlags(const Value: TATdxFileSelectorTreeFlags);
    procedure SetViewsButtonHint(const Value: String);
    procedure SetViewsButtonImageIndex(const Value: TcxImageIndex);
    procedure SetViewsDropDownMenu(const Value: TComponent);
    procedure ShellLinkChangeHandler(Sender: TObject; const pItemIdList:
    IItemIdList);
    procedure ShellListSelectItemHandler(Sender: TObject; Item:
        TListItem; Selected: Boolean);
    procedure _AttachComponentEventHandlers;
    procedure _AttachNotifyEventHandler(AObject: TObject; AHandler:
        TNotifyEvent; const AEventName: String);
    procedure _AttachOnClickHandler(AObject: TObject; AHandler:
        TNotifyEvent);
    procedure _AttachShellListSelectItemHandler;
    procedure _CreateControls;
    procedure _FreeControls;
    procedure _ProcessAndLoadFilters;
    procedure _RepositionCancelButton(const Value: Boolean);
    function _SetPropertyValue(AObject: TObject; AProperty: String;
        const AValue: TValue): Boolean;
    procedure _UpdateFileName(const AFileName: String);
  private
    function _IsArchiveFolder(const APath: String): Boolean;
  strict protected
    function GetEditorBGColor: TColor; virtual;
    function GetEditorTextColor: TColor; virtual;
    function GetUseSkins: Boolean;
    procedure LookAndFeelChanged(Sender: TcxLookAndFeel;
        AChangedValues: TcxLookAndFeelValues); override;
    procedure Resize; override;
    procedure SetUseSkins(const Value: Boolean);
    function _CreateBreadCrumbBar(AParent: TWinControl; AShellLink:
        TJamShellLink): TJamShellBreadCrumbBar; virtual;
    function _CreateButton(AParent: TWinControl;
        const ACaption: String; AAlign: TAlign = alNone;
        AMarginLeft: Integer = 0; AMarginTop: Integer = 0;
        AMarginRight: Integer = 0; AMarginBottom: Integer = 0;
        AHeight: Integer = -1; AWidth: Integer = -1;
        APaintStyle: TcxButtonPaintStyle = bpsDefault;
        AKind: TcxButtonKind = cxbkStandard): TcxButton; virtual;
    function _CreateFileNameEdit(AParent: TWinControl): TcxTextEdit;
        virtual;
    function _CreateFileTypeCombo(AParent: TWinControl): TcxComboBox;
        virtual;
    function _CreateLabel(AParent: TWinControl;
        const ACaption: String; AFocusControl: TWinControl = NIL;
        AAlign: TAlign = alNone; AMarginLeft: Integer = 0;
        AMarginTop: Integer = 0; AMarginRight: Integer = 0;
        AMarginBottom: Integer = 0): TcxLabel; virtual;
    function _CreateLayoutBox(AParent: TWinControl;
        AAlign: TAlign = alNone; AMarginLeft: Integer = 0;
        AMarginTop: Integer = 0; AMarginRight: Integer = 0;
        AMarginBottom: Integer = 0; AHeight: Integer = -1;
        AWidth: Integer = -1): TcxGroupBox; virtual;
    function _CreateMainLayout(AParent: TWinControl;
        AAlign: TAlign = alNone): TcxScrollBox;
    function _CreateShellLink: TJamShellLink; virtual;
    function _CreateShellList(AParent: TWinControl; AShellLink:
        TJamShellLink): TJamShellList; virtual;
    function _CreateShellTree(AParent: TWinControl; AShellLink:
        TJamShellLink): TJamShellTree; virtual;
    function _CreateSplitter(
        AParent: TWinControl): TcxSplitter; virtual;
    procedure _InitControls; virtual;
    procedure _InitFields; virtual;
    procedure _InitMainProperties; virtual;
    function _IsFilterStored: Boolean; virtual;
    procedure _RecolorUIControls; virtual;
    property EditorBGColor: TColor
        read GetEditorBGColor;
    property EditorTextColor: TColor
        read GetEditorTextColor;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure CreateNewFolder(const AName: String = ''; AEditing: Boolean
        = True); virtual;
  published
    property AcceptButtonCaption: TCaption
        read GetAcceptButtonCaption
        write SetAcceptButtonCaption;
    property AcceptButtonEnabled: Boolean
        read GetAcceptButtonEnabled
        write SetAcceptButtonEnabled
        default True;
    property AcceptButtonHint: String
        read GetAcceptButtonHint
        write SetAcceptButtonHint;
    property AcceptButtonImageIndex: TcxImageIndex
        read GetAcceptButtonImageIndex
        write SetAcceptButtonImageIndex
        default -1;
    property AcceptButtonVisible: Boolean
        read GetAcceptButtonVisible
        write SetAcceptButtonVisible
        default True;
    property AcceptButtonWidth: Integer
        read GetAcceptButtonWidth
        write SetAcceptButtonWidth
        default 80;
    property Align;
    property AutoArrangeIcons: Boolean
        read GetAutoArrangeIcons
        write SetAutoArrangeIcons
        default True;
    property BreadCrumbFlags: TATdxFileSelectorBCFlags
        read GetBreadCrumbFlags
        write SetBreadCrumbFlags
        default cDefFileSelectorBCFlags;
    property CancelButtonCaption: TCaption
        read GetCancelButtonCaption
        write SetCancelButtonCaption;
    property CancelButtonEnabled: Boolean
        read GetCancelButtonEnabled
        write SetCancelButtonEnabled
        default True;
    property CancelButtonHint: String
        read GetCancelButtonHint
        write SetCancelButtonHint;
    property CancelButtonImageIndex: TcxImageIndex
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
        default 80;
    property FileName: System.SysUtils.TFileName
        read GetFileName
        write SetFileName;
    property FileNameHint: String
        read GetFileNameHint
        write SetFileNameHint;
    property FileTypeDropDownSizeable: Boolean
        read GetFileTypeDropDownSizeable
        write SetFileTypeDropDownSizeable
        default True;
    property FileTypeHint: String
        read GetFileTypeHint
        write SetFileTypeHint;
    property FileTypeWidth: Integer
        read GetFileTypeWidth
        write SetFileTypeWidth
        default 150;
    property Filter: String
        read GetFilter
        write SetFilter
        stored _IsFilterStored;
    property FilterIndex: Integer
        read GetFilterIndex
        write SetFilterIndex
        default 1;
    property LargeImageList: TCustomImageList
        read FLargeImageList
        write SetLargeImageList;
    property ListFlags: TATdxFileSelectorListFlags
        read GetListFlags
        write SetListFlags
        default cDefFileSelectorListFlags;
    property ListViewExtraLargeIcons: Boolean
        read GetListViewExtraLargeIcons
        write SetListViewExtraLargeIcons
        default False;
    property ListViewJumboIcons: Boolean
        read GetListViewJumboIcons
        write SetListViewJumboIcons
        default False;
    property ListViewStyle: TATViewStyle
        read GetListViewStyle
        write SetListViewStyle
        default atvsReport;
    property LookAndFeel;
    property NewFolderButtonCaption: TCaption
        read GetNewFolderButtonCaption
        write SetNewFolderButtonCaption;
    property NewFolderButtonEnabled: Boolean
        read GetNewFolderButtonEnabled
        write SetNewFolderButtonEnabled
        default True;
    property NewFolderButtonHint: String
        read GetNewFolderButtonHint
        write SetNewFolderButtonHint;
    property NewFolderButtonVisible: Boolean
        read GetNewFolderButtonVisible
        write SetNewFolderButtonVisible
        default True;
    property NewFolderButtonWidth: Integer
        read GetNewFolderButtonWidth
        write SetNewFolderButtonWidth
        default 80;
    property ParentShowHint;
    property ShowHint;
    property SmallImageList: TCustomImageList
        read FSmallImageList
        write SetSmallImageList;
    property ThumbnailHeight: Integer
        read GetThumbnailHeight
        write SetThumbnailHeight
        default 96;
    property ThumbnailWidth: Integer
        read GetThumbnailWidth
        write SetThumbnailWidth
        default 96;
    property TreeFlags: TATdxFileSelectorTreeFlags
        read GetTreeFlags
        write SetTreeFlags
        default cDefFileSelectorTreeFlags;
    property UseSkins: Boolean
        read GetUseSkins
        write SetUseSkins
        default True;
    property ViewsButtonHint: String
        read GetViewsButtonHint
        write SetViewsButtonHint;
    property ViewsButtonImageIndex: TcxImageIndex
        read GetViewsButtonImageIndex
        write SetViewsButtonImageIndex
        default -1;
    property ViewsDropDownMenu: TComponent
        read GetViewsDropDownMenu
        write SetViewsDropDownMenu;
    property Visible;
    property OnAcceptButtonClick: TNotifyEvent
        read FOnAcceptButtonClick
        write FOnAcceptButtonClick;
    property OnCancelButtonClick: TNotifyEvent
        read FOnCancelButtonClick
        write FOnCancelButtonClick;
    property OnNewFolderButtonClick: TATFSNewFolderButtonClickEvent
        read FOnNewFolderButtonClick
        write FOnNewFolderButtonClick;
    property OnShowMessage: TATOnShowMessageEvent
        read FOnShowMessage
        write FOnShowMessage;
  end;

implementation

uses
  System.Math, System.Types, System.StrUtils,
  Vcl.Graphics, Winapi.Windows,
  cxEdit;


constructor TATdxFileSelector.Create(AOwner: TComponent);
begin
  inherited;

  _InitFields;

  _InitMainProperties;

  _CreateControls;

  _InitControls;

  _RecolorUIControls;

  _AttachComponentEventHandlers;
end;

destructor TATdxFileSelector.Destroy;
begin

  FBreadCrumbBar.ShellLink := NIL;
  FShellList.ShellLink := NIL;
  FShellTree.ShellLink := NIL;

  FFileTypeCombo.Properties.OnChange := NIL;

  FShellLink.OnChange := NIL;

  FShellList.OnSelectItem := NIL;

  _FreeControls;

  FreeAndNil(FFilterDict);

  inherited;
end;

procedure TATdxFileSelector.AcceptButtonClickHandler(Sender: TObject);
begin
  DoAcceptButtonClick;
end;

procedure TATdxFileSelector.CancelButtonClickHandler(Sender: TObject);
begin
  DoCancelButtonClick;
end;

procedure TATdxFileSelector.CreateNewFolder(const AName: String = '';
    AEditing: Boolean = True);
begin
  if (NOT Assigned(FShellList)) then
    Exit;

  FShellList.CreateDir(AName, AEditing);
end;

procedure TATdxFileSelector.DoAcceptButtonClick;
begin
  if Assigned(FOnAcceptButtonClick) then
    FOnAcceptButtonClick(Self);
end;

procedure TATdxFileSelector.DoCancelButtonClick;
begin
  if Assigned(FOnCancelButtonClick) then
    FOnCancelButtonClick(Self);
end;

procedure TATdxFileSelector.DoNewFolderButtonClick;
var
  AEditing: Boolean;
  AHandled: Boolean;
  AName: String;
begin
  AName := EmptyStr;
  AEditing := True;
  AHandled := False;

  if (Assigned(FOnNewFolderButtonClick)) then
    FOnNewFolderButtonClick(Self, AName, AEditing, AHandled);

  if (AHandled) then
    Exit;

  Self.CreateNewFolder(AName, AEditing);
end;

procedure TATdxFileSelector.DoShowMessage(const AMessage: String);
begin
  if Assigned(FOnShowMessage) then
    FOnShowMessage(Self, AMessage);
end;

procedure TATdxFileSelector.FileTypeChangedHandler(Sender: TObject);
var
  AFilter: String;
  AVal: String;
  Idx: Integer;
begin

  Idx := FFileTypeCombo.ItemIndex;

  if (Idx < 0) then
    exit;

  AVal := FFileTypeCombo.Properties.Items[Idx];

  AFilter := FFilterDict.Items[AVal];

  if (Assigned(FShellTree)) then
    FShellTree.Filter := AFilter;

  if (Assigned(FShellList)) then
    FShellList.Filter := AFilter;

end;

function TATdxFileSelector.GetAcceptButtonCaption: TCaption;
begin
  if (NOT Assigned(FAcceptButton)) then
    Exit(EmptyStr);

  Result := FAcceptButton.Caption;
end;

function TATdxFileSelector.GetAcceptButtonEnabled: Boolean;
begin
  if (NOT Assigned(FAcceptButton)) then
    Exit(False);

  Result := FAcceptButton.Enabled;
end;

function TATdxFileSelector.GetAcceptButtonHint: String;
begin
  if (NOT Assigned(FAcceptButton)) then
    Exit(EmptyStr);

  Result := FAcceptButton.Hint;
end;

function TATdxFileSelector.GetAcceptButtonImageIndex: TcxImageIndex;
begin
  if (NOT Assigned(FAcceptButton)) then
    Exit(-1);

  Result := FAcceptButton.OptionsImage.ImageIndex;
end;

function TATdxFileSelector.GetAcceptButtonVisible: Boolean;
begin
  if (NOT Assigned(FAcceptButton)) then
    Exit(False);

  Result := FAcceptButton.Visible;
end;

function TATdxFileSelector.GetAcceptButtonWidth: Integer;
begin
  if (NOT Assigned(FAcceptButton)) then
    Exit(0);

  Result := FAcceptButton.Width;
end;

function TATdxFileSelector.GetAutoArrangeIcons: Boolean;
begin
  if (NOT Assigned(FShellList)) then
    Exit(False);

  Result := FShellList.IconOptions.AutoArrange;
end;

function TATdxFileSelector.GetBreadCrumbFlags:
    TATdxFileSelectorBCFlags;
begin
  Result := [];

  if (NOT Assigned(FBreadCrumbBar)) then
    Exit(Result);

  with FBreadCrumbBar do
    begin
      if (AutomaticRefresh) then
        Include(Result, fsbcfAutomaticRefresh);

      if (FileSystemOnly) then Include(Result, fsbcfFileSystemOnly);
      if (HasComboButton) then Include(Result, fsbcfHasComboButton);

      if (OpenFilesExternally) then
        Include(Result, fsbcfOpenFilesExternally);

      if (ReadOnly) then Include(Result, fsbcfReadOnly);

      if (ShowErrorMessages) then
        Include(Result, fsbcfShowErrorMessages);

      if (ShowHidden) then Include(Result, fsbcfShowHidden);

      if (HistoryPane.Visible) then
        Include(Result, fsbcfShowHistoryPane);

      if (RefreshButton.Visible) then
        Include(Result, fsbcfShowRefreshButton);

      if (SearchEdit.Visible) then
        Include(Result, fsbcfShowSearchEdit);
    end;
end;

function TATdxFileSelector.GetCancelButtonCaption: TCaption;
begin
  if (NOT Assigned(FCancelButton)) then
    Exit(EmptyStr);

  Result := FCancelButton.Caption;
end;

function TATdxFileSelector.GetCancelButtonEnabled: Boolean;
begin
  if (NOT Assigned(FCancelButton)) then
    Exit(False);

  Result := FCancelButton.Enabled;
end;

function TATdxFileSelector.GetCancelButtonHint: String;
begin
  if (NOT Assigned(FCancelButton)) then
    Exit(EmptyStr);

  Result := FCancelButton.Hint;
end;

function TATdxFileSelector.GetCancelButtonImageIndex: TcxImageIndex;
begin
  if (NOT Assigned(FCancelButton)) then
    Exit(-1);

  Result := FCancelButton.OptionsImage.ImageIndex;
end;

function TATdxFileSelector.GetCancelButtonVisible: Boolean;
begin
  if (NOT Assigned(FCancelButton)) then
    Exit(False);

  Result := FCancelButton.Visible;
end;

function TATdxFileSelector.GetCancelButtonWidth: Integer;
begin
  if (NOT Assigned(FCancelButton)) then
    Exit(0);

  Result := FCancelButton.Width;
end;

function TATdxFileSelector.GetEditorBGColor: TColor;
begin
  if (NOT UseSkins) then
    Exit(clWindow);

  Result := LookAndFeelPainter.DefaultEditorBackgroundColor(
      NOT Self.Enabled);
end;

function TATdxFileSelector.GetEditorTextColor: TColor;
begin
  if (NOT UseSkins) then
    Exit(clWindowText);

  Result := LookAndFeelPainter.DefaultEditorTextColor(
      NOT Self.Enabled);
end;

function TATdxFileSelector.GetFileName: System.SysUtils.TFileName;
begin
  Result := FFileName;
end;

function TATdxFileSelector.GetFileNameHint: String;
begin
  if (NOT Assigned(FFileNameEdit)) then
    Exit(EmptyStr);

  Result := FFileNameEdit.Hint;
end;

function TATdxFileSelector.GetFileTypeDropDownSizeable: Boolean;
begin
  if (NOT Assigned(FFileTypeCombo)) then
    Exit(True);

  Result := FFileTypeCombo.Properties.DropDownSizeable;
end;

function TATdxFileSelector.GetFileTypeHint: String;
begin
  if (NOT Assigned(FFileTypeCombo)) then
    Exit(EmptyStr);

  Result := FFileTypeCombo.Hint;
end;

function TATdxFileSelector.GetFileTypeWidth: Integer;
begin
  if (NOT Assigned(FFileTypeCombo)) then
    Exit(150);

  Result := FFileTypeCombo.Width;
end;

function TATdxFileSelector.GetFilter: String;
begin
  Result := FFilter;
end;

function TATdxFileSelector.GetFilterIndex: Integer;
begin
  if (FFileTypeCombo.Properties.Items.Count > 0) then
    Result := FFileTypeCombo.ItemIndex + 1
  else
    Result := FFilterIndex;
end;

function TATdxFileSelector.GetListFlags: TATdxFileSelectorListFlags;
begin
  Result := [];

  if (NOT Assigned(FShellList)) then
    Exit(Result);

  with FShellList do
    begin
      if (AutomaticRefresh) then
        Include(Result, fslfAutomaticRefresh);

      if (Checkboxes) then Include(Result, fslfCheckboxes);
      if (ColorCompressed) then Include(Result, fslfColorCompressed);
      if (ColorEncrypted) then Include(Result, fslfColorEncrypted);
      if (Details) then Include(Result, fslfDetails);
      if (FileSystemOnly) then Include(Result, fslfFileSystemOnly);
      if (GridLines) then Include(Result, fslfGridlines);
      if (HideSelection) then Include(Result, fslfHideSelection);
      if (HotTrack) then Include(Result, fslfHotTrack);

      if (IconsBasedOnFileExtension) then
        Include(Result, fslfIconsBasedOnFileExtension);

      if (ReadOnly) then Include(Result, fslfReadOnly);
      if (RowSelect) then Include(Result, fslfRowSelect);

      if (ShellContextMenu) then
        Include(Result, fslfShellContextMenu);

      if (ShowColumnHeaders) then
        Include(Result, fslfShowColumnHeaders);

      if (ShowContextMenuOnTop) then
        Include(Result, fslfShowContextMenuOnTop);

      if (ShowErrorMessages) then
        Include(Result, fslfShowErrorMessages);

      if (ShowFiles) then Include(Result, fslfShowFiles);
      if (ShowFolders) then Include(Result, fslfShowFolders);

      if (ShowHeaderContextMenu) then
        Include(Result, fslfShowHeaderContextMenu);

      if (ShowHidden) then Include(Result, fslfShowHidden);
      if (ShowNethood) then Include(Result, fslfShowNethood);

      if (ShowOverlayIcons) then
        Include(Result, fslfShowOverlayIcons);

      if (ShowParentFolder) then
        Include(Result, fslfShowParentFolder);

      if (ShowRecycleBin) then Include(Result, fslfShowRecycleBin);
      if (ShowShellNames) then Include(Result, fslfShowShellNames);
      if (Thumbnails) then Include(Result, fslfThumbnails);
    end;
end;

function TATdxFileSelector.GetListViewExtraLargeIcons: Boolean;
begin
  if (NOT Assigned(FShellList)) then
    Exit(False);

  Result := FShellList.ShowExtraLargeIcons;
end;

function TATdxFileSelector.GetListViewJumboIcons: Boolean;
begin
  if (NOT Assigned(FShellList)) then
    Exit(False);

  Result := FShellList.ShowJumboIcons;
end;

function TATdxFileSelector.GetListViewStyle: TATViewStyle;
begin
  if (NOT Assigned(FShellList)) then
    Exit(atvsReport);

  case FShellList.ViewStyle of
    vsIcon     : Result := atvsIcon;
    vsSmallIcon: Result := atvsList;
    vsList     : Result := atvsList;
    vsReport   : Result := atvsReport;
  else
    Result := atvsReport
  end;
end;

function TATdxFileSelector.GetNewFolderButtonCaption: TCaption;
begin
  if (NOT Assigned(FNewFolderButton)) then
    Exit(EmptyStr);

  Result := FNewFolderButton.Caption;
end;

function TATdxFileSelector.GetNewFolderButtonEnabled: Boolean;
begin
  if (NOT Assigned(FNewFolderButton)) then
    Exit(False);

  Result := FNewFolderButton.Enabled;
end;

function TATdxFileSelector.GetNewFolderButtonHint: String;
begin
  if (NOT Assigned(FNewFolderButton)) then
    Exit(EmptyStr);

  Result := FNewFolderButton.Hint;
end;

function TATdxFileSelector.GetNewFolderButtonVisible: Boolean;
begin
  if (NOT Assigned(FNewFolderButton)) then
    Exit(False);

  Result := FNewFolderButton.Visible;
end;

function TATdxFileSelector.GetNewFolderButtonWidth: Integer;
begin
  if (NOT Assigned(FNewFolderButton)) then
    Exit(0);

  Result := FNewFolderButton.Width;
end;

function TATdxFileSelector.GetThumbnailHeight: Integer;
begin
  if (NOT Assigned(FShellList)) then
    Exit(96);

  Result := FShellList.ThumbnailHeight;
end;

function TATdxFileSelector.GetThumbnailWidth: Integer;
begin
  if (NOT Assigned(FShellList)) then
    Exit(96);

  Result := FShellList.ThumbnailWidth;
end;

function TATdxFileSelector.GetTreeFlags: TATdxFileSelectorTreeFlags;
begin
  Result := [];

  if (NOT Assigned(FShellTree)) then
    Exit(Result);

  with FShellTree do
    begin
      if (AutomaticRefresh) then
        Include(Result, fstfAutomaticRefresh);

      if (Checkboxes) then Include(Result, fstfCheckboxes);
      if (ColorCompressed) then Include(Result, fstfColorCompressed);
      if (ColorEncrypted) then Include(Result, fstfColorEncrypted);

      if (ExpandOnSelected) then
        Include(Result, fstfExpandOnSelected);

      if (FileSystemOnly) then Include(Result, fstfFileSystemOnly);
      if (HotTrack) then Include(Result, fstfHotTrack);
      if (ReadOnly) then Include(Result, fstfReadOnly);

      if (RightClickSelect) then
        Include(Result, fstfRightClickSelect);

      if (RowSelect) then Include(Result, fstfRowSelect);

      if (ShellContextMenu) then
        Include(Result, fstfShellContextMenu);

      if (ShowButtons) then Include(Result, fstfShowButtons);

      if (ShowContextMenuOnTop) then
        Include(Result, fstfShowContextMenuOnTop);

      if (ShowErrorMessages) then
        Include(Result, fstfShowErrorMessages);

      if (ShowFiles) then Include(Result, fstfShowFiles);
      if (ShowHidden) then Include(Result, fstfShowHidden);
      if (ShowLines) then Include(Result, fstfShowLines);
      if (ShowNethood) then Include(Result, fstfShowNethood);

      if (ShowOverlayIcons) then
        Include(Result, fstfShowOverlayIcons);

      if (ShowRecycleBin) then Include(Result, fstfShowRecycleBin);
      if (ShowRoot) then Include(Result, fstfShowRoot);
      if (ShowShellNames) then Include(Result, fstfShowShellNames);
      if (ToolTips) then Include(Result, fstfToolTips);
    end;
end;

function TATdxFileSelector.GetUseSkins: Boolean;
begin
  Result := FUseSkins;
end;

function TATdxFileSelector.GetViewsButtonHint: String;
begin
  if (NOT Assigned(FViewStyleButton)) then
    Exit(EmptyStr);

  Result := FViewStyleButton.Hint;
end;

function TATdxFileSelector.GetViewsButtonImageIndex: TcxImageIndex;
begin
  if (NOT Assigned(FViewStyleButton)) then
    Exit(-1);

  Result := FViewStyleButton.OptionsImage.ImageIndex;
end;

function TATdxFileSelector.GetViewsDropDownMenu: TComponent;
begin
  if (NOT Assigned(FViewStyleButton)) then
    Exit(NIL);

  Result := FViewStyleButton.DropDownMenu;
end;

procedure TATdxFileSelector.LookAndFeelChanged(Sender: TcxLookAndFeel;
  AChangedValues: TcxLookAndFeelValues);
begin
  inherited;

  _RecolorUIControls;
end;

procedure TATdxFileSelector.NewFolderButtonClickHandler(Sender:
    TObject);
begin
  DoNewFolderButtonClick;
end;

procedure TATdxFileSelector.Resize;
var
  ANewWid: Integer;
  ARWid: Integer;
  ASpltWid: Integer;
begin
  inherited;

  ASpltWid := FSplitter.Width;
  ARWid := Max(FSplitter.MinSize, FRightPaneLayout.Width);

  ANewWid := Self.Width - (ASpltWid + ARWid);

  ANewWid := Min(FLeftPaneLayout.Width, ANewWid);

  ANewWid := Max(FSplitter.MinSize, ANewWid);

  FLeftPaneLayout.Width := ANewWid;
end;

procedure TATdxFileSelector.SetAcceptButtonCaption(const Value:
    TCaption);
begin
  if (NOT Assigned(FAcceptButton)) then
    Exit;

  FAcceptButton.Caption := Value;
end;

procedure TATdxFileSelector.SetAcceptButtonEnabled(const Value:
    Boolean);
begin
  if (NOT Assigned(FAcceptButton)) then
    Exit;

  FAcceptButton.Enabled := Value;
end;

procedure TATdxFileSelector.SetAcceptButtonHint(const Value: String);
begin
  if (NOT Assigned(FAcceptButton)) then
    Exit;

  FAcceptButton.Hint := Value;
end;

procedure TATdxFileSelector.SetAcceptButtonImageIndex(const Value:
    TcxImageIndex);
begin
  if (NOT Assigned(FAcceptButton)) then
    Exit;

  FAcceptButton.OptionsImage.ImageIndex := Value;
end;

procedure TATdxFileSelector.SetAcceptButtonVisible(const Value:
    Boolean);
begin
  if (NOT Assigned(FAcceptButton)) then
    Exit;

  FAcceptButton.Visible := Value;

  _RepositionCancelButton(Value);
end;

procedure TATdxFileSelector.SetAcceptButtonWidth(const Value:
    Integer);
begin
  if (NOT Assigned(FAcceptButton)) then
    Exit;

  FAcceptButton.Width := Value;
end;

procedure TATdxFileSelector.SetAutoArrangeIcons(const Value: Boolean);
begin
  if (NOT Assigned(FShellList)) then
    Exit;

  FShellList.IconOptions.AutoArrange := Value;
end;

procedure TATdxFileSelector.SetBreadCrumbFlags(const Value:
    TATdxFileSelectorBCFlags);
begin
  if (NOT Assigned(FBreadCrumbBar)) then
    Exit;

  with FBreadCrumbBar do
    begin
      AutomaticRefresh := (fsbcfAutomaticRefresh IN Value);
      FileSystemOnly := (fsbcfFileSystemOnly IN Value);
      HasComboButton := (fsbcfHasComboButton IN Value);
      OpenFilesExternally := (fsbcfOpenFilesExternally IN Value);
      ReadOnly := (fsbcfReadOnly IN Value);
      ShowErrorMessages := (fsbcfShowErrorMessages IN Value);
      ShowHidden := (fsbcfShowHidden IN Value);
      HistoryPane.Visible := (fsbcfShowHistoryPane IN Value);
      RefreshButton.Visible := (fsbcfShowRefreshButton IN Value);
      SearchEdit.Visible := (fsbcfShowSearchEdit IN Value);

      Invalidate;
    end;
end;

procedure TATdxFileSelector.SetCancelButtonCaption(
  const Value: TCaption);
begin
  if (NOT Assigned(FCancelButton)) then
    Exit;

  FCancelButton.Caption := Value;
end;

procedure TATdxFileSelector.SetCancelButtonEnabled(
  const Value: Boolean);
begin
  if (NOT Assigned(FCancelButton)) then
    Exit;

  FCancelButton.Enabled := Value;
end;

procedure TATdxFileSelector.SetCancelButtonHint(const Value: String);
begin
  if (NOT Assigned(FCancelButton)) then
    Exit;

  FCancelButton.Hint := Value;
end;

procedure TATdxFileSelector.SetCancelButtonImageIndex(
  const Value: TcxImageIndex);
begin
  if (NOT Assigned(FCancelButton)) then
    Exit;

  FCancelButton.OptionsImage.ImageIndex := Value;
end;

procedure TATdxFileSelector.SetCancelButtonVisible(
  const Value: Boolean);
begin
  if (NOT Assigned(FCancelButton)) then
    Exit;

  FCancelButton.Visible := Value;

  _RepositionCancelButton(Value);
end;

procedure TATdxFileSelector.SetCancelButtonWidth(
  const Value: Integer);
begin
  if (NOT Assigned(FCancelButton)) then
    Exit;

  FCancelButton.Width := Value;
end;

procedure TATdxFileSelector.SetFileName(const Value:
    System.SysUtils.TFileName);
begin
  FFileName := Value;
end;

procedure TATdxFileSelector.SetFileNameHint(const Value: String);
begin
  if (Assigned(FFileNameEdit)) then
    FFileNameEdit.Hint := Value;

  if (Assigned(FFileNameLabel)) then
    FFileNameLabel.Hint := Value;
end;

procedure TATdxFileSelector.SetFileTypeDropDownSizeable(const Value:
    Boolean);
begin
  if (NOT Assigned(FFileTypeCombo)) then
    Exit;

  FFileTypeCombo.Properties.DropDownSizeable := Value;
end;

procedure TATdxFileSelector.SetFileTypeHint(const Value: String);
begin
  if (Assigned(FFileTypeCombo)) then
    FFileTypeCombo.Hint := Value;

  if (Assigned(FFileTypeLabel)) then
    FFileTypeLabel.Hint := Value;
end;

procedure TATdxFileSelector.SetFileTypeWidth(const Value: Integer);
begin
  if (NOT Assigned(FFileTypeCombo)) then
    Exit;

  FFileTypeCombo.Width := Value;
end;

procedure TATdxFileSelector.SetFilter(const Value: String);
begin
  if (Value.IsEmpty) then
    FFilter := 'All Files (*.*)*.*'
  else
    FFilter := Value;

  _ProcessAndLoadFilters;
end;

procedure TATdxFileSelector.SetFilterIndex(const Value: Integer);
var
  ACount: Integer;
begin
  ACount := FFileTypeCombo.Properties.Items.Count;

  if (ACount > 0) then
    begin
      if (Value >= ACount) then
        begin
          FFilterIndex := ACount;
          FFileTypeCombo.ItemIndex := (ACount - 1);
        end
      else if (Value < 1) then
        begin
          FFilterIndex := 1;
          FFileTypeCombo.ItemIndex := 0;
        end
      else
        begin
          FFilterIndex := Value;
          FFileTypeCombo.ItemIndex := (Value - 1);
        end;
    end
  else
    FFilterIndex := 1;
end;

procedure TATdxFileSelector.SetLargeImageList(const Value:
    TCustomImageList);
begin
  FLargeImageList := Value;

  if (Assigned(FAcceptButton)) then
    FAcceptButton.OptionsImage.Images := Value;

  if (Assigned(FCancelButton)) then
    FCancelButton.OptionsImage.Images := Value;
end;

procedure TATdxFileSelector.SetListFlags(const Value:
    TATdxFileSelectorListFlags);
begin
  if (NOT Assigned(FShellList)) then
    Exit;

  with FShellList do
    begin
      AutomaticRefresh := (fslfAutomaticRefresh IN Value);
      Checkboxes := (fslfCheckboxes IN Value);
      ColorCompressed := (fslfColorCompressed IN Value);
      ColorEncrypted := (fslfColorEncrypted IN Value);
      Details := (fslfDetails IN Value);
      FileSystemOnly := (fslfFileSystemOnly IN Value);
      GridLines := (fslfGridlines IN Value);
      HideSelection := (fslfHideSelection IN Value);
      HotTrack := (fslfHotTrack IN Value);

      IconsBasedOnFileExtension :=
          (fslfIconsBasedOnFileExtension IN Value);

      ReadOnly := (fslfReadOnly IN Value);
      RowSelect := (fslfRowSelect IN Value);
      ShellContextMenu := (fslfShellContextMenu IN Value);
      ShowColumnHeaders := (fslfShowColumnHeaders IN Value);
      ShowContextMenuOnTop := (fslfShowContextMenuOnTop IN Value);
      ShowErrorMessages := (fslfShowErrorMessages IN Value);
      ShowFiles := (fslfShowFiles IN Value);
      ShowFolders := (fslfShowFolders IN Value);
      ShowHeaderContextMenu := (fslfShowHeaderContextMenu IN Value);
      ShowHidden := (fslfShowHidden IN Value);
      ShowNethood := (fslfShowNethood IN Value);
      ShowOverlayIcons := (fslfShowOverlayIcons IN Value);
      ShowParentFolder := (fslfShowParentFolder IN Value);
      ShowRecycleBin := (fslfShowRecycleBin IN Value);
      ShowShellNames := (fslfShowShellNames IN Value);
      Thumbnails := (fslfThumbnails IN Value);

      Invalidate;
    end;
end;

procedure TATdxFileSelector.SetListViewExtraLargeIcons(const Value:
    Boolean);
begin
  if (NOT Assigned(FShellList)) then
    Exit;

  FShellList.ShowExtraLargeIcons := Value;
end;

procedure TATdxFileSelector.SetListViewJumboIcons(const Value:
    Boolean);
begin
  if (NOT Assigned(FShellList)) then
    Exit;

  FShellList.ShowJumboIcons := Value;
end;

procedure TATdxFileSelector.SetListViewStyle(const Value:
    TATViewStyle);
begin
  if (NOT Assigned(FShellList)) then
    Exit;

  case Value of
    atvsIcon  : FShellList.ViewStyle := vsIcon;
    atvsList  : FShellList.ViewStyle := vsList;
    atvsReport: FShellList.ViewStyle := vsReport;
  end;
end;

procedure TATdxFileSelector.SetNewFolderButtonCaption(const Value:
    TCaption);
begin
  if (NOT Assigned(FNewFolderButton)) then
    Exit;

  FNewFolderButton.Caption := Value;
end;

procedure TATdxFileSelector.SetNewFolderButtonEnabled(const Value:
    Boolean);
begin
  if (NOT Assigned(FNewFolderButton)) then
    Exit;

  FNewFolderButton.Enabled := Value;
end;

procedure TATdxFileSelector.SetNewFolderButtonHint(const Value:
    String);
begin
  if (NOT Assigned(FNewFolderButton)) then
    Exit;

  FNewFolderButton.Hint := Value;
end;

procedure TATdxFileSelector.SetNewFolderButtonVisible(const Value:
    Boolean);
begin
  if (NOT Assigned(FNewFolderButton)) then
    Exit;

  FNewFolderButton.Visible := Value;
end;

procedure TATdxFileSelector.SetNewFolderButtonWidth(const Value:
    Integer);
begin
  if (NOT Assigned(FNewFolderButton)) then
    Exit;

  FNewFolderButton.Width := Value;
end;

procedure TATdxFileSelector.SetSmallImageList(const Value:
    TCustomImageList);
begin
  FSmallImageList := Value;

  if (Assigned(FViewStyleButton)) then
    FViewStyleButton.OptionsImage.Images := Value;
end;

procedure TATdxFileSelector.SetThumbnailHeight(const Value: Integer);
begin
  if (NOT Assigned(FShellList)) then
    Exit;

  FShellList.ThumbnailHeight := Value;
end;

procedure TATdxFileSelector.SetThumbnailWidth(const Value: Integer);
begin
  if (NOT Assigned(FShellList)) then
    Exit;

  FShellList.ThumbnailWidth := Value;
end;

procedure TATdxFileSelector.SetTreeFlags(const Value:
    TATdxFileSelectorTreeFlags);
begin
  if (NOT Assigned(FShellTree)) then
    Exit;

  with FShellTree do
    begin
      AutomaticRefresh := (fstfAutomaticRefresh IN Value);
      Checkboxes := (fstfCheckboxes IN Value);
      ColorCompressed := (fstfColorCompressed IN Value);
      ColorEncrypted := (fstfColorEncrypted IN Value);
      ExpandOnSelected := (fstfExpandOnSelected IN Value);
      FileSystemOnly := (fstfFileSystemOnly IN Value);
      HotTrack := (fstfHotTrack IN Value);
      ReadOnly := (fstfReadOnly IN Value);
      RightClickSelect := (fstfRightClickSelect IN Value);
      RowSelect := (fstfRowSelect IN Value);
      ShellContextMenu := (fstfShellContextMenu IN Value);
      ShowButtons := (fstfShowButtons IN Value);
      ShowContextMenuOnTop := (fstfShowContextMenuOnTop IN Value);
      ShowErrorMessages := (fstfShowErrorMessages IN Value);
      ShowFiles := (fstfShowFiles IN Value);
      ShowHidden := (fstfShowHidden IN Value);
      ShowLines := (fstfShowLines IN Value);
      ShowNethood := (fstfShowNethood IN Value);
      ShowOverlayIcons := (fstfShowOverlayIcons IN Value);
      ShowRecycleBin := (fstfShowRecycleBin IN Value);
      ShowRoot := (fstfShowRoot IN Value);
      ShowShellNames := (fstfShowShellNames IN Value);
      ToolTips := (fstfToolTips IN Value);

      Invalidate;
    end;
end;

procedure TATdxFileSelector.SetUseSkins(const Value: Boolean);
begin
  FUseSkins := Value;

  _RecolorUIControls;
end;

procedure TATdxFileSelector.SetViewsButtonHint(const Value: String);
begin
  if (NOT Assigned(FViewStyleButton)) then
    Exit;

  FViewStyleButton.Hint := Value;
end;

procedure TATdxFileSelector.SetViewsButtonImageIndex(const Value:
    TcxImageIndex);
begin
  if (NOT Assigned(FViewStyleButton)) then
    Exit;

  FViewStyleButton.OptionsImage.ImageIndex := Value;
end;

procedure TATdxFileSelector.SetViewsDropDownMenu(const Value:
    TComponent);
begin
  if (NOT Assigned(FViewStyleButton)) then
    Exit;

  FViewStyleButton.DropDownMenu := Value;
end;

procedure TATdxFileSelector.ShellLinkChangeHandler(Sender: TObject; const pItemIdList:
    IItemIdList);
begin
  if (NOT Assigned(FShellList)) then
    Exit;

  _UpdateFileName(FShellList.Path);
end;

procedure TATdxFileSelector.ShellListSelectItemHandler(Sender:
    TObject; Item: TListItem; Selected: Boolean);
var
  ASelItem: TJamShellListItem;
begin
  if (NOT Assigned(FShellList)) then
    Exit;

  ASelItem := FShellList.Selected;

  if (NOT Assigned(ASelItem)) then
    Exit;

  if ( ASelItem.IsFolder AND
       (NOT _IsArchiveFolder(ASelItem.FullPath))
     ) then
    Exit;

  FileName := ASelItem.FullPath;

  if (Assigned(FFileNameEdit)) then
    FFileNameEdit.Text := ASelItem.Caption;
end;

procedure TATdxFileSelector._AttachComponentEventHandlers;
begin
  _AttachOnClickHandler(FAcceptButton, AcceptButtonClickHandler);

  _AttachOnClickHandler(FCancelButton, CancelButtonClickHandler);

  _AttachOnClickHandler(FNewFolderButton,
      NewFolderButtonClickHandler);

  FFileTypeCombo.Properties.OnChange := FileTypeChangedHandler;

  FShellLink.OnChange := ShellLinkChangeHandler;

  _AttachShellListSelectItemHandler;
end;

procedure TATdxFileSelector._AttachNotifyEventHandler(AObject:
    TObject; AHandler: TNotifyEvent; const AEventName: String);
var
  AValue: TValue;
begin
  if (NOT Assigned(AObject)) then
    Exit;

  AValue := TValue.From<TNotifyEvent>(AHandler);

  _SetPropertyValue(AObject, AEventName, AValue);
end;

procedure TATdxFileSelector._AttachOnClickHandler(AObject: TObject;
    AHandler: TNotifyEvent);
begin
  _AttachNotifyEventHandler(AObject, AHandler, 'OnClick');
end;

procedure TATdxFileSelector._AttachShellListSelectItemHandler;
begin
  if (NOT Assigned(FShellList)) then
    Exit;

  FShellList.OnSelectItem := ShellListSelectItemHandler;
end;

function TATdxFileSelector._CreateBreadCrumbBar(AParent: TWinControl;
    AShellLink: TJamShellLink): TJamShellBreadCrumbBar;
begin
  Result := TJamShellBreadCrumbBar.Create(Self);

  Result.Align := alTop;
  Result.AlignWithMargins := True;
  Result.AutomaticRefresh := True;
  Result.FileSystemOnly := True;
  Result.Margins.SetBounds(8, 8, 8, 8);
  Result.OpenFilesExternally := False;
  Result.Parent := AParent;
  Result.ShellLink := AShellLink;
  Result.VisiblePanes := [bpHistory, bpSearchEdit, bpRefreshButton];
end;

function TATdxFileSelector._CreateButton(AParent: TWinControl;
    const ACaption: String; AAlign: TAlign = alNone;
    AMarginLeft: Integer = 0; AMarginTop: Integer = 0;
    AMarginRight: Integer = 0; AMarginBottom: Integer = 0;
    AHeight: Integer = -1; AWidth: Integer = -1;
    APaintStyle: TcxButtonPaintStyle = bpsDefault;
    AKind: TcxButtonKind = cxbkStandard): TcxButton;
begin
  Result := TcxButton.Create(Self);

  Result.Align := AAlign;
  Result.AlignWithMargins := True;
  Result.Caption := ACaption;
  Result.DoubleBuffered := True;
  Result.Margins.SetBounds(AMarginLeft, AMarginTop,
      AMarginRight, AMarginBottom);
  Result.Parent := AParent;

  if (AHeight >= 0) then
    Result.Height := AHeight;

  if (AWidth >= 0) then
    Result.Width := AWidth;

  Result.PaintStyle := APaintStyle;
  Result.Kind := AKind;
end;

procedure TATdxFileSelector._CreateControls;
begin
  FShellLink := _CreateShellLink;

  FMainLayout := _CreateMainLayout(Self, alClient);

  FBreadCrumbBar := _CreateBreadCrumbBar(FMainLayout, FShellLink);

  FCommandLayout := _CreateLayoutBox(FMainLayout, alTop, 0, 0, 0, 0,
      46);
  FNewFolderButton := _CreateButton(FCommandLayout, 'New Folder',
      alLeft, 4, 8, 8, 8, -1, 80);
  FViewStyleButton := _CreateButton(FCommandLayout, EmptyStr, alRight,
      8, 8, 4, 8, -1, 48, bpsGlyph, cxbkOfficeDropDown);

  FLeftPaneLayout := _CreateLayoutBox(FMainLayout, alLeft, 0, 0, 0, 0,
      -1, 250);
  FShellTree := _CreateShellTree(FLeftPaneLayout, FShellLink);

  FSplitter := _CreateSplitter(FMainLayout);

  FRightPaneLayout := _CreateLayoutBox(FMainLayout, alClient,
      0, 0, 6, 0);
  FShellList := _CreateShellList(FRightPaneLayout, FShellLink);

  FEditsLayout := _CreateLayoutBox(FMainLayout, alBottom, 0, 0, 0, 0,
      62);
  FFileNameEdit := _CreateFileNameEdit(FEditsLayout);
  FFileNameLabel := _CreateLabel(FEditsLayout, 'File Name:',
      FFileNameEdit, alLeft, 6, 16, 0, 16);
  FFileTypeCombo := _CreateFileTypeCombo(FEditsLayout);
  FFileTypeLabel := _CreateLabel(FEditsLayout, 'File Type:',
      FFileTypeCombo, alRight, 0, 16, 0, 16);

  FButtonsLayout := _CreateLayoutBox(FMainLayout, alBottom, 0, 0, 0,
      0, 72);
  FAcceptButton := _CreateButton(FButtonslayout, 'Ok', alRight,
      16, 16, 0, 8, -1, 80);
  FCancelButton := _CreateButton(FButtonslayout, 'Cancel', alRight,
      16, 16, 6, 8, -1, 80);
end;

function TATdxFileSelector._CreateFileNameEdit(AParent: TWinControl):
    TcxTextEdit;
begin
  Result := TcxTextEdit.Create(Self);

  Result.Align := alClient;
  Result.AlignWithMargins := True;
  Result.Margins.SetBounds(0, 16, 16, 16);
  Result.Parent := AParent;
end;

function TATdxFileSelector._CreateFileTypeCombo(AParent:
    TWinControl): TcxComboBox;
begin
  Result := TcxComboBox.Create(Self);

  Result.Align := alRight;
  Result.AlignWithMargins := True;
  Result.Margins.SetBounds(0, 16, 6, 16);
  Result.Parent := AParent;
  Result.Properties.DropDownListStyle := lsFixedList;
  Result.Properties.DropDownSizeable := True;
  Result.Properties.ImmediatePost := True;
  Result.Properties.ImmediateUpdateText := True;
  Result.Width := 150;
end;

function TATdxFileSelector._CreateLabel(AParent: TWinControl;
    const ACaption: String; AFocusControl: TWinControl = NIL;
    AAlign: TAlign = alNone; AMarginLeft: Integer = 0;
    AMarginTop: Integer = 0; AMarginRight: Integer = 0;
    AMarginBottom: Integer = 0): TcxLabel;
begin
  Result := TcxLabel.Create(Self);

  Result.Align := AAlign;
  Result.AlignWithMargins := True;
  Result.Caption := ACaption;
  Result.FocusControl  := AFocusControl;
  Result.Margins.SetBounds(AMarginLeft, AMarginTop,
      AMarginRight, AMarginBottom);
  Result.Parent := AParent;
  Result.Properties.Alignment.Vert := taVCenter;
  Result.Transparent := True;

  if (NOT Assigned(AFocusControl)) then
    Exit;

  Result.Left := (AFocusControl.Left - Result.Width);
end;

function TATdxFileSelector._CreateLayoutBox(AParent: TWinControl;
    AAlign: TAlign = alNone; AMarginLeft: Integer = 0;
    AMarginTop: Integer = 0; AMarginRight: Integer = 0;
    AMarginBottom: Integer = 0; AHeight: Integer = -1;
    AWidth: Integer = -1): TcxGroupBox;
begin
  Result := TcxGroupBox.Create(Self);

  Result.Align := AAlign;
  Result.AlignWithMargins := True;
  Result.Caption := EmptyStr;
  Result.DoubleBuffered := True;
  Result.Margins.SetBounds(AMarginLeft, AMarginTop,
      AMarginRight, AMarginBottom);
  Result.PanelStyle.Active := True;
  Result.Parent := AParent;
  Result.Style.BorderStyle := ebsNone;
  Result.Transparent := True;

  if (AHeight >= 0) then
    Result.Height := AHeight;

  if (AWidth >= 0) then
    Result.Width := AWidth;
end;

function TATdxFileSelector._CreateMainLayout(AParent: TWinControl;
    AAlign: TAlign = alNone): TcxScrollBox;
begin
  Result := TcxScrollBox.Create(Self);

  Result.Align := AAlign;
  Result.AlignWithMargins := True;
  Result.AutoScroll := True;
  Result.BorderStyle := cxcbsNone;
  Result.Margins.SetBounds(0, 0, 0, 0);
  Result.Parent := AParent;
end;

function TATdxFileSelector._CreateShellLink: TJamShellLink;
begin
  Result := TJamShellLink.Create(Self);
end;

function TATdxFileSelector._CreateShellList(AParent: TWinControl;
    AShellLink: TJamShellLink): TJamShellList;
begin
  Result := TJamShellList.Create(Self);

  Result.Align := alClient;
  Result.AlignWithMargins := True;
  Result.AutomaticRefresh := True;
  Result.Margins.SetBounds(0, 0, 0, 0);
  Result.MultiSelect := False;
  Result.Parent := AParent;
  Result.ShellLink := AShellLink;
  Result.ViewStyle := vsReport
end;

function TATdxFileSelector._CreateShellTree(AParent: TWinControl;
    AShellLink: TJamShellLink): TJamShellTree;
begin
  Result := TJamShellTree.Create(Self);

  Result.Align := alClient;
  Result.AlignWithMargins := True;
  Result.AutomaticRefresh := True;
  Result.Margins.SetBounds(6, 0, 0, 0);
  Result.Parent := AParent;
  Result.ShellLink := AShellLink;
end;

function TATdxFileSelector._CreateSplitter(AParent: TWinControl):
    TcxSplitter;
begin
  Result := TcxSplitter.Create(Self);

  Result.AlignSplitter := salLeft;
  Result.AlignWithMargins := True;
  Result.AutoSnap := True;
  Result.Margins.SetBounds(0, 0, 0, 0);
  Result.MinSize := 166;
  Result.Parent := AParent;
  Result.ResizeUpdate := True;
  Result.Width := 10;
end;

procedure TATdxFileSelector._FreeControls;
begin

  FreeAndNil(FCancelButton);
  FreeAndNil(FAcceptButton);
  FreeAndNil(FButtonsLayout);

  FreeAndNil(FFileTypeCombo);
  FreeAndNil(FFileNameLabel);
  FreeAndNil(FFileNameEdit);
  FreeAndNil(FEditsLayout);

  FreeAndNil(FShellList);
  FreeAndNil(FRightPaneLayout);

  FreeAndNil(FSplitter);

  FreeAndNil(FShellTree);
  FreeAndNil(FLeftPaneLayout);

  FreeAndNil(FViewStyleButton);
  FreeAndNil(FNewFolderButton);
  FreeAndNil(FCommandLayout);

  FreeAndNil(FBreadCrumbBar);

  FreeAndNil(FShellLink);

end;

procedure TATdxFileSelector._InitControls;
begin
  _ProcessAndLoadFilters;
end;

procedure TATdxFileSelector._InitFields;
begin
  FFileName := EmptyStr;
  FFilter := 'All Files (*.*)|*.*';
  FFilterDict := TDictionary<String, String>.Create;
  FFilterIndex := 1;
  FUseSkins := True;
end;

procedure TATdxFileSelector._InitMainProperties;
begin
  Self.Height := 550;
  Self.Width := 600;

  Self.DoubleBuffered := True;
end;

function TATdxFileSelector._IsArchiveFolder(const APath: String):
    Boolean;
var
  AExt: String;
begin
  AExt := ExtractFileExt(APath);

  Result := SameText(AExt, '.ZIP');
end;

function TATdxFileSelector._IsFilterStored: Boolean;
begin
  Result := (NOT SameText(Filter, 'All Files (*.*)|*.*'));
end;

procedure TATdxFileSelector._ProcessAndLoadFilters;
var
  AAddValue: Boolean;
  ACount: Integer;
  ALimit: Integer;
  AName: String;
  AStrArray: TStringDynArray;
  AValue: String;
  Idx: Integer;
begin
  FFileTypeCombo.Properties.Items.Clear;
  FFileTypeCombo.EditText := EmptyStr;

  FFilterDict.Clear;

  if (FFilter.IsEmpty) then
    Exit;

  AStrArray := SplitString(FFilter, '|');

  if (Length(AStrArray) < 2) then
    Exit;

  ALimit := High(AStrArray);
  Idx := Low(AStrArray);

  repeat

    AName := AStrArray[Idx];

    Inc(Idx);

    if (Idx <= ALimit) then
      begin
        AValue := AStrArray[Idx];
        AAddValue := True;
      end
    else
      begin
        AValue := EmptyStr;
        AAddValue := False;
      end;

    if (AAddValue) then
      begin
        FFilterDict.AddOrSetValue(AName, AValue);
        FFileTypeCombo.Properties.Items.Add(AName);
      end;

    Inc(Idx);

  until (Idx > ALimit);

  ACount := FFileTypeCombo.Properties.Items.Count;

  if (FFilterIndex > ACount) then
    FFilterIndex := ACount;

  FFileTypeCombo.ItemIndex := (FFilterIndex - 1);
end;

procedure TATdxFileSelector._RecolorUIControls;
begin
  if (Assigned(FBreadCrumbBar)) then
    begin
      FBreadCrumbBar.Color := EditorBGColor;
      FBreadCrumbBar.Font.Color := EditorTextColor;

    end;

  if (Assigned(FShellTree)) then
    begin
      FShellTree.Color := EditorBGColor;
      FShellTree.Font.Color := EditorTextColor;
    end;

  if (Assigned(FShellList)) then
    begin
      FShellList.Color := EditorBGColor;
      FShellList.Font.Color := EditorTextColor;
    end;
end;

procedure TATdxFileSelector._RepositionCancelButton(const Value:
    Boolean);
begin
  if (NOT Assigned(FCancelButton)) then
    Exit;

  if (Value) then
    FCancelButton.Left := (Self.Width - CancelButtonWidth);
end;

function TATdxFileSelector._SetPropertyValue(AObject: TObject;
  AProperty: String; const AValue: TValue): Boolean;
var
  AContext: TRttiContext;
  AType: TRttiType;
  AProp: TRttiProperty;
begin
  //Get rtti context...
  AContext := TRttiContext.Create;

  //Attempt to use rtti...
  try
    //Try to get the type info for AObject...
    AType := AContext.GetType(AObject.ClassInfo);

    //Did we get type info for AObject???
    if (NOT Assigned(AType)) then
      Exit(False);  //No, return False...

    //Attempt to get the property named in AProperty...
    AProp := AType.GetProperty(AProperty);

    //Did we get a reference to the property???
    if (NOT Assigned(AProp)) then
      Exit(False);  //No, return false...

    //Is the property writable???
    if (NOT AProp.IsWritable) then
      Exit(False);  //No, return False...

    //Attempt to set the property value...
    AProp.SetValue(AObject, AValue);

    //Indicate success..
    Result := True;

  finally
    //Free the rtti context...
    AContext.Free;
  end;
end;

procedure TATdxFileSelector._UpdateFileName(const AFileName: String);
var
  AFile: String;
  AFName: String;
  APath: String;
  AValue: Variant;
begin
  if (AFilename.IsEmpty) then
    Exit;

  AFile := ExtractFileName(AFileName);
  APath := ExtractFilePath(AFilename);

  if ( APath.IsEmpty AND AFile.IsEmpty ) then
    Exit;

  if (APath.IsEmpty) then
    begin
      APath := IncludeTrailingPathDelimiter(
          ExtractFilePath(FileName));

      AFName := Format('%s%s', [APath, AFile]);
    end

  else if (AFile.IsEmpty) then
    begin
      if (Assigned(FShellList)) then
        FShellList.Path := APath;

      if (NOT Assigned(FFileNameEdit)) then
        Exit;

      AValue := FFileNameEdit.EditValue;

      if ( VarIsNull(AValue) OR VarIsEmpty(AValue) ) then
        AFile := ExtractFileName(FileName)
      else
        AFile := AValue;

      FFileNameEdit.Text := AFile;

      APath := IncludeTrailingPathDelimiter(APath);

      FileName := Format('%s%s', [APath, AFile]);

      Exit;
    end

  else
    begin
      AFName := AFileName;
    end;

  FileName := AFName;
end;

end.


