# VCLua reference (Markdown)
> Converted from `vclua_ref.html` with preserved anchors (e.g. `#Action`).

---

<a id="Action"></a>
### Action

#### Published properties
- `AutoCheck` : `Boolean`
- `Caption` : `TranslateString`
- `Category` : `AnsiString`
- `Checked` : `Boolean`
- `DisableIfNoHandler` : `Boolean`
- `Enabled` : `Boolean`
- `GroupIndex` : `LongInt`
- `HelpContext` : `HelpContext`
- `HelpKeyword` : `AnsiString`
- `HelpType` : `HelpType`
- `Hint` : `TranslateString`
- `ImageIndex` : `ImageIndex`
- `Name` : `AnsiString`
- `OnExecute` : `NotifyEvent`
- `OnHint` : `HintEvent`
- `OnUpdate` : `NotifyEvent`
- `SecondaryShortCuts` : `ShortCutList`
- `ShortCut` : `ShortCut`
- `Tag` : `Int64`
- `Visible` : `Boolean`

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| o.AutoCheck = value<br>result = o.AutoCheck | property AutoCheck: Boolean read FAutoCheck write SetAutoCheck default False; |
| o.Caption = value<br>result = o.Caption | property Caption: TTranslateString read FCaption write SetCaption; |
| o.Checked = value<br>result = o.Checked | property Checked: Boolean read FChecked write SetChecked default False; |
| o.DisableIfNoHandler = value<br>result = o.DisableIfNoHandler | property DisableIfNoHandler: Boolean read FDisableIfNoHandler write FDisableIfNoHandler default False; |
| result, HintStr = o:DoHint() | function DoHint(var HintStr: string): Boolean; virtual; |
| result, HintStr = o:DoHint2(HintStr) | function DoHint(var HintStr: string): Boolean; virtual; |
| o.Enabled = value<br>result = o.Enabled | property Enabled: Boolean read FEnabled write SetEnabled default True; |
| o.Grayed = value<br>result = o.Grayed | property Grayed: Boolean read FGrayed write FGrayed; |
| o.GroupIndex = value<br>result = o.GroupIndex | property GroupIndex: Integer read FGroupIndex write SetGroupIndex default 0; |
| o.HelpContext = value<br>result = o.HelpContext | property HelpContext: THelpContext read FHelpContext write SetHelpContext default 0; |
| o.HelpKeyword = value<br>result = o.HelpKeyword | property HelpKeyword: string read FHelpKeyword write SetHelpKeyword; |
| o.HelpType = value<br>result = o.HelpType | property HelpType: THelpType read FHelpType write SetHelpType default htContext; |
| o.Hint = value<br>result = o.Hint | property Hint: TTranslateString read FHint write SetHint; |
| o.ImageIndex = value<br>result = o.ImageIndex | property ImageIndex: TImageIndex read FImageIndex write SetImageIndex default -1; |
| o.OnHint = function(HintStr,CanShow) return HintStr,CanShow end | property OnHint: THintEvent read FOnHint write FOnHint; |
| o.SecondaryShortCuts = value<br>result = o.SecondaryShortCuts | property SecondaryShortCuts: TShortCutList read GetSecondaryShortCuts write SetSecondaryShortCuts stored IsSecondaryShortCutsStored; |
| o.ShortCut = value<br>result = o.ShortCut | property ShortCut: TShortCut read FShortCut write SetShortCut default 0; |
| o.Visible = value<br>result = o.Visible | property Visible: Boolean read FVisible write SetVisible default True; |


<a id="ActionList"></a>
### ActionList

#### Published properties
- `Images` : `CustomImageList`
- `Name` : `AnsiString`
- `OnChange` : `NotifyEvent`
- `OnExecute` : `ActionEvent`
- `OnUpdate` : `ActionEvent`
- `State` : `ActionListState`
- `Tag` : `Int64`

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| result = o:ActionByName(ActionName) | function ActionByName(const ActionName: string): TContainedAction; |
| result = o.ActionCount | property ActionCount: Integer read GetActionCount; |
| result = o:Actions(Index)<br>o:Actions(Index,value) | property Actions[Index: Integer]: TContainedAction read GetAction write SetAction; default; |
| result = o:ExecuteAction(Action) | function ExecuteAction(Action: TBasicAction): Boolean; override; |
| o.Images = value<br>result = o.Images | property Images: TCustomImageList read FImages write SetImages; |
| result = o:IndexOfName(ActionName) | function IndexOfName(const ActionName: string): integer; |
| o.OnChange = function(Sender) end | property OnChange: TNotifyEvent read FOnChange write FOnChange; |
| o.OnExecute = function(AAction,Handled) return Handled end | property OnExecute: TActionEvent read FOnExecute write FOnExecute; |
| o.OnUpdate = function(AAction,Handled) return Handled end | property OnUpdate: TActionEvent read FOnUpdate write FOnUpdate; |
| o.State = value<br>result = o.State | property State: TActionListState read FState write SetState default asNormal; |
| result = o:UpdateAction(Action) | function UpdateAction(Action: TBasicAction): Boolean; override; |


<a id="AliasStrings"></a>
### AliasStrings

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| result = o:AliasToValue(Alias) | function AliasToValue(const Alias: string): string; virtual; |
| result = o:IndexOfValue(AValue) | function IndexOfValue(const AValue: string): integer; virtual; |
| result = o:ValueAt(Index) | function ValueAt(Index: integer): string; virtual; |
| result = o:ValueToAlias(AValue) | function ValueToAlias(const AValue: string): string; virtual; |


<a id="Application"></a>
### Application

#### Published properties
- `Name` : `AnsiString`
- `Tag` : `Int64`

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| result = VCL.TheApplication() | Application: TApplication |

| Lua examples | FP declaration |
| --- | --- |
| o:ActivateHint(CursorPos)<br>o:ActivateHint(CursorPos,CheckHintControlChange) | procedure ActivateHint(CursorPos: TPoint; CheckHintControlChange: Boolean = False); |
| result = o.Active | property Active: Boolean read GetActive; |
| o.ApplicationType = value<br>result = o.ApplicationType | property ApplicationType : TApplicationType read FApplicationType write FApplicationType; |
| o.BidiMode = value<br>result = o.BidiMode | property BidiMode: TBiDiMode read FBidiMode write SetBidiMode; |
| result = o:BigIconHandle() | function BigIconHandle: HIcon; |
| o:BringToFront() | procedure BringToFront; |
| o.CaptureExceptions = value<br>result = o.CaptureExceptions | property CaptureExceptions: Boolean read FCaptureExceptions write SetCaptureExceptions; |
| o:ControlDestroyed(AControl) | procedure ControlDestroyed(AControl: TControl); |
| o.DoubleBuffered = value<br>result = o.DoubleBuffered | property DoubleBuffered: TApplicationDoubleBuffered read FDoubleBuffered write FDoubleBuffered default adbDefault; platform; |
| o.ExceptionDialog = value<br>result = o.ExceptionDialog | property ExceptionDialog: TApplicationExceptionDlg read FExceptionDialog write FExceptionDialog; |
| o.ExtendedKeysSupport = value<br>result = o.ExtendedKeysSupport | property ExtendedKeysSupport: Boolean read FExtendedKeysSupport write FExtendedKeysSupport; |
| o.FindGlobalComponentEnabled = value<br>result = o.FindGlobalComponentEnabled | property FindGlobalComponentEnabled: Boolean read FFindGlobalComponentEnabled write FFindGlobalComponentEnabled; |
| o.Flags = value<br>result = o.Flags | property Flags: TApplicationFlags read FFlags write SetFlags; |
| result = o:GetControlAtMouse() | function GetControlAtMouse: TControl; |
| result = o:GetControlAtPos(P) | function GetControlAtPos(P: TPoint): TControl; |
| o.Handle = value<br>result = o.Handle | property Handle: THandle read GetHandle write SetHandle; platform; |
| o:HandleMessage() | procedure HandleMessage; |
| result = o:HelpShowTableOfContents() | function HelpShowTableOfContents: Boolean; |
| o.Hint = value<br>result = o.Hint | property Hint: string read FHint write SetHint; |
| o.HintColor = value<br>result = o.HintColor | property HintColor: TColor read FHintColor write SetHintColor; |
| o.HintHidePause = value<br>result = o.HintHidePause | property HintHidePause: Integer read FHintHidePause write FHintHidePause; |
| o.HintHidePausePerChar = value<br>result = o.HintHidePausePerChar | property HintHidePausePerChar: Integer read FHintHidePausePerChar write FHintHidePausePerChar; |
| o.HintPause = value<br>result = o.HintPause | property HintPause: Integer read FHintPause write FHintPause; |
| o.HintShortCuts = value<br>result = o.HintShortCuts | property HintShortCuts: Boolean read FHintShortCuts write FHintShortCuts; |
| o.HintShortPause = value<br>result = o.HintShortPause | property HintShortPause: Integer read FHintShortPause write FHintShortPause; |
| o.Icon = value<br>result = o.Icon | property Icon: TIcon read FIcon write SetIcon; |
| o:Idle(Wait) | procedure Idle(Wait: Boolean); |
| result = o:IsWaiting() | function IsWaiting: Boolean; |
| o.LayoutAdjustmentPolicy = value<br>result = o.LayoutAdjustmentPolicy | property LayoutAdjustmentPolicy: TLayoutAdjustmentPolicy read FLayoutAdjustmentPolicy write FLayoutAdjustmentPolicy; |
| result = o.MainForm | property MainForm: TForm read FMainForm; |
| result = o.MainFormHandle | property MainFormHandle: HWND read GetMainFormHandle; |
| o.MainFormOnTaskBar = value<br>result = o.MainFormOnTaskBar | property MainFormOnTaskBar: Boolean read FMainFormOnTaskBar write SetMainFormOnTaskBar; platform; |
| o:Minimize() | procedure Minimize; |
| o:ModalFinished() | procedure ModalFinished; |
| result = o.ModalLevel | property ModalLevel: Integer read FModalLevel; |
| o:ModalStarted() | procedure ModalStarted; |
| result = o.MouseControl | property MouseControl: TControl read FMouseControl; |
| o.MoveFormFocusToChildren = value<br>result = o.MoveFormFocusToChildren | property MoveFormFocusToChildren: Boolean read FMoveFormFocusToChildren write FMoveFormFocusToChildren default True; |
| o.Navigation = value<br>result = o.Navigation | property Navigation: TApplicationNavigationOptions read FNavigation write SetNavigation; |
| o:Notification(AComponent,Operation) | procedure Notification(AComponent: TComponent; Operation: TOperation); override; |
| o.OnActionExecute = function(AAction,Handled) return Handled end | property OnActionExecute: TActionEvent read FOnActionExecute write FOnActionExecute; |
| o.OnActionUpdate = function(AAction,Handled) return Handled end | property OnActionUpdate: TActionEvent read FOnActionUpdate write FOnActionUpdate; |
| o.OnActivate = function(Sender) end | property OnActivate: TNotifyEvent read FOnActivate write FOnActivate; |
| o.OnCircularException = function(Sender,E) end | property OnCircularException: TExceptionEvent read FOnCircularException write FOnCircularException; |
| o.OnDeactivate = function(Sender) end | property OnDeactivate: TNotifyEvent read FOnDeactivate write FOnDeactivate; |
| o.OnDestroy = function(Sender) end | property OnDestroy: TNotifyEvent read FOnDestroy write FOnDestroy; |
| o.OnDropFiles = function(Sender,FileNames) end | property OnDropFiles: TDropFilesEvent read FOnDropFiles write FOnDropFiles; |
| o.OnEndSession = function(Sender) end | property OnEndSession: TNotifyEvent read FOnEndSession write FOnEndSession; |
| o.OnGetMainFormHandle = function(Handle) return Handle end | property OnGetMainFormHandle: TGetHandleEvent read FOnGetMainFormHandle write FOnGetMainFormHandle; |
| o.OnHint = function(Sender) end | property OnHint: TNotifyEvent read FOnHint write FOnHint; |
| o.OnIdle = function(Sender,Done) return Done end | property OnIdle: TIdleEvent read FOnIdle write FOnIdle; |
| o.OnIdleEnd = function(Sender) end | property OnIdleEnd: TNotifyEvent read FOnIdleEnd write FOnIdleEnd; |
| o.OnMessageDialogFinished = function(Sender,AResult) end | property OnMessageDialogFinished: TModalDialogFinished read FOnMessageDialogFinished write FOnMessageDialogFinished; |
| o.OnMinimize = function(Sender) end | property OnMinimize: TNotifyEvent read FOnMinimize write FOnMinimize; |
| o.OnModalBegin = function(Sender) end | property OnModalBegin: TNotifyEvent read FOnModalBegin write FOnModalBegin; |
| o.OnModalEnd = function(Sender) end | property OnModalEnd: TNotifyEvent read FOnModalEnd write FOnModalEnd; |
| o.OnQueryEndSession = function(Cancel) return Cancel end | property OnQueryEndSession: TQueryEndSessionEvent read FOnQueryEndSession write FOnQueryEndSession; |
| o.OnRestore = function(Sender) end | property OnRestore: TNotifyEvent read FOnRestore write FOnRestore; |
| o.OnUserInput = function(Sender,Msg) end | property OnUserInput: TOnUserInputEvent read FOnUserInput write FOnUserInput; |
| o:ProcessMessages() | procedure ProcessMessages; |
| o:ReleaseComponent(AComponent) | procedure ReleaseComponent(AComponent: TComponent); |
| o:RemoveStayOnTop()<br>o:RemoveStayOnTop(ASystemTopAlso) | procedure RemoveStayOnTop(const ASystemTopAlso: Boolean = False); |
| o:Restore() | procedure Restore; |
| o:RestoreStayOnTop()<br>o:RestoreStayOnTop(ASystemTopAlso) | procedure RestoreStayOnTop(const ASystemTopAlso: Boolean = False); |
| o:Run() | procedure Run; |
| o.Scaled = value<br>result = o.Scaled | property Scaled: Boolean read FScaled write FScaled; |
| o.ShowButtonGlyphs = value<br>result = o.ShowButtonGlyphs | property ShowButtonGlyphs: TApplicationShowGlyphs read FShowButtonGlyphs write SetShowButtonGlyphs default sbgAlways; |
| o.ShowHint = value<br>result = o.ShowHint | property ShowHint: Boolean read FShowHint write SetShowHint; |
| o.ShowMainForm = value<br>result = o.ShowMainForm | property ShowMainForm: Boolean read FShowMainForm write FShowMainForm default True; |
| o.ShowMenuGlyphs = value<br>result = o.ShowMenuGlyphs | property ShowMenuGlyphs: TApplicationShowGlyphs read FShowMenuGlyphs write SetShowMenuGlyphs default sbgAlways; |
| result = o:SmallIconHandle() | function SmallIconHandle: HIcon; |
| o.TaskBarBehavior = value<br>result = o.TaskBarBehavior | property TaskBarBehavior: TTaskBarBehavior read FTaskBarBehavior write SetTaskBarBehavior; |
| o.Title = value<br>result = o.Title | property Title: string read GetTitle write SetTitle; |
| o.UpdateFormatSettings = value<br>result = o.UpdateFormatSettings | property UpdateFormatSettings: Boolean read FUpdateFormatSettings write FUpdateFormatSettings; platform; |
| o:UpdateMainForm(AForm) | procedure UpdateMainForm(AForm: TForm); |


<a id="Arrow"></a>
### Arrow

#### Published properties
- `Align` : `Align`
- `AnchorSideBottom` : `AnchorSide`
- `AnchorSideLeft` : `AnchorSide`
- `AnchorSideRight` : `AnchorSide`
- `AnchorSideTop` : `AnchorSide`
- `Anchors` : `Anchors`
- `AntiAliasingMode` : `AntialiasingMode`
- `ArrowColor` : `GraphicsColor`
- `ArrowPointerAngle` : `LongInt`
- `ArrowType` : `ArrowType`
- `BorderSpacing` : `ControlBorderSpacing`
- `Color` : `GraphicsColor`
- `Constraints` : `SizeConstraints`
- `Cursor` : `Cursor`
- `Enabled` : `Boolean`
- `Height` : `LongInt`
- `HelpContext` : `HelpContext`
- `HelpKeyword` : `AnsiString`
- `HelpType` : `HelpType`
- `Hint` : `TranslateString`
- `Left` : `LongInt`
- `Name` : `AnsiString`
- `OnChangeBounds` : `NotifyEvent`
- `OnClick` : `NotifyEvent`
- `OnContextPopup` : `ContextPopupEvent`
- `OnDblClick` : `NotifyEvent`
- `OnDragDrop` : `DragDropEvent`
- `OnDragOver` : `DragOverEvent`
- `OnEndDrag` : `EndDragEvent`
- `OnMouseDown` : `MouseEvent`
- `OnMouseEnter` : `NotifyEvent`
- `OnMouseLeave` : `NotifyEvent`
- `OnMouseMove` : `MouseMoveEvent`
- `OnMouseUp` : `MouseEvent`
- `OnMouseWheel` : `MouseWheelEvent`
- `OnMouseWheelDown` : `MouseWheelUpDownEvent`
- `OnMouseWheelHorz` : `MouseWheelEvent`
- `OnMouseWheelLeft` : `MouseWheelUpDownEvent`
- `OnMouseWheelRight` : `MouseWheelUpDownEvent`
- `OnMouseWheelUp` : `MouseWheelUpDownEvent`
- `OnPaint` : `NotifyEvent`
- `OnResize` : `NotifyEvent`
- `OnStartDrag` : `StartDragEvent`
- `ParentColor` : `Boolean`
- `ParentShowHint` : `Boolean`
- `PopupMenu` : `PopupMenu`
- `ShadowColor` : `GraphicsColor`
- `ShadowType` : `ShadowType`
- `ShowHint` : `Boolean`
- `Tag` : `Int64`
- `Top` : `LongInt`
- `Visible` : `Boolean`
- `Width` : `LongInt`

<a id="BasicAction"></a>
### BasicAction

#### Published properties
- `Name` : `AnsiString`
- `Tag` : `Int64`

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| o.ActionComponent = value<br>result = o.ActionComponent | property ActionComponent: TComponent read FActionComponent write FActionComponent; |
| result = o:Execute() | function Execute: Boolean; dynamic; |
| o:ExecuteTarget(Target) | procedure ExecuteTarget(Target: TObject); virtual; |
| result = o:HandlesTarget(Target) | function HandlesTarget(Target: TObject): Boolean; virtual; |
| o.OnChange = function(Sender) end | property OnChange: TNotifyEvent read FOnChange write FOnChange; |
| o.OnExecute = function(Sender) end | property OnExecute: TNotifyEvent read FOnExecute write SetOnExecute; |
| o.OnUpdate = function(Sender) end | property OnUpdate: TNotifyEvent read FOnUpdate write FOnUpdate; |
| result = o:Update() | function Update: Boolean; virtual; |
| o:UpdateTarget(Target) | procedure UpdateTarget(Target: TObject); virtual; |


<a id="Bevel"></a>
### Bevel

#### Published properties
- `Align` : `Align`
- `AnchorSideBottom` : `AnchorSide`
- `AnchorSideLeft` : `AnchorSide`
- `AnchorSideRight` : `AnchorSide`
- `AnchorSideTop` : `AnchorSide`
- `Anchors` : `Anchors`
- `BorderSpacing` : `ControlBorderSpacing`
- `Constraints` : `SizeConstraints`
- `Cursor` : `Cursor`
- `Height` : `LongInt`
- `HelpContext` : `HelpContext`
- `HelpKeyword` : `AnsiString`
- `HelpType` : `HelpType`
- `Hint` : `TranslateString`
- `Left` : `LongInt`
- `Name` : `AnsiString`
- `OnChangeBounds` : `NotifyEvent`
- `OnMouseDown` : `MouseEvent`
- `OnMouseEnter` : `NotifyEvent`
- `OnMouseLeave` : `NotifyEvent`
- `OnMouseMove` : `MouseMoveEvent`
- `OnMouseUp` : `MouseEvent`
- `OnMouseWheel` : `MouseWheelEvent`
- `OnMouseWheelDown` : `MouseWheelUpDownEvent`
- `OnMouseWheelUp` : `MouseWheelUpDownEvent`
- `OnPaint` : `NotifyEvent`
- `OnResize` : `NotifyEvent`
- `ParentShowHint` : `Boolean`
- `Shape` : `BevelShape`
- `ShowHint` : `Boolean`
- `Style` : `BevelStyle`
- `Tag` : `Int64`
- `Top` : `LongInt`
- `Visible` : `Boolean`
- `Width` : `LongInt`

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| o:Assign(Source) | procedure Assign(Source: TPersistent); override; |


<a id="BitBtn"></a>
### BitBtn

#### Published properties
- `Action` : `BasicAction`
- `Align` : `Align`
- `AnchorSideBottom` : `AnchorSide`
- `AnchorSideLeft` : `AnchorSide`
- `AnchorSideRight` : `AnchorSide`
- `AnchorSideTop` : `AnchorSide`
- `Anchors` : `Anchors`
- `AutoSize` : `Boolean`
- `BidiMode` : `BiDiMode`
- `BorderSpacing` : `ControlBorderSpacing`
- `Cancel` : `Boolean`
- `Caption` : `TranslateString`
- `Color` : `GraphicsColor`
- `Constraints` : `SizeConstraints`
- `Cursor` : `Cursor`
- `Default` : `Boolean`
- `DefaultCaption` : `Boolean`
- `DisabledImageIndex` : `ImageIndex`
- `DragCursor` : `Cursor`
- `DragKind` : `DragKind`
- `DragMode` : `DragMode`
- `Enabled` : `Boolean`
- `Font` : `Font`
- `Glyph` : `Bitmap`
- `GlyphShowMode` : `GlyphShowMode`
- `Height` : `LongInt`
- `HelpContext` : `HelpContext`
- `HelpKeyword` : `AnsiString`
- `HelpType` : `HelpType`
- `Hint` : `TranslateString`
- `HotImageIndex` : `ImageIndex`
- `ImageIndex` : `ImageIndex`
- `ImageWidth` : `LongInt`
- `Images` : `CustomImageList`
- `Kind` : `BitBtnKind`
- `Layout` : `ButtonLayout`
- `Left` : `LongInt`
- `Margin` : `LongInt`
- `ModalResult` : `ModalResult`
- `Name` : `AnsiString`
- `NumGlyphs` : `LongInt`
- `OnChangeBounds` : `NotifyEvent`
- `OnClick` : `NotifyEvent`
- `OnContextPopup` : `ContextPopupEvent`
- `OnDragDrop` : `DragDropEvent`
- `OnDragOver` : `DragOverEvent`
- `OnEndDrag` : `EndDragEvent`
- `OnEnter` : `NotifyEvent`
- `OnExit` : `NotifyEvent`
- `OnKeyDown` : `KeyEvent`
- `OnKeyPress` : `KeyPressEvent`
- `OnKeyUp` : `KeyEvent`
- `OnMouseDown` : `MouseEvent`
- `OnMouseEnter` : `NotifyEvent`
- `OnMouseLeave` : `NotifyEvent`
- `OnMouseMove` : `MouseMoveEvent`
- `OnMouseUp` : `MouseEvent`
- `OnMouseWheel` : `MouseWheelEvent`
- `OnMouseWheelDown` : `MouseWheelUpDownEvent`
- `OnMouseWheelUp` : `MouseWheelUpDownEvent`
- `OnResize` : `NotifyEvent`
- `OnStartDrag` : `StartDragEvent`
- `OnUTF8KeyPress` : `UTF8KeyPressEvent`
- `ParentBidiMode` : `Boolean`
- `ParentFont` : `Boolean`
- `ParentShowHint` : `Boolean`
- `PopupMenu` : `PopupMenu`
- `PressedImageIndex` : `ImageIndex`
- `ShowHint` : `Boolean`
- `Spacing` : `LongInt`
- `TabOrder` : `TabOrder`
- `TabStop` : `Boolean`
- `Tag` : `Int64`
- `Top` : `LongInt`
- `Visible` : `Boolean`
- `Width` : `LongInt`

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| result = o:CanShowGlyph()<br>result = o:CanShowGlyph(AWithShowMode) | function CanShowGlyph(const AWithShowMode: Boolean = False): Boolean; |
| o.DefaultCaption = value<br>result = o.DefaultCaption | property DefaultCaption: Boolean read FDefaultCaption write SetDefaultCaption default False; |
| o.DisabledImageIndex = value<br>result = o.DisabledImageIndex | property DisabledImageIndex: TImageIndex index bsDisabled read GetImageIndex write SetImageIndex default -1; |
| o.Glyph = value<br>result = o.Glyph | property Glyph: TBitmap read GetGlyph write SetGlyph stored IsGlyphStored; |
| o.GlyphShowMode = value<br>result = o.GlyphShowMode | property GlyphShowMode: TGlyphShowMode read GetGlyphShowMode write SetGlyphShowMode default gsmApplication; |
| o.HotImageIndex = value<br>result = o.HotImageIndex | property HotImageIndex: TImageIndex index bsHot read GetImageIndex write SetImageIndex default -1; |
| o.ImageIndex = value<br>result = o.ImageIndex | property ImageIndex: TImageIndex index bsUp read GetImageIndex write SetImageIndex default -1; |
| o.ImageWidth = value<br>result = o.ImageWidth | property ImageWidth: Integer read GetImageWidth write SetImageWidth default 0; |
| o.Images = value<br>result = o.Images | property Images: TCustomImageList read GetImages write SetImages; |
| o.Kind = value<br>result = o.Kind | property Kind: TBitBtnKind read FKind write SetKind default bkCustom; |
| o.Layout = value<br>result = o.Layout | property Layout: TButtonLayout read FLayout write SetLayout default blGlyphLeft; |
| o:LoadGlyphFromLazarusResource(AName) | procedure LoadGlyphFromLazarusResource(const AName: String); |
| o:LoadGlyphFromResource(idButton) | procedure LoadGlyphFromResource(idButton: TButtonImage); |
| o:LoadGlyphFromResourceName(Instance,AName) | procedure LoadGlyphFromResourceName(Instance: THandle; const AName: String); |
| o:LoadGlyphFromStock(idButton) | procedure LoadGlyphFromStock(idButton: Integer); |
| o.Margin = value<br>result = o.Margin | property Margin: integer read FMargin write SetMargin default -1; |
| o.NumGlyphs = value<br>result = o.NumGlyphs | property NumGlyphs: Integer read GetNumGlyphs write SetNumGlyphs default 1; |
| o.PressedImageIndex = value<br>result = o.PressedImageIndex | property PressedImageIndex: TImageIndex index bsDown read GetImageIndex write SetImageIndex default -1; |
| o.Spacing = value<br>result = o.Spacing | property Spacing: Integer read FSpacing write SetSpacing default 4; |


<a id="Bitmap"></a>
### Bitmap

<a id="BoundLabel"></a>
### BoundLabel

#### Published properties
- `AnchorSideBottom` : `AnchorSide`
- `AnchorSideLeft` : `AnchorSide`
- `AnchorSideRight` : `AnchorSide`
- `AnchorSideTop` : `AnchorSide`
- `Caption` : `TranslateString`
- `Color` : `GraphicsColor`
- `Cursor` : `Cursor`
- `DragCursor` : `Cursor`
- `DragMode` : `DragMode`
- `Font` : `Font`
- `Height` : `LongInt`
- `HelpContext` : `HelpContext`
- `HelpKeyword` : `AnsiString`
- `HelpType` : `HelpType`
- `Hint` : `TranslateString`
- `Layout` : `TextLayout`
- `Left` : `LongInt`
- `Name` : `AnsiString`
- `OnClick` : `NotifyEvent`
- `OnDblClick` : `NotifyEvent`
- `OnDragDrop` : `DragDropEvent`
- `OnDragOver` : `DragOverEvent`
- `OnEndDrag` : `EndDragEvent`
- `OnMouseDown` : `MouseEvent`
- `OnMouseEnter` : `NotifyEvent`
- `OnMouseLeave` : `NotifyEvent`
- `OnMouseMove` : `MouseMoveEvent`
- `OnMouseUp` : `MouseEvent`
- `OnMouseWheel` : `MouseWheelEvent`
- `OnMouseWheelDown` : `MouseWheelUpDownEvent`
- `OnMouseWheelUp` : `MouseWheelUpDownEvent`
- `OnStartDrag` : `StartDragEvent`
- `ParentColor` : `Boolean`
- `ParentFont` : `Boolean`
- `ParentShowHint` : `Boolean`
- `PopupMenu` : `PopupMenu`
- `ShowAccelChar` : `Boolean`
- `ShowHint` : `Boolean`
- `Tag` : `Int64`
- `Top` : `LongInt`
- `Width` : `LongInt`
- `WordWrap` : `Boolean`

<a id="Brush"></a>
### Brush

#### Published properties
- `Color` : `GraphicsColor`
- `Style` : `FPBrushStyle`

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| o.Bitmap = value<br>result = o.Bitmap | property Bitmap: TCustomBitmap read FBitmap write SetBitmap; |
| result = o:EqualsBrush(ABrush) | function EqualsBrush(ABrush: TBrush): boolean; |


<a id="Button"></a>
### Button

#### Published properties
- `Action` : `BasicAction`
- `Align` : `Align`
- `AnchorSideBottom` : `AnchorSide`
- `AnchorSideLeft` : `AnchorSide`
- `AnchorSideRight` : `AnchorSide`
- `AnchorSideTop` : `AnchorSide`
- `Anchors` : `Anchors`
- `AutoSize` : `Boolean`
- `BidiMode` : `BiDiMode`
- `BorderSpacing` : `ControlBorderSpacing`
- `Cancel` : `Boolean`
- `Caption` : `TranslateString`
- `Color` : `GraphicsColor`
- `Constraints` : `SizeConstraints`
- `Cursor` : `Cursor`
- `Default` : `Boolean`
- `DoubleBuffered` : `Boolean`
- `DragCursor` : `Cursor`
- `DragKind` : `DragKind`
- `DragMode` : `DragMode`
- `Enabled` : `Boolean`
- `Font` : `Font`
- `Height` : `LongInt`
- `HelpContext` : `HelpContext`
- `HelpKeyword` : `AnsiString`
- `HelpType` : `HelpType`
- `Hint` : `TranslateString`
- `Left` : `LongInt`
- `ModalResult` : `ModalResult`
- `Name` : `AnsiString`
- `OnChangeBounds` : `NotifyEvent`
- `OnClick` : `NotifyEvent`
- `OnContextPopup` : `ContextPopupEvent`
- `OnDragDrop` : `DragDropEvent`
- `OnDragOver` : `DragOverEvent`
- `OnEndDrag` : `EndDragEvent`
- `OnEnter` : `NotifyEvent`
- `OnExit` : `NotifyEvent`
- `OnKeyDown` : `KeyEvent`
- `OnKeyPress` : `KeyPressEvent`
- `OnKeyUp` : `KeyEvent`
- `OnMouseDown` : `MouseEvent`
- `OnMouseEnter` : `NotifyEvent`
- `OnMouseLeave` : `NotifyEvent`
- `OnMouseMove` : `MouseMoveEvent`
- `OnMouseUp` : `MouseEvent`
- `OnMouseWheel` : `MouseWheelEvent`
- `OnMouseWheelDown` : `MouseWheelUpDownEvent`
- `OnMouseWheelUp` : `MouseWheelUpDownEvent`
- `OnResize` : `NotifyEvent`
- `OnStartDrag` : `StartDragEvent`
- `OnUTF8KeyPress` : `UTF8KeyPressEvent`
- `ParentBidiMode` : `Boolean`
- `ParentDoubleBuffered` : `Boolean`
- `ParentFont` : `Boolean`
- `ParentShowHint` : `Boolean`
- `PopupMenu` : `PopupMenu`
- `ShowHint` : `Boolean`
- `TabOrder` : `TabOrder`
- `TabStop` : `Boolean`
- `Tag` : `Int64`
- `Top` : `LongInt`
- `Visible` : `Boolean`
- `Width` : `LongInt`

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| result = o.Active | property Active: boolean read FActive stored false; |
| o.Cancel = value<br>result = o.Cancel | property Cancel: Boolean read FCancel write SetCancel default false; |
| o:Click() | procedure Click; override; |
| o.Default = value<br>result = o.Default | property Default: Boolean read FDefault write SetDefault default false; |
| o.ModalResult = value<br>result = o.ModalResult | property ModalResult: TModalResult read FModalResult write SetModalResult default mrNone; |
| result = o.ShortCut | property ShortCut: TShortcut read FShortCut; |
| result = o.ShortCutKey2 | property ShortCutKey2: TShortcut read FShortCutKey2; |
| result = o:UseRightToLeftAlignment() | function UseRightToLeftAlignment: Boolean; override; |


<a id="CalcEdit"></a>
### CalcEdit

#### Published properties
- `Align` : `Align`
- `Alignment` : `Alignment`
- `AnchorSideBottom` : `AnchorSide`
- `AnchorSideLeft` : `AnchorSide`
- `AnchorSideRight` : `AnchorSide`
- `AnchorSideTop` : `AnchorSide`
- `Anchors` : `Anchors`
- `AsFloat` : `Double`
- `AsInteger` : `LongInt`
- `AutoSelect` : `Boolean`
- `AutoSize` : `Boolean`
- `BidiMode` : `BiDiMode`
- `BorderSpacing` : `ControlBorderSpacing`
- `BorderStyle` : `BorderStyle`
- `ButtonCaption` : `TranslateString`
- `ButtonCursor` : `Cursor`
- `ButtonHint` : `TranslateString`
- `ButtonOnlyWhenFocused` : `Boolean`
- `ButtonWidth` : `LongInt`
- `CalculatorLayout` : `CalculatorLayout`
- `Color` : `GraphicsColor`
- `Constraints` : `SizeConstraints`
- `Cursor` : `Cursor`
- `DialogLeft` : `LongInt`
- `DialogPosition` : `Position`
- `DialogTitle` : `AnsiString`
- `DialogTop` : `LongInt`
- `DirectInput` : `Boolean`
- `DragCursor` : `Cursor`
- `DragMode` : `DragMode`
- `Enabled` : `Boolean`
- `Flat` : `Boolean`
- `FocusOnButtonClick` : `Boolean`
- `Font` : `Font`
- `Glyph` : `Bitmap`
- `Height` : `LongInt`
- `HelpContext` : `HelpContext`
- `HelpKeyword` : `AnsiString`
- `HelpType` : `HelpType`
- `Hint` : `TranslateString`
- `ImageIndex` : `ImageIndex`
- `ImageWidth` : `LongInt`
- `Images` : `CustomImageList`
- `Layout` : `LeftRight`
- `Left` : `LongInt`
- `MaxLength` : `LongInt`
- `Name` : `AnsiString`
- `NumGlyphs` : `LongInt`
- `OnAcceptValue` : `AcceptValueEvent`
- `OnButtonClick` : `NotifyEvent`
- `OnChange` : `NotifyEvent`
- `OnClick` : `NotifyEvent`
- `OnContextPopup` : `ContextPopupEvent`
- `OnDblClick` : `NotifyEvent`
- `OnDragDrop` : `DragDropEvent`
- `OnDragOver` : `DragOverEvent`
- `OnEditingDone` : `NotifyEvent`
- `OnEndDrag` : `EndDragEvent`
- `OnEnter` : `NotifyEvent`
- `OnExit` : `NotifyEvent`
- `OnKeyDown` : `KeyEvent`
- `OnKeyPress` : `KeyPressEvent`
- `OnKeyUp` : `KeyEvent`
- `OnMouseDown` : `MouseEvent`
- `OnMouseEnter` : `NotifyEvent`
- `OnMouseLeave` : `NotifyEvent`
- `OnMouseMove` : `MouseMoveEvent`
- `OnMouseUp` : `MouseEvent`
- `OnMouseWheel` : `MouseWheelEvent`
- `OnMouseWheelDown` : `MouseWheelUpDownEvent`
- `OnMouseWheelUp` : `MouseWheelUpDownEvent`
- `OnStartDrag` : `StartDragEvent`
- `OnUTF8KeyPress` : `UTF8KeyPressEvent`
- `ParentBidiMode` : `Boolean`
- `ParentColor` : `Boolean`
- `ParentFont` : `Boolean`
- `ParentShowHint` : `Boolean`
- `PopupMenu` : `PopupMenu`
- `ReadOnly` : `Boolean`
- `ShowHint` : `Boolean`
- `Spacing` : `LongInt`
- `TabOrder` : `TabOrder`
- `TabStop` : `Boolean`
- `Tag` : `Int64`
- `Text` : `TranslateString`
- `TextHint` : `TranslateString`
- `Top` : `LongInt`
- `Visible` : `Boolean`
- `Width` : `LongInt`

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| o:RunDialog() | procedure RunDialog; virtual; |


<a id="Calendar"></a>
### Calendar

#### Published properties
- `Align` : `Align`
- `AnchorSideBottom` : `AnchorSide`
- `AnchorSideLeft` : `AnchorSide`
- `AnchorSideRight` : `AnchorSide`
- `AnchorSideTop` : `AnchorSide`
- `Anchors` : `Anchors`
- `AutoSize` : `Boolean`
- `BorderSpacing` : `ControlBorderSpacing`
- `Constraints` : `SizeConstraints`
- `Cursor` : `Cursor`
- `DateTime` : `DateTime`
- `DisplaySettings` : `DisplaySettings`
- `DoubleBuffered` : `Boolean`
- `FirstDayOfWeek` : `CalDayOfWeek`
- `Height` : `LongInt`
- `HelpContext` : `HelpContext`
- `HelpKeyword` : `AnsiString`
- `HelpType` : `HelpType`
- `Hint` : `TranslateString`
- `Left` : `LongInt`
- `MaxDate` : `DateTime`
- `MinDate` : `DateTime`
- `Name` : `AnsiString`
- `OnChange` : `NotifyEvent`
- `OnChangeBounds` : `NotifyEvent`
- `OnClick` : `NotifyEvent`
- `OnDayChanged` : `NotifyEvent`
- `OnDblClick` : `NotifyEvent`
- `OnEnter` : `NotifyEvent`
- `OnExit` : `NotifyEvent`
- `OnKeyDown` : `KeyEvent`
- `OnKeyPress` : `KeyPressEvent`
- `OnKeyUp` : `KeyEvent`
- `OnMonthChanged` : `NotifyEvent`
- `OnMouseDown` : `MouseEvent`
- `OnMouseEnter` : `NotifyEvent`
- `OnMouseLeave` : `NotifyEvent`
- `OnMouseMove` : `MouseMoveEvent`
- `OnMouseUp` : `MouseEvent`
- `OnMouseWheel` : `MouseWheelEvent`
- `OnMouseWheelDown` : `MouseWheelUpDownEvent`
- `OnMouseWheelHorz` : `MouseWheelEvent`
- `OnMouseWheelLeft` : `MouseWheelUpDownEvent`
- `OnMouseWheelRight` : `MouseWheelUpDownEvent`
- `OnMouseWheelUp` : `MouseWheelUpDownEvent`
- `OnResize` : `NotifyEvent`
- `OnUTF8KeyPress` : `UTF8KeyPressEvent`
- `OnYearChanged` : `NotifyEvent`
- `ParentDoubleBuffered` : `Boolean`
- `PopupMenu` : `PopupMenu`
- `ShowHint` : `Boolean`
- `TabOrder` : `TabOrder`
- `TabStop` : `Boolean`
- `Tag` : `Int64`
- `Top` : `LongInt`
- `Visible` : `Boolean`
- `Width` : `LongInt`

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| o.Date = value<br>result = o.Date | property Date: String read GetDate write SetDate stored False; |
| o.DateTime = value<br>result = o.DateTime | property DateTime: TDateTime read GetDateTime write SetDateTime; |
| o.DisplaySettings = value<br>result = o.DisplaySettings | property DisplaySettings: TDisplaySettings read GetDisplaySettings write SetDisplaySettings default DefaultDisplaySettings; |
| o.FirstDayOfWeek = value<br>result = o.FirstDayOfWeek | property FirstDayOfWeek: TCalDayOfWeek read FFirstDayOfWeek write SetFirstDayOfWeek default dowDefault; |
| result = o:GetCalendarView() | function GetCalendarView: TCalendarView; |
| result = o:HitTest(APoint) | function HitTest(APoint: TPoint): TCalendarPart; |
| o.MaxDate = value<br>result = o.MaxDate | property MaxDate: TDateTime read FMaxDate write SetMaxDate stored GetMaxDateStored; |
| o.MinDate = value<br>result = o.MinDate | property MinDate: TDateTime read FMinDate write SetMinDate stored GetMinDateStored; |
| o.OnChange = function(Sender) end | property OnChange: TNotifyEvent read FOnChange write FOnChange; |
| o.OnDayChanged = function(Sender) end | property OnDayChanged: TNotifyEvent read FDayChanged write FDayChanged; |
| o.OnMonthChanged = function(Sender) end | property OnMonthChanged: TNotifyEvent read FMonthChanged write FMonthChanged; |
| o.OnYearChanged = function(Sender) end | property OnYearChanged: TNotifyEvent read FYearChanged write FYearChanged; |


<a id="Canvas"></a>
### Canvas

#### Published properties
- `AntialiasingMode` : `AntialiasingMode`
- `AutoRedraw` : `Boolean`
- `Brush` : `Brush`
- `CopyMode` : `LongInt`
- `Font` : `Font`
- `Height` : `LongInt`
- `OnChange` : `NotifyEvent`
- `OnChanging` : `NotifyEvent`
- `Pen` : `Pen`
- `Region` : `Region`
- `Width` : `LongInt`

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| o:AngleArc(X,Y,Radius,StartAngle,SweepAngle) | procedure AngleArc(X, Y: Integer; Radius: Longword; StartAngle, SweepAngle: Single); |
| o:Arc(ALeft,ATop,ARight,ABottom,Angle16Deg,Angle16DegLength) | procedure Arc(ALeft, ATop, ARight, ABottom, Angle16Deg, Angle16DegLength: Integer); virtual; |
| o:Arc2(ALeft,ATop,ARight,ABottom,SX,SY,EX,EY) | procedure Arc(ALeft, ATop, ARight, ABottom, SX, SY, EX, EY: Integer); virtual; |
| o:ArcTo(ALeft,ATop,ARight,ABottom,SX,SY,EX,EY) | procedure ArcTo(ALeft, ATop, ARight, ABottom, SX, SY, EX, EY: Integer); virtual; |
| o:BrushCopy(ADestRect,ABitmap,ASourceRect,ATransparentColor) | procedure BrushCopy(ADestRect: TRect; ABitmap: TBitmap; ASourceRect: TRect; ATransparentColor: TColor); virtual; |
| o:Changed() | procedure Changed; virtual; |
| o:Changing() | procedure Changing; virtual; |
| o:Chord(x1,y1,x2,y2,Angle16Deg,Angle16DegLength) | procedure Chord(x1, y1, x2, y2, Angle16Deg, Angle16DegLength: Integer); virtual;  reintroduce; |
| o:Chord2(x1,y1,x2,y2,SX,SY,EX,EY) | procedure Chord(x1, y1, x2, y2, SX, SY, EX, EY: Integer); virtual; |
| o:CopyRect(Dest,SrcCanvas,Source) | procedure CopyRect(const Dest: TRect; SrcCanvas: TCanvas; const Source: TRect); virtual; reintroduce; |
| o:Draw(X,Y,SrcGraphic) | procedure Draw(X,Y: Integer; SrcGraphic: TGraphic); virtual; reintroduce; |
| o:DrawFocusRect(ARect) | procedure DrawFocusRect(const ARect: TRect); virtual; |
| o:Ellipse(ARect) | procedure Ellipse(const ARect: TRect); |
| o:Ellipse2(x1,y1,x2,y2) | procedure Ellipse(x1, y1, x2, y2: Integer); virtual; |
| o:FillRect(ARect) | procedure FillRect(const ARect: TRect); virtual; |
| o:FillRect2(X1,Y1,X2,Y2) | procedure FillRect(X1,Y1,X2,Y2: Integer); |
| o:FloodFill(X,Y,FillColor,FillStyle) | procedure FloodFill(X, Y: Integer; FillColor: TColor; FillStyle: TFillStyle); virtual;  reintroduce; |
| o:Frame(ARect) | procedure Frame(const ARect: TRect); virtual; |
| o:Frame2(X1,Y1,X2,Y2) | procedure Frame(X1,Y1,X2,Y2: Integer); |
| ARect = o:Frame3D3(TopColor,BottomColor,FrameWidth) | procedure Frame3D(var ARect: TRect; TopColor, BottomColor: TColor; const FrameWidth: integer); overload; |
| ARect = o:Frame3D4(ARect,TopColor,BottomColor,FrameWidth) | procedure Frame3D(var ARect: TRect; TopColor, BottomColor: TColor; const FrameWidth: integer); overload; |
| ARect = o:Frame3d(FrameWidth,Style) | procedure Frame3d(var ARect: TRect; const FrameWidth: integer; const Style: TGraphicsBevelCut); virtual; |
| ARect = o:Frame3d2(ARect,FrameWidth,Style) | procedure Frame3d(var ARect: TRect; const FrameWidth: integer; const Style: TGraphicsBevelCut); virtual; |
| o:FrameRect(ARect) | procedure FrameRect(const ARect: TRect); virtual; |
| o:FrameRect2(X1,Y1,X2,Y2) | procedure FrameRect(X1,Y1,X2,Y2: Integer); |
| o:GradientFill(ARect,AStart,AStop,ADirection) | procedure GradientFill(ARect: TRect; AStart, AStop: TColor; ADirection: TGradientDirection); |
| result = o:HandleAllocated() | function HandleAllocated: boolean; virtual; |
| o:Lock() | procedure Lock; virtual; |
| o:Pie(EllipseX1,EllipseY1,EllipseX2,EllipseY2,StartX,StartY,EndX,EndY) | procedure Pie(EllipseX1,EllipseY1,EllipseX2,EllipseY2, StartX,StartY,EndX,EndY: Integer); virtual; |
| result = o:Pixels(X,Y)<br>o:Pixels(X,Y,value) | property Pixels[X, Y: Integer]: TColor read GetPixel write SetPixel; |
| o:PolyBezier(Points)<br>...<br>o:PolyBezier(Points,Filled,Continuous) | procedure PolyBezier(const Points: array of TPoint; Filled: boolean = False; Continuous: boolean = True);  reintroduce; |
| o:Polygon(Points,Winding)<br>...<br>o:Polygon(Points,Winding,StartIndex,NumPts) | procedure Polygon(const Points: array of TPoint; Winding: Boolean; StartIndex: Integer = 0; NumPts: Integer = -1); |
| o:Polygon2(Points) | procedure Polygon(const Points: array of TPoint); |
| o:Polyline(Points,StartIndex)<br>o:Polyline(Points,StartIndex,NumPts) | procedure Polyline(const Points: array of TPoint; StartIndex: Integer; NumPts: Integer = -1); |
| o:Polyline2(Points) | procedure Polyline(const Points: array of TPoint); |
| o:RadialPie(x1,y1,x2,y2,StartAngle16Deg,Angle16DegLength) | procedure RadialPie(x1, y1, x2, y2, StartAngle16Deg, Angle16DegLength: Integer); virtual;  reintroduce; |
| o:Rectangle(X1,Y1,X2,Y2) | procedure Rectangle(X1,Y1,X2,Y2: Integer); virtual; |
| o:Rectangle2(ARect) | procedure Rectangle(const ARect: TRect); |
| o:Refresh() | procedure Refresh; virtual; |
| o:RestoreHandleState() | procedure RestoreHandleState; virtual; |
| o:RoundRect(X1,Y1,X2,Y2,RX,RY) | procedure RoundRect(X1, Y1, X2, Y2: Integer; RX,RY: Integer); virtual; |
| o:RoundRect2(Rect,RX,RY) | procedure RoundRect(const Rect: TRect; RX,RY: Integer); |
| o:SaveHandleState() | procedure SaveHandleState; virtual; |
| o:StretchDraw(DestRect,SrcGraphic) | procedure StretchDraw(const DestRect: TRect; SrcGraphic: TGraphic); virtual; reintroduce; |
| result = o:TextFitInfo(Text,MaxWidth) | function TextFitInfo(const Text: string; MaxWidth: Integer): Integer; |
| result = o:TextHeight(Text) | function TextHeight(const Text: string): Integer; virtual; |
| o:TextOut(X,Y,Text) | procedure TextOut(X,Y: Integer; const Text: String); virtual; |
| o:TextRect(ARect,X,Y,Text) | procedure TextRect(const ARect: TRect; X, Y: integer; const Text: string); |
| o:TextRect2(ARect,X,Y,Text,Style) | procedure TextRect(ARect: TRect; X, Y: integer; const Text: string; const Style: TTextStyle); virtual; |
| o.TextStyle = value<br>result = o.TextStyle | property TextStyle: TTextStyle read FTextStyle write FTextStyle; |
| result = o:TextWidth(Text) | function TextWidth(const Text: string): Integer; virtual; |
| result = o:TryLock() | function TryLock: Boolean; |
| o:Unlock() | procedure Unlock; virtual; |


<a id="CheckBox"></a>
### CheckBox

#### Published properties
- `Action` : `BasicAction`
- `Align` : `Align`
- `Alignment` : `LeftRight`
- `AllowGrayed` : `Boolean`
- `AnchorSideBottom` : `AnchorSide`
- `AnchorSideLeft` : `AnchorSide`
- `AnchorSideRight` : `AnchorSide`
- `AnchorSideTop` : `AnchorSide`
- `Anchors` : `Anchors`
- `AutoSize` : `Boolean`
- `BidiMode` : `BiDiMode`
- `BorderSpacing` : `ControlBorderSpacing`
- `Caption` : `TranslateString`
- `Checked` : `Boolean`
- `Color` : `GraphicsColor`
- `Constraints` : `SizeConstraints`
- `Cursor` : `Cursor`
- `DoubleBuffered` : `Boolean`
- `DragCursor` : `Cursor`
- `DragKind` : `DragKind`
- `DragMode` : `DragMode`
- `Enabled` : `Boolean`
- `Font` : `Font`
- `Height` : `LongInt`
- `HelpContext` : `HelpContext`
- `HelpKeyword` : `AnsiString`
- `HelpType` : `HelpType`
- `Hint` : `TranslateString`
- `Left` : `LongInt`
- `Name` : `AnsiString`
- `OnChange` : `NotifyEvent`
- `OnChangeBounds` : `NotifyEvent`
- `OnClick` : `NotifyEvent`
- `OnContextPopup` : `ContextPopupEvent`
- `OnDragDrop` : `DragDropEvent`
- `OnDragOver` : `DragOverEvent`
- `OnEditingDone` : `NotifyEvent`
- `OnEndDrag` : `EndDragEvent`
- `OnEnter` : `NotifyEvent`
- `OnExit` : `NotifyEvent`
- `OnKeyDown` : `KeyEvent`
- `OnKeyPress` : `KeyPressEvent`
- `OnKeyUp` : `KeyEvent`
- `OnMouseDown` : `MouseEvent`
- `OnMouseEnter` : `NotifyEvent`
- `OnMouseLeave` : `NotifyEvent`
- `OnMouseMove` : `MouseMoveEvent`
- `OnMouseUp` : `MouseEvent`
- `OnMouseWheel` : `MouseWheelEvent`
- `OnMouseWheelDown` : `MouseWheelUpDownEvent`
- `OnMouseWheelUp` : `MouseWheelUpDownEvent`
- `OnResize` : `NotifyEvent`
- `OnStartDrag` : `StartDragEvent`
- `OnUTF8KeyPress` : `UTF8KeyPressEvent`
- `ParentBidiMode` : `Boolean`
- `ParentColor` : `Boolean`
- `ParentDoubleBuffered` : `Boolean`
- `ParentFont` : `Boolean`
- `ParentShowHint` : `Boolean`
- `PopupMenu` : `PopupMenu`
- `ShowHint` : `Boolean`
- `State` : `CheckBoxState`
- `TabOrder` : `TabOrder`
- `TabStop` : `Boolean`
- `Tag` : `Int64`
- `Top` : `LongInt`
- `Visible` : `Boolean`
- `Width` : `LongInt`

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| o.Alignment = value<br>result = o.Alignment | property Alignment: TLeftRight read GetAlignment write SetAlignment default taRightJustify; |
| o.AllowGrayed = value<br>result = o.AllowGrayed | property AllowGrayed: Boolean read FAllowGrayed write FAllowGrayed default false; |
| result = o.ShortCut | property ShortCut: TShortcut read FShortCut; |
| result = o.ShortCutKey2 | property ShortCutKey2: TShortcut read FShortCutKey2; |
| o.State = value<br>result = o.State | property State: TCheckBoxState read GetState write SetState default cbUnchecked; |


<a id="CheckGroup"></a>
### CheckGroup

#### Published properties
- `Align` : `Align`
- `AnchorSideBottom` : `AnchorSide`
- `AnchorSideLeft` : `AnchorSide`
- `AnchorSideRight` : `AnchorSide`
- `AnchorSideTop` : `AnchorSide`
- `Anchors` : `Anchors`
- `AutoFill` : `Boolean`
- `AutoSize` : `Boolean`
- `BiDiMode` : `BiDiMode`
- `BorderSpacing` : `ControlBorderSpacing`
- `Caption` : `TranslateString`
- `ChildSizing` : `ControlChildSizing`
- `ClientHeight` : `LongInt`
- `ClientWidth` : `LongInt`
- `Color` : `GraphicsColor`
- `ColumnLayout` : `ColumnLayout`
- `Columns` : `LongInt`
- `Constraints` : `SizeConstraints`
- `Cursor` : `Cursor`
- `DoubleBuffered` : `Boolean`
- `DragCursor` : `Cursor`
- `DragMode` : `DragMode`
- `Enabled` : `Boolean`
- `Font` : `Font`
- `Height` : `LongInt`
- `HelpContext` : `HelpContext`
- `HelpKeyword` : `AnsiString`
- `HelpType` : `HelpType`
- `Hint` : `TranslateString`
- `Items` : `Strings`
- `Left` : `LongInt`
- `Name` : `AnsiString`
- `OnChangeBounds` : `NotifyEvent`
- `OnClick` : `NotifyEvent`
- `OnDblClick` : `NotifyEvent`
- `OnDragDrop` : `DragDropEvent`
- `OnDragOver` : `DragOverEvent`
- `OnEndDrag` : `EndDragEvent`
- `OnEnter` : `NotifyEvent`
- `OnExit` : `NotifyEvent`
- `OnItemClick` : `CheckGroupClicked`
- `OnKeyDown` : `KeyEvent`
- `OnKeyPress` : `KeyPressEvent`
- `OnKeyUp` : `KeyEvent`
- `OnMouseDown` : `MouseEvent`
- `OnMouseEnter` : `NotifyEvent`
- `OnMouseLeave` : `NotifyEvent`
- `OnMouseMove` : `MouseMoveEvent`
- `OnMouseUp` : `MouseEvent`
- `OnMouseWheel` : `MouseWheelEvent`
- `OnMouseWheelDown` : `MouseWheelUpDownEvent`
- `OnMouseWheelUp` : `MouseWheelUpDownEvent`
- `OnResize` : `NotifyEvent`
- `OnStartDrag` : `StartDragEvent`
- `OnUTF8KeyPress` : `UTF8KeyPressEvent`
- `ParentBackground` : `Boolean`
- `ParentBiDiMode` : `Boolean`
- `ParentColor` : `Boolean`
- `ParentDoubleBuffered` : `Boolean`
- `ParentFont` : `Boolean`
- `ParentShowHint` : `Boolean`
- `PopupMenu` : `PopupMenu`
- `ShowHint` : `Boolean`
- `TabOrder` : `TabOrder`
- `TabStop` : `Boolean`
- `Tag` : `Int64`
- `Top` : `LongInt`
- `Visible` : `Boolean`
- `Width` : `LongInt`

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| o.AutoFill = value<br>result = o.AutoFill | property AutoFill: boolean read FAutoFill write SetAutoFill; |
| result = o:CheckEnabled(Index)<br>o:CheckEnabled(Index,value) | property CheckEnabled[Index: integer]: boolean read GetCheckEnabled write SetCheckEnabled; |
| result = o:Checked(Index)<br>o:Checked(Index,value) | property Checked[Index: integer]: boolean read GetChecked write SetChecked; |
| o.ColumnLayout = value<br>result = o.ColumnLayout | property ColumnLayout: TColumnLayout read FColumnLayout write SetColumnLayout default clHorizontalThenVertical; |
| o.Columns = value<br>result = o.Columns | property Columns: integer read FColumns write SetColumns default 1; |
| o.Items = value<br>result = o.Items | property Items: TStrings read FItems write SetItems; |
| o.OnItemClick = function(Sender,Index) end | property OnItemClick: TCheckGroupClicked read FOnItemClick write FOnItemClick; |
| result = o:Rows() | function Rows: integer; |


<a id="CheckListBox"></a>
### CheckListBox

#### Published properties
- `Align` : `Align`
- `AllowGrayed` : `Boolean`
- `AnchorSideBottom` : `AnchorSide`
- `AnchorSideLeft` : `AnchorSide`
- `AnchorSideRight` : `AnchorSide`
- `AnchorSideTop` : `AnchorSide`
- `Anchors` : `Anchors`
- `BidiMode` : `BiDiMode`
- `BorderSpacing` : `ControlBorderSpacing`
- `BorderStyle` : `BorderStyle`
- `Color` : `GraphicsColor`
- `Columns` : `LongInt`
- `Constraints` : `SizeConstraints`
- `Cursor` : `Cursor`
- `DragCursor` : `Cursor`
- `DragMode` : `DragMode`
- `Enabled` : `Boolean`
- `ExtendedSelect` : `Boolean`
- `Font` : `Font`
- `HeaderBackgroundColor` : `GraphicsColor`
- `HeaderColor` : `GraphicsColor`
- `Height` : `LongInt`
- `HelpContext` : `HelpContext`
- `HelpKeyword` : `AnsiString`
- `HelpType` : `HelpType`
- `Hint` : `TranslateString`
- `IntegralHeight` : `Boolean`
- `ItemHeight` : `LongInt`
- `ItemIndex` : `LongInt`
- `Items` : `Strings`
- `Left` : `LongInt`
- `MultiSelect` : `Boolean`
- `Name` : `AnsiString`
- `OnChangeBounds` : `NotifyEvent`
- `OnClick` : `NotifyEvent`
- `OnClickCheck` : `NotifyEvent`
- `OnContextPopup` : `ContextPopupEvent`
- `OnDblClick` : `NotifyEvent`
- `OnDragDrop` : `DragDropEvent`
- `OnDragOver` : `DragOverEvent`
- `OnDrawItem` : `DrawItemEvent`
- `OnEndDrag` : `EndDragEvent`
- `OnEnter` : `NotifyEvent`
- `OnExit` : `NotifyEvent`
- `OnItemClick` : `CheckListClicked`
- `OnKeyDown` : `KeyEvent`
- `OnKeyPress` : `KeyPressEvent`
- `OnKeyUp` : `KeyEvent`
- `OnMeasureItem` : `MeasureItemEvent`
- `OnMouseDown` : `MouseEvent`
- `OnMouseEnter` : `NotifyEvent`
- `OnMouseLeave` : `NotifyEvent`
- `OnMouseMove` : `MouseMoveEvent`
- `OnMouseUp` : `MouseEvent`
- `OnMouseWheel` : `MouseWheelEvent`
- `OnMouseWheelDown` : `MouseWheelUpDownEvent`
- `OnMouseWheelHorz` : `MouseWheelEvent`
- `OnMouseWheelLeft` : `MouseWheelUpDownEvent`
- `OnMouseWheelRight` : `MouseWheelUpDownEvent`
- `OnMouseWheelUp` : `MouseWheelUpDownEvent`
- `OnResize` : `NotifyEvent`
- `OnSelectionChange` : `SelectionChangeEvent`
- `OnShowHint` : `ControlShowHintEvent`
- `OnStartDrag` : `StartDragEvent`
- `OnUTF8KeyPress` : `UTF8KeyPressEvent`
- `ParentBidiMode` : `Boolean`
- `ParentColor` : `Boolean`
- `ParentFont` : `Boolean`
- `ParentShowHint` : `Boolean`
- `PopupMenu` : `PopupMenu`
- `ShowHint` : `Boolean`
- `Sorted` : `Boolean`
- `Style` : `ListBoxStyle`
- `TabOrder` : `TabOrder`
- `TabStop` : `Boolean`
- `Tag` : `Int64`
- `Top` : `LongInt`
- `TopIndex` : `LongInt`
- `Visible` : `Boolean`
- `Width` : `LongInt`

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| o.AllowGrayed = value<br>result = o.AllowGrayed | property AllowGrayed: Boolean read FAllowGrayed write FAllowGrayed default False; |
| result = o:CalculateStandardItemHeight() | function CalculateStandardItemHeight: Integer; override; |
| o:CheckAll(AState)<br>...<br>o:CheckAll(AState,aAllowGrayed,aAllowDisabled) | procedure CheckAll(AState: TCheckBoxState; aAllowGrayed: Boolean = True; aAllowDisabled: Boolean = True); |
| result = o:Checked(AIndex)<br>o:Checked(AIndex,value) | property Checked[AIndex: Integer]: Boolean read GetChecked write SetChecked; |
| o:Exchange(AIndex1,AIndex2) | procedure Exchange(AIndex1, AIndex2: Integer); |
| result = o:Header(AIndex)<br>o:Header(AIndex,value) | property Header[AIndex: Integer]: Boolean read GetHeader write SetHeader; |
| o.HeaderBackgroundColor = value<br>result = o.HeaderBackgroundColor | property HeaderBackgroundColor: TColor read FHeaderBackgroundColor write SetHeaderBackgroundColor default clInfoBk; |
| o.HeaderColor = value<br>result = o.HeaderColor | property HeaderColor: TColor read FHeaderColor write SetHeaderColor default clInfoText; |
| result = o:ItemEnabled(AIndex)<br>o:ItemEnabled(AIndex,value) | property ItemEnabled[AIndex: Integer]: Boolean read GetItemEnabled write SetItemEnabled; |
| o.OnClickCheck = function(Sender) end | property OnClickCheck: TNotifyEvent read FOnClickCheck write FOnClickCheck; |
| result = o:State(AIndex)<br>o:State(AIndex,value) | property State[AIndex: Integer]: TCheckBoxState read GetState write SetState; |
| o:Toggle(AIndex) | procedure Toggle(AIndex: Integer); |


<a id="Collection"></a>
### Collection

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| result = o:Add() | function Add: TCollectionItem; |
| o:BeginUpdate() | procedure BeginUpdate; virtual; |
| o:Clear() | procedure Clear; |
| result = o.Count | property Count: Integer read GetCount; |
| o:Delete(Index) | procedure Delete(Index: Integer); |
| o:EndUpdate() | procedure EndUpdate; virtual; |
| o:Exchange(Index1,index2) | procedure Exchange(Const Index1, index2: integer); |
| result = o:FindItemID(ID) | function FindItemID(ID: Integer): TCollectionItem; |
| result = o:Insert(Index) | function Insert(Index: Integer): TCollectionItem; |
| result = o:Items(Index)<br>o:Items(Index,value) | property Items[Index: Integer]: TCollectionItem read GetItem write SetItem; |
| o:Move(Index1,index2) | procedure Move(Const Index1, index2: integer); |
| result = o:Owner() | function Owner: TPersistent; |


<a id="CollectionItem"></a>
### CollectionItem

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| o.Collection = value<br>result = o.Collection | property Collection: TCollection read FCollection write SetCollection; |
| o.DisplayName = value<br>result = o.DisplayName | property DisplayName: string read GetDisplayName write SetDisplayName; |
| result = o.ID | property ID: Integer read FID; |
| o.Index = value<br>result = o.Index | property Index: Integer read GetIndex write SetIndex; |


<a id="CollectionPropertyEditor"></a>
### CollectionPropertyEditor

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| result = o:ShowCollectionEditor(ACollection,OwnerPersistent,PropName) | class function ShowCollectionEditor(ACollection: TCollection;  OwnerPersistent: TPersistent; const PropName: String): TCustomForm; virtual; |


<a id="CollectionPropertyEditorForm"></a>
### CollectionPropertyEditorForm

#### Published properties
- `Action` : `BasicAction`
- `ActiveControl` : `WinControl`
- `Align` : `Align`
- `AllowDropFiles` : `Boolean`
- `AlphaBlend` : `Boolean`
- `AlphaBlendValue` : `Byte`
- `AnchorSideBottom` : `AnchorSide`
- `AnchorSideLeft` : `AnchorSide`
- `AnchorSideRight` : `AnchorSide`
- `AnchorSideTop` : `AnchorSide`
- `Anchors` : `Anchors`
- `AutoScroll` : `Boolean`
- `AutoSize` : `Boolean`
- `BiDiMode` : `BiDiMode`
- `BorderIcons` : `BorderIcons`
- `BorderStyle` : `FormBorderStyle`
- `BorderWidth` : `BorderWidth`
- `Caption` : `TranslateString`
- `ChildSizing` : `ControlChildSizing`
- `ClientHeight` : `LongInt`
- `ClientWidth` : `LongInt`
- `Color` : `GraphicsColor`
- `Constraints` : `SizeConstraints`
- `Cursor` : `Cursor`
- `DefaultMonitor` : `DefaultMonitor`
- `DesignTimePPI` : `LongInt`
- `DockSite` : `Boolean`
- `DoubleBuffered` : `Boolean`
- `DragKind` : `DragKind`
- `DragMode` : `DragMode`
- `Enabled` : `Boolean`
- `Font` : `Font`
- `FormStyle` : `FormStyle`
- `Height` : `LongInt`
- `HelpContext` : `HelpContext`
- `HelpFile` : `AnsiString`
- `HelpKeyword` : `AnsiString`
- `HelpType` : `HelpType`
- `Hint` : `TranslateString`
- `HorzScrollBar` : `ControlScrollBar`
- `Icon` : `Icon`
- `KeyPreview` : `Boolean`
- `LCLVersion` : `AnsiString`
- `Left` : `LongInt`
- `Menu` : `MainMenu`
- `Name` : `AnsiString`
- `OnActivate` : `NotifyEvent`
- `OnChangeBounds` : `NotifyEvent`
- `OnClick` : `NotifyEvent`
- `OnClose` : `CloseEvent`
- `OnCloseQuery` : `CloseQueryEvent`
- `OnConstrainedResize` : `ConstrainedResizeEvent`
- `OnContextPopup` : `ContextPopupEvent`
- `OnCreate` : `NotifyEvent`
- `OnDblClick` : `NotifyEvent`
- `OnDeactivate` : `NotifyEvent`
- `OnDestroy` : `NotifyEvent`
- `OnDockDrop` : `DockDropEvent`
- `OnDockOver` : `DockOverEvent`
- `OnDragDrop` : `DragDropEvent`
- `OnDragOver` : `DragOverEvent`
- `OnDropFiles` : `DropFilesEvent`
- `OnEndDock` : `EndDragEvent`
- `OnGetSiteInfo` : `GetSiteInfoEvent`
- `OnHelp` : `HelpEvent`
- `OnHide` : `NotifyEvent`
- `OnKeyDown` : `KeyEvent`
- `OnKeyPress` : `KeyPressEvent`
- `OnKeyUp` : `KeyEvent`
- `OnMouseDown` : `MouseEvent`
- `OnMouseEnter` : `NotifyEvent`
- `OnMouseLeave` : `NotifyEvent`
- `OnMouseMove` : `MouseMoveEvent`
- `OnMouseUp` : `MouseEvent`
- `OnMouseWheel` : `MouseWheelEvent`
- `OnMouseWheelDown` : `MouseWheelUpDownEvent`
- `OnMouseWheelHorz` : `MouseWheelEvent`
- `OnMouseWheelLeft` : `MouseWheelUpDownEvent`
- `OnMouseWheelRight` : `MouseWheelUpDownEvent`
- `OnMouseWheelUp` : `MouseWheelUpDownEvent`
- `OnPaint` : `NotifyEvent`
- `OnResize` : `NotifyEvent`
- `OnShortCut` : `ShortCutEvent`
- `OnShow` : `NotifyEvent`
- `OnShowHint` : `ControlShowHintEvent`
- `OnStartDock` : `StartDockEvent`
- `OnUTF8KeyPress` : `UTF8KeyPressEvent`
- `OnUnDock` : `UnDockEvent`
- `OnWindowStateChange` : `NotifyEvent`
- `ParentBiDiMode` : `Boolean`
- `ParentDoubleBuffered` : `Boolean`
- `ParentFont` : `Boolean`
- `PixelsPerInch` : `LongInt`
- `PopupMenu` : `PopupMenu`
- `PopupMode` : `PopupMode`
- `PopupParent` : `CustomForm`
- `Position` : `Position`
- `Scaled` : `Boolean`
- `ScreenSnap` : `Boolean`
- `SessionProperties` : `AnsiString`
- `ShowHint` : `Boolean`
- `ShowInTaskBar` : `ShowInTaskbar`
- `SnapBuffer` : `LongInt`
- `SnapOptions` : `WindowMagnetOptions`
- `Tag` : `Int64`
- `Top` : `LongInt`
- `UseDockManager` : `Boolean`
- `VertScrollBar` : `ControlScrollBar`
- `Visible` : `Boolean`
- `Width` : `LongInt`
- `WindowState` : `WindowState`

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| o.ActionList1 = value<br>result = o.ActionList1 | ActionList1: TActionList; |
| o.AddButton = value<br>result = o.AddButton | AddButton: TToolButton; |
| result = o.Collection | property Collection: TCollection read FCollection; |
| o.CollectionListBox = value<br>result = o.CollectionListBox | CollectionListBox: TListBox; |
| o:CollectionListBoxClick(Sender) | procedure CollectionListBoxClick(Sender: TObject); |
| o.DeleteButton = value<br>result = o.DeleteButton | DeleteButton: TToolButton; |
| o.DividerToolButton = value<br>result = o.DividerToolButton | DividerToolButton: TToolButton; |
| CloseAction = o:FormClose(Sender) | procedure FormClose(Sender: TObject; var  CloseAction: TCloseAction); |
| CloseAction = o:FormClose2(Sender,CloseAction) | procedure FormClose(Sender: TObject; var  CloseAction: TCloseAction); |
| o:FormCreate(Sender) | procedure FormCreate(Sender: TObject); |
| o:FormDestroy(Sender) | procedure FormDestroy(Sender: TObject); |
| o.MoveDownButton = value<br>result = o.MoveDownButton | MoveDownButton: TToolButton; |
| o.MoveUpButton = value<br>result = o.MoveUpButton | MoveUpButton: TToolButton; |
| result = o.OwnerPersistent | property OwnerPersistent: TPersistent read FOwnerPersistent; |
| result = o.PropertyName | property PropertyName: String read FPropertyName; |
| o:SetCollection(NewCollection,NewOwnerPersistent,NewPropName) | procedure SetCollection(NewCollection: TCollection; NewOwnerPersistent: TPersistent; const NewPropName: String); |
| o.ToolBar1 = value<br>result = o.ToolBar1 | ToolBar1: TToolBar; |
| o:UpdateButtons() | procedure UpdateButtons; |
| o.actAdd = value<br>result = o.actAdd | actAdd: TAction; |
| o:actAddExecute(Sender) | procedure actAddExecute(Sender: TObject); |
| o.actDel = value<br>result = o.actDel | actDel: TAction; |
| o:actDelExecute(Sender) | procedure actDelExecute(Sender: TObject); |
| o.actMoveDown = value<br>result = o.actMoveDown | actMoveDown: TAction; |
| o.actMoveUp = value<br>result = o.actMoveUp | actMoveUp: TAction; |
| o:actMoveUpDownExecute(Sender) | procedure actMoveUpDownExecute(Sender: TObject); |


<a id="ColorBox"></a>
### ColorBox

#### Published properties
- `Align` : `Align`
- `AnchorSideBottom` : `AnchorSide`
- `AnchorSideLeft` : `AnchorSide`
- `AnchorSideRight` : `AnchorSide`
- `AnchorSideTop` : `AnchorSide`
- `Anchors` : `Anchors`
- `ArrowKeysTraverseList` : `Boolean`
- `AutoComplete` : `Boolean`
- `AutoCompleteText` : `ComboBoxAutoCompleteText`
- `AutoDropDown` : `Boolean`
- `AutoSelect` : `Boolean`
- `AutoSize` : `Boolean`
- `BidiMode` : `BiDiMode`
- `BorderSpacing` : `ControlBorderSpacing`
- `Color` : `GraphicsColor`
- `ColorDialog` : `ColorDialog`
- `ColorRectOffset` : `LongInt`
- `ColorRectWidth` : `LongInt`
- `Constraints` : `SizeConstraints`
- `Cursor` : `Cursor`
- `DefaultColorColor` : `GraphicsColor`
- `DragCursor` : `Cursor`
- `DragMode` : `DragMode`
- `DropDownCount` : `LongInt`
- `Enabled` : `Boolean`
- `Font` : `Font`
- `Height` : `LongInt`
- `HelpContext` : `HelpContext`
- `HelpKeyword` : `AnsiString`
- `HelpType` : `HelpType`
- `Hint` : `TranslateString`
- `ItemHeight` : `LongInt`
- `ItemWidth` : `LongInt`
- `Left` : `LongInt`
- `Name` : `AnsiString`
- `NoneColorColor` : `GraphicsColor`
- `OnChange` : `NotifyEvent`
- `OnChangeBounds` : `NotifyEvent`
- `OnClick` : `NotifyEvent`
- `OnCloseUp` : `NotifyEvent`
- `OnContextPopup` : `ContextPopupEvent`
- `OnDblClick` : `NotifyEvent`
- `OnDragDrop` : `DragDropEvent`
- `OnDragOver` : `DragOverEvent`
- `OnDropDown` : `NotifyEvent`
- `OnEditingDone` : `NotifyEvent`
- `OnEndDrag` : `EndDragEvent`
- `OnEnter` : `NotifyEvent`
- `OnExit` : `NotifyEvent`
- `OnGetColors` : `GetColorsEvent`
- `OnKeyDown` : `KeyEvent`
- `OnKeyPress` : `KeyPressEvent`
- `OnKeyUp` : `KeyEvent`
- `OnMouseDown` : `MouseEvent`
- `OnMouseEnter` : `NotifyEvent`
- `OnMouseLeave` : `NotifyEvent`
- `OnMouseMove` : `MouseMoveEvent`
- `OnMouseUp` : `MouseEvent`
- `OnMouseWheel` : `MouseWheelEvent`
- `OnMouseWheelDown` : `MouseWheelUpDownEvent`
- `OnMouseWheelUp` : `MouseWheelUpDownEvent`
- `OnSelect` : `NotifyEvent`
- `OnStartDrag` : `StartDragEvent`
- `OnUTF8KeyPress` : `UTF8KeyPressEvent`
- `ParentBidiMode` : `Boolean`
- `ParentColor` : `Boolean`
- `ParentFont` : `Boolean`
- `ParentShowHint` : `Boolean`
- `PopupMenu` : `PopupMenu`
- `Selected` : `GraphicsColor`
- `ShowHint` : `Boolean`
- `Style` : `ColorBoxStyle`
- `TabOrder` : `TabOrder`
- `TabStop` : `Boolean`
- `Tag` : `Int64`
- `Top` : `LongInt`
- `Visible` : `Boolean`
- `Width` : `LongInt`

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| o.ColorDialog = value<br>result = o.ColorDialog | property ColorDialog:TcolorDialog read FColorDialog write FcolorDialog; |
| result = o:ColorNames(Index) | property ColorNames[Index: Integer]: string read GetColorName; |
| o.ColorRectOffset = value<br>result = o.ColorRectOffset | property ColorRectOffset: Integer read FColorRectOffset write SetColorRectOffset default cDefaultColorRectOffset; |
| o.ColorRectWidth = value<br>result = o.ColorRectWidth | property ColorRectWidth: Integer read GetColorRectWidth write SetColorRectWidth stored ColorRectWidthStored; |
| result = o:Colors(Index) | property Colors[Index: Integer]: TColor read GetColor; |
| o.DefaultColorColor = value<br>result = o.DefaultColorColor | property DefaultColorColor: TColor read FDefaultColorColor write SetDefaultColorColor default clBlack; |
| o.NoneColorColor = value<br>result = o.NoneColorColor | property NoneColorColor: TColor read FNoneColorColor write SetNoneColorColor default clBlack; |
| o.OnGetColors = function(Sender,Items) end | property OnGetColors: TGetColorsEvent read FOnGetColors write FOnGetColors; |
| o.Selected = value<br>result = o.Selected | property Selected: TColor read GetSelected write SetSelected default clBlack; |


<a id="ColorButton"></a>
### ColorButton

#### Published properties
- `Action` : `BasicAction`
- `Align` : `Align`
- `AllowAllUp` : `Boolean`
- `AnchorSideBottom` : `AnchorSide`
- `AnchorSideLeft` : `AnchorSide`
- `AnchorSideRight` : `AnchorSide`
- `AnchorSideTop` : `AnchorSide`
- `Anchors` : `Anchors`
- `BorderSpacing` : `ControlBorderSpacing`
- `BorderWidth` : `LongInt`
- `ButtonColor` : `GraphicsColor`
- `ButtonColorAutoSize` : `Boolean`
- `ButtonColorSize` : `LongInt`
- `Caption` : `TranslateString`
- `Color` : `GraphicsColor`
- `ColorDialog` : `ColorDialog`
- `Constraints` : `SizeConstraints`
- `Cursor` : `Cursor`
- `Down` : `Boolean`
- `Enabled` : `Boolean`
- `Flat` : `Boolean`
- `Font` : `Font`
- `GroupIndex` : `LongInt`
- `Height` : `LongInt`
- `HelpContext` : `HelpContext`
- `HelpKeyword` : `AnsiString`
- `HelpType` : `HelpType`
- `Hint` : `TranslateString`
- `Layout` : `ButtonLayout`
- `Left` : `LongInt`
- `Margin` : `LongInt`
- `Name` : `AnsiString`
- `OnChangeBounds` : `NotifyEvent`
- `OnClick` : `NotifyEvent`
- `OnColorChanged` : `NotifyEvent`
- `OnDblClick` : `NotifyEvent`
- `OnMouseDown` : `MouseEvent`
- `OnMouseEnter` : `NotifyEvent`
- `OnMouseLeave` : `NotifyEvent`
- `OnMouseMove` : `MouseMoveEvent`
- `OnMouseUp` : `MouseEvent`
- `OnMouseWheel` : `MouseWheelEvent`
- `OnMouseWheelDown` : `MouseWheelUpDownEvent`
- `OnMouseWheelUp` : `MouseWheelUpDownEvent`
- `OnPaint` : `NotifyEvent`
- `OnResize` : `NotifyEvent`
- `ParentFont` : `Boolean`
- `ParentShowHint` : `Boolean`
- `PopupMenu` : `PopupMenu`
- `ShowHint` : `Boolean`
- `Spacing` : `LongInt`
- `Tag` : `Int64`
- `Top` : `LongInt`
- `Transparent` : `Boolean`
- `Visible` : `Boolean`
- `Width` : `LongInt`

<a id="ColorDialog"></a>
### ColorDialog

#### Published properties
- `Color` : `GraphicsColor`
- `CustomColors` : `Strings`
- `HelpContext` : `HelpContext`
- `Name` : `AnsiString`
- `OnCanClose` : `CloseQueryEvent`
- `OnClose` : `NotifyEvent`
- `OnShow` : `NotifyEvent`
- `Tag` : `Int64`
- `Title` : `TranslateString`

<a id="ColorListBox"></a>
### ColorListBox

#### Published properties
- `Align` : `Align`
- `AnchorSideBottom` : `AnchorSide`
- `AnchorSideLeft` : `AnchorSide`
- `AnchorSideRight` : `AnchorSide`
- `AnchorSideTop` : `AnchorSide`
- `Anchors` : `Anchors`
- `BidiMode` : `BiDiMode`
- `BorderSpacing` : `ControlBorderSpacing`
- `BorderStyle` : `BorderStyle`
- `ClickOnSelChange` : `Boolean`
- `Color` : `GraphicsColor`
- `ColorDialog` : `ColorDialog`
- `ColorRectOffset` : `LongInt`
- `ColorRectWidth` : `LongInt`
- `Constraints` : `SizeConstraints`
- `Cursor` : `Cursor`
- `DefaultColorColor` : `GraphicsColor`
- `DragCursor` : `Cursor`
- `DragKind` : `DragKind`
- `DragMode` : `DragMode`
- `Enabled` : `Boolean`
- `ExtendedSelect` : `Boolean`
- `Font` : `Font`
- `Height` : `LongInt`
- `HelpContext` : `HelpContext`
- `HelpKeyword` : `AnsiString`
- `HelpType` : `HelpType`
- `Hint` : `TranslateString`
- `IntegralHeight` : `Boolean`
- `ItemHeight` : `LongInt`
- `Left` : `LongInt`
- `Name` : `AnsiString`
- `NoneColorColor` : `GraphicsColor`
- `OnChangeBounds` : `NotifyEvent`
- `OnClick` : `NotifyEvent`
- `OnContextPopup` : `ContextPopupEvent`
- `OnDblClick` : `NotifyEvent`
- `OnDragDrop` : `DragDropEvent`
- `OnDragOver` : `DragOverEvent`
- `OnEndDrag` : `EndDragEvent`
- `OnEnter` : `NotifyEvent`
- `OnExit` : `NotifyEvent`
- `OnGetColors` : `LBGetColorsEvent`
- `OnKeyDown` : `KeyEvent`
- `OnKeyPress` : `KeyPressEvent`
- `OnKeyUp` : `KeyEvent`
- `OnMouseDown` : `MouseEvent`
- `OnMouseEnter` : `NotifyEvent`
- `OnMouseLeave` : `NotifyEvent`
- `OnMouseMove` : `MouseMoveEvent`
- `OnMouseUp` : `MouseEvent`
- `OnMouseWheel` : `MouseWheelEvent`
- `OnMouseWheelDown` : `MouseWheelUpDownEvent`
- `OnMouseWheelHorz` : `MouseWheelEvent`
- `OnMouseWheelLeft` : `MouseWheelUpDownEvent`
- `OnMouseWheelRight` : `MouseWheelUpDownEvent`
- `OnMouseWheelUp` : `MouseWheelUpDownEvent`
- `OnResize` : `NotifyEvent`
- `OnSelectionChange` : `SelectionChangeEvent`
- `OnShowHint` : `ControlShowHintEvent`
- `OnStartDrag` : `StartDragEvent`
- `OnUTF8KeyPress` : `UTF8KeyPressEvent`
- `ParentBidiMode` : `Boolean`
- `ParentColor` : `Boolean`
- `ParentFont` : `Boolean`
- `ParentShowHint` : `Boolean`
- `PopupMenu` : `PopupMenu`
- `Selected` : `GraphicsColor`
- `ShowHint` : `Boolean`
- `Style` : `ColorBoxStyle`
- `TabOrder` : `TabOrder`
- `TabStop` : `Boolean`
- `Tag` : `Int64`
- `Top` : `LongInt`
- `TopIndex` : `LongInt`
- `Visible` : `Boolean`
- `Width` : `LongInt`

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| o.ColorDialog = value<br>result = o.ColorDialog | property ColorDialog:TColorDialog read fcolorDialog write FColorDialog; |
| result = o:ColorNames(Index) | property ColorNames[Index: Integer]: string read GetColorName; |
| o.ColorRectOffset = value<br>result = o.ColorRectOffset | property ColorRectOffset: Integer read FColorRectOffset write SetColorRectOffset default cDefaultColorRectOffset; |
| o.ColorRectWidth = value<br>result = o.ColorRectWidth | property ColorRectWidth: Integer read GetColorRectWidth write SetColorRectWidth stored ColorRectWidthStored; |
| result = o:Colors(Index)<br>o:Colors(Index,value) | property Colors[Index: Integer]: TColor read GetColors write SetColors; |
| o.DefaultColorColor = value<br>result = o.DefaultColorColor | property DefaultColorColor: TColor read FDefaultColorColor write SetDefaultColorColor default clBlack; |
| o.NoneColorColor = value<br>result = o.NoneColorColor | property NoneColorColor: TColor read FNoneColorColor write SetNoneColorColor default clBlack; |
| o.OnGetColors = function(Sender,Items) end | property OnGetColors: TLBGetColorsEvent read FOnGetColors write FOnGetColors; |
| o.Selected = value<br>result = o.Selected | property Selected: TColor read GetSelected write SetSelected default clBlack; |


<a id="ComboBox"></a>
### ComboBox

#### Published properties
- `Align` : `Align`
- `AnchorSideBottom` : `AnchorSide`
- `AnchorSideLeft` : `AnchorSide`
- `AnchorSideRight` : `AnchorSide`
- `AnchorSideTop` : `AnchorSide`
- `Anchors` : `Anchors`
- `ArrowKeysTraverseList` : `Boolean`
- `AutoComplete` : `Boolean`
- `AutoCompleteText` : `ComboBoxAutoCompleteText`
- `AutoDropDown` : `Boolean`
- `AutoSelect` : `Boolean`
- `AutoSize` : `Boolean`
- `BidiMode` : `BiDiMode`
- `BorderSpacing` : `ControlBorderSpacing`
- `BorderStyle` : `BorderStyle`
- `CharCase` : `EditCharCase`
- `Color` : `GraphicsColor`
- `Constraints` : `SizeConstraints`
- `Cursor` : `Cursor`
- `DoubleBuffered` : `Boolean`
- `DragCursor` : `Cursor`
- `DragKind` : `DragKind`
- `DragMode` : `DragMode`
- `DropDownCount` : `LongInt`
- `Enabled` : `Boolean`
- `Font` : `Font`
- `Height` : `LongInt`
- `HelpContext` : `HelpContext`
- `HelpKeyword` : `AnsiString`
- `HelpType` : `HelpType`
- `Hint` : `TranslateString`
- `ItemHeight` : `LongInt`
- `ItemIndex` : `LongInt`
- `ItemWidth` : `LongInt`
- `Items` : `Strings`
- `Left` : `LongInt`
- `MaxLength` : `LongInt`
- `Name` : `AnsiString`
- `OnChange` : `NotifyEvent`
- `OnChangeBounds` : `NotifyEvent`
- `OnClick` : `NotifyEvent`
- `OnCloseUp` : `NotifyEvent`
- `OnContextPopup` : `ContextPopupEvent`
- `OnDblClick` : `NotifyEvent`
- `OnDragDrop` : `DragDropEvent`
- `OnDragOver` : `DragOverEvent`
- `OnDrawItem` : `DrawItemEvent`
- `OnDropDown` : `NotifyEvent`
- `OnEditingDone` : `NotifyEvent`
- `OnEndDrag` : `EndDragEvent`
- `OnEnter` : `NotifyEvent`
- `OnExit` : `NotifyEvent`
- `OnGetItems` : `NotifyEvent`
- `OnKeyDown` : `KeyEvent`
- `OnKeyPress` : `KeyPressEvent`
- `OnKeyUp` : `KeyEvent`
- `OnMeasureItem` : `MeasureItemEvent`
- `OnMouseDown` : `MouseEvent`
- `OnMouseEnter` : `NotifyEvent`
- `OnMouseLeave` : `NotifyEvent`
- `OnMouseMove` : `MouseMoveEvent`
- `OnMouseUp` : `MouseEvent`
- `OnMouseWheel` : `MouseWheelEvent`
- `OnMouseWheelDown` : `MouseWheelUpDownEvent`
- `OnMouseWheelUp` : `MouseWheelUpDownEvent`
- `OnSelect` : `NotifyEvent`
- `OnStartDrag` : `StartDragEvent`
- `OnUTF8KeyPress` : `UTF8KeyPressEvent`
- `ParentBidiMode` : `Boolean`
- `ParentColor` : `Boolean`
- `ParentDoubleBuffered` : `Boolean`
- `ParentFont` : `Boolean`
- `ParentShowHint` : `Boolean`
- `PopupMenu` : `PopupMenu`
- `ReadOnly` : `Boolean`
- `ShowHint` : `Boolean`
- `Sorted` : `Boolean`
- `Style` : `ComboBoxStyle`
- `TabOrder` : `TabOrder`
- `TabStop` : `Boolean`
- `Tag` : `Int64`
- `Text` : `TranslateString`
- `TextHint` : `TranslateString`
- `Top` : `LongInt`
- `Visible` : `Boolean`
- `Width` : `LongInt`

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| o:AddHistoryItem(Item,MaxHistoryCount,SetAsText,CaseSensitive) | procedure AddHistoryItem(const Item: string; MaxHistoryCount: integer; SetAsText, CaseSensitive: boolean); |
| o:AddHistoryItem2(Item,AnObject,MaxHistoryCount,SetAsText,CaseSensitive) | procedure AddHistoryItem(const Item: string; AnObject: TObject; MaxHistoryCount: integer; SetAsText, CaseSensitive: boolean); |
| o:AddItem(Item,AnObject) | procedure AddItem(const Item: String; AnObject: TObject); virtual; |
| o.ArrowKeysTraverseList = value<br>result = o.ArrowKeysTraverseList | property ArrowKeysTraverseList: Boolean read FArrowKeysTraverseList write SetArrowKeysTraverseList default True; |
| o.AutoComplete = value<br>result = o.AutoComplete | property AutoComplete: boolean read GetAutoComplete write SetAutoComplete default False; |
| o.AutoCompleteText = value<br>result = o.AutoCompleteText | property AutoCompleteText: TComboBoxAutoCompleteText read FAutoCompleteText write FAutoCompleteText default DefaultComboBoxAutoCompleteText; |
| o.AutoDropDown = value<br>result = o.AutoDropDown | property AutoDropDown: Boolean read FAutoDropDown write FAutoDropDown default False; |
| o.AutoSelect = value<br>result = o.AutoSelect | property AutoSelect: Boolean read FAutoSelect write FAutoSelect default True; |
| o.AutoSelected = value<br>result = o.AutoSelected | property AutoSelected: Boolean read FAutoSelected write FAutoSelected; |
| result = o.Canvas | property Canvas: TCanvas read FCanvas; |
| o.CharCase = value<br>result = o.CharCase | property CharCase: TEditCharCase read FCharCase write SetCharCase default ecNormal; |
| o:Clear() | procedure Clear; virtual; |
| o:ClearSelection() | procedure ClearSelection; |
| o.DropDownCount = value<br>result = o.DropDownCount | property DropDownCount: Integer read FDropDownCount write SetDropDownCount default 8; |
| o.DroppedDown = value<br>result = o.DroppedDown | property DroppedDown: Boolean read GetDroppedDown write SetDroppedDown; |
| result = o.EmulatedTextHintStatus | property EmulatedTextHintStatus: TEmulatedTextHintStatus read FEmulatedTextHintStatus; |
| o:IntfGetItems() | procedure IntfGetItems; |
| o.ItemIndex = value<br>result = o.ItemIndex | property ItemIndex: integer read GetItemIndex write SetItemIndex default -1; |
| o.Items = value<br>result = o.Items | property Items: TStrings read FItems write SetItems; |
| result = o:MatchListItem(AValue) | function  MatchListItem(const AValue: TCaption): Integer; |
| o.OnChange = function(Sender) end | property OnChange: TNotifyEvent read FOnChange write FOnChange; |
| o.OnCloseUp = function(Sender) end | property OnCloseUp: TNotifyEvent read FOnCloseUp write FOnCloseUp; |
| o.OnDrawItem = function(Control,Index,ARect,State) end | property OnDrawItem: TDrawItemEvent read FOnDrawItem write FOnDrawItem; |
| o.OnDropDown = function(Sender) end | property OnDropDown: TNotifyEvent read FOnDropDown write FOnDropDown; |
| o.OnGetItems = function(Sender) end | property OnGetItems: TNotifyEvent read FOnGetItems write FOnGetItems; |
| o.OnMeasureItem = function(Control,Index,AHeight) return AHeight end | property OnMeasureItem: TMeasureItemEvent read FOnMeasureItem write FOnMeasureItem; |
| o.OnSelect = function(Sender) end | property OnSelect: TNotifyEvent read FOnSelect write FOnSelect; |
| o.ReadOnly = value<br>result = o.ReadOnly | property ReadOnly: Boolean read FReadOnly write SetReadOnly default False; |
| o.SelLength = value<br>result = o.SelLength | property SelLength: integer read GetSelLength write SetSelLength; |
| o.SelStart = value<br>result = o.SelStart | property SelStart: integer read GetSelStart write SetSelStart; |
| o.SelText = value<br>result = o.SelText | property SelText: String read GetSelText write SetSelText; |
| o:SelectAll() | procedure SelectAll; |
| o.Style = value<br>result = o.Style | property Style: TComboBoxStyle read FStyle write SetStyle default csDropDown; |
| o.TextHint = value<br>result = o.TextHint | property TextHint: TTranslateString read FTextHint write SetTextHint; |


<a id="CommonDialog"></a>
### CommonDialog

#### Published properties
- `HelpContext` : `HelpContext`
- `Name` : `AnsiString`
- `OnCanClose` : `CloseQueryEvent`
- `OnClose` : `NotifyEvent`
- `OnShow` : `NotifyEvent`
- `Tag` : `Int64`
- `Title` : `TranslateString`

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| o:Close() | procedure Close; virtual; |
| CanClose = o:DoCanClose() | procedure DoCanClose(var CanClose: Boolean); virtual; |
| CanClose = o:DoCanClose2(CanClose) | procedure DoCanClose(var CanClose: Boolean); virtual; |
| o:DoClose() | procedure DoClose; virtual; |
| o:DoShow() | procedure DoShow; virtual; |
| result = o:Execute() | function Execute: Boolean; virtual; |
| o.FCompStyle = value<br>result = o.FCompStyle | FCompStyle : LongInt; |
| o.Handle = value<br>result = o.Handle | property Handle: THandle read FHandle write SetHandle; |
| result = o:HandleAllocated() | function HandleAllocated: Boolean; |
| o.Height = value<br>result = o.Height | property Height: Integer read GetHeight write SetHeight; |
| o.OnDialogResult = function(Sender,Success) end | property OnDialogResult:TDialogResultEvent read FOnDialogResult write FOnDialogResult; platform; |
| o.UserChoice = value<br>result = o.UserChoice | property UserChoice: Integer read FUserChoice write FUserChoice; |
| o.Width = value<br>result = o.Width | property Width: Integer read GetWidth write SetWidth; |


<a id="Component"></a>
### Component

#### Published properties
- `Name` : `AnsiString`
- `Tag` : `Int64`

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| o:BeforeDestruction() | procedure BeforeDestruction; override; |
| result = o.ComponentCount | property ComponentCount: Integer read GetComponentCount; |
| o.ComponentIndex = value<br>result = o.ComponentIndex | property ComponentIndex: Integer read GetComponentIndex write SetComponentIndex; |
| result = o.ComponentState | property ComponentState: TComponentState read FComponentState; |
| result = o.ComponentStyle | property ComponentStyle: TComponentStyle read FComponentStyle; |
| result = o:Components(Index) | property Components[Index: Integer]: TComponent read GetComponent; |
| o.DesignInfo = value<br>result = o.DesignInfo | property DesignInfo: Longint read FDesignInfo write FDesignInfo; |
| o:DestroyComponents() | procedure DestroyComponents; |
| o:Destroying() | procedure Destroying; |
| result = o:ExecuteAction(Action) | function ExecuteAction(Action: TBasicAction): Boolean; dynamic; |
| result = o:FindComponent(AName) | function FindComponent(const AName: string): TComponent; |
| o:FreeNotification(AComponent) | procedure FreeNotification(AComponent: TComponent); |
| o:FreeOnRelease() | procedure FreeOnRelease; |
| result = o:GetParentComponent() | function GetParentComponent: TComponent; dynamic; |
| result = o:HasParent() | function HasParent: Boolean; dynamic; |
| o:InsertComponent(AComponent) | procedure InsertComponent(AComponent: TComponent); |
| result = o.Owner | property Owner: TComponent read FOwner; |
| o:RemoveComponent(AComponent) | procedure RemoveComponent(AComponent: TComponent); |
| o:RemoveFreeNotification(AComponent) | procedure RemoveFreeNotification(AComponent: TComponent); |
| o:SetSubComponent(ASubComponent) | procedure SetSubComponent(ASubComponent: Boolean); |
| result = o:UpdateAction(Action) | function UpdateAction(Action: TBasicAction): Boolean; dynamic; |
| o.VCLComObject = value<br>result = o.VCLComObject | property VCLComObject: Pointer read FVCLComObject write FVCLComObject; |


<a id="ContainedAction"></a>
### ContainedAction

#### Published properties
- `Category` : `AnsiString`
- `Name` : `AnsiString`
- `Tag` : `Int64`

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| o.ActionList = value<br>result = o.ActionList | property ActionList: TCustomActionList read FActionList write SetActionList; |
| o.Index = value<br>result = o.Index | property Index: Integer read GetIndex write SetIndex stored False; |


<a id="Control"></a>
### Control

#### Published properties
- `AnchorSideBottom` : `AnchorSide`
- `AnchorSideLeft` : `AnchorSide`
- `AnchorSideRight` : `AnchorSide`
- `AnchorSideTop` : `AnchorSide`
- `Cursor` : `Cursor`
- `Height` : `LongInt`
- `HelpContext` : `HelpContext`
- `HelpKeyword` : `AnsiString`
- `HelpType` : `HelpType`
- `Hint` : `TranslateString`
- `Left` : `LongInt`
- `Name` : `AnsiString`
- `Tag` : `Int64`
- `Top` : `LongInt`
- `Width` : `LongInt`

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| o.AccessibleDescription = value<br>result = o.AccessibleDescription | property AccessibleDescription: TCaption read GetAccessibleDescription write SetAccessibleDescription; |
| o.AccessibleName = value<br>result = o.AccessibleName | property AccessibleName: TCaption read GetAccessibleName write SetAccessibleName; |
| o.AccessibleRole = value<br>result = o.AccessibleRole | property AccessibleRole: TLazAccessibilityRole read GetAccessibleRole write SetAccessibleRole; |
| o.AccessibleValue = value<br>result = o.AccessibleValue | property AccessibleValue: TCaption read GetAccessibleValue write SetAccessibleValue; |
| o.Action = value<br>result = o.Action | property Action: TBasicAction read GetAction write SetAction; |
| o:ActiveDefaultControlChanged(NewControl) | procedure ActiveDefaultControlChanged(NewControl: TControl); virtual; |
| o:AdjustSize() | procedure AdjustSize; virtual; |
| o.Align = value<br>result = o.Align | property Align: TAlign read FAlign write SetAlign default alNone; |
| o:AnchorAsAlign(TheAlign,Space) | procedure AnchorAsAlign(TheAlign: TAlign; Space: TSpacingSize); |
| o:AnchorClient(Space) | procedure AnchorClient(Space: TSpacingSize); |
| o:AnchorHorizontalCenterTo(Sibling) | procedure AnchorHorizontalCenterTo(Sibling: TControl); |
| o:AnchorParallel(Side,Space,Sibling) | procedure AnchorParallel(Side: TAnchorKind; Space: TSpacingSize; Sibling: TControl); |
| o:AnchorSame(Side,Sibling) | procedure AnchorSame(Side: TAnchorKind; Sibling: TControl); |
| result = o:AnchorSide(Kind) | property AnchorSide[Kind: TAnchorKind]: TAnchorSide read GetAnchorSide; |
| o:AnchorToCompanion(Side,Space,Sibling)<br>o:AnchorToCompanion(Side,Space,Sibling,FreeCompositeSide) | procedure AnchorToCompanion(Side: TAnchorKind; Space: TSpacingSize; Sibling: TControl; FreeCompositeSide: Boolean = true); |
| o:AnchorToNeighbour(Side,Space,Sibling) | procedure AnchorToNeighbour(Side: TAnchorKind; Space: TSpacingSize; Sibling: TControl); |
| o:AnchorVerticalCenterTo(Sibling) | procedure AnchorVerticalCenterTo(Sibling: TControl); |
| result = o:AnchoredControlCount() | function AnchoredControlCount: Integer; |
| result = o:AnchoredControls(Index) | property AnchoredControls[Index: Integer]: TControl read GetAnchoredControls; |
| o.AutoSize = value<br>result = o.AutoSize | property AutoSize: Boolean read FAutoSize write SetAutoSize default False; |
| result = o:AutoSizeDelayed() | function AutoSizeDelayed: Boolean; virtual; |
| result = o:AutoSizeDelayedHandle() | function AutoSizeDelayedHandle: Boolean; virtual; |
| result = o:AutoSizeDelayedReport() | function AutoSizeDelayedReport: string; virtual; |
| result = o:AutoSizePhases() | function AutoSizePhases: TControlAutoSizePhases; virtual; |
| result = o.BaseBounds | property BaseBounds: TRect read FBaseBounds; |
| result = o.BaseParentClientSize | property BaseParentClientSize: TSize read FBaseParentClientSize; |
| o:BeforeDestruction() | procedure BeforeDestruction; override; |
| o:BeginDrag(Immediate)<br>o:BeginDrag(Immediate,Threshold) | procedure BeginDrag(Immediate: Boolean; Threshold: Integer = -1); |
| o.BiDiMode = value<br>result = o.BiDiMode | property BiDiMode: TBiDiMode read FBiDiMode write SetBiDiMode stored IsBiDiModeStored default bdLeftToRight; |
| o.BorderSpacing = value<br>result = o.BorderSpacing | property BorderSpacing: TControlBorderSpacing read FBorderSpacing write SetBorderSpacing; |
| o.BoundsRect = value<br>result = o.BoundsRect | property BoundsRect: TRect read GetBoundsRect write SetBoundsRect; |
| o.BoundsRectForNewParent = value<br>result = o.BoundsRectForNewParent | property BoundsRectForNewParent: TRect read FBoundsRectForNewParent write SetBoundsRectForNewParent; |
| o:BringToFront() | procedure BringToFront; |
| o:CNPreferredSizeChanged() | procedure CNPreferredSizeChanged; |
| o.Caption = value<br>result = o.Caption | property Caption: TCaption read GetText write SetText stored IsCaptionStored; |
| o:CheckNewParent(AParent) | procedure CheckNewParent(AParent: TWinControl); virtual; |
| o.ClientHeight = value<br>result = o.ClientHeight | property ClientHeight: Integer read GetClientHeight write SetClientHeight stored  IsClientHeightStored; |
| result = o.ClientOrigin | property ClientOrigin: TPoint read GetClientOrigin; |
| result = o.ClientRect | property ClientRect: TRect read GetClientRect; |
| result = o:ClientToParent(Point)<br>result = o:ClientToParent(Point,AParent) | function  ClientToParent(const Point: TPoint; AParent: TWinControl = nil): TPoint; |
| result = o:ClientToScreen(APoint) | function  ClientToScreen(const APoint: TPoint): TPoint; overload; virtual; |
| result = o:ClientToScreen2(ARect) | function  ClientToScreen(const ARect: TRect): TRect; overload; |
| o.ClientWidth = value<br>result = o.ClientWidth | property ClientWidth: Integer read GetClientWidth write SetClientWidth stored IsClientWidthStored; |
| o.Color = value<br>result = o.Color | property Color: TColor read FColor write SetColor stored ColorIsStored default  clWindow ; |
| o.Constraints = value<br>result = o.Constraints | property Constraints: TSizeConstraints read FConstraints write SetConstraints; |
| result = o.ControlOrigin | property ControlOrigin: TPoint read GetControlOrigin; |
| o.ControlState = value<br>result = o.ControlState | property ControlState: TControlState read FControlState write FControlState; |
| o.ControlStyle = value<br>result = o.ControlStyle | property ControlStyle: TControlStyle read FControlStyle write FControlStyle; |
| result = o:ControlToScreen(APoint) | function  ControlToScreen(const APoint: TPoint): TPoint; |
| o:DisableAutoSizing() | procedure DisableAutoSizing ; |
| o:Dock(NewDockSite,ARect) | procedure Dock(NewDockSite: TWinControl; ARect: TRect); virtual; |
| o.DockOrientation = value<br>result = o.DockOrientation | property DockOrientation: TDockOrientation read FDockOrientation write FDockOrientation; |
| result = o:Docked() | function Docked: Boolean; |
| o:DragDrop(Source,X,Y) | procedure DragDrop(Source: TObject; X,Y: Integer); virtual; |
| result = o:Dragging() | function Dragging: Boolean; |
| o:EditingDone() | procedure EditingDone; virtual; |
| o:EnableAutoSizing() | procedure EnableAutoSizing ; |
| o.Enabled = value<br>result = o.Enabled | property Enabled: Boolean read GetEnabled write SetEnabled stored IsEnabledStored default True; |
| o:EndDrag(Drop) | procedure EndDrag(Drop: Boolean); |
| o:ExecuteCancelAction() | procedure ExecuteCancelAction; virtual; |
| o:ExecuteDefaultAction() | procedure ExecuteDefaultAction; virtual; |
| o.FCompStyle = value<br>result = o.FCompStyle | FCompStyle: Byte; |
| result = o:FindSubComponent(AName) | function FindSubComponent(AName: string): TComponent; |
| o:FixDesignFontsPPI(ADesignTimePPI) | procedure FixDesignFontsPPI(const ADesignTimePPI: Integer); virtual; |
| result = o.Floating | property Floating: Boolean read GetFloating; |
| o.Font = value<br>result = o.Font | property Font: TFont read FFont write SetFont stored IsFontStored; |
| result = o:FormIsUpdating() | function FormIsUpdating: Boolean; virtual; |
| result = o:GetAnchorsDependingOnParent(WithNormalAnchors) | function GetAnchorsDependingOnParent(WithNormalAnchors: Boolean): TAnchors; |
| result = o:GetCanvasScaleFactor() | function GetCanvasScaleFactor: Double; |
| result = o:GetChildrenRect(Scrolled) | function GetChildrenRect(Scrolled: Boolean): TRect; virtual; |
| result = o:GetColorResolvingParent() | function GetColorResolvingParent: TColor; |
| result = o:GetDefaultColor(DefaultColorType) | function GetDefaultColor(const DefaultColorType: TDefaultColorType): TColor; virtual; |
| result = o:GetDefaultHeight() | function GetDefaultHeight: Integer; |
| result = o:GetDefaultWidth() | function GetDefaultWidth: Integer; |
| result = o:GetParentComponent() | function GetParentComponent: TComponent; override; |
| PreferredWidth, PreferredHeight = o:GetPreferredSize()<br>...<br>PreferredWidth, PreferredHeight = o:GetPreferredSize(Raw,WithThemeSpace) | procedure GetPreferredSize(var PreferredWidth, PreferredHeight: Integer; Raw: Boolean = false; WithThemeSpace: Boolean = true); virtual; |
| PreferredWidth, PreferredHeight = o:GetPreferredSize2(PreferredWidth,PreferredHeight)<br>...<br>PreferredWidth, PreferredHeight = o:GetPreferredSize2(PreferredWidth,PreferredHeight,Raw,WithThemeSpace) | procedure GetPreferredSize(var PreferredWidth, PreferredHeight: Integer; Raw: Boolean = false; WithThemeSpace: Boolean = true); virtual; |
| result = o:GetRGBColorResolvingParent() | function GetRGBColorResolvingParent: TColor; |
| result = o:GetSidePosition(Side) | function GetSidePosition(Side: TAnchorKind): Integer; |
| result = o:GetTextBuf(Buffer,BufSize) | function  GetTextBuf(Buffer: PChar; BufSize: Integer): Integer; virtual; |
| result = o:GetTextLen() | function  GetTextLen: Integer; virtual; |
| result = o:GetTopParent() | function GetTopParent: TControl; |
| result = o:HandleObjectShouldBeVisible() | function HandleObjectShouldBeVisible: Boolean; virtual; |
| result = o:HasHelp() | function HasHelp: Boolean; |
| result = o:HasParent() | function HasParent: Boolean; override; |
| o:Hide() | procedure Hide; |
| o.HostDockSite = value<br>result = o.HostDockSite | property HostDockSite: TWinControl read FHostDockSite write SetHostDockSite; |
| o:InitiateAction() | procedure InitiateAction; virtual; |
| o:Invalidate() | procedure Invalidate; virtual; |
| o:InvalidatePreferredSize() | procedure InvalidatePreferredSize; virtual; |
| o.IsControl = value<br>result = o.IsControl | property IsControl: Boolean read FIsControl write FIsControl; |
| result = o:IsControlVisible() | function IsControlVisible: Boolean; virtual; |
| result = o:IsEnabled() | function IsEnabled: Boolean; |
| result = o:IsParentColor() | function IsParentColor: Boolean; |
| result = o:IsParentFont() | function IsParentFont: Boolean; |
| result = o:IsParentOf(AControl) | function IsParentOf(AControl: TControl): Boolean; virtual; |
| result = o:IsProcessingPaintMsg() | function IsProcessingPaintMsg: Boolean; |
| result = o:IsVisible() | function IsVisible: Boolean; virtual; |
| o.LRDockWidth = value<br>result = o.LRDockWidth | property LRDockWidth: Integer read GetLRDockWidth write FLRDockWidth; |
| result = o:ManualDock(NewDockSite)<br>...<br>result = o:ManualDock(NewDockSite,DropControl,ControlSide,KeepDockSiteSize) | function ManualDock(NewDockSite: TWinControl; DropControl: TControl = nil; ControlSide: TAlign = alNone; KeepDockSiteSize: Boolean = true): Boolean; virtual; |
| result = o:ManualFloat(TheScreenRect)<br>result = o:ManualFloat(TheScreenRect,KeepDockSiteSize) | function ManualFloat(TheScreenRect: TRect; KeepDockSiteSize: Boolean = true): Boolean; virtual; |
| result = o.MouseInClient | property MouseInClient: Boolean read FMouseInClient; |
| o.OnChangeBounds = function(Sender) end | property OnChangeBounds: TNotifyEvent read FOnChangeBounds write FOnChangeBounds; |
| o.OnClick = function(Sender) end | property OnClick: TNotifyEvent read FOnClick write FOnClick; |
| o.OnConstrainedResize = function(Sender,MinWidth,MinHeight,MaxWidth,MaxHeight) return MinWidth,MinHeight,MaxWidth,MaxHeight end | property OnConstrainedResize: TConstrainedResizeEvent read FOnConstrainedResize write FOnConstrainedResize; |
| o.OnContextPopup = function(Sender,MousePos,Handled) return Handled end | property OnContextPopup: TContextPopupEvent read FOnContextPopup write FOnContextPopup; |
| o.OnDblClick = function(Sender) end | property OnDblClick: TNotifyEvent read FOnDblClick write FOnDblClick; |
| o.OnDragDrop = function(Sender,Source,X,Y) end | property OnDragDrop: TDragDropEvent read FOnDragDrop write FOnDragDrop; |
| o.OnDragOver = function(Sender,Source,X,Y,State,Accept) return Accept end | property OnDragOver: TDragOverEvent read FOnDragOver write FOnDragOver; |
| o.OnEditingDone = function(Sender) end | property OnEditingDone: TNotifyEvent read FOnEditingDone write FOnEditingDone; |
| o.OnEndDock = function(Sender,Target,X,Y) end | property OnEndDock: TEndDragEvent read FOnEndDock write FOnEndDock; |
| o.OnEndDrag = function(Sender,Target,X,Y) end | property OnEndDrag: TEndDragEvent read FOnEndDrag write FOnEndDrag; |
| o.OnMouseDown = function(Sender,Button,Shift,X,Y) end | property OnMouseDown: TMouseEvent read FOnMouseDown write FOnMouseDown; |
| o.OnMouseEnter = function(Sender) end | property OnMouseEnter: TNotifyEvent read FOnMouseEnter write FOnMouseEnter; |
| o.OnMouseLeave = function(Sender) end | property OnMouseLeave: TNotifyEvent read FOnMouseLeave write FOnMouseLeave; |
| o.OnMouseMove = function(Sender,Shift,X,Y) end | property OnMouseMove: TMouseMoveEvent read FOnMouseMove write FOnMouseMove; |
| o.OnMouseUp = function(Sender,Button,Shift,X,Y) end | property OnMouseUp: TMouseEvent read FOnMouseUp write FOnMouseUp; |
| o.OnMouseWheel = function(Sender,Shift,WheelDelta,MousePos,Handled) return Handled end | property OnMouseWheel: TMouseWheelEvent read FOnMouseWheel write FOnMouseWheel; |
| o.OnMouseWheelDown = function(Sender,Shift,MousePos,Handled) return Handled end | property OnMouseWheelDown: TMouseWheelUpDownEvent read FOnMouseWheelDown write FOnMouseWheelDown; |
| o.OnMouseWheelHorz = function(Sender,Shift,WheelDelta,MousePos,Handled) return Handled end | property OnMouseWheelHorz: TMouseWheelEvent read FOnMouseWheelHorz write FOnMouseWheelHorz; |
| o.OnMouseWheelLeft = function(Sender,Shift,MousePos,Handled) return Handled end | property OnMouseWheelLeft: TMouseWheelUpDownEvent read FOnMouseWheelLeft write FOnMouseWheelLeft; |
| o.OnMouseWheelRight = function(Sender,Shift,MousePos,Handled) return Handled end | property OnMouseWheelRight: TMouseWheelUpDownEvent read FOnMouseWheelRight write FOnMouseWheelRight; |
| o.OnMouseWheelUp = function(Sender,Shift,MousePos,Handled) return Handled end | property OnMouseWheelUp: TMouseWheelUpDownEvent read FOnMouseWheelUp write FOnMouseWheelUp; |
| o.OnQuadClick = function(Sender) end | property OnQuadClick: TNotifyEvent read FOnQuadClick write FOnQuadClick; |
| o.OnResize = function(Sender) end | property OnResize: TNotifyEvent read FOnResize write FOnResize; |
| o.OnStartDock = function(Sender,DragObject) return DragObject end | property OnStartDock: TStartDockEvent read FOnStartDock write FOnStartDock; |
| o.OnStartDrag = function(Sender,DragObject) return DragObject end | property OnStartDrag: TStartDragEvent read FOnStartDrag write FOnStartDrag; |
| o.OnTripleClick = function(Sender) end | property OnTripleClick: TNotifyEvent read FOnTripleClick write FOnTripleClick; |
| o.Parent = value<br>result = o.Parent | property Parent: TWinControl read FParent write SetParent; |
| o.ParentBiDiMode = value<br>result = o.ParentBiDiMode | property ParentBiDiMode: Boolean read FParentBiDiMode write SetParentBiDiMode default True; |
| result = o:ParentDestroyingHandle() | function ParentDestroyingHandle: Boolean; |
| result = o:ParentHandlesAllocated() | function ParentHandlesAllocated: Boolean; virtual; |
| result = o:ParentToClient(Point)<br>result = o:ParentToClient(Point,AParent) | function  ParentToClient(const Point: TPoint; AParent: TWinControl = nil): TPoint; |
| o.PopupMenu = value<br>result = o.PopupMenu | property PopupMenu: TPopupmenu read GetPopupmenu write SetPopupMenu; |
| result = o.ReadBounds | property ReadBounds: TRect read FReadBounds; |
| o:Refresh() | procedure Refresh; |
| o:RemoveAllHandlersOfObject(AnObject) | procedure RemoveAllHandlersOfObject(AnObject: TObject); override; |
| o:Repaint() | procedure Repaint; virtual; |
| result = o:ReplaceDockedControl(Control,NewDockSite,DropControl,ControlSide) | function ReplaceDockedControl(Control: TControl; NewDockSite: TWinControl; DropControl: TControl; ControlSide: TAlign): Boolean; |
| result = o:Scale96ToFont(ASize) | function Scale96ToFont(const ASize: Integer): Integer; |
| result = o:Scale96ToForm(ASize) | function Scale96ToForm(const ASize: Integer): Integer; |
| result = o:Scale96ToScreen(ASize) | function Scale96ToScreen(const ASize: Integer): Integer; |
| result = o:ScaleDesignToForm(ASize) | function ScaleDesignToForm(const ASize: Integer): Integer; |
| result = o:ScaleFontTo96(ASize) | function ScaleFontTo96(const ASize: Integer): Integer; |
| result = o:ScaleFontToScreen(ASize) | function ScaleFontToScreen(const ASize: Integer): Integer; |
| o:ScaleFontsPPI(AToPPI,AProportion) | procedure ScaleFontsPPI(const AToPPI: Integer; const AProportion: Double); virtual; |
| result = o:ScaleFormTo96(ASize) | function ScaleFormTo96(const ASize: Integer): Integer; |
| result = o:ScaleFormToDesign(ASize) | function ScaleFormToDesign(const ASize: Integer): Integer; |
| result = o:ScaleScreenTo96(ASize) | function ScaleScreenTo96(const ASize: Integer): Integer; |
| result = o:ScaleScreenToFont(ASize) | function ScaleScreenToFont(const ASize: Integer): Integer; |
| result = o:ScreenToClient(APoint) | function  ScreenToClient(const APoint: TPoint): TPoint; virtual; |
| result = o:ScreenToControl(APoint) | function  ScreenToControl(const APoint: TPoint): TPoint; |
| o:SendToBack() | procedure SendToBack; |
| o:SetBounds(aLeft,aTop,aWidth,aHeight) | procedure SetBounds(aLeft, aTop, aWidth, aHeight: Integer); virtual; |
| o:SetBoundsKeepBase(aLeft,aTop,aWidth,aHeight) | procedure SetBoundsKeepBase(aLeft, aTop, aWidth, aHeight: Integer ); virtual; |
| o:SetInitialBounds(aLeft,aTop,aWidth,aHeight) | procedure SetInitialBounds(aLeft, aTop, aWidth, aHeight: Integer); virtual; |
| o:SetTempCursor(Value) | procedure SetTempCursor(Value: TCursor); virtual; |
| o:SetTextBuf(Buffer) | procedure SetTextBuf(Buffer: PChar); virtual; |
| AWidth, AHeight = o:ShouldAutoAdjust() | procedure ShouldAutoAdjust(var AWidth, AHeight: Boolean); virtual; |
| AWidth, AHeight = o:ShouldAutoAdjust2(AWidth,AHeight) | procedure ShouldAutoAdjust(var AWidth, AHeight: Boolean); virtual; |
| o:Show() | procedure Show; |
| o:ShowHelp() | procedure ShowHelp; virtual; |
| o.ShowHint = value<br>result = o.ShowHint | property ShowHint: Boolean read FShowHint write SetShowHint stored IsShowHintStored default False; |
| o.TBDockHeight = value<br>result = o.TBDockHeight | property TBDockHeight: Integer read GetTBDockHeight write FTBDockHeight; |
| o.UndockHeight = value<br>result = o.UndockHeight | property UndockHeight: Integer read GetUndockHeight write FUndockHeight; |
| o.UndockWidth = value<br>result = o.UndockWidth | property UndockWidth: Integer read GetUndockWidth write FUndockWidth; |
| o:Update() | procedure Update; virtual; |
| o:UpdateBaseBounds(StoreBounds,StoreParentClientSize,UseLoadedValues) | procedure UpdateBaseBounds(StoreBounds, StoreParentClientSize, UseLoadedValues: Boolean); virtual; |
| o:UpdateRolesForForm() | procedure UpdateRolesForForm; virtual; |
| o.Visible = value<br>result = o.Visible | property Visible: Boolean read FVisible write SetVisible stored IsVisibleStored default True; |


<a id="ControlChildSizing"></a>
### ControlChildSizing

#### Published properties
- `ControlsPerLine` : `LongInt`
- `EnlargeHorizontal` : `ChildControlResizeStyle`
- `EnlargeVertical` : `ChildControlResizeStyle`
- `HorizontalSpacing` : `LongInt`
- `Layout` : `ControlChildrenLayout`
- `LeftRightSpacing` : `LongInt`
- `ShrinkHorizontal` : `ChildControlResizeStyle`
- `ShrinkVertical` : `ChildControlResizeStyle`
- `TopBottomSpacing` : `LongInt`
- `VerticalSpacing` : `LongInt`

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| o:AssignTo(Dest) | procedure AssignTo(Dest: TPersistent); override; |
| result = o.Control | property Control: TWinControl read FControl; |
| result = o:IsEqual(Sizing) | function IsEqual(Sizing: TControlChildSizing): Boolean; |
| o.OnChange = function(Sender) end | property OnChange: TNotifyEvent read FOnChange write FOnChange; |
| o:SetGridSpacing(Spacing) | procedure SetGridSpacing(Spacing: Integer); |


<a id="CoolBar"></a>
### CoolBar

#### Published properties
- `Align` : `Align`
- `AnchorSideBottom` : `AnchorSide`
- `AnchorSideLeft` : `AnchorSide`
- `AnchorSideRight` : `AnchorSide`
- `AnchorSideTop` : `AnchorSide`
- `Anchors` : `Anchors`
- `AutoSize` : `Boolean`
- `BandBorderStyle` : `BorderStyle`
- `BandMaximize` : `CoolBandMaximize`
- `Bands` : `CoolBands`
- `BiDiMode` : `BiDiMode`
- `Bitmap` : `Bitmap`
- `BorderWidth` : `BorderWidth`
- `Color` : `GraphicsColor`
- `Constraints` : `SizeConstraints`
- `Cursor` : `Cursor`
- `DockSite` : `Boolean`
- `DragCursor` : `Cursor`
- `DragKind` : `DragKind`
- `DragMode` : `DragMode`
- `EdgeBorders` : `EdgeBorders`
- `EdgeInner` : `EdgeStyle`
- `EdgeOuter` : `EdgeStyle`
- `Enabled` : `Boolean`
- `FixedOrder` : `Boolean`
- `FixedSize` : `Boolean`
- `Font` : `Font`
- `GrabStyle` : `GrabStyle`
- `GrabWidth` : `LongInt`
- `Height` : `LongInt`
- `HelpContext` : `HelpContext`
- `HelpKeyword` : `AnsiString`
- `HelpType` : `HelpType`
- `Hint` : `TranslateString`
- `HorizontalSpacing` : `LongInt`
- `Images` : `CustomImageList`
- `ImagesWidth` : `LongInt`
- `Left` : `LongInt`
- `Name` : `AnsiString`
- `OnChange` : `NotifyEvent`
- `OnClick` : `NotifyEvent`
- `OnContextPopup` : `ContextPopupEvent`
- `OnDblClick` : `NotifyEvent`
- `OnDockDrop` : `DockDropEvent`
- `OnDockOver` : `DockOverEvent`
- `OnDragDrop` : `DragDropEvent`
- `OnDragOver` : `DragOverEvent`
- `OnEndDock` : `EndDragEvent`
- `OnEndDrag` : `EndDragEvent`
- `OnGetSiteInfo` : `GetSiteInfoEvent`
- `OnMouseDown` : `MouseEvent`
- `OnMouseEnter` : `NotifyEvent`
- `OnMouseLeave` : `NotifyEvent`
- `OnMouseMove` : `MouseMoveEvent`
- `OnMouseUp` : `MouseEvent`
- `OnMouseWheel` : `MouseWheelEvent`
- `OnMouseWheelDown` : `MouseWheelUpDownEvent`
- `OnMouseWheelUp` : `MouseWheelUpDownEvent`
- `OnResize` : `NotifyEvent`
- `OnStartDock` : `StartDockEvent`
- `OnStartDrag` : `StartDragEvent`
- `OnUnDock` : `UnDockEvent`
- `ParentColor` : `Boolean`
- `ParentFont` : `Boolean`
- `ParentShowHint` : `Boolean`
- `PopupMenu` : `PopupMenu`
- `ShowHint` : `Boolean`
- `ShowText` : `Boolean`
- `Tag` : `Int64`
- `Themed` : `Boolean`
- `Top` : `LongInt`
- `Vertical` : `Boolean`
- `VerticalSpacing` : `LongInt`
- `Visible` : `Boolean`
- `Width` : `LongInt`

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| o:AutosizeBands() | procedure AutosizeBands; |
| o.BandBorderStyle = value<br>result = o.BandBorderStyle | property BandBorderStyle: TBorderStyle read FBandBorderStyle write SetBandBorderStyle default bsSingle; |
| o.BandMaximize = value<br>result = o.BandMaximize | property BandMaximize: TCoolBandMaximize read FBandMaximize write FBandMaximize default bmClick; |
| o.Bitmap = value<br>result = o.Bitmap | property Bitmap: TBitmap read FBitmap write SetBitmap; |
| o.FixedOrder = value<br>result = o.FixedOrder | property FixedOrder: Boolean read FFixedOrder write FFixedOrder default False; |
| o.FixedSize = value<br>result = o.FixedSize | property FixedSize: Boolean read FFixedSize write FFixedSize default False; |
| o.GrabStyle = value<br>result = o.GrabStyle | property GrabStyle: TGrabStyle read FGrabStyle write SetGrabStyle default cDefGrabStyle; |
| o.GrabWidth = value<br>result = o.GrabWidth | property GrabWidth: Integer read FGrabWidth write SetGrabWidth default cDefGrabWidth; |
| o.HorizontalSpacing = value<br>result = o.HorizontalSpacing | property HorizontalSpacing: Integer read FHorizontalSpacing write SetHorizontalSpacing default cDefHorSpacing; |
| o.Images = value<br>result = o.Images | property Images: TCustomImageList read FImages write SetImages; |
| o.ImagesWidth = value<br>result = o.ImagesWidth | property ImagesWidth: Integer read FImagesWidth write SetImagesWidth default 0; |
| ABand, AGrabber = o:MouseToBandPos(X,Y) | procedure MouseToBandPos(X, Y: Integer; out ABand: Integer; out AGrabber: Boolean); |
| o.OnChange = function(Sender) end | property OnChange: TNotifyEvent read FOnChange write FOnChange; |
| o.ShowText = value<br>result = o.ShowText | property ShowText: Boolean read FShowText write SetShowText default True; |
| o.Themed = value<br>result = o.Themed | property Themed: Boolean read FThemed write SetThemed default True; |
| o.Vertical = value<br>result = o.Vertical | property Vertical: Boolean read FVertical write SetVertical default False; |
| o.VerticalSpacing = value<br>result = o.VerticalSpacing | property VerticalSpacing: Integer read FVerticalSpacing write SetVerticalSpacing default cDefVertSpacing; |


<a id="CustomAbstractGroupedEdit"></a>
### CustomAbstractGroupedEdit

#### Published properties
- `AnchorSideBottom` : `AnchorSide`
- `AnchorSideLeft` : `AnchorSide`
- `AnchorSideRight` : `AnchorSide`
- `AnchorSideTop` : `AnchorSide`
- `Cursor` : `Cursor`
- `Height` : `LongInt`
- `HelpContext` : `HelpContext`
- `HelpKeyword` : `AnsiString`
- `HelpType` : `HelpType`
- `Hint` : `TranslateString`
- `Left` : `LongInt`
- `Name` : `AnsiString`
- `Tag` : `Int64`
- `Top` : `LongInt`
- `Width` : `LongInt`

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| o.Alignment = value<br>result = o.Alignment | property Alignment: TAlignment read GetAlignment write SetAlignment default taLeftJustify; |
| o.AutoSizeHeightIsEditHeight = value<br>result = o.AutoSizeHeightIsEditHeight | property AutoSizeHeightIsEditHeight: Boolean read FAutoSizeHeightIsEditHeight write FAutoSizeHeightIsEditHeight default True; |
| result = o.CanUndo | property CanUndo: Boolean read GetCanUndo; |
| o.CaretPos = value<br>result = o.CaretPos | property CaretPos: TPoint read GetCaretPos write SetCaretPos; |
| o.CharCase = value<br>result = o.CharCase | property CharCase: TEditCharCase read GetCharCase write SetCharCase default ecNormal; |
| o:Clear() | procedure Clear; |
| o:ClearSelection() | procedure ClearSelection; virtual; |
| o.Color = value<br>result = o.Color | property Color: TColor read GetColor write SetColor stored True default  clWindow ; |
| o:CopyToClipboard() | procedure CopyToClipboard; virtual; |
| o:CutToClipboard() | procedure CutToClipboard; virtual; |
| o.EchoMode = value<br>result = o.EchoMode | property EchoMode: TEchoMode read GetEchoMode write SetEchoMode default emNormal; |
| o.HideSelection = value<br>result = o.HideSelection | property HideSelection: Boolean read GetHideSelection write SetHideSelection default False; |
| o.MaxLength = value<br>result = o.MaxLength | property MaxLength: Integer read GetMaxLength write SetMaxLength; |
| o.Modified = value<br>result = o.Modified | property Modified: Boolean read GetModified write SetModified; |
| o.NumbersOnly = value<br>result = o.NumbersOnly | property NumbersOnly: Boolean read GetNumbersOnly write SetNumbersOnly default False; |
| o.OnBuddyClick = function(Sender) end | property OnBuddyClick: TNotifyEvent read FOnBuddyClick write FOnBuddyClick; |
| o.OnChange = function(Sender) end | property OnChange: TNotifyEvent read FOnEditChange write FOnEditChange; |
| o.OnClick = function(Sender) end | property OnClick: TNotifyEvent read FOnEditClick write FOnEditClick; |
| o.OnContextPopup = function(Sender,MousePos,Handled) return Handled end | property OnContextPopup: TContextPopupEvent read FOnEditContextPopup write FOnEditContextPopup; |
| o.OnDblClick = function(Sender) end | property OnDblClick: TNotifyEvent read FOnEditDblClick write FOnEditDblClick; |
| o.OnDragDrop = function(Sender,Source,X,Y) end | property OnDragDrop: TDragDropEvent read FOnEditDragDrop write FOnEditDragDrop; |
| o.OnDragOver = function(Sender,Source,X,Y,State,Accept) return Accept end | property OnDragOver: TDragOverEvent read FOnEditDragOver write FOnEditDragOver; |
| o.OnEditingDone = function(Sender) end | property OnEditingDone: TNotifyEvent read FOnEditEditingDone write FOnEditEditingDone; |
| o.OnEndDrag = function(Sender,Target,X,Y) end | property OnEndDrag: TEndDragEvent read FOnEditEndDrag write FOnEditEndDrag; |
| o.OnEnter = function(Sender) end | property OnEnter: TNotifyEvent read FOnEditEnter write FOnEditEnter; |
| o.OnExit = function(Sender) end | property OnExit: TNotifyEvent read FOnEditExit write FOnEditExit; |
| o.OnKeyDown = function(Sender,Key,Shift) return Key end | property OnKeyDown: TKeyEvent read FOnEditKeyDown write FOnEditKeyDown; |
| o.OnKeyPress = function(Sender,Key) return Key end | property OnKeyPress: TKeyPressEvent read FOnEditKeyPress write FOnEditKeyPress; |
| o.OnKeyUp = function(Sender,Key,Shift) return Key end | property OnKeyUp: TKeyEvent read FOnEditKeyUp write FOnEditKeyUp; |
| o.OnMouseDown = function(Sender,Button,Shift,X,Y) end | property OnMouseDown: TMouseEvent read FOnEditMouseDown write FOnEditMouseDown; |
| o.OnMouseEnter = function(Sender) end | property OnMouseEnter: TNotifyEvent read FOnEditMouseEnter write FOnEditMouseEnter; |
| o.OnMouseLeave = function(Sender) end | property OnMouseLeave: TNotifyEvent read FOnEditMouseLeave write FOnEditMouseLeave; |
| o.OnMouseMove = function(Sender,Shift,X,Y) end | property OnMouseMove: TMouseMoveEvent read FOnEditMouseMove write FOnEditMouseMove; |
| o.OnMouseUp = function(Sender,Button,Shift,X,Y) end | property OnMouseUp: TMouseEvent read FOnEditMouseUp write FOnEditMouseUp; |
| o.OnMouseWheel = function(Sender,Shift,WheelDelta,MousePos,Handled) return Handled end | property OnMouseWheel: TMouseWheelEvent read FOnEditMouseWheel write FOnEditMouseWheel; |
| o.OnMouseWheelDown = function(Sender,Shift,MousePos,Handled) return Handled end | property OnMouseWheelDown: TMouseWheelUpDownEvent read FOnEditMouseWheelDown write FOnEditMouseWheelDown; |
| o.OnMouseWheelUp = function(Sender,Shift,MousePos,Handled) return Handled end | property OnMouseWheelUp: TMouseWheelUpDownEvent read FOnEditMouseWheelUp write FOnEditMouseWheelUp; |
| o.OnStartDrag = function(Sender,DragObject) return DragObject end | property OnStartDrag: TStartDragEvent read FOnEditStartDrag write FOnEditStartDrag; |
| o.OnUtf8KeyPress = function(Sender,UTF8Key) return UTF8Key end | property OnUtf8KeyPress: TUtf8KeyPressEvent read FOnEditUtf8KeyPress write FOnEditUtf8KeyPress; |
| o.ParentColor = value<br>result = o.ParentColor | property ParentColor: Boolean read GetParentColor write SetParentColor default False; |
| o.PasswordChar = value<br>result = o.PasswordChar | property PasswordChar: char read GetPasswordChar write SetPasswordChar; |
| o:PasteFromClipboard() | procedure PasteFromClipboard; virtual; |
| o.PopupMenu = value<br>result = o.PopupMenu | property PopupMenu: TPopupMenu read GetEditPopupMenu write SetPopupMenu; |
| o.ReadOnly = value<br>result = o.ReadOnly | property ReadOnly: Boolean read GetReadOnly write SetReadOnly default False; |
| o.SelLength = value<br>result = o.SelLength | property SelLength: Integer read GetSelLength write SetSelLength; |
| o.SelStart = value<br>result = o.SelStart | property SelStart: Integer read GetSelStart write SetSelStart; |
| o.SelText = value<br>result = o.SelText | property SelText: String read GetSelText write SetSelText; |
| o:SelectAll() | procedure SelectAll; |
| o.TabStop = value<br>result = o.TabStop | property TabStop: Boolean read GetTabStop write SetTabStop default True; |
| o.TextHint = value<br>result = o.TextHint | property TextHint: TTranslateString read GetTextHint write SetTextHint; |
| o:Undo() | procedure Undo; virtual; |
| o:ValidateEdit() | procedure ValidateEdit; virtual; |


<a id="CustomApplication"></a>
### CustomApplication

#### Published properties
- `Name` : `AnsiString`
- `Tag` : `Int64`

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| o.CaseSensitiveOptions = value<br>result = o.CaseSensitiveOptions | Property CaseSensitiveOptions : Boolean Read FCaseSensitiveOptions Write FCaseSensitiveOptions; |
| result = o:CheckOptions(ShortOptions,Longopts,Opts,NonOpts)<br>result = o:CheckOptions(ShortOptions,Longopts,Opts,NonOpts,AllErrors) | Function CheckOptions(Const ShortOptions : String; Const Longopts : TStrings; Opts,NonOpts : TStrings; AllErrors : Boolean = False) : String; |
| result = o:CheckOptions2(ShortOptions,Longopts,Opts,NonOpts)<br>result = o:CheckOptions2(ShortOptions,Longopts,Opts,NonOpts,AllErrors) | Function CheckOptions(Const ShortOptions : String; Const Longopts : Array of string; Opts,NonOpts : TStrings; AllErrors : Boolean = False) : String; |
| result = o:CheckOptions3(ShortOptions,Longopts)<br>result = o:CheckOptions3(ShortOptions,Longopts,AllErrors) | Function CheckOptions(Const ShortOptions : String; Const Longopts : TStrings; AllErrors : Boolean = False) : String; |
| result = o:CheckOptions4(ShortOptions,LongOpts)<br>result = o:CheckOptions4(ShortOptions,LongOpts,AllErrors) | Function CheckOptions(Const ShortOptions : String; Const LongOpts : Array of string; AllErrors : Boolean = False) : String; |
| result = o:CheckOptions5(ShortOptions,LongOpts)<br>result = o:CheckOptions5(ShortOptions,LongOpts,AllErrors) | Function CheckOptions(Const ShortOptions : String; Const LongOpts : String; AllErrors : Boolean = False) : String; |
| result = o.ConsoleApplication | Property ConsoleApplication : Boolean Read GetConsoleApplication; |
| result = o:EnvironmentVariable(envName) | Property EnvironmentVariable[envName : String] : String Read GetEnvironmentVar; |
| o.EventLogFilter = value<br>result = o.EventLogFilter | Property EventLogFilter : TEventLogTypes Read FEventLogFilter Write FEventLogFilter; |
| o.ExceptionExitCode = value<br>result = o.ExceptionExitCode | Property ExceptionExitCode : Longint Read FExceptionExitCode Write FExceptionExitCode; |
| result = o.ExeName | property ExeName: string read GetExeName; |
| result, Longopt = o:FindOptionIndex(S)<br>result, Longopt = o:FindOptionIndex(S,StartAt) | function FindOptionIndex(Const S : String; Var Longopt : Boolean; StartAt : Integer = -1) : Integer; |
| result, Longopt = o:FindOptionIndex2(S,Longopt)<br>result, Longopt = o:FindOptionIndex2(S,Longopt,StartAt) | function FindOptionIndex(Const S : String; Var Longopt : Boolean; StartAt : Integer = -1) : Integer; |
| o:GetEnvironmentList(List,NamesOnly) | Procedure GetEnvironmentList(List : TStrings;NamesOnly : Boolean); |
| o:GetEnvironmentList2(List) | Procedure GetEnvironmentList(List : TStrings); |
| result = o:GetNonOptions(ShortOptions,Longopts) | Function GetNonOptions(Const ShortOptions : String; Const Longopts : Array of string) : TStringArray; |
| o:GetNonOptions2(ShortOptions,Longopts,NonOptions) | Procedure GetNonOptions(Const ShortOptions : String; Const Longopts : Array of string; NonOptions : TStrings); |
| result = o:GetOptionValue(S) | Function GetOptionValue(Const S : String) : String; |
| result = o:GetOptionValue2(C,S) | Function GetOptionValue(Const C: Char; Const S : String) : String; |
| result = o:GetOptionValues(C,S) | Function GetOptionValues(Const C: Char; Const S : String) : TStringArray; |
| o:HandleException(Sender) | procedure HandleException(Sender: TObject); virtual; |
| result = o:HasOption(S) | Function HasOption(Const S : String) : Boolean; |
| result = o:HasOption2(C,S) | Function HasOption(Const C : Char; Const S : String) : Boolean; |
| o.HelpFile = value<br>result = o.HelpFile | property HelpFile: string read FHelpFile write FHelpFile; |
| o:Initialize() | procedure Initialize; virtual; |
| result = o.Location | Property Location : String Read GetLocation; |
| o:Log(EventType,Msg) | Procedure Log(EventType : TEventType; const Msg : String); |
| o.OnException = function(Sender,E) end | property OnException: TExceptionEvent read FOnException write FOnException; |
| o.OptionChar = value<br>result = o.OptionChar | Property OptionChar : Char Read FoptionChar Write FOptionChar; |
| result = o.ParamCount | Property ParamCount : Integer Read GetParamCount; |
| result = o:Params(Index) | Property Params [Index : integer] : String Read GetParams; |
| o:Run() | procedure Run; |
| o:ShowException(E) | procedure ShowException(E: Exception);virtual; |
| o.SingleInstanceEnabled = value<br>result = o.SingleInstanceEnabled | Property SingleInstanceEnabled: Boolean read FSingleInstanceEnabled write FSingleInstanceEnabled; |
| o.StopOnException = value<br>result = o.StopOnException | Property StopOnException : Boolean Read FStopOnException Write FStopOnException; |
| o:Terminate() | procedure Terminate; virtual; |
| o:Terminate2(AExitCode) | procedure Terminate(AExitCode : Integer) ; virtual; |
| result = o.Terminated | property Terminated: Boolean read FTerminated; |
| o.Title = value<br>result = o.Title | property Title: string read FTitle write SetTitle; |


<a id="CustomBitmap"></a>
### CustomBitmap

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| o.Handle = value<br>result = o.Handle | property Handle: HBITMAP read GetBitmapHandle write SetBitmapHandle; |
| o.HandleType = value<br>result = o.HandleType | property HandleType: TBitmapHandleType read GetHandleType write SetHandleType; |
| o.Monochrome = value<br>result = o.Monochrome | property Monochrome: Boolean read GetMonochrome write SetMonochrome; |
| result = o:ReleaseHandle() | function ReleaseHandle: HBITMAP; |
| o:SetSize(AWidth,AHeight) | procedure SetSize(AWidth, AHeight: integer); override; |


<a id="CustomControl"></a>
### CustomControl

#### Published properties
- `AnchorSideBottom` : `AnchorSide`
- `AnchorSideLeft` : `AnchorSide`
- `AnchorSideRight` : `AnchorSide`
- `AnchorSideTop` : `AnchorSide`
- `Cursor` : `Cursor`
- `Height` : `LongInt`
- `HelpContext` : `HelpContext`
- `HelpKeyword` : `AnsiString`
- `HelpType` : `HelpType`
- `Hint` : `TranslateString`
- `Left` : `LongInt`
- `Name` : `AnsiString`
- `Tag` : `Int64`
- `Top` : `LongInt`
- `Width` : `LongInt`

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| o.Canvas = value<br>result = o.Canvas | property Canvas: TCanvas read FCanvas write FCanvas; |
| o.OnPaint = function(Sender) end | property OnPaint: TNotifyEvent read FOnPaint write FOnPaint; |


<a id="CustomForm"></a>
### CustomForm

#### Published properties
- `AnchorSideBottom` : `AnchorSide`
- `AnchorSideLeft` : `AnchorSide`
- `AnchorSideRight` : `AnchorSide`
- `AnchorSideTop` : `AnchorSide`
- `Cursor` : `Cursor`
- `Height` : `LongInt`
- `HelpContext` : `HelpContext`
- `HelpKeyword` : `AnsiString`
- `HelpType` : `HelpType`
- `Hint` : `TranslateString`
- `HorzScrollBar` : `ControlScrollBar`
- `Left` : `LongInt`
- `Name` : `AnsiString`
- `Tag` : `Int64`
- `Top` : `LongInt`
- `VertScrollBar` : `ControlScrollBar`
- `Width` : `LongInt`

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| result = o.Active | property Active: Boolean read FActive; |
| o.ActiveControl = value<br>result = o.ActiveControl | property ActiveControl: TWinControl read FActiveControl write SetActiveControl; |
| o.ActiveDefaultControl = value<br>result = o.ActiveDefaultControl | property ActiveDefaultControl: TControl read FActiveDefaultControl write SetActiveDefaultControl; |
| result = o:ActiveMDIChild() | function ActiveMDIChild: TCustomForm; virtual; |
| o:AfterConstruction() | procedure AfterConstruction; override; |
| o.AllowDropFiles = value<br>result = o.AllowDropFiles | property AllowDropFiles: Boolean read FAllowDropFiles write SetAllowDropFiles default False; |
| o.AlphaBlend = value<br>result = o.AlphaBlend | property AlphaBlend: Boolean read FAlphaBlend write SetAlphaBlend; |
| o.AlphaBlendValue = value<br>result = o.AlphaBlendValue | property AlphaBlendValue: Byte read FAlphaBlendValue write SetAlphaBlendValue; |
| o:AutoScale() | procedure AutoScale; |
| result = o:BigIconHandle() | function BigIconHandle: HICON; |
| o.BorderStyle = value<br>result = o.BorderStyle | property BorderStyle: TFormBorderStyle read FFormBorderStyle write SetFormBorderStyle default bsSizeable; |
| o.CancelControl = value<br>result = o.CancelControl | property CancelControl: TControl read FCancelControl write SetCancelControl; |
| o:Close() | procedure Close; |
| result = o:CloseQuery() | function CloseQuery: Boolean; virtual; |
| o.DefaultControl = value<br>result = o.DefaultControl | property DefaultControl: TControl read FDefaultControl write SetDefaultControl; |
| o.DefaultMonitor = value<br>result = o.DefaultMonitor | property DefaultMonitor: TDefaultMonitor read FDefaultMonitor write FDefaultMonitor default dmActiveForm; |
| o:DefocusControl(Control,Removing) | procedure DefocusControl(Control: TWinControl; Removing: Boolean); |
| o:DestroyWnd() | procedure DestroyWnd; override; |
| result = o.EffectiveShowInTaskBar | property EffectiveShowInTaskBar: TShowInTaskBar read GetEffectiveShowInTaskBar; |
| o:EnsureVisible()<br>o:EnsureVisible(AMoveToTop) | procedure EnsureVisible(AMoveToTop: Boolean = True); |
| o:FocusControl(WinControl) | procedure FocusControl(WinControl: TWinControl); |
| result = o.FormState | property FormState: TFormState read FFormState; |
| o.FormStyle = value<br>result = o.FormStyle | property FormStyle: TFormStyle read FFormStyle write SetFormStyle default fsNormal; |
| result = o:GetFormImage() | function GetFormImage: TBitmap; |
| result = o:GetMDIChildren(AIndex) | function GetMDIChildren(AIndex: Integer): TCustomForm; virtual; |
| result = o:GetRealPopupParent() | function GetRealPopupParent: TCustomForm; |
| result = o:GetRolesForControl(AControl) | function GetRolesForControl(AControl: TControl): TControlRolesForForm; |
| o.HelpFile = value<br>result = o.HelpFile | property HelpFile: string read FHelpFile write FHelpFile; |
| o:Hide() | procedure Hide; |
| o.Icon = value<br>result = o.Icon | property Icon: TIcon read FIcon write SetIcon stored IsIconStored; |
| o:IntfDropFiles(FileNames) | procedure IntfDropFiles(const FileNames: array of string); |
| o:IntfHelp(AComponent) | procedure IntfHelp(AComponent: TComponent); |
| o.KeyPreview = value<br>result = o.KeyPreview | property KeyPreview: Boolean read FKeyPreview write FKeyPreview default False; |
| result = o.LastActiveControl | property LastActiveControl: TWinControl read FLastActiveControl; |
| result = o:MDIChildCount() | function MDIChildCount: Integer; virtual; |
| result = o:MDIChildren(I) | property MDIChildren[I: Integer]: TCustomForm read GetMDIChildren; |
| o:MakeFullyVisible()<br>...<br>o:MakeFullyVisible(AMonitor,UseWorkarea) | procedure MakeFullyVisible(AMonitor: TMonitor = nil; UseWorkarea: Boolean = True); |
| o.Menu = value<br>result = o.Menu | property Menu : TMainMenu read FMenu write SetMenu; |
| o.ModalResult = value<br>result = o.ModalResult | property ModalResult : TModalResult read FModalResult write SetModalResult; |
| result = o.Monitor | property Monitor: TMonitor read GetMonitor; |
| o.OnActivate = function(Sender) end | property OnActivate: TNotifyEvent read FOnActivate write FOnActivate; |
| o.OnClose = function(Sender,CloseAction) return CloseAction end | property OnClose: TCloseEvent read FOnClose write FOnClose stored IsForm; |
| o.OnCloseQuery = function(Sender,CanClose) return CanClose end | property OnCloseQuery : TCloseQueryEvent read FOnCloseQuery write FOnCloseQuery stored IsForm; |
| o.OnCreate = function(Sender) end | property OnCreate: TNotifyEvent read FOnCreate write FOnCreate; |
| o.OnDeactivate = function(Sender) end | property OnDeactivate: TNotifyEvent read FOnDeactivate write FOnDeactivate; |
| o.OnDestroy = function(Sender) end | property OnDestroy: TNotifyEvent read FOnDestroy write FOnDestroy; |
| o.OnDropFiles = function(Sender,FileNames) end | property OnDropFiles: TDropFilesEvent read FOnDropFiles write FOnDropFiles; |
| o.OnHide = function(Sender) end | property OnHide: TNotifyEvent read FOnHide write FOnHide; |
| o.OnShow = function(Sender) end | property OnShow: TNotifyEvent read FOnShow write FOnShow; |
| o.OnShowModalFinished = function(Sender,AResult) end | property OnShowModalFinished: TModalDialogFinished read FOnShowModalFinished write FOnShowModalFinished; |
| o.OnWindowStateChange = function(Sender) end | property OnWindowStateChange: TNotifyEvent read FOnWindowStateChange write FOnWindowStateChange; |
| o.PopupMode = value<br>result = o.PopupMode | property PopupMode: TPopupMode read FPopupMode write SetPopupMode default pmNone; |
| o.PopupParent = value<br>result = o.PopupParent | property PopupParent: TCustomForm read FPopupParent write SetPopupParent; |
| o.Position = value<br>result = o.Position | property Position: TPosition read FPosition write SetPosition default poDesigned; |
| o:Release() | procedure Release; |
| result = o.RestoredHeight | property RestoredHeight: Integer read FRestoredHeight; |
| result = o.RestoredLeft | property RestoredLeft: Integer read FRestoredLeft; |
| result = o.RestoredTop | property RestoredTop: Integer read FRestoredTop; |
| result = o.RestoredWidth | property RestoredWidth: Integer read FRestoredWidth; |
| o.ScreenSnap = value<br>result = o.ScreenSnap | property ScreenSnap: boolean read GetScreenSnap write SetScreenSnap stored false; |
| result = o:SetFocusedControl(Control) | function SetFocusedControl(Control: TWinControl): Boolean ; virtual; |
| o:SetRestoredBounds(ALeft,ATop,AWidth,AHeight)<br>o:SetRestoredBounds(ALeft,ATop,AWidth,AHeight,ADefaultPosition) | procedure SetRestoredBounds(ALeft, ATop, AWidth, AHeight: Integer; const ADefaultPosition: Boolean = False); |
| o:Show() | procedure Show; |
| o.ShowInTaskBar = value<br>result = o.ShowInTaskBar | property ShowInTaskBar: TShowInTaskbar read FShowInTaskbar write SetShowInTaskBar default stDefault; |
| result = o:ShowModal() | function ShowModal: Integer; virtual; |
| o:ShowOnTop() | procedure ShowOnTop; |
| result = o:SmallIconHandle() | function SmallIconHandle: HICON; |
| o.SnapBuffer = value<br>result = o.SnapBuffer | property SnapBuffer: integer read GetSnapBuffer write SetSnapBuffer stored false; |
| o.SnapOptions = value<br>result = o.SnapOptions | property SnapOptions: TWindowMagnetOptions read FSnapOptions write SetSnapOptions; |
| o.WindowState = value<br>result = o.WindowState | property WindowState: TWindowState read FWindowState write SetWindowState default wsNormal; |


<a id="CustomGrid"></a>
### CustomGrid

#### Published properties
- `AnchorSideBottom` : `AnchorSide`
- `AnchorSideLeft` : `AnchorSide`
- `AnchorSideRight` : `AnchorSide`
- `AnchorSideTop` : `AnchorSide`
- `Cursor` : `Cursor`
- `Height` : `LongInt`
- `HelpContext` : `HelpContext`
- `HelpKeyword` : `AnsiString`
- `HelpType` : `HelpType`
- `Hint` : `TranslateString`
- `Left` : `LongInt`
- `Name` : `AnsiString`
- `Tag` : `Int64`
- `Top` : `LongInt`
- `Width` : `LongInt`

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| ARect = o:AdjustInnerCellRect() | procedure AdjustInnerCellRect(var ARect: TRect); |
| ARect = o:AdjustInnerCellRect2(ARect) | procedure AdjustInnerCellRect(var ARect: TRect); |
| o:AutoAdjustColumns() | procedure AutoAdjustColumns; virtual; |
| o:BeginUpdate() | procedure BeginUpdate; |
| result = o:CellRect(ACol,ARow) | function  CellRect(ACol, ARow: Integer): TRect; |
| result = o:CellToGridZone(aCol,aRow) | function  CellToGridZone(aCol,aRow: Integer): TGridZone; |
| o:CheckPosition() | procedure CheckPosition; |
| o:Clear() | procedure Clear; |
| result = o:ClearCols() | function ClearCols: Boolean; |
| result = o:ClearRows() | function ClearRows: Boolean; |
| o:ClearSelections() | procedure ClearSelections; |
| result = o.CursorState | property CursorState: TGridCursorState read FCursorState; |
| result = o:EditorByStyle(Style) | function  EditorByStyle(Style: TColumnButtonStyle): TWinControl; virtual; |
| Key = o:EditorKeyDown(Sender,Shift) | procedure EditorKeyDown(Sender: TObject; var Key:Word; Shift:TShiftState); |
| Key = o:EditorKeyDown2(Sender,Key,Shift) | procedure EditorKeyDown(Sender: TObject; var Key:Word; Shift:TShiftState); |
| Key = o:EditorKeyPress(Sender) | procedure EditorKeyPress(Sender: TObject; var Key: Char); |
| Key = o:EditorKeyPress2(Sender,Key) | procedure EditorKeyPress(Sender: TObject; var Key: Char); |
| key = o:EditorKeyUp(Sender,shift) | procedure EditorKeyUp(Sender: TObject; var key:Word; shift:TShiftState); |
| key = o:EditorKeyUp2(Sender,key,shift) | procedure EditorKeyUp(Sender: TObject; var key:Word; shift:TShiftState); |
| o:EditorTextChanged(aCol,aRow,aText) | procedure EditorTextChanged(const aCol,aRow: Integer; const aText:string); virtual; |
| UTF8Key = o:EditorUTF8KeyPress(Sender) | procedure EditorUTF8KeyPress(Sender: TObject; var UTF8Key: TUTF8Char); |
| UTF8Key = o:EditorUTF8KeyPress2(Sender,UTF8Key) | procedure EditorUTF8KeyPress(Sender: TObject; var UTF8Key: TUTF8Char); |
| o:EndUpdate()<br>o:EndUpdate(aRefresh) | procedure EndUpdate(aRefresh: boolean = true); |
| result = o:HasMultiSelection() | function  HasMultiSelection: Boolean; |
| o:HideSortArrow() | procedure HideSortArrow; |
| o:InvalidateCell(aCol,aRow) | procedure InvalidateCell(aCol, aRow: Integer); overload; |
| o:InvalidateCol(ACol) | procedure InvalidateCol(ACol: Integer); |
| o:InvalidateRange(aRange) | procedure InvalidateRange(const aRange: TRect); |
| o:InvalidateRow(ARow) | procedure InvalidateRow(ARow: Integer); |
| result = o:IsCellVisible(aCol,aRow) | function  IsCellVisible(aCol, aRow: Integer): Boolean; |
| result = o:IsFixedCellVisible(aCol,aRow) | function  IsFixedCellVisible(aCol, aRow: Integer): boolean; |
| o:LoadFromFile(FileName) | procedure LoadFromFile(FileName: string); virtual; |
| o:LoadFromStream(AStream) | procedure LoadFromStream(AStream: TStream); virtual; |
| result = o:MouseCoord(X,Y) | function  MouseCoord(X,Y: Integer): TGridCoord; |
| result = o:MouseToCell(Mouse) | function  MouseToCell(const Mouse: TPoint): TPoint; overload; |
| ACol, ARow = o:MouseToCell2(X,Y) | procedure MouseToCell(X,Y: Integer; out ACol,ARow: Longint); overload; |
| result = o:MouseToGridZone(X,Y) | function  MouseToGridZone(X,Y: Integer): TGridZone; |
| result = o:MouseToLogcell(Mouse) | function  MouseToLogcell(Mouse: TPoint): TPoint; |
| o.OnAfterSelection = function(Sender,aCol,aRow) end | property OnAfterSelection: TOnSelectEvent read FOnAfterSelection write FOnAfterSelection; |
| o.OnBeforeSelection = function(Sender,aCol,aRow) end | property OnBeforeSelection: TOnSelectEvent read FOnBeforeSelection write FOnBeforeSelection; |
| o.OnButtonClick = function(Sender,aCol,aRow) end | property OnButtonClick: TOnSelectEvent read FOnButtonClick write FOnButtonClick; |
| o.OnCheckboxToggled = function(Sender,aCol,aRow,aState) end | property OnCheckboxToggled: TToggledCheckboxEvent read FOnCheckboxToggled write FOnCheckboxToggled; |
| o.OnCompareCells = function(Sender,ACol,ARow,BCol,BRow,Result) return Result end | property OnCompareCells: TOnCompareCells read FOnCompareCells write FOnCompareCells; |
| o.OnDrawCell = function(Sender,aCol,aRow,aRect,aState) end | property OnDrawCell: TOnDrawCell read FOnDrawCell write FOnDrawCell; |
| o.OnGetCellHint = function(Sender,ACol,ARow,HintText) return HintText end | property OnGetCellHint : TGetCellHintEvent read FOnGetCellHint write FOnGetCellHint; |
| o.OnPickListSelect = function(Sender) end | property OnPickListSelect: TNotifyEvent read FOnPickListSelect write FOnPickListSelect; |
| o.OnPrepareCanvas = function(Sender,aCol,aRow,aState) end | property OnPrepareCanvas: TOnPrepareCanvasEvent read FOnPrepareCanvas write FOnPrepareCanvas; |
| o.OnSelectEditor = function(Sender,aCol,aRow,Editor) return Editor end | property OnSelectEditor: TSelectEditorEvent read FOnSelectEditor write FOnSelectEditor; |
| o.OnSelection = function(Sender,aCol,aRow) end | property OnSelection: TOnSelectEvent read fOnSelection write fOnSelection; |
| o.OnTopLeftChanged = function(Sender) end | property OnTopLeftChanged: TNotifyEvent read FOnTopLeftChanged write FOnTopLeftChanged; |
| o.OnUserCheckboxBitmap = function(Sender,aCol,aRow,CheckedState,ABitmap) return ABitmap end | property OnUserCheckboxBitmap: TUserCheckboxBitmapEvent read FOnUserCheckboxBitmap write FOnUserCheckboxBitmap; |
| o.OnUserCheckboxImage = function(Sender,aCol,aRow,CheckedState,ImageList,ImageIndex) return ImageList,ImageIndex end | property OnUserCheckboxImage: TUserCheckBoxImageEvent read FOnUserCheckboxImage write FOnUserCheckboxImage; |
| o.OnValidateEntry = function(Sender,aCol,aRow,OldValue,NewValue) return NewValue end | property OnValidateEntry: TValidateEntryEvent read FOnValidateEntry write FOnValidateEntry; |
| o:SaveToFile(FileName) | procedure SaveToFile(FileName: string); virtual; |
| o:SaveToStream(AStream) | procedure SaveToStream(AStream: TStream); virtual; |
| result = o:SelectedRange(AIndex) | property SelectedRange[AIndex: Integer]: TGridRect read GetSelectedRange; |
| result = o.SelectedRangeCount | property SelectedRangeCount: Integer read GetSelectedRangeCount; |
| result = o.SortColumn | property SortColumn: Integer read FSortColumn; |
| o.SortOrder = value<br>result = o.SortOrder | property SortOrder: TSortOrder read FSortOrder write FSortOrder; |


<a id="CustomMemoryStream"></a>
### CustomMemoryStream

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| result = o.Memory | property Memory: Pointer read FMemory; |
| o:SaveToFile(FileName) | procedure SaveToFile(const FileName: string); |
| o:SaveToStream(Stream) | procedure SaveToStream(Stream: TStream); |


<a id="CustomPage"></a>
### CustomPage

#### Published properties
- `AnchorSideBottom` : `AnchorSide`
- `AnchorSideLeft` : `AnchorSide`
- `AnchorSideRight` : `AnchorSide`
- `AnchorSideTop` : `AnchorSide`
- `Cursor` : `Cursor`
- `Height` : `LongInt`
- `HelpContext` : `HelpContext`
- `HelpKeyword` : `AnsiString`
- `HelpType` : `HelpType`
- `Hint` : `TranslateString`
- `Left` : `LongInt`
- `Name` : `AnsiString`
- `Tag` : `Int64`
- `Top` : `LongInt`
- `Width` : `LongInt`

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| result = o:CanTab() | function CanTab: boolean; override; |
| o.ImageIndex = value<br>result = o.ImageIndex | property ImageIndex: TImageIndex read FImageIndex write SetImageIndex default -1; |
| o.OnHide = function(Sender) end | property OnHide: TNotifyEvent read FOnHide write FOnHide; |
| o.OnShow = function(Sender) end | property OnShow: TNotifyEvent read FOnShow write FOnShow; |
| o.PageIndex = value<br>result = o.PageIndex | property PageIndex: Integer read GetPageIndex write SetPageIndex; |
| o.TabVisible = value<br>result = o.TabVisible | property TabVisible: Boolean read GetTabVisible write SetTabVisible default True; |
| result = o:VisibleIndex() | function VisibleIndex: integer; virtual; |


<a id="CustomPropertiesGrid"></a>
### CustomPropertiesGrid

#### Published properties
- `AnchorSideBottom` : `AnchorSide`
- `AnchorSideLeft` : `AnchorSide`
- `AnchorSideRight` : `AnchorSide`
- `AnchorSideTop` : `AnchorSide`
- `Cursor` : `Cursor`
- `Height` : `LongInt`
- `HelpContext` : `HelpContext`
- `HelpKeyword` : `AnsiString`
- `HelpType` : `HelpType`
- `Hint` : `TranslateString`
- `Left` : `LongInt`
- `Name` : `AnsiString`
- `Tag` : `Int64`
- `Top` : `LongInt`
- `Width` : `LongInt`

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| o.AutoFreeHook = value<br>result = o.AutoFreeHook | property AutoFreeHook: boolean read FAutoFreeHook write SetAutoFreeHook; |
| o.SaveOnChangeTIObject = value<br>result = o.SaveOnChangeTIObject | property SaveOnChangeTIObject: boolean read FSaveOnChangeTIObject write FSaveOnChangeTIObject default true; |
| o.TIObject = value<br>result = o.TIObject | property TIObject: TPersistent read GetTIObject write SetTIObject; |


<a id="CustomTabControl"></a>
### CustomTabControl

#### Published properties
- `AnchorSideBottom` : `AnchorSide`
- `AnchorSideLeft` : `AnchorSide`
- `AnchorSideRight` : `AnchorSide`
- `AnchorSideTop` : `AnchorSide`
- `Cursor` : `Cursor`
- `Height` : `LongInt`
- `HelpContext` : `HelpContext`
- `HelpKeyword` : `AnsiString`
- `HelpType` : `HelpType`
- `Hint` : `TranslateString`
- `Left` : `LongInt`
- `Name` : `AnsiString`
- `TabStop` : `Boolean`
- `Tag` : `Int64`
- `Top` : `LongInt`
- `Width` : `LongInt`

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| result = o:CanChangePageIndex() | function CanChangePageIndex: boolean; virtual; |
| result = o:CustomPage(Index) | function CustomPage(Index: integer): TCustomPage; |
| o:DoCloseTabClicked(APage) | procedure DoCloseTabClicked(APage: TCustomPage); virtual; |
| result = o:GetCapabilities() | function GetCapabilities: TCTabControlCapabilities; virtual; |
| result = o:GetImageIndex(ThePageIndex) | function GetImageIndex(ThePageIndex: Integer): Integer; virtual; |
| result = o:GetMinimumTabHeight() | function GetMinimumTabHeight: integer; virtual; |
| result = o:GetMinimumTabWidth() | function GetMinimumTabWidth: integer; virtual; |
| o.HotTrack = value<br>result = o.HotTrack | property HotTrack: Boolean read FHotTrack write FHotTrack default False; |
| o.Images = value<br>result = o.Images | property Images: TCustomImageList read FImages write SetImages; |
| o.ImagesWidth = value<br>result = o.ImagesWidth | property ImagesWidth: Integer read FImagesWidth write SetImagesWidth default 0; |
| result = o:IndexOf(APage) | function IndexOf(APage: TPersistent): integer; virtual; |
| o.MultiLine = value<br>result = o.MultiLine | property MultiLine: Boolean read GetMultiLine write SetMultiLine default False; |
| o.MultiSelect = value<br>result = o.MultiSelect | property MultiSelect: Boolean read FMultiSelect write FMultiSelect default False; |
| o.OnChange = function(Sender) end | property OnChange: TNotifyEvent read FOnPageChanged write FOnPageChanged; |
| o.OnChanging = function(Sender,AllowChange) return AllowChange end | property OnChanging: TTabChangingEvent read FOnChanging write FOnChanging; |
| o.OnCloseTabClicked = function(Sender) end | property OnCloseTabClicked: TNotifyEvent read FOnCloseTabClicked write FOnCloseTabClicked; |
| o.OnGetImageIndex = function(Sender,TabIndex,ImageIndex) return ImageIndex end | property OnGetImageIndex: TTabGetImageEvent read FOnGetImageIndex write FOnGetImageIndex; |
| o.Options = value<br>result = o.Options | property Options: TCTabControlOptions read FOptions write SetOptions default []; |
| o.OwnerDraw = value<br>result = o.OwnerDraw | property OwnerDraw: Boolean read FOwnerDraw write FOwnerDraw default False; |
| result = o:Page(Index) | property Page[Index: Integer]: TCustomPage read GetPage; |
| result = o.PageCount | property PageCount: integer read GetPageCount; |
| o.PageIndex = value<br>result = o.PageIndex | property PageIndex: Integer read FPageIndex write SetPageIndex default -1; |
| result = o:PageToTabIndex(AIndex) | function PageToTabIndex(AIndex: integer): integer; |
| o.Pages = value<br>result = o.Pages | property Pages: TStrings read FAccess write SetPages; |
| o.RaggedRight = value<br>result = o.RaggedRight | property RaggedRight: Boolean read FRaggedRight write FRaggedRight default False; |
| o.ScrollOpposite = value<br>result = o.ScrollOpposite | property ScrollOpposite: Boolean read FScrollOpposite write FScrollOpposite default False; |
| o.ShowTabs = value<br>result = o.ShowTabs | property ShowTabs: Boolean read FShowTabs write SetShowTabs default True; |
| o.Style = value<br>result = o.Style | property Style: TTabStyle read FStyle write SetStyle default tsTabs; |
| o.TabHeight = value<br>result = o.TabHeight | property TabHeight: Smallint read FTabHeight write SetTabHeight stored TabHeightIsStored; |
| o.TabPosition = value<br>result = o.TabPosition | property TabPosition: TTabPosition read FTabPosition write SetTabPosition default tpTop; |
| result = o:TabRect(AIndex) | function TabRect(AIndex: Integer): TRect; |
| result = o:TabToPageIndex(AIndex) | function TabToPageIndex(AIndex: integer): integer; |
| o.TabWidth = value<br>result = o.TabWidth | property TabWidth: Smallint read FTabWidth write SetTabWidth stored TabWidthIsStored; |


<a id="DateEdit"></a>
### DateEdit

#### Published properties
- `Action` : `BasicAction`
- `Align` : `Align`
- `Alignment` : `Alignment`
- `AnchorSideBottom` : `AnchorSide`
- `AnchorSideLeft` : `AnchorSide`
- `AnchorSideRight` : `AnchorSide`
- `AnchorSideTop` : `AnchorSide`
- `Anchors` : `Anchors`
- `AutoSelect` : `Boolean`
- `AutoSize` : `Boolean`
- `BidiMode` : `BiDiMode`
- `BorderSpacing` : `ControlBorderSpacing`
- `BorderStyle` : `BorderStyle`
- `ButtonCaption` : `TranslateString`
- `ButtonCursor` : `Cursor`
- `ButtonHint` : `TranslateString`
- `ButtonOnlyWhenFocused` : `Boolean`
- `ButtonWidth` : `LongInt`
- `CalendarDisplaySettings` : `DisplaySettings`
- `CharCase` : `EditCharCase`
- `Color` : `GraphicsColor`
- `Constraints` : `SizeConstraints`
- `Cursor` : `Cursor`
- `DateFormat` : `AnsiString`
- `DateOrder` : `DateOrder`
- `DefaultToday` : `Boolean`
- `DirectInput` : `Boolean`
- `DragMode` : `DragMode`
- `EchoMode` : `EchoMode`
- `Enabled` : `Boolean`
- `Flat` : `Boolean`
- `FocusOnButtonClick` : `Boolean`
- `Font` : `Font`
- `Glyph` : `Bitmap`
- `Height` : `LongInt`
- `HelpContext` : `HelpContext`
- `HelpKeyword` : `AnsiString`
- `HelpType` : `HelpType`
- `Hint` : `TranslateString`
- `ImageIndex` : `ImageIndex`
- `ImageWidth` : `LongInt`
- `Images` : `CustomImageList`
- `Layout` : `LeftRight`
- `Left` : `LongInt`
- `MaxDate` : `DateTime`
- `MaxLength` : `LongInt`
- `MinDate` : `DateTime`
- `Name` : `AnsiString`
- `NumGlyphs` : `LongInt`
- `OnAcceptDate` : `AcceptDateEvent`
- `OnButtonClick` : `NotifyEvent`
- `OnChange` : `NotifyEvent`
- `OnChangeBounds` : `NotifyEvent`
- `OnClick` : `NotifyEvent`
- `OnContextPopup` : `ContextPopupEvent`
- `OnCustomDate` : `CustomDateEvent`
- `OnDateRangeCheck` : `DateRangeCheckEvent`
- `OnDblClick` : `NotifyEvent`
- `OnEditingDone` : `NotifyEvent`
- `OnEnter` : `NotifyEvent`
- `OnExit` : `NotifyEvent`
- `OnKeyDown` : `KeyEvent`
- `OnKeyPress` : `KeyPressEvent`
- `OnKeyUp` : `KeyEvent`
- `OnMouseDown` : `MouseEvent`
- `OnMouseEnter` : `NotifyEvent`
- `OnMouseLeave` : `NotifyEvent`
- `OnMouseMove` : `MouseMoveEvent`
- `OnMouseUp` : `MouseEvent`
- `OnMouseWheel` : `MouseWheelEvent`
- `OnMouseWheelDown` : `MouseWheelUpDownEvent`
- `OnMouseWheelUp` : `MouseWheelUpDownEvent`
- `OnResize` : `NotifyEvent`
- `OnUTF8KeyPress` : `UTF8KeyPressEvent`
- `ParentBidiMode` : `Boolean`
- `ParentColor` : `Boolean`
- `ParentFont` : `Boolean`
- `ParentShowHint` : `Boolean`
- `PopupMenu` : `PopupMenu`
- `ReadOnly` : `Boolean`
- `ShowHint` : `Boolean`
- `Spacing` : `LongInt`
- `TabOrder` : `TabOrder`
- `TabStop` : `Boolean`
- `Tag` : `Int64`
- `Text` : `TranslateString`
- `TextHint` : `TranslateString`
- `Top` : `LongInt`
- `Visible` : `Boolean`
- `Width` : `LongInt`

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| o.Date = value<br>result = o.Date | property Date: TDateTime read GetDate write SetDate; |
| result = o.DroppedDown | property DroppedDown: Boolean read FDroppedDown; |
| result = o:GetDateFormat() | function GetDateFormat: string; |


<a id="DateTimePicker"></a>
### DateTimePicker

#### Published properties
- `Align` : `Align`
- `Alignment` : `Alignment`
- `AnchorSideBottom` : `AnchorSide`
- `AnchorSideLeft` : `AnchorSide`
- `AnchorSideRight` : `AnchorSide`
- `AnchorSideTop` : `AnchorSide`
- `Anchors` : `Anchors`
- `ArrowShape` : `ArrowShape`
- `AutoAdvance` : `Boolean`
- `AutoButtonSize` : `Boolean`
- `AutoSize` : `Boolean`
- `BiDiMode` : `BiDiMode`
- `BorderSpacing` : `ControlBorderSpacing`
- `BorderStyle` : `BorderStyle`
- `CalAlignment` : `DTCalAlignment`
- `Cascade` : `Boolean`
- `CenturyFrom` : `Word`
- `Checked` : `Boolean`
- `Color` : `GraphicsColor`
- `Constraints` : `SizeConstraints`
- `Cursor` : `Cursor`
- `CustomMonthNames` : `Strings`
- `Date` : `Date`
- `DateDisplayOrder` : `DateDisplayOrder`
- `DateMode` : `DTDateMode`
- `DateSeparator` : `AnsiString`
- `DecimalSeparator` : `AnsiString`
- `Enabled` : `Boolean`
- `Font` : `Font`
- `Height` : `LongInt`
- `HelpContext` : `HelpContext`
- `HelpKeyword` : `AnsiString`
- `HelpType` : `HelpType`
- `HideDateTimeParts` : `DateTimeParts`
- `Hint` : `TranslateString`
- `Kind` : `DateTimeKind`
- `LeadingZeros` : `Boolean`
- `Left` : `LongInt`
- `MaxDate` : `Date`
- `MinDate` : `Date`
- `MonthDisplay` : `MonthDisplay`
- `MonthNames` : `AnsiString`
- `Name` : `AnsiString`
- `NullInputAllowed` : `Boolean`
- `OnChange` : `NotifyEvent`
- `OnChangeBounds` : `NotifyEvent`
- `OnCheckBoxChange` : `NotifyEvent`
- `OnClick` : `NotifyEvent`
- `OnCloseUp` : `NotifyEvent`
- `OnContextPopup` : `ContextPopupEvent`
- `OnDblClick` : `NotifyEvent`
- `OnDropDown` : `NotifyEvent`
- `OnEditingDone` : `NotifyEvent`
- `OnEnter` : `NotifyEvent`
- `OnExit` : `NotifyEvent`
- `OnKeyDown` : `KeyEvent`
- `OnKeyPress` : `KeyPressEvent`
- `OnKeyUp` : `KeyEvent`
- `OnMouseDown` : `MouseEvent`
- `OnMouseEnter` : `NotifyEvent`
- `OnMouseLeave` : `NotifyEvent`
- `OnMouseMove` : `MouseMoveEvent`
- `OnMouseUp` : `MouseEvent`
- `OnMouseWheel` : `MouseWheelEvent`
- `OnMouseWheelDown` : `MouseWheelUpDownEvent`
- `OnMouseWheelUp` : `MouseWheelUpDownEvent`
- `OnResize` : `NotifyEvent`
- `OnShowHint` : `ControlShowHintEvent`
- `OnUTF8KeyPress` : `UTF8KeyPressEvent`
- `Options` : `DateTimePickerOptions`
- `ParentBiDiMode` : `Boolean`
- `ParentColor` : `Boolean`
- `ParentFont` : `Boolean`
- `ParentShowHint` : `Boolean`
- `PopupMenu` : `PopupMenu`
- `ReadOnly` : `Boolean`
- `ShowCheckBox` : `Boolean`
- `ShowHint` : `Boolean`
- `ShowMonthNames` : `Boolean`
- `TabOrder` : `TabOrder`
- `TabStop` : `Boolean`
- `Tag` : `Int64`
- `TextForNullDate` : `TranslateString`
- `Time` : `Time`
- `TimeDisplay` : `TimeDisplay`
- `TimeFormat` : `TimeFormat`
- `TimeSeparator` : `AnsiString`
- `Top` : `LongInt`
- `TrailingSeparator` : `Boolean`
- `UseDefaultSeparators` : `Boolean`
- `Visible` : `Boolean`
- `Width` : `LongInt`

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| result = o:DateIsNull() | function DateIsNull: Boolean; |
| o.OnChange = function(Sender) end | property OnChange: TNotifyEvent read FOnChange write FOnChange; |
| o.OnCheckBoxChange = function(Sender) end | property OnCheckBoxChange: TNotifyEvent read FOnCheckBoxChange write FOnCheckBoxChange; |
| o.OnCloseUp = function(Sender) end | property OnCloseUp: TNotifyEvent read FOnCloseUp write FOnCloseUp; |
| o.OnDropDown = function(Sender) end | property OnDropDown: TNotifyEvent read FOnDropDown write FOnDropDown; |
| o:Paint() | procedure Paint; override; |
| o:SelectDate() | procedure SelectDate; |
| o:SelectTime() | procedure SelectTime; |
| o:SendExternalKey(aKey) | procedure SendExternalKey(const aKey: Char); |
| o:SendExternalKeyCode(Key) | procedure SendExternalKeyCode(const Key: Word); |


<a id="DirectoryEdit"></a>
### DirectoryEdit

#### Published properties
- `Align` : `Align`
- `Alignment` : `Alignment`
- `AnchorSideBottom` : `AnchorSide`
- `AnchorSideLeft` : `AnchorSide`
- `AnchorSideRight` : `AnchorSide`
- `AnchorSideTop` : `AnchorSide`
- `Anchors` : `Anchors`
- `AutoSelect` : `Boolean`
- `AutoSize` : `Boolean`
- `BidiMode` : `BiDiMode`
- `BorderSpacing` : `ControlBorderSpacing`
- `BorderStyle` : `BorderStyle`
- `ButtonCaption` : `TranslateString`
- `ButtonCursor` : `Cursor`
- `ButtonHint` : `TranslateString`
- `ButtonOnlyWhenFocused` : `Boolean`
- `ButtonWidth` : `LongInt`
- `Color` : `GraphicsColor`
- `Constraints` : `SizeConstraints`
- `Cursor` : `Cursor`
- `DialogOptions` : `OpenOptions`
- `DialogTitle` : `AnsiString`
- `DirectInput` : `Boolean`
- `Directory` : `AnsiString`
- `DragCursor` : `Cursor`
- `DragMode` : `DragMode`
- `Enabled` : `Boolean`
- `Flat` : `Boolean`
- `FocusOnButtonClick` : `Boolean`
- `Font` : `Font`
- `Glyph` : `Bitmap`
- `Height` : `LongInt`
- `HelpContext` : `HelpContext`
- `HelpKeyword` : `AnsiString`
- `HelpType` : `HelpType`
- `Hint` : `TranslateString`
- `ImageIndex` : `ImageIndex`
- `ImageWidth` : `LongInt`
- `Images` : `CustomImageList`
- `Layout` : `LeftRight`
- `Left` : `LongInt`
- `MaxLength` : `LongInt`
- `Name` : `AnsiString`
- `NumGlyphs` : `LongInt`
- `OnAcceptDirectory` : `AcceptFileNameEvent`
- `OnButtonClick` : `NotifyEvent`
- `OnChange` : `NotifyEvent`
- `OnClick` : `NotifyEvent`
- `OnContextPopup` : `ContextPopupEvent`
- `OnDblClick` : `NotifyEvent`
- `OnDragDrop` : `DragDropEvent`
- `OnDragOver` : `DragOverEvent`
- `OnEditingDone` : `NotifyEvent`
- `OnEndDrag` : `EndDragEvent`
- `OnEnter` : `NotifyEvent`
- `OnExit` : `NotifyEvent`
- `OnKeyDown` : `KeyEvent`
- `OnKeyPress` : `KeyPressEvent`
- `OnKeyUp` : `KeyEvent`
- `OnMouseDown` : `MouseEvent`
- `OnMouseEnter` : `NotifyEvent`
- `OnMouseLeave` : `NotifyEvent`
- `OnMouseMove` : `MouseMoveEvent`
- `OnMouseUp` : `MouseEvent`
- `OnMouseWheel` : `MouseWheelEvent`
- `OnMouseWheelDown` : `MouseWheelUpDownEvent`
- `OnMouseWheelUp` : `MouseWheelUpDownEvent`
- `OnStartDrag` : `StartDragEvent`
- `OnUTF8KeyPress` : `UTF8KeyPressEvent`
- `ParentBidiMode` : `Boolean`
- `ParentColor` : `Boolean`
- `ParentFont` : `Boolean`
- `ParentShowHint` : `Boolean`
- `PopupMenu` : `PopupMenu`
- `ReadOnly` : `Boolean`
- `RootDir` : `AnsiString`
- `ShowHidden` : `Boolean`
- `ShowHint` : `Boolean`
- `Spacing` : `LongInt`
- `TabOrder` : `TabOrder`
- `TabStop` : `Boolean`
- `Tag` : `Int64`
- `Text` : `TranslateString`
- `TextHint` : `TranslateString`
- `Top` : `LongInt`
- `Visible` : `Boolean`
- `Width` : `LongInt`

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| o:RunDialog() | procedure RunDialog; virtual; |


<a id="DockManager"></a>
### DockManager

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| result = o:AutoFreeByControl() | function AutoFreeByControl: Boolean; virtual; |
| o:BeginUpdate() | procedure BeginUpdate; virtual; |
| result = o:CanBeDoubleDocked() | function CanBeDoubleDocked:Boolean; virtual; |
| o:EndUpdate() | procedure EndUpdate; virtual; |
| AControlBounds = o:GetControlBounds(Control) | procedure GetControlBounds(Control: TControl; out AControlBounds: TRect); virtual; abstract; |
| result = o:GetDockEdge(ADockObject) | function GetDockEdge(ADockObject: TDragDockObject): Boolean; virtual; |
| o:InsertControl(ADockObject) | procedure InsertControl(ADockObject: TDragDockObject); virtual; overload; |
| o:InsertControl2(Control,InsertAt,DropCtl) | procedure InsertControl(Control: TControl; InsertAt: TAlign; DropCtl: TControl); virtual; abstract; overload; |
| result = o:IsEnabledControl(Control) | function IsEnabledControl(Control: TControl):Boolean; virtual; |
| o:LoadFromStream(Stream) | procedure LoadFromStream(Stream: TStream); virtual; abstract; |
| o:PositionDockRect(ADockObject) | procedure PositionDockRect(ADockObject: TDragDockObject); virtual; overload; |
| DockRect = o:PositionDockRect2(Client,DropCtl,DropAlign) | procedure PositionDockRect(Client, DropCtl: TControl; DropAlign: TAlign; var DockRect: TRect); virtual; abstract; overload; |
| DockRect = o:PositionDockRect3(Client,DropCtl,DropAlign,DockRect) | procedure PositionDockRect(Client, DropCtl: TControl; DropAlign: TAlign; var DockRect: TRect); virtual; abstract; overload; |
| o:RemoveControl(Control) | procedure RemoveControl(Control: TControl); virtual; abstract; |
| o:ResetBounds(Force) | procedure ResetBounds(Force: Boolean); virtual; abstract; |
| o:SaveToStream(Stream) | procedure SaveToStream(Stream: TStream); virtual; abstract; |
| o:SetReplacingControl(Control) | procedure SetReplacingControl(Control: TControl); virtual; |


<a id="DockTree"></a>
### DockTree

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| ARect = o:AdjustDockRect(AControl) | procedure AdjustDockRect(AControl: TControl; var ARect: TRect); virtual; |
| ARect = o:AdjustDockRect2(AControl,ARect) | procedure AdjustDockRect(AControl: TControl; var ARect: TRect); virtual; |
| o.DockSite = value<br>result = o.DockSite | property DockSite: TWinControl read FDockSite write SetDockSite; |
| o:DumpLayout(FileName) | procedure DumpLayout(FileName: string); virtual; |
| result = o.RootZone | property RootZone: TDockZone read FRootZone; |


<a id="DockZone"></a>
### DockZone

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| o:AddAsFirstChild(NewChildZone) | procedure AddAsFirstChild(NewChildZone: TDockZone); |
| o:AddAsLastChild(NewChildZone) | procedure AddAsLastChild(NewChildZone: TDockZone); |
| o:AddSibling(NewZone,InsertAt) | procedure AddSibling(NewZone: TDockZone; InsertAt: TAlign); |
| result = o.ChildControl | property ChildControl: TControl read FChildControl; |
| result = o.ChildCount | property ChildCount: Integer read FChildCount; |
| result = o:FindZone(AControl) | function FindZone(AControl: TControl): TDockZone; |
| result = o.FirstChild | property FirstChild: TDockZone read FFirstChildZone; |
| result = o:FirstVisibleChild() | function FirstVisibleChild: TDockZone; |
| result = o:GetIndex() | function GetIndex: Integer; |
| result = o:GetLastChild() | function GetLastChild: TDockZone; |
| result = o:GetNextVisibleZone() | function GetNextVisibleZone: TDockZone; |
| o.Height = value<br>result = o.Height | property Height: Integer read GetHeight write SetHeight; |
| o.Left = value<br>result = o.Left | property Left: Integer read GetLeft write SetLeft; |
| o.LimitBegin = value<br>result = o.LimitBegin | property LimitBegin: Integer read GetLimitBegin write SetLimitBegin; |
| o.LimitSize = value<br>result = o.LimitSize | property LimitSize: Integer read GetLimitSize write SetLimitSize; |
| result = o.NextSibling | property NextSibling: TDockZone read FNextSibling; |
| result = o:NextVisible() | function NextVisible: TDockZone; |
| o.Orientation = value<br>result = o.Orientation | property Orientation: TDockOrientation read FOrientation write FOrientation; |
| result = o.Parent | property Parent: TDockZone read FParentZone; |
| result = o.PrevSibling | property PrevSibling: TDockZone read FPrevSibling; |
| result = o:PrevVisible() | function PrevVisible: TDockZone; |
| o:Remove(ChildZone) | procedure Remove(ChildZone: TDockZone); |
| o:ReplaceChild(OldChild,NewChild) | procedure ReplaceChild(OldChild, NewChild: TDockZone); |
| o.Top = value<br>result = o.Top | property Top: Integer read GetTop write SetTop; |
| result = o.Tree | property Tree: TDockTree read FTree; |
| result = o.Visible | property Visible: Boolean read GetVisible; |
| result = o.VisibleChildCount | property VisibleChildCount: Integer read GetVisibleChildCount; |
| o.Width = value<br>result = o.Width | property Width: Integer read GetWidth write SetWidth; |


<a id="DragControlObject"></a>
### DragControlObject

<a id="DragControlObjectEx"></a>
### DragControlObjectEx

<a id="DragDockObject"></a>
### DragDockObject

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| o.DockOffset = value<br>result = o.DockOffset | property DockOffset: TPoint read FDockOffset write FDockOffset; |
| o.DockRect = value<br>result = o.DockRect | property DockRect: TRect read FDockRect write FDockRect; |
| o.DropAlign = value<br>result = o.DropAlign | property DropAlign: TAlign read FDropAlign write FDropAlign; |
| o.DropOnControl = value<br>result = o.DropOnControl | property DropOnControl: TControl read FDropOnControl write FDropOnControl; |
| o.EraseDockRect = value<br>result = o.EraseDockRect | property EraseDockRect: TRect read FEraseDockRect write FEraseDockRect; |
| o.Floating = value<br>result = o.Floating | property Floating: Boolean read FFloating write FFloating; |
| result = o.IncreaseDockArea | property IncreaseDockArea: Boolean read FIncreaseDockArea; |


<a id="DragDockObjectEx"></a>
### DragDockObjectEx

<a id="DragObject"></a>
### DragObject

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| o.AlwaysShowDragImages = value<br>result = o.AlwaysShowDragImages | property AlwaysShowDragImages: Boolean read FAlwaysShowDragImages write FAlwaysShowDragImages; |
| result = o.AutoCreated | property AutoCreated: Boolean read FAutoCreated; |
| result = o.AutoFree | property AutoFree: Boolean read FAutoFree; |
| o.Control = value<br>result = o.Control | property Control: TControl read FControl write FControl; |
| o.DragPos = value<br>result = o.DragPos | property DragPos: TPoint read FDragPos write FDragPos; |
| o.DragTarget = value<br>result = o.DragTarget | property DragTarget: TControl read FDragTarget write FDragTarget; |
| o.DragTargetPos = value<br>result = o.DragTargetPos | property DragTargetPos: TPoint read FDragTargetPos write FDragTargetPos; |
| result = o.Dropped | property Dropped: Boolean read FDropped; |
| o:HideDragImage() | procedure HideDragImage; virtual; |
| o:ShowDragImage() | procedure ShowDragImage; virtual; |


<a id="DrawGrid"></a>
### DrawGrid

#### Published properties
- `Align` : `Align`
- `AlternateColor` : `GraphicsColor`
- `AnchorSideBottom` : `AnchorSide`
- `AnchorSideLeft` : `AnchorSide`
- `AnchorSideRight` : `AnchorSide`
- `AnchorSideTop` : `AnchorSide`
- `Anchors` : `Anchors`
- `AutoAdvance` : `AutoAdvance`
- `AutoEdit` : `Boolean`
- `AutoFillColumns` : `Boolean`
- `BorderSpacing` : `ControlBorderSpacing`
- `BorderStyle` : `BorderStyle`
- `ColCount` : `LongInt`
- `ColRowDragIndicatorColor` : `GraphicsColor`
- `ColRowDraggingCursor` : `Cursor`
- `ColSizingCursor` : `Cursor`
- `Color` : `GraphicsColor`
- `ColumnClickSorts` : `Boolean`
- `Columns` : `GridColumns`
- `Constraints` : `SizeConstraints`
- `Cursor` : `Cursor`
- `DefaultColWidth` : `LongInt`
- `DefaultDrawing` : `Boolean`
- `DefaultRowHeight` : `LongInt`
- `DoubleBuffered` : `Boolean`
- `DragCursor` : `Cursor`
- `DragKind` : `DragKind`
- `DragMode` : `DragMode`
- `Enabled` : `Boolean`
- `ExtendedSelect` : `Boolean`
- `FadeUnfocusedSelection` : `Boolean`
- `FixedColor` : `GraphicsColor`
- `FixedCols` : `LongInt`
- `FixedRows` : `LongInt`
- `Flat` : `Boolean`
- `Font` : `Font`
- `GridLineColor` : `GraphicsColor`
- `GridLineStyle` : `FPPenStyle`
- `GridLineWidth` : `LongInt`
- `HeaderHotZones` : `GridZoneSet`
- `HeaderPushZones` : `GridZoneSet`
- `Height` : `LongInt`
- `HelpContext` : `HelpContext`
- `HelpKeyword` : `AnsiString`
- `HelpType` : `HelpType`
- `Hint` : `TranslateString`
- `ImageIndexSortAsc` : `ImageIndex`
- `ImageIndexSortDesc` : `ImageIndex`
- `Left` : `LongInt`
- `MouseWheelOption` : `MouseWheelOption`
- `Name` : `AnsiString`
- `OnAfterSelection` : `OnSelectEvent`
- `OnBeforeSelection` : `OnSelectEvent`
- `OnButtonClick` : `OnSelectEvent`
- `OnCheckboxToggled` : `ToggledCheckboxEvent`
- `OnClick` : `NotifyEvent`
- `OnColRowDeleted` : `GridOperationEvent`
- `OnColRowExchanged` : `GridOperationEvent`
- `OnColRowInserted` : `GridOperationEvent`
- `OnColRowMoved` : `GridOperationEvent`
- `OnCompareCells` : `OnCompareCells`
- `OnContextPopup` : `ContextPopupEvent`
- `OnDblClick` : `NotifyEvent`
- `OnDragDrop` : `DragDropEvent`
- `OnDragOver` : `DragOverEvent`
- `OnDrawCell` : `OnDrawCell`
- `OnEditButtonClick` : `NotifyEvent`
- `OnEditingDone` : `NotifyEvent`
- `OnEndDock` : `EndDragEvent`
- `OnEndDrag` : `EndDragEvent`
- `OnEnter` : `NotifyEvent`
- `OnExit` : `NotifyEvent`
- `OnGetCellHint` : `GetCellHintEvent`
- `OnGetCheckboxState` : `GetCheckboxStateEvent`
- `OnGetEditMask` : `GetEditEvent`
- `OnGetEditText` : `GetEditEvent`
- `OnHeaderClick` : `HdrEvent`
- `OnHeaderSized` : `HdrEvent`
- `OnHeaderSizing` : `HeaderSizingEvent`
- `OnKeyDown` : `KeyEvent`
- `OnKeyPress` : `KeyPressEvent`
- `OnKeyUp` : `KeyEvent`
- `OnMouseDown` : `MouseEvent`
- `OnMouseEnter` : `NotifyEvent`
- `OnMouseLeave` : `NotifyEvent`
- `OnMouseMove` : `MouseMoveEvent`
- `OnMouseUp` : `MouseEvent`
- `OnMouseWheel` : `MouseWheelEvent`
- `OnMouseWheelDown` : `MouseWheelUpDownEvent`
- `OnMouseWheelHorz` : `MouseWheelEvent`
- `OnMouseWheelLeft` : `MouseWheelUpDownEvent`
- `OnMouseWheelRight` : `MouseWheelUpDownEvent`
- `OnMouseWheelUp` : `MouseWheelUpDownEvent`
- `OnPickListSelect` : `NotifyEvent`
- `OnPrepareCanvas` : `OnPrepareCanvasEvent`
- `OnSelectCell` : `OnSelectCellEvent`
- `OnSelectEditor` : `SelectEditorEvent`
- `OnSelection` : `OnSelectEvent`
- `OnSetCheckboxState` : `SetCheckboxStateEvent`
- `OnSetEditText` : `SetEditEvent`
- `OnStartDock` : `StartDockEvent`
- `OnStartDrag` : `StartDragEvent`
- `OnTopleftChanged` : `NotifyEvent`
- `OnUTF8KeyPress` : `UTF8KeyPressEvent`
- `OnUserCheckboxBitmap` : `UserCheckBoxBitmapEvent`
- `OnUserCheckboxImage` : `UserCheckBoxImageEvent`
- `OnValidateEntry` : `ValidateEntryEvent`
- `Options` : `GridOptions`
- `Options2` : `GridOptions2`
- `ParentColor` : `Boolean`
- `ParentDoubleBuffered` : `Boolean`
- `ParentFont` : `Boolean`
- `ParentShowHint` : `Boolean`
- `PopupMenu` : `PopupMenu`
- `RangeSelectMode` : `RangeSelectMode`
- `RowCount` : `LongInt`
- `RowSizingCursor` : `Cursor`
- `ScrollBars` : `ScrollStyle`
- `ShowHint` : `Boolean`
- `TabAdvance` : `AutoAdvance`
- `TabOrder` : `TabOrder`
- `TabStop` : `Boolean`
- `Tag` : `Int64`
- `TitleFont` : `Font`
- `TitleImageList` : `ImageList`
- `TitleImageListWidth` : `LongInt`
- `TitleStyle` : `TitleStyle`
- `Top` : `LongInt`
- `UseXORFeatures` : `Boolean`
- `Visible` : `Boolean`
- `VisibleColCount` : `LongInt`
- `VisibleRowCount` : `LongInt`
- `Width` : `LongInt`

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| aRect = o:DefaultDrawCell(aCol,aRow,aState) | procedure DefaultDrawCell(aCol,aRow: Integer; var aRect: TRect; aState:TGridDrawState); virtual; |
| aRect = o:DefaultDrawCell2(aCol,aRow,aRect,aState) | procedure DefaultDrawCell(aCol,aRow: Integer; var aRect: TRect; aState:TGridDrawState); virtual; |
| o:DeleteCol(Index) | procedure DeleteCol(Index: Integer); virtual; |
| o:DeleteColRow(IsColumn,index) | procedure DeleteColRow(IsColumn: Boolean; index: Integer); |
| o:DeleteRow(Index) | procedure DeleteRow(Index: Integer); virtual; |
| o:ExchangeColRow(IsColumn,index,WithIndex) | procedure ExchangeColRow(IsColumn: Boolean; index, WithIndex: Integer); virtual; |
| o:InsertColRow(IsColumn,index) | procedure InsertColRow(IsColumn: boolean; index: integer); |
| o:MoveColRow(IsColumn,FromIndex,ToIndex) | procedure MoveColRow(IsColumn: Boolean; FromIndex, ToIndex: Integer); |
| o.OnColRowDeleted = function(Sender,IsColumn,sIndex,tIndex) end | property OnColRowDeleted: TgridOperationEvent read FOnColRowDeleted write FOnColRowDeleted; |
| o.OnColRowExchanged = function(Sender,IsColumn,sIndex,tIndex) end | property OnColRowExchanged: TgridOperationEvent read FOnColRowExchanged write FOnColRowExchanged; |
| o.OnColRowInserted = function(Sender,IsColumn,sIndex,tIndex) end | property OnColRowInserted: TGridOperationEvent read FOnColRowInserted write FOnColRowInserted; |
| o.OnColRowMoved = function(Sender,IsColumn,sIndex,tIndex) end | property OnColRowMoved: TgridOperationEvent read FOnColRowMoved write FOnColRowMoved; |
| o.OnGetCheckboxState = function(Sender,ACol,ARow,Value) return Value end | property OnGetCheckboxState: TGetCheckboxStateEvent read FOnGetCheckboxState write FOnGetCheckboxState; |
| o.OnGetEditMask = function(Sender,ACol,ARow,Value) return Value end | property OnGetEditMask: TGetEditEvent read FOnGetEditMask write FOnGetEditMask; |
| o.OnGetEditText = function(Sender,ACol,ARow,Value) return Value end | property OnGetEditText: TGetEditEvent read FOnGetEditText write FOnGetEditText; |
| o.OnHeaderClick = function(Sender,IsColumn,Index) end | property OnHeaderClick: THdrEvent read FOnHeaderClick write FOnHeaderClick; |
| o.OnHeaderSized = function(Sender,IsColumn,Index) end | property OnHeaderSized: THdrEvent read FOnHeaderSized write FOnHeaderSized; |
| o.OnHeaderSizing = function(Sender,IsColumn,aIndex,aSize) end | property OnHeaderSizing: THeaderSizingEvent read FOnHeaderSizing write FOnHeaderSizing; |
| o.OnSelectCell = function(Sender,aCol,aRow,CanSelect) return CanSelect end | property OnSelectCell: TOnSelectCellEvent read FOnSelectCell write FOnSelectCell; |
| o.OnSetCheckboxState = function(Sender,ACol,ARow,Value) end | property OnSetCheckboxState: TSetCheckboxStateEvent read FOnSetCheckboxState write FOnSetCheckboxState; |
| o.OnSetEditText = function(Sender,ACol,ARow,Value) end | property OnSetEditText: TSetEditEvent read FOnSetEditText write FOnSetEditText; |
| o:SortColRow(IsColumn,index) | procedure SortColRow(IsColumn: Boolean; index:Integer); overload; |
| o:SortColRow2(IsColumn,Index,FromIndex,ToIndex) | procedure SortColRow(IsColumn: Boolean; Index,FromIndex,ToIndex: Integer); overload; |


<a id="Edit"></a>
### Edit

#### Published properties
- `Align` : `Align`
- `Alignment` : `Alignment`
- `AnchorSideBottom` : `AnchorSide`
- `AnchorSideLeft` : `AnchorSide`
- `AnchorSideRight` : `AnchorSide`
- `AnchorSideTop` : `AnchorSide`
- `Anchors` : `Anchors`
- `AutoSelect` : `Boolean`
- `AutoSize` : `Boolean`
- `BidiMode` : `BiDiMode`
- `BorderSpacing` : `ControlBorderSpacing`
- `BorderStyle` : `BorderStyle`
- `CharCase` : `EditCharCase`
- `Color` : `GraphicsColor`
- `Constraints` : `SizeConstraints`
- `Cursor` : `Cursor`
- `DoubleBuffered` : `Boolean`
- `DragCursor` : `Cursor`
- `DragKind` : `DragKind`
- `DragMode` : `DragMode`
- `EchoMode` : `EchoMode`
- `Enabled` : `Boolean`
- `Font` : `Font`
- `Height` : `LongInt`
- `HelpContext` : `HelpContext`
- `HelpKeyword` : `AnsiString`
- `HelpType` : `HelpType`
- `HideSelection` : `Boolean`
- `Hint` : `TranslateString`
- `Left` : `LongInt`
- `MaxLength` : `LongInt`
- `Name` : `AnsiString`
- `NumbersOnly` : `Boolean`
- `OnChange` : `NotifyEvent`
- `OnChangeBounds` : `NotifyEvent`
- `OnClick` : `NotifyEvent`
- `OnContextPopup` : `ContextPopupEvent`
- `OnDblClick` : `NotifyEvent`
- `OnDragDrop` : `DragDropEvent`
- `OnDragOver` : `DragOverEvent`
- `OnEditingDone` : `NotifyEvent`
- `OnEndDrag` : `EndDragEvent`
- `OnEnter` : `NotifyEvent`
- `OnExit` : `NotifyEvent`
- `OnKeyDown` : `KeyEvent`
- `OnKeyPress` : `KeyPressEvent`
- `OnKeyUp` : `KeyEvent`
- `OnMouseDown` : `MouseEvent`
- `OnMouseEnter` : `NotifyEvent`
- `OnMouseLeave` : `NotifyEvent`
- `OnMouseMove` : `MouseMoveEvent`
- `OnMouseUp` : `MouseEvent`
- `OnMouseWheel` : `MouseWheelEvent`
- `OnMouseWheelDown` : `MouseWheelUpDownEvent`
- `OnMouseWheelUp` : `MouseWheelUpDownEvent`
- `OnResize` : `NotifyEvent`
- `OnStartDrag` : `StartDragEvent`
- `OnUTF8KeyPress` : `UTF8KeyPressEvent`
- `ParentBidiMode` : `Boolean`
- `ParentColor` : `Boolean`
- `ParentDoubleBuffered` : `Boolean`
- `ParentFont` : `Boolean`
- `ParentShowHint` : `Boolean`
- `PasswordChar` : `Char`
- `PopupMenu` : `PopupMenu`
- `ReadOnly` : `Boolean`
- `ShowHint` : `Boolean`
- `TabOrder` : `TabOrder`
- `TabStop` : `Boolean`
- `Tag` : `Int64`
- `Text` : `TranslateString`
- `TextHint` : `TranslateString`
- `Top` : `LongInt`
- `Visible` : `Boolean`
- `Width` : `LongInt`

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| o.Alignment = value<br>result = o.Alignment | property Alignment: TAlignment read FAlignment write SetAlignment default taLeftJustify; |
| result = o.CanUndo | property CanUndo: Boolean read GetCanUndo; |
| o.CaretPos = value<br>result = o.CaretPos | property CaretPos: TPoint read GetCaretPos write SetCaretPos; |
| o.CharCase = value<br>result = o.CharCase | property CharCase: TEditCharCase read FCharCase write SetCharCase default ecNormal; |
| o:Clear() | procedure Clear; |
| o:ClearSelection() | procedure ClearSelection; virtual; |
| o:CopyToClipboard() | procedure CopyToClipboard; virtual; |
| o:CutToClipboard() | procedure CutToClipboard; virtual; |
| o.EchoMode = value<br>result = o.EchoMode | property EchoMode: TEchoMode read FEchoMode write SetEchoMode default emNormal; |
| result = o.EmulatedTextHintStatus | property EmulatedTextHintStatus: TEmulatedTextHintStatus read FEmulatedTextHintStatus; |
| o.HideSelection = value<br>result = o.HideSelection | property HideSelection: Boolean read FHideSelection write SetHideSelection default True; |
| o.MaxLength = value<br>result = o.MaxLength | property MaxLength: Integer read FMaxLength write SetMaxLength default 0; |
| o.Modified = value<br>result = o.Modified | property Modified: Boolean read GetModified write SetModified; |
| o.NumbersOnly = value<br>result = o.NumbersOnly | property NumbersOnly: Boolean read GetNumbersOnly write SetNumbersOnly default false; |
| o.OnChange = function(Sender) end | property OnChange: TNotifyEvent read FOnChange write FOnChange; |
| o.PasswordChar = value<br>result = o.PasswordChar | property PasswordChar: Char read FPasswordChar write SetPasswordChar default #0; |
| o:PasteFromClipboard() | procedure PasteFromClipboard; virtual; |
| o.ReadOnly = value<br>result = o.ReadOnly | property ReadOnly: Boolean read GetReadOnly write SetReadOnly default false; |
| o.SelLength = value<br>result = o.SelLength | property SelLength: integer read GetSelLength write SetSelLength; |
| o.SelStart = value<br>result = o.SelStart | property SelStart: integer read GetSelStart write SetSelStart; |
| o.SelText = value<br>result = o.SelText | property SelText: String read GetSelText write SetSelText; |
| o:SelectAll() | procedure SelectAll; virtual; |
| o.TextHint = value<br>result = o.TextHint | property TextHint: TTranslateString read GetTextHint write SetTextHint; |
| o:Undo() | procedure Undo; virtual; |


<a id="EditButton"></a>
### EditButton

#### Published properties
- `Action` : `BasicAction`
- `Align` : `Align`
- `Alignment` : `Alignment`
- `AnchorSideBottom` : `AnchorSide`
- `AnchorSideLeft` : `AnchorSide`
- `AnchorSideRight` : `AnchorSide`
- `AnchorSideTop` : `AnchorSide`
- `Anchors` : `Anchors`
- `AutoSelect` : `Boolean`
- `AutoSize` : `Boolean`
- `BiDiMode` : `BiDiMode`
- `BorderSpacing` : `ControlBorderSpacing`
- `BorderStyle` : `BorderStyle`
- `ButtonCaption` : `TranslateString`
- `ButtonCursor` : `Cursor`
- `ButtonHint` : `TranslateString`
- `ButtonOnlyWhenFocused` : `Boolean`
- `ButtonWidth` : `LongInt`
- `CharCase` : `EditCharCase`
- `Color` : `GraphicsColor`
- `Constraints` : `SizeConstraints`
- `Cursor` : `Cursor`
- `DirectInput` : `Boolean`
- `EchoMode` : `EchoMode`
- `Enabled` : `Boolean`
- `Flat` : `Boolean`
- `FocusOnButtonClick` : `Boolean`
- `Font` : `Font`
- `Glyph` : `Bitmap`
- `Height` : `LongInt`
- `HelpContext` : `HelpContext`
- `HelpKeyword` : `AnsiString`
- `HelpType` : `HelpType`
- `Hint` : `TranslateString`
- `ImageIndex` : `ImageIndex`
- `ImageWidth` : `LongInt`
- `Images` : `CustomImageList`
- `Layout` : `LeftRight`
- `Left` : `LongInt`
- `MaxLength` : `LongInt`
- `Name` : `AnsiString`
- `NumGlyphs` : `LongInt`
- `NumbersOnly` : `Boolean`
- `OnButtonClick` : `NotifyEvent`
- `OnChange` : `NotifyEvent`
- `OnClick` : `NotifyEvent`
- `OnContextPopup` : `ContextPopupEvent`
- `OnDblClick` : `NotifyEvent`
- `OnDragDrop` : `DragDropEvent`
- `OnDragOver` : `DragOverEvent`
- `OnEditingDone` : `NotifyEvent`
- `OnEndDrag` : `EndDragEvent`
- `OnEnter` : `NotifyEvent`
- `OnExit` : `NotifyEvent`
- `OnKeyDown` : `KeyEvent`
- `OnKeyPress` : `KeyPressEvent`
- `OnKeyUp` : `KeyEvent`
- `OnMouseDown` : `MouseEvent`
- `OnMouseEnter` : `NotifyEvent`
- `OnMouseLeave` : `NotifyEvent`
- `OnMouseMove` : `MouseMoveEvent`
- `OnMouseUp` : `MouseEvent`
- `OnMouseWheel` : `MouseWheelEvent`
- `OnMouseWheelDown` : `MouseWheelUpDownEvent`
- `OnMouseWheelUp` : `MouseWheelUpDownEvent`
- `OnStartDrag` : `StartDragEvent`
- `OnUTF8KeyPress` : `UTF8KeyPressEvent`
- `ParentBiDiMode` : `Boolean`
- `ParentColor` : `Boolean`
- `ParentFont` : `Boolean`
- `ParentShowHint` : `Boolean`
- `PasswordChar` : `Char`
- `PopupMenu` : `PopupMenu`
- `ReadOnly` : `Boolean`
- `ShowHint` : `Boolean`
- `Spacing` : `LongInt`
- `TabOrder` : `TabOrder`
- `TabStop` : `Boolean`
- `Tag` : `Int64`
- `Text` : `TranslateString`
- `TextHint` : `TranslateString`
- `Top` : `LongInt`
- `Visible` : `Boolean`
- `Width` : `LongInt`

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| o.OnButtonClick = function(Sender) end | property OnButtonClick: TNotifyEvent read GetOnButtonClick write SetOnButtonClick; |


<a id="Exception"></a>
### Exception

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| o.HelpContext = value<br>result = o.HelpContext | property HelpContext : longint read fhelpcontext write fhelpcontext; |
| o.Message = value<br>result = o.Message | property Message : string read fmessage write fmessage; |
| result = o:ToString() | Function ToString : String; override; |


<a id="FPCustomFont"></a>
### FPCustomFont

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| o.Bold = value<br>result = o.Bold | property Bold : boolean index 5 read GetFlags write SetFlags; |
| result = o:CopyFont() | function CopyFont : TFPCustomFont; |
| result = o:GetTextHeight(text) | function GetTextHeight (text:string) : integer; |
| w, h = o:GetTextSize(text) | procedure GetTextSize (text:string; var w,h:integer); |
| w, h = o:GetTextSize2(text,w,h) | procedure GetTextSize (text:string; var w,h:integer); |
| result = o:GetTextWidth(text) | function GetTextWidth (text:string) : integer; |
| o.Italic = value<br>result = o.Italic | property Italic : boolean index 6 read GetFlags write SetFlags; |
| o.Name = value<br>result = o.Name | property Name : string read FName write SetName; |
| o.Orientation = value<br>result = o.Orientation | property Orientation: Integer read GetOrientation write SetOrientation default 0; |
| o.Size = value<br>result = o.Size | property Size : integer read FSize write SetSize; |
| o.StrikeThrough = value<br>result = o.StrikeThrough | property StrikeThrough : boolean index 8 read GetFlags write SetFlags; |
| o.Underline = value<br>result = o.Underline | property Underline : boolean index 7 read GetFlags write SetFlags; |


<a id="FileDialog"></a>
### FileDialog

#### Published properties
- `DefaultExt` : `AnsiString`
- `FileName` : `AnsiString`
- `Filter` : `AnsiString`
- `FilterIndex` : `LongInt`
- `HelpContext` : `HelpContext`
- `InitialDir` : `AnsiString`
- `Name` : `AnsiString`
- `OnCanClose` : `CloseQueryEvent`
- `OnClose` : `NotifyEvent`
- `OnHelpClicked` : `NotifyEvent`
- `OnShow` : `NotifyEvent`
- `OnTypeChange` : `NotifyEvent`
- `Tag` : `Int64`
- `Title` : `TranslateString`

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| o:DoTypeChange() | procedure DoTypeChange; virtual; |
| result = o:ExtractAllFilterMasks(aFilter)<br>result = o:ExtractAllFilterMasks(aFilter,SkipAllFilesMask) | class function ExtractAllFilterMasks(aFilter: string; SkipAllFilesMask: Boolean = true): string; |
| result = o.Files | property Files: TStrings read FFiles; |
| result = o:FindMaskInFilter(aFilter,aMask) | class function FindMaskInFilter(aFilter, aMask: string): Integer; |
| o.HistoryList = value<br>result = o.HistoryList | property HistoryList: TStrings read FHistoryList write SetHistoryList; |
| o:IntfFileTypeChanged(NewFilterIndex) | procedure IntfFileTypeChanged(NewFilterIndex: Integer); |


<a id="FileNameEdit"></a>
### FileNameEdit

#### Published properties
- `Align` : `Align`
- `Alignment` : `Alignment`
- `AnchorSideBottom` : `AnchorSide`
- `AnchorSideLeft` : `AnchorSide`
- `AnchorSideRight` : `AnchorSide`
- `AnchorSideTop` : `AnchorSide`
- `Anchors` : `Anchors`
- `AutoSelect` : `Boolean`
- `AutoSize` : `Boolean`
- `BidiMode` : `BiDiMode`
- `BorderSpacing` : `ControlBorderSpacing`
- `BorderStyle` : `BorderStyle`
- `ButtonCaption` : `TranslateString`
- `ButtonCursor` : `Cursor`
- `ButtonHint` : `TranslateString`
- `ButtonOnlyWhenFocused` : `Boolean`
- `ButtonWidth` : `LongInt`
- `Color` : `GraphicsColor`
- `Constraints` : `SizeConstraints`
- `Cursor` : `Cursor`
- `DefaultExt` : `AnsiString`
- `DialogKind` : `DialogKind`
- `DialogOptions` : `OpenOptions`
- `DialogTitle` : `AnsiString`
- `DirectInput` : `Boolean`
- `DragCursor` : `Cursor`
- `DragMode` : `DragMode`
- `Enabled` : `Boolean`
- `FileName` : `AnsiString`
- `Filter` : `AnsiString`
- `FilterIndex` : `LongInt`
- `Flat` : `Boolean`
- `FocusOnButtonClick` : `Boolean`
- `Font` : `Font`
- `Glyph` : `Bitmap`
- `Height` : `LongInt`
- `HelpContext` : `HelpContext`
- `HelpKeyword` : `AnsiString`
- `HelpType` : `HelpType`
- `HideDirectories` : `Boolean`
- `Hint` : `TranslateString`
- `ImageIndex` : `ImageIndex`
- `ImageWidth` : `LongInt`
- `Images` : `CustomImageList`
- `InitialDir` : `AnsiString`
- `Layout` : `LeftRight`
- `Left` : `LongInt`
- `MaxLength` : `LongInt`
- `Name` : `AnsiString`
- `NumGlyphs` : `LongInt`
- `OnAcceptFileName` : `AcceptFileNameEvent`
- `OnButtonClick` : `NotifyEvent`
- `OnChange` : `NotifyEvent`
- `OnClick` : `NotifyEvent`
- `OnContextPopup` : `ContextPopupEvent`
- `OnDblClick` : `NotifyEvent`
- `OnDragDrop` : `DragDropEvent`
- `OnDragOver` : `DragOverEvent`
- `OnEditingDone` : `NotifyEvent`
- `OnEndDrag` : `EndDragEvent`
- `OnEnter` : `NotifyEvent`
- `OnExit` : `NotifyEvent`
- `OnFolderChange` : `NotifyEvent`
- `OnKeyDown` : `KeyEvent`
- `OnKeyPress` : `KeyPressEvent`
- `OnKeyUp` : `KeyEvent`
- `OnMouseDown` : `MouseEvent`
- `OnMouseEnter` : `NotifyEvent`
- `OnMouseLeave` : `NotifyEvent`
- `OnMouseMove` : `MouseMoveEvent`
- `OnMouseUp` : `MouseEvent`
- `OnMouseWheel` : `MouseWheelEvent`
- `OnMouseWheelDown` : `MouseWheelUpDownEvent`
- `OnMouseWheelUp` : `MouseWheelUpDownEvent`
- `OnStartDrag` : `StartDragEvent`
- `OnUTF8KeyPress` : `UTF8KeyPressEvent`
- `ParentBidiMode` : `Boolean`
- `ParentColor` : `Boolean`
- `ParentFont` : `Boolean`
- `ParentShowHint` : `Boolean`
- `PopupMenu` : `PopupMenu`
- `ReadOnly` : `Boolean`
- `ShowHint` : `Boolean`
- `Spacing` : `LongInt`
- `TabOrder` : `TabOrder`
- `TabStop` : `Boolean`
- `Tag` : `Int64`
- `Text` : `TranslateString`
- `TextHint` : `TranslateString`
- `Top` : `LongInt`
- `Visible` : `Boolean`
- `Width` : `LongInt`

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| result = o.DialogFiles | property DialogFiles: TStrings read FDialogFiles; |
| o:RunDialog() | procedure RunDialog; virtual; |


<a id="FindDialog"></a>
### FindDialog

#### Published properties
- `FindText` : `AnsiString`
- `HelpContext` : `HelpContext`
- `Name` : `AnsiString`
- `OnCanClose` : `CloseQueryEvent`
- `OnClose` : `NotifyEvent`
- `OnFind` : `NotifyEvent`
- `OnHelpClicked` : `NotifyEvent`
- `OnShow` : `NotifyEvent`
- `Options` : `FindOptions`
- `Tag` : `Int64`
- `Title` : `TranslateString`

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| o:CloseDialog() | procedure CloseDialog; |
| o.Left = value<br>result = o.Left | property Left: Integer read GetLeft write SetLeft; |
| o.OnReplace = function(Sender) end | property OnReplace: TNotifyEvent read FOnReplace write FOnReplace; |
| o.Position = value<br>result = o.Position | property Position: TPoint read GetPosition write SetPosition; |
| o.Top = value<br>result = o.Top | property Top: Integer read GetTop write SetTop; |


<a id="FloatSpinEdit"></a>
### FloatSpinEdit

#### Published properties
- `Align` : `Align`
- `Alignment` : `Alignment`
- `AnchorSideBottom` : `AnchorSide`
- `AnchorSideLeft` : `AnchorSide`
- `AnchorSideRight` : `AnchorSide`
- `AnchorSideTop` : `AnchorSide`
- `Anchors` : `Anchors`
- `AutoSelect` : `Boolean`
- `AutoSize` : `Boolean`
- `BorderSpacing` : `ControlBorderSpacing`
- `Color` : `GraphicsColor`
- `Constraints` : `SizeConstraints`
- `Cursor` : `Cursor`
- `DecimalPlaces` : `LongInt`
- `EditorEnabled` : `Boolean`
- `Enabled` : `Boolean`
- `Font` : `Font`
- `Height` : `LongInt`
- `HelpContext` : `HelpContext`
- `HelpKeyword` : `AnsiString`
- `HelpType` : `HelpType`
- `Hint` : `TranslateString`
- `Increment` : `Double`
- `Left` : `LongInt`
- `MaxValue` : `Double`
- `MinValue` : `Double`
- `Name` : `AnsiString`
- `OnChange` : `NotifyEvent`
- `OnChangeBounds` : `NotifyEvent`
- `OnClick` : `NotifyEvent`
- `OnEditingDone` : `NotifyEvent`
- `OnEnter` : `NotifyEvent`
- `OnExit` : `NotifyEvent`
- `OnKeyDown` : `KeyEvent`
- `OnKeyPress` : `KeyPressEvent`
- `OnKeyUp` : `KeyEvent`
- `OnMouseDown` : `MouseEvent`
- `OnMouseEnter` : `NotifyEvent`
- `OnMouseLeave` : `NotifyEvent`
- `OnMouseMove` : `MouseMoveEvent`
- `OnMouseUp` : `MouseEvent`
- `OnMouseWheel` : `MouseWheelEvent`
- `OnMouseWheelDown` : `MouseWheelUpDownEvent`
- `OnMouseWheelHorz` : `MouseWheelEvent`
- `OnMouseWheelLeft` : `MouseWheelUpDownEvent`
- `OnMouseWheelRight` : `MouseWheelUpDownEvent`
- `OnMouseWheelUp` : `MouseWheelUpDownEvent`
- `OnResize` : `NotifyEvent`
- `OnUTF8KeyPress` : `UTF8KeyPressEvent`
- `ParentColor` : `Boolean`
- `ParentFont` : `Boolean`
- `ParentShowHint` : `Boolean`
- `PopupMenu` : `PopupMenu`
- `ReadOnly` : `Boolean`
- `ShowHint` : `Boolean`
- `TabOrder` : `TabOrder`
- `TabStop` : `Boolean`
- `Tag` : `Int64`
- `Top` : `LongInt`
- `Value` : `Double`
- `Visible` : `Boolean`
- `Width` : `LongInt`

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| o.DecimalPlaces = value<br>result = o.DecimalPlaces | property DecimalPlaces: Integer read FDecimals write SetDecimals default DefDecimals; |
| o.EditorEnabled = value<br>result = o.EditorEnabled | property EditorEnabled: Boolean read FEditorEnabled write SetEditorEnabled default True; |
| result = o:GetLimitedValue(AValue) | function GetLimitedValue(const AValue: Double): Double; virtual; |
| o.Increment = value<br>result = o.Increment | property Increment: Double read FIncrement write SetIncrement stored IncrementStored nodefault; |
| o.MaxValue = value<br>result = o.MaxValue | property MaxValue: Double read FMaxValue write SetMaxValue stored MaxValueStored nodefault; |
| o.MinValue = value<br>result = o.MinValue | property MinValue: Double read FMinValue write SetMinValue; |
| result = o:StrToValue(S) | function StrToValue(const S: string): Double; virtual; |
| o.Value = value<br>result = o.Value | property Value: Double read GetValue write SetValue; |
| o.ValueEmpty = value<br>result = o.ValueEmpty | property ValueEmpty: Boolean read FValueEmpty write SetValueEmpty default False; |
| result = o:ValueToStr(AValue) | function ValueToStr(const AValue: Double): string; virtual; |


<a id="Font"></a>
### Font

#### Published properties
- `CharSet` : `FontCharSet`
- `Color` : `GraphicsColor`
- `Height` : `LongInt`
- `Name` : `AnsiString`
- `Orientation` : `LongInt`
- `Pitch` : `FontPitch`
- `Quality` : `FontQuality`
- `Size` : `LongInt`
- `Style` : `FontStyles`

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| o:BeginUpdate() | procedure BeginUpdate; |
| o:EndUpdate() | procedure EndUpdate; |
| o.Handle = value<br>result = o.Handle | property Handle: HFONT read GetHandle write SetHandle; |
| result = o:HandleAllocated() | function HandleAllocated: boolean; |
| result = o:IsDefault() | function IsDefault: boolean; |
| result = o:IsEqual(AFont) | function IsEqual(AFont: TFont): boolean; virtual; |
| result = o.IsMonoSpace | property IsMonoSpace: boolean read GetIsMonoSpace; |
| o.PixelsPerInch = value<br>result = o.PixelsPerInch | property PixelsPerInch: Integer read FPixelsPerInch write SetPixelsPerInch; |
| o:SetDefault() | procedure SetDefault; |


<a id="FontDialog"></a>
### FontDialog

#### Published properties
- `Font` : `Font`
- `HelpContext` : `HelpContext`
- `MaxFontSize` : `LongInt`
- `MinFontSize` : `LongInt`
- `Name` : `AnsiString`
- `OnApplyClicked` : `NotifyEvent`
- `OnCanClose` : `CloseQueryEvent`
- `OnClose` : `NotifyEvent`
- `OnShow` : `NotifyEvent`
- `Options` : `FontDialogOptions`
- `PreviewText` : `AnsiString`
- `Tag` : `Int64`
- `Title` : `TranslateString`

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| o:ApplyClicked() | procedure ApplyClicked; virtual; |


<a id="Form"></a>
### Form

#### Published properties
- `Action` : `BasicAction`
- `ActiveControl` : `WinControl`
- `Align` : `Align`
- `AllowDropFiles` : `Boolean`
- `AlphaBlend` : `Boolean`
- `AlphaBlendValue` : `Byte`
- `AnchorSideBottom` : `AnchorSide`
- `AnchorSideLeft` : `AnchorSide`
- `AnchorSideRight` : `AnchorSide`
- `AnchorSideTop` : `AnchorSide`
- `Anchors` : `Anchors`
- `AutoScroll` : `Boolean`
- `AutoSize` : `Boolean`
- `BiDiMode` : `BiDiMode`
- `BorderIcons` : `BorderIcons`
- `BorderStyle` : `FormBorderStyle`
- `BorderWidth` : `BorderWidth`
- `Caption` : `TranslateString`
- `ChildSizing` : `ControlChildSizing`
- `ClientHeight` : `LongInt`
- `ClientWidth` : `LongInt`
- `Color` : `GraphicsColor`
- `Constraints` : `SizeConstraints`
- `Cursor` : `Cursor`
- `DefaultMonitor` : `DefaultMonitor`
- `DesignTimePPI` : `LongInt`
- `DockSite` : `Boolean`
- `DoubleBuffered` : `Boolean`
- `DragKind` : `DragKind`
- `DragMode` : `DragMode`
- `Enabled` : `Boolean`
- `Font` : `Font`
- `FormStyle` : `FormStyle`
- `Height` : `LongInt`
- `HelpContext` : `HelpContext`
- `HelpFile` : `AnsiString`
- `HelpKeyword` : `AnsiString`
- `HelpType` : `HelpType`
- `Hint` : `TranslateString`
- `HorzScrollBar` : `ControlScrollBar`
- `Icon` : `Icon`
- `KeyPreview` : `Boolean`
- `LCLVersion` : `AnsiString`
- `Left` : `LongInt`
- `Menu` : `MainMenu`
- `Name` : `AnsiString`
- `OnActivate` : `NotifyEvent`
- `OnChangeBounds` : `NotifyEvent`
- `OnClick` : `NotifyEvent`
- `OnClose` : `CloseEvent`
- `OnCloseQuery` : `CloseQueryEvent`
- `OnConstrainedResize` : `ConstrainedResizeEvent`
- `OnContextPopup` : `ContextPopupEvent`
- `OnCreate` : `NotifyEvent`
- `OnDblClick` : `NotifyEvent`
- `OnDeactivate` : `NotifyEvent`
- `OnDestroy` : `NotifyEvent`
- `OnDockDrop` : `DockDropEvent`
- `OnDockOver` : `DockOverEvent`
- `OnDragDrop` : `DragDropEvent`
- `OnDragOver` : `DragOverEvent`
- `OnDropFiles` : `DropFilesEvent`
- `OnEndDock` : `EndDragEvent`
- `OnGetSiteInfo` : `GetSiteInfoEvent`
- `OnHelp` : `HelpEvent`
- `OnHide` : `NotifyEvent`
- `OnKeyDown` : `KeyEvent`
- `OnKeyPress` : `KeyPressEvent`
- `OnKeyUp` : `KeyEvent`
- `OnMouseDown` : `MouseEvent`
- `OnMouseEnter` : `NotifyEvent`
- `OnMouseLeave` : `NotifyEvent`
- `OnMouseMove` : `MouseMoveEvent`
- `OnMouseUp` : `MouseEvent`
- `OnMouseWheel` : `MouseWheelEvent`
- `OnMouseWheelDown` : `MouseWheelUpDownEvent`
- `OnMouseWheelHorz` : `MouseWheelEvent`
- `OnMouseWheelLeft` : `MouseWheelUpDownEvent`
- `OnMouseWheelRight` : `MouseWheelUpDownEvent`
- `OnMouseWheelUp` : `MouseWheelUpDownEvent`
- `OnPaint` : `NotifyEvent`
- `OnResize` : `NotifyEvent`
- `OnShortCut` : `ShortCutEvent`
- `OnShow` : `NotifyEvent`
- `OnShowHint` : `ControlShowHintEvent`
- `OnStartDock` : `StartDockEvent`
- `OnUTF8KeyPress` : `UTF8KeyPressEvent`
- `OnUnDock` : `UnDockEvent`
- `OnWindowStateChange` : `NotifyEvent`
- `ParentBiDiMode` : `Boolean`
- `ParentDoubleBuffered` : `Boolean`
- `ParentFont` : `Boolean`
- `PixelsPerInch` : `LongInt`
- `PopupMenu` : `PopupMenu`
- `PopupMode` : `PopupMode`
- `PopupParent` : `CustomForm`
- `Position` : `Position`
- `Scaled` : `Boolean`
- `ScreenSnap` : `Boolean`
- `SessionProperties` : `AnsiString`
- `ShowHint` : `Boolean`
- `ShowInTaskBar` : `ShowInTaskbar`
- `SnapBuffer` : `LongInt`
- `SnapOptions` : `WindowMagnetOptions`
- `Tag` : `Int64`
- `Top` : `LongInt`
- `UseDockManager` : `Boolean`
- `VertScrollBar` : `ControlScrollBar`
- `Visible` : `Boolean`
- `Width` : `LongInt`
- `WindowState` : `WindowState`

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| o:ArrangeIcons() | procedure ArrangeIcons; |
| o:Cascade() | procedure Cascade; |
| o:Next() | procedure Next; |
| o:Previous() | procedure Previous; |
| o:Tile() | procedure Tile; |


<a id="Graphic"></a>
### Graphic

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| o:Clear() | procedure Clear; virtual; |
| result = o.Empty | property Empty: Boolean read GetEmpty; |
| result = o:Equals(Obj) | function Equals(Obj: TObject): Boolean; override; overload; |
| result = o:GetFileExtensions() | class function GetFileExtensions: string; virtual; |
| result = o:GetResourceType() | function GetResourceType: TResourceType; virtual; |
| o:GetSupportedSourceMimeTypes(List) | procedure GetSupportedSourceMimeTypes(List: TStrings); virtual; |
| o.Height = value<br>result = o.Height | property Height: Integer read GetHeight write SetHeight; |
| result = o:IsStreamFormatSupported(Stream) | class function IsStreamFormatSupported(Stream: TStream): Boolean; virtual; |
| result = o:LazarusResourceTypeValid(AResourceType) | function LazarusResourceTypeValid(const AResourceType: string): boolean; virtual; |
| o:LoadFromClipboardFormat(FormatID) | procedure LoadFromClipboardFormat(FormatID: TClipboardFormat); virtual; |
| o:LoadFromClipboardFormatID(ClipboardType,FormatID) | procedure LoadFromClipboardFormatID(ClipboardType: TClipboardType; FormatID: TClipboardFormat); virtual; |
| o:LoadFromFile(Filename) | procedure LoadFromFile(const Filename: string); virtual; |
| o:LoadFromLazarusResource(ResName) | procedure LoadFromLazarusResource(const ResName: String); virtual; |
| o:LoadFromMimeStream(AStream,AMimeType) | procedure LoadFromMimeStream(AStream: TStream; const AMimeType: string); virtual; |
| o:LoadFromResourceID(Instance,ResID) | procedure LoadFromResourceID(Instance: THandle; ResID: PtrInt); virtual; |
| o:LoadFromResourceName(Instance,ResName) | procedure LoadFromResourceName(Instance: THandle; const ResName: String); virtual; |
| o:LoadFromStream(Stream) | procedure LoadFromStream(Stream: TStream); virtual; abstract; |
| result = o.MimeType | property MimeType: string read GetMimeType; |
| o.Modified = value<br>result = o.Modified | property Modified: Boolean read FModified write SetModified; |
| o.OnChange = function(Sender) end | property OnChange: TNotifyEvent read FOnChange write FOnChange; |
| o.OnProgress = function(Sender,Stage,PercentDone,RedrawNow,R,Msg,Continue) return Continue end | property OnProgress: TProgressEvent read FOnProgress write FOnProgress; |
| o.PaletteModified = value<br>result = o.PaletteModified | property PaletteModified: Boolean read FPaletteModified write FPaletteModified; |
| o:SaveToClipboardFormat(FormatID) | procedure SaveToClipboardFormat(FormatID: TClipboardFormat); virtual; |
| o:SaveToClipboardFormatID(ClipboardType,FormatID) | procedure SaveToClipboardFormatID(ClipboardType: TClipboardType; FormatID: TClipboardFormat); virtual; |
| o:SaveToFile(Filename) | procedure SaveToFile(const Filename: string); virtual; |
| o:SaveToStream(Stream) | procedure SaveToStream(Stream: TStream); virtual; abstract; |
| o.Transparent = value<br>result = o.Transparent | property Transparent: Boolean read GetTransparent write SetTransparent; |
| o.Width = value<br>result = o.Width | property Width: Integer read GetWidth write SetWidth; |


<a id="GraphicControl"></a>
### GraphicControl

#### Published properties
- `AnchorSideBottom` : `AnchorSide`
- `AnchorSideLeft` : `AnchorSide`
- `AnchorSideRight` : `AnchorSide`
- `AnchorSideTop` : `AnchorSide`
- `Cursor` : `Cursor`
- `Height` : `LongInt`
- `HelpContext` : `HelpContext`
- `HelpKeyword` : `AnsiString`
- `HelpType` : `HelpType`
- `Hint` : `TranslateString`
- `Left` : `LongInt`
- `Name` : `AnsiString`
- `Tag` : `Int64`
- `Top` : `LongInt`
- `Width` : `LongInt`

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| result = o.Canvas | property Canvas: TCanvas read FCanvas; |
| o.OnPaint = function(Sender) end | property OnPaint: TNotifyEvent read FOnPaint write FOnPaint; |


<a id="GridColumn"></a>
### GridColumn

#### Published properties
- `Alignment` : `Alignment`
- `ButtonStyle` : `ColumnButtonStyle`
- `Color` : `GraphicsColor`
- `DropDownRows` : `LongInt`
- `Expanded` : `Boolean`
- `Font` : `Font`
- `Layout` : `TextLayout`
- `MaxSize` : `LongInt`
- `MinSize` : `LongInt`
- `PickList` : `Strings`
- `ReadOnly` : `Boolean`
- `SizePriority` : `LongInt`
- `Tag` : `Int64`
- `Title` : `GridColumnTitle`
- `ValueChecked` : `AnsiString`
- `ValueUnchecked` : `AnsiString`
- `Visible` : `Boolean`
- `Width` : `LongInt`

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| result = o.DefaultWidth | property DefaultWidth: Integer read GetDefaultWidth; |
| o:FillDefaultFont() | procedure FillDefaultFont; |
| o:FixDesignFontsPPI(ADesignTimePPI) | procedure FixDesignFontsPPI(const ADesignTimePPI: Integer); virtual; |
| result = o.Grid | property Grid: TCustomGrid read GetGrid; |
| result = o:IsDefault() | function  IsDefault: boolean; virtual; |
| o:ScaleFontsPPI(AToPPI,AProportion) | procedure ScaleFontsPPI(const AToPPI: Integer; const AProportion: Double); virtual; |
| result = o.StoredWidth | property StoredWidth: Integer read GetStoredWidth; |
| result = o.WidthChanged | property WidthChanged: boolean read FWidthChanged; |


<a id="GridColumns"></a>
### GridColumns

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| result = o:Add() | function Add: TGridColumn; |
| o:Clear() | procedure Clear; |
| result = o:ColumnByTitle(aTitle) | function ColumnByTitle(const aTitle: string): TGridColumn; |
| result = o.Enabled | property Enabled: Boolean read GetEnabled; |
| result = o.Grid | property Grid: TCustomGrid read FGrid; |
| result = o:HasIndex(Index) | function HasIndex(Index: Integer): boolean; |
| result = o:IndexOf(Column) | function IndexOf(Column: TGridColumn): Integer; |
| result = o:IsDefault() | function IsDefault: boolean; |
| result = o:Items(Index)<br>o:Items(Index,value) | property Items[Index: Integer]: TGridColumn read GetColumn write SetColumn; default; |
| result = o:RealIndex(Index) | function RealIndex(Index: Integer): Integer; |
| result = o.VisibleCount | property VisibleCount: Integer read GetVisibleCount; |
| result = o:VisibleIndex(Index) | function VisibleIndex(Index: Integer): Integer; |


<a id="GroupBox"></a>
### GroupBox

#### Published properties
- `Align` : `Align`
- `AnchorSideBottom` : `AnchorSide`
- `AnchorSideLeft` : `AnchorSide`
- `AnchorSideRight` : `AnchorSide`
- `AnchorSideTop` : `AnchorSide`
- `Anchors` : `Anchors`
- `AutoSize` : `Boolean`
- `BidiMode` : `BiDiMode`
- `BorderSpacing` : `ControlBorderSpacing`
- `Caption` : `TranslateString`
- `ChildSizing` : `ControlChildSizing`
- `ClientHeight` : `LongInt`
- `ClientWidth` : `LongInt`
- `Color` : `GraphicsColor`
- `Constraints` : `SizeConstraints`
- `Cursor` : `Cursor`
- `DockSite` : `Boolean`
- `DoubleBuffered` : `Boolean`
- `DragCursor` : `Cursor`
- `DragKind` : `DragKind`
- `DragMode` : `DragMode`
- `Enabled` : `Boolean`
- `Font` : `Font`
- `Height` : `LongInt`
- `HelpContext` : `HelpContext`
- `HelpKeyword` : `AnsiString`
- `HelpType` : `HelpType`
- `Hint` : `TranslateString`
- `Left` : `LongInt`
- `Name` : `AnsiString`
- `OnChangeBounds` : `NotifyEvent`
- `OnClick` : `NotifyEvent`
- `OnContextPopup` : `ContextPopupEvent`
- `OnDblClick` : `NotifyEvent`
- `OnDockDrop` : `DockDropEvent`
- `OnDockOver` : `DockOverEvent`
- `OnDragDrop` : `DragDropEvent`
- `OnDragOver` : `DragOverEvent`
- `OnEndDock` : `EndDragEvent`
- `OnEndDrag` : `EndDragEvent`
- `OnEnter` : `NotifyEvent`
- `OnExit` : `NotifyEvent`
- `OnGetSiteInfo` : `GetSiteInfoEvent`
- `OnKeyDown` : `KeyEvent`
- `OnKeyPress` : `KeyPressEvent`
- `OnKeyUp` : `KeyEvent`
- `OnMouseDown` : `MouseEvent`
- `OnMouseEnter` : `NotifyEvent`
- `OnMouseLeave` : `NotifyEvent`
- `OnMouseMove` : `MouseMoveEvent`
- `OnMouseUp` : `MouseEvent`
- `OnMouseWheel` : `MouseWheelEvent`
- `OnMouseWheelDown` : `MouseWheelUpDownEvent`
- `OnMouseWheelUp` : `MouseWheelUpDownEvent`
- `OnResize` : `NotifyEvent`
- `OnStartDock` : `StartDockEvent`
- `OnStartDrag` : `StartDragEvent`
- `OnUTF8KeyPress` : `UTF8KeyPressEvent`
- `OnUnDock` : `UnDockEvent`
- `ParentBackground` : `Boolean`
- `ParentBidiMode` : `Boolean`
- `ParentColor` : `Boolean`
- `ParentDoubleBuffered` : `Boolean`
- `ParentFont` : `Boolean`
- `ParentShowHint` : `Boolean`
- `PopupMenu` : `PopupMenu`
- `ShowHint` : `Boolean`
- `TabOrder` : `TabOrder`
- `TabStop` : `Boolean`
- `Tag` : `Int64`
- `Top` : `LongInt`
- `Visible` : `Boolean`
- `Width` : `LongInt`

<a id="HeaderControl"></a>
### HeaderControl

#### Published properties
- `Align` : `Align`
- `AnchorSideBottom` : `AnchorSide`
- `AnchorSideLeft` : `AnchorSide`
- `AnchorSideRight` : `AnchorSide`
- `AnchorSideTop` : `AnchorSide`
- `Anchors` : `Anchors`
- `BiDiMode` : `BiDiMode`
- `BorderSpacing` : `ControlBorderSpacing`
- `BorderWidth` : `BorderWidth`
- `Constraints` : `SizeConstraints`
- `Cursor` : `Cursor`
- `DragCursor` : `Cursor`
- `DragKind` : `DragKind`
- `DragMode` : `DragMode`
- `DragReorder` : `Boolean`
- `Enabled` : `Boolean`
- `Font` : `Font`
- `Height` : `LongInt`
- `HelpContext` : `HelpContext`
- `HelpKeyword` : `AnsiString`
- `HelpType` : `HelpType`
- `Hint` : `TranslateString`
- `Images` : `CustomImageList`
- `ImagesWidth` : `LongInt`
- `Left` : `LongInt`
- `Name` : `AnsiString`
- `OnContextPopup` : `ContextPopupEvent`
- `OnCreateSectionClass` : `CustomHCCreateSectionClassEvent`
- `OnDragDrop` : `DragDropEvent`
- `OnDragOver` : `DragOverEvent`
- `OnEndDock` : `EndDragEvent`
- `OnEndDrag` : `EndDragEvent`
- `OnMouseDown` : `MouseEvent`
- `OnMouseEnter` : `NotifyEvent`
- `OnMouseLeave` : `NotifyEvent`
- `OnMouseMove` : `MouseMoveEvent`
- `OnMouseUp` : `MouseEvent`
- `OnMouseWheel` : `MouseWheelEvent`
- `OnMouseWheelDown` : `MouseWheelUpDownEvent`
- `OnMouseWheelHorz` : `MouseWheelEvent`
- `OnMouseWheelLeft` : `MouseWheelUpDownEvent`
- `OnMouseWheelRight` : `MouseWheelUpDownEvent`
- `OnMouseWheelUp` : `MouseWheelUpDownEvent`
- `OnResize` : `NotifyEvent`
- `OnSectionClick` : `CustomSectionNotifyEvent`
- `OnSectionDrag` : `SectionDragEvent`
- `OnSectionEndDrag` : `NotifyEvent`
- `OnSectionResize` : `CustomSectionNotifyEvent`
- `OnSectionSeparatorDblClick` : `CustomSectionNotifyEvent`
- `OnSectionTrack` : `CustomSectionTrackEvent`
- `ParentBiDiMode` : `Boolean`
- `ParentFont` : `Boolean`
- `ParentShowHint` : `Boolean`
- `PopupMenu` : `PopupMenu`
- `Sections` : `HeaderSections`
- `ShowHint` : `Boolean`
- `Tag` : `Int64`
- `Top` : `LongInt`
- `Visible` : `Boolean`
- `Width` : `LongInt`

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| o:ChangeScale(M,D) | procedure ChangeScale(M, D: Integer);override; |
| o:Click() | procedure Click; override; |
| o:DblClick() | procedure DblClick; override; |
| result = o:GetSectionAt(P) | function GetSectionAt(P: TPoint): Integer; |
| o:Paint() | procedure Paint; override; |
| o:PaintSection(Index) | procedure PaintSection(Index: Integer); virtual; |
| result = o:SectionFromOriginalIndex(OriginalIndex) | property SectionFromOriginalIndex[OriginalIndex: Integer]: THeaderSection read GetSectionFromOriginalIndex; |


<a id="IdleTimer"></a>
### IdleTimer

#### Published properties
- `AutoEnabled` : `Boolean`
- `AutoEndEvent` : `IdleTimerAutoEvent`
- `AutoStartEvent` : `IdleTimerAutoEvent`
- `Enabled` : `Boolean`
- `Interval` : `LongWord`
- `Name` : `AnsiString`
- `OnStartTimer` : `NotifyEvent`
- `OnStopTimer` : `NotifyEvent`
- `OnTimer` : `NotifyEvent`
- `Tag` : `Int64`

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| o.AutoEnabled = value<br>result = o.AutoEnabled | property AutoEnabled: boolean read FAutoEnabled write SetAutoEnabled default False; |
| o.AutoEndEvent = value<br>result = o.AutoEndEvent | property AutoEndEvent: TIdleTimerAutoEvent read FAutoEndEvent write FAutoEndEvent default itaOnUserInput; |
| o.AutoStartEvent = value<br>result = o.AutoStartEvent | property AutoStartEvent: TIdleTimerAutoEvent read FAutoStartEvent write FAutoStartEvent default itaOnIdle; |
| o.FireOnIdle = value<br>result = o.FireOnIdle | property FireOnIdle: boolean read FFireOnIdle write FFireOnIdle default false; |


<a id="Image"></a>
### Image

#### Published properties
- `Align` : `Align`
- `AnchorSideBottom` : `AnchorSide`
- `AnchorSideLeft` : `AnchorSide`
- `AnchorSideRight` : `AnchorSide`
- `AnchorSideTop` : `AnchorSide`
- `Anchors` : `Anchors`
- `AntialiasingMode` : `AntialiasingMode`
- `AutoSize` : `Boolean`
- `BorderSpacing` : `ControlBorderSpacing`
- `Center` : `Boolean`
- `Constraints` : `SizeConstraints`
- `Cursor` : `Cursor`
- `DragCursor` : `Cursor`
- `DragMode` : `DragMode`
- `Enabled` : `Boolean`
- `Height` : `LongInt`
- `HelpContext` : `HelpContext`
- `HelpKeyword` : `AnsiString`
- `HelpType` : `HelpType`
- `Hint` : `TranslateString`
- `ImageIndex` : `LongInt`
- `ImageWidth` : `LongInt`
- `Images` : `CustomImageList`
- `KeepOriginXWhenClipped` : `Boolean`
- `KeepOriginYWhenClipped` : `Boolean`
- `Left` : `LongInt`
- `Name` : `AnsiString`
- `OnChangeBounds` : `NotifyEvent`
- `OnClick` : `NotifyEvent`
- `OnContextPopup` : `ContextPopupEvent`
- `OnDblClick` : `NotifyEvent`
- `OnDragDrop` : `DragDropEvent`
- `OnDragOver` : `DragOverEvent`
- `OnEndDrag` : `EndDragEvent`
- `OnMouseDown` : `MouseEvent`
- `OnMouseEnter` : `NotifyEvent`
- `OnMouseLeave` : `NotifyEvent`
- `OnMouseMove` : `MouseMoveEvent`
- `OnMouseUp` : `MouseEvent`
- `OnMouseWheel` : `MouseWheelEvent`
- `OnMouseWheelDown` : `MouseWheelUpDownEvent`
- `OnMouseWheelHorz` : `MouseWheelEvent`
- `OnMouseWheelLeft` : `MouseWheelUpDownEvent`
- `OnMouseWheelRight` : `MouseWheelUpDownEvent`
- `OnMouseWheelUp` : `MouseWheelUpDownEvent`
- `OnPaint` : `NotifyEvent`
- `OnPaintBackground` : `ImagePaintBackgroundEvent`
- `OnPictureChanged` : `NotifyEvent`
- `OnResize` : `NotifyEvent`
- `OnStartDrag` : `StartDragEvent`
- `ParentShowHint` : `Boolean`
- `Picture` : `Picture`
- `PopupMenu` : `PopupMenu`
- `Proportional` : `Boolean`
- `ShowHint` : `Boolean`
- `Stretch` : `Boolean`
- `StretchInEnabled` : `Boolean`
- `StretchOutEnabled` : `Boolean`
- `Tag` : `Int64`
- `Top` : `LongInt`
- `Transparent` : `Boolean`
- `Visible` : `Boolean`
- `Width` : `LongInt`

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| o.AntialiasingMode = value<br>result = o.AntialiasingMode | property AntialiasingMode: TAntialiasingMode read FAntialiasingMode write SetAntialiasingMode default amDontCare; |
| result = o.Canvas | property Canvas: TCanvas read GetCanvas; |
| o.Center = value<br>result = o.Center | property Center: Boolean read FCenter write SetCenter default False; |
| result = o:DestRect() | function DestRect: TRect; virtual; |
| result = o.HasGraphic | property HasGraphic: Boolean read GetHasGraphic; |
| o.ImageIndex = value<br>result = o.ImageIndex | property ImageIndex: Integer read FImageIndex write SetImageIndex default 0; |
| o.ImageWidth = value<br>result = o.ImageWidth | property ImageWidth: Integer read FImageWidth write SetImageWidth default 0; |
| o.Images = value<br>result = o.Images | property Images: TCustomImageList read FImages write SetImages; |
| o.KeepOriginXWhenClipped = value<br>result = o.KeepOriginXWhenClipped | property KeepOriginXWhenClipped: Boolean read FKeepOriginXWhenClipped write SetKeepOriginX default False; |
| o.KeepOriginYWhenClipped = value<br>result = o.KeepOriginYWhenClipped | property KeepOriginYWhenClipped: Boolean read FKeepOriginYWhenClipped write SetKeepOriginY default False; |
| o.OnPaintBackground = function(ASender,ACanvas,ARect) end | property OnPaintBackground: TImagePaintBackgroundEvent read FOnPaintBackground write FOnPaintBackground; |
| o.OnPictureChanged = function(Sender) end | property OnPictureChanged: TNotifyEvent read FOnPictureChanged write FOnPictureChanged; |
| o.Picture = value<br>result = o.Picture | property Picture: TPicture read FPicture write SetPicture; |
| o.Proportional = value<br>result = o.Proportional | property Proportional: Boolean read FProportional write SetProportional default False; |
| o.Stretch = value<br>result = o.Stretch | property Stretch: Boolean read FStretch write SetStretch default False; |
| o.StretchInEnabled = value<br>result = o.StretchInEnabled | property StretchInEnabled: Boolean read FStretchInEnabled write SetStretchInEnabled default True; |
| o.StretchOutEnabled = value<br>result = o.StretchOutEnabled | property StretchOutEnabled: Boolean read FStretchOutEnabled write SetStretchOutEnabled default True; |
| o.Transparent = value<br>result = o.Transparent | property Transparent: Boolean read FTransparent write SetTransparent default False; |


<a id="ImageList"></a>
### ImageList

#### Published properties
- `AllocBy` : `LongInt`
- `BkColor` : `GraphicsColor`
- `BlendColor` : `GraphicsColor`
- `DrawingStyle` : `DrawingStyle`
- `Height` : `LongInt`
- `ImageType` : `ImageType`
- `Masked` : `Boolean`
- `Name` : `AnsiString`
- `OnChange` : `NotifyEvent`
- `OnGetWidthForPPI` : `CustomImageListGetWidthForPPI`
- `Scaled` : `Boolean`
- `ShareImages` : `Boolean`
- `Tag` : `Int64`
- `Width` : `LongInt`

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| result = o:Add(Image,Mask) | function Add(Image, Mask: TCustomBitmap): Integer; |
| result = o:AddIcon(Image) | function AddIcon(Image: TCustomIcon): Integer; |
| o:AddImages(AValue) | procedure AddImages(AValue: TCustomImageList); |
| result = o:AddLazarusResource(ResourceName)<br>result = o:AddLazarusResource(ResourceName,MaskColor) | function AddLazarusResource(const ResourceName: string; MaskColor: TColor = clNone): integer; |
| result = o:AddMasked(Image,MaskColor) | function AddMasked(Image: TBitmap; MaskColor: TColor): Integer; |
| result = o:AddMultipleResolutions(Images) | function AddMultipleResolutions(Images: array of TCustomBitmap): Integer; |
| result = o:AddMultipleResolutions2(Images) | function AddMultipleResolutions(Images: array of TRasterImage): Integer; |
| result = o:AddResourceName(Instance,ResourceName)<br>result = o:AddResourceName(Instance,ResourceName,MaskColor) | function AddResourceName(Instance: THandle; const ResourceName: string; MaskColor: TColor = clNone): integer; |
| result = o:AddSlice(Image,AImageRect) | function AddSlice(Image: TCustomBitmap; AImageRect: TRect): Integer; |
| result = o:AddSliceCentered(Image) | function AddSliceCentered(Image: TCustomBitmap): Integer; |
| result = o:AddSliced(Image,AHorizontalCount,AVerticalCount) | function AddSliced(Image: TCustomBitmap; AHorizontalCount, AVerticalCount: Integer): Integer; |
| o.AllocBy = value<br>result = o.AllocBy | property AllocBy: Integer read FAllocBy write FAllocBy default 4; |
| o:Assign(Source) | procedure Assign(Source: TPersistent); override; |
| o:AssignTo(Dest) | procedure AssignTo(Dest: TPersistent); override; |
| o:BeginUpdate() | procedure BeginUpdate; |
| o.BkColor = value<br>result = o.BkColor | property BkColor: TColor read FBkColor write SetBkColor default clNone; |
| o.BlendColor = value<br>result = o.BlendColor | property BlendColor: TColor read FBlendColor write FBlendColor default clNone; |
| o:Change() | procedure Change; |
| o:Clear() | procedure Clear; |
| result = o.Count | property Count: Integer read GetCount; |
| o:Delete(AIndex) | procedure Delete(AIndex: Integer); |
| o:DeleteResolution(AWidth) | procedure DeleteResolution(const AWidth: Integer); |
| o:Draw(ACanvas,AX,AY,AIndex)<br>o:Draw(ACanvas,AX,AY,AIndex,AEnabled) | procedure Draw(ACanvas: TCanvas; AX, AY, AIndex: Integer; AEnabled: Boolean = True); overload; |
| o:Draw2(ACanvas,AX,AY,AIndex,ADrawEffect) | procedure Draw(ACanvas: TCanvas; AX, AY, AIndex: Integer; ADrawEffect: TGraphicsDrawEffect); overload; |
| o:Draw3(ACanvas,AX,AY,AIndex,ADrawingStyle,AImageType)<br>o:Draw3(ACanvas,AX,AY,AIndex,ADrawingStyle,AImageType,AEnabled) | procedure Draw(ACanvas: TCanvas; AX, AY, AIndex: Integer; ADrawingStyle: TDrawingStyle; AImageType: TImageType; AEnabled: Boolean = True); overload; |
| o:Draw4(ACanvas,AX,AY,AIndex,ADrawingStyle,AImageType,ADrawEffect) | procedure Draw(ACanvas: TCanvas; AX, AY, AIndex: Integer; ADrawingStyle: TDrawingStyle; AImageType: TImageType; ADrawEffect: TGraphicsDrawEffect); overload; |
| o:DrawForPPI(ACanvas,AX,AY,AIndex,AImageWidthAt96PPI,ATargetPPI,ACanvasFactor)<br>o:DrawForPPI(ACanvas,AX,AY,AIndex,AImageWidthAt96PPI,ATargetPPI,ACanvasFactor,AEnabled) | procedure DrawForPPI(ACanvas: TCanvas; AX, AY, AIndex: Integer; AImageWidthAt96PPI, ATargetPPI: Integer; ACanvasFactor: Double; AEnabled: Boolean = True); overload; |
| o:DrawForPPI2(ACanvas,AX,AY,AIndex,AImageWidthAt96PPI,ATargetPPI,ACanvasFactor,ADrawEffect) | procedure DrawForPPI(ACanvas: TCanvas; AX, AY, AIndex: Integer; AImageWidthAt96PPI, ATargetPPI: Integer; ACanvasFactor: Double; ADrawEffect: TGraphicsDrawEffect); overload; |
| o:DrawOverlay(ACanvas,AX,AY,AIndex,AOverlay)<br>o:DrawOverlay(ACanvas,AX,AY,AIndex,AOverlay,AEnabled) | procedure DrawOverlay(ACanvas: TCanvas; AX, AY, AIndex: Integer; AOverlay: TOverlay; AEnabled: Boolean = True); overload; |
| o:DrawOverlay2(ACanvas,AX,AY,AIndex,AOverlay,ADrawEffect) | procedure DrawOverlay(ACanvas: TCanvas; AX, AY, AIndex: Integer; AOverlay: TOverlay; ADrawEffect: TGraphicsDrawEffect); overload; |
| o:DrawOverlay3(ACanvas,AX,AY,AIndex,AOverlay,ADrawingStyle,AImageType,ADrawEffect) | procedure DrawOverlay(ACanvas: TCanvas; AX, AY, AIndex: Integer; AOverlay: TOverlay; ADrawingStyle: TDrawingStyle; AImageType: TImageType; ADrawEffect: TGraphicsDrawEffect); overload; |
| o.DrawingStyle = value<br>result = o.DrawingStyle | property DrawingStyle: TDrawingStyle read FDrawingStyle write SetDrawingStyle default dsNormal; |
| o:EndUpdate() | procedure EndUpdate; |
| result = o:Equals(Obj) | function Equals(Obj: TObject): boolean; |
| o:GetBitmap(Index,Image) | procedure GetBitmap(Index: Integer; Image: TCustomBitmap); overload; |
| o:GetBitmap2(Index,Image,AEffect) | procedure GetBitmap(Index: Integer; Image: TCustomBitmap; AEffect: TGraphicsDrawEffect); overload; |
| o:GetFullBitmap(Image)<br>o:GetFullBitmap(Image,AEffect) | procedure GetFullBitmap(Image: TCustomBitmap; AEffect: TGraphicsDrawEffect = gdeNormal); |
| result = o:GetHotSpot() | function GetHotSpot: TPoint; |
| o:GetIcon(Index,Image,AEffect) | procedure GetIcon(Index: Integer; Image: TIcon; AEffect: TGraphicsDrawEffect); overload; |
| o:GetIcon2(Index,Image) | procedure GetIcon(Index: Integer; Image: TIcon); overload; |
| result = o.HasOverlays | property HasOverlays: boolean read fHasOverlays; |
| o.Height = value<br>result = o.Height | property Height: Integer read FHeight write SetHeight default 16; |
| result = o:HeightForPPI(AImageWidth,APPI) | property HeightForPPI[AImageWidth, APPI: Integer]: Integer read GetHeightForPPI; |
| result = o:HeightForWidth(AWidth) | property HeightForWidth[AWidth: Integer]: Integer read GetHeightForWidth; |
| o.ImageType = value<br>result = o.ImageType | property ImageType: TImageType read FImageType write FImageType default itImage; |
| o:Insert(AIndex,AImage,AMask) | procedure Insert(AIndex: Integer; AImage, AMask: TCustomBitmap); |
| o:InsertIcon(AIndex,AIcon) | procedure InsertIcon(AIndex: Integer; AIcon: TCustomIcon); |
| o:InsertMasked(Index,AImage,MaskColor) | procedure InsertMasked(Index: Integer; AImage: TCustomBitmap; MaskColor: TColor); |
| o.Masked = value<br>result = o.Masked | property Masked: boolean read FMasked write SetMasked default False; |
| o:Move(ACurIndex,ANewIndex) | procedure Move(ACurIndex, ANewIndex: Integer); |
| o.OnChange = function(Sender) end | property OnChange: TNotifyEvent read FOnChange write FOnChange; |
| o.OnGetWidthForPPI = function(Sender,AImageWidth,APPI,AResultWidth) return AResultWidth end | property OnGetWidthForPPI: TCustomImageListGetWidthForPPI read FOnGetWidthForPPI write FOnGetWidthForPPI; |
| o:Overlay(AIndex,Overlay) | procedure Overlay(AIndex: Integer; Overlay: TOverlay); |
| o:ReadAdvData(AStream) | procedure ReadAdvData(AStream: TStream); virtual; |
| o:ReadData(AStream) | procedure ReadData(AStream: TStream); virtual; |
| o:RegisterChanges(Value) | procedure RegisterChanges(Value: TChangeLink); |
| o:RegisterResolutions(AResolutionWidths) | procedure RegisterResolutions(const AResolutionWidths: array of Integer); virtual; |
| o:Replace(AIndex,AImage,AMask)<br>o:Replace(AIndex,AImage,AMask,AllResolutions) | procedure Replace(AIndex: Integer; AImage, AMask: TCustomBitmap; const AllResolutions: Boolean = True); |
| o:ReplaceIcon(AIndex,AIcon) | procedure ReplaceIcon(AIndex: Integer; AIcon: TCustomIcon); |
| o:ReplaceMasked(Index,NewImage,MaskColor)<br>o:ReplaceMasked(Index,NewImage,MaskColor,AllResolutions) | procedure ReplaceMasked(Index: Integer; NewImage: TCustomBitmap; MaskColor: TColor; const AllResolutions: Boolean = True); |
| o:ReplaceSlice(AIndex,Image,AImageRect)<br>o:ReplaceSlice(AIndex,Image,AImageRect,AllResolutions) | procedure ReplaceSlice(AIndex: Integer; Image: TCustomBitmap; AImageRect: TRect; const AllResolutions: Boolean = True); |
| o:ReplaceSliceCentered(AIndex,AImageWidth,Image)<br>o:ReplaceSliceCentered(AIndex,AImageWidth,Image,AllResolutions) | procedure ReplaceSliceCentered(AIndex, AImageWidth: Integer; Image: TCustomBitmap; const AllResolutions: Boolean = True); |
| result = o.ResolutionCount | property ResolutionCount: Integer read GetResolutionCount; |
| o.Scaled = value<br>result = o.Scaled | property Scaled: Boolean read FScaled write FScaled default False; |
| o.ShareImages = value<br>result = o.ShareImages | property ShareImages: Boolean read FShareImages write SetShareImages default False; |
| result = o:SizeForPPI(AImageWidth,APPI) | property SizeForPPI[AImageWidth, APPI: Integer]: TSize read GetSizeForPPI; |
| o:StretchDraw(Canvas,Index,ARect)<br>o:StretchDraw(Canvas,Index,ARect,Enabled) | procedure StretchDraw(Canvas: TCanvas; Index: Integer; ARect: TRect; Enabled: Boolean = True); |
| o:UnRegisterChanges(Value) | procedure UnRegisterChanges(Value: TChangeLink); |
| o.Width = value<br>result = o.Width | property Width: Integer read FWidth write SetWidth default 16; |
| result = o:WidthForPPI(AImageWidth,APPI) | property WidthForPPI[AImageWidth, APPI: Integer]: Integer read GetWidthForPPI; |
| o:WriteAdvData(AStream) | procedure WriteAdvData(AStream: TStream); virtual; |
| o:WriteData(AStream) | procedure WriteData(AStream: TStream); virtual; |


<a id="Label"></a>
### Label

#### Published properties
- `Align` : `Align`
- `Alignment` : `Alignment`
- `AnchorSideBottom` : `AnchorSide`
- `AnchorSideLeft` : `AnchorSide`
- `AnchorSideRight` : `AnchorSide`
- `AnchorSideTop` : `AnchorSide`
- `Anchors` : `Anchors`
- `AutoSize` : `Boolean`
- `BidiMode` : `BiDiMode`
- `BorderSpacing` : `ControlBorderSpacing`
- `Caption` : `TranslateString`
- `Color` : `GraphicsColor`
- `Constraints` : `SizeConstraints`
- `Cursor` : `Cursor`
- `DragCursor` : `Cursor`
- `DragKind` : `DragKind`
- `DragMode` : `DragMode`
- `Enabled` : `Boolean`
- `FocusControl` : `WinControl`
- `Font` : `Font`
- `Height` : `LongInt`
- `HelpContext` : `HelpContext`
- `HelpKeyword` : `AnsiString`
- `HelpType` : `HelpType`
- `Hint` : `TranslateString`
- `Layout` : `TextLayout`
- `Left` : `LongInt`
- `Name` : `AnsiString`
- `OnChangeBounds` : `NotifyEvent`
- `OnClick` : `NotifyEvent`
- `OnContextPopup` : `ContextPopupEvent`
- `OnDblClick` : `NotifyEvent`
- `OnDragDrop` : `DragDropEvent`
- `OnDragOver` : `DragOverEvent`
- `OnEndDrag` : `EndDragEvent`
- `OnMouseDown` : `MouseEvent`
- `OnMouseEnter` : `NotifyEvent`
- `OnMouseLeave` : `NotifyEvent`
- `OnMouseMove` : `MouseMoveEvent`
- `OnMouseUp` : `MouseEvent`
- `OnMouseWheel` : `MouseWheelEvent`
- `OnMouseWheelDown` : `MouseWheelUpDownEvent`
- `OnMouseWheelHorz` : `MouseWheelEvent`
- `OnMouseWheelLeft` : `MouseWheelUpDownEvent`
- `OnMouseWheelRight` : `MouseWheelUpDownEvent`
- `OnMouseWheelUp` : `MouseWheelUpDownEvent`
- `OnResize` : `NotifyEvent`
- `OnStartDrag` : `StartDragEvent`
- `OptimalFill` : `Boolean`
- `ParentBidiMode` : `Boolean`
- `ParentColor` : `Boolean`
- `ParentFont` : `Boolean`
- `ParentShowHint` : `Boolean`
- `PopupMenu` : `PopupMenu`
- `ShowAccelChar` : `Boolean`
- `ShowHint` : `Boolean`
- `Tag` : `Int64`
- `Top` : `LongInt`
- `Transparent` : `Boolean`
- `Visible` : `Boolean`
- `Width` : `LongInt`
- `WordWrap` : `Boolean`

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| result = o:AdjustFontForOptimalFill() | function AdjustFontForOptimalFill: Boolean; |
| result, FontHeight, NeededWidth, NeededHeight = o:CalcFittingFontHeight(TheText,MaxWidth,MaxHeight) | function CalcFittingFontHeight(const TheText: string; MaxWidth, MaxHeight: Integer; out FontHeight, NeededWidth, NeededHeight: Integer): Boolean; |
| o:Paint() | procedure Paint; override; |


<a id="LabeledEdit"></a>
### LabeledEdit

#### Published properties
- `Alignment` : `Alignment`
- `AnchorSideBottom` : `AnchorSide`
- `AnchorSideLeft` : `AnchorSide`
- `AnchorSideRight` : `AnchorSide`
- `AnchorSideTop` : `AnchorSide`
- `Anchors` : `Anchors`
- `AutoSelect` : `Boolean`
- `AutoSize` : `Boolean`
- `BidiMode` : `BiDiMode`
- `BorderSpacing` : `ControlBorderSpacing`
- `BorderStyle` : `BorderStyle`
- `CharCase` : `EditCharCase`
- `Color` : `GraphicsColor`
- `Constraints` : `SizeConstraints`
- `Cursor` : `Cursor`
- `DoubleBuffered` : `Boolean`
- `DragCursor` : `Cursor`
- `DragMode` : `DragMode`
- `EchoMode` : `EchoMode`
- `EditLabel` : `BoundLabel`
- `Enabled` : `Boolean`
- `Font` : `Font`
- `Height` : `LongInt`
- `HelpContext` : `HelpContext`
- `HelpKeyword` : `AnsiString`
- `HelpType` : `HelpType`
- `Hint` : `TranslateString`
- `LabelPosition` : `LabelPosition`
- `LabelSpacing` : `LongInt`
- `Left` : `LongInt`
- `MaxLength` : `LongInt`
- `Name` : `AnsiString`
- `OnChange` : `NotifyEvent`
- `OnClick` : `NotifyEvent`
- `OnDblClick` : `NotifyEvent`
- `OnDragDrop` : `DragDropEvent`
- `OnDragOver` : `DragOverEvent`
- `OnEditingDone` : `NotifyEvent`
- `OnEndDrag` : `EndDragEvent`
- `OnEnter` : `NotifyEvent`
- `OnExit` : `NotifyEvent`
- `OnKeyDown` : `KeyEvent`
- `OnKeyPress` : `KeyPressEvent`
- `OnKeyUp` : `KeyEvent`
- `OnMouseDown` : `MouseEvent`
- `OnMouseEnter` : `NotifyEvent`
- `OnMouseLeave` : `NotifyEvent`
- `OnMouseMove` : `MouseMoveEvent`
- `OnMouseUp` : `MouseEvent`
- `OnMouseWheel` : `MouseWheelEvent`
- `OnMouseWheelDown` : `MouseWheelUpDownEvent`
- `OnMouseWheelUp` : `MouseWheelUpDownEvent`
- `OnStartDrag` : `StartDragEvent`
- `OnUTF8KeyPress` : `UTF8KeyPressEvent`
- `ParentBidiMode` : `Boolean`
- `ParentColor` : `Boolean`
- `ParentDoubleBuffered` : `Boolean`
- `ParentFont` : `Boolean`
- `ParentShowHint` : `Boolean`
- `PasswordChar` : `Char`
- `PopupMenu` : `PopupMenu`
- `ReadOnly` : `Boolean`
- `ShowHint` : `Boolean`
- `TabOrder` : `TabOrder`
- `TabStop` : `Boolean`
- `Tag` : `Int64`
- `Text` : `TranslateString`
- `TextHint` : `TranslateString`
- `Top` : `LongInt`
- `Visible` : `Boolean`
- `Width` : `LongInt`

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| result = o.EditLabel | property EditLabel: TBoundLabel read FEditLabel; |
| o.LabelPosition = value<br>result = o.LabelPosition | property LabelPosition: TLabelPosition read FLabelPosition write SetLabelPosition default lpAbove; |
| o.LabelSpacing = value<br>result = o.LabelSpacing | property LabelSpacing: Integer read FLabelSpacing write SetLabelSpacing default 3; |


<a id="ListBox"></a>
### ListBox

#### Published properties
- `Align` : `Align`
- `AnchorSideBottom` : `AnchorSide`
- `AnchorSideLeft` : `AnchorSide`
- `AnchorSideRight` : `AnchorSide`
- `AnchorSideTop` : `AnchorSide`
- `Anchors` : `Anchors`
- `BidiMode` : `BiDiMode`
- `BorderSpacing` : `ControlBorderSpacing`
- `BorderStyle` : `BorderStyle`
- `ClickOnSelChange` : `Boolean`
- `Color` : `GraphicsColor`
- `Columns` : `LongInt`
- `Constraints` : `SizeConstraints`
- `Cursor` : `Cursor`
- `DoubleBuffered` : `Boolean`
- `DragCursor` : `Cursor`
- `DragKind` : `DragKind`
- `DragMode` : `DragMode`
- `Enabled` : `Boolean`
- `ExtendedSelect` : `Boolean`
- `Font` : `Font`
- `Height` : `LongInt`
- `HelpContext` : `HelpContext`
- `HelpKeyword` : `AnsiString`
- `HelpType` : `HelpType`
- `Hint` : `TranslateString`
- `IntegralHeight` : `Boolean`
- `ItemHeight` : `LongInt`
- `ItemIndex` : `LongInt`
- `Items` : `Strings`
- `Left` : `LongInt`
- `MultiSelect` : `Boolean`
- `Name` : `AnsiString`
- `OnChangeBounds` : `NotifyEvent`
- `OnClick` : `NotifyEvent`
- `OnContextPopup` : `ContextPopupEvent`
- `OnDblClick` : `NotifyEvent`
- `OnDragDrop` : `DragDropEvent`
- `OnDragOver` : `DragOverEvent`
- `OnDrawItem` : `DrawItemEvent`
- `OnEndDrag` : `EndDragEvent`
- `OnEnter` : `NotifyEvent`
- `OnExit` : `NotifyEvent`
- `OnKeyDown` : `KeyEvent`
- `OnKeyPress` : `KeyPressEvent`
- `OnKeyUp` : `KeyEvent`
- `OnMeasureItem` : `MeasureItemEvent`
- `OnMouseDown` : `MouseEvent`
- `OnMouseEnter` : `NotifyEvent`
- `OnMouseLeave` : `NotifyEvent`
- `OnMouseMove` : `MouseMoveEvent`
- `OnMouseUp` : `MouseEvent`
- `OnMouseWheel` : `MouseWheelEvent`
- `OnMouseWheelDown` : `MouseWheelUpDownEvent`
- `OnMouseWheelHorz` : `MouseWheelEvent`
- `OnMouseWheelLeft` : `MouseWheelUpDownEvent`
- `OnMouseWheelRight` : `MouseWheelUpDownEvent`
- `OnMouseWheelUp` : `MouseWheelUpDownEvent`
- `OnResize` : `NotifyEvent`
- `OnSelectionChange` : `SelectionChangeEvent`
- `OnShowHint` : `ControlShowHintEvent`
- `OnStartDrag` : `StartDragEvent`
- `OnUTF8KeyPress` : `UTF8KeyPressEvent`
- `Options` : `ListBoxOptions`
- `ParentBidiMode` : `Boolean`
- `ParentColor` : `Boolean`
- `ParentDoubleBuffered` : `Boolean`
- `ParentFont` : `Boolean`
- `ParentShowHint` : `Boolean`
- `PopupMenu` : `PopupMenu`
- `ScrollWidth` : `LongInt`
- `ShowHint` : `Boolean`
- `Sorted` : `Boolean`
- `Style` : `ListBoxStyle`
- `TabOrder` : `TabOrder`
- `TabStop` : `Boolean`
- `Tag` : `Int64`
- `Top` : `LongInt`
- `TopIndex` : `LongInt`
- `Visible` : `Boolean`
- `Width` : `LongInt`

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| o:AddItem(Item,AnObject) | procedure AddItem(const Item: String; AnObject: TObject); |
| result = o.Canvas | property Canvas: TCanvas read FCanvas; |
| o:Clear() | procedure Clear; virtual; |
| o:ClearSelection() | procedure ClearSelection; |
| o:Click() | procedure Click; override; |
| o.ClickOnSelChange = value<br>result = o.ClickOnSelChange | property ClickOnSelChange: boolean read FClickOnSelChange write FClickOnSelChange default true; |
| o.Columns = value<br>result = o.Columns | property Columns: Integer read FColumns write SetColumns default 0; |
| result = o.Count | property Count: Integer read GetCount; |
| o:DeleteSelected() | procedure DeleteSelected; virtual; |
| o.ExtendedSelect = value<br>result = o.ExtendedSelect | property ExtendedSelect: boolean read FExtendedSelect write SetExtendedSelect default true; |
| result = o:GetIndexAtXY(X,Y) | function GetIndexAtXY(X, Y: integer): integer; |
| result = o:GetIndexAtY(Y) | function GetIndexAtY(Y: integer): integer; |
| result = o:GetSelectedText() | function GetSelectedText: string; |
| o.IntegralHeight = value<br>result = o.IntegralHeight | property IntegralHeight: boolean read FIntegralHeight write FIntegralHeight default False; |
| result = o:ItemAtPos(Pos,Existing) | function ItemAtPos(const Pos: TPoint; Existing: Boolean): Integer; |
| result = o:ItemFullyVisible(Index) | function ItemFullyVisible(Index: Integer): boolean; |
| o.ItemHeight = value<br>result = o.ItemHeight | property ItemHeight: Integer read GetItemHeight write SetItemHeight; |
| o.ItemIndex = value<br>result = o.ItemIndex | property ItemIndex: integer read GetItemIndex write SetItemIndex default -1; |
| result = o:ItemRect(Index) | function ItemRect(Index: Integer): TRect; |
| result = o:ItemVisible(Index) | function ItemVisible(Index: Integer): boolean; |
| o.Items = value<br>result = o.Items | property Items: TStrings read FItems write SetItems; |
| o:LockSelectionChange() | procedure LockSelectionChange; |
| o:MakeCurrentVisible() | procedure MakeCurrentVisible; |
| TheHeight = o:MeasureItem(Index) | procedure MeasureItem(Index: Integer; var TheHeight: Integer); virtual; |
| TheHeight = o:MeasureItem2(Index,TheHeight) | procedure MeasureItem(Index: Integer; var TheHeight: Integer); virtual; |
| o.MultiSelect = value<br>result = o.MultiSelect | property MultiSelect: boolean read FMultiSelect write SetMultiSelect default False; |
| o.OnDrawItem = function(Control,Index,ARect,State) end | property OnDrawItem: TDrawItemEvent read FOnDrawItem write FOnDrawItem; |
| o.OnMeasureItem = function(Control,Index,AHeight) return AHeight end | property OnMeasureItem: TMeasureItemEvent read FOnMeasureItem write FOnMeasureItem; |
| o.OnSelectionChange = function(Sender,User) end | property OnSelectionChange: TSelectionChangeEvent read FOnSelectionChange write FOnSelectionChange; |
| o.Options = value<br>result = o.Options | property Options: TListBoxOptions read FOptions write FOptions default DefOptions; |
| o.ScrollWidth = value<br>result = o.ScrollWidth | property ScrollWidth: Integer read GetScrollWidth write SetScrollWidth default 0; |
| result = o.SelCount | property SelCount: integer read GetSelCount; |
| o:SelectAll() | procedure SelectAll; virtual; |
| o:SelectRange(ALow,AHigh,ASelected) | procedure SelectRange(ALow, AHigh: integer; ASelected: boolean); virtual; |
| result = o:Selected(Index)<br>o:Selected(Index,value) | property Selected[Index: integer]: boolean read GetSelected write SetSelected; |
| o.Sorted = value<br>result = o.Sorted | property Sorted: boolean read FSorted write SetSorted default False; |
| o.Style = value<br>result = o.Style | property Style: TListBoxStyle read FStyle write SetStyle default lbStandard; |
| o.TopIndex = value<br>result = o.TopIndex | property TopIndex: Integer read GetTopIndex write SetTopIndex default 0; |
| o:UnlockSelectionChange() | procedure UnlockSelectionChange; |


<a id="ListItem"></a>
### ListItem

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| o.Caption = value<br>result = o.Caption | property Caption : String read GetCaption write SetCaption; |
| o.Checked = value<br>result = o.Checked | property Checked : Boolean read GetChecked write SetChecked; |
| o.Cut = value<br>result = o.Cut | property Cut: Boolean index lisCut read GetState write SetState; |
| o.Data = value<br>result = o.Data | property Data: Pointer read FData write SetData; |
| o:Delete() | procedure Delete; |
| result = o:DisplayRect(Code) | function DisplayRect(Code: TDisplayCode): TRect; |
| result = o:DisplayRectSubItem(subItem,Code) | function DisplayRectSubItem(subItem: integer;Code: TDisplayCode): TRect; |
| o.DropTarget = value<br>result = o.DropTarget | property DropTarget: Boolean index lisDropTarget read GetState write SetState; |
| result = o:EditCaption() | function EditCaption: Boolean; |
| o.Focused = value<br>result = o.Focused | property Focused: Boolean index lisFocused read GetState write SetState; |
| o.ImageIndex = value<br>result = o.ImageIndex | property ImageIndex: TImageIndex read GetImageIndex write SetImageIndex default -1; |
| result = o.Index | property Index: Integer read GetIndex; |
| o.Left = value<br>result = o.Left | property Left: Integer read GetLeft write SetLeft; |
| result = o.ListView | property ListView: TCustomListView read GetListView; |
| o:MakeVisible(PartialOK) | procedure MakeVisible(PartialOK: Boolean); |
| result = o.Owner | property Owner: TListItems read FOwner; |
| o.Position = value<br>result = o.Position | property Position: TPoint read GetPosition write SetPosition; |
| o.Selected = value<br>result = o.Selected | property Selected: Boolean index lisSelected read GetState write SetState; |
| o.StateIndex = value<br>result = o.StateIndex | property StateIndex: TImageIndex read GetStateIndex write SetStateIndex; |
| result = o:SubItemImages(AIndex)<br>o:SubItemImages(AIndex,value) | property SubItemImages[const AIndex: Integer]: Integer read GetSubItemImages write SetSubItemImages; |
| o.SubItems = value<br>result = o.SubItems | property SubItems: TStrings read GetSubItems write SetSubItems; |
| o.Top = value<br>result = o.Top | property Top: Integer read GetTop write SetTop; |


<a id="ListItems"></a>
### ListItems

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| result = o:Add() | function Add: TListItem; |
| o:AddItem(AItem) | procedure AddItem(AItem: TListItem); |
| o:BeginUpdate() | procedure BeginUpdate; |
| o:Clear() | procedure Clear; virtual; |
| o.Count = value<br>result = o.Count | property Count: Integer read GetCount write SetCount; |
| o:Delete(AIndex) | procedure Delete(const AIndex : Integer); |
| o:EndUpdate() | procedure EndUpdate; |
| o:Exchange(AIndex1,AIndex2) | procedure Exchange(const AIndex1, AIndex2: Integer); |
| result = o:FindCaption(StartIndex,Value,Partial,Inclusive,Wrap)<br>result = o:FindCaption(StartIndex,Value,Partial,Inclusive,Wrap,PartStart) | function FindCaption(StartIndex: Integer; Value: string; Partial, Inclusive, Wrap: Boolean; PartStart: Boolean = True): TListItem; |
| result = o:FindData(AData) | function FindData(const AData: Pointer): TListItem; overload; |
| result = o:FindData2(StartIndex,Value,Inclusive,Wrap) | function FindData(StartIndex: Integer; Value: Pointer; Inclusive, Wrap: Boolean): TListItem; overload; |
| result = o.Flags | property Flags: TListItemsFlags read FFlags; |
| result = o:IndexOf(AItem) | function IndexOf(const AItem: TListItem): Integer; |
| result = o:Insert(AIndex) | function Insert(const AIndex: Integer) : TListItem; |
| o:InsertItem(AItem,AIndex) | procedure InsertItem(AItem: TListItem; const AIndex: Integer); |
| result = o:Item(AIndex)<br>o:Item(AIndex,value) | property Item[const AIndex: Integer]: TListItem read GetItem write SetItem; default; |
| o:Move(AFromIndex,AToIndex) | procedure Move(const AFromIndex, AToIndex: Integer); |
| result = o.Owner | property Owner: TCustomListView read FOwner; |


<a id="ListView"></a>
### ListView

#### Published properties
- `Align` : `Align`
- `AllocBy` : `LongInt`
- `AnchorSideBottom` : `AnchorSide`
- `AnchorSideLeft` : `AnchorSide`
- `AnchorSideRight` : `AnchorSide`
- `AnchorSideTop` : `AnchorSide`
- `Anchors` : `Anchors`
- `AutoSort` : `Boolean`
- `AutoSortIndicator` : `Boolean`
- `AutoWidthLastColumn` : `Boolean`
- `BorderSpacing` : `ControlBorderSpacing`
- `BorderStyle` : `BorderStyle`
- `BorderWidth` : `BorderWidth`
- `Checkboxes` : `Boolean`
- `Color` : `GraphicsColor`
- `ColumnClick` : `Boolean`
- `Columns` : `ListColumns`
- `Constraints` : `SizeConstraints`
- `Cursor` : `Cursor`
- `DragCursor` : `Cursor`
- `DragKind` : `DragKind`
- `DragMode` : `DragMode`
- `Enabled` : `Boolean`
- `Font` : `Font`
- `GridLines` : `Boolean`
- `Height` : `LongInt`
- `HelpContext` : `HelpContext`
- `HelpKeyword` : `AnsiString`
- `HelpType` : `HelpType`
- `HideSelection` : `Boolean`
- `Hint` : `TranslateString`
- `IconOptions` : `IconOptions`
- `Items` : `ListItems`
- `LargeImages` : `CustomImageList`
- `LargeImagesWidth` : `LongInt`
- `Left` : `LongInt`
- `MultiSelect` : `Boolean`
- `Name` : `AnsiString`
- `OnAdvancedCustomDraw` : `LVAdvancedCustomDrawEvent`
- `OnAdvancedCustomDrawItem` : `LVAdvancedCustomDrawItemEvent`
- `OnAdvancedCustomDrawSubItem` : `LVAdvancedCustomDrawSubItemEvent`
- `OnChange` : `LVChangeEvent`
- `OnClick` : `NotifyEvent`
- `OnColumnClick` : `LVColumnClickEvent`
- `OnCompare` : `LVCompareEvent`
- `OnContextPopup` : `ContextPopupEvent`
- `OnCreateItemClass` : `LVCreateItemClassEvent`
- `OnCustomDraw` : `LVCustomDrawEvent`
- `OnCustomDrawItem` : `LVCustomDrawItemEvent`
- `OnCustomDrawSubItem` : `LVCustomDrawSubItemEvent`
- `OnData` : `LVDeletedEvent`
- `OnDataFind` : `LVDataFindEvent`
- `OnDataHint` : `LVDataHintEvent`
- `OnDataStateChange` : `LVDataStateChangeEvent`
- `OnDblClick` : `NotifyEvent`
- `OnDeletion` : `LVDeletedEvent`
- `OnDragDrop` : `DragDropEvent`
- `OnDragOver` : `DragOverEvent`
- `OnDrawItem` : `LVDrawItemEvent`
- `OnEdited` : `LVEditedEvent`
- `OnEditing` : `LVEditingEvent`
- `OnEndDock` : `EndDragEvent`
- `OnEndDrag` : `EndDragEvent`
- `OnEnter` : `NotifyEvent`
- `OnExit` : `NotifyEvent`
- `OnInsert` : `LVDeletedEvent`
- `OnItemChecked` : `LVCheckedItemEvent`
- `OnKeyDown` : `KeyEvent`
- `OnKeyPress` : `KeyPressEvent`
- `OnKeyUp` : `KeyEvent`
- `OnMouseDown` : `MouseEvent`
- `OnMouseEnter` : `NotifyEvent`
- `OnMouseLeave` : `NotifyEvent`
- `OnMouseMove` : `MouseMoveEvent`
- `OnMouseUp` : `MouseEvent`
- `OnMouseWheel` : `MouseWheelEvent`
- `OnMouseWheelDown` : `MouseWheelUpDownEvent`
- `OnMouseWheelHorz` : `MouseWheelEvent`
- `OnMouseWheelLeft` : `MouseWheelUpDownEvent`
- `OnMouseWheelRight` : `MouseWheelUpDownEvent`
- `OnMouseWheelUp` : `MouseWheelUpDownEvent`
- `OnResize` : `NotifyEvent`
- `OnSelectItem` : `LVSelectItemEvent`
- `OnShowHint` : `ControlShowHintEvent`
- `OnStartDock` : `StartDockEvent`
- `OnStartDrag` : `StartDragEvent`
- `OnUTF8KeyPress` : `UTF8KeyPressEvent`
- `OwnerData` : `Boolean`
- `OwnerDraw` : `Boolean`
- `ParentColor` : `Boolean`
- `ParentFont` : `Boolean`
- `ParentShowHint` : `Boolean`
- `PopupMenu` : `PopupMenu`
- `ReadOnly` : `Boolean`
- `RowSelect` : `Boolean`
- `ScrollBars` : `ScrollStyle`
- `ShowColumnHeaders` : `Boolean`
- `ShowHint` : `Boolean`
- `SmallImages` : `CustomImageList`
- `SmallImagesWidth` : `LongInt`
- `SortColumn` : `LongInt`
- `SortDirection` : `SortDirection`
- `SortType` : `SortType`
- `StateImages` : `CustomImageList`
- `StateImagesWidth` : `LongInt`
- `TabOrder` : `TabOrder`
- `TabStop` : `Boolean`
- `Tag` : `Int64`
- `ToolTips` : `Boolean`
- `Top` : `LongInt`
- `ViewStyle` : `ViewStyle`
- `Visible` : `Boolean`
- `Width` : `LongInt`

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| o:AddItem(Item,AObject) | procedure AddItem(Item: string; AObject: TObject); |
| result = o:AlphaSort() | function AlphaSort: Boolean; |
| o:BeginUpdate() | procedure BeginUpdate; |
| result = o.BoundingRect | property BoundingRect: TRect read GetBoundingRect; |
| result = o.Canvas | property Canvas: TCanvas read FCanvas; |
| o.Checkboxes = value<br>result = o.Checkboxes | property Checkboxes: Boolean index Ord(lvpCheckboxes) read GetProperty write SetProperty default False; |
| o:Clear() | procedure Clear; |
| o:ClearSelection() | procedure ClearSelection; |
| result = o:Column(AIndex) | property Column[AIndex: Integer]: TListColumn read GetColumnFromIndex; |
| result = o.ColumnCount | property ColumnCount: Integer read GetColumnCount; |
| o.DropTarget = value<br>result = o.DropTarget | property DropTarget: TListItem read GetDropTarget write SetDropTarget; |
| o:EndUpdate() | procedure EndUpdate; |
| result = o:FindCaption(StartIndex,Value,Partial,Inclusive,Wrap)<br>result = o:FindCaption(StartIndex,Value,Partial,Inclusive,Wrap,PartStart) | function FindCaption(StartIndex: Integer; Value: string; Partial, Inclusive, Wrap: Boolean; PartStart: Boolean = True): TListItem; |
| result = o:FindData(StartIndex,Value,Inclusive,Wrap) | function FindData(StartIndex: Integer; Value: Pointer; Inclusive, Wrap: Boolean): TListItem; |
| o.FlatScrollBars = value<br>result = o.FlatScrollBars | property FlatScrollBars: Boolean index Ord(lvpFlatScrollBars) read GetProperty write SetProperty default False; |
| o.FullDrag = value<br>result = o.FullDrag | property FullDrag: Boolean index Ord(lvpFullDrag) read GetProperty write SetProperty default False; |
| result = o:GetItemAt(x,y) | function GetItemAt(x,y: integer): TListItem; |
| result = o:GetNearestItem(APoint,Direction) | function GetNearestItem(APoint: TPoint; Direction: TSearchDirection): TListItem; |
| result = o:GetNextItem(StartItem,Direction,States) | function GetNextItem(StartItem: TListItem; Direction: TSearchDirection; States: TListItemStates): TListItem; |
| o.GridLines = value<br>result = o.GridLines | property GridLines: Boolean index Ord(lvpGridLines) read GetProperty write SetProperty default False; |
| o.HotTrack = value<br>result = o.HotTrack | property HotTrack: Boolean index Ord(lvpHotTrack) read GetProperty write SetProperty default False; |
| o.HotTrackStyles = value<br>result = o.HotTrackStyles | property HotTrackStyles: TListHotTrackStyles read FHotTrackStyles write SetHotTrackStyles default []; |
| o.IconOptions = value<br>result = o.IconOptions | property IconOptions: TIconOptions read FIconOptions write SetIconOptions; |
| result = o:IsEditing() | function IsEditing: Boolean; |
| o.ItemFocused = value<br>result = o.ItemFocused | property ItemFocused: TListItem read GetFocused write SetFocused; |
| o.ItemIndex = value<br>result = o.ItemIndex | property ItemIndex: Integer read GetItemIndex write SetItemIndex; |
| o.Items = value<br>result = o.Items | property Items: TListItems read FListItems write SetItems; |
| result = o.LastSelected | property LastSelected: TListItem read FSelected; |
| o.MultiSelect = value<br>result = o.MultiSelect | property MultiSelect: Boolean index Ord(lvpMultiselect) read GetProperty write SetProperty default False; |
| o.OnAdvancedCustomDraw = function(Sender,ARect,Stage,DefaultDraw) return DefaultDraw end | property OnAdvancedCustomDraw: TLVAdvancedCustomDrawEvent read FOnAdvancedCustomDraw write FOnAdvancedCustomDraw; |
| o.OnAdvancedCustomDrawItem = function(Sender,Item,State,Stage,DefaultDraw) return DefaultDraw end | property OnAdvancedCustomDrawItem: TLVAdvancedCustomDrawItemEvent read FOnAdvancedCustomDrawItem write FOnAdvancedCustomDrawItem; |
| o.OnAdvancedCustomDrawSubItem = function(Sender,Item,SubItem,State,Stage,DefaultDraw) return DefaultDraw end | property OnAdvancedCustomDrawSubItem: TLVAdvancedCustomDrawSubItemEvent read FOnAdvancedCustomDrawSubItem write FOnAdvancedCustomDrawSubItem; |
| o.OnChange = function(Sender,Item,Change) end | property OnChange: TLVChangeEvent read FOnChange write FOnChange; |
| o.OnColumnClick = function(Sender,Column) end | property OnColumnClick: TLVColumnClickEvent read FOnColumnClick write FOnColumnClick; |
| o.OnCompare = function(Sender,Item1,Item2,Data,Compare) return Compare end | property OnCompare: TLVCompareEvent read FOnCompare write FOnCompare; |
| o.OnCustomDraw = function(Sender,ARect,DefaultDraw) return DefaultDraw end | property OnCustomDraw: TLVCustomDrawEvent read FOnCustomDraw write FOnCustomDraw; |
| o.OnCustomDrawItem = function(Sender,Item,State,DefaultDraw) return DefaultDraw end | property OnCustomDrawItem: TLVCustomDrawItemEvent read FOnCustomDrawItem write FOnCustomDrawItem; |
| o.OnCustomDrawSubItem = function(Sender,Item,SubItem,State,DefaultDraw) return DefaultDraw end | property OnCustomDrawSubItem: TLVCustomDrawSubItemEvent read FOnCustomDrawSubItem write FOnCustomDrawSubItem; |
| o.OnData = function(Sender,Item) end | property OnData: TLVDataEvent read FOnData write FOnData; |
| o.OnDataFind = function(Sender,AFind,AFindString,AFindPosition,AFindData,AStartIndex,ADirection,AWrap,AIndex) return AIndex end | property OnDataFind: TLVDataFindEvent read FOnDataFind write FOnDataFind; |
| o.OnDataHint = function(Sender,StartIndex,EndIndex) end | property OnDataHint: TLVDataHintEvent read FOnDataHint write FOnDataHint; |
| o.OnDataStateChange = function(Sender,StartIndex,EndIndex,OldState,NewState) end | property OnDataStateChange: TLVDataStateChangeEvent read FOnDataStateChange write FOnDataStateChange; |
| o.OnDeletion = function(Sender,Item) end | property OnDeletion: TLVDeletedEvent read FOnDeletion write FOnDeletion; |
| o.OnDrawItem = function(Sender,AItem,ARect,AState) end | property OnDrawItem: TLVDrawItemEvent read FOnDrawItem write FOnDrawItem; |
| o.OnEdited = function(Sender,Item,AValue) return AValue end | property OnEdited: TLVEditedEvent read FOnEdited write FOnEdited; |
| o.OnEditing = function(Sender,Item,AllowEdit) return AllowEdit end | property OnEditing: TLVEditingEvent read FOnEditing write FOnEditing; |
| o.OnInsert = function(Sender,Item) end | property OnInsert: TLVInsertEvent read FOnInsert write FOnInsert; |
| o.OnItemChecked = function(Sender,Item) end | property OnItemChecked: TLVCheckedItemEvent read FOnItemChecked write FOnItemChecked; |
| o.OnSelectItem = function(Sender,Item,Selected) end | property OnSelectItem: TLVSelectItemEvent read FOnSelectItem write FOnSelectItem; |
| o.OwnerData = value<br>result = o.OwnerData | property OwnerData: Boolean read FOwnerData write SetOwnerData default False; |
| o.ReadOnly = value<br>result = o.ReadOnly | property ReadOnly: Boolean index Ord(lvpReadOnly) read GetProperty write SetProperty default False; |
| o.RowSelect = value<br>result = o.RowSelect | property RowSelect: Boolean index Ord(lvpRowSelect) read GetProperty write SetProperty default False; |
| result = o.SelCount | property SelCount: Integer read GetSelCount; |
| o:SelectAll() | procedure SelectAll; |
| o.Selected = value<br>result = o.Selected | property Selected: TListItem read GetSelection write SetSelection; |
| o:Sort() | procedure Sort; |
| result = o.TopItem | property TopItem: TListItem read GetTopItem; |
| o.ViewOrigin = value<br>result = o.ViewOrigin | property ViewOrigin: TPoint read GetViewOrigin write SetViewOrigin; |
| result = o.VisibleRowCount | property VisibleRowCount: Integer read GetVisibleRowCount; |


<a id="MainMenu"></a>
### MainMenu

#### Published properties
- `BidiMode` : `BiDiMode`
- `Images` : `CustomImageList`
- `ImagesWidth` : `LongInt`
- `Items` : `MenuItem`
- `Name` : `AnsiString`
- `OnChange` : `MenuChangeEvent`
- `OnDrawItem` : `MenuDrawItemEvent`
- `OnMeasureItem` : `MenuMeasureItemEvent`
- `OwnerDraw` : `Boolean`
- `ParentBidiMode` : `Boolean`
- `Tag` : `Int64`

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| result = o.Height | property Height: Integer read GetHeight; |
| o:Merge(Menu) | procedure Merge(Menu: TMainMenu); |
| o:Unmerge(Menu) | procedure Unmerge(Menu: TMainMenu); |
| o.WindowHandle = value<br>result = o.WindowHandle | property WindowHandle: HWND read FWindowHandle write SetWindowHandle; |


<a id="MaskEdit"></a>
### MaskEdit

#### Published properties
- `Align` : `Align`
- `Alignment` : `Alignment`
- `AnchorSideBottom` : `AnchorSide`
- `AnchorSideLeft` : `AnchorSide`
- `AnchorSideRight` : `AnchorSide`
- `AnchorSideTop` : `AnchorSide`
- `Anchors` : `Anchors`
- `AutoSelect` : `Boolean`
- `AutoSize` : `Boolean`
- `BiDiMode` : `BiDiMode`
- `BorderSpacing` : `ControlBorderSpacing`
- `BorderStyle` : `BorderStyle`
- `CharCase` : `EditCharCase`
- `Color` : `GraphicsColor`
- `Constraints` : `SizeConstraints`
- `Cursor` : `Cursor`
- `DragCursor` : `Cursor`
- `DragKind` : `DragKind`
- `DragMode` : `DragMode`
- `EditMask` : `AnsiString`
- `EnableSets` : `Boolean`
- `Enabled` : `Boolean`
- `Font` : `Font`
- `Height` : `LongInt`
- `HelpContext` : `HelpContext`
- `HelpKeyword` : `AnsiString`
- `HelpType` : `HelpType`
- `Hint` : `TranslateString`
- `Left` : `LongInt`
- `MaxLength` : `LongInt`
- `Name` : `AnsiString`
- `OnChange` : `NotifyEvent`
- `OnClick` : `NotifyEvent`
- `OnDblClick` : `NotifyEvent`
- `OnDragDrop` : `DragDropEvent`
- `OnDragOver` : `DragOverEvent`
- `OnEditingDone` : `NotifyEvent`
- `OnEndDock` : `EndDragEvent`
- `OnEndDrag` : `EndDragEvent`
- `OnEnter` : `NotifyEvent`
- `OnExit` : `NotifyEvent`
- `OnKeyDown` : `KeyEvent`
- `OnKeyPress` : `KeyPressEvent`
- `OnKeyUp` : `KeyEvent`
- `OnMouseDown` : `MouseEvent`
- `OnMouseEnter` : `NotifyEvent`
- `OnMouseLeave` : `NotifyEvent`
- `OnMouseMove` : `MouseMoveEvent`
- `OnMouseUp` : `MouseEvent`
- `OnMouseWheel` : `MouseWheelEvent`
- `OnMouseWheelDown` : `MouseWheelUpDownEvent`
- `OnMouseWheelUp` : `MouseWheelUpDownEvent`
- `OnStartDock` : `StartDockEvent`
- `OnStartDrag` : `StartDragEvent`
- `OnUTF8KeyPress` : `UTF8KeyPressEvent`
- `OnValidationError` : `NotifyEvent`
- `ParentBiDiMode` : `Boolean`
- `ParentColor` : `Boolean`
- `ParentFont` : `Boolean`
- `ParentShowHint` : `Boolean`
- `PopupMenu` : `PopupMenu`
- `ReadOnly` : `Boolean`
- `ShowHint` : `Boolean`
- `SpaceChar` : `Char`
- `TabOrder` : `TabOrder`
- `TabStop` : `Boolean`
- `Tag` : `Int64`
- `Text` : `TranslateString`
- `TextHint` : `TranslateString`
- `Top` : `LongInt`
- `ValidationErrorMode` : `MaskEditValidationErrorMode`
- `Visible` : `Boolean`
- `Width` : `LongInt`

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| o:Clear() | procedure Clear; |
| o.EnableSets = value<br>result = o.EnableSets | property EnableSets: Boolean read FEnableSets write FEnableSets; |
| o.Modified = value<br>result = o.Modified | property Modified: Boolean read GetModified write SetModified; |
| o.OnValidationError = function(Sender) end | property OnValidationError: TNotifyEvent read FOnValidationError write FOnValidationError; |
| o:ValidateEdit() | procedure ValidateEdit; virtual; |
| o.ValidationErrorMode = value<br>result = o.ValidationErrorMode | property ValidationErrorMode: TMaskEditValidationErrorMode read FValidationErrorMode write FValidationErrorMode default mvemException; |


<a id="Memo"></a>
### Memo

#### Published properties
- `Align` : `Align`
- `Alignment` : `Alignment`
- `AnchorSideBottom` : `AnchorSide`
- `AnchorSideLeft` : `AnchorSide`
- `AnchorSideRight` : `AnchorSide`
- `AnchorSideTop` : `AnchorSide`
- `Anchors` : `Anchors`
- `BidiMode` : `BiDiMode`
- `BorderSpacing` : `ControlBorderSpacing`
- `BorderStyle` : `BorderStyle`
- `CharCase` : `EditCharCase`
- `Color` : `GraphicsColor`
- `Constraints` : `SizeConstraints`
- `Cursor` : `Cursor`
- `DoubleBuffered` : `Boolean`
- `DragCursor` : `Cursor`
- `DragKind` : `DragKind`
- `DragMode` : `DragMode`
- `Enabled` : `Boolean`
- `Font` : `Font`
- `Height` : `LongInt`
- `HelpContext` : `HelpContext`
- `HelpKeyword` : `AnsiString`
- `HelpType` : `HelpType`
- `HideSelection` : `Boolean`
- `Hint` : `TranslateString`
- `Left` : `LongInt`
- `Lines` : `Strings`
- `MaxLength` : `LongInt`
- `Name` : `AnsiString`
- `OnChange` : `NotifyEvent`
- `OnClick` : `NotifyEvent`
- `OnContextPopup` : `ContextPopupEvent`
- `OnDblClick` : `NotifyEvent`
- `OnDragDrop` : `DragDropEvent`
- `OnDragOver` : `DragOverEvent`
- `OnEditingDone` : `NotifyEvent`
- `OnEndDrag` : `EndDragEvent`
- `OnEnter` : `NotifyEvent`
- `OnExit` : `NotifyEvent`
- `OnKeyDown` : `KeyEvent`
- `OnKeyPress` : `KeyPressEvent`
- `OnKeyUp` : `KeyEvent`
- `OnMouseDown` : `MouseEvent`
- `OnMouseEnter` : `NotifyEvent`
- `OnMouseLeave` : `NotifyEvent`
- `OnMouseMove` : `MouseMoveEvent`
- `OnMouseUp` : `MouseEvent`
- `OnMouseWheel` : `MouseWheelEvent`
- `OnMouseWheelDown` : `MouseWheelUpDownEvent`
- `OnMouseWheelHorz` : `MouseWheelEvent`
- `OnMouseWheelLeft` : `MouseWheelUpDownEvent`
- `OnMouseWheelRight` : `MouseWheelUpDownEvent`
- `OnMouseWheelUp` : `MouseWheelUpDownEvent`
- `OnResize` : `NotifyEvent`
- `OnStartDrag` : `StartDragEvent`
- `OnUTF8KeyPress` : `UTF8KeyPressEvent`
- `ParentBidiMode` : `Boolean`
- `ParentColor` : `Boolean`
- `ParentDoubleBuffered` : `Boolean`
- `ParentFont` : `Boolean`
- `ParentShowHint` : `Boolean`
- `PopupMenu` : `PopupMenu`
- `ReadOnly` : `Boolean`
- `ScrollBars` : `ScrollStyle`
- `ShowHint` : `Boolean`
- `TabOrder` : `TabOrder`
- `TabStop` : `Boolean`
- `Tag` : `Int64`
- `Top` : `LongInt`
- `Visible` : `Boolean`
- `WantReturns` : `Boolean`
- `WantTabs` : `Boolean`
- `Width` : `LongInt`
- `WordWrap` : `Boolean`

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| o:Append(AValue) | procedure Append(const AValue: String); |
| o.HorzScrollBar = value<br>result = o.HorzScrollBar | property HorzScrollBar: TMemoScrollBar read FHorzScrollBar write FHorzScrollBar; |
| o.Lines = value<br>result = o.Lines | property Lines: TStrings read FLines write SetLines; |
| o.ScrollBars = value<br>result = o.ScrollBars | property ScrollBars: TScrollStyle read FScrollBars write SetScrollBars default ssNone; |
| o.VertScrollBar = value<br>result = o.VertScrollBar | property VertScrollBar: TMemoScrollBar read FVertScrollBar write FVertScrollBar; |
| o.WantReturns = value<br>result = o.WantReturns | property WantReturns: Boolean read FWantReturns write SetWantReturns default true; |
| o.WantTabs = value<br>result = o.WantTabs | property WantTabs: Boolean read FWantTabs write SetWantTabs default false; |
| o.WordWrap = value<br>result = o.WordWrap | property WordWrap: Boolean read FWordWrap write SetWordWrap default true; |


<a id="MemoryStream"></a>
### MemoryStream

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| o:Clear() | procedure Clear; |
| o:LoadFromFile(FileName) | procedure LoadFromFile(const FileName: string); |
| o:LoadFromStream(Stream) | procedure LoadFromStream(Stream: TStream); |
| o:SetSize(NewSize) | procedure SetSize( const NewSize: Int64 ); override; |


<a id="Menu"></a>
### Menu

#### Published properties
- `BidiMode` : `BiDiMode`
- `Images` : `CustomImageList`
- `ImagesWidth` : `LongInt`
- `Items` : `MenuItem`
- `Name` : `AnsiString`
- `OnDrawItem` : `MenuDrawItemEvent`
- `OnMeasureItem` : `MenuMeasureItemEvent`
- `OwnerDraw` : `Boolean`
- `ParentBidiMode` : `Boolean`
- `Tag` : `Int64`

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| o:DestroyHandle() | procedure DestroyHandle; virtual; |
| result = o:DispatchCommand(ACommand) | function DispatchCommand(ACommand: Word): Boolean; |
| o.FCompStyle = value<br>result = o.FCompStyle | FCompStyle: LongInt; |
| result = o:FindItem(AValue,Kind) | function FindItem(AValue: PtrInt; Kind: TFindItemKind): TMenuItem; |
| result = o:GetHelpContext(AValue,ByCommand) | function GetHelpContext(AValue: PtrInt; ByCommand: Boolean): THelpContext; |
| result = o.Handle | property Handle: HMenu read GetHandle; |
| result = o:HandleAllocated() | function HandleAllocated: Boolean; |
| o:HandleNeeded() | procedure HandleNeeded; |
| result = o:IsRightToLeft() | function IsRightToLeft: Boolean; virtual; |
| o.OnChange = function(Sender,Source,Rebuild) end | property OnChange: TMenuChangeEvent read FOnChange write FOnChange; |
| o.Parent = value<br>result = o.Parent | property Parent: TComponent read FParent write SetParent; |
| o.ShortcutHandled = value<br>result = o.ShortcutHandled | property ShortcutHandled: boolean read FShortcutHandled write FShortcutHandled; |
| result = o:UseRightToLeftAlignment() | function UseRightToLeftAlignment: Boolean; virtual; |
| result = o:UseRightToLeftReading() | function UseRightToLeftReading: Boolean; virtual; |


<a id="MenuItem"></a>
### MenuItem

#### Published properties
- `Action` : `BasicAction`
- `AutoCheck` : `Boolean`
- `Bitmap` : `Bitmap`
- `Caption` : `TranslateString`
- `Checked` : `Boolean`
- `Default` : `Boolean`
- `Enabled` : `Boolean`
- `GlyphShowMode` : `GlyphShowMode`
- `GroupIndex` : `Byte`
- `HelpContext` : `HelpContext`
- `Hint` : `TranslateString`
- `ImageIndex` : `ImageIndex`
- `Name` : `AnsiString`
- `OnClick` : `NotifyEvent`
- `OnDrawItem` : `MenuDrawItemEvent`
- `OnMeasureItem` : `MenuMeasureItemEvent`
- `RadioItem` : `Boolean`
- `RightJustify` : `Boolean`
- `ShortCut` : `ShortCut`
- `ShortCutKey2` : `ShortCut`
- `ShowAlwaysCheckable` : `Boolean`
- `SubMenuImages` : `CustomImageList`
- `SubMenuImagesWidth` : `LongInt`
- `Tag` : `Int64`
- `Visible` : `Boolean`

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| o:Add(Item) | procedure Add(Item: TMenuItem); |
| o:Add2(AItems) | procedure Add(const AItems: array of TMenuItem); |
| o:AddSeparator() | procedure AddSeparator; |
| o:Clear() | procedure Clear; |
| o:Click() | procedure Click; virtual; |
| result = o.Command | property Command: Word read FCommand; |
| result = o.Count | property Count: Integer read GetCount; |
| o:Delete(Index) | procedure Delete(Index: Integer); |
| o.FCompStyle = value<br>result = o.FCompStyle | FCompStyle: LongInt; |
| result = o:Find(ACaption) | function Find(const ACaption: string): TMenuItem; |
| aImages, aImagesWidth = o:GetImageList() | procedure GetImageList(out aImages: TCustomImageList; out aImagesWidth: Integer); virtual; |
| result = o:GetImageList2() | function GetImageList: TCustomImageList; |
| result = o:GetIsRightToLeft() | function GetIsRightToLeft:Boolean; virtual; |
| result = o:GetMergedParentMenu() | function GetMergedParentMenu: TMenu; virtual; |
| result = o:GetParentComponent() | function GetParentComponent: TComponent; override; |
| result = o:GetParentMenu() | function GetParentMenu: TMenu; virtual; |
| o.Handle = value<br>result = o.Handle | property Handle: HMenu read GetHandle write FHandle; |
| result = o:HandleAllocated() | function HandleAllocated : Boolean; |
| o:HandleNeeded() | procedure HandleNeeded; virtual; |
| result = o:HasBitmap() | function HasBitmap: boolean; |
| result = o:HasIcon() | function HasIcon: boolean; virtual; |
| result = o:HasParent() | function HasParent: Boolean; override; |
| result = o:IndexOf(Item) | function IndexOf(Item: TMenuItem): Integer; |
| result = o:IndexOfCaption(ACaption) | function IndexOfCaption(const ACaption: string): Integer; virtual; |
| o:InitiateAction() | procedure InitiateAction; virtual; |
| o:Insert(Index,Item) | procedure Insert(Index: Integer; Item: TMenuItem); |
| o:IntfDoSelect() | procedure IntfDoSelect; virtual; |
| o:InvalidateMergedItems() | procedure InvalidateMergedItems; |
| result = o:IsCheckItem() | function IsCheckItem: boolean; virtual; |
| result = o:IsInMenuBar() | function IsInMenuBar: boolean; virtual; |
| result = o:IsLine() | function IsLine: Boolean; |
| result = o:Items(Index) | property Items[Index: Integer]: TMenuItem read GetItem; default; |
| result = o.Menu | property Menu: TMenu read FMenu; |
| o.MenuIndex = value<br>result = o.MenuIndex | property MenuIndex: Integer read GetMenuIndex write SetMenuIndex; |
| result = o:MenuVisibleIndex() | function MenuVisibleIndex: integer; |
| result = o.Merged | property Merged: TMenuItem read FMerged; |
| result = o.MergedItems | property MergedItems: TMergedMenuItems read GetMergedItems; |
| result = o.MergedParent | property MergedParent: TMenuItem read GetMergedParent; |
| result = o.MergedWith | property MergedWith: TMenuItem read FMergedWith; |
| result = o.Parent | property Parent: TMenuItem read GetParent; |
| o:RecreateHandle() | procedure RecreateHandle; virtual; |
| o:Remove(Item) | procedure Remove(Item: TMenuItem); |
| o:UpdateImage()<br>o:UpdateImage(forced) | procedure UpdateImage(forced: Boolean = false); |
| o:UpdateImages()<br>o:UpdateImages(forced) | procedure UpdateImages(forced: Boolean = false); |
| result = o:VisibleIndexOf(Item) | function VisibleIndexOf(Item: TMenuItem): Integer; |
| o:WriteDebugReport(Prefix) | procedure WriteDebugReport(const Prefix: string); |


<a id="Monitor"></a>
### Monitor

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| result = o.BoundsRect | property BoundsRect: TRect read GetBoundsRect; |
| result = o.Handle | property Handle: HMONITOR read FHandle; |
| result = o.Height | property Height: Integer read GetHeight; |
| result = o.Left | property Left: Integer read GetLeft; |
| result = o.MonitorNum | property MonitorNum: Integer read FMonitorNum; |
| result = o.PixelsPerInch | property PixelsPerInch: Integer read GetPixelsPerInch; |
| result = o.Primary | property Primary: Boolean read GetPrimary; |
| result = o.Top | property Top: Integer read GetTop; |
| result = o.Width | property Width: Integer read GetWidth; |
| result = o.WorkareaRect | property WorkareaRect: TRect read GetWorkareaRect; |


<a id="Notebook"></a>
### Notebook

#### Published properties
- `Align` : `Align`
- `AnchorSideBottom` : `AnchorSide`
- `AnchorSideLeft` : `AnchorSide`
- `AnchorSideRight` : `AnchorSide`
- `AnchorSideTop` : `AnchorSide`
- `Anchors` : `Anchors`
- `AutoSize` : `Boolean`
- `BiDiMode` : `BiDiMode`
- `BorderSpacing` : `ControlBorderSpacing`
- `Color` : `GraphicsColor`
- `Constraints` : `SizeConstraints`
- `Cursor` : `Cursor`
- `DragCursor` : `Cursor`
- `DragMode` : `DragMode`
- `Enabled` : `Boolean`
- `Height` : `LongInt`
- `HelpContext` : `HelpContext`
- `HelpKeyword` : `AnsiString`
- `HelpType` : `HelpType`
- `Hint` : `TranslateString`
- `Left` : `LongInt`
- `Name` : `AnsiString`
- `OnChangeBounds` : `NotifyEvent`
- `OnContextPopup` : `ContextPopupEvent`
- `OnDragDrop` : `DragDropEvent`
- `OnDragOver` : `DragOverEvent`
- `OnEndDrag` : `EndDragEvent`
- `OnEnter` : `NotifyEvent`
- `OnExit` : `NotifyEvent`
- `OnMouseDown` : `MouseEvent`
- `OnMouseEnter` : `NotifyEvent`
- `OnMouseLeave` : `NotifyEvent`
- `OnMouseMove` : `MouseMoveEvent`
- `OnMouseUp` : `MouseEvent`
- `OnMouseWheel` : `MouseWheelEvent`
- `OnMouseWheelDown` : `MouseWheelUpDownEvent`
- `OnMouseWheelUp` : `MouseWheelUpDownEvent`
- `OnResize` : `NotifyEvent`
- `OnStartDrag` : `StartDragEvent`
- `PageIndex` : `LongInt`
- `Pages` : `Strings`
- `ParentBiDiMode` : `Boolean`
- `PopupMenu` : `PopupMenu`
- `TabOrder` : `TabOrder`
- `TabStop` : `Boolean`
- `Tag` : `Int64`
- `Top` : `LongInt`
- `Width` : `LongInt`

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| result = o.ActivePage | property ActivePage: String read GetActivePage; |
| result = o.ActivePageComponent | property ActivePageComponent: TPage read GetActivePageComponent; |
| result = o:IndexOf(APage) | function IndexOf(APage: TPage): integer; |
| result = o:Page(Index) | property Page[Index: Integer]: TPage read GetPage; |
| result = o.PageCount | property PageCount: integer read GetPageCount; |
| o:ShowControl(AControl) | procedure ShowControl(AControl: TControl); override; |


<a id="OICustomPropertyGrid"></a>
### OICustomPropertyGrid

#### Published properties
- `AnchorSideBottom` : `AnchorSide`
- `AnchorSideLeft` : `AnchorSide`
- `AnchorSideRight` : `AnchorSide`
- `AnchorSideTop` : `AnchorSide`
- `Cursor` : `Cursor`
- `Height` : `LongInt`
- `HelpContext` : `HelpContext`
- `HelpKeyword` : `AnsiString`
- `HelpType` : `HelpType`
- `Hint` : `TranslateString`
- `Left` : `LongInt`
- `Name` : `AnsiString`
- `Tag` : `Int64`
- `Top` : `LongInt`
- `Width` : `LongInt`

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| o.BackgroundColor = value<br>result = o.BackgroundColor | property BackgroundColor: TColor read FBackgroundColor write SetBackgroundColor default DefBackgroundColor; |
| o:BuildPropertyList()<br>...<br>o:BuildPropertyList(OnlyIfNeeded,FocusEditor) | procedure BuildPropertyList(OnlyIfNeeded: Boolean = False; FocusEditor: Boolean = True); |
| result = o:CanEditRowValue(CheckFocus) | function CanEditRowValue(CheckFocus: boolean): boolean; |
| o.CheckboxForBoolean = value<br>result = o.CheckboxForBoolean | property CheckboxForBoolean: Boolean read FCheckboxForBoolean write FCheckboxForBoolean; |
| o:Clear() | procedure Clear; |
| o.Column = value<br>result = o.Column | property Column: TOICustomPropertyGridColumn read FColumn write SetColumn; |
| result = o:ConsistencyCheck() | function ConsistencyCheck: integer; |
| o.CurrentEditValue = value<br>result = o.CurrentEditValue | property CurrentEditValue: string read GetCurrentEditValue write SetCurrentEditValue; |
| o.DefaultItemHeight = value<br>result = o.DefaultItemHeight | property DefaultItemHeight:integer read FDefaultItemHeight write FDefaultItemHeight default 0; |
| o.DefaultValueFont = value<br>result = o.DefaultValueFont | property DefaultValueFont: TFont read FDefaultValueFont write FDefaultValueFont; |
| o.DrawHorzGridLines = value<br>result = o.DrawHorzGridLines | property DrawHorzGridLines: Boolean read FDrawHorzGridLines write SetDrawHorzGridLines default True; |
| result = o.ExpandedProperties | property ExpandedProperties: TStringList read FExpandedProperties; |
| o.Favorites = value<br>result = o.Favorites | property Favorites: TOIFavoriteProperties read FFavorites write SetFavorites; |
| o.Filter = value<br>result = o.Filter | property Filter : TTypeKinds read FFilter write SetFilter; |
| o:FocusCurrentEditor() | procedure FocusCurrentEditor; |
| result = o:GetActiveRow() | function GetActiveRow: TOIPropertyGridRow; |
| result = o:GetHintTypeAt(RowIndex,X) | function GetHintTypeAt(RowIndex: integer; X: integer): TPropEditHint; |
| result = o:GetRowByPath(PropPath) | function GetRowByPath(const PropPath: string): TOIPropertyGridRow; |
| result = o:GridHeight() | function GridHeight: integer; |
| o.GutterColor = value<br>result = o.GutterColor | property GutterColor: TColor read FGutterColor write SetGutterColor default DefGutterColor; |
| o.GutterEdgeColor = value<br>result = o.GutterEdgeColor | property GutterEdgeColor: TColor read FGutterEdgeColor write SetGutterEdgeColor default DefGutterEdgeColor; |
| o.HideClassNames = value<br>result = o.HideClassNames | property HideClassNames: Boolean read FHideClassNames write FHideClassNames; |
| o.HighlightColor = value<br>result = o.HighlightColor | property HighlightColor: TColor read FHighlightColor write SetHighlightColor default DefHighlightColor; |
| o.HighlightFont = value<br>result = o.HighlightFont | property HighlightFont: TFont read FHighlightFont write FHighlightFont; |
| o.Indent = value<br>result = o.Indent | property Indent: integer read FIndent write FIndent; |
| o.ItemIndex = value<br>result = o.ItemIndex | property ItemIndex: integer read FItemIndex write SetItemIndex; |
| o.Layout = value<br>result = o.Layout | property Layout: TOILayout read FLayout write FLayout default oilHorizontal; |
| result = o:MouseToIndex(y,MustExist) | function MouseToIndex(y: integer; MustExist: boolean): integer; |
| o.NameFont = value<br>result = o.NameFont | property NameFont: TFont read FNameFont write FNameFont; |
| o.OnEditorFilter = function(Sender,aEditor,aShow) return aShow end | property OnEditorFilter: TOIEditorFilterEvent read FOnEditorFilter write FOnEditorFilter; |
| o.OnModified = function(Sender) end | property OnModified: TNotifyEvent read FOnModified write FOnModified; |
| o.OnOIKeyDown = function(Sender,Key,Shift) return Key end | property OnOIKeyDown: TKeyEvent read FOnOIKeyDown write FOnOIKeyDown; |
| o.OnSelectionChange = function(Sender) end | property OnSelectionChange: TNotifyEvent read FOnSelectionChange write FOnSelectionChange; |
| o:Paint() | procedure Paint; override; |
| o.PreferredSplitterX = value<br>result = o.PreferredSplitterX | property PreferredSplitterX: integer read FPreferredSplitterX write FPreferredSplitterX default 100; |
| o:PropEditLookupRootChange() | procedure PropEditLookupRootChange; |
| o.PropNameFilter = value<br>result = o.PropNameFilter | property PropNameFilter : String read FPropNameFilter write FPropNameFilter; |
| result = o:PropertyEditorByName(PropName) | function PropertyEditorByName(const PropName: string): TPropertyEditor; |
| o.PropertyEditorHook = value<br>result = o.PropertyEditorHook | property PropertyEditorHook: TPropertyEditorHook read FPropertyEditorHook write SetPropertyEditorHook; |
| result = o:PropertyPath(Index) | function PropertyPath(Index: integer):string; |
| result = o:PropertyPath2(Row) | function PropertyPath(Row: TOIPropertyGridRow):string; |
| o.ReadOnlyColor = value<br>result = o.ReadOnlyColor | property ReadOnlyColor: TColor read FReadOnlyColor write SetReadOnlyColor default DefReadOnlyColor; |
| result = o:RealDefaultItemHeight() | function RealDefaultItemHeight: integer; |
| o.ReferencesColor = value<br>result = o.ReferencesColor | property ReferencesColor: TColor read FReferencesColor write SetReferences default DefReferencesColor; |
| o:RefreshPropertyValues() | procedure RefreshPropertyValues; |
| result = o.RowCount | property RowCount: integer read GetRowCount; |
| o.RowSpacing = value<br>result = o.RowSpacing | property RowSpacing: integer read FRowSpacing write SetRowSpacing; |
| result = o:Rows(Index) | property Rows[Index: integer]: TOIPropertyGridRow read GetRow; |
| o:SaveChanges() | procedure SaveChanges; |
| o:ScrollToActiveItem() | procedure ScrollToActiveItem; |
| o:ScrollToItem(NewIndex) | procedure ScrollToItem(NewIndex: Integer); |
| o:SetCurrentRowValue(NewValue) | procedure SetCurrentRowValue(const NewValue: string); |
| o:SetItemIndexAndFocus(NewItemIndex)<br>o:SetItemIndexAndFocus(NewItemIndex,WasValueClick) | procedure SetItemIndexAndFocus(NewItemIndex: integer; WasValueClick: Boolean = False); |
| o.ShowGutter = value<br>result = o.ShowGutter | property ShowGutter: Boolean read FShowGutter write SetShowGutter default True; |
| o.SplitterX = value<br>result = o.SplitterX | property SplitterX: integer read FSplitterX write SetSplitterX default 100; |
| o.SubPropertiesColor = value<br>result = o.SubPropertiesColor | property SubPropertiesColor: TColor read FSubPropertiesColor write SetSubPropertiesColor default DefSubPropertiesColor; |
| result = o:TopMax() | function TopMax: integer; |
| o.TopY = value<br>result = o.TopY | property TopY: integer read FTopY write SetTopY default 0; |
| o.ValueDifferBackgrndColor = value<br>result = o.ValueDifferBackgrndColor | property ValueDifferBackgrndColor: TColor read FValueDifferBackgrndColor write SetValueDifferBackgrndColor default DefValueDifferBackgrndColor; |
| o.ValueFont = value<br>result = o.ValueFont | property ValueFont: TFont read FValueFont write FValueFont; |


<a id="OIFavoriteProperties"></a>
### OIFavoriteProperties

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| o:Add(NewItem) | procedure Add(NewItem: TOIFavoriteProperty); virtual; |
| o:AddNew(NewItem) | procedure AddNew(NewItem: TOIFavoriteProperty); |
| o:Assign(Src) | procedure Assign(Src: TOIFavoriteProperties); virtual; |
| o:Clear() | procedure Clear; virtual; |
| result = o:Contains(AnItem) | function Contains(AnItem: TOIFavoriteProperty): Boolean; virtual; |
| result = o.Count | property Count: integer read GetCount; |
| result = o:CreateCopy() | function CreateCopy: TOIFavoriteProperties; |
| o:DeleteConstraints(AnItem) | procedure DeleteConstraints(AnItem: TOIFavoriteProperty); virtual; |
| o:DeleteDoubles() | procedure DeleteDoubles; virtual; |
| result = o.DoublesDeleted | property DoublesDeleted: boolean read FDoublesDeleted; |
| result = o:IsEqual(TheFavorites) | function IsEqual(TheFavorites: TOIFavoriteProperties): boolean; |
| result = o:Items(Index) | property Items[Index: integer]: TOIFavoriteProperty read GetItems; default; |
| o.Modified = value<br>result = o.Modified | property Modified: Boolean read FModified write FModified; |
| o:Remove(AnItem) | procedure Remove(AnItem: TOIFavoriteProperty); virtual; |
| o:Sort() | procedure Sort; virtual; |
| result = o.Sorted | property Sorted: Boolean read FSorted; |
| o:WriteDebugReport() | procedure WriteDebugReport; |


<a id="OIFavoriteProperty"></a>
### OIFavoriteProperty

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| o:Assign(Src) | procedure Assign(Src: TOIFavoriteProperty); virtual; |
| result = o:Compare(AFavorite) | function Compare(AFavorite: TOIFavoriteProperty): integer; |
| result = o:Constrains(AnItem) | function Constrains(AnItem: TOIFavoriteProperty): boolean; |
| result = o:CreateCopy() | function CreateCopy: TOIFavoriteProperty; |
| result = o:DebugReportAsString() | function DebugReportAsString: string; |


<a id="OIPropertyGridRow"></a>
### OIPropertyGridRow

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| result = o.Bottom | property Bottom: integer read GetBottom; |
| result = o.ChildCount | property ChildCount: integer read FChildCount; |
| result = o:ConsistencyCheck() | function ConsistencyCheck: integer; |
| result = o.Editor | property Editor: TPropertyEditor read FEditor; |
| result = o.Expanded | property Expanded: boolean read FExpanded; |
| result = o.FirstChild | property FirstChild: TOIPropertyGridRow read FFirstChild; |
| result = o:GetBottom() | function GetBottom: integer; |
| result = o:HasChild(Row) | function HasChild(Row: TOIPropertyGridRow): boolean; |
| o.Height = value<br>result = o.Height | property Height: integer read FHeight write FHeight; |
| result = o.Index | property Index: integer read FIndex; |
| result = o:IsDisabled() | function IsDisabled: boolean; |
| result = o:IsReadOnly() | function IsReadOnly: boolean; |
| result = o.LastChild | property LastChild: TOIPropertyGridRow read FLastChild; |
| result = o.Lvl | property Lvl: integer read FLvl; |
| o:MeasureHeight(ACanvas) | procedure MeasureHeight(ACanvas: TCanvas); |
| result = o.Name | property Name: string read FName; |
| result = o:Next() | function Next: TOIPropertyGridRow; |
| result = o.NextBrother | property NextBrother: TOIPropertyGridRow read FNextBrother; |
| result = o:NextSkipChilds() | function NextSkipChilds: TOIPropertyGridRow; |
| result = o.Parent | property Parent: TOIPropertyGridRow read FParent; |
| result = o.PriorBrother | property PriorBrother: TOIPropertyGridRow read FPriorBrother; |
| o.Top = value<br>result = o.Top | property Top: integer read FTop write FTop; |
| result = o.Tree | property Tree: TOICustomPropertyGrid read FTree; |
| o:WriteDebugReport(Prefix) | procedure WriteDebugReport(const Prefix: string); |


<a id="OIRestrictedProperty"></a>
### OIRestrictedProperty

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| o.WidgetSets = value<br>result = o.WidgetSets | property WidgetSets: TLCLPlatforms read FWidgetSets write FWidgetSets; |


<a id="OpenDialog"></a>
### OpenDialog

#### Published properties
- `DefaultExt` : `AnsiString`
- `FileName` : `AnsiString`
- `Filter` : `AnsiString`
- `FilterIndex` : `LongInt`
- `HelpContext` : `HelpContext`
- `InitialDir` : `AnsiString`
- `Name` : `AnsiString`
- `OnCanClose` : `CloseQueryEvent`
- `OnClose` : `NotifyEvent`
- `OnFolderChange` : `NotifyEvent`
- `OnHelpClicked` : `NotifyEvent`
- `OnSelectionChange` : `NotifyEvent`
- `OnShow` : `NotifyEvent`
- `OnTypeChange` : `NotifyEvent`
- `Options` : `OpenOptions`
- `Tag` : `Int64`
- `Title` : `TranslateString`

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| o:DoFolderChange() | procedure DoFolderChange; virtual; |
| o:DoSelectionChange() | procedure DoSelectionChange; virtual; |
| o:IntfSetOption(AOption,AValue) | procedure IntfSetOption(const AOption: TOpenOption; const AValue: Boolean); |


<a id="PageControl"></a>
### PageControl

#### Published properties
- `ActivePage` : `TabSheet`
- `Align` : `Align`
- `AnchorSideBottom` : `AnchorSide`
- `AnchorSideLeft` : `AnchorSide`
- `AnchorSideRight` : `AnchorSide`
- `AnchorSideTop` : `AnchorSide`
- `Anchors` : `Anchors`
- `AutoSize` : `Boolean`
- `BiDiMode` : `BiDiMode`
- `BorderSpacing` : `ControlBorderSpacing`
- `Constraints` : `SizeConstraints`
- `Cursor` : `Cursor`
- `DockSite` : `Boolean`
- `DragCursor` : `Cursor`
- `DragKind` : `DragKind`
- `DragMode` : `DragMode`
- `Enabled` : `Boolean`
- `Font` : `Font`
- `Height` : `LongInt`
- `HelpContext` : `HelpContext`
- `HelpKeyword` : `AnsiString`
- `HelpType` : `HelpType`
- `Hint` : `TranslateString`
- `HotTrack` : `Boolean`
- `Images` : `CustomImageList`
- `ImagesWidth` : `LongInt`
- `Left` : `LongInt`
- `MultiLine` : `Boolean`
- `Name` : `AnsiString`
- `OnChange` : `NotifyEvent`
- `OnChanging` : `TabChangingEvent`
- `OnCloseTabClicked` : `NotifyEvent`
- `OnContextPopup` : `ContextPopupEvent`
- `OnDockDrop` : `DockDropEvent`
- `OnDockOver` : `DockOverEvent`
- `OnDragDrop` : `DragDropEvent`
- `OnDragOver` : `DragOverEvent`
- `OnEndDock` : `EndDragEvent`
- `OnEndDrag` : `EndDragEvent`
- `OnEnter` : `NotifyEvent`
- `OnExit` : `NotifyEvent`
- `OnGetDockCaption` : `GetDockCaptionEvent`
- `OnGetImageIndex` : `TabGetImageEvent`
- `OnGetSiteInfo` : `GetSiteInfoEvent`
- `OnMouseDown` : `MouseEvent`
- `OnMouseEnter` : `NotifyEvent`
- `OnMouseLeave` : `NotifyEvent`
- `OnMouseMove` : `MouseMoveEvent`
- `OnMouseUp` : `MouseEvent`
- `OnMouseWheel` : `MouseWheelEvent`
- `OnMouseWheelDown` : `MouseWheelUpDownEvent`
- `OnMouseWheelUp` : `MouseWheelUpDownEvent`
- `OnResize` : `NotifyEvent`
- `OnStartDock` : `StartDockEvent`
- `OnStartDrag` : `StartDragEvent`
- `OnUnDock` : `UnDockEvent`
- `Options` : `CTabControlOptions`
- `ParentBiDiMode` : `Boolean`
- `ParentFont` : `Boolean`
- `ParentShowHint` : `Boolean`
- `PopupMenu` : `PopupMenu`
- `RaggedRight` : `Boolean`
- `ScrollOpposite` : `Boolean`
- `ShowHint` : `Boolean`
- `ShowTabs` : `Boolean`
- `Style` : `TabStyle`
- `TabHeight` : `SmallInt`
- `TabIndex` : `LongInt`
- `TabOrder` : `TabOrder`
- `TabPosition` : `TabPosition`
- `TabStop` : `Boolean`
- `TabWidth` : `SmallInt`
- `Tag` : `Int64`
- `Top` : `LongInt`
- `Visible` : `Boolean`
- `Width` : `LongInt`

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| o.ActivePageIndex = value<br>result = o.ActivePageIndex | property ActivePageIndex: Integer read GetActivePageIndex write SetActivePageIndex; |
| result = o:AddTabSheet() | function AddTabSheet: TTabSheet; |
| o:Clear() | procedure Clear; |
| result = o:FindNextPage(CurPage,GoForward,CheckTabVisible) | function FindNextPage(CurPage: TTabSheet; GoForward, CheckTabVisible: Boolean): TTabSheet; |
| result = o:IndexOfPageAt(X,Y) | function IndexOfPageAt(X, Y: Integer): Integer; override; |
| result = o:IndexOfPageAt2(P) | function IndexOfPageAt(P: TPoint): Integer; override; |
| result = o:IndexOfTabAt(X,Y) | function IndexOfTabAt(X, Y: Integer): Integer; override; |
| result = o:IndexOfTabAt2(P) | function IndexOfTabAt(P: TPoint): Integer; override; |
| result = o:Pages(Index) | property Pages[Index: Integer]: TTabSheet read GetTabSheet; |
| o:SelectNextPage(GoForward) | procedure SelectNextPage(GoForward: Boolean); |
| o:SelectNextPage2(GoForward,CheckTabVisible) | procedure SelectNextPage(GoForward: Boolean; CheckTabVisible: Boolean); |


<a id="PaintBox"></a>
### PaintBox

#### Published properties
- `Align` : `Align`
- `AnchorSideBottom` : `AnchorSide`
- `AnchorSideLeft` : `AnchorSide`
- `AnchorSideRight` : `AnchorSide`
- `AnchorSideTop` : `AnchorSide`
- `Anchors` : `Anchors`
- `BorderSpacing` : `ControlBorderSpacing`
- `Color` : `GraphicsColor`
- `Constraints` : `SizeConstraints`
- `Cursor` : `Cursor`
- `DragCursor` : `Cursor`
- `DragMode` : `DragMode`
- `Enabled` : `Boolean`
- `Font` : `Font`
- `Height` : `LongInt`
- `HelpContext` : `HelpContext`
- `HelpKeyword` : `AnsiString`
- `HelpType` : `HelpType`
- `Hint` : `TranslateString`
- `Left` : `LongInt`
- `Name` : `AnsiString`
- `OnChangeBounds` : `NotifyEvent`
- `OnClick` : `NotifyEvent`
- `OnContextPopup` : `ContextPopupEvent`
- `OnDblClick` : `NotifyEvent`
- `OnDragDrop` : `DragDropEvent`
- `OnDragOver` : `DragOverEvent`
- `OnEndDrag` : `EndDragEvent`
- `OnMouseDown` : `MouseEvent`
- `OnMouseEnter` : `NotifyEvent`
- `OnMouseLeave` : `NotifyEvent`
- `OnMouseMove` : `MouseMoveEvent`
- `OnMouseUp` : `MouseEvent`
- `OnMouseWheel` : `MouseWheelEvent`
- `OnMouseWheelDown` : `MouseWheelUpDownEvent`
- `OnMouseWheelHorz` : `MouseWheelEvent`
- `OnMouseWheelLeft` : `MouseWheelUpDownEvent`
- `OnMouseWheelRight` : `MouseWheelUpDownEvent`
- `OnMouseWheelUp` : `MouseWheelUpDownEvent`
- `OnPaint` : `NotifyEvent`
- `OnResize` : `NotifyEvent`
- `OnStartDrag` : `StartDragEvent`
- `ParentColor` : `Boolean`
- `ParentFont` : `Boolean`
- `ParentShowHint` : `Boolean`
- `PopupMenu` : `PopupMenu`
- `ShowHint` : `Boolean`
- `Tag` : `Int64`
- `Top` : `LongInt`
- `Visible` : `Boolean`
- `Width` : `LongInt`

<a id="Panel"></a>
### Panel

#### Published properties
- `Align` : `Align`
- `Alignment` : `Alignment`
- `AnchorSideBottom` : `AnchorSide`
- `AnchorSideLeft` : `AnchorSide`
- `AnchorSideRight` : `AnchorSide`
- `AnchorSideTop` : `AnchorSide`
- `Anchors` : `Anchors`
- `AutoSize` : `Boolean`
- `BevelColor` : `GraphicsColor`
- `BevelInner` : `GraphicsBevelCut`
- `BevelOuter` : `GraphicsBevelCut`
- `BevelWidth` : `BevelWidth`
- `BidiMode` : `BiDiMode`
- `BorderSpacing` : `ControlBorderSpacing`
- `BorderStyle` : `BorderStyle`
- `BorderWidth` : `BorderWidth`
- `Caption` : `TranslateString`
- `ChildSizing` : `ControlChildSizing`
- `ClientHeight` : `LongInt`
- `ClientWidth` : `LongInt`
- `Color` : `GraphicsColor`
- `Constraints` : `SizeConstraints`
- `Cursor` : `Cursor`
- `DockSite` : `Boolean`
- `DoubleBuffered` : `Boolean`
- `DragCursor` : `Cursor`
- `DragKind` : `DragKind`
- `DragMode` : `DragMode`
- `Enabled` : `Boolean`
- `Font` : `Font`
- `FullRepaint` : `Boolean`
- `Height` : `LongInt`
- `HelpContext` : `HelpContext`
- `HelpKeyword` : `AnsiString`
- `HelpType` : `HelpType`
- `Hint` : `TranslateString`
- `Left` : `LongInt`
- `Name` : `AnsiString`
- `OnChangeBounds` : `NotifyEvent`
- `OnClick` : `NotifyEvent`
- `OnContextPopup` : `ContextPopupEvent`
- `OnDblClick` : `NotifyEvent`
- `OnDockDrop` : `DockDropEvent`
- `OnDockOver` : `DockOverEvent`
- `OnDragDrop` : `DragDropEvent`
- `OnDragOver` : `DragOverEvent`
- `OnEndDock` : `EndDragEvent`
- `OnEndDrag` : `EndDragEvent`
- `OnEnter` : `NotifyEvent`
- `OnExit` : `NotifyEvent`
- `OnGetDockCaption` : `GetDockCaptionEvent`
- `OnGetSiteInfo` : `GetSiteInfoEvent`
- `OnMouseDown` : `MouseEvent`
- `OnMouseEnter` : `NotifyEvent`
- `OnMouseLeave` : `NotifyEvent`
- `OnMouseMove` : `MouseMoveEvent`
- `OnMouseUp` : `MouseEvent`
- `OnMouseWheel` : `MouseWheelEvent`
- `OnMouseWheelDown` : `MouseWheelUpDownEvent`
- `OnMouseWheelHorz` : `MouseWheelEvent`
- `OnMouseWheelLeft` : `MouseWheelUpDownEvent`
- `OnMouseWheelRight` : `MouseWheelUpDownEvent`
- `OnMouseWheelUp` : `MouseWheelUpDownEvent`
- `OnPaint` : `NotifyEvent`
- `OnResize` : `NotifyEvent`
- `OnStartDock` : `StartDockEvent`
- `OnStartDrag` : `StartDragEvent`
- `OnUnDock` : `UnDockEvent`
- `ParentBackground` : `Boolean`
- `ParentBidiMode` : `Boolean`
- `ParentColor` : `Boolean`
- `ParentDoubleBuffered` : `Boolean`
- `ParentFont` : `Boolean`
- `ParentShowHint` : `Boolean`
- `PopupMenu` : `PopupMenu`
- `ShowAccelChar` : `Boolean`
- `ShowHint` : `Boolean`
- `TabOrder` : `TabOrder`
- `TabStop` : `Boolean`
- `Tag` : `Int64`
- `Top` : `LongInt`
- `UseDockManager` : `Boolean`
- `VerticalAlignment` : `VerticalAlignment`
- `Visible` : `Boolean`
- `Width` : `LongInt`
- `Wordwrap` : `Boolean`

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| o.Alignment = value<br>result = o.Alignment | property Alignment: TAlignment read FAlignment write SetAlignment default taCenter; |
| o.BevelColor = value<br>result = o.BevelColor | property BevelColor: TColor read FBevelColor write SetBevelColor default clDefault; |
| o.BevelInner = value<br>result = o.BevelInner | property BevelInner: TPanelBevel read FBevelInner write SetBevelInner default bvNone; |
| o.BevelOuter = value<br>result = o.BevelOuter | property BevelOuter: TPanelBevel read FBevelOuter write SetBevelOuter default bvRaised; |
| o.BevelWidth = value<br>result = o.BevelWidth | property BevelWidth: TBevelWidth read FBevelWidth write SetBevelWidth default 1; |
| o.FullRepaint = value<br>result = o.FullRepaint | property FullRepaint: Boolean read FFullRepaint write FFullRepaint default True; |


<a id="Pen"></a>
### Pen

#### Published properties
- `Color` : `GraphicsColor`
- `Cosmetic` : `Boolean`
- `EndCap` : `FPPenEndCap`
- `JoinStyle` : `FPPenJoinStyle`
- `Mode` : `FPPenMode`
- `Style` : `FPPenStyle`
- `Width` : `LongInt`

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| result = o:GetPattern() | function GetPattern: TPenPattern; |
| o:SetPattern(APattern) | procedure SetPattern(APattern: TPenPattern); reintroduce; |


<a id="Persistent"></a>
### Persistent

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| o:Assign(Source) | procedure Assign(Source: TPersistent); virtual; |
| o:FPOAttachObserver(AObserver) | Procedure FPOAttachObserver(AObserver : TObject); |
| o:FPODetachObserver(AObserver) | Procedure FPODetachObserver(AObserver : TObject); |
| o:FPONotifyObservers(ASender,AOperation,Data) | Procedure FPONotifyObservers(ASender : TObject; AOperation : TFPObservedOperation; Data : Pointer); |
| result = o:GetNamePath() | function  GetNamePath: string; virtual; |


<a id="Picture"></a>
### Picture

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| o.Bitmap = value<br>result = o.Bitmap | property Bitmap: TBitmap read GetBitmap write SetBitmap; |
| o:Clear() | procedure Clear; virtual; |
| o.Graphic = value<br>result = o.Graphic | property Graphic: TGraphic read FGraphic write SetGraphic; |
| result = o.Height | property Height: Integer read GetHeight; |
| o.Icon = value<br>result = o.Icon | property Icon: TIcon read GetIcon write SetIcon; |
| o.Jpeg = value<br>result = o.Jpeg | property Jpeg: TJpegImage read GetJpeg write SetJpeg; |
| o:LoadFromFile(Filename) | procedure LoadFromFile(const Filename: string); |
| o:LoadFromResourceName(Instance,ResName) | procedure LoadFromResourceName(Instance: THandle; const ResName: String); |
| o:LoadFromStream(Stream) | procedure LoadFromStream(Stream: TStream); |
| o:LoadFromStreamWithFileExt(Stream,FileExt) | procedure LoadFromStreamWithFileExt(Stream: TStream; const FileExt: string); |
| o.OnChange = function(Sender) end | property OnChange: TNotifyEvent read FOnChange write FOnChange; |
| o.OnProgress = function(Sender,Stage,PercentDone,RedrawNow,R,Msg,Continue) return Continue end | property OnProgress: TProgressEvent read FOnProgress write FOnProgress; |
| o.PNG = value<br>result = o.PNG | property PNG: TPortableNetworkGraphic read GetPNG write SetPNG; |
| o.PNM = value<br>result = o.PNM | property PNM: TPortableAnyMapGraphic read GetPNM write SetPNM; |
| o.Pixmap = value<br>result = o.Pixmap | property Pixmap: TPixmap read GetPixmap write SetPixmap; |
| o:SaveToFile(Filename)<br>o:SaveToFile(Filename,FileExt) | procedure SaveToFile(const Filename: string; const FileExt: string = ''); |
| o:SaveToStream(Stream) | procedure SaveToStream(Stream: TStream); |
| o:SaveToStreamWithFileExt(Stream,FileExt) | procedure SaveToStreamWithFileExt(Stream: TStream; const FileExt: string); |
| result = o:SupportsClipboardFormat(FormatID) | class function SupportsClipboardFormat(FormatID: TClipboardFormat): Boolean; |
| result = o.Width | property Width: Integer read GetWidth; |


<a id="PopupMenu"></a>
### PopupMenu

#### Published properties
- `Alignment` : `PopupAlignment`
- `AutoPopup` : `Boolean`
- `BidiMode` : `BiDiMode`
- `HelpContext` : `HelpContext`
- `Images` : `CustomImageList`
- `ImagesWidth` : `LongInt`
- `Items` : `MenuItem`
- `Name` : `AnsiString`
- `OnClose` : `NotifyEvent`
- `OnDrawItem` : `MenuDrawItemEvent`
- `OnMeasureItem` : `MenuMeasureItemEvent`
- `OnPopup` : `NotifyEvent`
- `OwnerDraw` : `Boolean`
- `ParentBidiMode` : `Boolean`
- `Tag` : `Int64`
- `TrackButton` : `TrackButton`

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| o:Close() | procedure Close; |
| o:PopUp() | procedure PopUp; |
| o:PopUp2(X,Y) | procedure PopUp(X, Y: Integer); virtual; |
| o.PopupComponent = value<br>result = o.PopupComponent | property PopupComponent: TComponent read FPopupComponent write FPopupComponent; |
| result = o.PopupPoint | property PopupPoint: TPoint read FPopupPoint; |


<a id="PopupNotifier"></a>
### PopupNotifier

#### Published properties
- `Color` : `GraphicsColor`
- `Icon` : `Picture`
- `Name` : `AnsiString`
- `OnClose` : `CloseEvent`
- `Tag` : `Int64`
- `Text` : `AnsiString`
- `TextFont` : `Font`
- `Title` : `AnsiString`
- `TitleFont` : `Font`
- `Visible` : `Boolean`

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| o:Hide() | procedure Hide; |
| o:Show() | procedure Show; |
| o:ShowAtPos(x,y) | procedure ShowAtPos(x: Integer; y: Integer); |
| o.vNotifierForm = value<br>result = o.vNotifierForm | vNotifierForm: TNotifierForm; |


<a id="ProgressBar"></a>
### ProgressBar

#### Published properties
- `Align` : `Align`
- `AnchorSideBottom` : `AnchorSide`
- `AnchorSideLeft` : `AnchorSide`
- `AnchorSideRight` : `AnchorSide`
- `AnchorSideTop` : `AnchorSide`
- `Anchors` : `Anchors`
- `BarShowText` : `Boolean`
- `BorderSpacing` : `ControlBorderSpacing`
- `BorderWidth` : `BorderWidth`
- `Color` : `GraphicsColor`
- `Constraints` : `SizeConstraints`
- `Cursor` : `Cursor`
- `DragCursor` : `Cursor`
- `DragKind` : `DragKind`
- `DragMode` : `DragMode`
- `Enabled` : `Boolean`
- `Font` : `Font`
- `Height` : `LongInt`
- `HelpContext` : `HelpContext`
- `HelpKeyword` : `AnsiString`
- `HelpType` : `HelpType`
- `Hint` : `TranslateString`
- `Left` : `LongInt`
- `Max` : `LongInt`
- `Min` : `LongInt`
- `Name` : `AnsiString`
- `OnContextPopup` : `ContextPopupEvent`
- `OnDragDrop` : `DragDropEvent`
- `OnDragOver` : `DragOverEvent`
- `OnEndDrag` : `EndDragEvent`
- `OnEnter` : `NotifyEvent`
- `OnExit` : `NotifyEvent`
- `OnMouseDown` : `MouseEvent`
- `OnMouseEnter` : `NotifyEvent`
- `OnMouseLeave` : `NotifyEvent`
- `OnMouseMove` : `MouseMoveEvent`
- `OnMouseUp` : `MouseEvent`
- `OnMouseWheel` : `MouseWheelEvent`
- `OnMouseWheelDown` : `MouseWheelUpDownEvent`
- `OnMouseWheelUp` : `MouseWheelUpDownEvent`
- `OnStartDock` : `StartDockEvent`
- `OnStartDrag` : `StartDragEvent`
- `Orientation` : `ProgressBarOrientation`
- `ParentColor` : `Boolean`
- `ParentFont` : `Boolean`
- `ParentShowHint` : `Boolean`
- `PopupMenu` : `PopupMenu`
- `Position` : `LongInt`
- `ShowHint` : `Boolean`
- `Smooth` : `Boolean`
- `Step` : `LongInt`
- `Style` : `ProgressBarStyle`
- `TabOrder` : `TabOrder`
- `TabStop` : `Boolean`
- `Tag` : `Int64`
- `Top` : `LongInt`
- `Visible` : `Boolean`
- `Width` : `LongInt`

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| o.BarShowText = value<br>result = o.BarShowText | property BarShowText : boolean read FBarShowText write SetBarShowText default False; |
| o.Max = value<br>result = o.Max | property Max: Integer read GetMax write SetMax default 100; |
| o.Min = value<br>result = o.Min | property Min: Integer read GetMin write SetMin default 0; |
| o.Orientation = value<br>result = o.Orientation | property Orientation: TProgressBarOrientation read FOrientation write SetOrientation default pbHorizontal; |
| o.Position = value<br>result = o.Position | property Position: Integer read GetPosition write SetPosition default 0; |
| o.Smooth = value<br>result = o.Smooth | property Smooth : boolean read FSmooth write SetSmooth default False; |
| o.Step = value<br>result = o.Step | property Step: Integer read FStep write SetStep default 10; |
| o:StepBy(Delta) | procedure StepBy(Delta: Integer); |
| o:StepIt() | procedure StepIt; |
| o.Style = value<br>result = o.Style | property Style: TProgressBarStyle read FStyle write SetStyle default pbstNormal; |


<a id="PropertyEditor"></a>
### PropertyEditor

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| o:Activate() | procedure Activate; virtual; |
| result = o:AllEqual() | function AllEqual: Boolean; virtual; |
| result = o:AutoFill() | function AutoFill: Boolean; virtual; |
| result = o:CallStoredFunction() | function CallStoredFunction: Boolean; virtual; |
| o:Deactivate() | procedure Deactivate; virtual; |
| o:Edit() | procedure Edit; virtual; |
| o:Edit2(AOwnerComponent) | procedure Edit(AOwnerComponent: TComponent); |
| o:ExecuteVerb(Index) | procedure ExecuteVerb( Index: Integer); virtual; |
| o.FirstValue = value<br>result = o.FirstValue | property FirstValue: ansistring read GetValue write SetValue; |
| result = o:GetAttributes() | function GetAttributes: TPropertyAttributes; virtual; |
| result = o:GetComponent(Index) | function GetComponent(Index: Integer): TPersistent; |
| result = o:GetDefaultOrdValue() | function GetDefaultOrdValue: Longint; |
| result = o:GetDefaultValue() | function GetDefaultValue: ansistring; virtual; |
| result = o:GetEditLimit() | function GetEditLimit: Integer; virtual; |
| result = o:GetFloatValue() | function GetFloatValue: Extended; |
| result = o:GetFloatValueAt(Index) | function GetFloatValueAt(Index: Integer): Extended; |
| result = o:GetHint(HintType,x,y) | function GetHint( HintType: TPropEditHint;  x,  y: integer): string; virtual; |
| result = o:GetInt64Value() | function GetInt64Value: Int64; |
| result = o:GetInt64ValueAt(Index) | function GetInt64ValueAt(Index: Integer): Int64; |
| result = o:GetName() | function GetName: shortstring; virtual; |
| result = o:GetObjectValue() | function GetObjectValue: TObject; |
| result = o:GetObjectValueAt(Index) | function GetObjectValueAt(Index: Integer): TObject; |
| result = o:GetOrdValue() | function GetOrdValue: Longint; |
| result = o:GetOrdValueAt(Index) | function GetOrdValueAt(Index: Integer): Longint; |
| result = o:GetPropTypeUnitName()<br>result = o:GetPropTypeUnitName(Index) | function GetPropTypeUnitName(Index: Integer = 0): string; |
| o:GetProperties(Proc) | procedure GetProperties( Proc: TGetPropEditProc); virtual; |
| result = o:GetPropertyPath()<br>result = o:GetPropertyPath(Index) | function GetPropertyPath(Index: integer = 0): string; |
| result = o:GetSetValue(Brackets) | function GetSetValue(Brackets: boolean): AnsiString; |
| result = o:GetSetValueAt(Index,Brackets) | function GetSetValueAt(Index: Integer; Brackets: boolean): AnsiString; |
| result = o:GetStrValue() | function GetStrValue: AnsiString; |
| result = o:GetStrValueAt(Index) | function GetStrValueAt(Index: Integer): AnsiString; |
| result = o:GetUnitName()<br>result = o:GetUnitName(Index) | function GetUnitName(Index: Integer = 0): string; |
| result = o:GetValue() | function GetValue: ansistring; virtual; |
| o:GetValues(Proc) | procedure GetValues( Proc: TGetStrProc); virtual; |
| result = o:GetVerb(Index) | function GetVerb(Index: Integer): string; virtual; |
| result = o:GetVerbCount() | function GetVerbCount: Integer; virtual; |
| result = o:GetVisualValue() | function GetVisualValue: ansistring; virtual; |
| result = o:HasDefaultValue() | function HasDefaultValue: Boolean; |
| o:Initialize() | procedure Initialize; virtual; |
| result = o:IsReadOnly() | function IsReadOnly: boolean; virtual; |
| result = o:IsRevertableToInherited() | function IsRevertableToInherited: boolean; virtual; |
| o:ListDrawValue(AValue,Index,ACanvas,ARect,AState) | procedure ListDrawValue(const AValue: ansistring;  Index: Integer; ACanvas: TCanvas; const ARect: TRect;  AState: TPropEditDrawState); virtual; |
| AHeight = o:ListMeasureHeight(AValue,Index,ACanvas) | procedure ListMeasureHeight(const AValue: ansistring;  Index: Integer; ACanvas: TCanvas; var AHeight: Integer); virtual; |
| AHeight = o:ListMeasureHeight2(AValue,Index,ACanvas,AHeight) | procedure ListMeasureHeight(const AValue: ansistring;  Index: Integer; ACanvas: TCanvas; var AHeight: Integer); virtual; |
| AWidth = o:ListMeasureWidth(AValue,Index,ACanvas) | procedure ListMeasureWidth(const  AValue: ansistring;  Index: Integer;  ACanvas: TCanvas; var  AWidth: Integer); virtual; |
| AWidth = o:ListMeasureWidth2(AValue,Index,ACanvas,AWidth) | procedure ListMeasureWidth(const  AValue: ansistring;  Index: Integer;  ACanvas: TCanvas; var  AWidth: Integer); virtual; |
| o:Modified()<br>o:Modified(PropName) | procedure Modified(PropName: ShortString = ''); |
| o.OnSubPropertiesChanged = function(Sender) end | property OnSubPropertiesChanged: TNotifyEvent read FOnSubPropertiesChanged write FOnSubPropertiesChanged; |
| o:PrepareItem(Index,AnItem) | procedure PrepareItem( Index: Integer; const  AnItem: TMenuItem); virtual; |
| result = o.PrivateDirectory | property PrivateDirectory: ansistring read GetPrivateDirectory; |
| result = o.PropCount | property PropCount: Integer read FPropCount; |
| o:PropDrawName(ACanvas,ARect,AState) | procedure PropDrawName(ACanvas: TCanvas; const ARect: TRect;  AState: TPropEditDrawState); virtual; |
| o:PropDrawValue(ACanvas,ARect,AState) | procedure PropDrawValue(ACanvas: TCanvas; const ARect: TRect;  AState: TPropEditDrawState); virtual; |
| AHeight = o:PropMeasureHeight(NewValue,ACanvas) | procedure PropMeasureHeight(const  NewValue: ansistring;   ACanvas: TCanvas; var  AHeight: Integer); virtual; |
| AHeight = o:PropMeasureHeight2(NewValue,ACanvas,AHeight) | procedure PropMeasureHeight(const  NewValue: ansistring;   ACanvas: TCanvas; var  AHeight: Integer); virtual; |
| result = o.PropertyHook | property PropertyHook: TPropertyEditorHook read FPropertyHook; |
| o:Revert() | procedure Revert; virtual; |
| o:RevertToInherited() | procedure RevertToInherited; virtual; |
| o:SetFloatValue(NewValue) | procedure SetFloatValue(const NewValue: Extended); |
| o:SetInt64Value(NewValue) | procedure SetInt64Value(const NewValue: Int64); |
| o:SetOrdValue(NewValue) | procedure SetOrdValue(const NewValue: Longint); |
| o:SetPtrValue(NewValue) | procedure SetPtrValue(const NewValue: Pointer); |
| o:SetStrValue(NewValue) | procedure SetStrValue(const NewValue: AnsiString); |
| o:SetValue(NewValue) | procedure SetValue(const  NewValue: ansistring); virtual; |
| o:ShowValue() | procedure ShowValue; virtual; |
| result = o:SubPropertiesNeedsUpdate() | function SubPropertiesNeedsUpdate: boolean; virtual; |
| o:UpdateSubProperties() | procedure UpdateSubProperties; virtual; |
| result = o:ValueAvailable() | function ValueAvailable: Boolean; |
| result = o:ValueIsStreamed() | function ValueIsStreamed: boolean; virtual; |


<a id="PropertyEditorHook"></a>
### PropertyEditorHook

#### Published properties
- `Name` : `AnsiString`
- `Tag` : `Int64`

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| o.ComponentPropertyOnlyDesign = value<br>result = o.ComponentPropertyOnlyDesign | property ComponentPropertyOnlyDesign: boolean read FComponentPropertyOnlyDesign write FComponentPropertyOnlyDesign; |
| o:ComponentRenamed(AComponent) | procedure ComponentRenamed(AComponent: TComponent); |
| APersistent = o:DeletePersistent() | procedure DeletePersistent(var APersistent: TPersistent); |
| APersistent = o:DeletePersistent2(APersistent) | procedure DeletePersistent(var APersistent: TPersistent); |
| o:DesignerMouseDown(Sender,Button,Shift,X,Y) | procedure DesignerMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer); |
| o:DesignerMouseUp(Sender,Button,Shift,X,Y) | procedure DesignerMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer); |
| result = o:GetCheckboxForBoolean() | function GetCheckboxForBoolean: Boolean; |
| result = o:GetComponent(ComponentPath) | function GetComponent(const ComponentPath: string): TComponent; |
| result = o:GetComponentName(AComponent) | function GetComponentName(AComponent: TComponent): String; |
| result = o:GetObject(aName) | function GetObject(const aName: ShortString): TPersistent; |
| result = o:GetObjectName(Instance,AOwnerComp) | function GetObjectName(Instance: TPersistent; AOwnerComp: TComponent): String; |
| o.GetPrivateDirectory = value<br>result = o.GetPrivateDirectory | GetPrivateDirectory: AnsiString; |
| result = o:GetRootClassName() | function GetRootClassName: ShortString; |
| result = o:IsSelected(APersistent) | function IsSelected(const APersistent: TPersistent): boolean; |
| o.LookupRoot = value<br>result = o.LookupRoot | property LookupRoot: TPersistent read FLookupRoot write SetLookupRoot; |
| o:Modified(Sender)<br>o:Modified(Sender,PropName) | procedure Modified(Sender: TObject; PropName: ShortString = ''); |
| o:ObjectReferenceChanged(Sender,NewObject) | procedure ObjectReferenceChanged(Sender: TObject; NewObject: TPersistent); |
| o:PersistentAdded(APersistent,Select) | procedure PersistentAdded(APersistent: TPersistent; Select: boolean); |
| o:PersistentDeleted(APersistent) | procedure PersistentDeleted(APersistent: TPersistent); |
| o:PersistentDeleting(APersistent) | procedure PersistentDeleting(APersistent: TPersistent); |
| o:RefreshPropertyValues() | procedure RefreshPropertyValues; |
| o:RemoveAllHandlersForObject(HandlerObject) | procedure RemoveAllHandlersForObject(const HandlerObject: TObject); |
| o:RenameMethod(CurName,NewName) | procedure RenameMethod(const CurName, NewName: String); |
| o:SelectOnlyThis(APersistent) | procedure SelectOnlyThis(const APersistent: TPersistent); |
| o:ShowMethod(aName) | procedure ShowMethod(const aName: String); |
| o:Unselect(APersistent) | procedure Unselect(const APersistent: TPersistent); |


<a id="RadioButton"></a>
### RadioButton

#### Published properties
- `Align` : `Align`
- `Alignment` : `LeftRight`
- `AnchorSideBottom` : `AnchorSide`
- `AnchorSideLeft` : `AnchorSide`
- `AnchorSideRight` : `AnchorSide`
- `AnchorSideTop` : `AnchorSide`
- `Anchors` : `Anchors`
- `AutoSize` : `Boolean`
- `BidiMode` : `BiDiMode`
- `BorderSpacing` : `ControlBorderSpacing`
- `Caption` : `TranslateString`
- `Checked` : `Boolean`
- `Color` : `GraphicsColor`
- `Constraints` : `SizeConstraints`
- `Cursor` : `Cursor`
- `DoubleBuffered` : `Boolean`
- `DragCursor` : `Cursor`
- `DragKind` : `DragKind`
- `DragMode` : `DragMode`
- `Enabled` : `Boolean`
- `Font` : `Font`
- `Height` : `LongInt`
- `HelpContext` : `HelpContext`
- `HelpKeyword` : `AnsiString`
- `HelpType` : `HelpType`
- `Hint` : `TranslateString`
- `Left` : `LongInt`
- `Name` : `AnsiString`
- `OnChange` : `NotifyEvent`
- `OnChangeBounds` : `NotifyEvent`
- `OnClick` : `NotifyEvent`
- `OnContextPopup` : `ContextPopupEvent`
- `OnDragDrop` : `DragDropEvent`
- `OnDragOver` : `DragOverEvent`
- `OnEndDrag` : `EndDragEvent`
- `OnEnter` : `NotifyEvent`
- `OnExit` : `NotifyEvent`
- `OnKeyDown` : `KeyEvent`
- `OnKeyPress` : `KeyPressEvent`
- `OnKeyUp` : `KeyEvent`
- `OnMouseDown` : `MouseEvent`
- `OnMouseEnter` : `NotifyEvent`
- `OnMouseLeave` : `NotifyEvent`
- `OnMouseMove` : `MouseMoveEvent`
- `OnMouseUp` : `MouseEvent`
- `OnMouseWheel` : `MouseWheelEvent`
- `OnMouseWheelDown` : `MouseWheelUpDownEvent`
- `OnMouseWheelUp` : `MouseWheelUpDownEvent`
- `OnResize` : `NotifyEvent`
- `OnStartDrag` : `StartDragEvent`
- `ParentBidiMode` : `Boolean`
- `ParentColor` : `Boolean`
- `ParentDoubleBuffered` : `Boolean`
- `ParentFont` : `Boolean`
- `ParentShowHint` : `Boolean`
- `PopupMenu` : `PopupMenu`
- `ShowHint` : `Boolean`
- `TabOrder` : `TabOrder`
- `TabStop` : `Boolean`
- `Tag` : `Int64`
- `Top` : `LongInt`
- `Visible` : `Boolean`
- `Width` : `LongInt`

<a id="RadioGroup"></a>
### RadioGroup

#### Published properties
- `Align` : `Align`
- `AnchorSideBottom` : `AnchorSide`
- `AnchorSideLeft` : `AnchorSide`
- `AnchorSideRight` : `AnchorSide`
- `AnchorSideTop` : `AnchorSide`
- `Anchors` : `Anchors`
- `AutoFill` : `Boolean`
- `AutoSize` : `Boolean`
- `BidiMode` : `BiDiMode`
- `BorderSpacing` : `ControlBorderSpacing`
- `Caption` : `TranslateString`
- `ChildSizing` : `ControlChildSizing`
- `ClientHeight` : `LongInt`
- `ClientWidth` : `LongInt`
- `Color` : `GraphicsColor`
- `ColumnLayout` : `ColumnLayout`
- `Columns` : `LongInt`
- `Constraints` : `SizeConstraints`
- `Cursor` : `Cursor`
- `DoubleBuffered` : `Boolean`
- `DragCursor` : `Cursor`
- `DragMode` : `DragMode`
- `Enabled` : `Boolean`
- `Font` : `Font`
- `Height` : `LongInt`
- `HelpContext` : `HelpContext`
- `HelpKeyword` : `AnsiString`
- `HelpType` : `HelpType`
- `Hint` : `TranslateString`
- `ItemIndex` : `LongInt`
- `Items` : `Strings`
- `Left` : `LongInt`
- `Name` : `AnsiString`
- `OnChangeBounds` : `NotifyEvent`
- `OnClick` : `NotifyEvent`
- `OnDblClick` : `NotifyEvent`
- `OnDragDrop` : `DragDropEvent`
- `OnDragOver` : `DragOverEvent`
- `OnEndDrag` : `EndDragEvent`
- `OnEnter` : `NotifyEvent`
- `OnExit` : `NotifyEvent`
- `OnItemEnter` : `NotifyEvent`
- `OnItemExit` : `NotifyEvent`
- `OnKeyDown` : `KeyEvent`
- `OnKeyPress` : `KeyPressEvent`
- `OnKeyUp` : `KeyEvent`
- `OnMouseDown` : `MouseEvent`
- `OnMouseEnter` : `NotifyEvent`
- `OnMouseLeave` : `NotifyEvent`
- `OnMouseMove` : `MouseMoveEvent`
- `OnMouseUp` : `MouseEvent`
- `OnMouseWheel` : `MouseWheelEvent`
- `OnMouseWheelDown` : `MouseWheelUpDownEvent`
- `OnMouseWheelUp` : `MouseWheelUpDownEvent`
- `OnResize` : `NotifyEvent`
- `OnSelectionChanged` : `NotifyEvent`
- `OnStartDrag` : `StartDragEvent`
- `OnUTF8KeyPress` : `UTF8KeyPressEvent`
- `ParentBackground` : `Boolean`
- `ParentBidiMode` : `Boolean`
- `ParentColor` : `Boolean`
- `ParentDoubleBuffered` : `Boolean`
- `ParentFont` : `Boolean`
- `ParentShowHint` : `Boolean`
- `PopupMenu` : `PopupMenu`
- `ShowHint` : `Boolean`
- `TabOrder` : `TabOrder`
- `TabStop` : `Boolean`
- `Tag` : `Int64`
- `Top` : `LongInt`
- `Visible` : `Boolean`
- `Width` : `LongInt`

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| o.AutoFill = value<br>result = o.AutoFill | property AutoFill: Boolean read FAutoFill write SetAutoFill; |
| result = o:CanModify() | function CanModify: boolean; virtual; |
| o.ColumnLayout = value<br>result = o.ColumnLayout | property ColumnLayout: TColumnLayout read FColumnLayout write SetColumnLayout default clHorizontalThenVertical; |
| o.Columns = value<br>result = o.Columns | property Columns: integer read FColumns write SetColumns default 1; |
| o.ItemIndex = value<br>result = o.ItemIndex | property ItemIndex: integer read GetItemIndex write SetItemIndex default -1; |
| o.Items = value<br>result = o.Items | property Items: TStrings read FItems write SetItems; |
| o.OnClick = function(Sender) end | property OnClick: TNotifyEvent read FOnClick write FOnClick; |
| o.OnItemEnter = function(Sender) end | property OnItemEnter: TNotifyEvent read FOnItemEnter write FOnItemEnter; |
| o.OnItemExit = function(Sender) end | property OnItemExit: TNotifyEvent read FOnItemExit write FOnItemExit; |
| o.OnSelectionChanged = function(Sender) end | property OnSelectionChanged: TNotifyEvent read FOnSelectionChanged write FOnSelectionChanged; |
| result = o:Rows() | function Rows: integer; |


<a id="RasterImage"></a>
### RasterImage

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| o:BeginUpdate()<br>o:BeginUpdate(ACanvasOnly) | procedure BeginUpdate(ACanvasOnly: Boolean = False); |
| o.BitmapHandle = value<br>result = o.BitmapHandle | property BitmapHandle: HBITMAP read GetBitmapHandle write SetBitmapHandle; |
| result = o:BitmapHandleAllocated() | function BitmapHandleAllocated: boolean; virtual; abstract; |
| result = o.Canvas | property Canvas: TCanvas read GetCanvas; |
| o:EndUpdate()<br>o:EndUpdate(AStreamIsValid) | procedure EndUpdate(AStreamIsValid: Boolean = False); |
| o:FreeImage() | procedure FreeImage; virtual; |
| AWidth, AHeight = o:GetSize() | procedure GetSize(out AWidth, AHeight: Integer); |
| result = o:HandleAllocated() | function HandleAllocated: boolean; |
| o:LoadFromStream(AStream) | procedure LoadFromStream(AStream: TStream); overload; override; |
| o:LoadFromStream2(AStream,ASize) | procedure LoadFromStream(AStream: TStream; ASize: Cardinal); overload; virtual; |
| o:Mask(ATransparentColor) | procedure Mask(ATransparentColor: TColor); |
| o.MaskHandle = value<br>result = o.MaskHandle | property MaskHandle: HBITMAP read GetMaskHandle write SetMaskHandle; |
| result = o:MaskHandleAllocated() | function MaskHandleAllocated: boolean; virtual; abstract; |
| o.Masked = value<br>result = o.Masked | property Masked: Boolean read GetMasked write SetMasked; |
| result = o:PaletteAllocated() | function PaletteAllocated: boolean; virtual; abstract; |
| o.PixelFormat = value<br>result = o.PixelFormat | property PixelFormat: TPixelFormat read GetPixelFormat write SetPixelFormat default pfDevice; |
| result = o:ReleaseBitmapHandle() | function ReleaseBitmapHandle: HBITMAP; |
| result = o:ReleaseMaskHandle() | function ReleaseMaskHandle: HBITMAP; |
| result = o:ScanLine(Row) | property ScanLine[Row: Integer]: Pointer read GetScanLine; platform; |
| o:SetHandles(ABitmap,AMask) | procedure SetHandles(ABitmap, AMask: HBITMAP); virtual; abstract; |
| o.TransparentColor = value<br>result = o.TransparentColor | property TransparentColor: TColor read GetTransparentColor write SetTransparentColor default clDefault; |
| o.TransparentMode = value<br>result = o.TransparentMode | property TransparentMode: TTransparentMode read FTransparentMode write SetTransparentMode default tmAuto; |


<a id="ReplaceDialog"></a>
### ReplaceDialog

#### Published properties
- `FindText` : `AnsiString`
- `HelpContext` : `HelpContext`
- `Name` : `AnsiString`
- `OnCanClose` : `CloseQueryEvent`
- `OnClose` : `NotifyEvent`
- `OnFind` : `NotifyEvent`
- `OnHelpClicked` : `NotifyEvent`
- `OnReplace` : `NotifyEvent`
- `OnShow` : `NotifyEvent`
- `Options` : `FindOptions`
- `ReplaceText` : `AnsiString`
- `Tag` : `Int64`
- `Title` : `TranslateString`

<a id="SaveDialog"></a>
### SaveDialog

#### Published properties
- `DefaultExt` : `AnsiString`
- `FileName` : `AnsiString`
- `Filter` : `AnsiString`
- `FilterIndex` : `LongInt`
- `HelpContext` : `HelpContext`
- `InitialDir` : `AnsiString`
- `Name` : `AnsiString`
- `OnCanClose` : `CloseQueryEvent`
- `OnClose` : `NotifyEvent`
- `OnFolderChange` : `NotifyEvent`
- `OnHelpClicked` : `NotifyEvent`
- `OnSelectionChange` : `NotifyEvent`
- `OnShow` : `NotifyEvent`
- `OnTypeChange` : `NotifyEvent`
- `Options` : `OpenOptions`
- `Tag` : `Int64`
- `Title` : `TranslateString`

<a id="Screen"></a>
### Screen

#### Published properties
- `Name` : `AnsiString`
- `Tag` : `Int64`

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| result = VCL.TheScreen() | Screen: TScreen |

| Lua examples | FP declaration |
| --- | --- |
| result = o.ActiveControl | property ActiveControl: TWinControl read FActiveControl; |
| result = o.ActiveCustomForm | property ActiveCustomForm: TCustomForm read FActiveCustomForm; |
| result = o.ActiveForm | property ActiveForm: TForm read FActiveForm; |
| o:BeginScreenCursor() | procedure BeginScreenCursor; |
| o:BeginTempCursor(aCursor) | procedure BeginTempCursor(const aCursor: TCursor); |
| o:BeginWaitCursor() | procedure BeginWaitCursor; |
| o.Cursor = value<br>result = o.Cursor | property Cursor: TCursor read FCursor write SetCursor; |
| result = o:Cursors(Index)<br>o:Cursors(Index,value) | property Cursors[Index: Integer]: HCURSOR read GetCursors write SetCursors; |
| result = o:CustomFormBelongsToActiveGroup(AForm) | function CustomFormBelongsToActiveGroup(AForm: TCustomForm): Boolean; |
| result = o.CustomFormCount | property CustomFormCount: Integer read GetCustomFormCount; |
| result = o:CustomFormIndex(AForm) | function CustomFormIndex(AForm: TCustomForm): Integer; |
| result = o:CustomFormZIndex(AForm) | function CustomFormZIndex(AForm: TCustomForm): Integer; |
| result = o.CustomFormZOrderCount | property CustomFormZOrderCount: Integer read GetCustomFormZOrderCount; |
| result = o:CustomForms(Index) | property CustomForms[Index: Integer]: TCustomForm read GetCustomForms; |
| result = o:CustomFormsZOrdered(Index) | property CustomFormsZOrdered[Index: Integer]: TCustomForm read GetCustomFormsZOrdered; |
| result = o.DataModuleCount | property DataModuleCount: Integer read GetDataModuleCount; |
| result = o.DesktopHeight | property DesktopHeight: Integer read GetDesktopHeight; |
| result = o.DesktopLeft | property DesktopLeft: Integer read GetDesktopLeft; |
| result = o.DesktopRect | property DesktopRect: TRect read GetDesktopRect; |
| result = o.DesktopTop | property DesktopTop: Integer read GetDesktopTop; |
| result = o.DesktopWidth | property DesktopWidth: Integer read GetDesktopWidth; |
| o:EndScreenCursor() | procedure EndScreenCursor; |
| o:EndTempCursor(aCursor) | procedure EndTempCursor(const aCursor: TCursor); |
| o:EndWaitCursor() | procedure EndWaitCursor; |
| result = o:FindForm(FormName) | function FindForm(const FormName: string): TCustomForm; |
| result = o:FindNonDesignerForm(FormName) | function FindNonDesignerForm(const FormName: string): TCustomForm; |
| result = o.FocusedForm | property FocusedForm: TCustomForm read FFocusedForm; |
| result = o.Fonts | property Fonts: TStrings read GetFonts; |
| result = o.FormCount | property FormCount: Integer read GetFormCount; |
| result = o:FormIndex(AForm) | function FormIndex(AForm: TForm): Integer; |
| result = o:Forms(Index) | property Forms[Index: Integer]: TForm read GetForms; |
| result = o:GetCurrentModalForm() | function GetCurrentModalForm: TCustomForm; |
| result = o:GetCurrentModalFormZIndex() | function GetCurrentModalFormZIndex: Integer; |
| result = o.Height | property Height: Integer read Getheight; |
| o.HintFont = value<br>result = o.HintFont | property HintFont: TFont read GetHintFont write SetHintFont; |
| o.IconFont = value<br>result = o.IconFont | property IconFont: TFont read GetIconFont write SetIconFont; |
| o.MenuFont = value<br>result = o.MenuFont | property MenuFont: TFont read GetMenuFont write SetMenuFont; |
| result = o.MonitorCount | property MonitorCount: Integer read GetMonitorCount; |
| result = o:MonitorFromPoint(Point)<br>result = o:MonitorFromPoint(Point,MonitorDefault) | function MonitorFromPoint(const Point: TPoint; MonitorDefault: TMonitorDefaultTo = mdNearest): TMonitor; |
| result = o:MonitorFromRect(Rect)<br>result = o:MonitorFromRect(Rect,MonitorDefault) | function MonitorFromRect(const Rect: TRect; MonitorDefault: TMonitorDefaultTo = mdNearest): TMonitor; |
| result = o:MonitorFromWindow(Handle)<br>result = o:MonitorFromWindow(Handle,MonitorDefault) | function MonitorFromWindow(const Handle: THandle; MonitorDefault: TMonitorDefaultTo = mdNearest): TMonitor; |
| result = o:Monitors(Index) | property Monitors[Index: Integer]: TMonitor read GetMonitor; |
| o:MoveFormToFocusFront(ACustomForm) | procedure MoveFormToFocusFront(ACustomForm: TCustomForm); |
| o:MoveFormToZFront(ACustomForm) | procedure MoveFormToZFront(ACustomForm: TCustomForm); |
| o:NewFormWasCreated(AForm) | procedure NewFormWasCreated(AForm: TCustomForm); |
| o.OnActiveControlChange = function(Sender) end | property OnActiveControlChange: TNotifyEvent read FOnActiveControlChange write FOnActiveControlChange; |
| o.OnActiveFormChange = function(Sender) end | property OnActiveFormChange: TNotifyEvent read FOnActiveFormChange write FOnActiveFormChange; |
| result = o.PixelsPerInch | property PixelsPerInch: Integer read FPixelsPerInch; |
| result = o.PrimaryMonitor | property PrimaryMonitor: TMonitor read GetPrimaryMonitor; |
| result = o.RealCursor | property RealCursor: TCursor read GetRealCursor; |
| o.SystemFont = value<br>result = o.SystemFont | property SystemFont: TFont read GetSystemFont write SetSystemFont; |
| o:UpdateMonitors() | procedure UpdateMonitors; |
| o:UpdateScreen() | procedure UpdateScreen; |
| result = o.Width | property Width: Integer read GetWidth; |
| result = o.WorkAreaHeight | property WorkAreaHeight: Integer read GetWorkAreaHeight; |
| result = o.WorkAreaLeft | property WorkAreaLeft: Integer read GetWorkAreaLeft; |
| result = o.WorkAreaRect | property WorkAreaRect: TRect read GetWorkAreaRect; |
| result = o.WorkAreaTop | property WorkAreaTop: Integer read GetWorkAreaTop; |
| result = o.WorkAreaWidth | property WorkAreaWidth: Integer read GetWorkAreaWidth; |


<a id="ScrollBox"></a>
### ScrollBox

#### Published properties
- `Align` : `Align`
- `AnchorSideBottom` : `AnchorSide`
- `AnchorSideLeft` : `AnchorSide`
- `AnchorSideRight` : `AnchorSide`
- `AnchorSideTop` : `AnchorSide`
- `Anchors` : `Anchors`
- `AutoScroll` : `Boolean`
- `AutoSize` : `Boolean`
- `BiDiMode` : `BiDiMode`
- `BorderSpacing` : `ControlBorderSpacing`
- `BorderStyle` : `BorderStyle`
- `ChildSizing` : `ControlChildSizing`
- `ClientHeight` : `LongInt`
- `ClientWidth` : `LongInt`
- `Color` : `GraphicsColor`
- `Constraints` : `SizeConstraints`
- `Cursor` : `Cursor`
- `DockSite` : `Boolean`
- `DragCursor` : `Cursor`
- `DragKind` : `DragKind`
- `DragMode` : `DragMode`
- `Enabled` : `Boolean`
- `Font` : `Font`
- `Height` : `LongInt`
- `HelpContext` : `HelpContext`
- `HelpKeyword` : `AnsiString`
- `HelpType` : `HelpType`
- `Hint` : `TranslateString`
- `HorzScrollBar` : `ControlScrollBar`
- `Left` : `LongInt`
- `Name` : `AnsiString`
- `OnClick` : `NotifyEvent`
- `OnConstrainedResize` : `ConstrainedResizeEvent`
- `OnDblClick` : `NotifyEvent`
- `OnDockDrop` : `DockDropEvent`
- `OnDockOver` : `DockOverEvent`
- `OnDragDrop` : `DragDropEvent`
- `OnDragOver` : `DragOverEvent`
- `OnEndDock` : `EndDragEvent`
- `OnEndDrag` : `EndDragEvent`
- `OnEnter` : `NotifyEvent`
- `OnExit` : `NotifyEvent`
- `OnGetSiteInfo` : `GetSiteInfoEvent`
- `OnMouseDown` : `MouseEvent`
- `OnMouseEnter` : `NotifyEvent`
- `OnMouseLeave` : `NotifyEvent`
- `OnMouseMove` : `MouseMoveEvent`
- `OnMouseUp` : `MouseEvent`
- `OnMouseWheel` : `MouseWheelEvent`
- `OnMouseWheelDown` : `MouseWheelUpDownEvent`
- `OnMouseWheelHorz` : `MouseWheelEvent`
- `OnMouseWheelLeft` : `MouseWheelUpDownEvent`
- `OnMouseWheelRight` : `MouseWheelUpDownEvent`
- `OnMouseWheelUp` : `MouseWheelUpDownEvent`
- `OnPaint` : `NotifyEvent`
- `OnResize` : `NotifyEvent`
- `OnStartDock` : `StartDockEvent`
- `OnStartDrag` : `StartDragEvent`
- `OnUnDock` : `UnDockEvent`
- `ParentBackground` : `Boolean`
- `ParentBiDiMode` : `Boolean`
- `ParentColor` : `Boolean`
- `ParentFont` : `Boolean`
- `ParentShowHint` : `Boolean`
- `PopupMenu` : `PopupMenu`
- `ShowHint` : `Boolean`
- `TabOrder` : `TabOrder`
- `TabStop` : `Boolean`
- `Tag` : `Int64`
- `Top` : `LongInt`
- `VertScrollBar` : `ControlScrollBar`
- `Visible` : `Boolean`
- `Width` : `LongInt`

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| result = o:GetControlClassDefaultSize() | class function GetControlClassDefaultSize: TSize; override; |
| o:ScrollInView(AControl) | procedure ScrollInView(AControl: TControl); |
| o:UpdateScrollbars() | procedure UpdateScrollbars; |


<a id="SelectDirectoryDialog"></a>
### SelectDirectoryDialog

#### Published properties
- `DefaultExt` : `AnsiString`
- `FileName` : `AnsiString`
- `Filter` : `AnsiString`
- `FilterIndex` : `LongInt`
- `HelpContext` : `HelpContext`
- `InitialDir` : `AnsiString`
- `Name` : `AnsiString`
- `OnCanClose` : `CloseQueryEvent`
- `OnClose` : `NotifyEvent`
- `OnFolderChange` : `NotifyEvent`
- `OnHelpClicked` : `NotifyEvent`
- `OnSelectionChange` : `NotifyEvent`
- `OnShow` : `NotifyEvent`
- `OnTypeChange` : `NotifyEvent`
- `Options` : `OpenOptions`
- `Tag` : `Int64`
- `Title` : `TranslateString`

<a id="Shape"></a>
### Shape

#### Published properties
- `Align` : `Align`
- `AnchorSideBottom` : `AnchorSide`
- `AnchorSideLeft` : `AnchorSide`
- `AnchorSideRight` : `AnchorSide`
- `AnchorSideTop` : `AnchorSide`
- `Anchors` : `Anchors`
- `BorderSpacing` : `ControlBorderSpacing`
- `Brush` : `Brush`
- `Constraints` : `SizeConstraints`
- `Cursor` : `Cursor`
- `DragCursor` : `Cursor`
- `DragKind` : `DragKind`
- `DragMode` : `DragMode`
- `Enabled` : `Boolean`
- `Height` : `LongInt`
- `HelpContext` : `HelpContext`
- `HelpKeyword` : `AnsiString`
- `HelpType` : `HelpType`
- `Hint` : `TranslateString`
- `Left` : `LongInt`
- `Name` : `AnsiString`
- `OnChangeBounds` : `NotifyEvent`
- `OnDragDrop` : `DragDropEvent`
- `OnDragOver` : `DragOverEvent`
- `OnEndDock` : `EndDragEvent`
- `OnEndDrag` : `EndDragEvent`
- `OnMouseDown` : `MouseEvent`
- `OnMouseEnter` : `NotifyEvent`
- `OnMouseLeave` : `NotifyEvent`
- `OnMouseMove` : `MouseMoveEvent`
- `OnMouseUp` : `MouseEvent`
- `OnMouseWheel` : `MouseWheelEvent`
- `OnMouseWheelDown` : `MouseWheelUpDownEvent`
- `OnMouseWheelHorz` : `MouseWheelEvent`
- `OnMouseWheelLeft` : `MouseWheelUpDownEvent`
- `OnMouseWheelRight` : `MouseWheelUpDownEvent`
- `OnMouseWheelUp` : `MouseWheelUpDownEvent`
- `OnPaint` : `NotifyEvent`
- `OnResize` : `NotifyEvent`
- `OnStartDock` : `StartDockEvent`
- `OnStartDrag` : `StartDragEvent`
- `ParentShowHint` : `Boolean`
- `Pen` : `Pen`
- `Shape` : `ShapeType`
- `ShowHint` : `Boolean`
- `Tag` : `Int64`
- `Top` : `LongInt`
- `Visible` : `Boolean`
- `Width` : `LongInt`

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| o:Paint() | procedure Paint; override; |
| o:StyleChanged(Sender) | procedure StyleChanged(Sender: TObject); |


<a id="SpeedButton"></a>
### SpeedButton

#### Published properties
- `Action` : `BasicAction`
- `Align` : `Align`
- `Alignment` : `Alignment`
- `AllowAllUp` : `Boolean`
- `AnchorSideBottom` : `AnchorSide`
- `AnchorSideLeft` : `AnchorSide`
- `AnchorSideRight` : `AnchorSide`
- `AnchorSideTop` : `AnchorSide`
- `Anchors` : `Anchors`
- `AutoSize` : `Boolean`
- `BidiMode` : `BiDiMode`
- `BorderSpacing` : `ControlBorderSpacing`
- `Caption` : `TranslateString`
- `Color` : `GraphicsColor`
- `Constraints` : `SizeConstraints`
- `Cursor` : `Cursor`
- `DisabledImageIndex` : `ImageIndex`
- `Down` : `Boolean`
- `DragCursor` : `Cursor`
- `DragKind` : `DragKind`
- `DragMode` : `DragMode`
- `Enabled` : `Boolean`
- `Flat` : `Boolean`
- `Font` : `Font`
- `Glyph` : `Bitmap`
- `GroupIndex` : `LongInt`
- `Height` : `LongInt`
- `HelpContext` : `HelpContext`
- `HelpKeyword` : `AnsiString`
- `HelpType` : `HelpType`
- `Hint` : `TranslateString`
- `HotImageIndex` : `ImageIndex`
- `ImageIndex` : `ImageIndex`
- `ImageWidth` : `LongInt`
- `Images` : `CustomImageList`
- `Layout` : `ButtonLayout`
- `Left` : `LongInt`
- `Margin` : `LongInt`
- `Name` : `AnsiString`
- `NumGlyphs` : `LongInt`
- `OnChangeBounds` : `NotifyEvent`
- `OnClick` : `NotifyEvent`
- `OnContextPopup` : `ContextPopupEvent`
- `OnDblClick` : `NotifyEvent`
- `OnDragDrop` : `DragDropEvent`
- `OnDragOver` : `DragOverEvent`
- `OnEndDrag` : `EndDragEvent`
- `OnMouseDown` : `MouseEvent`
- `OnMouseEnter` : `NotifyEvent`
- `OnMouseLeave` : `NotifyEvent`
- `OnMouseMove` : `MouseMoveEvent`
- `OnMouseUp` : `MouseEvent`
- `OnMouseWheel` : `MouseWheelEvent`
- `OnMouseWheelDown` : `MouseWheelUpDownEvent`
- `OnMouseWheelUp` : `MouseWheelUpDownEvent`
- `OnPaint` : `NotifyEvent`
- `OnResize` : `NotifyEvent`
- `OnStartDrag` : `StartDragEvent`
- `ParentBidiMode` : `Boolean`
- `ParentFont` : `Boolean`
- `ParentShowHint` : `Boolean`
- `PopupMenu` : `PopupMenu`
- `PressedImageIndex` : `ImageIndex`
- `SelectedImageIndex` : `ImageIndex`
- `ShowCaption` : `Boolean`
- `ShowHint` : `Boolean`
- `Spacing` : `LongInt`
- `Tag` : `Int64`
- `Top` : `LongInt`
- `Transparent` : `Boolean`
- `Visible` : `Boolean`
- `Width` : `LongInt`

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| o.Alignment = value<br>result = o.Alignment | property Alignment: TAlignment read FAlignment write SetAlignment default taCenter; |
| o.AllowAllUp = value<br>result = o.AllowAllUp | property AllowAllUp: Boolean read FAllowAllUp write SetAllowAllUp default false; |
| o:Click() | procedure Click; override; |
| o.DisabledImageIndex = value<br>result = o.DisabledImageIndex | property DisabledImageIndex: TImageIndex index bsDisabled read GetImageIndex write SetImageIndex default -1; |
| o.Down = value<br>result = o.Down | property Down: Boolean read FDown write SetDown default false; |
| result = o:FindDownButton() | function FindDownButton: TCustomSpeedButton; |
| o.Flat = value<br>result = o.Flat | property Flat: Boolean read FFlat write SetFlat default false; |
| o.Glyph = value<br>result = o.Glyph | property Glyph: TBitmap read GetGlyph write SetGlyph stored IsGlyphStored; |
| o.GroupIndex = value<br>result = o.GroupIndex | property GroupIndex: Integer read FGroupIndex write SetGroupIndex default 0; |
| o.HotImageIndex = value<br>result = o.HotImageIndex | property HotImageIndex: TImageIndex index bsHot read GetImageIndex write SetImageIndex default -1; |
| o.ImageIndex = value<br>result = o.ImageIndex | property ImageIndex: TImageIndex index bsUp read GetImageIndex write SetImageIndex default -1; |
| o.ImageWidth = value<br>result = o.ImageWidth | property ImageWidth: Integer read GetImageWidth write SetImageWidth default 0; |
| o.Images = value<br>result = o.Images | property Images: TCustomImageList read GetImages write SetImages; |
| o.Layout = value<br>result = o.Layout | property Layout: TButtonLayout read FLayout write SetLayout default blGlyphLeft; |
| o:LoadGlyphFromLazarusResource(AName) | procedure LoadGlyphFromLazarusResource(const AName: String); |
| o:LoadGlyphFromResourceName(Instance,AName) | procedure LoadGlyphFromResourceName(Instance: THandle; const AName: String); |
| o.Margin = value<br>result = o.Margin | property Margin: integer read FMargin write SetMargin default -1; |
| o.NumGlyphs = value<br>result = o.NumGlyphs | property NumGlyphs: Integer read GetNumGlyphs write SetNumGlyphs default 1; |
| o.PressedImageIndex = value<br>result = o.PressedImageIndex | property PressedImageIndex: TImageIndex index bsDown read GetImageIndex write SetImageIndex default -1; |
| o.SelectedImageIndex = value<br>result = o.SelectedImageIndex | property SelectedImageIndex: TImageIndex index bsExclusive read GetImageIndex write SetImageIndex default -1; |
| o.ShowAccelChar = value<br>result = o.ShowAccelChar | property ShowAccelChar: boolean read FShowAccelChar write SetShowAccelChar default true; |
| o.ShowCaption = value<br>result = o.ShowCaption | property ShowCaption: boolean read FShowCaption write SetShowCaption default true; |
| o.Spacing = value<br>result = o.Spacing | property Spacing: integer read FSpacing write SetSpacing default 4; |
| o.Transparent = value<br>result = o.Transparent | property Transparent: Boolean read GetTransparent write SetTransparent default true; |


<a id="SpinEdit"></a>
### SpinEdit

#### Published properties
- `Align` : `Align`
- `Alignment` : `Alignment`
- `AnchorSideBottom` : `AnchorSide`
- `AnchorSideLeft` : `AnchorSide`
- `AnchorSideRight` : `AnchorSide`
- `AnchorSideTop` : `AnchorSide`
- `Anchors` : `Anchors`
- `AutoSelect` : `Boolean`
- `AutoSize` : `Boolean`
- `BorderSpacing` : `ControlBorderSpacing`
- `Color` : `GraphicsColor`
- `Constraints` : `SizeConstraints`
- `Cursor` : `Cursor`
- `EditorEnabled` : `Boolean`
- `Enabled` : `Boolean`
- `Font` : `Font`
- `Height` : `LongInt`
- `HelpContext` : `HelpContext`
- `HelpKeyword` : `AnsiString`
- `HelpType` : `HelpType`
- `Hint` : `TranslateString`
- `Increment` : `LongInt`
- `Left` : `LongInt`
- `MaxValue` : `LongInt`
- `MinValue` : `LongInt`
- `Name` : `AnsiString`
- `OnChange` : `NotifyEvent`
- `OnChangeBounds` : `NotifyEvent`
- `OnClick` : `NotifyEvent`
- `OnEditingDone` : `NotifyEvent`
- `OnEnter` : `NotifyEvent`
- `OnExit` : `NotifyEvent`
- `OnKeyDown` : `KeyEvent`
- `OnKeyPress` : `KeyPressEvent`
- `OnKeyUp` : `KeyEvent`
- `OnMouseDown` : `MouseEvent`
- `OnMouseEnter` : `NotifyEvent`
- `OnMouseLeave` : `NotifyEvent`
- `OnMouseMove` : `MouseMoveEvent`
- `OnMouseUp` : `MouseEvent`
- `OnMouseWheel` : `MouseWheelEvent`
- `OnMouseWheelDown` : `MouseWheelUpDownEvent`
- `OnMouseWheelHorz` : `MouseWheelEvent`
- `OnMouseWheelLeft` : `MouseWheelUpDownEvent`
- `OnMouseWheelRight` : `MouseWheelUpDownEvent`
- `OnMouseWheelUp` : `MouseWheelUpDownEvent`
- `OnResize` : `NotifyEvent`
- `OnUTF8KeyPress` : `UTF8KeyPressEvent`
- `ParentColor` : `Boolean`
- `ParentFont` : `Boolean`
- `ParentShowHint` : `Boolean`
- `PopupMenu` : `PopupMenu`
- `ReadOnly` : `Boolean`
- `ShowHint` : `Boolean`
- `TabOrder` : `TabOrder`
- `TabStop` : `Boolean`
- `Tag` : `Int64`
- `Top` : `LongInt`
- `Value` : `LongInt`
- `Visible` : `Boolean`
- `Width` : `LongInt`

<a id="Splitter"></a>
### Splitter

#### Published properties
- `Align` : `Align`
- `AnchorSideBottom` : `AnchorSide`
- `AnchorSideLeft` : `AnchorSide`
- `AnchorSideRight` : `AnchorSide`
- `AnchorSideTop` : `AnchorSide`
- `Anchors` : `Anchors`
- `AutoSnap` : `Boolean`
- `Beveled` : `Boolean`
- `Color` : `GraphicsColor`
- `Constraints` : `SizeConstraints`
- `Cursor` : `Cursor`
- `DoubleBuffered` : `Boolean`
- `Height` : `LongInt`
- `HelpContext` : `HelpContext`
- `HelpKeyword` : `AnsiString`
- `HelpType` : `HelpType`
- `Hint` : `TranslateString`
- `Left` : `LongInt`
- `MinSize` : `LongInt`
- `Name` : `AnsiString`
- `OnCanOffset` : `CanOffsetEvent`
- `OnCanResize` : `CanResizeEvent`
- `OnChangeBounds` : `NotifyEvent`
- `OnMouseWheel` : `MouseWheelEvent`
- `OnMouseWheelDown` : `MouseWheelUpDownEvent`
- `OnMouseWheelHorz` : `MouseWheelEvent`
- `OnMouseWheelLeft` : `MouseWheelUpDownEvent`
- `OnMouseWheelRight` : `MouseWheelUpDownEvent`
- `OnMouseWheelUp` : `MouseWheelUpDownEvent`
- `OnMoved` : `NotifyEvent`
- `OnPaint` : `NotifyEvent`
- `ParentColor` : `Boolean`
- `ParentDoubleBuffered` : `Boolean`
- `ParentShowHint` : `Boolean`
- `PopupMenu` : `PopupMenu`
- `ResizeAnchor` : `AnchorKind`
- `ResizeStyle` : `ResizeStyle`
- `ShowHint` : `Boolean`
- `Tag` : `Int64`
- `Top` : `LongInt`
- `Visible` : `Boolean`
- `Width` : `LongInt`

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| o:AnchorSplitter(Kind,AControl) | procedure AnchorSplitter(Kind: TAnchorKind; AControl: TControl); |
| o.AutoSnap = value<br>result = o.AutoSnap | property AutoSnap: boolean read FAutoSnap write FAutoSnap default true; |
| o.Beveled = value<br>result = o.Beveled | property Beveled: boolean read FBeveled write SetBeveled default false; |
| result = o:GetOtherResizeControl() | function GetOtherResizeControl: TControl; |
| result = o:GetSplitterPosition() | function GetSplitterPosition: integer; |
| o.MinSize = value<br>result = o.MinSize | property MinSize: integer read FMinSize write SetMinSize default 30; |
| o:MoveSplitter(Offset) | procedure MoveSplitter(Offset: integer); virtual; |
| o.OnCanOffset = function(Sender,NewOffset,Accept) return NewOffset,Accept end | property OnCanOffset: TCanOffsetEvent read FOnCanOffset write FOnCanOffset; |
| o.OnCanResize = function(Sender,NewSize,Accept) return NewSize,Accept end | property OnCanResize: TCanResizeEvent read FOnCanResize write FOnCanResize; |
| o.OnMoved = function(Sender) end | property OnMoved: TNotifyEvent read FOnMoved write FOnMoved; |
| o.ResizeAnchor = value<br>result = o.ResizeAnchor | property ResizeAnchor: TAnchorKind read FResizeAnchor write SetResizeAnchor default akLeft; |
| o.ResizeControl = value<br>result = o.ResizeControl | property ResizeControl: TControl read GetResizeControl write SetResizeControl; |
| o.ResizeStyle = value<br>result = o.ResizeStyle | property ResizeStyle: TResizeStyle read FResizeStyle write FResizeStyle default rsUpdate; |
| o:SetSplitterPosition(NewPosition) | procedure SetSplitterPosition(NewPosition: integer); |


<a id="StaticText"></a>
### StaticText

#### Published properties
- `Align` : `Align`
- `Alignment` : `Alignment`
- `AnchorSideBottom` : `AnchorSide`
- `AnchorSideLeft` : `AnchorSide`
- `AnchorSideRight` : `AnchorSide`
- `AnchorSideTop` : `AnchorSide`
- `Anchors` : `Anchors`
- `AutoSize` : `Boolean`
- `BidiMode` : `BiDiMode`
- `BorderSpacing` : `ControlBorderSpacing`
- `BorderStyle` : `StaticBorderStyle`
- `Caption` : `TranslateString`
- `Color` : `GraphicsColor`
- `Constraints` : `SizeConstraints`
- `Cursor` : `Cursor`
- `DoubleBuffered` : `Boolean`
- `DragCursor` : `Cursor`
- `DragKind` : `DragKind`
- `DragMode` : `DragMode`
- `Enabled` : `Boolean`
- `FocusControl` : `WinControl`
- `Font` : `Font`
- `Height` : `LongInt`
- `HelpContext` : `HelpContext`
- `HelpKeyword` : `AnsiString`
- `HelpType` : `HelpType`
- `Hint` : `TranslateString`
- `Left` : `LongInt`
- `Name` : `AnsiString`
- `OnChangeBounds` : `NotifyEvent`
- `OnClick` : `NotifyEvent`
- `OnContextPopup` : `ContextPopupEvent`
- `OnDblClick` : `NotifyEvent`
- `OnDragDrop` : `DragDropEvent`
- `OnDragOver` : `DragOverEvent`
- `OnEndDrag` : `EndDragEvent`
- `OnMouseDown` : `MouseEvent`
- `OnMouseEnter` : `NotifyEvent`
- `OnMouseLeave` : `NotifyEvent`
- `OnMouseMove` : `MouseMoveEvent`
- `OnMouseUp` : `MouseEvent`
- `OnMouseWheel` : `MouseWheelEvent`
- `OnMouseWheelDown` : `MouseWheelUpDownEvent`
- `OnMouseWheelHorz` : `MouseWheelEvent`
- `OnMouseWheelLeft` : `MouseWheelUpDownEvent`
- `OnMouseWheelRight` : `MouseWheelUpDownEvent`
- `OnMouseWheelUp` : `MouseWheelUpDownEvent`
- `OnResize` : `NotifyEvent`
- `OnStartDrag` : `StartDragEvent`
- `ParentBidiMode` : `Boolean`
- `ParentColor` : `Boolean`
- `ParentDoubleBuffered` : `Boolean`
- `ParentFont` : `Boolean`
- `ParentShowHint` : `Boolean`
- `PopupMenu` : `PopupMenu`
- `ShowAccelChar` : `Boolean`
- `ShowHint` : `Boolean`
- `TabOrder` : `TabOrder`
- `TabStop` : `Boolean`
- `Tag` : `Int64`
- `Top` : `LongInt`
- `Transparent` : `Boolean`
- `Visible` : `Boolean`
- `Width` : `LongInt`

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| o.Alignment = value<br>result = o.Alignment | property Alignment: TAlignment read FAlignment write SetAlignment default taLeftJustify; |
| o.BorderStyle = value<br>result = o.BorderStyle | property BorderStyle: TStaticBorderStyle read FStaticBorderStyle write SetStaticBorderStyle default sbsNone; |
| o.FocusControl = value<br>result = o.FocusControl | property FocusControl: TWinControl read FFocusControl write SetFocusControl; |
| o.ShowAccelChar = value<br>result = o.ShowAccelChar | property ShowAccelChar: boolean read FShowAccelChar write SetShowAccelChar default true; |
| o.Transparent = value<br>result = o.Transparent | property Transparent: Boolean read GetTransparent write SetTransparent default True; |


<a id="StatusBar"></a>
### StatusBar

#### Published properties
- `Action` : `BasicAction`
- `Align` : `Align`
- `AnchorSideBottom` : `AnchorSide`
- `AnchorSideLeft` : `AnchorSide`
- `AnchorSideRight` : `AnchorSide`
- `AnchorSideTop` : `AnchorSide`
- `Anchors` : `Anchors`
- `AutoHint` : `Boolean`
- `AutoSize` : `Boolean`
- `BiDiMode` : `BiDiMode`
- `BorderSpacing` : `ControlBorderSpacing`
- `BorderWidth` : `BorderWidth`
- `Color` : `GraphicsColor`
- `Constraints` : `SizeConstraints`
- `Cursor` : `Cursor`
- `DragCursor` : `Cursor`
- `DragKind` : `DragKind`
- `DragMode` : `DragMode`
- `Enabled` : `Boolean`
- `Font` : `Font`
- `Height` : `LongInt`
- `HelpContext` : `HelpContext`
- `HelpKeyword` : `AnsiString`
- `HelpType` : `HelpType`
- `Hint` : `TranslateString`
- `Left` : `LongInt`
- `Name` : `AnsiString`
- `OnClick` : `NotifyEvent`
- `OnContextPopup` : `ContextPopupEvent`
- `OnCreatePanelClass` : `SBCreatePanelClassEvent`
- `OnDblClick` : `NotifyEvent`
- `OnDragDrop` : `DragDropEvent`
- `OnDragOver` : `DragOverEvent`
- `OnDrawPanel` : `DrawPanelEvent`
- `OnEndDock` : `EndDragEvent`
- `OnEndDrag` : `EndDragEvent`
- `OnHint` : `NotifyEvent`
- `OnMouseDown` : `MouseEvent`
- `OnMouseEnter` : `NotifyEvent`
- `OnMouseLeave` : `NotifyEvent`
- `OnMouseMove` : `MouseMoveEvent`
- `OnMouseUp` : `MouseEvent`
- `OnMouseWheel` : `MouseWheelEvent`
- `OnMouseWheelDown` : `MouseWheelUpDownEvent`
- `OnMouseWheelUp` : `MouseWheelUpDownEvent`
- `OnResize` : `NotifyEvent`
- `OnStartDock` : `StartDockEvent`
- `OnStartDrag` : `StartDragEvent`
- `Panels` : `StatusPanels`
- `ParentBiDiMode` : `Boolean`
- `ParentColor` : `Boolean`
- `ParentFont` : `Boolean`
- `ParentShowHint` : `Boolean`
- `PopupMenu` : `PopupMenu`
- `ShowHint` : `Boolean`
- `SimplePanel` : `Boolean`
- `SimpleText` : `TranslateString`
- `SizeGrip` : `Boolean`
- `Tag` : `Int64`
- `Top` : `LongInt`
- `UseSystemFont` : `Boolean`
- `Visible` : `Boolean`
- `Width` : `LongInt`

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| o:BeginUpdate() | procedure BeginUpdate; |
| result = o.Canvas | property Canvas: TCanvas read FCanvas; |
| o:EndUpdate() | procedure EndUpdate; |
| result = o:ExecuteAction(ExeAction) | function ExecuteAction(ExeAction: TBasicAction): Boolean; override; |
| result = o:GetPanelIndexAt(X,Y) | function GetPanelIndexAt(X, Y: Integer): Integer; |
| o:InvalidatePanel(PanelIndex,PanelParts) | procedure InvalidatePanel(PanelIndex: integer; PanelParts: TPanelParts); virtual; |
| result = o:SizeGripEnabled() | function SizeGripEnabled: Boolean; |
| result = o:UpdatingStatusBar() | function UpdatingStatusBar: boolean; |


<a id="StatusPanel"></a>
### StatusPanel

#### Published properties
- `Alignment` : `Alignment`
- `Bevel` : `StatusPanelBevel`
- `BidiMode` : `BiDiMode`
- `ParentBiDiMode` : `Boolean`
- `Style` : `StatusPanelStyle`
- `Text` : `TranslateString`
- `Width` : `LongInt`

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| result = o:StatusBar() | function StatusBar: TStatusBar; |


<a id="StatusPanels"></a>
### StatusPanels

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| result = o:Add() | function Add: TStatusPanel; |
| result = o:Items(Index)<br>o:Items(Index,value) | property Items[Index: Integer]: TStatusPanel read GetItem write SetItem; default; |
| result = o.StatusBar | property StatusBar: TStatusBar read FStatusBar; |


<a id="Stream"></a>
### Stream

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| result = o:CopyFrom(Source,Count) | function CopyFrom(Source: TStream; Count: Int64): Int64; |
| o:FixupResourceHeader(FixupInfo) | procedure FixupResourceHeader(FixupInfo: Longint); |
| o.Position = value<br>result = o.Position | property Position: Int64 read GetPosition write SetPosition; |
| result, Buffer = o:Read(Count) | function Read(var Buffer; Count: Longint): Longint; virtual; overload; |
| result, Buffer = o:Read2(Buffer,Count) | function Read(var Buffer; Count: Longint): Longint; virtual; overload; |
| result = o:ReadAnsiString() | function ReadAnsiString : String; |
| Buffer = o:ReadBuffer(Count) | procedure ReadBuffer(var Buffer; Count: Longint); |
| Buffer = o:ReadBuffer2(Buffer,Count) | procedure ReadBuffer(var Buffer; Count: Longint); |
| result = o:ReadByte() | function ReadByte : Byte; |
| result = o:ReadComponent(Instance) | function ReadComponent(Instance: TComponent): TComponent; |
| result = o:ReadComponentRes(Instance) | function ReadComponentRes(Instance: TComponent): TComponent; |
| result = o:ReadDWord() | function ReadDWord : Cardinal; |
| result = o:ReadQWord() | function ReadQWord : QWord; |
| o:ReadResHeader() | procedure ReadResHeader; |
| result = o:ReadWord() | function ReadWord : Word; |
| result = o:Seek(Offset,Origin) | function Seek(Offset: Longint; Origin: Word): Longint; virtual; overload; |
| result = o:Seek2(Offset,Origin) | function Seek(const Offset: Int64; Origin: TSeekOrigin): Int64; virtual; overload; |
| o.Size = value<br>result = o.Size | property Size: Int64 read GetSize write SetSize64; |
| result = o:Write(Buffer,Count) | function Write(const Buffer; Count: Longint): Longint; virtual; overload; |
| o:WriteAnsiString(S) | Procedure WriteAnsiString (const S : String); virtual; |
| o:WriteBuffer(Buffer,Count) | procedure WriteBuffer(const Buffer; Count: Longint); |
| o:WriteByte(b) | procedure WriteByte(b : Byte); |
| o:WriteComponent(Instance) | procedure WriteComponent(Instance: TComponent); |
| o:WriteComponentRes(ResName,Instance) | procedure WriteComponentRes(const ResName: string; Instance: TComponent); |
| o:WriteDWord(d) | procedure WriteDWord(d : Cardinal); |
| o:WriteDescendent(Instance,Ancestor) | procedure WriteDescendent(Instance, Ancestor: TComponent); |
| o:WriteDescendentRes(ResName,Instance,Ancestor) | procedure WriteDescendentRes(const ResName: string; Instance, Ancestor: TComponent); |
| o:WriteQWord(q) | procedure WriteQWord(q : QWord); |
| FixupInfo = o:WriteResourceHeader(ResName) | procedure WriteResourceHeader(const ResName: string;   var FixupInfo: Longint); |
| FixupInfo = o:WriteResourceHeader2(ResName,FixupInfo) | procedure WriteResourceHeader(const ResName: string;   var FixupInfo: Longint); |
| o:WriteWord(w) | procedure WriteWord(w : Word); |


<a id="StringGrid"></a>
### StringGrid

#### Published properties
- `Align` : `Align`
- `AlternateColor` : `GraphicsColor`
- `AnchorSideBottom` : `AnchorSide`
- `AnchorSideLeft` : `AnchorSide`
- `AnchorSideRight` : `AnchorSide`
- `AnchorSideTop` : `AnchorSide`
- `Anchors` : `Anchors`
- `AutoAdvance` : `AutoAdvance`
- `AutoEdit` : `Boolean`
- `AutoFillColumns` : `Boolean`
- `BiDiMode` : `BiDiMode`
- `BorderSpacing` : `ControlBorderSpacing`
- `BorderStyle` : `BorderStyle`
- `CellHintPriority` : `CellHintPriority`
- `ColCount` : `LongInt`
- `ColRowDragIndicatorColor` : `GraphicsColor`
- `ColRowDraggingCursor` : `Cursor`
- `ColSizingCursor` : `Cursor`
- `Color` : `GraphicsColor`
- `ColumnClickSorts` : `Boolean`
- `Columns` : `GridColumns`
- `Constraints` : `SizeConstraints`
- `Cursor` : `Cursor`
- `DefaultColWidth` : `LongInt`
- `DefaultDrawing` : `Boolean`
- `DefaultRowHeight` : `LongInt`
- `DoubleBuffered` : `Boolean`
- `DragCursor` : `Cursor`
- `DragKind` : `DragKind`
- `DragMode` : `DragMode`
- `Enabled` : `Boolean`
- `ExtendedSelect` : `Boolean`
- `FadeUnfocusedSelection` : `Boolean`
- `FixedColor` : `GraphicsColor`
- `FixedCols` : `LongInt`
- `FixedRows` : `LongInt`
- `Flat` : `Boolean`
- `Font` : `Font`
- `GridLineColor` : `GraphicsColor`
- `GridLineStyle` : `FPPenStyle`
- `GridLineWidth` : `LongInt`
- `HeaderHotZones` : `GridZoneSet`
- `HeaderPushZones` : `GridZoneSet`
- `Height` : `LongInt`
- `HelpContext` : `HelpContext`
- `HelpKeyword` : `AnsiString`
- `HelpType` : `HelpType`
- `Hint` : `TranslateString`
- `ImageIndexSortAsc` : `ImageIndex`
- `ImageIndexSortDesc` : `ImageIndex`
- `Left` : `LongInt`
- `MouseWheelOption` : `MouseWheelOption`
- `Name` : `AnsiString`
- `OnAfterSelection` : `OnSelectEvent`
- `OnBeforeSelection` : `OnSelectEvent`
- `OnButtonClick` : `OnSelectEvent`
- `OnCellProcess` : `CellProcessEvent`
- `OnChangeBounds` : `NotifyEvent`
- `OnCheckboxToggled` : `ToggledCheckboxEvent`
- `OnClick` : `NotifyEvent`
- `OnColRowDeleted` : `GridOperationEvent`
- `OnColRowExchanged` : `GridOperationEvent`
- `OnColRowInserted` : `GridOperationEvent`
- `OnColRowMoved` : `GridOperationEvent`
- `OnCompareCells` : `OnCompareCells`
- `OnContextPopup` : `ContextPopupEvent`
- `OnDblClick` : `NotifyEvent`
- `OnDragDrop` : `DragDropEvent`
- `OnDragOver` : `DragOverEvent`
- `OnDrawCell` : `OnDrawCell`
- `OnEditButtonClick` : `NotifyEvent`
- `OnEditingDone` : `NotifyEvent`
- `OnEndDock` : `EndDragEvent`
- `OnEndDrag` : `EndDragEvent`
- `OnEnter` : `NotifyEvent`
- `OnExit` : `NotifyEvent`
- `OnGetCellHint` : `GetCellHintEvent`
- `OnGetCheckboxState` : `GetCheckboxStateEvent`
- `OnGetEditMask` : `GetEditEvent`
- `OnGetEditText` : `GetEditEvent`
- `OnHeaderClick` : `HdrEvent`
- `OnHeaderSized` : `HdrEvent`
- `OnHeaderSizing` : `HeaderSizingEvent`
- `OnKeyDown` : `KeyEvent`
- `OnKeyPress` : `KeyPressEvent`
- `OnKeyUp` : `KeyEvent`
- `OnMouseDown` : `MouseEvent`
- `OnMouseEnter` : `NotifyEvent`
- `OnMouseLeave` : `NotifyEvent`
- `OnMouseMove` : `MouseMoveEvent`
- `OnMouseUp` : `MouseEvent`
- `OnMouseWheel` : `MouseWheelEvent`
- `OnMouseWheelDown` : `MouseWheelUpDownEvent`
- `OnMouseWheelHorz` : `MouseWheelEvent`
- `OnMouseWheelLeft` : `MouseWheelUpDownEvent`
- `OnMouseWheelRight` : `MouseWheelUpDownEvent`
- `OnMouseWheelUp` : `MouseWheelUpDownEvent`
- `OnPickListSelect` : `NotifyEvent`
- `OnPrepareCanvas` : `OnPrepareCanvasEvent`
- `OnResize` : `NotifyEvent`
- `OnSelectCell` : `OnSelectCellEvent`
- `OnSelectEditor` : `SelectEditorEvent`
- `OnSelection` : `OnSelectEvent`
- `OnSetCheckboxState` : `SetCheckboxStateEvent`
- `OnSetEditText` : `SetEditEvent`
- `OnShowHint` : `ControlShowHintEvent`
- `OnStartDock` : `StartDockEvent`
- `OnStartDrag` : `StartDragEvent`
- `OnTopLeftChanged` : `NotifyEvent`
- `OnUTF8KeyPress` : `UTF8KeyPressEvent`
- `OnUserCheckboxBitmap` : `UserCheckBoxBitmapEvent`
- `OnUserCheckboxImage` : `UserCheckBoxImageEvent`
- `OnValidateEntry` : `ValidateEntryEvent`
- `Options` : `GridOptions`
- `Options2` : `GridOptions2`
- `ParentBiDiMode` : `Boolean`
- `ParentColor` : `Boolean`
- `ParentDoubleBuffered` : `Boolean`
- `ParentFont` : `Boolean`
- `ParentShowHint` : `Boolean`
- `PopupMenu` : `PopupMenu`
- `RangeSelectMode` : `RangeSelectMode`
- `RowCount` : `LongInt`
- `RowSizingCursor` : `Cursor`
- `ScrollBars` : `ScrollStyle`
- `ShowHint` : `Boolean`
- `TabAdvance` : `AutoAdvance`
- `TabOrder` : `TabOrder`
- `TabStop` : `Boolean`
- `Tag` : `Int64`
- `TitleFont` : `Font`
- `TitleImageList` : `ImageList`
- `TitleStyle` : `TitleStyle`
- `Top` : `LongInt`
- `UseXORFeatures` : `Boolean`
- `Visible` : `Boolean`
- `VisibleColCount` : `LongInt`
- `VisibleRowCount` : `LongInt`
- `Width` : `LongInt`

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| o:AutoSizeColumn(aCol) | procedure AutoSizeColumn(aCol: Integer); |
| o:AutoSizeColumns() | procedure AutoSizeColumns; |
| result = o:Cells(ACol,ARow)<br>o:Cells(ACol,ARow,value) | property Cells[ACol, ARow: Integer]: string read GetCells write SetCells; |
| o:Clean() | procedure Clean; overload; |
| o:Clean2(CleanOptions) | procedure Clean(CleanOptions: TGridZoneSet); overload; |
| o:Clean3(aRect,CleanOptions) | procedure Clean(aRect: TRect; CleanOptions: TGridZoneSet); overload; |
| o:Clean4(StartCol,StartRow,EndCol,EndRow,CleanOptions) | procedure Clean(StartCol,StartRow,EndCol,EndRow: integer; CleanOptions: TGridZoneSet); overload; |
| result = o:Cols(index)<br>o:Cols(index,value) | property Cols[index: Integer]: TStrings read GetCols write SetCols; |
| o:CopyToClipboard()<br>o:CopyToClipboard(AUseSelection) | procedure CopyToClipboard(AUseSelection: boolean = false); |
| o:InsertRowWithValues(Index,Values) | procedure InsertRowWithValues(Index: Integer; Values: array of String); |
| o:LoadFromCSVFile(AFilename)<br>...<br>o:LoadFromCSVFile(AFilename,ADelimiter,UseTitles,FromLine,SkipEmptyLines) | procedure LoadFromCSVFile(AFilename: string; ADelimiter: Char=','; UseTitles: boolean=true; FromLine: Integer=0; SkipEmptyLines: Boolean=true); |
| o:LoadFromCSVStream(AStream)<br>...<br>o:LoadFromCSVStream(AStream,ADelimiter,UseTitles,FromLine,SkipEmptyLines) | procedure LoadFromCSVStream(AStream: TStream; ADelimiter: Char=','; UseTitles: boolean=true; FromLine: Integer=0; SkipEmptyLines: Boolean=true); virtual; |
| result = o:Objects(ACol,ARow)<br>o:Objects(ACol,ARow,value) | property Objects[ACol, ARow: Integer]: TObject read GetObjects write SetObjects; |
| o.OnCellProcess = function(Sender,aCol,aRow,processType,aValue) return aValue end | property OnCellProcess: TCellProcessEvent read fOnCellProcess write fOnCellProcess; |
| result = o:Rows(index)<br>o:Rows(index,value) | property Rows[index: Integer]: TStrings read GetRows write SetRows; |
| o:SaveToCSVFile(AFileName)<br>...<br>o:SaveToCSVFile(AFileName,ADelimiter,WriteTitles,VisibleColumnsOnly) | procedure SaveToCSVFile(AFileName: string; ADelimiter: Char=','; WriteTitles: boolean=true; VisibleColumnsOnly: boolean=false); |
| o:SaveToCSVStream(AStream)<br>...<br>o:SaveToCSVStream(AStream,ADelimiter,WriteTitles,VisibleColumnsOnly) | procedure SaveToCSVStream(AStream: TStream; ADelimiter: Char=','; WriteTitles: boolean=true; VisibleColumnsOnly: boolean=false); |


<a id="StringList"></a>
### StringList

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| o.CaseSensitive = value<br>result = o.CaseSensitive | property CaseSensitive: Boolean read FCaseSensitive write SetCaseSensitive; |
| o.Duplicates = value<br>result = o.Duplicates | property Duplicates: TDuplicates read FDuplicates write FDuplicates; |
| result, Index = o:Find(S) | function Find(const S: string; Out Index: Integer): Boolean; virtual; |
| o.OnChange = function(Sender) end | property OnChange: TNotifyEvent read FOnChange write FOnChange; |
| o.OnChanging = function(Sender) end | property OnChanging: TNotifyEvent read FOnChanging write FOnChanging; |
| o.OwnsObjects = value<br>result = o.OwnsObjects | property OwnsObjects : boolean read FOwnsObjects write FOwnsObjects; |
| o:Sort() | procedure Sort; virtual; |
| o.SortStyle = value<br>result = o.SortStyle | Property SortStyle : TStringsSortStyle Read FSortStyle Write SetSortStyle; |
| o.Sorted = value<br>result = o.Sorted | property Sorted: Boolean read GetSorted write SetSorted; |


<a id="Strings"></a>
### Strings

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| result = o:Add(S) | function Add(const S: string): Integer; virtual; overload; |
| o:AddCommaText(S) | procedure AddCommaText(const S: String); |
| o:AddDelimitedText(S,ADelimiter,AStrictDelimiter) | procedure AddDelimitedText(const S: String; ADelimiter: char; AStrictDelimiter: Boolean); overload; |
| o:AddDelimitedtext2(S) | procedure AddDelimitedtext(const S: String); overload; |
| result = o:AddObject(S,AObject) | function AddObject(const S: string; AObject: TObject): Integer; virtual; overload; |
| result = o:AddPair(AName,AValue) | function AddPair(const AName, AValue: string): TStrings; overload; |
| result = o:AddPair2(AName,AValue,AObject) | function AddPair(const AName, AValue: string; AObject: TObject): TStrings; overload; |
| o:AddStrings(TheStrings) | procedure AddStrings(TheStrings: TStrings); overload; virtual; |
| o:AddStrings2(TheStrings,ClearFirst) | procedure AddStrings(TheStrings: TStrings; ClearFirst : Boolean); overload; |
| o:AddStrings3(TheStrings) | procedure AddStrings(const TheStrings: array of string); overload; virtual; |
| o:AddStrings4(TheStrings,ClearFirst) | procedure AddStrings(const TheStrings: array of string; ClearFirst : Boolean); overload; |
| o:AddText(S) | Procedure AddText(Const S : String); virtual; |
| o.AlwaysQuote = value<br>result = o.AlwaysQuote | property AlwaysQuote: Boolean read FAlwaysQuote write FAlwaysQuote; |
| o:Append(S) | procedure Append(const S: string); |
| o:BeginUpdate() | procedure BeginUpdate; |
| o.Capacity = value<br>result = o.Capacity | property Capacity: Integer read GetCapacity write SetCapacity; |
| o:Clear() | procedure Clear; virtual; abstract; |
| o.CommaText = value<br>result = o.CommaText | property CommaText: string read GetCommaText write SetCommaText; |
| result = o.Count | property Count: Integer read GetCount; |
| o:Delete(Index) | procedure Delete(Index: Integer); virtual; abstract; |
| o.DelimitedText = value<br>result = o.DelimitedText | property DelimitedText: string read GetDelimitedText write SetDelimitedText; |
| o.Delimiter = value<br>result = o.Delimiter | property Delimiter: Char read GetDelimiter write SetDelimiter; |
| o:EndUpdate() | procedure EndUpdate; |
| result = o:Equals(Obj) | function Equals(Obj: TObject): Boolean; override; overload; |
| result = o:Equals2(TheStrings) | function Equals(TheStrings: TStrings): Boolean; overload; |
| o:Exchange(Index1,Index2) | procedure Exchange(Index1, Index2: Integer); virtual; |
| result = o:ExtractName(S) | function  ExtractName(Const S:String):String; |
| o:Fill(aValue,aStart,aEnd) | Procedure Fill(const aValue : String; aStart,aEnd : Integer); |
| AName, AValue = o:GetNameValue(Index) | procedure GetNameValue(Index : Integer; Out AName,AValue : String); |
| result = o:GetText() | function GetText: PChar; virtual; |
| result = o:IndexOf(S) | function IndexOf(const S: string): Integer; virtual; |
| result = o:IndexOf2(S,aStart) | function IndexOf(const S: string; aStart : Integer): Integer; virtual; |
| result = o:IndexOfName(Name) | function IndexOfName(const Name: string): Integer; virtual; |
| result = o:IndexOfObject(AObject) | function IndexOfObject(AObject: TObject): Integer; virtual; |
| o:Insert(Index,S) | procedure Insert(Index: Integer; const S: string); virtual; abstract; |
| o:InsertObject(Index,S,AObject) | procedure InsertObject(Index: Integer; const S: string; AObject: TObject); |
| result = o:LastIndexOf(S,aStart) | function LastIndexOf(const S: string; aStart : Integer): Integer; virtual; |
| result = o:LastIndexOf2(S) | function LastIndexOf(const S: string): Integer; |
| o.LineBreak = value<br>result = o.LineBreak | property LineBreak : string Read GetLineBreak write SetLineBreak; |
| o:LoadFromFile(FileName) | procedure LoadFromFile(const FileName: string); overload; virtual; |
| o:LoadFromFile2(FileName,IgnoreEncoding) | procedure LoadFromFile(const FileName: string; IgnoreEncoding : Boolean); |
| o:LoadFromStream(Stream) | procedure LoadFromStream(Stream: TStream); overload; virtual; |
| o:LoadFromStream2(Stream,IgnoreEncoding) | procedure LoadFromStream(Stream: TStream; IgnoreEncoding : Boolean); overload; |
| o.MissingNameValueSeparatorAction = value<br>result = o.MissingNameValueSeparatorAction | Property MissingNameValueSeparatorAction : TMissingNameValueSeparatorAction Read GetMissingNameValueSeparatorAction Write SetMissingNameValueSeparatorAction; |
| o:Move(CurIndex,NewIndex) | procedure Move(CurIndex, NewIndex: Integer); virtual; |
| o.NameValueSeparator = value<br>result = o.NameValueSeparator | Property NameValueSeparator : Char Read GetNameValueSeparator Write SetNameValueSeparator; |
| result = o:Names(Index) | property Names[Index: Integer]: string read GetName; |
| result = o:Objects(Index)<br>o:Objects(Index,value) | property Objects[Index: Integer]: TObject read GetObject write PutObject; |
| o.Options = value<br>result = o.Options | property Options: TStringsOptions read FOptions write FOptions; |
| result = o:Pop() | Function Pop : String; |
| o.QuoteChar = value<br>result = o.QuoteChar | property QuoteChar: Char read GetQuoteChar write SetQuoteChar; |
| result = o:Reverse() | Function Reverse : TStrings; |
| o:Reverse2(aList) | Procedure Reverse(aList : TStrings); |
| o:SaveToFile(FileName) | procedure SaveToFile(const FileName: string); overload; virtual; |
| o:SaveToFile2(FileName,IgnoreEncoding) | procedure SaveToFile(const FileName: string; IgnoreEncoding : Boolean); overload; |
| o:SaveToStream(Stream) | procedure SaveToStream(Stream: TStream); overload; virtual; |
| o:SaveToStream2(Stream,IgnoreEncoding) | procedure SaveToStream(Stream: TStream; IgnoreEncoding : Boolean); overload; |
| o:SetStrings(TheStrings) | procedure SetStrings(TheStrings: TStrings); overload; virtual; |
| o:SetStrings2(TheStrings) | procedure SetStrings(TheStrings: array of string); overload; virtual; |
| o:SetText(TheText) | procedure SetText(TheText: PChar); virtual; |
| result = o:Shift() | function Shift : String; |
| o.SkipLastLineBreak = value<br>result = o.SkipLastLineBreak | Property SkipLastLineBreak : Boolean Read GetSkipLastLineBreak Write SetSkipLastLineBreak; |
| o:Slice(fromIndex,aList) | Procedure Slice(fromIndex: integer; aList : TStrings); |
| result = o:Slice2(fromIndex) | Function Slice(fromIndex: integer) : TStrings; |
| o.StrictDelimiter = value<br>result = o.StrictDelimiter | Property StrictDelimiter : Boolean Read GetStrictDelimiter Write SetStrictDelimiter; |
| result = o:Strings(Index)<br>o:Strings(Index,value) | property Strings[Index: Integer]: string read Get write Put; default; |
| o.Text = value<br>result = o.Text | property Text: string read GetTextStr write SetTextStr; |
| o.TextLineBreakStyle = value<br>result = o.TextLineBreakStyle | Property TextLineBreakStyle : TTextLineBreakStyle Read GetLBS Write SetLBS; |
| result = o:ToObjectArray(aStart,aEnd) | function ToObjectArray(aStart,aEnd : Integer) : TObjectDynArray; overload; |
| result = o:ToObjectArray2() | function ToObjectArray: TObjectDynArray; overload; |
| result = o:ToStringArray(aStart,aEnd) | function ToStringArray(aStart,aEnd : Integer) : TStringDynArray; overload; |
| result = o:ToStringArray2() | function ToStringArray: TStringDynArray; overload; |
| o.TrailingLineBreak = value<br>result = o.TrailingLineBreak | Property TrailingLineBreak : Boolean Read GetTrailingLineBreak Write SetTrailingLineBreak; |
| o.UseLocale = value<br>result = o.UseLocale | Property UseLocale : Boolean Read GetUseLocale Write SetUseLocale; |
| result = o:ValueFromIndex(Index)<br>o:ValueFromIndex(Index,value) | property ValueFromIndex[Index: Integer]: string read GetValueFromIndex write SetValueFromIndex; |
| result = o:Values(Name)<br>o:Values(Name,value) | property Values[const Name: string]: string read GetValue write SetValue; |
| o.WriteBOM = value<br>result = o.WriteBOM | property WriteBOM: Boolean read GetWriteBOM write SetWriteBOM; |


<a id="TIGrid"></a>
### TIGrid

#### Published properties
- `AliasPropertyNames` : `AliasStrings`
- `Align` : `Align`
- `AnchorSideBottom` : `AnchorSide`
- `AnchorSideLeft` : `AnchorSide`
- `AnchorSideRight` : `AnchorSide`
- `AnchorSideTop` : `AnchorSide`
- `Anchors` : `Anchors`
- `AutoAdvance` : `AutoAdvance`
- `AutoFillColumns` : `Boolean`
- `BorderSpacing` : `ControlBorderSpacing`
- `BorderStyle` : `BorderStyle`
- `Color` : `GraphicsColor`
- `Constraints` : `SizeConstraints`
- `Cursor` : `Cursor`
- `DefaultDrawing` : `Boolean`
- `DefaultRowHeight` : `LongInt`
- `Enabled` : `Boolean`
- `Filter` : `TypeKinds`
- `FixedColor` : `GraphicsColor`
- `FixedCols` : `LongInt`
- `FixedRows` : `LongInt`
- `Flat` : `Boolean`
- `Font` : `Font`
- `Height` : `LongInt`
- `HelpContext` : `HelpContext`
- `HelpKeyword` : `AnsiString`
- `HelpType` : `HelpType`
- `HideProperties` : `Strings`
- `Hint` : `TranslateString`
- `Left` : `LongInt`
- `ListDirection` : `TIListDirection`
- `Name` : `AnsiString`
- `OnCreateCellEditor` : `TIGridCreateCellEditor`
- `OnDblClick` : `NotifyEvent`
- `OnEditButtonClick` : `NotifyEvent`
- `OnEnter` : `NotifyEvent`
- `OnExit` : `NotifyEvent`
- `OnGetObject` : `TIGridGetObject`
- `OnGetObjectCount` : `TIGridGetObjectCount`
- `OnGetObjectName` : `TIGridGetObjectName`
- `OnHeaderClick` : `HdrEvent`
- `OnHeaderSized` : `HdrEvent`
- `OnInitCellEditor` : `TIGridInitCellEditor`
- `OnKeyDown` : `KeyEvent`
- `OnKeyPress` : `KeyPressEvent`
- `OnKeyUp` : `KeyEvent`
- `OnMouseDown` : `MouseEvent`
- `OnMouseMove` : `MouseMoveEvent`
- `OnMouseUp` : `MouseEvent`
- `OnPrepareCanvas` : `OnPrepareCanvasEvent`
- `OnPropertiesCreated` : `NotifyEvent`
- `Options` : `GridOptions`
- `ParentColor` : `Boolean`
- `ParentFont` : `Boolean`
- `PopupMenu` : `PopupMenu`
- `PropertyOrder` : `Strings`
- `ShowHint` : `Boolean`
- `ShowOnlyProperties` : `Strings`
- `TIOptions` : `TIGridOptions`
- `TabOrder` : `TabOrder`
- `TabStop` : `Boolean`
- `Tag` : `Int64`
- `TitleFont` : `Font`
- `Top` : `LongInt`
- `Visible` : `Boolean`
- `Width` : `LongInt`

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| o.AliasPropertyNames = value<br>result = o.AliasPropertyNames | property AliasPropertyNames: TAliasStrings read FAliasPropertyNames write SetAliasPropertyNames; |
| o:ClearProperties() | procedure ClearProperties; |
| aRect = o:DefaultDrawCell(aCol,aRow,aState) | procedure DefaultDrawCell(aCol, aRow: Integer; var aRect: TRect; aState: TGridDrawState); virtual; |
| aRect = o:DefaultDrawCell2(aCol,aRow,aRect,aState) | procedure DefaultDrawCell(aCol, aRow: Integer; var aRect: TRect; aState: TGridDrawState); virtual; |
| o:DrawObjectName(Index,aRect,aState) | procedure DrawObjectName(Index: integer; const aRect: TRect; aState: TGridDrawState); |
| o.Filter = value<br>result = o.Filter | property Filter: TTypeKinds read FFilter write SetFilter default AllTypeKinds; |
| result = o:FindGridProperty(PropName) | function FindGridProperty(const PropName: string): TTIGridProperty; |
| o:FreeCellEditor(PropEditor) | procedure FreeCellEditor(PropEditor: TPropertyEditor); |
| aPropEditor, aIndependentEditor = o:GetCellEditor(aCol,aRow) | procedure GetCellEditor(aCol, aRow: integer; out aPropEditor: TPropertyEditor; out aIndependentEditor: boolean); |
| result = o:GetCurrentGridProperty() | function GetCurrentGridProperty: TTIGridProperty; |
| result = o:GetTIObject(Index) | function GetTIObject(Index: integer): TPersistent; |
| result = o:GridStateToPropEditState(GridState) | function GridStateToPropEditState(GridState: TGridDrawState ): TPropEditDrawState; |
| o.HideProperties = value<br>result = o.HideProperties | property HideProperties: TStrings read FHideProperties write SetHideProperties; |
| result = o:IndexOfGridProperty(PropName) | function IndexOfGridProperty(const PropName: string): integer; |
| o.ListDirection = value<br>result = o.ListDirection | property ListDirection: TTIListDirection read FListDirection write SetListDirection default tldObjectsAsRows; |
| o.ListObject = value<br>result = o.ListObject | property ListObject: TObject read FListObject write SetListObject; |
| o:Loaded() | procedure Loaded; override; |
| ObjectIndex, PropertyIndex, CellType = o:MapCell(aCol,aRow) | procedure MapCell(aCol, aRow: integer; out ObjectIndex, PropertyIndex: integer; out CellType: TTIGridCellType); |
| o:MoveProperty(FromID,ToID) | procedure MoveProperty(FromID, ToID: integer); |
| o.OnCreateCellEditor = function(GridProp,NewEditorControl) return NewEditorControl end | property OnCreateCellEditor: TTIGridCreateCellEditor read FOnCreateCellEditor write FOnCreateCellEditor; |
| o.OnGetObject = function(Sender,Index,TIObject) return TIObject end | property OnGetObject: TTIGridGetObject read FOnGetObject write FOnGetObject; |
| o.OnGetObjectCount = function(Sender,ListObject,ObjCount) return ObjCount end | property OnGetObjectCount: TTIGridGetObjectCount read FOnGetObjectCount write FOnGetObjectCount; |
| o.OnGetObjectName = function(Sender,Index,TIObject,ObjName) return ObjName end | property OnGetObjectName: TTIGridGetObjectName read FOnGetObjectName write FOnGetObjectName; |
| o.OnHeaderClick = function(Sender,IsColumn,Index) end | property OnHeaderClick: THdrEvent read FOnHeaderClick write FOnHeaderClick; |
| o.OnHeaderSized = function(Sender,IsColumn,Index) end | property OnHeaderSized: THdrEvent read FOnHeaderSized write FOnHeaderSized; |
| o.OnInitCellEditor = function(GridProp,TheEditorControl) end | property OnInitCellEditor: TTIGridInitCellEditor read FOnInitCellEditor write FOnInitCellEditor; |
| o.OnPropertiesCreated = function(Sender) end | property OnPropertiesCreated: TNotifyEvent read FOnPropertiesCreated write FOnPropertiesCreated; |
| result = o:Properties(Index) | property Properties[Index: integer]: TTIGridProperty read GetProperties; |
| result = o.PropertyCount | property PropertyCount: integer read GetPropertyCount; |
| o.PropertyOrder = value<br>result = o.PropertyOrder | property PropertyOrder: TStrings read FPropertyOrder write SetPropertyOrder; |
| o:ReloadTIList() | procedure ReloadTIList; |
| o.ShowOnlyProperties = value<br>result = o.ShowOnlyProperties | property ShowOnlyProperties: TStrings read FShowOnlyProperties write SetShowOnlyProperties; |
| result = o.TIObjectCount | property TIObjectCount: integer read FTIObjectCount; |
| o.TIOptions = value<br>result = o.TIOptions | property TIOptions: TTIGridOptions read FTIOptions write SetTIOptions; |


<a id="TIGridProperty"></a>
### TIGridProperty

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| result = o.Editor | property Editor: TPropertyEditor read FEditor; |
| result = o:GetButtonEditorControl() | function GetButtonEditorControl: TWinControl; |
| result = o:GetEditorControl() | function GetEditorControl: TWinControl; |
| result = o.Grid | property Grid: TTICustomGrid read FGrid; |
| result = o.Index | property Index: integer read FIndex; |
| result = o:PropName() | function PropName: string; |
| o.Title = value<br>result = o.Title | property Title: string read FTitle write SetTitle; |


<a id="TIPropertyGrid"></a>
### TIPropertyGrid

#### Published properties
- `Align` : `Align`
- `AnchorSideBottom` : `AnchorSide`
- `AnchorSideLeft` : `AnchorSide`
- `AnchorSideRight` : `AnchorSide`
- `AnchorSideTop` : `AnchorSide`
- `Anchors` : `Anchors`
- `BackgroundColor` : `GraphicsColor`
- `BorderSpacing` : `ControlBorderSpacing`
- `BorderStyle` : `BorderStyle`
- `CheckboxForBoolean` : `Boolean`
- `Constraints` : `SizeConstraints`
- `Cursor` : `Cursor`
- `DefaultItemHeight` : `LongInt`
- `DefaultValueFont` : `Font`
- `Filter` : `TypeKinds`
- `Height` : `LongInt`
- `HelpContext` : `HelpContext`
- `HelpKeyword` : `AnsiString`
- `HelpType` : `HelpType`
- `Hint` : `TranslateString`
- `Indent` : `LongInt`
- `Left` : `LongInt`
- `Name` : `AnsiString`
- `NameFont` : `Font`
- `OnChangeBounds` : `NotifyEvent`
- `OnClick` : `NotifyEvent`
- `OnEditorFilter` : `OIEditorFilterEvent`
- `OnEnter` : `NotifyEvent`
- `OnExit` : `NotifyEvent`
- `OnKeyDown` : `KeyEvent`
- `OnKeyPress` : `KeyPressEvent`
- `OnKeyUp` : `KeyEvent`
- `OnModified` : `NotifyEvent`
- `OnMouseDown` : `MouseEvent`
- `OnMouseEnter` : `NotifyEvent`
- `OnMouseLeave` : `NotifyEvent`
- `OnMouseMove` : `MouseMoveEvent`
- `OnMouseUp` : `MouseEvent`
- `OnResize` : `NotifyEvent`
- `PopupMenu` : `PopupMenu`
- `PreferredSplitterX` : `LongInt`
- `SplitterX` : `LongInt`
- `TIObject` : `Persistent`
- `Tabstop` : `Boolean`
- `Tag` : `Int64`
- `Top` : `LongInt`
- `ValueFont` : `Font`
- `Visible` : `Boolean`
- `Width` : `LongInt`

<a id="TabControl"></a>
### TabControl

#### Published properties
- `Align` : `Align`
- `AnchorSideBottom` : `AnchorSide`
- `AnchorSideLeft` : `AnchorSide`
- `AnchorSideRight` : `AnchorSide`
- `AnchorSideTop` : `AnchorSide`
- `Anchors` : `Anchors`
- `BiDiMode` : `BiDiMode`
- `BorderSpacing` : `ControlBorderSpacing`
- `Constraints` : `SizeConstraints`
- `Cursor` : `Cursor`
- `DockSite` : `Boolean`
- `DragCursor` : `Cursor`
- `DragKind` : `DragKind`
- `DragMode` : `DragMode`
- `Enabled` : `Boolean`
- `Font` : `Font`
- `Height` : `LongInt`
- `HelpContext` : `HelpContext`
- `HelpKeyword` : `AnsiString`
- `HelpType` : `HelpType`
- `Hint` : `TranslateString`
- `HotTrack` : `Boolean`
- `Images` : `CustomImageList`
- `ImagesWidth` : `LongInt`
- `Left` : `LongInt`
- `MultiLine` : `Boolean`
- `MultiSelect` : `Boolean`
- `Name` : `AnsiString`
- `OnChange` : `NotifyEvent`
- `OnChangeBounds` : `NotifyEvent`
- `OnChanging` : `TabChangingEvent`
- `OnContextPopup` : `ContextPopupEvent`
- `OnDockDrop` : `DockDropEvent`
- `OnDockOver` : `DockOverEvent`
- `OnDragDrop` : `DragDropEvent`
- `OnDragOver` : `DragOverEvent`
- `OnEndDock` : `EndDragEvent`
- `OnEndDrag` : `EndDragEvent`
- `OnEnter` : `NotifyEvent`
- `OnExit` : `NotifyEvent`
- `OnGetImageIndex` : `TabGetImageEvent`
- `OnGetSiteInfo` : `GetSiteInfoEvent`
- `OnMouseDown` : `MouseEvent`
- `OnMouseEnter` : `NotifyEvent`
- `OnMouseLeave` : `NotifyEvent`
- `OnMouseMove` : `MouseMoveEvent`
- `OnMouseUp` : `MouseEvent`
- `OnMouseWheel` : `MouseWheelEvent`
- `OnMouseWheelDown` : `MouseWheelUpDownEvent`
- `OnMouseWheelUp` : `MouseWheelUpDownEvent`
- `OnResize` : `NotifyEvent`
- `OnStartDock` : `StartDockEvent`
- `OnStartDrag` : `StartDragEvent`
- `OnUnDock` : `UnDockEvent`
- `Options` : `CTabControlOptions`
- `OwnerDraw` : `Boolean`
- `ParentBiDiMode` : `Boolean`
- `ParentFont` : `Boolean`
- `ParentShowHint` : `Boolean`
- `PopupMenu` : `PopupMenu`
- `RaggedRight` : `Boolean`
- `ScrollOpposite` : `Boolean`
- `ShowHint` : `Boolean`
- `Style` : `TabStyle`
- `TabHeight` : `SmallInt`
- `TabIndex` : `LongInt`
- `TabOrder` : `TabOrder`
- `TabPosition` : `TabPosition`
- `TabStop` : `Boolean`
- `TabWidth` : `SmallInt`
- `Tabs` : `Strings`
- `Tag` : `Int64`
- `Top` : `LongInt`
- `Visible` : `Boolean`
- `Width` : `LongInt`

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| o:BeginUpdate() | procedure BeginUpdate; |
| result = o.Canvas | property Canvas : TCanvas read FCanvas; platform; |
| result = o.DisplayRect | property DisplayRect: TRect read GetDisplayRect; |
| o:EndUpdate() | procedure EndUpdate; |
| result = o:GetHitTestInfoAt(X,Y) | function GetHitTestInfoAt(X, Y: Integer): THitTests; |
| result = o:IndexOfTabAt(X,Y) | function IndexOfTabAt(X, Y: Integer): Integer; override; |
| result = o:IndexOfTabAt2(P) | function IndexOfTabAt(P: TPoint): Integer; override; |
| result = o:IndexOfTabWithCaption(TabCaption) | function IndexOfTabWithCaption(const TabCaption: string): Integer; |
| result = o:IsUpdating() | function IsUpdating: boolean; |
| result = o:RowCount() | function RowCount: Integer; |
| o:ScrollTabs(Delta) | procedure ScrollTabs(Delta: Integer); |
| result = o:TabRect(Index) | function TabRect(Index: Integer): TRect; |


<a id="TabSheet"></a>
### TabSheet

#### Published properties
- `AnchorSideBottom` : `AnchorSide`
- `AnchorSideLeft` : `AnchorSide`
- `AnchorSideRight` : `AnchorSide`
- `AnchorSideTop` : `AnchorSide`
- `AutoSize` : `Boolean`
- `BiDiMode` : `BiDiMode`
- `BorderWidth` : `BorderWidth`
- `Caption` : `TranslateString`
- `ChildSizing` : `ControlChildSizing`
- `ClientHeight` : `LongInt`
- `ClientWidth` : `LongInt`
- `Cursor` : `Cursor`
- `Enabled` : `Boolean`
- `Font` : `Font`
- `Height` : `LongInt`
- `HelpContext` : `HelpContext`
- `HelpKeyword` : `AnsiString`
- `HelpType` : `HelpType`
- `Hint` : `TranslateString`
- `ImageIndex` : `ImageIndex`
- `Left` : `LongInt`
- `Name` : `AnsiString`
- `OnContextPopup` : `ContextPopupEvent`
- `OnDragDrop` : `DragDropEvent`
- `OnDragOver` : `DragOverEvent`
- `OnEndDrag` : `EndDragEvent`
- `OnEnter` : `NotifyEvent`
- `OnExit` : `NotifyEvent`
- `OnHide` : `NotifyEvent`
- `OnMouseDown` : `MouseEvent`
- `OnMouseEnter` : `NotifyEvent`
- `OnMouseLeave` : `NotifyEvent`
- `OnMouseMove` : `MouseMoveEvent`
- `OnMouseUp` : `MouseEvent`
- `OnMouseWheel` : `MouseWheelEvent`
- `OnMouseWheelDown` : `MouseWheelUpDownEvent`
- `OnMouseWheelUp` : `MouseWheelUpDownEvent`
- `OnResize` : `NotifyEvent`
- `OnShow` : `NotifyEvent`
- `OnStartDrag` : `StartDragEvent`
- `PageIndex` : `LongInt`
- `ParentBiDiMode` : `Boolean`
- `ParentFont` : `Boolean`
- `ParentShowHint` : `Boolean`
- `PopupMenu` : `PopupMenu`
- `ShowHint` : `Boolean`
- `TabVisible` : `Boolean`
- `Tag` : `Int64`
- `Top` : `LongInt`
- `Width` : `LongInt`

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| o.PageControl = value<br>result = o.PageControl | property PageControl: TPageControl read GetPageControl write SetPageControl; |
| result = o.TabIndex | property TabIndex: Integer read GetTabIndex; |


<a id="TextStrings"></a>
### TextStrings

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| o:BeginUpdate() | procedure BeginUpdate; |
| o:EndUpdate() | procedure EndUpdate; |
| o:MakeTextBufferUnique() | procedure MakeTextBufferUnique; |
| o.OnChange = function(Sender) end | property OnChange: TNotifyEvent read FOnChange write FOnChange; |
| o.OnChanging = function(Sender) end | property OnChanging: TNotifyEvent read FOnChanging write FOnChanging; |
| o.Text = value<br>result = o.Text | property Text: string read FText write SetTextStr; |


<a id="TimeEdit"></a>
### TimeEdit

#### Published properties
- `Action` : `BasicAction`
- `Align` : `Align`
- `Alignment` : `Alignment`
- `AnchorSideBottom` : `AnchorSide`
- `AnchorSideLeft` : `AnchorSide`
- `AnchorSideRight` : `AnchorSide`
- `AnchorSideTop` : `AnchorSide`
- `Anchors` : `Anchors`
- `AutoSelect` : `Boolean`
- `AutoSize` : `Boolean`
- `BidiMode` : `BiDiMode`
- `BorderSpacing` : `ControlBorderSpacing`
- `BorderStyle` : `BorderStyle`
- `ButtonCaption` : `TranslateString`
- `ButtonCursor` : `Cursor`
- `ButtonHint` : `TranslateString`
- `ButtonOnlyWhenFocused` : `Boolean`
- `ButtonWidth` : `LongInt`
- `CharCase` : `EditCharCase`
- `Color` : `GraphicsColor`
- `Constraints` : `SizeConstraints`
- `Cursor` : `Cursor`
- `DefaultNow` : `Boolean`
- `DirectInput` : `Boolean`
- `DragMode` : `DragMode`
- `EchoMode` : `EchoMode`
- `Enabled` : `Boolean`
- `Flat` : `Boolean`
- `FocusOnButtonClick` : `Boolean`
- `Font` : `Font`
- `Glyph` : `Bitmap`
- `Height` : `LongInt`
- `HelpContext` : `HelpContext`
- `HelpKeyword` : `AnsiString`
- `HelpType` : `HelpType`
- `Hint` : `TranslateString`
- `ImageIndex` : `ImageIndex`
- `ImageWidth` : `LongInt`
- `Images` : `CustomImageList`
- `Left` : `LongInt`
- `MaxLength` : `LongInt`
- `Name` : `AnsiString`
- `NumGlyphs` : `LongInt`
- `OnAcceptTime` : `AcceptTimeEvent`
- `OnButtonClick` : `NotifyEvent`
- `OnChange` : `NotifyEvent`
- `OnChangeBounds` : `NotifyEvent`
- `OnClick` : `NotifyEvent`
- `OnContextPopup` : `ContextPopupEvent`
- `OnCustomTime` : `CustomTimeEvent`
- `OnDblClick` : `NotifyEvent`
- `OnEditingDone` : `NotifyEvent`
- `OnEnter` : `NotifyEvent`
- `OnExit` : `NotifyEvent`
- `OnKeyDown` : `KeyEvent`
- `OnKeyPress` : `KeyPressEvent`
- `OnKeyUp` : `KeyEvent`
- `OnMouseDown` : `MouseEvent`
- `OnMouseEnter` : `NotifyEvent`
- `OnMouseLeave` : `NotifyEvent`
- `OnMouseMove` : `MouseMoveEvent`
- `OnMouseUp` : `MouseEvent`
- `OnMouseWheel` : `MouseWheelEvent`
- `OnMouseWheelDown` : `MouseWheelUpDownEvent`
- `OnMouseWheelUp` : `MouseWheelUpDownEvent`
- `OnResize` : `NotifyEvent`
- `OnUTF8KeyPress` : `UTF8KeyPressEvent`
- `ParentBidiMode` : `Boolean`
- `ParentColor` : `Boolean`
- `ParentFont` : `Boolean`
- `ParentShowHint` : `Boolean`
- `PopupMenu` : `PopupMenu`
- `ReadOnly` : `Boolean`
- `ShowHint` : `Boolean`
- `SimpleLayout` : `Boolean`
- `Spacing` : `LongInt`
- `TabOrder` : `TabOrder`
- `TabStop` : `Boolean`
- `Tag` : `Int64`
- `Text` : `TranslateString`
- `TextHint` : `TranslateString`
- `Top` : `LongInt`
- `Visible` : `Boolean`
- `Width` : `LongInt`

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| result = o.DroppedDown | property DroppedDown: Boolean read FDroppedDown; |
| o.Time = value<br>result = o.Time | property Time: TDateTime read GetTime write SetTime; |


<a id="Timer"></a>
### Timer

#### Published properties
- `Enabled` : `Boolean`
- `Interval` : `LongWord`
- `Name` : `AnsiString`
- `OnStartTimer` : `NotifyEvent`
- `OnStopTimer` : `NotifyEvent`
- `OnTimer` : `NotifyEvent`
- `Tag` : `Int64`

<a id="ToggleBox"></a>
### ToggleBox

#### Published properties
- `Align` : `Align`
- `AllowGrayed` : `Boolean`
- `AnchorSideBottom` : `AnchorSide`
- `AnchorSideLeft` : `AnchorSide`
- `AnchorSideRight` : `AnchorSide`
- `AnchorSideTop` : `AnchorSide`
- `Anchors` : `Anchors`
- `AutoSize` : `Boolean`
- `BidiMode` : `BiDiMode`
- `BorderSpacing` : `ControlBorderSpacing`
- `Caption` : `TranslateString`
- `Checked` : `Boolean`
- `Color` : `GraphicsColor`
- `Constraints` : `SizeConstraints`
- `Cursor` : `Cursor`
- `DoubleBuffered` : `Boolean`
- `DragCursor` : `Cursor`
- `DragKind` : `DragKind`
- `DragMode` : `DragMode`
- `Enabled` : `Boolean`
- `Font` : `Font`
- `Height` : `LongInt`
- `HelpContext` : `HelpContext`
- `HelpKeyword` : `AnsiString`
- `HelpType` : `HelpType`
- `Hint` : `TranslateString`
- `Left` : `LongInt`
- `Name` : `AnsiString`
- `OnChange` : `NotifyEvent`
- `OnClick` : `NotifyEvent`
- `OnContextPopup` : `ContextPopupEvent`
- `OnDragDrop` : `DragDropEvent`
- `OnDragOver` : `DragOverEvent`
- `OnEndDrag` : `EndDragEvent`
- `OnEnter` : `NotifyEvent`
- `OnExit` : `NotifyEvent`
- `OnMouseDown` : `MouseEvent`
- `OnMouseEnter` : `NotifyEvent`
- `OnMouseLeave` : `NotifyEvent`
- `OnMouseMove` : `MouseMoveEvent`
- `OnMouseUp` : `MouseEvent`
- `OnMouseWheel` : `MouseWheelEvent`
- `OnMouseWheelDown` : `MouseWheelUpDownEvent`
- `OnMouseWheelUp` : `MouseWheelUpDownEvent`
- `OnResize` : `NotifyEvent`
- `OnStartDrag` : `StartDragEvent`
- `ParentBidiMode` : `Boolean`
- `ParentDoubleBuffered` : `Boolean`
- `ParentFont` : `Boolean`
- `ParentShowHint` : `Boolean`
- `PopupMenu` : `PopupMenu`
- `ShowHint` : `Boolean`
- `State` : `CheckBoxState`
- `TabOrder` : `TabOrder`
- `TabStop` : `Boolean`
- `Tag` : `Int64`
- `Top` : `LongInt`
- `Visible` : `Boolean`
- `Width` : `LongInt`

<a id="ToolBar"></a>
### ToolBar

#### Published properties
- `Align` : `Align`
- `AnchorSideBottom` : `AnchorSide`
- `AnchorSideLeft` : `AnchorSide`
- `AnchorSideRight` : `AnchorSide`
- `AnchorSideTop` : `AnchorSide`
- `Anchors` : `Anchors`
- `AutoSize` : `Boolean`
- `BorderSpacing` : `ControlBorderSpacing`
- `BorderWidth` : `BorderWidth`
- `ButtonHeight` : `LongInt`
- `ButtonWidth` : `LongInt`
- `Caption` : `TranslateString`
- `ChildSizing` : `ControlChildSizing`
- `Color` : `GraphicsColor`
- `Constraints` : `SizeConstraints`
- `Cursor` : `Cursor`
- `DisabledImages` : `CustomImageList`
- `DragCursor` : `Cursor`
- `DragKind` : `DragKind`
- `DragMode` : `DragMode`
- `DropDownWidth` : `LongInt`
- `EdgeBorders` : `EdgeBorders`
- `EdgeInner` : `EdgeStyle`
- `EdgeOuter` : `EdgeStyle`
- `Enabled` : `Boolean`
- `Flat` : `Boolean`
- `Font` : `Font`
- `Height` : `LongInt`
- `HelpContext` : `HelpContext`
- `HelpKeyword` : `AnsiString`
- `HelpType` : `HelpType`
- `Hint` : `TranslateString`
- `HotImages` : `CustomImageList`
- `Images` : `CustomImageList`
- `ImagesWidth` : `LongInt`
- `Indent` : `LongInt`
- `Left` : `LongInt`
- `List` : `Boolean`
- `Name` : `AnsiString`
- `OnChangeBounds` : `NotifyEvent`
- `OnClick` : `NotifyEvent`
- `OnContextPopup` : `ContextPopupEvent`
- `OnDblClick` : `NotifyEvent`
- `OnDragDrop` : `DragDropEvent`
- `OnDragOver` : `DragOverEvent`
- `OnEndDrag` : `EndDragEvent`
- `OnEnter` : `NotifyEvent`
- `OnExit` : `NotifyEvent`
- `OnMouseDown` : `MouseEvent`
- `OnMouseEnter` : `NotifyEvent`
- `OnMouseLeave` : `NotifyEvent`
- `OnMouseMove` : `MouseMoveEvent`
- `OnMouseUp` : `MouseEvent`
- `OnMouseWheel` : `MouseWheelEvent`
- `OnMouseWheelDown` : `MouseWheelUpDownEvent`
- `OnMouseWheelUp` : `MouseWheelUpDownEvent`
- `OnPaint` : `NotifyEvent`
- `OnPaintButton` : `ToolBarOnPaintButton`
- `OnResize` : `NotifyEvent`
- `OnStartDrag` : `StartDragEvent`
- `ParentColor` : `Boolean`
- `ParentFont` : `Boolean`
- `ParentShowHint` : `Boolean`
- `PopupMenu` : `PopupMenu`
- `ShowCaptions` : `Boolean`
- `ShowHint` : `Boolean`
- `TabOrder` : `TabOrder`
- `TabStop` : `Boolean`
- `Tag` : `Int64`
- `Top` : `LongInt`
- `Transparent` : `Boolean`
- `Visible` : `Boolean`
- `Width` : `LongInt`
- `Wrapable` : `Boolean`

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| result = o.ButtonCount | property ButtonCount: Integer read GetButtonCount; |
| result = o.ButtonDropWidth | property ButtonDropWidth: Integer read GetButtonDropWidth; |
| result = o:Buttons(Index) | property Buttons[Index: Integer]: TToolButton read GetButton; |
| result = o.RowCount | property RowCount: Integer read FRowCount; |
| o:SetButtonSize(NewButtonWidth,NewButtonHeight) | procedure SetButtonSize(NewButtonWidth, NewButtonHeight: integer); |


<a id="ToolButton"></a>
### ToolButton

#### Published properties
- `Action` : `BasicAction`
- `AllowAllUp` : `Boolean`
- `AnchorSideBottom` : `AnchorSide`
- `AnchorSideLeft` : `AnchorSide`
- `AnchorSideRight` : `AnchorSide`
- `AnchorSideTop` : `AnchorSide`
- `AutoSize` : `Boolean`
- `Caption` : `TranslateString`
- `Cursor` : `Cursor`
- `Down` : `Boolean`
- `DragCursor` : `Cursor`
- `DragKind` : `DragKind`
- `DragMode` : `DragMode`
- `DropdownMenu` : `PopupMenu`
- `Enabled` : `Boolean`
- `Grouped` : `Boolean`
- `Height` : `LongInt`
- `HelpContext` : `HelpContext`
- `HelpKeyword` : `AnsiString`
- `HelpType` : `HelpType`
- `Hint` : `TranslateString`
- `ImageIndex` : `ImageIndex`
- `Indeterminate` : `Boolean`
- `Left` : `LongInt`
- `Marked` : `Boolean`
- `MenuItem` : `MenuItem`
- `Name` : `AnsiString`
- `OnArrowClick` : `NotifyEvent`
- `OnClick` : `NotifyEvent`
- `OnContextPopup` : `ContextPopupEvent`
- `OnDragDrop` : `DragDropEvent`
- `OnDragOver` : `DragOverEvent`
- `OnEndDock` : `EndDragEvent`
- `OnEndDrag` : `EndDragEvent`
- `OnMouseDown` : `MouseEvent`
- `OnMouseEnter` : `NotifyEvent`
- `OnMouseLeave` : `NotifyEvent`
- `OnMouseMove` : `MouseMoveEvent`
- `OnMouseUp` : `MouseEvent`
- `OnMouseWheel` : `MouseWheelEvent`
- `OnMouseWheelDown` : `MouseWheelUpDownEvent`
- `OnMouseWheelUp` : `MouseWheelUpDownEvent`
- `OnStartDock` : `StartDockEvent`
- `OnStartDrag` : `StartDragEvent`
- `ParentShowHint` : `Boolean`
- `PopupMenu` : `PopupMenu`
- `ShowCaption` : `Boolean`
- `ShowHint` : `Boolean`
- `Style` : `ToolButtonStyle`
- `Tag` : `Int64`
- `Top` : `LongInt`
- `Visible` : `Boolean`
- `Width` : `LongInt`
- `Wrap` : `Boolean`

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| o:ArrowClick() | procedure ArrowClick; virtual; |
| result = o:CheckMenuDropdown() | function CheckMenuDropdown: Boolean; virtual; |
| o:Click() | procedure Click; override; |
| ImageList, TheIndex, TheEffect = o:GetCurrentIcon() | procedure GetCurrentIcon(var ImageList: TCustomImageList; var TheIndex: integer; var TheEffect: TGraphicsDrawEffect); virtual; |
| ImageList, TheIndex, TheEffect = o:GetCurrentIcon2(ImageList,TheIndex,TheEffect) | procedure GetCurrentIcon(var ImageList: TCustomImageList; var TheIndex: integer; var TheEffect: TGraphicsDrawEffect); virtual; |
| result = o.Index | property Index: Integer read GetIndex; |
| result = o:PointInArrow(X,Y) | function PointInArrow(const X, Y: Integer): Boolean; |


<a id="ToolWindow"></a>
### ToolWindow

#### Published properties
- `AnchorSideBottom` : `AnchorSide`
- `AnchorSideLeft` : `AnchorSide`
- `AnchorSideRight` : `AnchorSide`
- `AnchorSideTop` : `AnchorSide`
- `Cursor` : `Cursor`
- `Height` : `LongInt`
- `HelpContext` : `HelpContext`
- `HelpKeyword` : `AnsiString`
- `HelpType` : `HelpType`
- `Hint` : `TranslateString`
- `Left` : `LongInt`
- `Name` : `AnsiString`
- `Tag` : `Int64`
- `Top` : `LongInt`
- `Width` : `LongInt`

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| o:BeginUpdate() | procedure BeginUpdate; virtual; |
| o.EdgeInner = value<br>result = o.EdgeInner | property EdgeInner: TEdgeStyle read FEdgeInner write SetEdgeInner default esRaised; |
| o.EdgeOuter = value<br>result = o.EdgeOuter | property EdgeOuter: TEdgeStyle read FEdgeOuter write SetEdgeOuter default esLowered; |
| o:EndUpdate() | procedure EndUpdate; virtual; |


<a id="TrackBar"></a>
### TrackBar

#### Published properties
- `Align` : `Align`
- `AnchorSideBottom` : `AnchorSide`
- `AnchorSideLeft` : `AnchorSide`
- `AnchorSideRight` : `AnchorSide`
- `AnchorSideTop` : `AnchorSide`
- `Anchors` : `Anchors`
- `AutoSize` : `Boolean`
- `BorderSpacing` : `ControlBorderSpacing`
- `Color` : `GraphicsColor`
- `Constraints` : `SizeConstraints`
- `Cursor` : `Cursor`
- `DragCursor` : `Cursor`
- `DragMode` : `DragMode`
- `Enabled` : `Boolean`
- `Font` : `Font`
- `Frequency` : `LongInt`
- `Height` : `LongInt`
- `HelpContext` : `HelpContext`
- `HelpKeyword` : `AnsiString`
- `HelpType` : `HelpType`
- `Hint` : `TranslateString`
- `Left` : `LongInt`
- `LineSize` : `LongInt`
- `Max` : `LongInt`
- `Min` : `LongInt`
- `Name` : `AnsiString`
- `OnChange` : `NotifyEvent`
- `OnChangeBounds` : `NotifyEvent`
- `OnClick` : `NotifyEvent`
- `OnContextPopup` : `ContextPopupEvent`
- `OnDragDrop` : `DragDropEvent`
- `OnDragOver` : `DragOverEvent`
- `OnEndDrag` : `EndDragEvent`
- `OnEnter` : `NotifyEvent`
- `OnExit` : `NotifyEvent`
- `OnKeyDown` : `KeyEvent`
- `OnKeyPress` : `KeyPressEvent`
- `OnKeyUp` : `KeyEvent`
- `OnMouseDown` : `MouseEvent`
- `OnMouseEnter` : `NotifyEvent`
- `OnMouseLeave` : `NotifyEvent`
- `OnMouseMove` : `MouseMoveEvent`
- `OnMouseUp` : `MouseEvent`
- `OnMouseWheel` : `MouseWheelEvent`
- `OnMouseWheelDown` : `MouseWheelUpDownEvent`
- `OnMouseWheelHorz` : `MouseWheelEvent`
- `OnMouseWheelLeft` : `MouseWheelUpDownEvent`
- `OnMouseWheelRight` : `MouseWheelUpDownEvent`
- `OnMouseWheelUp` : `MouseWheelUpDownEvent`
- `OnResize` : `NotifyEvent`
- `OnStartDrag` : `StartDragEvent`
- `OnUTF8KeyPress` : `UTF8KeyPressEvent`
- `Orientation` : `TrackBarOrientation`
- `PageSize` : `LongInt`
- `ParentColor` : `Boolean`
- `ParentFont` : `Boolean`
- `ParentShowHint` : `Boolean`
- `PopupMenu` : `PopupMenu`
- `Position` : `LongInt`
- `Reversed` : `Boolean`
- `ScalePos` : `TrackBarScalePos`
- `SelEnd` : `LongInt`
- `SelStart` : `LongInt`
- `ShowHint` : `Boolean`
- `ShowSelRange` : `Boolean`
- `TabOrder` : `TabOrder`
- `TabStop` : `Boolean`
- `Tag` : `Int64`
- `TickMarks` : `TickMark`
- `TickStyle` : `TickStyle`
- `Top` : `LongInt`
- `Visible` : `Boolean`
- `Width` : `LongInt`

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| o:SetParams(APosition,AMin,AMax) | procedure SetParams(APosition, AMin, AMax: Integer); |
| o:SetTick(Value) | procedure SetTick(Value: Integer); |


<a id="TrayIcon"></a>
### TrayIcon

#### Published properties
- `BalloonFlags` : `BalloonFlags`
- `BalloonHint` : `AnsiString`
- `BalloonTimeout` : `LongInt`
- `BalloonTitle` : `AnsiString`
- `Hint` : `AnsiString`
- `Icon` : `Icon`
- `Name` : `AnsiString`
- `OnClick` : `NotifyEvent`
- `OnDblClick` : `NotifyEvent`
- `OnMouseDown` : `MouseEvent`
- `OnMouseMove` : `MouseMoveEvent`
- `OnMouseUp` : `MouseEvent`
- `OnPaint` : `NotifyEvent`
- `PopUpMenu` : `PopupMenu`
- `Tag` : `Int64`
- `Visible` : `Boolean`

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| o.Animate = value<br>result = o.Animate | property Animate: Boolean read FAnimate write SetAnimate default False; |
| o.AnimateInterval = value<br>result = o.AnimateInterval | property AnimateInterval: Cardinal read GetAnimateInterval write SetAnimateInterval default 1000; |
| o.BalloonFlags = value<br>result = o.BalloonFlags | property BalloonFlags: TBalloonFlags read FBalloonFlags write FBalloonFlags default bfNone; |
| o.BalloonHint = value<br>result = o.BalloonHint | property BalloonHint: string read FBalloonHint write FBalloonHint; |
| o.BalloonTimeout = value<br>result = o.BalloonTimeout | property BalloonTimeout: Integer read FBalloonTimeout write FBalloonTimeout default 3000; |
| o.BalloonTitle = value<br>result = o.BalloonTitle | property BalloonTitle: string read FBalloonTitle write FBalloonTitle; |
| result = o.Canvas | property Canvas: TCanvas read GetCanvas; |
| result = o:GetPosition() | function GetPosition: TPoint; |
| o.Handle = value<br>result = o.Handle | Handle: HWND; |
| result = o:Hide() | function Hide: Boolean; |
| o.Hint = value<br>result = o.Hint | property Hint: string read FHint write SetHint; |
| o.Icon = value<br>result = o.Icon | property Icon: TIcon read FIcon write SetIcon; |
| o.Icons = value<br>result = o.Icons | property Icons: TCustomImageList read FIcons write SetIcons; |
| o:InternalUpdate() | procedure InternalUpdate; |
| o.OnClick = function(Sender) end | property OnClick: TNotifyEvent read FOnClick write FOnClick; |
| o.OnDblClick = function(Sender) end | property OnDblClick: TNotifyEvent read FOnDblClick write FOnDblClick; |
| o.OnMouseDown = function(Sender,Button,Shift,X,Y) end | property OnMouseDown: TMouseEvent read FOnMouseDown write FOnMouseDown; |
| o.OnMouseMove = function(Sender,Shift,X,Y) end | property OnMouseMove: TMouseMoveEvent read FOnMouseMove write FOnMouseMove; |
| o.OnMouseUp = function(Sender,Button,Shift,X,Y) end | property OnMouseUp: TMouseEvent read FOnMouseUp write FOnMouseUp; |
| o.OnPaint = function(Sender) end | property OnPaint: TNotifyEvent read FOnPaint write FOnPaint; |
| o.PopUpMenu = value<br>result = o.PopUpMenu | property PopUpMenu: TPopupMenu read FPopUpMenu write SetPopUpMenu; |
| result = o:Show() | function Show: Boolean; |
| o:ShowBalloonHint() | procedure ShowBalloonHint; |
| o.ShowIcon = value<br>result = o.ShowIcon | property ShowIcon: Boolean read FShowIcon write FShowIcon default True; |
| o.Visible = value<br>result = o.Visible | property Visible: Boolean read FVisible write SetVisible default False; |


<a id="TreeNode"></a>
### TreeNode

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| result = o.AbsoluteIndex | property AbsoluteIndex: Integer read GetAbsoluteIndex; |
| result = o:AlphaSort() | function AlphaSort: Boolean; |
| result = o:Bottom() | function Bottom: integer; |
| result = o:BottomExpanded() | function BottomExpanded: integer; |
| o:Collapse(Recurse) | procedure Collapse(Recurse: Boolean); |
| o:ConsistencyCheck() | procedure ConsistencyCheck; |
| result = o.Count | property Count: Integer read GetCount; |
| o.Cut = value<br>result = o.Cut | property Cut: Boolean read GetCut write SetCut; |
| o.Data = value<br>result = o.Data | property Data: Pointer read FData write SetData; |
| result = o:DefaultTreeViewSort(Node1,Node2) | function DefaultTreeViewSort(Node1, Node2: TTreeNode): Integer; |
| o:Delete() | procedure Delete; |
| o:DeleteChildren() | procedure DeleteChildren; |
| result = o.Deleting | property Deleting: Boolean read GetDeleting; |
| result = o:DisplayExpandSignLeft() | function DisplayExpandSignLeft: integer; |
| result = o:DisplayExpandSignRect() | function DisplayExpandSignRect: TRect; |
| result = o:DisplayExpandSignRight() | function DisplayExpandSignRight: integer; |
| result = o:DisplayIconLeft() | function DisplayIconLeft: integer; |
| result = o:DisplayRect(TextOnly) | function DisplayRect(TextOnly: Boolean): TRect; |
| result = o:DisplayStateIconLeft() | function DisplayStateIconLeft: integer; |
| result = o:DisplayTextLeft() | function DisplayTextLeft: integer; |
| result = o:DisplayTextRight() | function DisplayTextRight: integer; |
| o.DropTarget = value<br>result = o.DropTarget | property DropTarget: Boolean read GetDropTarget write SetDropTarget; |
| result = o:EditText() | function EditText: Boolean; |
| o.Enabled = value<br>result = o.Enabled | property Enabled: Boolean read GetEnabled write SetEnabled default True; |
| o:EndEdit(Cancel) | procedure EndEdit(Cancel: Boolean); |
| o:Expand(Recurse) | procedure Expand(Recurse: Boolean); |
| o:ExpandParents() | procedure ExpandParents; |
| o.Expanded = value<br>result = o.Expanded | property Expanded: Boolean read GetExpanded write SetExpanded; |
| result = o:FindNode(NodeText) | function FindNode(const NodeText: string): TTreeNode; |
| o.Focused = value<br>result = o.Focused | property Focused: Boolean read GetFocused write SetFocused; |
| o:FreeAllNodeData() | procedure FreeAllNodeData; |
| result = o:GetFirstChild() | function GetFirstChild: TTreeNode; |
| result = o:GetFirstSibling() | function GetFirstSibling: TTreeNode; |
| result = o:GetFirstVisibleChild()<br>result = o:GetFirstVisibleChild(aEnabledOnly) | function GetFirstVisibleChild(aEnabledOnly: boolean = false): TTreeNode; |
| result = o:GetHandle() | function GetHandle: THandle; |
| result = o:GetLastChild() | function GetLastChild: TTreeNode; |
| result = o:GetLastSibling() | function GetLastSibling: TTreeNode; |
| result = o:GetLastSubChild() | function GetLastSubChild: TTreeNode; |
| result = o:GetLastVisibleChild()<br>result = o:GetLastVisibleChild(aEnabledOnly) | function GetLastVisibleChild(aEnabledOnly: boolean = false): TTreeNode; |
| result = o:GetNext() | function GetNext: TTreeNode; |
| result = o:GetNextChild(AValue) | function GetNextChild(AValue: TTreeNode): TTreeNode; |
| result = o:GetNextExpanded()<br>result = o:GetNextExpanded(aEnabledOnly) | function GetNextExpanded(aEnabledOnly: boolean = false): TTreeNode; |
| result = o:GetNextMultiSelected() | function GetNextMultiSelected: TTreeNode; |
| result = o:GetNextSibling() | function GetNextSibling: TTreeNode; |
| result = o:GetNextSkipChildren() | function GetNextSkipChildren: TTreeNode; |
| result = o:GetNextVisible()<br>result = o:GetNextVisible(aEnabledOnly) | function GetNextVisible(aEnabledOnly: boolean = false): TTreeNode; |
| result = o:GetNextVisibleSibling()<br>result = o:GetNextVisibleSibling(aEnabledOnly) | function GetNextVisibleSibling(aEnabledOnly: boolean = false): TTreeNode; |
| result = o:GetParentNodeOfAbsoluteLevel(TheAbsoluteLevel) | function GetParentNodeOfAbsoluteLevel(TheAbsoluteLevel: integer): TTreeNode; |
| result = o:GetPrev() | function GetPrev: TTreeNode; |
| result = o:GetPrevChild(AValue) | function GetPrevChild(AValue: TTreeNode): TTreeNode; |
| result = o:GetPrevExpanded()<br>result = o:GetPrevExpanded(aEnabledOnly) | function GetPrevExpanded(aEnabledOnly: boolean = false): TTreeNode; |
| result = o:GetPrevMultiSelected() | function GetPrevMultiSelected: TTreeNode; |
| result = o:GetPrevSibling() | function GetPrevSibling: TTreeNode; |
| result = o:GetPrevVisible()<br>result = o:GetPrevVisible(aEnabledOnly) | function GetPrevVisible(aEnabledOnly: boolean = false): TTreeNode; |
| result = o:GetPrevVisibleSibling()<br>result = o:GetPrevVisibleSibling(aEnabledOnly) | function GetPrevVisibleSibling(aEnabledOnly: boolean = false): TTreeNode; |
| result = o:GetTextPath() | function GetTextPath: string; |
| result = o.Handle | property Handle: THandle read GetHandle; |
| result = o:HasAsParent(AValue) | function HasAsParent(AValue: TTreeNode): Boolean; |
| o.HasChildren = value<br>result = o.HasChildren | property HasChildren: Boolean read GetHasChildren write SetHasChildren; |
| o.Height = value<br>result = o.Height | property Height: integer read GetHeight write SetHeight; |
| o.ImageIndex = value<br>result = o.ImageIndex | property ImageIndex: TImageIndex read FImageIndex write SetImageIndex default -1; |
| o.Index = value<br>result = o.Index | property Index: Integer read GetIndex write SetIndex; |
| result = o:IndexOf(AValue) | function IndexOf(AValue: TTreeNode): Integer; |
| result = o:IndexOfText(NodeText) | function IndexOfText(const NodeText: string): Integer; |
| result = o.IsFullHeightVisible | property IsFullHeightVisible: Boolean read IsNodeHeightFullVisible; |
| result = o.IsVisible | property IsVisible: Boolean read IsNodeVisible; |
| result = o:Items(ItemIndex)<br>o:Items(ItemIndex,value) | property Items[ItemIndex: Integer]: TTreeNode read GetItems write SetItems; default; |
| result = o.Level | property Level: Integer read GetLevel; |
| o:MakeVisible() | procedure MakeVisible; |
| o:MoveTo(Destination,Mode) | procedure MoveTo(Destination: TTreeNode; Mode: TNodeAttachMode); virtual; |
| o:MultiSelectGroup() | procedure MultiSelectGroup; |
| o.MultiSelected = value<br>result = o.MultiSelected | property MultiSelected: Boolean read GetMultiSelected write SetMultiSelected; |
| o.NodeEffect = value<br>result = o.NodeEffect | property NodeEffect: TGraphicsDrawEffect read FNodeEffect write SetImageEffect; |
| o.OverlayIndex = value<br>result = o.OverlayIndex | property OverlayIndex: Integer read FOverlayIndex write SetOverlayIndex default -1; |
| result = o.Owner | property Owner: TTreeNodes read FOwner; |
| result = o.Parent | property Parent: TTreeNode read FParent; |
| o.Selected = value<br>result = o.Selected | property Selected: Boolean read GetSelected write SetSelected; |
| o.SelectedIndex = value<br>result = o.SelectedIndex | property SelectedIndex: Integer read FSelectedIndex write SetSelectedIndex default -1; |
| o.StateIndex = value<br>result = o.StateIndex | property StateIndex: Integer read FStateIndex write SetStateIndex default -1; |
| result = o.States | property States: TNodeStates read FStates; |
| result = o.SubTreeCount | property SubTreeCount: integer read FSubTreeCount; |
| o.Text = value<br>result = o.Text | property Text: string read FText write SetText; |
| result = o.Top | property Top: integer read GetTop; |
| result = o.TreeNodes | property TreeNodes: TTreeNodes read GetTreeNodes; |
| result = o.TreeView | property TreeView: TCustomTreeView read GetTreeView; |
| o:Update() | procedure Update; |
| o.Visible = value<br>result = o.Visible | property Visible: Boolean read GetVisible write SetVisible default True; |
| o:WriteDebugReport(Prefix,Recurse) | procedure WriteDebugReport(const Prefix: string; Recurse: boolean); |


<a id="TreeNodes"></a>
### TreeNodes

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| result = o:Add(SiblingNode,S) | function Add(SiblingNode: TTreeNode; const S: string): TTreeNode; |
| result = o:AddChild(ParentNode,S) | function AddChild(ParentNode: TTreeNode; const S: string): TTreeNode; |
| result = o:AddChildFirst(ParentNode,S) | function AddChildFirst(ParentNode: TTreeNode; const S: string): TTreeNode; |
| result = o:AddChildObject(ParentNode,S,Data) | function AddChildObject(ParentNode: TTreeNode; const S: string; Data: Pointer): TTreeNode; |
| result = o:AddChildObjectFirst(ParentNode,S,Data) | function AddChildObjectFirst(ParentNode: TTreeNode; const S: string; Data: Pointer): TTreeNode; |
| result = o:AddFirst(SiblingNode,S) | function AddFirst(SiblingNode: TTreeNode; const S: string): TTreeNode; |
| result = o:AddNode(Node,Relative,S,Ptr,Method) | function AddNode(Node: TTreeNode; Relative: TTreeNode; const S: string; Ptr: Pointer; Method: TNodeAttachMode): TTreeNode; |
| result = o:AddObject(SiblingNode,S,Data) | function AddObject(SiblingNode: TTreeNode; const S: string; Data: Pointer): TTreeNode; |
| result = o:AddObjectFirst(SiblingNode,S,Data) | function AddObjectFirst(SiblingNode: TTreeNode; const S: string; Data: Pointer): TTreeNode; |
| o:BeginUpdate() | procedure BeginUpdate; |
| o:Clear() | procedure Clear; |
| o:ClearMultiSelection()<br>o:ClearMultiSelection(ClearSelected) | procedure ClearMultiSelection(ClearSelected: boolean = false); |
| o:ConsistencyCheck() | procedure ConsistencyCheck; |
| result = o.Count | property Count: Integer read GetCount; |
| o:Delete(Node) | procedure Delete(Node: TTreeNode); |
| o:EndUpdate() | procedure EndUpdate; |
| result = o:FindNodeWithData(NodeData) | function FindNodeWithData(const NodeData: Pointer): TTreeNode; |
| result = o:FindNodeWithText(NodeText) | function FindNodeWithText(const NodeText: string): TTreeNode; |
| result = o:FindNodeWithTextPath(TextPath) | function FindNodeWithTextPath(TextPath: string): TTreeNode; |
| result = o:FindTopLvlNode(NodeText) | function FindTopLvlNode(const NodeText: string): TTreeNode; |
| o:FreeAllNodeData() | procedure FreeAllNodeData; |
| result = o:GetFirstNode() | function GetFirstNode: TTreeNode; |
| result = o:GetFirstVisibleEnabledNode() | function GetFirstVisibleEnabledNode: TTreeNode; |
| result = o:GetFirstVisibleNode() | function GetFirstVisibleNode: TTreeNode; |
| result = o:GetLastExpandedSubNode() | function GetLastExpandedSubNode: TTreeNode; |
| result = o:GetLastNode() | function GetLastNode: TTreeNode; |
| result = o:GetLastSubNode() | function GetLastSubNode: TTreeNode; |
| result = o:GetLastVisibleEnabledNode() | function GetLastVisibleEnabledNode: TTreeNode; |
| result = o:GetLastVisibleNode() | function GetLastVisibleNode: TTreeNode; |
| result = o:GetSelections(AIndex) | function GetSelections(const AIndex: Integer): TTreeNode; |
| result = o:Insert(NextNode,S) | function Insert(NextNode: TTreeNode; const S: string): TTreeNode; |
| result = o:InsertBehind(PrevNode,S) | function InsertBehind(PrevNode: TTreeNode; const S: string): TTreeNode; |
| result = o:InsertObject(NextNode,S,Data) | function InsertObject(NextNode: TTreeNode; const S: string; Data: Pointer): TTreeNode; |
| result = o:InsertObjectBehind(PrevNode,S,Data) | function InsertObjectBehind(PrevNode: TTreeNode; const S: string; Data: Pointer): TTreeNode; |
| result = o:IsMultiSelection() | function IsMultiSelection: boolean; |
| result = o:Item(Index) | property Item[Index: Integer]: TTreeNode read GetNodeFromIndex; default; |
| o.KeepCollapsedNodes = value<br>result = o.KeepCollapsedNodes | property KeepCollapsedNodes: boolean read FKeepCollapsedNodes write FKeepCollapsedNodes; |
| o:MultiSelect(Node,ClearWholeSelection) | procedure MultiSelect(Node: TTreeNode; ClearWholeSelection: Boolean); |
| result = o.Owner | property Owner: TCustomTreeView read FOwner; |
| o:SelectOnlyThis(Node) | procedure SelectOnlyThis(Node: TTreeNode); |
| result = o.SelectionCount | property SelectionCount: Cardinal read GetSelectionCount; |
| o:SelectionsChanged(ANode,AIsSelected) | procedure SelectionsChanged(ANode: TTreeNode; const AIsSelected: Boolean); |
| result = o.TopLvlCount | property TopLvlCount: integer read FTopLvlCount; |
| result = o:TopLvlItems(Index)<br>o:TopLvlItems(Index,value) | property TopLvlItems[Index: integer]: TTreeNode read GetTopLvlItems write SetTopLvlItems; |
| o:WriteDebugReport(Prefix,AllNodes) | procedure WriteDebugReport(const Prefix: string; AllNodes: boolean); |


<a id="TreeView"></a>
### TreeView

#### Published properties
- `Align` : `Align`
- `AnchorSideBottom` : `AnchorSide`
- `AnchorSideLeft` : `AnchorSide`
- `AnchorSideRight` : `AnchorSide`
- `AnchorSideTop` : `AnchorSide`
- `Anchors` : `Anchors`
- `AutoExpand` : `Boolean`
- `BackgroundColor` : `GraphicsColor`
- `BorderSpacing` : `ControlBorderSpacing`
- `BorderStyle` : `BorderStyle`
- `BorderWidth` : `BorderWidth`
- `Color` : `GraphicsColor`
- `Constraints` : `SizeConstraints`
- `Cursor` : `Cursor`
- `DefaultItemHeight` : `LongInt`
- `DisabledFontColor` : `GraphicsColor`
- `DragCursor` : `Cursor`
- `DragKind` : `DragKind`
- `DragMode` : `DragMode`
- `Enabled` : `Boolean`
- `ExpandSignColor` : `GraphicsColor`
- `ExpandSignSize` : `LongInt`
- `ExpandSignType` : `TreeViewExpandSignType`
- `Font` : `Font`
- `Height` : `LongInt`
- `HelpContext` : `HelpContext`
- `HelpKeyword` : `AnsiString`
- `HelpType` : `HelpType`
- `HideSelection` : `Boolean`
- `Hint` : `TranslateString`
- `HotTrack` : `Boolean`
- `HotTrackColor` : `GraphicsColor`
- `Images` : `CustomImageList`
- `ImagesWidth` : `LongInt`
- `Indent` : `LongInt`
- `Items` : `TreeNodes`
- `Left` : `LongInt`
- `MultiSelect` : `Boolean`
- `MultiSelectStyle` : `MultiSelectStyle`
- `Name` : `AnsiString`
- `OnAddition` : `TVExpandedEvent`
- `OnAdvancedCustomDraw` : `TVAdvancedCustomDrawEvent`
- `OnAdvancedCustomDrawItem` : `TVAdvancedCustomDrawItemEvent`
- `OnChange` : `TVChangedEvent`
- `OnChanging` : `TVChangingEvent`
- `OnClick` : `NotifyEvent`
- `OnCollapsed` : `TVExpandedEvent`
- `OnCollapsing` : `TVCollapsingEvent`
- `OnCompare` : `TVCompareEvent`
- `OnContextPopup` : `ContextPopupEvent`
- `OnCreateNodeClass` : `TVCreateNodeClassEvent`
- `OnCustomCreateItem` : `TVCustomCreateNodeEvent`
- `OnCustomDraw` : `TVCustomDrawEvent`
- `OnCustomDrawArrow` : `TVCustomDrawArrowEvent`
- `OnCustomDrawItem` : `TVCustomDrawItemEvent`
- `OnDblClick` : `NotifyEvent`
- `OnDeletion` : `TVExpandedEvent`
- `OnDragDrop` : `DragDropEvent`
- `OnDragOver` : `DragOverEvent`
- `OnEdited` : `TVEditedEvent`
- `OnEditing` : `TVEditingEvent`
- `OnEditingEnd` : `TVEditingEndEvent`
- `OnEndDrag` : `EndDragEvent`
- `OnEnter` : `NotifyEvent`
- `OnExit` : `NotifyEvent`
- `OnExpanded` : `TVExpandedEvent`
- `OnExpanding` : `TVExpandingEvent`
- `OnGetImageIndex` : `TVExpandedEvent`
- `OnGetSelectedIndex` : `TVExpandedEvent`
- `OnHasChildren` : `TVHasChildrenEvent`
- `OnKeyDown` : `KeyEvent`
- `OnKeyPress` : `KeyPressEvent`
- `OnKeyUp` : `KeyEvent`
- `OnMouseDown` : `MouseEvent`
- `OnMouseEnter` : `NotifyEvent`
- `OnMouseLeave` : `NotifyEvent`
- `OnMouseMove` : `MouseMoveEvent`
- `OnMouseUp` : `MouseEvent`
- `OnMouseWheel` : `MouseWheelEvent`
- `OnMouseWheelDown` : `MouseWheelUpDownEvent`
- `OnMouseWheelHorz` : `MouseWheelEvent`
- `OnMouseWheelLeft` : `MouseWheelUpDownEvent`
- `OnMouseWheelRight` : `MouseWheelUpDownEvent`
- `OnMouseWheelUp` : `MouseWheelUpDownEvent`
- `OnNodeChanged` : `TVNodeChangedEvent`
- `OnResize` : `NotifyEvent`
- `OnSelectionChanged` : `NotifyEvent`
- `OnShowHint` : `ControlShowHintEvent`
- `OnStartDrag` : `StartDragEvent`
- `OnUTF8KeyPress` : `UTF8KeyPressEvent`
- `Options` : `TreeViewOptions`
- `ParentColor` : `Boolean`
- `ParentFont` : `Boolean`
- `ParentShowHint` : `Boolean`
- `PopupMenu` : `PopupMenu`
- `ReadOnly` : `Boolean`
- `RightClickSelect` : `Boolean`
- `RowSelect` : `Boolean`
- `ScrollBars` : `ScrollStyle`
- `SelectionColor` : `GraphicsColor`
- `SelectionFontColor` : `GraphicsColor`
- `SelectionFontColorUsed` : `Boolean`
- `SeparatorColor` : `GraphicsColor`
- `ShowButtons` : `Boolean`
- `ShowHint` : `Boolean`
- `ShowLines` : `Boolean`
- `ShowRoot` : `Boolean`
- `ShowSeparators` : `Boolean`
- `SortType` : `SortType`
- `StateImages` : `CustomImageList`
- `StateImagesWidth` : `LongInt`
- `TabOrder` : `TabOrder`
- `TabStop` : `Boolean`
- `Tag` : `Int64`
- `ToolTips` : `Boolean`
- `Top` : `LongInt`
- `TreeLineColor` : `GraphicsColor`
- `TreeLinePenStyle` : `FPPenStyle`
- `Visible` : `Boolean`
- `Width` : `LongInt`

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| o.AccessibilityOn = value<br>result = o.AccessibilityOn | property AccessibilityOn: Boolean read FAccessibilityOn write FAccessibilityOn default True; |
| result = o:AlphaSort() | function AlphaSort: Boolean; |
| o:ApplyStoredSelection(ASelection)<br>o:ApplyStoredSelection(ASelection,FreeList) | procedure ApplyStoredSelection(ASelection: TStringList; FreeList: boolean = True); |
| o.BackgroundColor = value<br>result = o.BackgroundColor | property BackgroundColor: TColor read GetBackgroundColor write SetBackgroundColor stored IsStoredBackgroundColor; |
| o:BeginUpdate() | procedure BeginUpdate; |
| o.BottomItem = value<br>result = o.BottomItem | property BottomItem: TTreeNode read GetBottomItem write SetBottomItem; |
| o:ClearInvisibleSelection() | procedure ClearInvisibleSelection; |
| o:ClearSelection()<br>o:ClearSelection(KeepPrimary) | procedure ClearSelection(KeepPrimary: Boolean = false); virtual; |
| o:ConsistencyCheck() | procedure ConsistencyCheck; |
| o.DefaultItemHeight = value<br>result = o.DefaultItemHeight | property DefaultItemHeight: integer read FDefItemHeight write SetDefaultItemHeight stored DefaultItemHeightIsStored; |
| result = o:DefaultTreeViewSort(Node1,Node2) | function DefaultTreeViewSort(Node1, Node2: TTreeNode): Integer; |
| o.DropTarget = value<br>result = o.DropTarget | property DropTarget: TTreeNode read GetDropTarget write SetDropTarget; |
| o:EndUpdate() | procedure EndUpdate; |
| o.ExpandSignColor = value<br>result = o.ExpandSignColor | property ExpandSignColor: TColor read FExpandSignColor write FExpandSignColor default clWindowFrame; |
| o.ExpandSignSize = value<br>result = o.ExpandSignSize | property ExpandSignSize: integer read GetExpandSignSize write SetExpandSignSize stored ExpandSignSizeIsStored; |
| o.ExpandSignType = value<br>result = o.ExpandSignType | property ExpandSignType: TTreeViewExpandSignType read FExpandSignType write SetExpandSignType default tvestTheme; |
| o.ExpandSignWidth = value<br>result = o.ExpandSignWidth | property ExpandSignWidth: integer read FExpandSignWidth write SetExpandSignWidth default 2; |
| o:FullCollapse() | procedure FullCollapse; |
| o:FullExpand() | procedure FullExpand; |
| result = o:GetFirstMultiSelected() | function GetFirstMultiSelected: TTreeNode; |
| AnInsertMarkNode, AnInsertMarkType = o:GetInsertMarkAt(X,Y) | procedure GetInsertMarkAt(X, Y: Integer; out AnInsertMarkNode: TTreeNode; out AnInsertMarkType: TTreeViewInsertMarkType); |
| result = o:GetLastMultiSelected() | function GetLastMultiSelected: TTreeNode; |
| result = o:GetNodeAt(X,Y) | function GetNodeAt(X, Y: Integer): TTreeNode; |
| result = o:GetNodeWithExpandSignAt(X,Y) | function GetNodeWithExpandSignAt(X, Y: Integer): TTreeNode; |
| o.Images = value<br>result = o.Images | property Images: TCustomImageList read FImages write SetImages; |
| o.ImagesWidth = value<br>result = o.ImagesWidth | property ImagesWidth: Integer read FImagesWidth write SetImagesWidth default 0; |
| o.InsertMarkNode = value<br>result = o.InsertMarkNode | property InsertMarkNode: TTreeNode read FInsertMarkNode write SetInsertMarkNode; |
| o.InsertMarkType = value<br>result = o.InsertMarkType | property InsertMarkType: TTreeViewInsertMarkType read FInsertMarkType write SetInsertMarkType; |
| result = o:IsEditing() | function IsEditing: Boolean; |
| o.Items = value<br>result = o.Items | property Items: TTreeNodes read FTreeNodes write SetTreeNodes; |
| o.KeepCollapsedNodes = value<br>result = o.KeepCollapsedNodes | property KeepCollapsedNodes: boolean read GetKeepCollapsedNodes write SetKeepCollapsedNodes; |
| o:LoadFromFile(FileName) | procedure LoadFromFile(const FileName: string); |
| o:LoadFromStream(Stream) | procedure LoadFromStream(Stream: TStream); |
| o:LockSelectionChangeEvent() | procedure LockSelectionChangeEvent; |
| o:MakeSelectionVisible() | procedure MakeSelectionVisible; |
| o:MoveCollapse()<br>o:MoveCollapse(ASelect) | procedure MoveCollapse(ASelect: Boolean = False); |
| o:MoveEnd()<br>o:MoveEnd(ASelect) | procedure MoveEnd(ASelect: Boolean = False); |
| o:MoveExpand()<br>o:MoveExpand(ASelect) | procedure MoveExpand(ASelect: Boolean = False); |
| o:MoveHome()<br>o:MoveHome(ASelect) | procedure MoveHome(ASelect: Boolean = False); |
| o:MoveLeft()<br>o:MoveLeft(ASelect) | procedure MoveLeft(ASelect: Boolean = False); |
| o:MovePageDown()<br>o:MovePageDown(ASelect) | procedure MovePageDown(ASelect: Boolean = False); |
| o:MovePageUp()<br>o:MovePageUp(ASelect) | procedure MovePageUp(ASelect: Boolean = False); |
| o:MoveRight()<br>o:MoveRight(ASelect) | procedure MoveRight(ASelect: Boolean = False); |
| o:MoveToNextNode()<br>o:MoveToNextNode(ASelect) | procedure MoveToNextNode(ASelect: Boolean = False); |
| o:MoveToPrevNode()<br>o:MoveToPrevNode(ASelect) | procedure MoveToPrevNode(ASelect: Boolean = False); |
| o.MultiSelectStyle = value<br>result = o.MultiSelectStyle | property MultiSelectStyle: TMultiSelectStyle read FMultiSelectStyle write SetMultiSelectStyle default DefaultMultiSelectStyle; |
| o.OnAddition = function(Sender,Node) end | property OnAddition: TTVExpandedEvent read FOnAddition write FOnAddition; |
| o.OnAdvancedCustomDraw = function(Sender,ARect,Stage,DefaultDraw) return DefaultDraw end | property OnAdvancedCustomDraw: TTVAdvancedCustomDrawEvent read FOnAdvancedCustomDraw write FOnAdvancedCustomDraw; |
| o.OnAdvancedCustomDrawItem = function(Sender,Node,State,Stage,PaintImages,DefaultDraw) return PaintImages,DefaultDraw end | property OnAdvancedCustomDrawItem: TTVAdvancedCustomDrawItemEvent read FOnAdvancedCustomDrawItem write FOnAdvancedCustomDrawItem; |
| o.OnChange = function(Sender,Node) end | property OnChange: TTVChangedEvent read FOnChange write FOnChange; |
| o.OnChanging = function(Sender,Node,AllowChange) return AllowChange end | property OnChanging: TTVChangingEvent read FOnChanging write FOnChanging; |
| o.OnCollapsed = function(Sender,Node) end | property OnCollapsed: TTVExpandedEvent read FOnCollapsed write FOnCollapsed; |
| o.OnCollapsing = function(Sender,Node,AllowCollapse) return AllowCollapse end | property OnCollapsing: TTVCollapsingEvent read FOnCollapsing write FOnCollapsing; |
| o.OnCompare = function(Sender,Node1,Node2,Compare) return Compare end | property OnCompare: TTVCompareEvent read FOnCompare write FOnCompare; |
| o.OnCustomCreateItem = function(Sender,ATreeNode) return ATreeNode end | property OnCustomCreateItem: TTVCustomCreateNodeEvent read FOnCustomCreateItem write FOnCustomCreateItem; |
| o.OnCustomDraw = function(Sender,ARect,DefaultDraw) return DefaultDraw end | property OnCustomDraw: TTVCustomDrawEvent read FOnCustomDraw write FOnCustomDraw; |
| o.OnCustomDrawArrow = function(Sender,ARect,ACollapsed) end | property OnCustomDrawArrow: TTVCustomDrawArrowEvent read FOnCustomDrawArrow write FOnCustomDrawArrow; |
| o.OnCustomDrawItem = function(Sender,Node,State,DefaultDraw) return DefaultDraw end | property OnCustomDrawItem: TTVCustomDrawItemEvent read FOnCustomDrawItem write FOnCustomDrawItem; |
| o.OnDeletion = function(Sender,Node) end | property OnDeletion: TTVExpandedEvent read FOnDeletion write FOnDeletion; |
| o.OnEdited = function(Sender,Node,S) return S end | property OnEdited: TTVEditedEvent read FOnEdited write FOnEdited; |
| o.OnEditing = function(Sender,Node,AllowEdit) return AllowEdit end | property OnEditing: TTVEditingEvent read FOnEditing write FOnEditing; |
| o.OnEditingEnd = function(Sender,Node,Cancel) end | property OnEditingEnd: TTVEditingEndEvent read FOnEditingEnd write FOnEditingEnd; |
| o.OnExpanded = function(Sender,Node) end | property OnExpanded: TTVExpandedEvent read FOnExpanded write FOnExpanded; |
| o.OnExpanding = function(Sender,Node,AllowExpansion) return AllowExpansion end | property OnExpanding: TTVExpandingEvent read FOnExpanding write FOnExpanding; |
| o.OnGetImageIndex = function(Sender,Node) end | property OnGetImageIndex: TTVExpandedEvent read FOnGetImageIndex write FOnGetImageIndex; |
| o.OnGetSelectedIndex = function(Sender,Node) end | property OnGetSelectedIndex: TTVExpandedEvent read FOnGetSelectedIndex write FOnGetSelectedIndex; |
| o.OnNodeChanged = function(Sender,Node,ChangeReason) end | property OnNodeChanged: TTVNodeChangedEvent read FOnNodeChanged write FOnNodeChanged; |
| o.OnSelectionChanged = function(Sender) end | property OnSelectionChanged: TNotifyEvent read FOnSelectionChanged write FOnSelectionChanged; |
| o.Options = value<br>result = o.Options | property Options: TTreeViewOptions read FOptions write SetOptions default DefaultTreeViewOptions; |
| o:SaveToFile(FileName) | procedure SaveToFile(const FileName: string); |
| o:SaveToStream(Stream) | procedure SaveToStream(Stream: TStream); |
| o.ScrollBars = value<br>result = o.ScrollBars | property ScrollBars: TScrollStyle read FScrollBars write SetScrollBars default ssBoth; |
| o:Select(Node)<br>o:Select(Node,ShiftState) | procedure Select(Node: TTreeNode; ShiftState: TShiftState = []); |
| o:Select2(Nodes) | procedure Select(const Nodes: array of TTreeNode); virtual; |
| o.Selected = value<br>result = o.Selected | property Selected: TTreeNode read GetSelection write SetSelection; |
| o.SelectionColor = value<br>result = o.SelectionColor | property SelectionColor: TColor read FSelectedColor write SetSelectedColor default clHighlight; |
| result = o.SelectionCount | property SelectionCount: Cardinal read GetSelectionCount; |
| o.SelectionFontColor = value<br>result = o.SelectionFontColor | property SelectionFontColor: TColor read FSelectedFontColor write SetSelectedFontColor default clWhite; |
| o.SelectionFontColorUsed = value<br>result = o.SelectionFontColorUsed | property SelectionFontColorUsed: boolean read FSelectedFontColorUsed write FSelectedFontColorUsed default False; |
| result = o:SelectionVisible() | function SelectionVisible: boolean; |
| result = o:Selections(AIndex) | property Selections[AIndex: Integer]: TTreeNode read GetSelections; |
| o.SeparatorColor = value<br>result = o.SeparatorColor | property SeparatorColor: TColor read fSeparatorColor write SetSeparatorColor default clGray; |
| o:SetInsertMark(AnInsertMarkNode,AnInsertMarkType) | procedure SetInsertMark(AnInsertMarkNode: TTreeNode; AnInsertMarkType: TTreeViewInsertMarkType); |
| o:SetInsertMarkAt(X,Y) | procedure SetInsertMarkAt(X,Y: integer); virtual; |
| o.StateImages = value<br>result = o.StateImages | property StateImages: TCustomImageList read FStateImages write SetStateImages; |
| o.StateImagesWidth = value<br>result = o.StateImagesWidth | property StateImagesWidth: Integer read FStateImagesWidth write SetStateImagesWidth default 0; |
| result = o:StoreCurrentSelection() | function StoreCurrentSelection: TStringList; |
| o.TopItem = value<br>result = o.TopItem | property TopItem: TTreeNode read GetTopItem write SetTopItem; |
| o.TreeLineColor = value<br>result = o.TreeLineColor | property TreeLineColor: TColor read FTreeLineColor write FTreeLineColor default clWindowFrame; |
| o.TreeLinePenStyle = value<br>result = o.TreeLinePenStyle | property TreeLinePenStyle: TPenStyle read FTreeLinePenStyle write FTreeLinePenStyle default psPattern; |
| o:UnlockSelectionChangeEvent() | procedure UnlockSelectionChangeEvent; |
| o:WriteDebugReport(Prefix,AllNodes) | procedure WriteDebugReport(const Prefix: string; AllNodes: boolean); |


<a id="UpDown"></a>
### UpDown

#### Published properties
- `Align` : `Align`
- `AlignButton` : `UDAlignButton`
- `AnchorSideBottom` : `AnchorSide`
- `AnchorSideLeft` : `AnchorSide`
- `AnchorSideRight` : `AnchorSide`
- `AnchorSideTop` : `AnchorSide`
- `Anchors` : `Anchors`
- `ArrowKeys` : `Boolean`
- `Associate` : `WinControl`
- `BorderSpacing` : `ControlBorderSpacing`
- `Color` : `GraphicsColor`
- `Constraints` : `SizeConstraints`
- `Cursor` : `Cursor`
- `Enabled` : `Boolean`
- `Flat` : `Boolean`
- `Height` : `LongInt`
- `HelpContext` : `HelpContext`
- `HelpKeyword` : `AnsiString`
- `HelpType` : `HelpType`
- `Hint` : `TranslateString`
- `Increment` : `LongInt`
- `Left` : `LongInt`
- `Max` : `SmallInt`
- `Min` : `SmallInt`
- `MinRepeatInterval` : `Byte`
- `Name` : `AnsiString`
- `OnChanging` : `UDChangingEvent`
- `OnChangingEx` : `UDChangingEventEx`
- `OnClick` : `UDClickEvent`
- `OnContextPopup` : `ContextPopupEvent`
- `OnEnter` : `NotifyEvent`
- `OnExit` : `NotifyEvent`
- `OnMouseDown` : `MouseEvent`
- `OnMouseEnter` : `NotifyEvent`
- `OnMouseLeave` : `NotifyEvent`
- `OnMouseMove` : `MouseMoveEvent`
- `OnMouseUp` : `MouseEvent`
- `OnMouseWheel` : `MouseWheelEvent`
- `OnMouseWheelDown` : `MouseWheelUpDownEvent`
- `OnMouseWheelHorz` : `MouseWheelEvent`
- `OnMouseWheelLeft` : `MouseWheelUpDownEvent`
- `OnMouseWheelRight` : `MouseWheelUpDownEvent`
- `OnMouseWheelUp` : `MouseWheelUpDownEvent`
- `Orientation` : `UDOrientation`
- `ParentColor` : `Boolean`
- `ParentShowHint` : `Boolean`
- `PopupMenu` : `PopupMenu`
- `Position` : `SmallInt`
- `ShowHint` : `Boolean`
- `TabOrder` : `TabOrder`
- `TabStop` : `Boolean`
- `Tag` : `Int64`
- `Thousands` : `Boolean`
- `Top` : `LongInt`
- `Visible` : `Boolean`
- `Width` : `LongInt`
- `Wrap` : `Boolean`

<a id="ValueListEditor"></a>
### ValueListEditor

#### Published properties
- `Align` : `Align`
- `AlternateColor` : `GraphicsColor`
- `AnchorSideBottom` : `AnchorSide`
- `AnchorSideLeft` : `AnchorSide`
- `AnchorSideRight` : `AnchorSide`
- `AnchorSideTop` : `AnchorSide`
- `Anchors` : `Anchors`
- `AutoAdvance` : `AutoAdvance`
- `AutoEdit` : `Boolean`
- `BiDiMode` : `BiDiMode`
- `BorderSpacing` : `ControlBorderSpacing`
- `BorderStyle` : `BorderStyle`
- `Color` : `GraphicsColor`
- `Constraints` : `SizeConstraints`
- `Cursor` : `Cursor`
- `DefaultColWidth` : `LongInt`
- `DefaultDrawing` : `Boolean`
- `DefaultRowHeight` : `LongInt`
- `DisplayOptions` : `DisplayOptions`
- `DoubleBuffered` : `Boolean`
- `DragCursor` : `Cursor`
- `DragKind` : `DragKind`
- `DragMode` : `DragMode`
- `DropDownRows` : `LongInt`
- `Enabled` : `Boolean`
- `ExtendedSelect` : `Boolean`
- `FixedColor` : `GraphicsColor`
- `FixedCols` : `LongInt`
- `Flat` : `Boolean`
- `Font` : `Font`
- `GridLineWidth` : `LongInt`
- `HeaderHotZones` : `GridZoneSet`
- `HeaderPushZones` : `GridZoneSet`
- `Height` : `LongInt`
- `HelpContext` : `HelpContext`
- `HelpKeyword` : `AnsiString`
- `HelpType` : `HelpType`
- `Hint` : `TranslateString`
- `KeyOptions` : `KeyOptions`
- `Left` : `LongInt`
- `MouseWheelOption` : `MouseWheelOption`
- `Name` : `AnsiString`
- `OnBeforeSelection` : `OnSelectEvent`
- `OnButtonClick` : `OnSelectEvent`
- `OnChangeBounds` : `NotifyEvent`
- `OnCheckboxToggled` : `ToggledCheckboxEvent`
- `OnClick` : `NotifyEvent`
- `OnColRowDeleted` : `GridOperationEvent`
- `OnColRowExchanged` : `GridOperationEvent`
- `OnColRowInserted` : `GridOperationEvent`
- `OnColRowMoved` : `GridOperationEvent`
- `OnCompareCells` : `OnCompareCells`
- `OnContextPopup` : `ContextPopupEvent`
- `OnDblClick` : `NotifyEvent`
- `OnDragDrop` : `DragDropEvent`
- `OnDragOver` : `DragOverEvent`
- `OnDrawCell` : `OnDrawCell`
- `OnEditButtonClick` : `NotifyEvent`
- `OnEditingDone` : `NotifyEvent`
- `OnEndDock` : `EndDragEvent`
- `OnEndDrag` : `EndDragEvent`
- `OnEnter` : `NotifyEvent`
- `OnExit` : `NotifyEvent`
- `OnGetEditMask` : `GetEditEvent`
- `OnGetEditText` : `GetEditEvent`
- `OnGetPickList` : `GetPickListEvent`
- `OnHeaderClick` : `HdrEvent`
- `OnHeaderSized` : `HdrEvent`
- `OnHeaderSizing` : `HeaderSizingEvent`
- `OnKeyDown` : `KeyEvent`
- `OnKeyPress` : `KeyPressEvent`
- `OnKeyUp` : `KeyEvent`
- `OnMouseDown` : `MouseEvent`
- `OnMouseEnter` : `NotifyEvent`
- `OnMouseLeave` : `NotifyEvent`
- `OnMouseMove` : `MouseMoveEvent`
- `OnMouseUp` : `MouseEvent`
- `OnMouseWheel` : `MouseWheelEvent`
- `OnMouseWheelDown` : `MouseWheelUpDownEvent`
- `OnMouseWheelHorz` : `MouseWheelEvent`
- `OnMouseWheelLeft` : `MouseWheelUpDownEvent`
- `OnMouseWheelRight` : `MouseWheelUpDownEvent`
- `OnMouseWheelUp` : `MouseWheelUpDownEvent`
- `OnPickListSelect` : `NotifyEvent`
- `OnPrepareCanvas` : `OnPrepareCanvasEvent`
- `OnResize` : `NotifyEvent`
- `OnSelectCell` : `OnSelectCellEvent`
- `OnSelectEditor` : `SelectEditorEvent`
- `OnSelection` : `OnSelectEvent`
- `OnSetEditText` : `SetEditEvent`
- `OnShowHint` : `ControlShowHintEvent`
- `OnStartDock` : `StartDockEvent`
- `OnStartDrag` : `StartDragEvent`
- `OnStringsChange` : `NotifyEvent`
- `OnStringsChanging` : `NotifyEvent`
- `OnTopLeftChanged` : `NotifyEvent`
- `OnUTF8KeyPress` : `UTF8KeyPressEvent`
- `OnUserCheckboxBitmap` : `UserCheckBoxBitmapEvent`
- `OnValidate` : `OnValidateEvent`
- `OnValidateEntry` : `ValidateEntryEvent`
- `Options` : `GridOptions`
- `ParentBiDiMode` : `Boolean`
- `ParentColor` : `Boolean`
- `ParentFont` : `Boolean`
- `ParentShowHint` : `Boolean`
- `PopupMenu` : `PopupMenu`
- `RowCount` : `LongInt`
- `ScrollBars` : `ScrollStyle`
- `ShowHint` : `Boolean`
- `Strings` : `ValueListStrings`
- `TabOrder` : `TabOrder`
- `TabStop` : `Boolean`
- `Tag` : `Int64`
- `TitleCaptions` : `Strings`
- `TitleFont` : `Font`
- `TitleImageList` : `ImageList`
- `TitleStyle` : `TitleStyle`
- `Top` : `LongInt`
- `UseXORFeatures` : `Boolean`
- `Visible` : `Boolean`
- `VisibleColCount` : `LongInt`
- `VisibleRowCount` : `LongInt`
- `Width` : `LongInt`

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| o:Clear() | procedure Clear; |
| o:DeleteColRow(IsColumn,index) | procedure DeleteColRow(IsColumn: Boolean; index: Integer); |
| result, aRow = o:FindRow(KeyName) | function FindRow(const KeyName: string; out aRow: Integer): Boolean; |
| o:InsertColRow(IsColumn,index) | procedure InsertColRow(IsColumn: boolean; index: integer); |
| result = o:InsertRow(KeyName,Value,Append) | function InsertRow(const KeyName, Value: string; Append: Boolean): Integer; |
| o:InsertRowWithValues(Index,Values) | procedure InsertRowWithValues(Index: Integer; Values: array of String); |
| result = o:IsEmptyRow() | function IsEmptyRow: Boolean; |
| result = o:IsEmptyRow2(aRow) | function IsEmptyRow(aRow: Integer): Boolean; |
| result = o:Keys(Index)<br>o:Keys(Index,value) | property Keys[Index: Integer]: string read GetKey write SetKey; |
| o:MoveColRow(IsColumn,FromIndex,ToIndex) | procedure MoveColRow(IsColumn: Boolean; FromIndex, ToIndex: Integer); |
| result = o:RestoreCurrentRow() | function RestoreCurrentRow: Boolean; |
| o:Sort(Index,IndxFrom,IndxTo) | procedure Sort(Index, IndxFrom, IndxTo: Integer); |
| o:Sort2()<br>o:Sort2(ACol) | procedure Sort(ACol: TVleSortCol = colKey); |
| result = o:Values(Key)<br>o:Values(Key,value) | property Values[const Key: string]: string read GetValue write SetValue; |


<a id="WinControl"></a>
### WinControl

#### Published properties
- `AnchorSideBottom` : `AnchorSide`
- `AnchorSideLeft` : `AnchorSide`
- `AnchorSideRight` : `AnchorSide`
- `AnchorSideTop` : `AnchorSide`
- `Cursor` : `Cursor`
- `Height` : `LongInt`
- `HelpContext` : `HelpContext`
- `HelpKeyword` : `AnsiString`
- `HelpType` : `HelpType`
- `Hint` : `TranslateString`
- `Left` : `LongInt`
- `Name` : `AnsiString`
- `Tag` : `Int64`
- `Top` : `LongInt`
- `Width` : `LongInt`

#### Generated
| Lua examples | FP declaration |
| --- | --- |
| o:AddControl() | procedure AddControl; virtual; |
| o:AutoAdjustLayout(AMode,AFromPPI,AToPPI,AOldFormWidth,ANewFormWidth) | procedure AutoAdjustLayout(AMode: TLayoutAdjustmentPolicy; const AFromPPI, AToPPI, AOldFormWidth, ANewFormWidth: Integer); override; |
| o:BeginUpdateBounds() | procedure BeginUpdateBounds; |
| o.BorderWidth = value<br>result = o.BorderWidth | property BorderWidth: TBorderWidth read FBorderWidth write SetBorderWidth default 0; |
| result = o.BoundsLockCount | property BoundsLockCount: Integer read FBoundsLockCount; |
| ToAllMessage = o:BroadCast() | procedure BroadCast(var ToAllMessage); |
| ToAllMessage = o:BroadCast2(ToAllMessage) | procedure BroadCast(var ToAllMessage); |
| result = o.Brush | property Brush: TBrush read GetBrush; |
| result = o:BrushCreated() | function BrushCreated: Boolean; |
| result = o.CachedClientHeight | property CachedClientHeight: Integer read FClientHeight; |
| result = o.CachedClientWidth | property CachedClientWidth: Integer read FClientWidth; |
| result = o:CanFocus() | function CanFocus: Boolean; virtual; |
| result = o:CanSetFocus() | function CanSetFocus: Boolean; virtual; |
| o.ChildSizing = value<br>result = o.ChildSizing | property ChildSizing: TControlChildSizing read FChildSizing write SetChildSizing; |
| result = o:ClientRectNeedsInterfaceUpdate() | function ClientRectNeedsInterfaceUpdate: Boolean; |
| result = o:ContainsControl(Control) | function  ContainsControl(Control: TControl): Boolean; |
| result = o:ControlAtPos(Pos,AllowDisabled) | function ControlAtPos(const Pos: TPoint; AllowDisabled: Boolean): TControl; |
| result = o:ControlAtPos2(Pos,AllowDisabled,AllowWinControls) | function ControlAtPos(const Pos: TPoint; AllowDisabled, AllowWinControls: Boolean): TControl; |
| result = o:ControlAtPos3(Pos,Flags) | function ControlAtPos(const Pos: TPoint; Flags: TControlAtPosFlags): TControl; virtual; |
| result = o.ControlCount | property ControlCount: Integer read GetControlCount; |
| result = o:Controls(Index) | property Controls[Index: Integer]: TControl read GetControl; |
| result = o:CreateParentedControl(AParentWindow) | class function CreateParentedControl(AParentWindow: HWND): TWinControl; |
| o.DefWndProc = value<br>result = o.DefWndProc | property DefWndProc: Pointer read FDefWndProc write FDefWndPRoc; |
| AMessage = o:DefaultHandler() | procedure DefaultHandler(var AMessage); override; |
| AMessage = o:DefaultHandler2(AMessage) | procedure DefaultHandler(var AMessage); override; |
| o.DesignerDeleting = value | property DesignerDeleting: Boolean write SetDesignerDeleting; |
| o:DisableAlign() | procedure DisableAlign; |
| o:DoAdjustClientRectChange()<br>o:DoAdjustClientRectChange(InvalidateRect) | procedure DoAdjustClientRectChange(const InvalidateRect: Boolean = True); |
| result = o.DockClientCount | property DockClientCount: Integer read GetDockClientCount; |
| result = o:DockClients(Index) | property DockClients[Index: Integer]: TControl read GetDockClients; |
| o:DockDrop(DragDockObject,X,Y) | procedure DockDrop(DragDockObject: TDragDockObject; X, Y: Integer); virtual; |
| o.DockManager = value<br>result = o.DockManager | property DockManager: TDockManager read FDockManager write SetDockManager; |
| o.DockSite = value<br>result = o.DockSite | property DockSite: Boolean read FDockSite write SetDockSite default False; |
| o.DoubleBuffered = value<br>result = o.DoubleBuffered | property DoubleBuffered: Boolean read FDoubleBuffered write SetDoubleBuffered stored DoubleBufferedIsStored; |
| o:EnableAlign() | procedure EnableAlign; |
| o:EndUpdateBounds() | procedure EndUpdateBounds; |
| result = o:FindChildControl(ControlName) | function FindChildControl(const ControlName: string): TControl; |
| o:FixDesignFontsPPIWithChildren(ADesignTimePPI) | procedure FixDesignFontsPPIWithChildren(const ADesignTimePPI: Integer); |
| o:FlipChildren(AllLevels) | procedure FlipChildren(AllLevels: Boolean); virtual; |
| result = o:Focused() | function Focused: Boolean; virtual; |
| result = o:GetControlIndex(AControl) | function GetControlIndex(AControl: TControl): Integer; |
| result = o:GetDockCaption(AControl) | function GetDockCaption(AControl: TControl): string; virtual; |
| o:GetTabOrderList(List) | procedure GetTabOrderList(List: TFPList); virtual; |
| o.Handle = value<br>result = o.Handle | property Handle: HWND read GetHandle write SetHandle; |
| result = o:HandleAllocated() | function HandleAllocated: Boolean; |
| o:HandleNeeded() | procedure HandleNeeded; |
| o:InsertControl(AControl) | procedure InsertControl(AControl: TControl); |
| o:InsertControl2(AControl,Index) | procedure InsertControl(AControl: TControl; Index: Integer); virtual; |
| result = o:IntfGetDropFilesTarget() | function IntfGetDropFilesTarget: TWinControl; virtual; |
| result, UTF8Key = o:IntfUTF8KeyPress(RepeatCount,SystemKey) | function IntfUTF8KeyPress(var UTF8Key: TUTF8Char; RepeatCount: Integer; SystemKey: Boolean): Boolean; virtual; |
| result, UTF8Key = o:IntfUTF8KeyPress2(UTF8Key,RepeatCount,SystemKey) | function IntfUTF8KeyPress(var UTF8Key: TUTF8Char; RepeatCount: Integer; SystemKey: Boolean): Boolean; virtual; |
| o:InvalidateClientRectCache(WithChildControls) | procedure InvalidateClientRectCache(WithChildControls: Boolean); |
| result = o.IsFlipped | property IsFlipped: Boolean read FFlipped; |
| result = o.IsResizing | property IsResizing: Boolean read GetIsResizing; |
| result = o.IsSpecialSubControl | property IsSpecialSubControl: Boolean read GetIsSpecialSubControl; |
| o:LockRealizeBounds() | procedure LockRealizeBounds; |
| o:NotifyControls(Msg) | procedure NotifyControls(Msg: Word); |
| o.OnDockDrop = function(Sender,Source,X,Y) end | property OnDockDrop: TDockDropEvent read FOnDockDrop write FOnDockDrop; |
| o.OnDockOver = function(Sender,Source,X,Y,State,Accept) return Accept end | property OnDockOver: TDockOverEvent read FOnDockOver write FOnDockOver; |
| o.OnEnter = function(Sender) end | property OnEnter: TNotifyEvent read FOnEnter write FOnEnter; |
| o.OnExit = function(Sender) end | property OnExit: TNotifyEvent read FOnExit write FOnExit; |
| o.OnGetDockCaption = function(Sender,AControl,ACaption) return ACaption end | property OnGetDockCaption: TGetDockCaptionEvent read FOnGetDockCaption write FOnGetDockCaption; |
| o.OnGetSiteInfo = function(Sender,DockClient,InfluenceRect,MousePos,CanDock) return InfluenceRect,CanDock end | property OnGetSiteInfo: TGetSiteInfoEvent read FOnGetSiteInfo write FOnGetSiteInfo; |
| o.OnKeyDown = function(Sender,Key,Shift) return Key end | property OnKeyDown: TKeyEvent read FOnKeyDown write FOnKeyDown; |
| o.OnKeyPress = function(Sender,Key) return Key end | property OnKeyPress: TKeyPressEvent read FOnKeyPress write FOnKeyPress; |
| o.OnKeyUp = function(Sender,Key,Shift) return Key end | property OnKeyUp: TKeyEvent read FOnKeyUp write FOnKeyUp; |
| o.OnUTF8KeyPress = function(Sender,UTF8Key) return UTF8Key end | property OnUTF8KeyPress: TUTF8KeyPressEvent read FOnUTF8KeyPress write FOnUTF8KeyPress; |
| o.OnUnDock = function(Sender,Client,NewTarget,Allow) return Allow end | property OnUnDock: TUnDockEvent read FOnUnDock write FOnUnDock; |
| o:PaintTo(ACanvas,X,Y) | procedure PaintTo(ACanvas: TCanvas; X, Y: Integer); overload; |
| o.ParentDoubleBuffered = value<br>result = o.ParentDoubleBuffered | property ParentDoubleBuffered: Boolean read FParentDoubleBuffered write SetParentDoubleBuffered default True; |
| o.ParentWindow = value<br>result = o.ParentWindow | property ParentWindow: HWND read FParentWindow write SetParentWindow; |
| result = o:PerformTab(ForwardTab) | function PerformTab(ForwardTab: Boolean): Boolean; virtual; |
| o:ReAlign() | procedure ReAlign; |
| o:RemoveControl(AControl) | procedure RemoveControl(AControl: TControl); virtual; |
| o:ScaleBy(Multiplier,Divider) | procedure ScaleBy(Multiplier, Divider: Integer); |
| o:ScrollBy(DeltaX,DeltaY) | procedure ScrollBy_WS(DeltaX, DeltaY: Integer); |
| o:ScrollBy2(DeltaX,DeltaY) | procedure ScrollBy(DeltaX, DeltaY: Integer); virtual; |
| o:SelectNext(CurControl,GoForward,CheckTabStop) | procedure SelectNext(CurControl: TWinControl; GoForward, CheckTabStop: Boolean); |
| o:SetControlIndex(AControl,NewIndex) | procedure SetControlIndex(AControl: TControl; NewIndex: Integer); |
| o:SetFocus() | procedure SetFocus; virtual; |
| o:SetShape(AShape) | procedure SetShape(AShape: TBitmap); overload; |
| o:SetShape2(AShape) | procedure SetShape(AShape: TRegion); overload; |
| result = o.Showing | property Showing: Boolean read FShowing; |
| o.TabOrder = value<br>result = o.TabOrder | property TabOrder: TTabOrder read GetTabOrder write SetTabOrder default -1; |
| o.TabStop = value<br>result = o.TabStop | property TabStop: Boolean read FTabStop write SetTabStop default false; |
| o:UnlockRealizeBounds() | procedure UnlockRealizeBounds; |
| o:UpdateDockCaption()<br>o:UpdateDockCaption(Exclude) | procedure UpdateDockCaption(Exclude: TControl = nil); virtual; |
| o.UseDockManager = value<br>result = o.UseDockManager | property UseDockManager: Boolean read FUseDockManager write SetUseDockManager default False; |
| result = o.VisibleDockClientCount | property VisibleDockClientCount: Integer read GetVisibleDockClientCount; |
| o:WriteLayoutDebugReport(Prefix) | procedure WriteLayoutDebugReport(const Prefix: string); override; |

