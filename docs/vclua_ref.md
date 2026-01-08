
## VCLua Class Reference


### version 1.0.0


## Action


## ActionList


## AliasStrings


## Application


## Arrow


## BasicAction


## Bevel


## BitBtn


## Bitmap


## BoundLabel


## Brush


## Button


## CalcEdit


## Calendar


## Canvas


## CheckBox


## CheckGroup


## CheckListBox


## Collection


## CollectionItem


## CollectionPropertyEditor


## CollectionPropertyEditorForm


## ColorBox


## ColorButton


## ColorDialog


## ColorListBox


## ComboBox


## CommonDialog


## Component


## ContainedAction


## Control


## ControlChildSizing


## CoolBar


## CustomAbstractGroupedEdit


## CustomApplication


## CustomBitmap


## CustomControl


## CustomForm


## CustomGrid


## CustomMemoryStream


## CustomPage


## CustomPropertiesGrid


## CustomTabControl


## DateEdit


## DateTimePicker


## DirectoryEdit


## DockManager


## DockTree


## DockZone


## DragControlObject


## DragControlObjectEx


## DragDockObject


## DragDockObjectEx


## DragObject


## DrawGrid


## Edit


## EditButton


## Exception


## FPCustomFont


## FileDialog


## FileNameEdit


## FindDialog


## FloatSpinEdit


## Font


## FontDialog


## Form


## Graphic


## GraphicControl


## GridColumn


## GridColumns


## GroupBox


## HeaderControl


## IdleTimer


## Image


## ImageList


## Label


## LabeledEdit


## ListBox


## ListItem


## ListItems


## ListView


## MainMenu


## MaskEdit


## Memo


## MemoryStream


## Menu


## MenuItem


## Monitor


## Notebook


## OICustomPropertyGrid


## OIFavoriteProperties


## OIFavoriteProperty


## OIPropertyGridRow


## OIRestrictedProperty


## OpenDialog


## PageControl


## PaintBox


## Panel


## Pen


## Persistent


## Picture


## PopupMenu


## PopupNotifier


## ProgressBar


## PropertyEditor


## PropertyEditorHook


## RadioButton


## RadioGroup


## RasterImage


## ReplaceDialog


## SaveDialog


## Screen


## ScrollBox


## SelectDirectoryDialog


## Shape


## SpeedButton


## SpinEdit


## Splitter


## StaticText


## StatusBar


## StatusPanel


## StatusPanels


## Stream


## StringGrid


## StringList


## Strings


## TIGrid


## TIGridProperty


## TIPropertyGrid


## TabControl


## TabSheet


## TextStrings


## TimeEdit


## Timer


## ToggleBox


## ToolBar


## ToolButton


## ToolWindow


## TrackBar


## TrayIcon


## TreeNode


## TreeNodes


## TreeView


## UpDown


## ValueListEditor


## WinControl


## Action


## ActionList


## AliasStrings


## Application


## Arrow


## BasicAction


## Bevel


## BitBtn


## Bitmap


## BoundLabel


## Brush


## Button


## CalcEdit


## Calendar


## Canvas


## CheckBox


## CheckGroup


## CheckListBox


## Collection


## CollectionItem


## CollectionPropertyEditor


## CollectionPropertyEditorForm


## ColorBox


## ColorButton


## ColorDialog


## ColorListBox


## ComboBox


## CommonDialog


## Component


## ContainedAction


## Control


## ControlChildSizing


## CoolBar


## CustomAbstractGroupedEdit


## CustomApplication


## CustomBitmap


## CustomControl


## CustomForm


## CustomGrid


## CustomMemoryStream


## CustomPage


## CustomPropertiesGrid


## CustomTabControl


## DateEdit


## DateTimePicker


## DirectoryEdit


## DockManager


## DockTree


## DockZone


## DragControlObject


## DragControlObjectEx


## DragDockObject


## DragDockObjectEx


## DragObject


## DrawGrid


## Edit


## EditButton


## Exception


## FPCustomFont


## FileDialog


## FileNameEdit


## FindDialog


## FloatSpinEdit


## Font


## FontDialog


## Form


## Graphic


## GraphicControl


## GridColumn


## GridColumns


## GroupBox


## HeaderControl


## IdleTimer


## Image


## ImageList


## Label


## LabeledEdit


## ListBox


## ListItem


## ListItems


## ListView


## MainMenu


## MaskEdit


## Memo


## MemoryStream


## Menu


## MenuItem


## Monitor


## Notebook


## OICustomPropertyGrid


## OIFavoriteProperties


## OIFavoriteProperty


## OIPropertyGridRow


## OIRestrictedProperty


## OpenDialog


## PageControl


## PaintBox


## Panel


## Pen


## Persistent


## Picture


## PopupMenu


## PopupNotifier


## ProgressBar


## PropertyEditor


## PropertyEditorHook


## RadioButton


## RadioGroup


## RasterImage


## ReplaceDialog


## SaveDialog


## Screen


## ScrollBox


## SelectDirectoryDialog


## Shape


## SpeedButton


## SpinEdit


## Splitter


## StaticText


## StatusBar


## StatusPanel


## StatusPanels


## Stream


## StringGrid


## StringList


## Strings


## TIGrid


## TIGridProperty


## TIPropertyGrid


## TabControl


## TabSheet


## TextStrings


## TimeEdit


## Timer


## ToggleBox


## ToolBar


## ToolButton


## ToolWindow


## TrackBar


## TrayIcon


## TreeNode


## TreeNodes


## TreeView


## UpDown


## ValueListEditor


## WinControl

| Lua examples | FP declaration |
| --- | --- |
| o.AutoCheck = value
result = o.AutoCheck | property AutoCheck: Boolean read FAutoCheck write SetAutoCheck default False; |
| o.Caption = value
result = o.Caption | property Caption: TTranslateString read FCaption write SetCaption; |
| o.Checked = value
result = o.Checked | property Checked: Boolean read FChecked write SetChecked default False; |
| o.DisableIfNoHandler = value
result = o.DisableIfNoHandler | property DisableIfNoHandler: Boolean read FDisableIfNoHandler write FDisableIfNoHandler default False; |
| result, HintStr = o:DoHint() | function DoHint(var HintStr: string): Boolean; virtual; |
| result, HintStr = o:DoHint2(HintStr) | function DoHint(var HintStr: string): Boolean; virtual; |
| o.Enabled = value
result = o.Enabled | property Enabled: Boolean read FEnabled write SetEnabled default True; |
| o.Grayed = value
result = o.Grayed | property Grayed: Boolean read FGrayed write FGrayed; |
| o.GroupIndex = value
result = o.GroupIndex | property GroupIndex: Integer read FGroupIndex write SetGroupIndex default 0; |
| o.HelpContext = value
result = o.HelpContext | property HelpContext: THelpContext read FHelpContext write SetHelpContext default 0; |
| o.HelpKeyword = value
result = o.HelpKeyword | property HelpKeyword: string read FHelpKeyword write SetHelpKeyword; |
| o.HelpType = value
result = o.HelpType | property HelpType: THelpType read FHelpType write SetHelpType default htContext; |
| o.Hint = value
result = o.Hint | property Hint: TTranslateString read FHint write SetHint; |
| o.ImageIndex = value
result = o.ImageIndex | property ImageIndex: TImageIndex read FImageIndex write SetImageIndex default -1; |
| o.OnHint = function(HintStr,CanShow) return HintStr,CanShow end | property OnHint: THintEvent read FOnHint write FOnHint; |
| o.SecondaryShortCuts = value
result = o.SecondaryShortCuts | property SecondaryShortCuts: TShortCutList read GetSecondaryShortCuts write SetSecondaryShortCuts stored IsSecondaryShortCutsStored; |
| o.ShortCut = value
result = o.ShortCut | property ShortCut: TShortCut read FShortCut write SetShortCut default 0; |
| o.Visible = value
result = o.Visible | property Visible: Boolean read FVisible write SetVisible default True; |

| Lua examples | FP declaration |
| --- | --- |
| result = o:ActionByName(ActionName) | function ActionByName(const ActionName: string): TContainedAction; |
| result = o.ActionCount | property ActionCount: Integer read GetActionCount; |
| result = o:Actions(Index)
o:Actions(Index,value) | property Actions[Index: Integer]: TContainedAction read GetAction write SetAction; default; |
| result = o:ExecuteAction(Action) | function ExecuteAction(Action: TBasicAction): Boolean; override; |
| o.Images = value
result = o.Images | property Images: TCustomImageList read FImages write SetImages; |
| result = o:IndexOfName(ActionName) | function IndexOfName(const ActionName: string): integer; |
| o.OnChange = function(Sender) end | property OnChange: TNotifyEvent read FOnChange write FOnChange; |
| o.OnExecute = function(AAction,Handled) return Handled end | property OnExecute: TActionEvent read FOnExecute write FOnExecute; |
| o.OnUpdate = function(AAction,Handled) return Handled end | property OnUpdate: TActionEvent read FOnUpdate write FOnUpdate; |
| o.State = value
result = o.State | property State: TActionListState read FState write SetState default asNormal; |
| result = o:UpdateAction(Action) | function UpdateAction(Action: TBasicAction): Boolean; override; |

| Lua examples | FP declaration |
| --- | --- |
| result = o:AliasToValue(Alias) | function AliasToValue(const Alias: string): string; virtual; |
| result = o:IndexOfValue(AValue) | function IndexOfValue(const AValue: string): integer; virtual; |
| result = o:ValueAt(Index) | function ValueAt(Index: integer): string; virtual; |
| result = o:ValueToAlias(AValue) | function ValueToAlias(const AValue: string): string; virtual; |

| Lua examples | FP declaration |
| --- | --- |
| result = VCL.TheApplication() | Application: TApplication |

| Lua examples | FP declaration |
| --- | --- |
| o:ActivateHint(CursorPos)
o:ActivateHint(CursorPos,CheckHintControlChange) | procedure ActivateHint(CursorPos: TPoint; CheckHintControlChange: Boolean = False); |
| result = o.Active | property Active: Boolean read GetActive; |
| o.ApplicationType = value
result = o.ApplicationType | property ApplicationType : TApplicationType read FApplicationType write FApplicationType; |
| o.BidiMode = value
result = o.BidiMode | property BidiMode: TBiDiMode read FBidiMode write SetBidiMode; |
| result = o:BigIconHandle() | function BigIconHandle: HIcon; |
| o:BringToFront() | procedure BringToFront; |
| o.CaptureExceptions = value
result = o.CaptureExceptions | property CaptureExceptions: Boolean read FCaptureExceptions write SetCaptureExceptions; |
| o:ControlDestroyed(AControl) | procedure ControlDestroyed(AControl: TControl); |
| o.DoubleBuffered = value
result = o.DoubleBuffered | property DoubleBuffered: TApplicationDoubleBuffered read FDoubleBuffered write FDoubleBuffered default adbDefault; platform; |
| o.ExceptionDialog = value
result = o.ExceptionDialog | property ExceptionDialog: TApplicationExceptionDlg read FExceptionDialog write FExceptionDialog; |
| o.ExtendedKeysSupport = value
result = o.ExtendedKeysSupport | property ExtendedKeysSupport: Boolean read FExtendedKeysSupport write FExtendedKeysSupport; |
| o.FindGlobalComponentEnabled = value
result = o.FindGlobalComponentEnabled | property FindGlobalComponentEnabled: Boolean read FFindGlobalComponentEnabled write FFindGlobalComponentEnabled; |
| o.Flags = value
result = o.Flags | property Flags: TApplicationFlags read FFlags write SetFlags; |
| result = o:GetControlAtMouse() | function GetControlAtMouse: TControl; |
| result = o:GetControlAtPos(P) | function GetControlAtPos(P: TPoint): TControl; |
| o.Handle = value
result = o.Handle | property Handle: THandle read GetHandle write SetHandle; platform; |
| o:HandleMessage() | procedure HandleMessage; |
| result = o:HelpShowTableOfContents() | function HelpShowTableOfContents: Boolean; |
| o.Hint = value
result = o.Hint | property Hint: string read FHint write SetHint; |
| o.HintColor = value
result = o.HintColor | property HintColor: TColor read FHintColor write SetHintColor; |
| o.HintHidePause = value
result = o.HintHidePause | property HintHidePause: Integer read FHintHidePause write FHintHidePause; |
| o.HintHidePausePerChar = value
result = o.HintHidePausePerChar | property HintHidePausePerChar: Integer read FHintHidePausePerChar write FHintHidePausePerChar; |
| o.HintPause = value
result = o.HintPause | property HintPause: Integer read FHintPause write FHintPause; |
| o.HintShortCuts = value
result = o.HintShortCuts | property HintShortCuts: Boolean read FHintShortCuts write FHintShortCuts; |
| o.HintShortPause = value
result = o.HintShortPause | property HintShortPause: Integer read FHintShortPause write FHintShortPause; |
| o.Icon = value
result = o.Icon | property Icon: TIcon read FIcon write SetIcon; |
| o:Idle(Wait) | procedure Idle(Wait: Boolean); |
| result = o:IsWaiting() | function IsWaiting: Boolean; |
| o.LayoutAdjustmentPolicy = value
result = o.LayoutAdjustmentPolicy | property LayoutAdjustmentPolicy: TLayoutAdjustmentPolicy read FLayoutAdjustmentPolicy write FLayoutAdjustmentPolicy; |
| result = o.MainForm | property MainForm: TForm read FMainForm; |
| result = o.MainFormHandle | property MainFormHandle: HWND read GetMainFormHandle; |
| o.MainFormOnTaskBar = value
result = o.MainFormOnTaskBar | property MainFormOnTaskBar: Boolean read FMainFormOnTaskBar write SetMainFormOnTaskBar; platform; |
| o:Minimize() | procedure Minimize; |
| o:ModalFinished() | procedure ModalFinished; |
| result = o.ModalLevel | property ModalLevel: Integer read FModalLevel; |
| o:ModalStarted() | procedure ModalStarted; |
| result = o.MouseControl | property MouseControl: TControl read FMouseControl; |
| o.MoveFormFocusToChildren = value
result = o.MoveFormFocusToChildren | property MoveFormFocusToChildren: Boolean read FMoveFormFocusToChildren write FMoveFormFocusToChildren default True; |
| o.Navigation = value
result = o.Navigation | property Navigation: TApplicationNavigationOptions read FNavigation write SetNavigation; |
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
| o:RemoveStayOnTop()
o:RemoveStayOnTop(ASystemTopAlso) | procedure RemoveStayOnTop(const ASystemTopAlso: Boolean = False); |
| o:Restore() | procedure Restore; |
| o:RestoreStayOnTop()
o:RestoreStayOnTop(ASystemTopAlso) | procedure RestoreStayOnTop(const ASystemTopAlso: Boolean = False); |
| o:Run() | procedure Run; |
| o.Scaled = value
result = o.Scaled | property Scaled: Boolean read FScaled write FScaled; |
| o.ShowButtonGlyphs = value
result = o.ShowButtonGlyphs | property ShowButtonGlyphs: TApplicationShowGlyphs read FShowButtonGlyphs write SetShowButtonGlyphs default sbgAlways; |
| o.ShowHint = value
result = o.ShowHint | property ShowHint: Boolean read FShowHint write SetShowHint; |
| o.ShowMainForm = value
result = o.ShowMainForm | property ShowMainForm: Boolean read FShowMainForm write FShowMainForm default True; |
| o.ShowMenuGlyphs = value
result = o.ShowMenuGlyphs | property ShowMenuGlyphs: TApplicationShowGlyphs read FShowMenuGlyphs write SetShowMenuGlyphs default sbgAlways; |
| result = o:SmallIconHandle() | function SmallIconHandle: HIcon; |
| o.TaskBarBehavior = value
result = o.TaskBarBehavior | property TaskBarBehavior: TTaskBarBehavior read FTaskBarBehavior write SetTaskBarBehavior; |
| o.Title = value
result = o.Title | property Title: string read GetTitle write SetTitle; |
| o.UpdateFormatSettings = value
result = o.UpdateFormatSettings | property UpdateFormatSettings: Boolean read FUpdateFormatSettings write FUpdateFormatSettings; platform; |
| o:UpdateMainForm(AForm) | procedure UpdateMainForm(AForm: TForm); |

| Lua examples | FP declaration |
| --- | --- |
| o.ActionComponent = value
result = o.ActionComponent | property ActionComponent: TComponent read FActionComponent write FActionComponent; |
| result = o:Execute() | function Execute: Boolean; dynamic; |
| o:ExecuteTarget(Target) | procedure ExecuteTarget(Target: TObject); virtual; |
| result = o:HandlesTarget(Target) | function HandlesTarget(Target: TObject): Boolean; virtual; |
| o.OnChange = function(Sender) end | property OnChange: TNotifyEvent read FOnChange write FOnChange; |
| o.OnExecute = function(Sender) end | property OnExecute: TNotifyEvent read FOnExecute write SetOnExecute; |
| o.OnUpdate = function(Sender) end | property OnUpdate: TNotifyEvent read FOnUpdate write FOnUpdate; |
| result = o:Update() | function Update: Boolean; virtual; |
| o:UpdateTarget(Target) | procedure UpdateTarget(Target: TObject); virtual; |

| Lua examples | FP declaration |
| --- | --- |
| o:Assign(Source) | procedure Assign(Source: TPersistent); override; |

| Lua examples | FP declaration |
| --- | --- |
| result = o:CanShowGlyph()
result = o:CanShowGlyph(AWithShowMode) | function CanShowGlyph(const AWithShowMode: Boolean = False): Boolean; |
| o.DefaultCaption = value
result = o.DefaultCaption | property DefaultCaption: Boolean read FDefaultCaption write SetDefaultCaption default False; |
| o.DisabledImageIndex = value
result = o.DisabledImageIndex | property DisabledImageIndex: TImageIndex index bsDisabled read GetImageIndex write SetImageIndex default -1; |
| o.Glyph = value
result = o.Glyph | property Glyph: TBitmap read GetGlyph write SetGlyph stored IsGlyphStored; |
| o.GlyphShowMode = value
result = o.GlyphShowMode | property GlyphShowMode: TGlyphShowMode read GetGlyphShowMode write SetGlyphShowMode default gsmApplication; |
| o.HotImageIndex = value
result = o.HotImageIndex | property HotImageIndex: TImageIndex index bsHot read GetImageIndex write SetImageIndex default -1; |
| o.ImageIndex = value
result = o.ImageIndex | property ImageIndex: TImageIndex index bsUp read GetImageIndex write SetImageIndex default -1; |
| o.ImageWidth = value
result = o.ImageWidth | property ImageWidth: Integer read GetImageWidth write SetImageWidth default 0; |
| o.Images = value
result = o.Images | property Images: TCustomImageList read GetImages write SetImages; |
| o.Kind = value
result = o.Kind | property Kind: TBitBtnKind read FKind write SetKind default bkCustom; |
| o.Layout = value
result = o.Layout | property Layout: TButtonLayout read FLayout write SetLayout default blGlyphLeft; |
| o:LoadGlyphFromLazarusResource(AName) | procedure LoadGlyphFromLazarusResource(const AName: String); |
| o:LoadGlyphFromResource(idButton) | procedure LoadGlyphFromResource(idButton: TButtonImage); |
| o:LoadGlyphFromResourceName(Instance,AName) | procedure LoadGlyphFromResourceName(Instance: THandle; const AName: String); |
| o:LoadGlyphFromStock(idButton) | procedure LoadGlyphFromStock(idButton: Integer); |
| o.Margin = value
result = o.Margin | property Margin: integer read FMargin write SetMargin default -1; |
| o.NumGlyphs = value
result = o.NumGlyphs | property NumGlyphs: Integer read GetNumGlyphs write SetNumGlyphs default 1; |
| o.PressedImageIndex = value
result = o.PressedImageIndex | property PressedImageIndex: TImageIndex index bsDown read GetImageIndex write SetImageIndex default -1; |
| o.Spacing = value
result = o.Spacing | property Spacing: Integer read FSpacing write SetSpacing default 4; |

| Lua examples | FP declaration |
| --- | --- |
| o.Bitmap = value
result = o.Bitmap | property Bitmap: TCustomBitmap read FBitmap write SetBitmap; |
| result = o:EqualsBrush(ABrush) | function EqualsBrush(ABrush: TBrush): boolean; |

| Lua examples | FP declaration |
| --- | --- |
| result = o.Active | property Active: boolean read FActive stored false; |
| o.Cancel = value
result = o.Cancel | property Cancel: Boolean read FCancel write SetCancel default false; |
| o:Click() | procedure Click; override; |
| o.Default = value
result = o.Default | property Default: Boolean read FDefault write SetDefault default false; |
| o.ModalResult = value
result = o.ModalResult | property ModalResult: TModalResult read FModalResult write SetModalResult default mrNone; |
| result = o.ShortCut | property ShortCut: TShortcut read FShortCut; |
| result = o.ShortCutKey2 | property ShortCutKey2: TShortcut read FShortCutKey2; |
| result = o:UseRightToLeftAlignment() | function UseRightToLeftAlignment: Boolean; override; |

| Lua examples | FP declaration |
| --- | --- |
| o:RunDialog() | procedure RunDialog; virtual; |

| Lua examples | FP declaration |
| --- | --- |
| o.Date = value
result = o.Date | property Date: String read GetDate write SetDate stored False; |
| o.DateTime = value
result = o.DateTime | property DateTime: TDateTime read GetDateTime write SetDateTime; |
| o.DisplaySettings = value
result = o.DisplaySettings | property DisplaySettings: TDisplaySettings read GetDisplaySettings write SetDisplaySettings default DefaultDisplaySettings; |
| o.FirstDayOfWeek = value
result = o.FirstDayOfWeek | property FirstDayOfWeek: TCalDayOfWeek read FFirstDayOfWeek write SetFirstDayOfWeek default dowDefault; |
| result = o:GetCalendarView() | function GetCalendarView: TCalendarView; |
| result = o:HitTest(APoint) | function HitTest(APoint: TPoint): TCalendarPart; |
| o.MaxDate = value
result = o.MaxDate | property MaxDate: TDateTime read FMaxDate write SetMaxDate stored GetMaxDateStored; |
| o.MinDate = value
result = o.MinDate | property MinDate: TDateTime read FMinDate write SetMinDate stored GetMinDateStored; |
| o.OnChange = function(Sender) end | property OnChange: TNotifyEvent read FOnChange write FOnChange; |
| o.OnDayChanged = function(Sender) end | property OnDayChanged: TNotifyEvent read FDayChanged write FDayChanged; |
| o.OnMonthChanged = function(Sender) end | property OnMonthChanged: TNotifyEvent read FMonthChanged write FMonthChanged; |
| o.OnYearChanged = function(Sender) end | property OnYearChanged: TNotifyEvent read FYearChanged write FYearChanged; |

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
| result = o:Pixels(X,Y)
o:Pixels(X,Y,value) | property Pixels[X, Y: Integer]: TColor read GetPixel write SetPixel; |
| o:PolyBezier(Points)
...
o:PolyBezier(Points,Filled,Continuous) | procedure PolyBezier(const Points: array of TPoint; Filled: boolean = False; Continuous: boolean = True);  reintroduce; |
| o:Polygon(Points,Winding)
...
o:Polygon(Points,Winding,StartIndex,NumPts) | procedure Polygon(const Points: array of TPoint; Winding: Boolean; StartIndex: Integer = 0; NumPts: Integer = -1); |
| o:Polygon2(Points) | procedure Polygon(const Points: array of TPoint); |
| o:Polyline(Points,StartIndex)
o:Polyline(Points,StartIndex,NumPts) | procedure Polyline(const Points: array of TPoint; StartIndex: Integer; NumPts: Integer = -1); |
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
| o.TextStyle = value
result = o.TextStyle | property TextStyle: TTextStyle read FTextStyle write FTextStyle; |
| result = o:TextWidth(Text) | function TextWidth(const Text: string): Integer; virtual; |
| result = o:TryLock() | function TryLock: Boolean; |
| o:Unlock() | procedure Unlock; virtual; |

| Lua examples | FP declaration |
| --- | --- |
| o.Alignment = value
result = o.Alignment | property Alignment: TLeftRight read GetAlignment write SetAlignment default taRightJustify; |
| o.AllowGrayed = value
result = o.AllowGrayed | property AllowGrayed: Boolean read FAllowGrayed write FAllowGrayed default false; |
| result = o.ShortCut | property ShortCut: TShortcut read FShortCut; |
| result = o.ShortCutKey2 | property ShortCutKey2: TShortcut read FShortCutKey2; |
| o.State = value
result = o.State | property State: TCheckBoxState read GetState write SetState default cbUnchecked; |

| Lua examples | FP declaration |
| --- | --- |
| o.AutoFill = value
result = o.AutoFill | property AutoFill: boolean read FAutoFill write SetAutoFill; |
| result = o:CheckEnabled(Index)
o:CheckEnabled(Index,value) | property CheckEnabled[Index: integer]: boolean read GetCheckEnabled write SetCheckEnabled; |
| result = o:Checked(Index)
o:Checked(Index,value) | property Checked[Index: integer]: boolean read GetChecked write SetChecked; |
| o.ColumnLayout = value
result = o.ColumnLayout | property ColumnLayout: TColumnLayout read FColumnLayout write SetColumnLayout default clHorizontalThenVertical; |
| o.Columns = value
result = o.Columns | property Columns: integer read FColumns write SetColumns default 1; |
| o.Items = value
result = o.Items | property Items: TStrings read FItems write SetItems; |
| o.OnItemClick = function(Sender,Index) end | property OnItemClick: TCheckGroupClicked read FOnItemClick write FOnItemClick; |
| result = o:Rows() | function Rows: integer; |

| Lua examples | FP declaration |
| --- | --- |
| o.AllowGrayed = value
result = o.AllowGrayed | property AllowGrayed: Boolean read FAllowGrayed write FAllowGrayed default False; |
| result = o:CalculateStandardItemHeight() | function CalculateStandardItemHeight: Integer; override; |
| o:CheckAll(AState)
...
o:CheckAll(AState,aAllowGrayed,aAllowDisabled) | procedure CheckAll(AState: TCheckBoxState; aAllowGrayed: Boolean = True; aAllowDisabled: Boolean = True); |
| result = o:Checked(AIndex)
o:Checked(AIndex,value) | property Checked[AIndex: Integer]: Boolean read GetChecked write SetChecked; |
| o:Exchange(AIndex1,AIndex2) | procedure Exchange(AIndex1, AIndex2: Integer); |
| result = o:Header(AIndex)
o:Header(AIndex,value) | property Header[AIndex: Integer]: Boolean read GetHeader write SetHeader; |
| o.HeaderBackgroundColor = value
result = o.HeaderBackgroundColor | property HeaderBackgroundColor: TColor read FHeaderBackgroundColor write SetHeaderBackgroundColor default clInfoBk; |
| o.HeaderColor = value
result = o.HeaderColor | property HeaderColor: TColor read FHeaderColor write SetHeaderColor default clInfoText; |
| result = o:ItemEnabled(AIndex)
o:ItemEnabled(AIndex,value) | property ItemEnabled[AIndex: Integer]: Boolean read GetItemEnabled write SetItemEnabled; |
| o.OnClickCheck = function(Sender) end | property OnClickCheck: TNotifyEvent read FOnClickCheck write FOnClickCheck; |
| result = o:State(AIndex)
o:State(AIndex,value) | property State[AIndex: Integer]: TCheckBoxState read GetState write SetState; |
| o:Toggle(AIndex) | procedure Toggle(AIndex: Integer); |

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
| result = o:Items(Index)
o:Items(Index,value) | property Items[Index: Integer]: TCollectionItem read GetItem write SetItem; |
| o:Move(Index1,index2) | procedure Move(Const Index1, index2: integer); |
| result = o:Owner() | function Owner: TPersistent; |

| Lua examples | FP declaration |
| --- | --- |
| o.Collection = value
result = o.Collection | property Collection: TCollection read FCollection write SetCollection; |
| o.DisplayName = value
result = o.DisplayName | property DisplayName: string read GetDisplayName write SetDisplayName; |
| result = o.ID | property ID: Integer read FID; |
| o.Index = value
result = o.Index | property Index: Integer read GetIndex write SetIndex; |

| Lua examples | FP declaration |
| --- | --- |
| result = o:ShowCollectionEditor(ACollection,OwnerPersistent,PropName) | class function ShowCollectionEditor(ACollection: TCollection;  OwnerPersistent: TPersistent; const PropName: String): TCustomForm; virtual; |

| Lua examples | FP declaration |
| --- | --- |
| o.ActionList1 = value
result = o.ActionList1 | ActionList1: TActionList; |
| o.AddButton = value
result = o.AddButton | AddButton: TToolButton; |
| result = o.Collection | property Collection: TCollection read FCollection; |
| o.CollectionListBox = value
result = o.CollectionListBox | CollectionListBox: TListBox; |
| o:CollectionListBoxClick(Sender) | procedure CollectionListBoxClick(Sender: TObject); |
| o.DeleteButton = value
result = o.DeleteButton | DeleteButton: TToolButton; |
| o.DividerToolButton = value
result = o.DividerToolButton | DividerToolButton: TToolButton; |
| CloseAction = o:FormClose(Sender) | procedure FormClose(Sender: TObject; var  CloseAction: TCloseAction); |
| CloseAction = o:FormClose2(Sender,CloseAction) | procedure FormClose(Sender: TObject; var  CloseAction: TCloseAction); |
| o:FormCreate(Sender) | procedure FormCreate(Sender: TObject); |
| o:FormDestroy(Sender) | procedure FormDestroy(Sender: TObject); |
| o.MoveDownButton = value
result = o.MoveDownButton | MoveDownButton: TToolButton; |
| o.MoveUpButton = value
result = o.MoveUpButton | MoveUpButton: TToolButton; |
| result = o.OwnerPersistent | property OwnerPersistent: TPersistent read FOwnerPersistent; |
| result = o.PropertyName | property PropertyName: String read FPropertyName; |
| o:SetCollection(NewCollection,NewOwnerPersistent,NewPropName) | procedure SetCollection(NewCollection: TCollection; NewOwnerPersistent: TPersistent; const NewPropName: String); |
| o.ToolBar1 = value
result = o.ToolBar1 | ToolBar1: TToolBar; |
| o:UpdateButtons() | procedure UpdateButtons; |
| o.actAdd = value
result = o.actAdd | actAdd: TAction; |
| o:actAddExecute(Sender) | procedure actAddExecute(Sender: TObject); |
| o.actDel = value
result = o.actDel | actDel: TAction; |
| o:actDelExecute(Sender) | procedure actDelExecute(Sender: TObject); |
| o.actMoveDown = value
result = o.actMoveDown | actMoveDown: TAction; |
| o.actMoveUp = value
result = o.actMoveUp | actMoveUp: TAction; |
| o:actMoveUpDownExecute(Sender) | procedure actMoveUpDownExecute(Sender: TObject); |

| Lua examples | FP declaration |
| --- | --- |
| o.ColorDialog = value
result = o.ColorDialog | property ColorDialog:TcolorDialog read FColorDialog write FcolorDialog; |
| result = o:ColorNames(Index) | property ColorNames[Index: Integer]: string read GetColorName; |
| o.ColorRectOffset = value
result = o.ColorRectOffset | property ColorRectOffset: Integer read FColorRectOffset write SetColorRectOffset default cDefaultColorRectOffset; |
| o.ColorRectWidth = value
result = o.ColorRectWidth | property ColorRectWidth: Integer read GetColorRectWidth write SetColorRectWidth stored ColorRectWidthStored; |
| result = o:Colors(Index) | property Colors[Index: Integer]: TColor read GetColor; |
| o.DefaultColorColor = value
result = o.DefaultColorColor | property DefaultColorColor: TColor read FDefaultColorColor write SetDefaultColorColor default clBlack; |
| o.NoneColorColor = value
result = o.NoneColorColor | property NoneColorColor: TColor read FNoneColorColor write SetNoneColorColor default clBlack; |
| o.OnGetColors = function(Sender,Items) end | property OnGetColors: TGetColorsEvent read FOnGetColors write FOnGetColors; |
| o.Selected = value
result = o.Selected | property Selected: TColor read GetSelected write SetSelected default clBlack; |

| Lua examples | FP declaration |
| --- | --- |
| o.ColorDialog = value
result = o.ColorDialog | property ColorDialog:TColorDialog read fcolorDialog write FColorDialog; |
| result = o:ColorNames(Index) | property ColorNames[Index: Integer]: string read GetColorName; |
| o.ColorRectOffset = value
result = o.ColorRectOffset | property ColorRectOffset: Integer read FColorRectOffset write SetColorRectOffset default cDefaultColorRectOffset; |
| o.ColorRectWidth = value
result = o.ColorRectWidth | property ColorRectWidth: Integer read GetColorRectWidth write SetColorRectWidth stored ColorRectWidthStored; |
| result = o:Colors(Index)
o:Colors(Index,value) | property Colors[Index: Integer]: TColor read GetColors write SetColors; |
| o.DefaultColorColor = value
result = o.DefaultColorColor | property DefaultColorColor: TColor read FDefaultColorColor write SetDefaultColorColor default clBlack; |
| o.NoneColorColor = value
result = o.NoneColorColor | property NoneColorColor: TColor read FNoneColorColor write SetNoneColorColor default clBlack; |
| o.OnGetColors = function(Sender,Items) end | property OnGetColors: TLBGetColorsEvent read FOnGetColors write FOnGetColors; |
| o.Selected = value
result = o.Selected | property Selected: TColor read GetSelected write SetSelected default clBlack; |

| Lua examples | FP declaration |
| --- | --- |
| o:AddHistoryItem(Item,MaxHistoryCount,SetAsText,CaseSensitive) | procedure AddHistoryItem(const Item: string; MaxHistoryCount: integer; SetAsText, CaseSensitive: boolean); |
| o:AddHistoryItem2(Item,AnObject,MaxHistoryCount,SetAsText,CaseSensitive) | procedure AddHistoryItem(const Item: string; AnObject: TObject; MaxHistoryCount: integer; SetAsText, CaseSensitive: boolean); |
| o:AddItem(Item,AnObject) | procedure AddItem(const Item: String; AnObject: TObject); virtual; |
| o.ArrowKeysTraverseList = value
result = o.ArrowKeysTraverseList | property ArrowKeysTraverseList: Boolean read FArrowKeysTraverseList write SetArrowKeysTraverseList default True; |
| o.AutoComplete = value
result = o.AutoComplete | property AutoComplete: boolean read GetAutoComplete write SetAutoComplete default False; |
| o.AutoCompleteText = value
result = o.AutoCompleteText | property AutoCompleteText: TComboBoxAutoCompleteText read FAutoCompleteText write FAutoCompleteText default DefaultComboBoxAutoCompleteText; |
| o.AutoDropDown = value
result = o.AutoDropDown | property AutoDropDown: Boolean read FAutoDropDown write FAutoDropDown default False; |
| o.AutoSelect = value
result = o.AutoSelect | property AutoSelect: Boolean read FAutoSelect write FAutoSelect default True; |
| o.AutoSelected = value
result = o.AutoSelected | property AutoSelected: Boolean read FAutoSelected write FAutoSelected; |
| result = o.Canvas | property Canvas: TCanvas read FCanvas; |
| o.CharCase = value
result = o.CharCase | property CharCase: TEditCharCase read FCharCase write SetCharCase default ecNormal; |
| o:Clear() | procedure Clear; virtual; |
| o:ClearSelection() | procedure ClearSelection; |
| o.DropDownCount = value
result = o.DropDownCount | property DropDownCount: Integer read FDropDownCount write SetDropDownCount default 8; |
| o.DroppedDown = value
result = o.DroppedDown | property DroppedDown: Boolean read GetDroppedDown write SetDroppedDown; |
| result = o.EmulatedTextHintStatus | property EmulatedTextHintStatus: TEmulatedTextHintStatus read FEmulatedTextHintStatus; |
| o:IntfGetItems() | procedure IntfGetItems; |
| o.ItemIndex = value
result = o.ItemIndex | property ItemIndex: integer read GetItemIndex write SetItemIndex default -1; |
| o.Items = value
result = o.Items | property Items: TStrings read FItems write SetItems; |
| result = o:MatchListItem(AValue) | function  MatchListItem(const AValue: TCaption): Integer; |
| o.OnChange = function(Sender) end | property OnChange: TNotifyEvent read FOnChange write FOnChange; |
| o.OnCloseUp = function(Sender) end | property OnCloseUp: TNotifyEvent read FOnCloseUp write FOnCloseUp; |
| o.OnDrawItem = function(Control,Index,ARect,State) end | property OnDrawItem: TDrawItemEvent read FOnDrawItem write FOnDrawItem; |
| o.OnDropDown = function(Sender) end | property OnDropDown: TNotifyEvent read FOnDropDown write FOnDropDown; |
| o.OnGetItems = function(Sender) end | property OnGetItems: TNotifyEvent read FOnGetItems write FOnGetItems; |
| o.OnMeasureItem = function(Control,Index,AHeight) return AHeight end | property OnMeasureItem: TMeasureItemEvent read FOnMeasureItem write FOnMeasureItem; |
| o.OnSelect = function(Sender) end | property OnSelect: TNotifyEvent read FOnSelect write FOnSelect; |
| o.ReadOnly = value
result = o.ReadOnly | property ReadOnly: Boolean read FReadOnly write SetReadOnly default False; |
| o.SelLength = value
result = o.SelLength | property SelLength: integer read GetSelLength write SetSelLength; |
| o.SelStart = value
result = o.SelStart | property SelStart: integer read GetSelStart write SetSelStart; |
| o.SelText = value
result = o.SelText | property SelText: String read GetSelText write SetSelText; |
| o:SelectAll() | procedure SelectAll; |
| o.Style = value
result = o.Style | property Style: TComboBoxStyle read FStyle write SetStyle default csDropDown; |
| o.TextHint = value
result = o.TextHint | property TextHint: TTranslateString read FTextHint write SetTextHint; |

| Lua examples | FP declaration |
| --- | --- |
| o:Close() | procedure Close; virtual; |
| CanClose = o:DoCanClose() | procedure DoCanClose(var CanClose: Boolean); virtual; |
| CanClose = o:DoCanClose2(CanClose) | procedure DoCanClose(var CanClose: Boolean); virtual; |
| o:DoClose() | procedure DoClose; virtual; |
| o:DoShow() | procedure DoShow; virtual; |
| result = o:Execute() | function Execute: Boolean; virtual; |
| o.FCompStyle = value
result = o.FCompStyle | FCompStyle : LongInt; |
| o.Handle = value
result = o.Handle | property Handle: THandle read FHandle write SetHandle; |
| result = o:HandleAllocated() | function HandleAllocated: Boolean; |
| o.Height = value
result = o.Height | property Height: Integer read GetHeight write SetHeight; |
| o.OnDialogResult = function(Sender,Success) end | property OnDialogResult:TDialogResultEvent read FOnDialogResult write FOnDialogResult; platform; |
| o.UserChoice = value
result = o.UserChoice | property UserChoice: Integer read FUserChoice write FUserChoice; |
| o.Width = value
result = o.Width | property Width: Integer read GetWidth write SetWidth; |

| Lua examples | FP declaration |
| --- | --- |
| o:BeforeDestruction() | procedure BeforeDestruction; override; |
| result = o.ComponentCount | property ComponentCount: Integer read GetComponentCount; |
| o.ComponentIndex = value
result = o.ComponentIndex | property ComponentIndex: Integer read GetComponentIndex write SetComponentIndex; |
| result = o.ComponentState | property ComponentState: TComponentState read FComponentState; |
| result = o.ComponentStyle | property ComponentStyle: TComponentStyle read FComponentStyle; |
| result = o:Components(Index) | property Components[Index: Integer]: TComponent read GetComponent; |
| o.DesignInfo = value
result = o.DesignInfo | property DesignInfo: Longint read FDesignInfo write FDesignInfo; |
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
| o.VCLComObject = value
result = o.VCLComObject | property VCLComObject: Pointer read FVCLComObject write FVCLComObject; |

| Lua examples | FP declaration |
| --- | --- |
| o.ActionList = value
result = o.ActionList | property ActionList: TCustomActionList read FActionList write SetActionList; |
| o.Index = value
result = o.Index | property Index: Integer read GetIndex write SetIndex stored False; |

| Lua examples | FP declaration |
| --- | --- |
| o.AccessibleDescription = value
result = o.AccessibleDescription | property AccessibleDescription: TCaption read GetAccessibleDescription write SetAccessibleDescription; |
| o.AccessibleName = value
result = o.AccessibleName | property AccessibleName: TCaption read GetAccessibleName write SetAccessibleName; |
| o.AccessibleRole = value
result = o.AccessibleRole | property AccessibleRole: TLazAccessibilityRole read GetAccessibleRole write SetAccessibleRole; |
| o.AccessibleValue = value
result = o.AccessibleValue | property AccessibleValue: TCaption read GetAccessibleValue write SetAccessibleValue; |
| o.Action = value
result = o.Action | property Action: TBasicAction read GetAction write SetAction; |
| o:ActiveDefaultControlChanged(NewControl) | procedure ActiveDefaultControlChanged(NewControl: TControl); virtual; |
| o:AdjustSize() | procedure AdjustSize; virtual; |
| o.Align = value
result = o.Align | property Align: TAlign read FAlign write SetAlign default alNone; |
| o:AnchorAsAlign(TheAlign,Space) | procedure AnchorAsAlign(TheAlign: TAlign; Space: TSpacingSize); |
| o:AnchorClient(Space) | procedure AnchorClient(Space: TSpacingSize); |
| o:AnchorHorizontalCenterTo(Sibling) | procedure AnchorHorizontalCenterTo(Sibling: TControl); |
| o:AnchorParallel(Side,Space,Sibling) | procedure AnchorParallel(Side: TAnchorKind; Space: TSpacingSize; Sibling: TControl); |
| o:AnchorSame(Side,Sibling) | procedure AnchorSame(Side: TAnchorKind; Sibling: TControl); |
| result = o:AnchorSide(Kind) | property AnchorSide[Kind: TAnchorKind]: TAnchorSide read GetAnchorSide; |
| o:AnchorToCompanion(Side,Space,Sibling)
o:AnchorToCompanion(Side,Space,Sibling,FreeCompositeSide) | procedure AnchorToCompanion(Side: TAnchorKind; Space: TSpacingSize; Sibling: TControl; FreeCompositeSide: Boolean = true); |
| o:AnchorToNeighbour(Side,Space,Sibling) | procedure AnchorToNeighbour(Side: TAnchorKind; Space: TSpacingSize; Sibling: TControl); |
| o:AnchorVerticalCenterTo(Sibling) | procedure AnchorVerticalCenterTo(Sibling: TControl); |
| result = o:AnchoredControlCount() | function AnchoredControlCount: Integer; |
| result = o:AnchoredControls(Index) | property AnchoredControls[Index: Integer]: TControl read GetAnchoredControls; |
| o.AutoSize = value
result = o.AutoSize | property AutoSize: Boolean read FAutoSize write SetAutoSize default False; |
| result = o:AutoSizeDelayed() | function AutoSizeDelayed: Boolean; virtual; |
| result = o:AutoSizeDelayedHandle() | function AutoSizeDelayedHandle: Boolean; virtual; |
| result = o:AutoSizeDelayedReport() | function AutoSizeDelayedReport: string; virtual; |
| result = o:AutoSizePhases() | function AutoSizePhases: TControlAutoSizePhases; virtual; |
| result = o.BaseBounds | property BaseBounds: TRect read FBaseBounds; |
| result = o.BaseParentClientSize | property BaseParentClientSize: TSize read FBaseParentClientSize; |
| o:BeforeDestruction() | procedure BeforeDestruction; override; |
| o:BeginDrag(Immediate)
o:BeginDrag(Immediate,Threshold) | procedure BeginDrag(Immediate: Boolean; Threshold: Integer = -1); |
| o.BiDiMode = value
result = o.BiDiMode | property BiDiMode: TBiDiMode read FBiDiMode write SetBiDiMode stored IsBiDiModeStored default bdLeftToRight; |
| o.BorderSpacing = value
result = o.BorderSpacing | property BorderSpacing: TControlBorderSpacing read FBorderSpacing write SetBorderSpacing; |
| o.BoundsRect = value
result = o.BoundsRect | property BoundsRect: TRect read GetBoundsRect write SetBoundsRect; |
| o.BoundsRectForNewParent = value
result = o.BoundsRectForNewParent | property BoundsRectForNewParent: TRect read FBoundsRectForNewParent write SetBoundsRectForNewParent; |
| o:BringToFront() | procedure BringToFront; |
| o:CNPreferredSizeChanged() | procedure CNPreferredSizeChanged; |
| o.Caption = value
result = o.Caption | property Caption: TCaption read GetText write SetText stored IsCaptionStored; |
| o:CheckNewParent(AParent) | procedure CheckNewParent(AParent: TWinControl); virtual; |
| o.ClientHeight = value
result = o.ClientHeight | property ClientHeight: Integer read GetClientHeight write SetClientHeight stored  IsClientHeightStored; |
| result = o.ClientOrigin | property ClientOrigin: TPoint read GetClientOrigin; |
| result = o.ClientRect | property ClientRect: TRect read GetClientRect; |
| result = o:ClientToParent(Point)
result = o:ClientToParent(Point,AParent) | function  ClientToParent(const Point: TPoint; AParent: TWinControl = nil): TPoint; |
| result = o:ClientToScreen(APoint) | function  ClientToScreen(const APoint: TPoint): TPoint; overload; virtual; |
| result = o:ClientToScreen2(ARect) | function  ClientToScreen(const ARect: TRect): TRect; overload; |
| o.ClientWidth = value
result = o.ClientWidth | property ClientWidth: Integer read GetClientWidth write SetClientWidth stored IsClientWidthStored; |
| o.Color = value
result = o.Color | property Color: TColor read FColor write SetColor stored ColorIsStored default  clWindow ; |
| o.Constraints = value
result = o.Constraints | property Constraints: TSizeConstraints read FConstraints write SetConstraints; |
| result = o.ControlOrigin | property ControlOrigin: TPoint read GetControlOrigin; |
| o.ControlState = value
result = o.ControlState | property ControlState: TControlState read FControlState write FControlState; |
| o.ControlStyle = value
result = o.ControlStyle | property ControlStyle: TControlStyle read FControlStyle write FControlStyle; |
| result = o:ControlToScreen(APoint) | function  ControlToScreen(const APoint: TPoint): TPoint; |
| o:DisableAutoSizing() | procedure DisableAutoSizing ; |
| o:Dock(NewDockSite,ARect) | procedure Dock(NewDockSite: TWinControl; ARect: TRect); virtual; |
| o.DockOrientation = value
result = o.DockOrientation | property DockOrientation: TDockOrientation read FDockOrientation write FDockOrientation; |
| result = o:Docked() | function Docked: Boolean; |
| o:DragDrop(Source,X,Y) | procedure DragDrop(Source: TObject; X,Y: Integer); virtual; |
| result = o:Dragging() | function Dragging: Boolean; |
| o:EditingDone() | procedure EditingDone; virtual; |
| o:EnableAutoSizing() | procedure EnableAutoSizing ; |
| o.Enabled = value
result = o.Enabled | property Enabled: Boolean read GetEnabled write SetEnabled stored IsEnabledStored default True; |
| o:EndDrag(Drop) | procedure EndDrag(Drop: Boolean); |
| o:ExecuteCancelAction() | procedure ExecuteCancelAction; virtual; |
| o:ExecuteDefaultAction() | procedure ExecuteDefaultAction; virtual; |
| o.FCompStyle = value
result = o.FCompStyle | FCompStyle: Byte; |
| result = o:FindSubComponent(AName) | function FindSubComponent(AName: string): TComponent; |
| o:FixDesignFontsPPI(ADesignTimePPI) | procedure FixDesignFontsPPI(const ADesignTimePPI: Integer); virtual; |
| result = o.Floating | property Floating: Boolean read GetFloating; |
| o.Font = value
result = o.Font | property Font: TFont read FFont write SetFont stored IsFontStored; |
| result = o:FormIsUpdating() | function FormIsUpdating: Boolean; virtual; |
| result = o:GetAnchorsDependingOnParent(WithNormalAnchors) | function GetAnchorsDependingOnParent(WithNormalAnchors: Boolean): TAnchors; |
| result = o:GetCanvasScaleFactor() | function GetCanvasScaleFactor: Double; |
| result = o:GetChildrenRect(Scrolled) | function GetChildrenRect(Scrolled: Boolean): TRect; virtual; |
| result = o:GetColorResolvingParent() | function GetColorResolvingParent: TColor; |
| result = o:GetDefaultColor(DefaultColorType) | function GetDefaultColor(const DefaultColorType: TDefaultColorType): TColor; virtual; |
| result = o:GetDefaultHeight() | function GetDefaultHeight: Integer; |
| result = o:GetDefaultWidth() | function GetDefaultWidth: Integer; |
| result = o:GetParentComponent() | function GetParentComponent: TComponent; override; |
| PreferredWidth, PreferredHeight = o:GetPreferredSize()
...
PreferredWidth, PreferredHeight = o:GetPreferredSize(Raw,WithThemeSpace) | procedure GetPreferredSize(var PreferredWidth, PreferredHeight: Integer; Raw: Boolean = false; WithThemeSpace: Boolean = true); virtual; |
| PreferredWidth, PreferredHeight = o:GetPreferredSize2(PreferredWidth,PreferredHeight)
...
PreferredWidth, PreferredHeight = o:GetPreferredSize2(PreferredWidth,PreferredHeight,Raw,WithThemeSpace) | procedure GetPreferredSize(var PreferredWidth, PreferredHeight: Integer; Raw: Boolean = false; WithThemeSpace: Boolean = true); virtual; |
| result = o:GetRGBColorResolvingParent() | function GetRGBColorResolvingParent: TColor; |
| result = o:GetSidePosition(Side) | function GetSidePosition(Side: TAnchorKind): Integer; |
| result = o:GetTextBuf(Buffer,BufSize) | function  GetTextBuf(Buffer: PChar; BufSize: Integer): Integer; virtual; |
| result = o:GetTextLen() | function  GetTextLen: Integer; virtual; |
| result = o:GetTopParent() | function GetTopParent: TControl; |
| result = o:HandleObjectShouldBeVisible() | function HandleObjectShouldBeVisible: Boolean; virtual; |
| result = o:HasHelp() | function HasHelp: Boolean; |
| result = o:HasParent() | function HasParent: Boolean; override; |
| o:Hide() | procedure Hide; |
| o.HostDockSite = value
result = o.HostDockSite | property HostDockSite: TWinControl read FHostDockSite write SetHostDockSite; |
| o:InitiateAction() | procedure InitiateAction; virtual; |
| o:Invalidate() | procedure Invalidate; virtual; |
| o:InvalidatePreferredSize() | procedure InvalidatePreferredSize; virtual; |
| o.IsControl = value
result = o.IsControl | property IsControl: Boolean read FIsControl write FIsControl; |
| result = o:IsControlVisible() | function IsControlVisible: Boolean; virtual; |
| result = o:IsEnabled() | function IsEnabled: Boolean; |
| result = o:IsParentColor() | function IsParentColor: Boolean; |
| result = o:IsParentFont() | function IsParentFont: Boolean; |
| result = o:IsParentOf(AControl) | function IsParentOf(AControl: TControl): Boolean; virtual; |
| result = o:IsProcessingPaintMsg() | function IsProcessingPaintMsg: Boolean; |
| result = o:IsVisible() | function IsVisible: Boolean; virtual; |
| o.LRDockWidth = value
result = o.LRDockWidth | property LRDockWidth: Integer read GetLRDockWidth write FLRDockWidth; |
| result = o:ManualDock(NewDockSite)
...
result = o:ManualDock(NewDockSite,DropControl,ControlSide,KeepDockSiteSize) | function ManualDock(NewDockSite: TWinControl; DropControl: TControl = nil; ControlSide: TAlign = alNone; KeepDockSiteSize: Boolean = true): Boolean; virtual; |
| result = o:ManualFloat(TheScreenRect)
result = o:ManualFloat(TheScreenRect,KeepDockSiteSize) | function ManualFloat(TheScreenRect: TRect; KeepDockSiteSize: Boolean = true): Boolean; virtual; |
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
| o.Parent = value
result = o.Parent | property Parent: TWinControl read FParent write SetParent; |
| o.ParentBiDiMode = value
result = o.ParentBiDiMode | property ParentBiDiMode: Boolean read FParentBiDiMode write SetParentBiDiMode default True; |
| result = o:ParentDestroyingHandle() | function ParentDestroyingHandle: Boolean; |
| result = o:ParentHandlesAllocated() | function ParentHandlesAllocated: Boolean; virtual; |
| result = o:ParentToClient(Point)
result = o:ParentToClient(Point,AParent) | function  ParentToClient(const Point: TPoint; AParent: TWinControl = nil): TPoint; |
| o.PopupMenu = value
result = o.PopupMenu | property PopupMenu: TPopupmenu read GetPopupmenu write SetPopupMenu; |
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
| o.ShowHint = value
result = o.ShowHint | property ShowHint: Boolean read FShowHint write SetShowHint stored IsShowHintStored default False; |
| o.TBDockHeight = value
result = o.TBDockHeight | property TBDockHeight: Integer read GetTBDockHeight write FTBDockHeight; |
| o.UndockHeight = value
result = o.UndockHeight | property UndockHeight: Integer read GetUndockHeight write FUndockHeight; |
| o.UndockWidth = value
result = o.UndockWidth | property UndockWidth: Integer read GetUndockWidth write FUndockWidth; |
| o:Update() | procedure Update; virtual; |
| o:UpdateBaseBounds(StoreBounds,StoreParentClientSize,UseLoadedValues) | procedure UpdateBaseBounds(StoreBounds, StoreParentClientSize, UseLoadedValues: Boolean); virtual; |
| o:UpdateRolesForForm() | procedure UpdateRolesForForm; virtual; |
| o.Visible = value
result = o.Visible | property Visible: Boolean read FVisible write SetVisible stored IsVisibleStored default True; |

| Lua examples | FP declaration |
| --- | --- |
| o:AssignTo(Dest) | procedure AssignTo(Dest: TPersistent); override; |
| result = o.Control | property Control: TWinControl read FControl; |
| result = o:IsEqual(Sizing) | function IsEqual(Sizing: TControlChildSizing): Boolean; |
| o.OnChange = function(Sender) end | property OnChange: TNotifyEvent read FOnChange write FOnChange; |
| o:SetGridSpacing(Spacing) | procedure SetGridSpacing(Spacing: Integer); |

| Lua examples | FP declaration |
| --- | --- |
| o:AutosizeBands() | procedure AutosizeBands; |
| o.BandBorderStyle = value
result = o.BandBorderStyle | property BandBorderStyle: TBorderStyle read FBandBorderStyle write SetBandBorderStyle default bsSingle; |
| o.BandMaximize = value
result = o.BandMaximize | property BandMaximize: TCoolBandMaximize read FBandMaximize write FBandMaximize default bmClick; |
| o.Bitmap = value
result = o.Bitmap | property Bitmap: TBitmap read FBitmap write SetBitmap; |
| o.FixedOrder = value
result = o.FixedOrder | property FixedOrder: Boolean read FFixedOrder write FFixedOrder default False; |
| o.FixedSize = value
result = o.FixedSize | property FixedSize: Boolean read FFixedSize write FFixedSize default False; |
| o.GrabStyle = value
result = o.GrabStyle | property GrabStyle: TGrabStyle read FGrabStyle write SetGrabStyle default cDefGrabStyle; |
| o.GrabWidth = value
result = o.GrabWidth | property GrabWidth: Integer read FGrabWidth write SetGrabWidth default cDefGrabWidth; |
| o.HorizontalSpacing = value
result = o.HorizontalSpacing | property HorizontalSpacing: Integer read FHorizontalSpacing write SetHorizontalSpacing default cDefHorSpacing; |
| o.Images = value
result = o.Images | property Images: TCustomImageList read FImages write SetImages; |
| o.ImagesWidth = value
result = o.ImagesWidth | property ImagesWidth: Integer read FImagesWidth write SetImagesWidth default 0; |
| ABand, AGrabber = o:MouseToBandPos(X,Y) | procedure MouseToBandPos(X, Y: Integer; out ABand: Integer; out AGrabber: Boolean); |
| o.OnChange = function(Sender) end | property OnChange: TNotifyEvent read FOnChange write FOnChange; |
| o.ShowText = value
result = o.ShowText | property ShowText: Boolean read FShowText write SetShowText default True; |
| o.Themed = value
result = o.Themed | property Themed: Boolean read FThemed write SetThemed default True; |
| o.Vertical = value
result = o.Vertical | property Vertical: Boolean read FVertical write SetVertical default False; |
| o.VerticalSpacing = value
result = o.VerticalSpacing | property VerticalSpacing: Integer read FVerticalSpacing write SetVerticalSpacing default cDefVertSpacing; |

| Lua examples | FP declaration |
| --- | --- |
| o.Alignment = value
result = o.Alignment | property Alignment: TAlignment read GetAlignment write SetAlignment default taLeftJustify; |
| o.AutoSizeHeightIsEditHeight = value
result = o.AutoSizeHeightIsEditHeight | property AutoSizeHeightIsEditHeight: Boolean read FAutoSizeHeightIsEditHeight write FAutoSizeHeightIsEditHeight default True; |
| result = o.CanUndo | property CanUndo: Boolean read GetCanUndo; |
| o.CaretPos = value
result = o.CaretPos | property CaretPos: TPoint read GetCaretPos write SetCaretPos; |
| o.CharCase = value
result = o.CharCase | property CharCase: TEditCharCase read GetCharCase write SetCharCase default ecNormal; |
| o:Clear() | procedure Clear; |
| o:ClearSelection() | procedure ClearSelection; virtual; |
| o.Color = value
result = o.Color | property Color: TColor read GetColor write SetColor stored True default  clWindow ; |
| o:CopyToClipboard() | procedure CopyToClipboard; virtual; |
| o:CutToClipboard() | procedure CutToClipboard; virtual; |
| o.EchoMode = value
result = o.EchoMode | property EchoMode: TEchoMode read GetEchoMode write SetEchoMode default emNormal; |
| o.HideSelection = value
result = o.HideSelection | property HideSelection: Boolean read GetHideSelection write SetHideSelection default False; |
| o.MaxLength = value
result = o.MaxLength | property MaxLength: Integer read GetMaxLength write SetMaxLength; |
| o.Modified = value
result = o.Modified | property Modified: Boolean read GetModified write SetModified; |
| o.NumbersOnly = value
result = o.NumbersOnly | property NumbersOnly: Boolean read GetNumbersOnly write SetNumbersOnly default False; |
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
| o.ParentColor = value
result = o.ParentColor | property ParentColor: Boolean read GetParentColor write SetParentColor default False; |
| o.PasswordChar = value
result = o.PasswordChar | property PasswordChar: char read GetPasswordChar write SetPasswordChar; |
| o:PasteFromClipboard() | procedure PasteFromClipboard; virtual; |
| o.PopupMenu = value
result = o.PopupMenu | property PopupMenu: TPopupMenu read GetEditPopupMenu write SetPopupMenu; |
| o.ReadOnly = value
result = o.ReadOnly | property ReadOnly: Boolean read GetReadOnly write SetReadOnly default False; |
| o.SelLength = value
result = o.SelLength | property SelLength: Integer read GetSelLength write SetSelLength; |
| o.SelStart = value
result = o.SelStart | property SelStart: Integer read GetSelStart write SetSelStart; |
| o.SelText = value
result = o.SelText | property SelText: String read GetSelText write SetSelText; |
| o:SelectAll() | procedure SelectAll; |
| o.TabStop = value
result = o.TabStop | property TabStop: Boolean read GetTabStop write SetTabStop default True; |
| o.TextHint = value
result = o.TextHint | property TextHint: TTranslateString read GetTextHint write SetTextHint; |
| o:Undo() | procedure Undo; virtual; |
| o:ValidateEdit() | procedure ValidateEdit; virtual; |

| Lua examples | FP declaration |
| --- | --- |
| o.CaseSensitiveOptions = value
result = o.CaseSensitiveOptions | Property CaseSensitiveOptions : Boolean Read FCaseSensitiveOptions Write FCaseSensitiveOptions; |
| result = o:CheckOptions(ShortOptions,Longopts,Opts,NonOpts)
result = o:CheckOptions(ShortOptions,Longopts,Opts,NonOpts,AllErrors) | Function CheckOptions(Const ShortOptions : String; Const Longopts : TStrings; Opts,NonOpts : TStrings; AllErrors : Boolean = False) : String; |
| result = o:CheckOptions2(ShortOptions,Longopts,Opts,NonOpts)
result = o:CheckOptions2(ShortOptions,Longopts,Opts,NonOpts,AllErrors) | Function CheckOptions(Const ShortOptions : String; Const Longopts : Array of string; Opts,NonOpts : TStrings; AllErrors : Boolean = False) : String; |
| result = o:CheckOptions3(ShortOptions,Longopts)
result = o:CheckOptions3(ShortOptions,Longopts,AllErrors) | Function CheckOptions(Const ShortOptions : String; Const Longopts : TStrings; AllErrors : Boolean = False) : String; |
| result = o:CheckOptions4(ShortOptions,LongOpts)
result = o:CheckOptions4(ShortOptions,LongOpts,AllErrors) | Function CheckOptions(Const ShortOptions : String; Const LongOpts : Array of string; AllErrors : Boolean = False) : String; |
| result = o:CheckOptions5(ShortOptions,LongOpts)
result = o:CheckOptions5(ShortOptions,LongOpts,AllErrors) | Function CheckOptions(Const ShortOptions : String; Const LongOpts : String; AllErrors : Boolean = False) : String; |
| result = o.ConsoleApplication | Property ConsoleApplication : Boolean Read GetConsoleApplication; |
| result = o:EnvironmentVariable(envName) | Property EnvironmentVariable[envName : String] : String Read GetEnvironmentVar; |
| o.EventLogFilter = value
result = o.EventLogFilter | Property EventLogFilter : TEventLogTypes Read FEventLogFilter Write FEventLogFilter; |
| o.ExceptionExitCode = value
result = o.ExceptionExitCode | Property ExceptionExitCode : Longint Read FExceptionExitCode Write FExceptionExitCode; |
| result = o.ExeName | property ExeName: string read GetExeName; |
| result, Longopt = o:FindOptionIndex(S)
result, Longopt = o:FindOptionIndex(S,StartAt) | function FindOptionIndex(Const S : String; Var Longopt : Boolean; StartAt : Integer = -1) : Integer; |
| result, Longopt = o:FindOptionIndex2(S,Longopt)
result, Longopt = o:FindOptionIndex2(S,Longopt,StartAt) | function FindOptionIndex(Const S : String; Var Longopt : Boolean; StartAt : Integer = -1) : Integer; |
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
| o.HelpFile = value
result = o.HelpFile | property HelpFile: string read FHelpFile write FHelpFile; |
| o:Initialize() | procedure Initialize; virtual; |
| result = o.Location | Property Location : String Read GetLocation; |
| o:Log(EventType,Msg) | Procedure Log(EventType : TEventType; const Msg : String); |
| o.OnException = function(Sender,E) end | property OnException: TExceptionEvent read FOnException write FOnException; |
| o.OptionChar = value
result = o.OptionChar | Property OptionChar : Char Read FoptionChar Write FOptionChar; |
| result = o.ParamCount | Property ParamCount : Integer Read GetParamCount; |
| result = o:Params(Index) | Property Params [Index : integer] : String Read GetParams; |
| o:Run() | procedure Run; |
| o:ShowException(E) | procedure ShowException(E: Exception);virtual; |
| o.SingleInstanceEnabled = value
result = o.SingleInstanceEnabled | Property SingleInstanceEnabled: Boolean read FSingleInstanceEnabled write FSingleInstanceEnabled; |
| o.StopOnException = value
result = o.StopOnException | Property StopOnException : Boolean Read FStopOnException Write FStopOnException; |
| o:Terminate() | procedure Terminate; virtual; |
| o:Terminate2(AExitCode) | procedure Terminate(AExitCode : Integer) ; virtual; |
| result = o.Terminated | property Terminated: Boolean read FTerminated; |
| o.Title = value
result = o.Title | property Title: string read FTitle write SetTitle; |

| Lua examples | FP declaration |
| --- | --- |
| o.Handle = value
result = o.Handle | property Handle: HBITMAP read GetBitmapHandle write SetBitmapHandle; |
| o.HandleType = value
result = o.HandleType | property HandleType: TBitmapHandleType read GetHandleType write SetHandleType; |
| o.Monochrome = value
result = o.Monochrome | property Monochrome: Boolean read GetMonochrome write SetMonochrome; |
| result = o:ReleaseHandle() | function ReleaseHandle: HBITMAP; |
| o:SetSize(AWidth,AHeight) | procedure SetSize(AWidth, AHeight: integer); override; |

| Lua examples | FP declaration |
| --- | --- |
| o.Canvas = value
result = o.Canvas | property Canvas: TCanvas read FCanvas write FCanvas; |
| o.OnPaint = function(Sender) end | property OnPaint: TNotifyEvent read FOnPaint write FOnPaint; |

| Lua examples | FP declaration |
| --- | --- |
| result = o.Active | property Active: Boolean read FActive; |
| o.ActiveControl = value
result = o.ActiveControl | property ActiveControl: TWinControl read FActiveControl write SetActiveControl; |
| o.ActiveDefaultControl = value
result = o.ActiveDefaultControl | property ActiveDefaultControl: TControl read FActiveDefaultControl write SetActiveDefaultControl; |
| result = o:ActiveMDIChild() | function ActiveMDIChild: TCustomForm; virtual; |
| o:AfterConstruction() | procedure AfterConstruction; override; |
| o.AllowDropFiles = value
result = o.AllowDropFiles | property AllowDropFiles: Boolean read FAllowDropFiles write SetAllowDropFiles default False; |
| o.AlphaBlend = value
result = o.AlphaBlend | property AlphaBlend: Boolean read FAlphaBlend write SetAlphaBlend; |
| o.AlphaBlendValue = value
result = o.AlphaBlendValue | property AlphaBlendValue: Byte read FAlphaBlendValue write SetAlphaBlendValue; |
| o:AutoScale() | procedure AutoScale; |
| result = o:BigIconHandle() | function BigIconHandle: HICON; |
| o.BorderStyle = value
result = o.BorderStyle | property BorderStyle: TFormBorderStyle read FFormBorderStyle write SetFormBorderStyle default bsSizeable; |
| o.CancelControl = value
result = o.CancelControl | property CancelControl: TControl read FCancelControl write SetCancelControl; |
| o:Close() | procedure Close; |
| result = o:CloseQuery() | function CloseQuery: Boolean; virtual; |
| o.DefaultControl = value
result = o.DefaultControl | property DefaultControl: TControl read FDefaultControl write SetDefaultControl; |
| o.DefaultMonitor = value
result = o.DefaultMonitor | property DefaultMonitor: TDefaultMonitor read FDefaultMonitor write FDefaultMonitor default dmActiveForm; |
| o:DefocusControl(Control,Removing) | procedure DefocusControl(Control: TWinControl; Removing: Boolean); |
| o:DestroyWnd() | procedure DestroyWnd; override; |
| result = o.EffectiveShowInTaskBar | property EffectiveShowInTaskBar: TShowInTaskBar read GetEffectiveShowInTaskBar; |
| o:EnsureVisible()
o:EnsureVisible(AMoveToTop) | procedure EnsureVisible(AMoveToTop: Boolean = True); |
| o:FocusControl(WinControl) | procedure FocusControl(WinControl: TWinControl); |
| result = o.FormState | property FormState: TFormState read FFormState; |
| o.FormStyle = value
result = o.FormStyle | property FormStyle: TFormStyle read FFormStyle write SetFormStyle default fsNormal; |
| result = o:GetFormImage() | function GetFormImage: TBitmap; |
| result = o:GetMDIChildren(AIndex) | function GetMDIChildren(AIndex: Integer): TCustomForm; virtual; |
| result = o:GetRealPopupParent() | function GetRealPopupParent: TCustomForm; |
| result = o:GetRolesForControl(AControl) | function GetRolesForControl(AControl: TControl): TControlRolesForForm; |
| o.HelpFile = value
result = o.HelpFile | property HelpFile: string read FHelpFile write FHelpFile; |
| o:Hide() | procedure Hide; |
| o.Icon = value
result = o.Icon | property Icon: TIcon read FIcon write SetIcon stored IsIconStored; |
| o:IntfDropFiles(FileNames) | procedure IntfDropFiles(const FileNames: array of string); |
| o:IntfHelp(AComponent) | procedure IntfHelp(AComponent: TComponent); |
| o.KeyPreview = value
result = o.KeyPreview | property KeyPreview: Boolean read FKeyPreview write FKeyPreview default False; |
| result = o.LastActiveControl | property LastActiveControl: TWinControl read FLastActiveControl; |
| result = o:MDIChildCount() | function MDIChildCount: Integer; virtual; |
| result = o:MDIChildren(I) | property MDIChildren[I: Integer]: TCustomForm read GetMDIChildren; |
| o:MakeFullyVisible()
...
o:MakeFullyVisible(AMonitor,UseWorkarea) | procedure MakeFullyVisible(AMonitor: TMonitor = nil; UseWorkarea: Boolean = True); |
| o.Menu = value
result = o.Menu | property Menu : TMainMenu read FMenu write SetMenu; |
| o.ModalResult = value
result = o.ModalResult | property ModalResult : TModalResult read FModalResult write SetModalResult; |
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
| o.PopupMode = value
result = o.PopupMode | property PopupMode: TPopupMode read FPopupMode write SetPopupMode default pmNone; |
| o.PopupParent = value
result = o.PopupParent | property PopupParent: TCustomForm read FPopupParent write SetPopupParent; |
| o.Position = value
result = o.Position | property Position: TPosition read FPosition write SetPosition default poDesigned; |
| o:Release() | procedure Release; |
| result = o.RestoredHeight | property RestoredHeight: Integer read FRestoredHeight; |
| result = o.RestoredLeft | property RestoredLeft: Integer read FRestoredLeft; |
| result = o.RestoredTop | property RestoredTop: Integer read FRestoredTop; |
| result = o.RestoredWidth | property RestoredWidth: Integer read FRestoredWidth; |
| o.ScreenSnap = value
result = o.ScreenSnap | property ScreenSnap: boolean read GetScreenSnap write SetScreenSnap stored false; |
| result = o:SetFocusedControl(Control) | function SetFocusedControl(Control: TWinControl): Boolean ; virtual; |
| o:SetRestoredBounds(ALeft,ATop,AWidth,AHeight)
o:SetRestoredBounds(ALeft,ATop,AWidth,AHeight,ADefaultPosition) | procedure SetRestoredBounds(ALeft, ATop, AWidth, AHeight: Integer; const ADefaultPosition: Boolean = False); |
| o:Show() | procedure Show; |
| o.ShowInTaskBar = value
result = o.ShowInTaskBar | property ShowInTaskBar: TShowInTaskbar read FShowInTaskbar write SetShowInTaskBar default stDefault; |
| result = o:ShowModal() | function ShowModal: Integer; virtual; |
| o:ShowOnTop() | procedure ShowOnTop; |
| result = o:SmallIconHandle() | function SmallIconHandle: HICON; |
| o.SnapBuffer = value
result = o.SnapBuffer | property SnapBuffer: integer read GetSnapBuffer write SetSnapBuffer stored false; |
| o.SnapOptions = value
result = o.SnapOptions | property SnapOptions: TWindowMagnetOptions read FSnapOptions write SetSnapOptions; |
| o.WindowState = value
result = o.WindowState | property WindowState: TWindowState read FWindowState write SetWindowState default wsNormal; |

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
| o:EndUpdate()
o:EndUpdate(aRefresh) | procedure EndUpdate(aRefresh: boolean = true); |
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
| o.SortOrder = value
result = o.SortOrder | property SortOrder: TSortOrder read FSortOrder write FSortOrder; |

| Lua examples | FP declaration |
| --- | --- |
| result = o.Memory | property Memory: Pointer read FMemory; |
| o:SaveToFile(FileName) | procedure SaveToFile(const FileName: string); |
| o:SaveToStream(Stream) | procedure SaveToStream(Stream: TStream); |

| Lua examples | FP declaration |
| --- | --- |
| result = o:CanTab() | function CanTab: boolean; override; |
| o.ImageIndex = value
result = o.ImageIndex | property ImageIndex: TImageIndex read FImageIndex write SetImageIndex default -1; |
| o.OnHide = function(Sender) end | property OnHide: TNotifyEvent read FOnHide write FOnHide; |
| o.OnShow = function(Sender) end | property OnShow: TNotifyEvent read FOnShow write FOnShow; |
| o.PageIndex = value
result = o.PageIndex | property PageIndex: Integer read GetPageIndex write SetPageIndex; |
| o.TabVisible = value
result = o.TabVisible | property TabVisible: Boolean read GetTabVisible write SetTabVisible default True; |
| result = o:VisibleIndex() | function VisibleIndex: integer; virtual; |

| Lua examples | FP declaration |
| --- | --- |
| o.AutoFreeHook = value
result = o.AutoFreeHook | property AutoFreeHook: boolean read FAutoFreeHook write SetAutoFreeHook; |
| o.SaveOnChangeTIObject = value
result = o.SaveOnChangeTIObject | property SaveOnChangeTIObject: boolean read FSaveOnChangeTIObject write FSaveOnChangeTIObject default true; |
| o.TIObject = value
result = o.TIObject | property TIObject: TPersistent read GetTIObject write SetTIObject; |

| Lua examples | FP declaration |
| --- | --- |
| result = o:CanChangePageIndex() | function CanChangePageIndex: boolean; virtual; |
| result = o:CustomPage(Index) | function CustomPage(Index: integer): TCustomPage; |
| o:DoCloseTabClicked(APage) | procedure DoCloseTabClicked(APage: TCustomPage); virtual; |
| result = o:GetCapabilities() | function GetCapabilities: TCTabControlCapabilities; virtual; |
| result = o:GetImageIndex(ThePageIndex) | function GetImageIndex(ThePageIndex: Integer): Integer; virtual; |
| result = o:GetMinimumTabHeight() | function GetMinimumTabHeight: integer; virtual; |
| result = o:GetMinimumTabWidth() | function GetMinimumTabWidth: integer; virtual; |
| o.HotTrack = value
result = o.HotTrack | property HotTrack: Boolean read FHotTrack write FHotTrack default False; |
| o.Images = value
result = o.Images | property Images: TCustomImageList read FImages write SetImages; |
| o.ImagesWidth = value
result = o.ImagesWidth | property ImagesWidth: Integer read FImagesWidth write SetImagesWidth default 0; |
| result = o:IndexOf(APage) | function IndexOf(APage: TPersistent): integer; virtual; |
| o.MultiLine = value
result = o.MultiLine | property MultiLine: Boolean read GetMultiLine write SetMultiLine default False; |
| o.MultiSelect = value
result = o.MultiSelect | property MultiSelect: Boolean read FMultiSelect write FMultiSelect default False; |
| o.OnChange = function(Sender) end | property OnChange: TNotifyEvent read FOnPageChanged write FOnPageChanged; |
| o.OnChanging = function(Sender,AllowChange) return AllowChange end | property OnChanging: TTabChangingEvent read FOnChanging write FOnChanging; |
| o.OnCloseTabClicked = function(Sender) end | property OnCloseTabClicked: TNotifyEvent read FOnCloseTabClicked write FOnCloseTabClicked; |
| o.OnGetImageIndex = function(Sender,TabIndex,ImageIndex) return ImageIndex end | property OnGetImageIndex: TTabGetImageEvent read FOnGetImageIndex write FOnGetImageIndex; |
| o.Options = value
result = o.Options | property Options: TCTabControlOptions read FOptions write SetOptions default []; |
| o.OwnerDraw = value
result = o.OwnerDraw | property OwnerDraw: Boolean read FOwnerDraw write FOwnerDraw default False; |
| result = o:Page(Index) | property Page[Index: Integer]: TCustomPage read GetPage; |
| result = o.PageCount | property PageCount: integer read GetPageCount; |
| o.PageIndex = value
result = o.PageIndex | property PageIndex: Integer read FPageIndex write SetPageIndex default -1; |
| result = o:PageToTabIndex(AIndex) | function PageToTabIndex(AIndex: integer): integer; |
| o.Pages = value
result = o.Pages | property Pages: TStrings read FAccess write SetPages; |
| o.RaggedRight = value
result = o.RaggedRight | property RaggedRight: Boolean read FRaggedRight write FRaggedRight default False; |
| o.ScrollOpposite = value
result = o.ScrollOpposite | property ScrollOpposite: Boolean read FScrollOpposite write FScrollOpposite default False; |
| o.ShowTabs = value
result = o.ShowTabs | property ShowTabs: Boolean read FShowTabs write SetShowTabs default True; |
| o.Style = value
result = o.Style | property Style: TTabStyle read FStyle write SetStyle default tsTabs; |
| o.TabHeight = value
result = o.TabHeight | property TabHeight: Smallint read FTabHeight write SetTabHeight stored TabHeightIsStored; |
| o.TabPosition = value
result = o.TabPosition | property TabPosition: TTabPosition read FTabPosition write SetTabPosition default tpTop; |
| result = o:TabRect(AIndex) | function TabRect(AIndex: Integer): TRect; |
| result = o:TabToPageIndex(AIndex) | function TabToPageIndex(AIndex: integer): integer; |
| o.TabWidth = value
result = o.TabWidth | property TabWidth: Smallint read FTabWidth write SetTabWidth stored TabWidthIsStored; |

| Lua examples | FP declaration |
| --- | --- |
| o.Date = value
result = o.Date | property Date: TDateTime read GetDate write SetDate; |
| result = o.DroppedDown | property DroppedDown: Boolean read FDroppedDown; |
| result = o:GetDateFormat() | function GetDateFormat: string; |

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

| Lua examples | FP declaration |
| --- | --- |
| o:RunDialog() | procedure RunDialog; virtual; |

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

| Lua examples | FP declaration |
| --- | --- |
| ARect = o:AdjustDockRect(AControl) | procedure AdjustDockRect(AControl: TControl; var ARect: TRect); virtual; |
| ARect = o:AdjustDockRect2(AControl,ARect) | procedure AdjustDockRect(AControl: TControl; var ARect: TRect); virtual; |
| o.DockSite = value
result = o.DockSite | property DockSite: TWinControl read FDockSite write SetDockSite; |
| o:DumpLayout(FileName) | procedure DumpLayout(FileName: string); virtual; |
| result = o.RootZone | property RootZone: TDockZone read FRootZone; |

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
| o.Height = value
result = o.Height | property Height: Integer read GetHeight write SetHeight; |
| o.Left = value
result = o.Left | property Left: Integer read GetLeft write SetLeft; |
| o.LimitBegin = value
result = o.LimitBegin | property LimitBegin: Integer read GetLimitBegin write SetLimitBegin; |
| o.LimitSize = value
result = o.LimitSize | property LimitSize: Integer read GetLimitSize write SetLimitSize; |
| result = o.NextSibling | property NextSibling: TDockZone read FNextSibling; |
| result = o:NextVisible() | function NextVisible: TDockZone; |
| o.Orientation = value
result = o.Orientation | property Orientation: TDockOrientation read FOrientation write FOrientation; |
| result = o.Parent | property Parent: TDockZone read FParentZone; |
| result = o.PrevSibling | property PrevSibling: TDockZone read FPrevSibling; |
| result = o:PrevVisible() | function PrevVisible: TDockZone; |
| o:Remove(ChildZone) | procedure Remove(ChildZone: TDockZone); |
| o:ReplaceChild(OldChild,NewChild) | procedure ReplaceChild(OldChild, NewChild: TDockZone); |
| o.Top = value
result = o.Top | property Top: Integer read GetTop write SetTop; |
| result = o.Tree | property Tree: TDockTree read FTree; |
| result = o.Visible | property Visible: Boolean read GetVisible; |
| result = o.VisibleChildCount | property VisibleChildCount: Integer read GetVisibleChildCount; |
| o.Width = value
result = o.Width | property Width: Integer read GetWidth write SetWidth; |

| Lua examples | FP declaration |
| --- | --- |
| o.DockOffset = value
result = o.DockOffset | property DockOffset: TPoint read FDockOffset write FDockOffset; |
| o.DockRect = value
result = o.DockRect | property DockRect: TRect read FDockRect write FDockRect; |
| o.DropAlign = value
result = o.DropAlign | property DropAlign: TAlign read FDropAlign write FDropAlign; |
| o.DropOnControl = value
result = o.DropOnControl | property DropOnControl: TControl read FDropOnControl write FDropOnControl; |
| o.EraseDockRect = value
result = o.EraseDockRect | property EraseDockRect: TRect read FEraseDockRect write FEraseDockRect; |
| o.Floating = value
result = o.Floating | property Floating: Boolean read FFloating write FFloating; |
| result = o.IncreaseDockArea | property IncreaseDockArea: Boolean read FIncreaseDockArea; |

| Lua examples | FP declaration |
| --- | --- |
| o.AlwaysShowDragImages = value
result = o.AlwaysShowDragImages | property AlwaysShowDragImages: Boolean read FAlwaysShowDragImages write FAlwaysShowDragImages; |
| result = o.AutoCreated | property AutoCreated: Boolean read FAutoCreated; |
| result = o.AutoFree | property AutoFree: Boolean read FAutoFree; |
| o.Control = value
result = o.Control | property Control: TControl read FControl write FControl; |
| o.DragPos = value
result = o.DragPos | property DragPos: TPoint read FDragPos write FDragPos; |
| o.DragTarget = value
result = o.DragTarget | property DragTarget: TControl read FDragTarget write FDragTarget; |
| o.DragTargetPos = value
result = o.DragTargetPos | property DragTargetPos: TPoint read FDragTargetPos write FDragTargetPos; |
| result = o.Dropped | property Dropped: Boolean read FDropped; |
| o:HideDragImage() | procedure HideDragImage; virtual; |
| o:ShowDragImage() | procedure ShowDragImage; virtual; |

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

| Lua examples | FP declaration |
| --- | --- |
| o.Alignment = value
result = o.Alignment | property Alignment: TAlignment read FAlignment write SetAlignment default taLeftJustify; |
| result = o.CanUndo | property CanUndo: Boolean read GetCanUndo; |
| o.CaretPos = value
result = o.CaretPos | property CaretPos: TPoint read GetCaretPos write SetCaretPos; |
| o.CharCase = value
result = o.CharCase | property CharCase: TEditCharCase read FCharCase write SetCharCase default ecNormal; |
| o:Clear() | procedure Clear; |
| o:ClearSelection() | procedure ClearSelection; virtual; |
| o:CopyToClipboard() | procedure CopyToClipboard; virtual; |
| o:CutToClipboard() | procedure CutToClipboard; virtual; |
| o.EchoMode = value
result = o.EchoMode | property EchoMode: TEchoMode read FEchoMode write SetEchoMode default emNormal; |
| result = o.EmulatedTextHintStatus | property EmulatedTextHintStatus: TEmulatedTextHintStatus read FEmulatedTextHintStatus; |
| o.HideSelection = value
result = o.HideSelection | property HideSelection: Boolean read FHideSelection write SetHideSelection default True; |
| o.MaxLength = value
result = o.MaxLength | property MaxLength: Integer read FMaxLength write SetMaxLength default 0; |
| o.Modified = value
result = o.Modified | property Modified: Boolean read GetModified write SetModified; |
| o.NumbersOnly = value
result = o.NumbersOnly | property NumbersOnly: Boolean read GetNumbersOnly write SetNumbersOnly default false; |
| o.OnChange = function(Sender) end | property OnChange: TNotifyEvent read FOnChange write FOnChange; |
| o.PasswordChar = value
result = o.PasswordChar | property PasswordChar: Char read FPasswordChar write SetPasswordChar default #0; |
| o:PasteFromClipboard() | procedure PasteFromClipboard; virtual; |
| o.ReadOnly = value
result = o.ReadOnly | property ReadOnly: Boolean read GetReadOnly write SetReadOnly default false; |
| o.SelLength = value
result = o.SelLength | property SelLength: integer read GetSelLength write SetSelLength; |
| o.SelStart = value
result = o.SelStart | property SelStart: integer read GetSelStart write SetSelStart; |
| o.SelText = value
result = o.SelText | property SelText: String read GetSelText write SetSelText; |
| o:SelectAll() | procedure SelectAll; virtual; |
| o.TextHint = value
result = o.TextHint | property TextHint: TTranslateString read GetTextHint write SetTextHint; |
| o:Undo() | procedure Undo; virtual; |

| Lua examples | FP declaration |
| --- | --- |
| o.OnButtonClick = function(Sender) end | property OnButtonClick: TNotifyEvent read GetOnButtonClick write SetOnButtonClick; |

| Lua examples | FP declaration |
| --- | --- |
| o.HelpContext = value
result = o.HelpContext | property HelpContext : longint read fhelpcontext write fhelpcontext; |
| o.Message = value
result = o.Message | property Message : string read fmessage write fmessage; |
| result = o:ToString() | Function ToString : String; override; |

| Lua examples | FP declaration |
| --- | --- |
| o.Bold = value
result = o.Bold | property Bold : boolean index 5 read GetFlags write SetFlags; |
| result = o:CopyFont() | function CopyFont : TFPCustomFont; |
| result = o:GetTextHeight(text) | function GetTextHeight (text:string) : integer; |
| w, h = o:GetTextSize(text) | procedure GetTextSize (text:string; var w,h:integer); |
| w, h = o:GetTextSize2(text,w,h) | procedure GetTextSize (text:string; var w,h:integer); |
| result = o:GetTextWidth(text) | function GetTextWidth (text:string) : integer; |
| o.Italic = value
result = o.Italic | property Italic : boolean index 6 read GetFlags write SetFlags; |
| o.Name = value
result = o.Name | property Name : string read FName write SetName; |
| o.Orientation = value
result = o.Orientation | property Orientation: Integer read GetOrientation write SetOrientation default 0; |
| o.Size = value
result = o.Size | property Size : integer read FSize write SetSize; |
| o.StrikeThrough = value
result = o.StrikeThrough | property StrikeThrough : boolean index 8 read GetFlags write SetFlags; |
| o.Underline = value
result = o.Underline | property Underline : boolean index 7 read GetFlags write SetFlags; |

| Lua examples | FP declaration |
| --- | --- |
| o:DoTypeChange() | procedure DoTypeChange; virtual; |
| result = o:ExtractAllFilterMasks(aFilter)
result = o:ExtractAllFilterMasks(aFilter,SkipAllFilesMask) | class function ExtractAllFilterMasks(aFilter: string; SkipAllFilesMask: Boolean = true): string; |
| result = o.Files | property Files: TStrings read FFiles; |
| result = o:FindMaskInFilter(aFilter,aMask) | class function FindMaskInFilter(aFilter, aMask: string): Integer; |
| o.HistoryList = value
result = o.HistoryList | property HistoryList: TStrings read FHistoryList write SetHistoryList; |
| o:IntfFileTypeChanged(NewFilterIndex) | procedure IntfFileTypeChanged(NewFilterIndex: Integer); |

| Lua examples | FP declaration |
| --- | --- |
| result = o.DialogFiles | property DialogFiles: TStrings read FDialogFiles; |
| o:RunDialog() | procedure RunDialog; virtual; |

| Lua examples | FP declaration |
| --- | --- |
| o:CloseDialog() | procedure CloseDialog; |
| o.Left = value
result = o.Left | property Left: Integer read GetLeft write SetLeft; |
| o.OnReplace = function(Sender) end | property OnReplace: TNotifyEvent read FOnReplace write FOnReplace; |
| o.Position = value
result = o.Position | property Position: TPoint read GetPosition write SetPosition; |
| o.Top = value
result = o.Top | property Top: Integer read GetTop write SetTop; |

| Lua examples | FP declaration |
| --- | --- |
| o.DecimalPlaces = value
result = o.DecimalPlaces | property DecimalPlaces: Integer read FDecimals write SetDecimals default DefDecimals; |
| o.EditorEnabled = value
result = o.EditorEnabled | property EditorEnabled: Boolean read FEditorEnabled write SetEditorEnabled default True; |
| result = o:GetLimitedValue(AValue) | function GetLimitedValue(const AValue: Double): Double; virtual; |
| o.Increment = value
result = o.Increment | property Increment: Double read FIncrement write SetIncrement stored IncrementStored nodefault; |
| o.MaxValue = value
result = o.MaxValue | property MaxValue: Double read FMaxValue write SetMaxValue stored MaxValueStored nodefault; |
| o.MinValue = value
result = o.MinValue | property MinValue: Double read FMinValue write SetMinValue; |
| result = o:StrToValue(S) | function StrToValue(const S: string): Double; virtual; |
| o.Value = value
result = o.Value | property Value: Double read GetValue write SetValue; |
| o.ValueEmpty = value
result = o.ValueEmpty | property ValueEmpty: Boolean read FValueEmpty write SetValueEmpty default False; |
| result = o:ValueToStr(AValue) | function ValueToStr(const AValue: Double): string; virtual; |

| Lua examples | FP declaration |
| --- | --- |
| o:BeginUpdate() | procedure BeginUpdate; |
| o:EndUpdate() | procedure EndUpdate; |
| o.Handle = value
result = o.Handle | property Handle: HFONT read GetHandle write SetHandle; |
| result = o:HandleAllocated() | function HandleAllocated: boolean; |
| result = o:IsDefault() | function IsDefault: boolean; |
| result = o:IsEqual(AFont) | function IsEqual(AFont: TFont): boolean; virtual; |
| result = o.IsMonoSpace | property IsMonoSpace: boolean read GetIsMonoSpace; |
| o.PixelsPerInch = value
result = o.PixelsPerInch | property PixelsPerInch: Integer read FPixelsPerInch write SetPixelsPerInch; |
| o:SetDefault() | procedure SetDefault; |

| Lua examples | FP declaration |
| --- | --- |
| o:ApplyClicked() | procedure ApplyClicked; virtual; |

| Lua examples | FP declaration |
| --- | --- |
| o:ArrangeIcons() | procedure ArrangeIcons; |
| o:Cascade() | procedure Cascade; |
| o:Next() | procedure Next; |
| o:Previous() | procedure Previous; |
| o:Tile() | procedure Tile; |

| Lua examples | FP declaration |
| --- | --- |
| o:Clear() | procedure Clear; virtual; |
| result = o.Empty | property Empty: Boolean read GetEmpty; |
| result = o:Equals(Obj) | function Equals(Obj: TObject): Boolean; override; overload; |
| result = o:GetFileExtensions() | class function GetFileExtensions: string; virtual; |
| result = o:GetResourceType() | function GetResourceType: TResourceType; virtual; |
| o:GetSupportedSourceMimeTypes(List) | procedure GetSupportedSourceMimeTypes(List: TStrings); virtual; |
| o.Height = value
result = o.Height | property Height: Integer read GetHeight write SetHeight; |
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
| o.Modified = value
result = o.Modified | property Modified: Boolean read FModified write SetModified; |
| o.OnChange = function(Sender) end | property OnChange: TNotifyEvent read FOnChange write FOnChange; |
| o.OnProgress = function(Sender,Stage,PercentDone,RedrawNow,R,Msg,Continue) return Continue end | property OnProgress: TProgressEvent read FOnProgress write FOnProgress; |
| o.PaletteModified = value
result = o.PaletteModified | property PaletteModified: Boolean read FPaletteModified write FPaletteModified; |
| o:SaveToClipboardFormat(FormatID) | procedure SaveToClipboardFormat(FormatID: TClipboardFormat); virtual; |
| o:SaveToClipboardFormatID(ClipboardType,FormatID) | procedure SaveToClipboardFormatID(ClipboardType: TClipboardType; FormatID: TClipboardFormat); virtual; |
| o:SaveToFile(Filename) | procedure SaveToFile(const Filename: string); virtual; |
| o:SaveToStream(Stream) | procedure SaveToStream(Stream: TStream); virtual; abstract; |
| o.Transparent = value
result = o.Transparent | property Transparent: Boolean read GetTransparent write SetTransparent; |
| o.Width = value
result = o.Width | property Width: Integer read GetWidth write SetWidth; |

| Lua examples | FP declaration |
| --- | --- |
| result = o.Canvas | property Canvas: TCanvas read FCanvas; |
| o.OnPaint = function(Sender) end | property OnPaint: TNotifyEvent read FOnPaint write FOnPaint; |

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
| result = o:Items(Index)
o:Items(Index,value) | property Items[Index: Integer]: TGridColumn read GetColumn write SetColumn; default; |
| result = o:RealIndex(Index) | function RealIndex(Index: Integer): Integer; |
| result = o.VisibleCount | property VisibleCount: Integer read GetVisibleCount; |
| result = o:VisibleIndex(Index) | function VisibleIndex(Index: Integer): Integer; |

| Lua examples | FP declaration |
| --- | --- |
| o:ChangeScale(M,D) | procedure ChangeScale(M, D: Integer);override; |
| o:Click() | procedure Click; override; |
| o:DblClick() | procedure DblClick; override; |
| result = o:GetSectionAt(P) | function GetSectionAt(P: TPoint): Integer; |
| o:Paint() | procedure Paint; override; |
| o:PaintSection(Index) | procedure PaintSection(Index: Integer); virtual; |
| result = o:SectionFromOriginalIndex(OriginalIndex) | property SectionFromOriginalIndex[OriginalIndex: Integer]: THeaderSection read GetSectionFromOriginalIndex; |

| Lua examples | FP declaration |
| --- | --- |
| o.AutoEnabled = value
result = o.AutoEnabled | property AutoEnabled: boolean read FAutoEnabled write SetAutoEnabled default False; |
| o.AutoEndEvent = value
result = o.AutoEndEvent | property AutoEndEvent: TIdleTimerAutoEvent read FAutoEndEvent write FAutoEndEvent default itaOnUserInput; |
| o.AutoStartEvent = value
result = o.AutoStartEvent | property AutoStartEvent: TIdleTimerAutoEvent read FAutoStartEvent write FAutoStartEvent default itaOnIdle; |
| o.FireOnIdle = value
result = o.FireOnIdle | property FireOnIdle: boolean read FFireOnIdle write FFireOnIdle default false; |

| Lua examples | FP declaration |
| --- | --- |
| o.AntialiasingMode = value
result = o.AntialiasingMode | property AntialiasingMode: TAntialiasingMode read FAntialiasingMode write SetAntialiasingMode default amDontCare; |
| result = o.Canvas | property Canvas: TCanvas read GetCanvas; |
| o.Center = value
result = o.Center | property Center: Boolean read FCenter write SetCenter default False; |
| result = o:DestRect() | function DestRect: TRect; virtual; |
| result = o.HasGraphic | property HasGraphic: Boolean read GetHasGraphic; |
| o.ImageIndex = value
result = o.ImageIndex | property ImageIndex: Integer read FImageIndex write SetImageIndex default 0; |
| o.ImageWidth = value
result = o.ImageWidth | property ImageWidth: Integer read FImageWidth write SetImageWidth default 0; |
| o.Images = value
result = o.Images | property Images: TCustomImageList read FImages write SetImages; |
| o.KeepOriginXWhenClipped = value
result = o.KeepOriginXWhenClipped | property KeepOriginXWhenClipped: Boolean read FKeepOriginXWhenClipped write SetKeepOriginX default False; |
| o.KeepOriginYWhenClipped = value
result = o.KeepOriginYWhenClipped | property KeepOriginYWhenClipped: Boolean read FKeepOriginYWhenClipped write SetKeepOriginY default False; |
| o.OnPaintBackground = function(ASender,ACanvas,ARect) end | property OnPaintBackground: TImagePaintBackgroundEvent read FOnPaintBackground write FOnPaintBackground; |
| o.OnPictureChanged = function(Sender) end | property OnPictureChanged: TNotifyEvent read FOnPictureChanged write FOnPictureChanged; |
| o.Picture = value
result = o.Picture | property Picture: TPicture read FPicture write SetPicture; |
| o.Proportional = value
result = o.Proportional | property Proportional: Boolean read FProportional write SetProportional default False; |
| o.Stretch = value
result = o.Stretch | property Stretch: Boolean read FStretch write SetStretch default False; |
| o.StretchInEnabled = value
result = o.StretchInEnabled | property StretchInEnabled: Boolean read FStretchInEnabled write SetStretchInEnabled default True; |
| o.StretchOutEnabled = value
result = o.StretchOutEnabled | property StretchOutEnabled: Boolean read FStretchOutEnabled write SetStretchOutEnabled default True; |
| o.Transparent = value
result = o.Transparent | property Transparent: Boolean read FTransparent write SetTransparent default False; |

| Lua examples | FP declaration |
| --- | --- |
| result = o:Add(Image,Mask) | function Add(Image, Mask: TCustomBitmap): Integer; |
| result = o:AddIcon(Image) | function AddIcon(Image: TCustomIcon): Integer; |
| o:AddImages(AValue) | procedure AddImages(AValue: TCustomImageList); |
| result = o:AddLazarusResource(ResourceName)
result = o:AddLazarusResource(ResourceName,MaskColor) | function AddLazarusResource(const ResourceName: string; MaskColor: TColor = clNone): integer; |
| result = o:AddMasked(Image,MaskColor) | function AddMasked(Image: TBitmap; MaskColor: TColor): Integer; |
| result = o:AddMultipleResolutions(Images) | function AddMultipleResolutions(Images: array of TCustomBitmap): Integer; |
| result = o:AddMultipleResolutions2(Images) | function AddMultipleResolutions(Images: array of TRasterImage): Integer; |
| result = o:AddResourceName(Instance,ResourceName)
result = o:AddResourceName(Instance,ResourceName,MaskColor) | function AddResourceName(Instance: THandle; const ResourceName: string; MaskColor: TColor = clNone): integer; |
| result = o:AddSlice(Image,AImageRect) | function AddSlice(Image: TCustomBitmap; AImageRect: TRect): Integer; |
| result = o:AddSliceCentered(Image) | function AddSliceCentered(Image: TCustomBitmap): Integer; |
| result = o:AddSliced(Image,AHorizontalCount,AVerticalCount) | function AddSliced(Image: TCustomBitmap; AHorizontalCount, AVerticalCount: Integer): Integer; |
| o.AllocBy = value
result = o.AllocBy | property AllocBy: Integer read FAllocBy write FAllocBy default 4; |
| o:Assign(Source) | procedure Assign(Source: TPersistent); override; |
| o:AssignTo(Dest) | procedure AssignTo(Dest: TPersistent); override; |
| o:BeginUpdate() | procedure BeginUpdate; |
| o.BkColor = value
result = o.BkColor | property BkColor: TColor read FBkColor write SetBkColor default clNone; |
| o.BlendColor = value
result = o.BlendColor | property BlendColor: TColor read FBlendColor write FBlendColor default clNone; |
| o:Change() | procedure Change; |
| o:Clear() | procedure Clear; |
| result = o.Count | property Count: Integer read GetCount; |
| o:Delete(AIndex) | procedure Delete(AIndex: Integer); |
| o:DeleteResolution(AWidth) | procedure DeleteResolution(const AWidth: Integer); |
| o:Draw(ACanvas,AX,AY,AIndex)
o:Draw(ACanvas,AX,AY,AIndex,AEnabled) | procedure Draw(ACanvas: TCanvas; AX, AY, AIndex: Integer; AEnabled: Boolean = True); overload; |
| o:Draw2(ACanvas,AX,AY,AIndex,ADrawEffect) | procedure Draw(ACanvas: TCanvas; AX, AY, AIndex: Integer; ADrawEffect: TGraphicsDrawEffect); overload; |
| o:Draw3(ACanvas,AX,AY,AIndex,ADrawingStyle,AImageType)
o:Draw3(ACanvas,AX,AY,AIndex,ADrawingStyle,AImageType,AEnabled) | procedure Draw(ACanvas: TCanvas; AX, AY, AIndex: Integer; ADrawingStyle: TDrawingStyle; AImageType: TImageType; AEnabled: Boolean = True); overload; |
| o:Draw4(ACanvas,AX,AY,AIndex,ADrawingStyle,AImageType,ADrawEffect) | procedure Draw(ACanvas: TCanvas; AX, AY, AIndex: Integer; ADrawingStyle: TDrawingStyle; AImageType: TImageType; ADrawEffect: TGraphicsDrawEffect); overload; |
| o:DrawForPPI(ACanvas,AX,AY,AIndex,AImageWidthAt96PPI,ATargetPPI,ACanvasFactor)
o:DrawForPPI(ACanvas,AX,AY,AIndex,AImageWidthAt96PPI,ATargetPPI,ACanvasFactor,AEnabled) | procedure DrawForPPI(ACanvas: TCanvas; AX, AY, AIndex: Integer; AImageWidthAt96PPI, ATargetPPI: Integer; ACanvasFactor: Double; AEnabled: Boolean = True); overload; |
| o:DrawForPPI2(ACanvas,AX,AY,AIndex,AImageWidthAt96PPI,ATargetPPI,ACanvasFactor,ADrawEffect) | procedure DrawForPPI(ACanvas: TCanvas; AX, AY, AIndex: Integer; AImageWidthAt96PPI, ATargetPPI: Integer; ACanvasFactor: Double; ADrawEffect: TGraphicsDrawEffect); overload; |
| o:DrawOverlay(ACanvas,AX,AY,AIndex,AOverlay)
o:DrawOverlay(ACanvas,AX,AY,AIndex,AOverlay,AEnabled) | procedure DrawOverlay(ACanvas: TCanvas; AX, AY, AIndex: Integer; AOverlay: TOverlay; AEnabled: Boolean = True); overload; |
| o:DrawOverlay2(ACanvas,AX,AY,AIndex,AOverlay,ADrawEffect) | procedure DrawOverlay(ACanvas: TCanvas; AX, AY, AIndex: Integer; AOverlay: TOverlay; ADrawEffect: TGraphicsDrawEffect); overload; |
| o:DrawOverlay3(ACanvas,AX,AY,AIndex,AOverlay,ADrawingStyle,AImageType,ADrawEffect) | procedure DrawOverlay(ACanvas: TCanvas; AX, AY, AIndex: Integer; AOverlay: TOverlay; ADrawingStyle: TDrawingStyle; AImageType: TImageType; ADrawEffect: TGraphicsDrawEffect); overload; |
| o.DrawingStyle = value
result = o.DrawingStyle | property DrawingStyle: TDrawingStyle read FDrawingStyle write SetDrawingStyle default dsNormal; |
| o:EndUpdate() | procedure EndUpdate; |
| result = o:Equals(Obj) | function Equals(Obj: TObject): boolean; |
| o:GetBitmap(Index,Image) | procedure GetBitmap(Index: Integer; Image: TCustomBitmap); overload; |
| o:GetBitmap2(Index,Image,AEffect) | procedure GetBitmap(Index: Integer; Image: TCustomBitmap; AEffect: TGraphicsDrawEffect); overload; |
| o:GetFullBitmap(Image)
o:GetFullBitmap(Image,AEffect) | procedure GetFullBitmap(Image: TCustomBitmap; AEffect: TGraphicsDrawEffect = gdeNormal); |
| result = o:GetHotSpot() | function GetHotSpot: TPoint; |
| o:GetIcon(Index,Image,AEffect) | procedure GetIcon(Index: Integer; Image: TIcon; AEffect: TGraphicsDrawEffect); overload; |
| o:GetIcon2(Index,Image) | procedure GetIcon(Index: Integer; Image: TIcon); overload; |
| result = o.HasOverlays | property HasOverlays: boolean read fHasOverlays; |
| o.Height = value
result = o.Height | property Height: Integer read FHeight write SetHeight default 16; |
| result = o:HeightForPPI(AImageWidth,APPI) | property HeightForPPI[AImageWidth, APPI: Integer]: Integer read GetHeightForPPI; |
| result = o:HeightForWidth(AWidth) | property HeightForWidth[AWidth: Integer]: Integer read GetHeightForWidth; |
| o.ImageType = value
result = o.ImageType | property ImageType: TImageType read FImageType write FImageType default itImage; |
| o:Insert(AIndex,AImage,AMask) | procedure Insert(AIndex: Integer; AImage, AMask: TCustomBitmap); |
| o:InsertIcon(AIndex,AIcon) | procedure InsertIcon(AIndex: Integer; AIcon: TCustomIcon); |
| o:InsertMasked(Index,AImage,MaskColor) | procedure InsertMasked(Index: Integer; AImage: TCustomBitmap; MaskColor: TColor); |
| o.Masked = value
result = o.Masked | property Masked: boolean read FMasked write SetMasked default False; |
| o:Move(ACurIndex,ANewIndex) | procedure Move(ACurIndex, ANewIndex: Integer); |
| o.OnChange = function(Sender) end | property OnChange: TNotifyEvent read FOnChange write FOnChange; |
| o.OnGetWidthForPPI = function(Sender,AImageWidth,APPI,AResultWidth) return AResultWidth end | property OnGetWidthForPPI: TCustomImageListGetWidthForPPI read FOnGetWidthForPPI write FOnGetWidthForPPI; |
| o:Overlay(AIndex,Overlay) | procedure Overlay(AIndex: Integer; Overlay: TOverlay); |
| o:ReadAdvData(AStream) | procedure ReadAdvData(AStream: TStream); virtual; |
| o:ReadData(AStream) | procedure ReadData(AStream: TStream); virtual; |
| o:RegisterChanges(Value) | procedure RegisterChanges(Value: TChangeLink); |
| o:RegisterResolutions(AResolutionWidths) | procedure RegisterResolutions(const AResolutionWidths: array of Integer); virtual; |
| o:Replace(AIndex,AImage,AMask)
o:Replace(AIndex,AImage,AMask,AllResolutions) | procedure Replace(AIndex: Integer; AImage, AMask: TCustomBitmap; const AllResolutions: Boolean = True); |
| o:ReplaceIcon(AIndex,AIcon) | procedure ReplaceIcon(AIndex: Integer; AIcon: TCustomIcon); |
| o:ReplaceMasked(Index,NewImage,MaskColor)
o:ReplaceMasked(Index,NewImage,MaskColor,AllResolutions) | procedure ReplaceMasked(Index: Integer; NewImage: TCustomBitmap; MaskColor: TColor; const AllResolutions: Boolean = True); |
| o:ReplaceSlice(AIndex,Image,AImageRect)
o:ReplaceSlice(AIndex,Image,AImageRect,AllResolutions) | procedure ReplaceSlice(AIndex: Integer; Image: TCustomBitmap; AImageRect: TRect; const AllResolutions: Boolean = True); |
| o:ReplaceSliceCentered(AIndex,AImageWidth,Image)
o:ReplaceSliceCentered(AIndex,AImageWidth,Image,AllResolutions) | procedure ReplaceSliceCentered(AIndex, AImageWidth: Integer; Image: TCustomBitmap; const AllResolutions: Boolean = True); |
| result = o.ResolutionCount | property ResolutionCount: Integer read GetResolutionCount; |
| o.Scaled = value
result = o.Scaled | property Scaled: Boolean read FScaled write FScaled default False; |
| o.ShareImages = value
result = o.ShareImages | property ShareImages: Boolean read FShareImages write SetShareImages default False; |
| result = o:SizeForPPI(AImageWidth,APPI) | property SizeForPPI[AImageWidth, APPI: Integer]: TSize read GetSizeForPPI; |
| o:StretchDraw(Canvas,Index,ARect)
o:StretchDraw(Canvas,Index,ARect,Enabled) | procedure StretchDraw(Canvas: TCanvas; Index: Integer; ARect: TRect; Enabled: Boolean = True); |
| o:UnRegisterChanges(Value) | procedure UnRegisterChanges(Value: TChangeLink); |
| o.Width = value
result = o.Width | property Width: Integer read FWidth write SetWidth default 16; |
| result = o:WidthForPPI(AImageWidth,APPI) | property WidthForPPI[AImageWidth, APPI: Integer]: Integer read GetWidthForPPI; |
| o:WriteAdvData(AStream) | procedure WriteAdvData(AStream: TStream); virtual; |
| o:WriteData(AStream) | procedure WriteData(AStream: TStream); virtual; |

| Lua examples | FP declaration |
| --- | --- |
| result = o:AdjustFontForOptimalFill() | function AdjustFontForOptimalFill: Boolean; |
| result, FontHeight, NeededWidth, NeededHeight = o:CalcFittingFontHeight(TheText,MaxWidth,MaxHeight) | function CalcFittingFontHeight(const TheText: string; MaxWidth, MaxHeight: Integer; out FontHeight, NeededWidth, NeededHeight: Integer): Boolean; |
| o:Paint() | procedure Paint; override; |

| Lua examples | FP declaration |
| --- | --- |
| result = o.EditLabel | property EditLabel: TBoundLabel read FEditLabel; |
| o.LabelPosition = value
result = o.LabelPosition | property LabelPosition: TLabelPosition read FLabelPosition write SetLabelPosition default lpAbove; |
| o.LabelSpacing = value
result = o.LabelSpacing | property LabelSpacing: Integer read FLabelSpacing write SetLabelSpacing default 3; |

| Lua examples | FP declaration |
| --- | --- |
| o:AddItem(Item,AnObject) | procedure AddItem(const Item: String; AnObject: TObject); |
| result = o.Canvas | property Canvas: TCanvas read FCanvas; |
| o:Clear() | procedure Clear; virtual; |
| o:ClearSelection() | procedure ClearSelection; |
| o:Click() | procedure Click; override; |
| o.ClickOnSelChange = value
result = o.ClickOnSelChange | property ClickOnSelChange: boolean read FClickOnSelChange write FClickOnSelChange default true; |
| o.Columns = value
result = o.Columns | property Columns: Integer read FColumns write SetColumns default 0; |
| result = o.Count | property Count: Integer read GetCount; |
| o:DeleteSelected() | procedure DeleteSelected; virtual; |
| o.ExtendedSelect = value
result = o.ExtendedSelect | property ExtendedSelect: boolean read FExtendedSelect write SetExtendedSelect default true; |
| result = o:GetIndexAtXY(X,Y) | function GetIndexAtXY(X, Y: integer): integer; |
| result = o:GetIndexAtY(Y) | function GetIndexAtY(Y: integer): integer; |
| result = o:GetSelectedText() | function GetSelectedText: string; |
| o.IntegralHeight = value
result = o.IntegralHeight | property IntegralHeight: boolean read FIntegralHeight write FIntegralHeight default False; |
| result = o:ItemAtPos(Pos,Existing) | function ItemAtPos(const Pos: TPoint; Existing: Boolean): Integer; |
| result = o:ItemFullyVisible(Index) | function ItemFullyVisible(Index: Integer): boolean; |
| o.ItemHeight = value
result = o.ItemHeight | property ItemHeight: Integer read GetItemHeight write SetItemHeight; |
| o.ItemIndex = value
result = o.ItemIndex | property ItemIndex: integer read GetItemIndex write SetItemIndex default -1; |
| result = o:ItemRect(Index) | function ItemRect(Index: Integer): TRect; |
| result = o:ItemVisible(Index) | function ItemVisible(Index: Integer): boolean; |
| o.Items = value
result = o.Items | property Items: TStrings read FItems write SetItems; |
| o:LockSelectionChange() | procedure LockSelectionChange; |
| o:MakeCurrentVisible() | procedure MakeCurrentVisible; |
| TheHeight = o:MeasureItem(Index) | procedure MeasureItem(Index: Integer; var TheHeight: Integer); virtual; |
| TheHeight = o:MeasureItem2(Index,TheHeight) | procedure MeasureItem(Index: Integer; var TheHeight: Integer); virtual; |
| o.MultiSelect = value
result = o.MultiSelect | property MultiSelect: boolean read FMultiSelect write SetMultiSelect default False; |
| o.OnDrawItem = function(Control,Index,ARect,State) end | property OnDrawItem: TDrawItemEvent read FOnDrawItem write FOnDrawItem; |
| o.OnMeasureItem = function(Control,Index,AHeight) return AHeight end | property OnMeasureItem: TMeasureItemEvent read FOnMeasureItem write FOnMeasureItem; |
| o.OnSelectionChange = function(Sender,User) end | property OnSelectionChange: TSelectionChangeEvent read FOnSelectionChange write FOnSelectionChange; |
| o.Options = value
result = o.Options | property Options: TListBoxOptions read FOptions write FOptions default DefOptions; |
| o.ScrollWidth = value
result = o.ScrollWidth | property ScrollWidth: Integer read GetScrollWidth write SetScrollWidth default 0; |
| result = o.SelCount | property SelCount: integer read GetSelCount; |
| o:SelectAll() | procedure SelectAll; virtual; |
| o:SelectRange(ALow,AHigh,ASelected) | procedure SelectRange(ALow, AHigh: integer; ASelected: boolean); virtual; |
| result = o:Selected(Index)
o:Selected(Index,value) | property Selected[Index: integer]: boolean read GetSelected write SetSelected; |
| o.Sorted = value
result = o.Sorted | property Sorted: boolean read FSorted write SetSorted default False; |
| o.Style = value
result = o.Style | property Style: TListBoxStyle read FStyle write SetStyle default lbStandard; |
| o.TopIndex = value
result = o.TopIndex | property TopIndex: Integer read GetTopIndex write SetTopIndex default 0; |
| o:UnlockSelectionChange() | procedure UnlockSelectionChange; |

| Lua examples | FP declaration |
| --- | --- |
| o.Caption = value
result = o.Caption | property Caption : String read GetCaption write SetCaption; |
| o.Checked = value
result = o.Checked | property Checked : Boolean read GetChecked write SetChecked; |
| o.Cut = value
result = o.Cut | property Cut: Boolean index lisCut read GetState write SetState; |
| o.Data = value
result = o.Data | property Data: Pointer read FData write SetData; |
| o:Delete() | procedure Delete; |
| result = o:DisplayRect(Code) | function DisplayRect(Code: TDisplayCode): TRect; |
| result = o:DisplayRectSubItem(subItem,Code) | function DisplayRectSubItem(subItem: integer;Code: TDisplayCode): TRect; |
| o.DropTarget = value
result = o.DropTarget | property DropTarget: Boolean index lisDropTarget read GetState write SetState; |
| result = o:EditCaption() | function EditCaption: Boolean; |
| o.Focused = value
result = o.Focused | property Focused: Boolean index lisFocused read GetState write SetState; |
| o.ImageIndex = value
result = o.ImageIndex | property ImageIndex: TImageIndex read GetImageIndex write SetImageIndex default -1; |
| result = o.Index | property Index: Integer read GetIndex; |
| o.Left = value
result = o.Left | property Left: Integer read GetLeft write SetLeft; |
| result = o.ListView | property ListView: TCustomListView read GetListView; |
| o:MakeVisible(PartialOK) | procedure MakeVisible(PartialOK: Boolean); |
| result = o.Owner | property Owner: TListItems read FOwner; |
| o.Position = value
result = o.Position | property Position: TPoint read GetPosition write SetPosition; |
| o.Selected = value
result = o.Selected | property Selected: Boolean index lisSelected read GetState write SetState; |
| o.StateIndex = value
result = o.StateIndex | property StateIndex: TImageIndex read GetStateIndex write SetStateIndex; |
| result = o:SubItemImages(AIndex)
o:SubItemImages(AIndex,value) | property SubItemImages[const AIndex: Integer]: Integer read GetSubItemImages write SetSubItemImages; |
| o.SubItems = value
result = o.SubItems | property SubItems: TStrings read GetSubItems write SetSubItems; |
| o.Top = value
result = o.Top | property Top: Integer read GetTop write SetTop; |

| Lua examples | FP declaration |
| --- | --- |
| result = o:Add() | function Add: TListItem; |
| o:AddItem(AItem) | procedure AddItem(AItem: TListItem); |
| o:BeginUpdate() | procedure BeginUpdate; |
| o:Clear() | procedure Clear; virtual; |
| o.Count = value
result = o.Count | property Count: Integer read GetCount write SetCount; |
| o:Delete(AIndex) | procedure Delete(const AIndex : Integer); |
| o:EndUpdate() | procedure EndUpdate; |
| o:Exchange(AIndex1,AIndex2) | procedure Exchange(const AIndex1, AIndex2: Integer); |
| result = o:FindCaption(StartIndex,Value,Partial,Inclusive,Wrap)
result = o:FindCaption(StartIndex,Value,Partial,Inclusive,Wrap,PartStart) | function FindCaption(StartIndex: Integer; Value: string; Partial, Inclusive, Wrap: Boolean; PartStart: Boolean = True): TListItem; |
| result = o:FindData(AData) | function FindData(const AData: Pointer): TListItem; overload; |
| result = o:FindData2(StartIndex,Value,Inclusive,Wrap) | function FindData(StartIndex: Integer; Value: Pointer; Inclusive, Wrap: Boolean): TListItem; overload; |
| result = o.Flags | property Flags: TListItemsFlags read FFlags; |
| result = o:IndexOf(AItem) | function IndexOf(const AItem: TListItem): Integer; |
| result = o:Insert(AIndex) | function Insert(const AIndex: Integer) : TListItem; |
| o:InsertItem(AItem,AIndex) | procedure InsertItem(AItem: TListItem; const AIndex: Integer); |
| result = o:Item(AIndex)
o:Item(AIndex,value) | property Item[const AIndex: Integer]: TListItem read GetItem write SetItem; default; |
| o:Move(AFromIndex,AToIndex) | procedure Move(const AFromIndex, AToIndex: Integer); |
| result = o.Owner | property Owner: TCustomListView read FOwner; |

| Lua examples | FP declaration |
| --- | --- |
| o:AddItem(Item,AObject) | procedure AddItem(Item: string; AObject: TObject); |
| result = o:AlphaSort() | function AlphaSort: Boolean; |
| o:BeginUpdate() | procedure BeginUpdate; |
| result = o.BoundingRect | property BoundingRect: TRect read GetBoundingRect; |
| result = o.Canvas | property Canvas: TCanvas read FCanvas; |
| o.Checkboxes = value
result = o.Checkboxes | property Checkboxes: Boolean index Ord(lvpCheckboxes) read GetProperty write SetProperty default False; |
| o:Clear() | procedure Clear; |
| o:ClearSelection() | procedure ClearSelection; |
| result = o:Column(AIndex) | property Column[AIndex: Integer]: TListColumn read GetColumnFromIndex; |
| result = o.ColumnCount | property ColumnCount: Integer read GetColumnCount; |
| o.DropTarget = value
result = o.DropTarget | property DropTarget: TListItem read GetDropTarget write SetDropTarget; |
| o:EndUpdate() | procedure EndUpdate; |
| result = o:FindCaption(StartIndex,Value,Partial,Inclusive,Wrap)
result = o:FindCaption(StartIndex,Value,Partial,Inclusive,Wrap,PartStart) | function FindCaption(StartIndex: Integer; Value: string; Partial, Inclusive, Wrap: Boolean; PartStart: Boolean = True): TListItem; |
| result = o:FindData(StartIndex,Value,Inclusive,Wrap) | function FindData(StartIndex: Integer; Value: Pointer; Inclusive, Wrap: Boolean): TListItem; |
| o.FlatScrollBars = value
result = o.FlatScrollBars | property FlatScrollBars: Boolean index Ord(lvpFlatScrollBars) read GetProperty write SetProperty default False; |
| o.FullDrag = value
result = o.FullDrag | property FullDrag: Boolean index Ord(lvpFullDrag) read GetProperty write SetProperty default False; |
| result = o:GetItemAt(x,y) | function GetItemAt(x,y: integer): TListItem; |
| result = o:GetNearestItem(APoint,Direction) | function GetNearestItem(APoint: TPoint; Direction: TSearchDirection): TListItem; |
| result = o:GetNextItem(StartItem,Direction,States) | function GetNextItem(StartItem: TListItem; Direction: TSearchDirection; States: TListItemStates): TListItem; |
| o.GridLines = value
result = o.GridLines | property GridLines: Boolean index Ord(lvpGridLines) read GetProperty write SetProperty default False; |
| o.HotTrack = value
result = o.HotTrack | property HotTrack: Boolean index Ord(lvpHotTrack) read GetProperty write SetProperty default False; |
| o.HotTrackStyles = value
result = o.HotTrackStyles | property HotTrackStyles: TListHotTrackStyles read FHotTrackStyles write SetHotTrackStyles default []; |
| o.IconOptions = value
result = o.IconOptions | property IconOptions: TIconOptions read FIconOptions write SetIconOptions; |
| result = o:IsEditing() | function IsEditing: Boolean; |
| o.ItemFocused = value
result = o.ItemFocused | property ItemFocused: TListItem read GetFocused write SetFocused; |
| o.ItemIndex = value
result = o.ItemIndex | property ItemIndex: Integer read GetItemIndex write SetItemIndex; |
| o.Items = value
result = o.Items | property Items: TListItems read FListItems write SetItems; |
| result = o.LastSelected | property LastSelected: TListItem read FSelected; |
| o.MultiSelect = value
result = o.MultiSelect | property MultiSelect: Boolean index Ord(lvpMultiselect) read GetProperty write SetProperty default False; |
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
| o.OwnerData = value
result = o.OwnerData | property OwnerData: Boolean read FOwnerData write SetOwnerData default False; |
| o.ReadOnly = value
result = o.ReadOnly | property ReadOnly: Boolean index Ord(lvpReadOnly) read GetProperty write SetProperty default False; |
| o.RowSelect = value
result = o.RowSelect | property RowSelect: Boolean index Ord(lvpRowSelect) read GetProperty write SetProperty default False; |
| result = o.SelCount | property SelCount: Integer read GetSelCount; |
| o:SelectAll() | procedure SelectAll; |
| o.Selected = value
result = o.Selected | property Selected: TListItem read GetSelection write SetSelection; |
| o:Sort() | procedure Sort; |
| result = o.TopItem | property TopItem: TListItem read GetTopItem; |
| o.ViewOrigin = value
result = o.ViewOrigin | property ViewOrigin: TPoint read GetViewOrigin write SetViewOrigin; |
| result = o.VisibleRowCount | property VisibleRowCount: Integer read GetVisibleRowCount; |

| Lua examples | FP declaration |
| --- | --- |
| result = o.Height | property Height: Integer read GetHeight; |
| o:Merge(Menu) | procedure Merge(Menu: TMainMenu); |
| o:Unmerge(Menu) | procedure Unmerge(Menu: TMainMenu); |
| o.WindowHandle = value
result = o.WindowHandle | property WindowHandle: HWND read FWindowHandle write SetWindowHandle; |

| Lua examples | FP declaration |
| --- | --- |
| o:Clear() | procedure Clear; |
| o.EnableSets = value
result = o.EnableSets | property EnableSets: Boolean read FEnableSets write FEnableSets; |
| o.Modified = value
result = o.Modified | property Modified: Boolean read GetModified write SetModified; |
| o.OnValidationError = function(Sender) end | property OnValidationError: TNotifyEvent read FOnValidationError write FOnValidationError; |
| o:ValidateEdit() | procedure ValidateEdit; virtual; |
| o.ValidationErrorMode = value
result = o.ValidationErrorMode | property ValidationErrorMode: TMaskEditValidationErrorMode read FValidationErrorMode write FValidationErrorMode default mvemException; |

| Lua examples | FP declaration |
| --- | --- |
| o:Append(AValue) | procedure Append(const AValue: String); |
| o.HorzScrollBar = value
result = o.HorzScrollBar | property HorzScrollBar: TMemoScrollBar read FHorzScrollBar write FHorzScrollBar; |
| o.Lines = value
result = o.Lines | property Lines: TStrings read FLines write SetLines; |
| o.ScrollBars = value
result = o.ScrollBars | property ScrollBars: TScrollStyle read FScrollBars write SetScrollBars default ssNone; |
| o.VertScrollBar = value
result = o.VertScrollBar | property VertScrollBar: TMemoScrollBar read FVertScrollBar write FVertScrollBar; |
| o.WantReturns = value
result = o.WantReturns | property WantReturns: Boolean read FWantReturns write SetWantReturns default true; |
| o.WantTabs = value
result = o.WantTabs | property WantTabs: Boolean read FWantTabs write SetWantTabs default false; |
| o.WordWrap = value
result = o.WordWrap | property WordWrap: Boolean read FWordWrap write SetWordWrap default true; |

| Lua examples | FP declaration |
| --- | --- |
| o:Clear() | procedure Clear; |
| o:LoadFromFile(FileName) | procedure LoadFromFile(const FileName: string); |
| o:LoadFromStream(Stream) | procedure LoadFromStream(Stream: TStream); |
| o:SetSize(NewSize) | procedure SetSize( const NewSize: Int64 ); override; |

| Lua examples | FP declaration |
| --- | --- |
| o:DestroyHandle() | procedure DestroyHandle; virtual; |
| result = o:DispatchCommand(ACommand) | function DispatchCommand(ACommand: Word): Boolean; |
| o.FCompStyle = value
result = o.FCompStyle | FCompStyle: LongInt; |
| result = o:FindItem(AValue,Kind) | function FindItem(AValue: PtrInt; Kind: TFindItemKind): TMenuItem; |
| result = o:GetHelpContext(AValue,ByCommand) | function GetHelpContext(AValue: PtrInt; ByCommand: Boolean): THelpContext; |
| result = o.Handle | property Handle: HMenu read GetHandle; |
| result = o:HandleAllocated() | function HandleAllocated: Boolean; |
| o:HandleNeeded() | procedure HandleNeeded; |
| result = o:IsRightToLeft() | function IsRightToLeft: Boolean; virtual; |
| o.OnChange = function(Sender,Source,Rebuild) end | property OnChange: TMenuChangeEvent read FOnChange write FOnChange; |
| o.Parent = value
result = o.Parent | property Parent: TComponent read FParent write SetParent; |
| o.ShortcutHandled = value
result = o.ShortcutHandled | property ShortcutHandled: boolean read FShortcutHandled write FShortcutHandled; |
| result = o:UseRightToLeftAlignment() | function UseRightToLeftAlignment: Boolean; virtual; |
| result = o:UseRightToLeftReading() | function UseRightToLeftReading: Boolean; virtual; |

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
| o.FCompStyle = value
result = o.FCompStyle | FCompStyle: LongInt; |
| result = o:Find(ACaption) | function Find(const ACaption: string): TMenuItem; |
| aImages, aImagesWidth = o:GetImageList() | procedure GetImageList(out aImages: TCustomImageList; out aImagesWidth: Integer); virtual; |
| result = o:GetImageList2() | function GetImageList: TCustomImageList; |
| result = o:GetIsRightToLeft() | function GetIsRightToLeft:Boolean; virtual; |
| result = o:GetMergedParentMenu() | function GetMergedParentMenu: TMenu; virtual; |
| result = o:GetParentComponent() | function GetParentComponent: TComponent; override; |
| result = o:GetParentMenu() | function GetParentMenu: TMenu; virtual; |
| o.Handle = value
result = o.Handle | property Handle: HMenu read GetHandle write FHandle; |
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
| o.MenuIndex = value
result = o.MenuIndex | property MenuIndex: Integer read GetMenuIndex write SetMenuIndex; |
| result = o:MenuVisibleIndex() | function MenuVisibleIndex: integer; |
| result = o.Merged | property Merged: TMenuItem read FMerged; |
| result = o.MergedItems | property MergedItems: TMergedMenuItems read GetMergedItems; |
| result = o.MergedParent | property MergedParent: TMenuItem read GetMergedParent; |
| result = o.MergedWith | property MergedWith: TMenuItem read FMergedWith; |
| result = o.Parent | property Parent: TMenuItem read GetParent; |
| o:RecreateHandle() | procedure RecreateHandle; virtual; |
| o:Remove(Item) | procedure Remove(Item: TMenuItem); |
| o:UpdateImage()
o:UpdateImage(forced) | procedure UpdateImage(forced: Boolean = false); |
| o:UpdateImages()
o:UpdateImages(forced) | procedure UpdateImages(forced: Boolean = false); |
| result = o:VisibleIndexOf(Item) | function VisibleIndexOf(Item: TMenuItem): Integer; |
| o:WriteDebugReport(Prefix) | procedure WriteDebugReport(const Prefix: string); |

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

| Lua examples | FP declaration |
| --- | --- |
| result = o.ActivePage | property ActivePage: String read GetActivePage; |
| result = o.ActivePageComponent | property ActivePageComponent: TPage read GetActivePageComponent; |
| result = o:IndexOf(APage) | function IndexOf(APage: TPage): integer; |
| result = o:Page(Index) | property Page[Index: Integer]: TPage read GetPage; |
| result = o.PageCount | property PageCount: integer read GetPageCount; |
| o:ShowControl(AControl) | procedure ShowControl(AControl: TControl); override; |

| Lua examples | FP declaration |
| --- | --- |
| o.BackgroundColor = value
result = o.BackgroundColor | property BackgroundColor: TColor read FBackgroundColor write SetBackgroundColor default DefBackgroundColor; |
| o:BuildPropertyList()
...
o:BuildPropertyList(OnlyIfNeeded,FocusEditor) | procedure BuildPropertyList(OnlyIfNeeded: Boolean = False; FocusEditor: Boolean = True); |
| result = o:CanEditRowValue(CheckFocus) | function CanEditRowValue(CheckFocus: boolean): boolean; |
| o.CheckboxForBoolean = value
result = o.CheckboxForBoolean | property CheckboxForBoolean: Boolean read FCheckboxForBoolean write FCheckboxForBoolean; |
| o:Clear() | procedure Clear; |
| o.Column = value
result = o.Column | property Column: TOICustomPropertyGridColumn read FColumn write SetColumn; |
| result = o:ConsistencyCheck() | function ConsistencyCheck: integer; |
| o.CurrentEditValue = value
result = o.CurrentEditValue | property CurrentEditValue: string read GetCurrentEditValue write SetCurrentEditValue; |
| o.DefaultItemHeight = value
result = o.DefaultItemHeight | property DefaultItemHeight:integer read FDefaultItemHeight write FDefaultItemHeight default 0; |
| o.DefaultValueFont = value
result = o.DefaultValueFont | property DefaultValueFont: TFont read FDefaultValueFont write FDefaultValueFont; |
| o.DrawHorzGridLines = value
result = o.DrawHorzGridLines | property DrawHorzGridLines: Boolean read FDrawHorzGridLines write SetDrawHorzGridLines default True; |
| result = o.ExpandedProperties | property ExpandedProperties: TStringList read FExpandedProperties; |
| o.Favorites = value
result = o.Favorites | property Favorites: TOIFavoriteProperties read FFavorites write SetFavorites; |
| o.Filter = value
result = o.Filter | property Filter : TTypeKinds read FFilter write SetFilter; |
| o:FocusCurrentEditor() | procedure FocusCurrentEditor; |
| result = o:GetActiveRow() | function GetActiveRow: TOIPropertyGridRow; |
| result = o:GetHintTypeAt(RowIndex,X) | function GetHintTypeAt(RowIndex: integer; X: integer): TPropEditHint; |
| result = o:GetRowByPath(PropPath) | function GetRowByPath(const PropPath: string): TOIPropertyGridRow; |
| result = o:GridHeight() | function GridHeight: integer; |
| o.GutterColor = value
result = o.GutterColor | property GutterColor: TColor read FGutterColor write SetGutterColor default DefGutterColor; |
| o.GutterEdgeColor = value
result = o.GutterEdgeColor | property GutterEdgeColor: TColor read FGutterEdgeColor write SetGutterEdgeColor default DefGutterEdgeColor; |
| o.HideClassNames = value
result = o.HideClassNames | property HideClassNames: Boolean read FHideClassNames write FHideClassNames; |
| o.HighlightColor = value
result = o.HighlightColor | property HighlightColor: TColor read FHighlightColor write SetHighlightColor default DefHighlightColor; |
| o.HighlightFont = value
result = o.HighlightFont | property HighlightFont: TFont read FHighlightFont write FHighlightFont; |
| o.Indent = value
result = o.Indent | property Indent: integer read FIndent write FIndent; |
| o.ItemIndex = value
result = o.ItemIndex | property ItemIndex: integer read FItemIndex write SetItemIndex; |
| o.Layout = value
result = o.Layout | property Layout: TOILayout read FLayout write FLayout default oilHorizontal; |
| result = o:MouseToIndex(y,MustExist) | function MouseToIndex(y: integer; MustExist: boolean): integer; |
| o.NameFont = value
result = o.NameFont | property NameFont: TFont read FNameFont write FNameFont; |
| o.OnEditorFilter = function(Sender,aEditor,aShow) return aShow end | property OnEditorFilter: TOIEditorFilterEvent read FOnEditorFilter write FOnEditorFilter; |
| o.OnModified = function(Sender) end | property OnModified: TNotifyEvent read FOnModified write FOnModified; |
| o.OnOIKeyDown = function(Sender,Key,Shift) return Key end | property OnOIKeyDown: TKeyEvent read FOnOIKeyDown write FOnOIKeyDown; |
| o.OnSelectionChange = function(Sender) end | property OnSelectionChange: TNotifyEvent read FOnSelectionChange write FOnSelectionChange; |
| o:Paint() | procedure Paint; override; |
| o.PreferredSplitterX = value
result = o.PreferredSplitterX | property PreferredSplitterX: integer read FPreferredSplitterX write FPreferredSplitterX default 100; |
| o:PropEditLookupRootChange() | procedure PropEditLookupRootChange; |
| o.PropNameFilter = value
result = o.PropNameFilter | property PropNameFilter : String read FPropNameFilter write FPropNameFilter; |
| result = o:PropertyEditorByName(PropName) | function PropertyEditorByName(const PropName: string): TPropertyEditor; |
| o.PropertyEditorHook = value
result = o.PropertyEditorHook | property PropertyEditorHook: TPropertyEditorHook read FPropertyEditorHook write SetPropertyEditorHook; |
| result = o:PropertyPath(Index) | function PropertyPath(Index: integer):string; |
| result = o:PropertyPath2(Row) | function PropertyPath(Row: TOIPropertyGridRow):string; |
| o.ReadOnlyColor = value
result = o.ReadOnlyColor | property ReadOnlyColor: TColor read FReadOnlyColor write SetReadOnlyColor default DefReadOnlyColor; |
| result = o:RealDefaultItemHeight() | function RealDefaultItemHeight: integer; |
| o.ReferencesColor = value
result = o.ReferencesColor | property ReferencesColor: TColor read FReferencesColor write SetReferences default DefReferencesColor; |
| o:RefreshPropertyValues() | procedure RefreshPropertyValues; |
| result = o.RowCount | property RowCount: integer read GetRowCount; |
| o.RowSpacing = value
result = o.RowSpacing | property RowSpacing: integer read FRowSpacing write SetRowSpacing; |
| result = o:Rows(Index) | property Rows[Index: integer]: TOIPropertyGridRow read GetRow; |
| o:SaveChanges() | procedure SaveChanges; |
| o:ScrollToActiveItem() | procedure ScrollToActiveItem; |
| o:ScrollToItem(NewIndex) | procedure ScrollToItem(NewIndex: Integer); |
| o:SetCurrentRowValue(NewValue) | procedure SetCurrentRowValue(const NewValue: string); |
| o:SetItemIndexAndFocus(NewItemIndex)
o:SetItemIndexAndFocus(NewItemIndex,WasValueClick) | procedure SetItemIndexAndFocus(NewItemIndex: integer; WasValueClick: Boolean = False); |
| o.ShowGutter = value
result = o.ShowGutter | property ShowGutter: Boolean read FShowGutter write SetShowGutter default True; |
| o.SplitterX = value
result = o.SplitterX | property SplitterX: integer read FSplitterX write SetSplitterX default 100; |
| o.SubPropertiesColor = value
result = o.SubPropertiesColor | property SubPropertiesColor: TColor read FSubPropertiesColor write SetSubPropertiesColor default DefSubPropertiesColor; |
| result = o:TopMax() | function TopMax: integer; |
| o.TopY = value
result = o.TopY | property TopY: integer read FTopY write SetTopY default 0; |
| o.ValueDifferBackgrndColor = value
result = o.ValueDifferBackgrndColor | property ValueDifferBackgrndColor: TColor read FValueDifferBackgrndColor write SetValueDifferBackgrndColor default DefValueDifferBackgrndColor; |
| o.ValueFont = value
result = o.ValueFont | property ValueFont: TFont read FValueFont write FValueFont; |

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
| o.Modified = value
result = o.Modified | property Modified: Boolean read FModified write FModified; |
| o:Remove(AnItem) | procedure Remove(AnItem: TOIFavoriteProperty); virtual; |
| o:Sort() | procedure Sort; virtual; |
| result = o.Sorted | property Sorted: Boolean read FSorted; |
| o:WriteDebugReport() | procedure WriteDebugReport; |

| Lua examples | FP declaration |
| --- | --- |
| o:Assign(Src) | procedure Assign(Src: TOIFavoriteProperty); virtual; |
| result = o:Compare(AFavorite) | function Compare(AFavorite: TOIFavoriteProperty): integer; |
| result = o:Constrains(AnItem) | function Constrains(AnItem: TOIFavoriteProperty): boolean; |
| result = o:CreateCopy() | function CreateCopy: TOIFavoriteProperty; |
| result = o:DebugReportAsString() | function DebugReportAsString: string; |

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
| o.Height = value
result = o.Height | property Height: integer read FHeight write FHeight; |
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
| o.Top = value
result = o.Top | property Top: integer read FTop write FTop; |
| result = o.Tree | property Tree: TOICustomPropertyGrid read FTree; |
| o:WriteDebugReport(Prefix) | procedure WriteDebugReport(const Prefix: string); |

| Lua examples | FP declaration |
| --- | --- |
| o.WidgetSets = value
result = o.WidgetSets | property WidgetSets: TLCLPlatforms read FWidgetSets write FWidgetSets; |

| Lua examples | FP declaration |
| --- | --- |
| o:DoFolderChange() | procedure DoFolderChange; virtual; |
| o:DoSelectionChange() | procedure DoSelectionChange; virtual; |
| o:IntfSetOption(AOption,AValue) | procedure IntfSetOption(const AOption: TOpenOption; const AValue: Boolean); |

| Lua examples | FP declaration |
| --- | --- |
| o.ActivePageIndex = value
result = o.ActivePageIndex | property ActivePageIndex: Integer read GetActivePageIndex write SetActivePageIndex; |
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

| Lua examples | FP declaration |
| --- | --- |
| o.Alignment = value
result = o.Alignment | property Alignment: TAlignment read FAlignment write SetAlignment default taCenter; |
| o.BevelColor = value
result = o.BevelColor | property BevelColor: TColor read FBevelColor write SetBevelColor default clDefault; |
| o.BevelInner = value
result = o.BevelInner | property BevelInner: TPanelBevel read FBevelInner write SetBevelInner default bvNone; |
| o.BevelOuter = value
result = o.BevelOuter | property BevelOuter: TPanelBevel read FBevelOuter write SetBevelOuter default bvRaised; |
| o.BevelWidth = value
result = o.BevelWidth | property BevelWidth: TBevelWidth read FBevelWidth write SetBevelWidth default 1; |
| o.FullRepaint = value
result = o.FullRepaint | property FullRepaint: Boolean read FFullRepaint write FFullRepaint default True; |

| Lua examples | FP declaration |
| --- | --- |
| result = o:GetPattern() | function GetPattern: TPenPattern; |
| o:SetPattern(APattern) | procedure SetPattern(APattern: TPenPattern); reintroduce; |

| Lua examples | FP declaration |
| --- | --- |
| o:Assign(Source) | procedure Assign(Source: TPersistent); virtual; |
| o:FPOAttachObserver(AObserver) | Procedure FPOAttachObserver(AObserver : TObject); |
| o:FPODetachObserver(AObserver) | Procedure FPODetachObserver(AObserver : TObject); |
| o:FPONotifyObservers(ASender,AOperation,Data) | Procedure FPONotifyObservers(ASender : TObject; AOperation : TFPObservedOperation; Data : Pointer); |
| result = o:GetNamePath() | function  GetNamePath: string; virtual; |

| Lua examples | FP declaration |
| --- | --- |
| o.Bitmap = value
result = o.Bitmap | property Bitmap: TBitmap read GetBitmap write SetBitmap; |
| o:Clear() | procedure Clear; virtual; |
| o.Graphic = value
result = o.Graphic | property Graphic: TGraphic read FGraphic write SetGraphic; |
| result = o.Height | property Height: Integer read GetHeight; |
| o.Icon = value
result = o.Icon | property Icon: TIcon read GetIcon write SetIcon; |
| o.Jpeg = value
result = o.Jpeg | property Jpeg: TJpegImage read GetJpeg write SetJpeg; |
| o:LoadFromFile(Filename) | procedure LoadFromFile(const Filename: string); |
| o:LoadFromResourceName(Instance,ResName) | procedure LoadFromResourceName(Instance: THandle; const ResName: String); |
| o:LoadFromStream(Stream) | procedure LoadFromStream(Stream: TStream); |
| o:LoadFromStreamWithFileExt(Stream,FileExt) | procedure LoadFromStreamWithFileExt(Stream: TStream; const FileExt: string); |
| o.OnChange = function(Sender) end | property OnChange: TNotifyEvent read FOnChange write FOnChange; |
| o.OnProgress = function(Sender,Stage,PercentDone,RedrawNow,R,Msg,Continue) return Continue end | property OnProgress: TProgressEvent read FOnProgress write FOnProgress; |
| o.PNG = value
result = o.PNG | property PNG: TPortableNetworkGraphic read GetPNG write SetPNG; |
| o.PNM = value
result = o.PNM | property PNM: TPortableAnyMapGraphic read GetPNM write SetPNM; |
| o.Pixmap = value
result = o.Pixmap | property Pixmap: TPixmap read GetPixmap write SetPixmap; |
| o:SaveToFile(Filename)
o:SaveToFile(Filename,FileExt) | procedure SaveToFile(const Filename: string; const FileExt: string = ''); |
| o:SaveToStream(Stream) | procedure SaveToStream(Stream: TStream); |
| o:SaveToStreamWithFileExt(Stream,FileExt) | procedure SaveToStreamWithFileExt(Stream: TStream; const FileExt: string); |
| result = o:SupportsClipboardFormat(FormatID) | class function SupportsClipboardFormat(FormatID: TClipboardFormat): Boolean; |
| result = o.Width | property Width: Integer read GetWidth; |

| Lua examples | FP declaration |
| --- | --- |
| o:Close() | procedure Close; |
| o:PopUp() | procedure PopUp; |
| o:PopUp2(X,Y) | procedure PopUp(X, Y: Integer); virtual; |
| o.PopupComponent = value
result = o.PopupComponent | property PopupComponent: TComponent read FPopupComponent write FPopupComponent; |
| result = o.PopupPoint | property PopupPoint: TPoint read FPopupPoint; |

| Lua examples | FP declaration |
| --- | --- |
| o:Hide() | procedure Hide; |
| o:Show() | procedure Show; |
| o:ShowAtPos(x,y) | procedure ShowAtPos(x: Integer; y: Integer); |
| o.vNotifierForm = value
result = o.vNotifierForm | vNotifierForm: TNotifierForm; |

| Lua examples | FP declaration |
| --- | --- |
| o.BarShowText = value
result = o.BarShowText | property BarShowText : boolean read FBarShowText write SetBarShowText default False; |
| o.Max = value
result = o.Max | property Max: Integer read GetMax write SetMax default 100; |
| o.Min = value
result = o.Min | property Min: Integer read GetMin write SetMin default 0; |
| o.Orientation = value
result = o.Orientation | property Orientation: TProgressBarOrientation read FOrientation write SetOrientation default pbHorizontal; |
| o.Position = value
result = o.Position | property Position: Integer read GetPosition write SetPosition default 0; |
| o.Smooth = value
result = o.Smooth | property Smooth : boolean read FSmooth write SetSmooth default False; |
| o.Step = value
result = o.Step | property Step: Integer read FStep write SetStep default 10; |
| o:StepBy(Delta) | procedure StepBy(Delta: Integer); |
| o:StepIt() | procedure StepIt; |
| o.Style = value
result = o.Style | property Style: TProgressBarStyle read FStyle write SetStyle default pbstNormal; |

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
| o.FirstValue = value
result = o.FirstValue | property FirstValue: ansistring read GetValue write SetValue; |
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
| result = o:GetPropTypeUnitName()
result = o:GetPropTypeUnitName(Index) | function GetPropTypeUnitName(Index: Integer = 0): string; |
| o:GetProperties(Proc) | procedure GetProperties( Proc: TGetPropEditProc); virtual; |
| result = o:GetPropertyPath()
result = o:GetPropertyPath(Index) | function GetPropertyPath(Index: integer = 0): string; |
| result = o:GetSetValue(Brackets) | function GetSetValue(Brackets: boolean): AnsiString; |
| result = o:GetSetValueAt(Index,Brackets) | function GetSetValueAt(Index: Integer; Brackets: boolean): AnsiString; |
| result = o:GetStrValue() | function GetStrValue: AnsiString; |
| result = o:GetStrValueAt(Index) | function GetStrValueAt(Index: Integer): AnsiString; |
| result = o:GetUnitName()
result = o:GetUnitName(Index) | function GetUnitName(Index: Integer = 0): string; |
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
| o:Modified()
o:Modified(PropName) | procedure Modified(PropName: ShortString = ''); |
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

| Lua examples | FP declaration |
| --- | --- |
| o.ComponentPropertyOnlyDesign = value
result = o.ComponentPropertyOnlyDesign | property ComponentPropertyOnlyDesign: boolean read FComponentPropertyOnlyDesign write FComponentPropertyOnlyDesign; |
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
| o.GetPrivateDirectory = value
result = o.GetPrivateDirectory | GetPrivateDirectory: AnsiString; |
| result = o:GetRootClassName() | function GetRootClassName: ShortString; |
| result = o:IsSelected(APersistent) | function IsSelected(const APersistent: TPersistent): boolean; |
| o.LookupRoot = value
result = o.LookupRoot | property LookupRoot: TPersistent read FLookupRoot write SetLookupRoot; |
| o:Modified(Sender)
o:Modified(Sender,PropName) | procedure Modified(Sender: TObject; PropName: ShortString = ''); |
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

| Lua examples | FP declaration |
| --- | --- |
| o.AutoFill = value
result = o.AutoFill | property AutoFill: Boolean read FAutoFill write SetAutoFill; |
| result = o:CanModify() | function CanModify: boolean; virtual; |
| o.ColumnLayout = value
result = o.ColumnLayout | property ColumnLayout: TColumnLayout read FColumnLayout write SetColumnLayout default clHorizontalThenVertical; |
| o.Columns = value
result = o.Columns | property Columns: integer read FColumns write SetColumns default 1; |
| o.ItemIndex = value
result = o.ItemIndex | property ItemIndex: integer read GetItemIndex write SetItemIndex default -1; |
| o.Items = value
result = o.Items | property Items: TStrings read FItems write SetItems; |
| o.OnClick = function(Sender) end | property OnClick: TNotifyEvent read FOnClick write FOnClick; |
| o.OnItemEnter = function(Sender) end | property OnItemEnter: TNotifyEvent read FOnItemEnter write FOnItemEnter; |
| o.OnItemExit = function(Sender) end | property OnItemExit: TNotifyEvent read FOnItemExit write FOnItemExit; |
| o.OnSelectionChanged = function(Sender) end | property OnSelectionChanged: TNotifyEvent read FOnSelectionChanged write FOnSelectionChanged; |
| result = o:Rows() | function Rows: integer; |

| Lua examples | FP declaration |
| --- | --- |
| o:BeginUpdate()
o:BeginUpdate(ACanvasOnly) | procedure BeginUpdate(ACanvasOnly: Boolean = False); |
| o.BitmapHandle = value
result = o.BitmapHandle | property BitmapHandle: HBITMAP read GetBitmapHandle write SetBitmapHandle; |
| result = o:BitmapHandleAllocated() | function BitmapHandleAllocated: boolean; virtual; abstract; |
| result = o.Canvas | property Canvas: TCanvas read GetCanvas; |
| o:EndUpdate()
o:EndUpdate(AStreamIsValid) | procedure EndUpdate(AStreamIsValid: Boolean = False); |
| o:FreeImage() | procedure FreeImage; virtual; |
| AWidth, AHeight = o:GetSize() | procedure GetSize(out AWidth, AHeight: Integer); |
| result = o:HandleAllocated() | function HandleAllocated: boolean; |
| o:LoadFromStream(AStream) | procedure LoadFromStream(AStream: TStream); overload; override; |
| o:LoadFromStream2(AStream,ASize) | procedure LoadFromStream(AStream: TStream; ASize: Cardinal); overload; virtual; |
| o:Mask(ATransparentColor) | procedure Mask(ATransparentColor: TColor); |
| o.MaskHandle = value
result = o.MaskHandle | property MaskHandle: HBITMAP read GetMaskHandle write SetMaskHandle; |
| result = o:MaskHandleAllocated() | function MaskHandleAllocated: boolean; virtual; abstract; |
| o.Masked = value
result = o.Masked | property Masked: Boolean read GetMasked write SetMasked; |
| result = o:PaletteAllocated() | function PaletteAllocated: boolean; virtual; abstract; |
| o.PixelFormat = value
result = o.PixelFormat | property PixelFormat: TPixelFormat read GetPixelFormat write SetPixelFormat default pfDevice; |
| result = o:ReleaseBitmapHandle() | function ReleaseBitmapHandle: HBITMAP; |
| result = o:ReleaseMaskHandle() | function ReleaseMaskHandle: HBITMAP; |
| result = o:ScanLine(Row) | property ScanLine[Row: Integer]: Pointer read GetScanLine; platform; |
| o:SetHandles(ABitmap,AMask) | procedure SetHandles(ABitmap, AMask: HBITMAP); virtual; abstract; |
| o.TransparentColor = value
result = o.TransparentColor | property TransparentColor: TColor read GetTransparentColor write SetTransparentColor default clDefault; |
| o.TransparentMode = value
result = o.TransparentMode | property TransparentMode: TTransparentMode read FTransparentMode write SetTransparentMode default tmAuto; |

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
| o.Cursor = value
result = o.Cursor | property Cursor: TCursor read FCursor write SetCursor; |
| result = o:Cursors(Index)
o:Cursors(Index,value) | property Cursors[Index: Integer]: HCURSOR read GetCursors write SetCursors; |
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
| o.HintFont = value
result = o.HintFont | property HintFont: TFont read GetHintFont write SetHintFont; |
| o.IconFont = value
result = o.IconFont | property IconFont: TFont read GetIconFont write SetIconFont; |
| o.MenuFont = value
result = o.MenuFont | property MenuFont: TFont read GetMenuFont write SetMenuFont; |
| result = o.MonitorCount | property MonitorCount: Integer read GetMonitorCount; |
| result = o:MonitorFromPoint(Point)
result = o:MonitorFromPoint(Point,MonitorDefault) | function MonitorFromPoint(const Point: TPoint; MonitorDefault: TMonitorDefaultTo = mdNearest): TMonitor; |
| result = o:MonitorFromRect(Rect)
result = o:MonitorFromRect(Rect,MonitorDefault) | function MonitorFromRect(const Rect: TRect; MonitorDefault: TMonitorDefaultTo = mdNearest): TMonitor; |
| result = o:MonitorFromWindow(Handle)
result = o:MonitorFromWindow(Handle,MonitorDefault) | function MonitorFromWindow(const Handle: THandle; MonitorDefault: TMonitorDefaultTo = mdNearest): TMonitor; |
| result = o:Monitors(Index) | property Monitors[Index: Integer]: TMonitor read GetMonitor; |
| o:MoveFormToFocusFront(ACustomForm) | procedure MoveFormToFocusFront(ACustomForm: TCustomForm); |
| o:MoveFormToZFront(ACustomForm) | procedure MoveFormToZFront(ACustomForm: TCustomForm); |
| o:NewFormWasCreated(AForm) | procedure NewFormWasCreated(AForm: TCustomForm); |
| o.OnActiveControlChange = function(Sender) end | property OnActiveControlChange: TNotifyEvent read FOnActiveControlChange write FOnActiveControlChange; |
| o.OnActiveFormChange = function(Sender) end | property OnActiveFormChange: TNotifyEvent read FOnActiveFormChange write FOnActiveFormChange; |
| result = o.PixelsPerInch | property PixelsPerInch: Integer read FPixelsPerInch; |
| result = o.PrimaryMonitor | property PrimaryMonitor: TMonitor read GetPrimaryMonitor; |
| result = o.RealCursor | property RealCursor: TCursor read GetRealCursor; |
| o.SystemFont = value
result = o.SystemFont | property SystemFont: TFont read GetSystemFont write SetSystemFont; |
| o:UpdateMonitors() | procedure UpdateMonitors; |
| o:UpdateScreen() | procedure UpdateScreen; |
| result = o.Width | property Width: Integer read GetWidth; |
| result = o.WorkAreaHeight | property WorkAreaHeight: Integer read GetWorkAreaHeight; |
| result = o.WorkAreaLeft | property WorkAreaLeft: Integer read GetWorkAreaLeft; |
| result = o.WorkAreaRect | property WorkAreaRect: TRect read GetWorkAreaRect; |
| result = o.WorkAreaTop | property WorkAreaTop: Integer read GetWorkAreaTop; |
| result = o.WorkAreaWidth | property WorkAreaWidth: Integer read GetWorkAreaWidth; |

| Lua examples | FP declaration |
| --- | --- |
| result = o:GetControlClassDefaultSize() | class function GetControlClassDefaultSize: TSize; override; |
| o:ScrollInView(AControl) | procedure ScrollInView(AControl: TControl); |
| o:UpdateScrollbars() | procedure UpdateScrollbars; |

| Lua examples | FP declaration |
| --- | --- |
| o:Paint() | procedure Paint; override; |
| o:StyleChanged(Sender) | procedure StyleChanged(Sender: TObject); |

| Lua examples | FP declaration |
| --- | --- |
| o.Alignment = value
result = o.Alignment | property Alignment: TAlignment read FAlignment write SetAlignment default taCenter; |
| o.AllowAllUp = value
result = o.AllowAllUp | property AllowAllUp: Boolean read FAllowAllUp write SetAllowAllUp default false; |
| o:Click() | procedure Click; override; |
| o.DisabledImageIndex = value
result = o.DisabledImageIndex | property DisabledImageIndex: TImageIndex index bsDisabled read GetImageIndex write SetImageIndex default -1; |
| o.Down = value
result = o.Down | property Down: Boolean read FDown write SetDown default false; |
| result = o:FindDownButton() | function FindDownButton: TCustomSpeedButton; |
| o.Flat = value
result = o.Flat | property Flat: Boolean read FFlat write SetFlat default false; |
| o.Glyph = value
result = o.Glyph | property Glyph: TBitmap read GetGlyph write SetGlyph stored IsGlyphStored; |
| o.GroupIndex = value
result = o.GroupIndex | property GroupIndex: Integer read FGroupIndex write SetGroupIndex default 0; |
| o.HotImageIndex = value
result = o.HotImageIndex | property HotImageIndex: TImageIndex index bsHot read GetImageIndex write SetImageIndex default -1; |
| o.ImageIndex = value
result = o.ImageIndex | property ImageIndex: TImageIndex index bsUp read GetImageIndex write SetImageIndex default -1; |
| o.ImageWidth = value
result = o.ImageWidth | property ImageWidth: Integer read GetImageWidth write SetImageWidth default 0; |
| o.Images = value
result = o.Images | property Images: TCustomImageList read GetImages write SetImages; |
| o.Layout = value
result = o.Layout | property Layout: TButtonLayout read FLayout write SetLayout default blGlyphLeft; |
| o:LoadGlyphFromLazarusResource(AName) | procedure LoadGlyphFromLazarusResource(const AName: String); |
| o:LoadGlyphFromResourceName(Instance,AName) | procedure LoadGlyphFromResourceName(Instance: THandle; const AName: String); |
| o.Margin = value
result = o.Margin | property Margin: integer read FMargin write SetMargin default -1; |
| o.NumGlyphs = value
result = o.NumGlyphs | property NumGlyphs: Integer read GetNumGlyphs write SetNumGlyphs default 1; |
| o.PressedImageIndex = value
result = o.PressedImageIndex | property PressedImageIndex: TImageIndex index bsDown read GetImageIndex write SetImageIndex default -1; |
| o.SelectedImageIndex = value
result = o.SelectedImageIndex | property SelectedImageIndex: TImageIndex index bsExclusive read GetImageIndex write SetImageIndex default -1; |
| o.ShowAccelChar = value
result = o.ShowAccelChar | property ShowAccelChar: boolean read FShowAccelChar write SetShowAccelChar default true; |
| o.ShowCaption = value
result = o.ShowCaption | property ShowCaption: boolean read FShowCaption write SetShowCaption default true; |
| o.Spacing = value
result = o.Spacing | property Spacing: integer read FSpacing write SetSpacing default 4; |
| o.Transparent = value
result = o.Transparent | property Transparent: Boolean read GetTransparent write SetTransparent default true; |

| Lua examples | FP declaration |
| --- | --- |
| o:AnchorSplitter(Kind,AControl) | procedure AnchorSplitter(Kind: TAnchorKind; AControl: TControl); |
| o.AutoSnap = value
result = o.AutoSnap | property AutoSnap: boolean read FAutoSnap write FAutoSnap default true; |
| o.Beveled = value
result = o.Beveled | property Beveled: boolean read FBeveled write SetBeveled default false; |
| result = o:GetOtherResizeControl() | function GetOtherResizeControl: TControl; |
| result = o:GetSplitterPosition() | function GetSplitterPosition: integer; |
| o.MinSize = value
result = o.MinSize | property MinSize: integer read FMinSize write SetMinSize default 30; |
| o:MoveSplitter(Offset) | procedure MoveSplitter(Offset: integer); virtual; |
| o.OnCanOffset = function(Sender,NewOffset,Accept) return NewOffset,Accept end | property OnCanOffset: TCanOffsetEvent read FOnCanOffset write FOnCanOffset; |
| o.OnCanResize = function(Sender,NewSize,Accept) return NewSize,Accept end | property OnCanResize: TCanResizeEvent read FOnCanResize write FOnCanResize; |
| o.OnMoved = function(Sender) end | property OnMoved: TNotifyEvent read FOnMoved write FOnMoved; |
| o.ResizeAnchor = value
result = o.ResizeAnchor | property ResizeAnchor: TAnchorKind read FResizeAnchor write SetResizeAnchor default akLeft; |
| o.ResizeControl = value
result = o.ResizeControl | property ResizeControl: TControl read GetResizeControl write SetResizeControl; |
| o.ResizeStyle = value
result = o.ResizeStyle | property ResizeStyle: TResizeStyle read FResizeStyle write FResizeStyle default rsUpdate; |
| o:SetSplitterPosition(NewPosition) | procedure SetSplitterPosition(NewPosition: integer); |

| Lua examples | FP declaration |
| --- | --- |
| o.Alignment = value
result = o.Alignment | property Alignment: TAlignment read FAlignment write SetAlignment default taLeftJustify; |
| o.BorderStyle = value
result = o.BorderStyle | property BorderStyle: TStaticBorderStyle read FStaticBorderStyle write SetStaticBorderStyle default sbsNone; |
| o.FocusControl = value
result = o.FocusControl | property FocusControl: TWinControl read FFocusControl write SetFocusControl; |
| o.ShowAccelChar = value
result = o.ShowAccelChar | property ShowAccelChar: boolean read FShowAccelChar write SetShowAccelChar default true; |
| o.Transparent = value
result = o.Transparent | property Transparent: Boolean read GetTransparent write SetTransparent default True; |

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

| Lua examples | FP declaration |
| --- | --- |
| result = o:StatusBar() | function StatusBar: TStatusBar; |

| Lua examples | FP declaration |
| --- | --- |
| result = o:Add() | function Add: TStatusPanel; |
| result = o:Items(Index)
o:Items(Index,value) | property Items[Index: Integer]: TStatusPanel read GetItem write SetItem; default; |
| result = o.StatusBar | property StatusBar: TStatusBar read FStatusBar; |

| Lua examples | FP declaration |
| --- | --- |
| result = o:CopyFrom(Source,Count) | function CopyFrom(Source: TStream; Count: Int64): Int64; |
| o:FixupResourceHeader(FixupInfo) | procedure FixupResourceHeader(FixupInfo: Longint); |
| o.Position = value
result = o.Position | property Position: Int64 read GetPosition write SetPosition; |
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
| o.Size = value
result = o.Size | property Size: Int64 read GetSize write SetSize64; |
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

| Lua examples | FP declaration |
| --- | --- |
| o:AutoSizeColumn(aCol) | procedure AutoSizeColumn(aCol: Integer); |
| o:AutoSizeColumns() | procedure AutoSizeColumns; |
| result = o:Cells(ACol,ARow)
o:Cells(ACol,ARow,value) | property Cells[ACol, ARow: Integer]: string read GetCells write SetCells; |
| o:Clean() | procedure Clean; overload; |
| o:Clean2(CleanOptions) | procedure Clean(CleanOptions: TGridZoneSet); overload; |
| o:Clean3(aRect,CleanOptions) | procedure Clean(aRect: TRect; CleanOptions: TGridZoneSet); overload; |
| o:Clean4(StartCol,StartRow,EndCol,EndRow,CleanOptions) | procedure Clean(StartCol,StartRow,EndCol,EndRow: integer; CleanOptions: TGridZoneSet); overload; |
| result = o:Cols(index)
o:Cols(index,value) | property Cols[index: Integer]: TStrings read GetCols write SetCols; |
| o:CopyToClipboard()
o:CopyToClipboard(AUseSelection) | procedure CopyToClipboard(AUseSelection: boolean = false); |
| o:InsertRowWithValues(Index,Values) | procedure InsertRowWithValues(Index: Integer; Values: array of String); |
| o:LoadFromCSVFile(AFilename)
...
o:LoadFromCSVFile(AFilename,ADelimiter,UseTitles,FromLine,SkipEmptyLines) | procedure LoadFromCSVFile(AFilename: string; ADelimiter: Char=','; UseTitles: boolean=true; FromLine: Integer=0; SkipEmptyLines: Boolean=true); |
| o:LoadFromCSVStream(AStream)
...
o:LoadFromCSVStream(AStream,ADelimiter,UseTitles,FromLine,SkipEmptyLines) | procedure LoadFromCSVStream(AStream: TStream; ADelimiter: Char=','; UseTitles: boolean=true; FromLine: Integer=0; SkipEmptyLines: Boolean=true); virtual; |
| result = o:Objects(ACol,ARow)
o:Objects(ACol,ARow,value) | property Objects[ACol, ARow: Integer]: TObject read GetObjects write SetObjects; |
| o.OnCellProcess = function(Sender,aCol,aRow,processType,aValue) return aValue end | property OnCellProcess: TCellProcessEvent read fOnCellProcess write fOnCellProcess; |
| result = o:Rows(index)
o:Rows(index,value) | property Rows[index: Integer]: TStrings read GetRows write SetRows; |
| o:SaveToCSVFile(AFileName)
...
o:SaveToCSVFile(AFileName,ADelimiter,WriteTitles,VisibleColumnsOnly) | procedure SaveToCSVFile(AFileName: string; ADelimiter: Char=','; WriteTitles: boolean=true; VisibleColumnsOnly: boolean=false); |
| o:SaveToCSVStream(AStream)
...
o:SaveToCSVStream(AStream,ADelimiter,WriteTitles,VisibleColumnsOnly) | procedure SaveToCSVStream(AStream: TStream; ADelimiter: Char=','; WriteTitles: boolean=true; VisibleColumnsOnly: boolean=false); |

| Lua examples | FP declaration |
| --- | --- |
| o.CaseSensitive = value
result = o.CaseSensitive | property CaseSensitive: Boolean read FCaseSensitive write SetCaseSensitive; |
| o.Duplicates = value
result = o.Duplicates | property Duplicates: TDuplicates read FDuplicates write FDuplicates; |
| result, Index = o:Find(S) | function Find(const S: string; Out Index: Integer): Boolean; virtual; |
| o.OnChange = function(Sender) end | property OnChange: TNotifyEvent read FOnChange write FOnChange; |
| o.OnChanging = function(Sender) end | property OnChanging: TNotifyEvent read FOnChanging write FOnChanging; |
| o.OwnsObjects = value
result = o.OwnsObjects | property OwnsObjects : boolean read FOwnsObjects write FOwnsObjects; |
| o:Sort() | procedure Sort; virtual; |
| o.SortStyle = value
result = o.SortStyle | Property SortStyle : TStringsSortStyle Read FSortStyle Write SetSortStyle; |
| o.Sorted = value
result = o.Sorted | property Sorted: Boolean read GetSorted write SetSorted; |

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
| o.AlwaysQuote = value
result = o.AlwaysQuote | property AlwaysQuote: Boolean read FAlwaysQuote write FAlwaysQuote; |
| o:Append(S) | procedure Append(const S: string); |
| o:BeginUpdate() | procedure BeginUpdate; |
| o.Capacity = value
result = o.Capacity | property Capacity: Integer read GetCapacity write SetCapacity; |
| o:Clear() | procedure Clear; virtual; abstract; |
| o.CommaText = value
result = o.CommaText | property CommaText: string read GetCommaText write SetCommaText; |
| result = o.Count | property Count: Integer read GetCount; |
| o:Delete(Index) | procedure Delete(Index: Integer); virtual; abstract; |
| o.DelimitedText = value
result = o.DelimitedText | property DelimitedText: string read GetDelimitedText write SetDelimitedText; |
| o.Delimiter = value
result = o.Delimiter | property Delimiter: Char read GetDelimiter write SetDelimiter; |
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
| o.LineBreak = value
result = o.LineBreak | property LineBreak : string Read GetLineBreak write SetLineBreak; |
| o:LoadFromFile(FileName) | procedure LoadFromFile(const FileName: string); overload; virtual; |
| o:LoadFromFile2(FileName,IgnoreEncoding) | procedure LoadFromFile(const FileName: string; IgnoreEncoding : Boolean); |
| o:LoadFromStream(Stream) | procedure LoadFromStream(Stream: TStream); overload; virtual; |
| o:LoadFromStream2(Stream,IgnoreEncoding) | procedure LoadFromStream(Stream: TStream; IgnoreEncoding : Boolean); overload; |
| o.MissingNameValueSeparatorAction = value
result = o.MissingNameValueSeparatorAction | Property MissingNameValueSeparatorAction : TMissingNameValueSeparatorAction Read GetMissingNameValueSeparatorAction Write SetMissingNameValueSeparatorAction; |
| o:Move(CurIndex,NewIndex) | procedure Move(CurIndex, NewIndex: Integer); virtual; |
| o.NameValueSeparator = value
result = o.NameValueSeparator | Property NameValueSeparator : Char Read GetNameValueSeparator Write SetNameValueSeparator; |
| result = o:Names(Index) | property Names[Index: Integer]: string read GetName; |
| result = o:Objects(Index)
o:Objects(Index,value) | property Objects[Index: Integer]: TObject read GetObject write PutObject; |
| o.Options = value
result = o.Options | property Options: TStringsOptions read FOptions write FOptions; |
| result = o:Pop() | Function Pop : String; |
| o.QuoteChar = value
result = o.QuoteChar | property QuoteChar: Char read GetQuoteChar write SetQuoteChar; |
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
| o.SkipLastLineBreak = value
result = o.SkipLastLineBreak | Property SkipLastLineBreak : Boolean Read GetSkipLastLineBreak Write SetSkipLastLineBreak; |
| o:Slice(fromIndex,aList) | Procedure Slice(fromIndex: integer; aList : TStrings); |
| result = o:Slice2(fromIndex) | Function Slice(fromIndex: integer) : TStrings; |
| o.StrictDelimiter = value
result = o.StrictDelimiter | Property StrictDelimiter : Boolean Read GetStrictDelimiter Write SetStrictDelimiter; |
| result = o:Strings(Index)
o:Strings(Index,value) | property Strings[Index: Integer]: string read Get write Put; default; |
| o.Text = value
result = o.Text | property Text: string read GetTextStr write SetTextStr; |
| o.TextLineBreakStyle = value
result = o.TextLineBreakStyle | Property TextLineBreakStyle : TTextLineBreakStyle Read GetLBS Write SetLBS; |
| result = o:ToObjectArray(aStart,aEnd) | function ToObjectArray(aStart,aEnd : Integer) : TObjectDynArray; overload; |
| result = o:ToObjectArray2() | function ToObjectArray: TObjectDynArray; overload; |
| result = o:ToStringArray(aStart,aEnd) | function ToStringArray(aStart,aEnd : Integer) : TStringDynArray; overload; |
| result = o:ToStringArray2() | function ToStringArray: TStringDynArray; overload; |
| o.TrailingLineBreak = value
result = o.TrailingLineBreak | Property TrailingLineBreak : Boolean Read GetTrailingLineBreak Write SetTrailingLineBreak; |
| o.UseLocale = value
result = o.UseLocale | Property UseLocale : Boolean Read GetUseLocale Write SetUseLocale; |
| result = o:ValueFromIndex(Index)
o:ValueFromIndex(Index,value) | property ValueFromIndex[Index: Integer]: string read GetValueFromIndex write SetValueFromIndex; |
| result = o:Values(Name)
o:Values(Name,value) | property Values[const Name: string]: string read GetValue write SetValue; |
| o.WriteBOM = value
result = o.WriteBOM | property WriteBOM: Boolean read GetWriteBOM write SetWriteBOM; |

| Lua examples | FP declaration |
| --- | --- |
| o.AliasPropertyNames = value
result = o.AliasPropertyNames | property AliasPropertyNames: TAliasStrings read FAliasPropertyNames write SetAliasPropertyNames; |
| o:ClearProperties() | procedure ClearProperties; |
| aRect = o:DefaultDrawCell(aCol,aRow,aState) | procedure DefaultDrawCell(aCol, aRow: Integer; var aRect: TRect; aState: TGridDrawState); virtual; |
| aRect = o:DefaultDrawCell2(aCol,aRow,aRect,aState) | procedure DefaultDrawCell(aCol, aRow: Integer; var aRect: TRect; aState: TGridDrawState); virtual; |
| o:DrawObjectName(Index,aRect,aState) | procedure DrawObjectName(Index: integer; const aRect: TRect; aState: TGridDrawState); |
| o.Filter = value
result = o.Filter | property Filter: TTypeKinds read FFilter write SetFilter default AllTypeKinds; |
| result = o:FindGridProperty(PropName) | function FindGridProperty(const PropName: string): TTIGridProperty; |
| o:FreeCellEditor(PropEditor) | procedure FreeCellEditor(PropEditor: TPropertyEditor); |
| aPropEditor, aIndependentEditor = o:GetCellEditor(aCol,aRow) | procedure GetCellEditor(aCol, aRow: integer; out aPropEditor: TPropertyEditor; out aIndependentEditor: boolean); |
| result = o:GetCurrentGridProperty() | function GetCurrentGridProperty: TTIGridProperty; |
| result = o:GetTIObject(Index) | function GetTIObject(Index: integer): TPersistent; |
| result = o:GridStateToPropEditState(GridState) | function GridStateToPropEditState(GridState: TGridDrawState ): TPropEditDrawState; |
| o.HideProperties = value
result = o.HideProperties | property HideProperties: TStrings read FHideProperties write SetHideProperties; |
| result = o:IndexOfGridProperty(PropName) | function IndexOfGridProperty(const PropName: string): integer; |
| o.ListDirection = value
result = o.ListDirection | property ListDirection: TTIListDirection read FListDirection write SetListDirection default tldObjectsAsRows; |
| o.ListObject = value
result = o.ListObject | property ListObject: TObject read FListObject write SetListObject; |
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
| o.PropertyOrder = value
result = o.PropertyOrder | property PropertyOrder: TStrings read FPropertyOrder write SetPropertyOrder; |
| o:ReloadTIList() | procedure ReloadTIList; |
| o.ShowOnlyProperties = value
result = o.ShowOnlyProperties | property ShowOnlyProperties: TStrings read FShowOnlyProperties write SetShowOnlyProperties; |
| result = o.TIObjectCount | property TIObjectCount: integer read FTIObjectCount; |
| o.TIOptions = value
result = o.TIOptions | property TIOptions: TTIGridOptions read FTIOptions write SetTIOptions; |

| Lua examples | FP declaration |
| --- | --- |
| result = o.Editor | property Editor: TPropertyEditor read FEditor; |
| result = o:GetButtonEditorControl() | function GetButtonEditorControl: TWinControl; |
| result = o:GetEditorControl() | function GetEditorControl: TWinControl; |
| result = o.Grid | property Grid: TTICustomGrid read FGrid; |
| result = o.Index | property Index: integer read FIndex; |
| result = o:PropName() | function PropName: string; |
| o.Title = value
result = o.Title | property Title: string read FTitle write SetTitle; |

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

| Lua examples | FP declaration |
| --- | --- |
| o.PageControl = value
result = o.PageControl | property PageControl: TPageControl read GetPageControl write SetPageControl; |
| result = o.TabIndex | property TabIndex: Integer read GetTabIndex; |

| Lua examples | FP declaration |
| --- | --- |
| o:BeginUpdate() | procedure BeginUpdate; |
| o:EndUpdate() | procedure EndUpdate; |
| o:MakeTextBufferUnique() | procedure MakeTextBufferUnique; |
| o.OnChange = function(Sender) end | property OnChange: TNotifyEvent read FOnChange write FOnChange; |
| o.OnChanging = function(Sender) end | property OnChanging: TNotifyEvent read FOnChanging write FOnChanging; |
| o.Text = value
result = o.Text | property Text: string read FText write SetTextStr; |

| Lua examples | FP declaration |
| --- | --- |
| result = o.DroppedDown | property DroppedDown: Boolean read FDroppedDown; |
| o.Time = value
result = o.Time | property Time: TDateTime read GetTime write SetTime; |

| Lua examples | FP declaration |
| --- | --- |
| result = o.ButtonCount | property ButtonCount: Integer read GetButtonCount; |
| result = o.ButtonDropWidth | property ButtonDropWidth: Integer read GetButtonDropWidth; |
| result = o:Buttons(Index) | property Buttons[Index: Integer]: TToolButton read GetButton; |
| result = o.RowCount | property RowCount: Integer read FRowCount; |
| o:SetButtonSize(NewButtonWidth,NewButtonHeight) | procedure SetButtonSize(NewButtonWidth, NewButtonHeight: integer); |

| Lua examples | FP declaration |
| --- | --- |
| o:ArrowClick() | procedure ArrowClick; virtual; |
| result = o:CheckMenuDropdown() | function CheckMenuDropdown: Boolean; virtual; |
| o:Click() | procedure Click; override; |
| ImageList, TheIndex, TheEffect = o:GetCurrentIcon() | procedure GetCurrentIcon(var ImageList: TCustomImageList; var TheIndex: integer; var TheEffect: TGraphicsDrawEffect); virtual; |
| ImageList, TheIndex, TheEffect = o:GetCurrentIcon2(ImageList,TheIndex,TheEffect) | procedure GetCurrentIcon(var ImageList: TCustomImageList; var TheIndex: integer; var TheEffect: TGraphicsDrawEffect); virtual; |
| result = o.Index | property Index: Integer read GetIndex; |
| result = o:PointInArrow(X,Y) | function PointInArrow(const X, Y: Integer): Boolean; |

| Lua examples | FP declaration |
| --- | --- |
| o:BeginUpdate() | procedure BeginUpdate; virtual; |
| o.EdgeInner = value
result = o.EdgeInner | property EdgeInner: TEdgeStyle read FEdgeInner write SetEdgeInner default esRaised; |
| o.EdgeOuter = value
result = o.EdgeOuter | property EdgeOuter: TEdgeStyle read FEdgeOuter write SetEdgeOuter default esLowered; |
| o:EndUpdate() | procedure EndUpdate; virtual; |

| Lua examples | FP declaration |
| --- | --- |
| o:SetParams(APosition,AMin,AMax) | procedure SetParams(APosition, AMin, AMax: Integer); |
| o:SetTick(Value) | procedure SetTick(Value: Integer); |

| Lua examples | FP declaration |
| --- | --- |
| o.Animate = value
result = o.Animate | property Animate: Boolean read FAnimate write SetAnimate default False; |
| o.AnimateInterval = value
result = o.AnimateInterval | property AnimateInterval: Cardinal read GetAnimateInterval write SetAnimateInterval default 1000; |
| o.BalloonFlags = value
result = o.BalloonFlags | property BalloonFlags: TBalloonFlags read FBalloonFlags write FBalloonFlags default bfNone; |
| o.BalloonHint = value
result = o.BalloonHint | property BalloonHint: string read FBalloonHint write FBalloonHint; |
| o.BalloonTimeout = value
result = o.BalloonTimeout | property BalloonTimeout: Integer read FBalloonTimeout write FBalloonTimeout default 3000; |
| o.BalloonTitle = value
result = o.BalloonTitle | property BalloonTitle: string read FBalloonTitle write FBalloonTitle; |
| result = o.Canvas | property Canvas: TCanvas read GetCanvas; |
| result = o:GetPosition() | function GetPosition: TPoint; |
| o.Handle = value
result = o.Handle | Handle: HWND; |
| result = o:Hide() | function Hide: Boolean; |
| o.Hint = value
result = o.Hint | property Hint: string read FHint write SetHint; |
| o.Icon = value
result = o.Icon | property Icon: TIcon read FIcon write SetIcon; |
| o.Icons = value
result = o.Icons | property Icons: TCustomImageList read FIcons write SetIcons; |
| o:InternalUpdate() | procedure InternalUpdate; |
| o.OnClick = function(Sender) end | property OnClick: TNotifyEvent read FOnClick write FOnClick; |
| o.OnDblClick = function(Sender) end | property OnDblClick: TNotifyEvent read FOnDblClick write FOnDblClick; |
| o.OnMouseDown = function(Sender,Button,Shift,X,Y) end | property OnMouseDown: TMouseEvent read FOnMouseDown write FOnMouseDown; |
| o.OnMouseMove = function(Sender,Shift,X,Y) end | property OnMouseMove: TMouseMoveEvent read FOnMouseMove write FOnMouseMove; |
| o.OnMouseUp = function(Sender,Button,Shift,X,Y) end | property OnMouseUp: TMouseEvent read FOnMouseUp write FOnMouseUp; |
| o.OnPaint = function(Sender) end | property OnPaint: TNotifyEvent read FOnPaint write FOnPaint; |
| o.PopUpMenu = value
result = o.PopUpMenu | property PopUpMenu: TPopupMenu read FPopUpMenu write SetPopUpMenu; |
| result = o:Show() | function Show: Boolean; |
| o:ShowBalloonHint() | procedure ShowBalloonHint; |
| o.ShowIcon = value
result = o.ShowIcon | property ShowIcon: Boolean read FShowIcon write FShowIcon default True; |
| o.Visible = value
result = o.Visible | property Visible: Boolean read FVisible write SetVisible default False; |

| Lua examples | FP declaration |
| --- | --- |
| result = o.AbsoluteIndex | property AbsoluteIndex: Integer read GetAbsoluteIndex; |
| result = o:AlphaSort() | function AlphaSort: Boolean; |
| result = o:Bottom() | function Bottom: integer; |
| result = o:BottomExpanded() | function BottomExpanded: integer; |
| o:Collapse(Recurse) | procedure Collapse(Recurse: Boolean); |
| o:ConsistencyCheck() | procedure ConsistencyCheck; |
| result = o.Count | property Count: Integer read GetCount; |
| o.Cut = value
result = o.Cut | property Cut: Boolean read GetCut write SetCut; |
| o.Data = value
result = o.Data | property Data: Pointer read FData write SetData; |
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
| o.DropTarget = value
result = o.DropTarget | property DropTarget: Boolean read GetDropTarget write SetDropTarget; |
| result = o:EditText() | function EditText: Boolean; |
| o.Enabled = value
result = o.Enabled | property Enabled: Boolean read GetEnabled write SetEnabled default True; |
| o:EndEdit(Cancel) | procedure EndEdit(Cancel: Boolean); |
| o:Expand(Recurse) | procedure Expand(Recurse: Boolean); |
| o:ExpandParents() | procedure ExpandParents; |
| o.Expanded = value
result = o.Expanded | property Expanded: Boolean read GetExpanded write SetExpanded; |
| result = o:FindNode(NodeText) | function FindNode(const NodeText: string): TTreeNode; |
| o.Focused = value
result = o.Focused | property Focused: Boolean read GetFocused write SetFocused; |
| o:FreeAllNodeData() | procedure FreeAllNodeData; |
| result = o:GetFirstChild() | function GetFirstChild: TTreeNode; |
| result = o:GetFirstSibling() | function GetFirstSibling: TTreeNode; |
| result = o:GetFirstVisibleChild()
result = o:GetFirstVisibleChild(aEnabledOnly) | function GetFirstVisibleChild(aEnabledOnly: boolean = false): TTreeNode; |
| result = o:GetHandle() | function GetHandle: THandle; |
| result = o:GetLastChild() | function GetLastChild: TTreeNode; |
| result = o:GetLastSibling() | function GetLastSibling: TTreeNode; |
| result = o:GetLastSubChild() | function GetLastSubChild: TTreeNode; |
| result = o:GetLastVisibleChild()
result = o:GetLastVisibleChild(aEnabledOnly) | function GetLastVisibleChild(aEnabledOnly: boolean = false): TTreeNode; |
| result = o:GetNext() | function GetNext: TTreeNode; |
| result = o:GetNextChild(AValue) | function GetNextChild(AValue: TTreeNode): TTreeNode; |
| result = o:GetNextExpanded()
result = o:GetNextExpanded(aEnabledOnly) | function GetNextExpanded(aEnabledOnly: boolean = false): TTreeNode; |
| result = o:GetNextMultiSelected() | function GetNextMultiSelected: TTreeNode; |
| result = o:GetNextSibling() | function GetNextSibling: TTreeNode; |
| result = o:GetNextSkipChildren() | function GetNextSkipChildren: TTreeNode; |
| result = o:GetNextVisible()
result = o:GetNextVisible(aEnabledOnly) | function GetNextVisible(aEnabledOnly: boolean = false): TTreeNode; |
| result = o:GetNextVisibleSibling()
result = o:GetNextVisibleSibling(aEnabledOnly) | function GetNextVisibleSibling(aEnabledOnly: boolean = false): TTreeNode; |
| result = o:GetParentNodeOfAbsoluteLevel(TheAbsoluteLevel) | function GetParentNodeOfAbsoluteLevel(TheAbsoluteLevel: integer): TTreeNode; |
| result = o:GetPrev() | function GetPrev: TTreeNode; |
| result = o:GetPrevChild(AValue) | function GetPrevChild(AValue: TTreeNode): TTreeNode; |
| result = o:GetPrevExpanded()
result = o:GetPrevExpanded(aEnabledOnly) | function GetPrevExpanded(aEnabledOnly: boolean = false): TTreeNode; |
| result = o:GetPrevMultiSelected() | function GetPrevMultiSelected: TTreeNode; |
| result = o:GetPrevSibling() | function GetPrevSibling: TTreeNode; |
| result = o:GetPrevVisible()
result = o:GetPrevVisible(aEnabledOnly) | function GetPrevVisible(aEnabledOnly: boolean = false): TTreeNode; |
| result = o:GetPrevVisibleSibling()
result = o:GetPrevVisibleSibling(aEnabledOnly) | function GetPrevVisibleSibling(aEnabledOnly: boolean = false): TTreeNode; |
| result = o:GetTextPath() | function GetTextPath: string; |
| result = o.Handle | property Handle: THandle read GetHandle; |
| result = o:HasAsParent(AValue) | function HasAsParent(AValue: TTreeNode): Boolean; |
| o.HasChildren = value
result = o.HasChildren | property HasChildren: Boolean read GetHasChildren write SetHasChildren; |
| o.Height = value
result = o.Height | property Height: integer read GetHeight write SetHeight; |
| o.ImageIndex = value
result = o.ImageIndex | property ImageIndex: TImageIndex read FImageIndex write SetImageIndex default -1; |
| o.Index = value
result = o.Index | property Index: Integer read GetIndex write SetIndex; |
| result = o:IndexOf(AValue) | function IndexOf(AValue: TTreeNode): Integer; |
| result = o:IndexOfText(NodeText) | function IndexOfText(const NodeText: string): Integer; |
| result = o.IsFullHeightVisible | property IsFullHeightVisible: Boolean read IsNodeHeightFullVisible; |
| result = o.IsVisible | property IsVisible: Boolean read IsNodeVisible; |
| result = o:Items(ItemIndex)
o:Items(ItemIndex,value) | property Items[ItemIndex: Integer]: TTreeNode read GetItems write SetItems; default; |
| result = o.Level | property Level: Integer read GetLevel; |
| o:MakeVisible() | procedure MakeVisible; |
| o:MoveTo(Destination,Mode) | procedure MoveTo(Destination: TTreeNode; Mode: TNodeAttachMode); virtual; |
| o:MultiSelectGroup() | procedure MultiSelectGroup; |
| o.MultiSelected = value
result = o.MultiSelected | property MultiSelected: Boolean read GetMultiSelected write SetMultiSelected; |
| o.NodeEffect = value
result = o.NodeEffect | property NodeEffect: TGraphicsDrawEffect read FNodeEffect write SetImageEffect; |
| o.OverlayIndex = value
result = o.OverlayIndex | property OverlayIndex: Integer read FOverlayIndex write SetOverlayIndex default -1; |
| result = o.Owner | property Owner: TTreeNodes read FOwner; |
| result = o.Parent | property Parent: TTreeNode read FParent; |
| o.Selected = value
result = o.Selected | property Selected: Boolean read GetSelected write SetSelected; |
| o.SelectedIndex = value
result = o.SelectedIndex | property SelectedIndex: Integer read FSelectedIndex write SetSelectedIndex default -1; |
| o.StateIndex = value
result = o.StateIndex | property StateIndex: Integer read FStateIndex write SetStateIndex default -1; |
| result = o.States | property States: TNodeStates read FStates; |
| result = o.SubTreeCount | property SubTreeCount: integer read FSubTreeCount; |
| o.Text = value
result = o.Text | property Text: string read FText write SetText; |
| result = o.Top | property Top: integer read GetTop; |
| result = o.TreeNodes | property TreeNodes: TTreeNodes read GetTreeNodes; |
| result = o.TreeView | property TreeView: TCustomTreeView read GetTreeView; |
| o:Update() | procedure Update; |
| o.Visible = value
result = o.Visible | property Visible: Boolean read GetVisible write SetVisible default True; |
| o:WriteDebugReport(Prefix,Recurse) | procedure WriteDebugReport(const Prefix: string; Recurse: boolean); |

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
| o:ClearMultiSelection()
o:ClearMultiSelection(ClearSelected) | procedure ClearMultiSelection(ClearSelected: boolean = false); |
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
| o.KeepCollapsedNodes = value
result = o.KeepCollapsedNodes | property KeepCollapsedNodes: boolean read FKeepCollapsedNodes write FKeepCollapsedNodes; |
| o:MultiSelect(Node,ClearWholeSelection) | procedure MultiSelect(Node: TTreeNode; ClearWholeSelection: Boolean); |
| result = o.Owner | property Owner: TCustomTreeView read FOwner; |
| o:SelectOnlyThis(Node) | procedure SelectOnlyThis(Node: TTreeNode); |
| result = o.SelectionCount | property SelectionCount: Cardinal read GetSelectionCount; |
| o:SelectionsChanged(ANode,AIsSelected) | procedure SelectionsChanged(ANode: TTreeNode; const AIsSelected: Boolean); |
| result = o.TopLvlCount | property TopLvlCount: integer read FTopLvlCount; |
| result = o:TopLvlItems(Index)
o:TopLvlItems(Index,value) | property TopLvlItems[Index: integer]: TTreeNode read GetTopLvlItems write SetTopLvlItems; |
| o:WriteDebugReport(Prefix,AllNodes) | procedure WriteDebugReport(const Prefix: string; AllNodes: boolean); |

| Lua examples | FP declaration |
| --- | --- |
| o.AccessibilityOn = value
result = o.AccessibilityOn | property AccessibilityOn: Boolean read FAccessibilityOn write FAccessibilityOn default True; |
| result = o:AlphaSort() | function AlphaSort: Boolean; |
| o:ApplyStoredSelection(ASelection)
o:ApplyStoredSelection(ASelection,FreeList) | procedure ApplyStoredSelection(ASelection: TStringList; FreeList: boolean = True); |
| o.BackgroundColor = value
result = o.BackgroundColor | property BackgroundColor: TColor read GetBackgroundColor write SetBackgroundColor stored IsStoredBackgroundColor; |
| o:BeginUpdate() | procedure BeginUpdate; |
| o.BottomItem = value
result = o.BottomItem | property BottomItem: TTreeNode read GetBottomItem write SetBottomItem; |
| o:ClearInvisibleSelection() | procedure ClearInvisibleSelection; |
| o:ClearSelection()
o:ClearSelection(KeepPrimary) | procedure ClearSelection(KeepPrimary: Boolean = false); virtual; |
| o:ConsistencyCheck() | procedure ConsistencyCheck; |
| o.DefaultItemHeight = value
result = o.DefaultItemHeight | property DefaultItemHeight: integer read FDefItemHeight write SetDefaultItemHeight stored DefaultItemHeightIsStored; |
| result = o:DefaultTreeViewSort(Node1,Node2) | function DefaultTreeViewSort(Node1, Node2: TTreeNode): Integer; |
| o.DropTarget = value
result = o.DropTarget | property DropTarget: TTreeNode read GetDropTarget write SetDropTarget; |
| o:EndUpdate() | procedure EndUpdate; |
| o.ExpandSignColor = value
result = o.ExpandSignColor | property ExpandSignColor: TColor read FExpandSignColor write FExpandSignColor default clWindowFrame; |
| o.ExpandSignSize = value
result = o.ExpandSignSize | property ExpandSignSize: integer read GetExpandSignSize write SetExpandSignSize stored ExpandSignSizeIsStored; |
| o.ExpandSignType = value
result = o.ExpandSignType | property ExpandSignType: TTreeViewExpandSignType read FExpandSignType write SetExpandSignType default tvestTheme; |
| o.ExpandSignWidth = value
result = o.ExpandSignWidth | property ExpandSignWidth: integer read FExpandSignWidth write SetExpandSignWidth default 2; |
| o:FullCollapse() | procedure FullCollapse; |
| o:FullExpand() | procedure FullExpand; |
| result = o:GetFirstMultiSelected() | function GetFirstMultiSelected: TTreeNode; |
| AnInsertMarkNode, AnInsertMarkType = o:GetInsertMarkAt(X,Y) | procedure GetInsertMarkAt(X, Y: Integer; out AnInsertMarkNode: TTreeNode; out AnInsertMarkType: TTreeViewInsertMarkType); |
| result = o:GetLastMultiSelected() | function GetLastMultiSelected: TTreeNode; |
| result = o:GetNodeAt(X,Y) | function GetNodeAt(X, Y: Integer): TTreeNode; |
| result = o:GetNodeWithExpandSignAt(X,Y) | function GetNodeWithExpandSignAt(X, Y: Integer): TTreeNode; |
| o.Images = value
result = o.Images | property Images: TCustomImageList read FImages write SetImages; |
| o.ImagesWidth = value
result = o.ImagesWidth | property ImagesWidth: Integer read FImagesWidth write SetImagesWidth default 0; |
| o.InsertMarkNode = value
result = o.InsertMarkNode | property InsertMarkNode: TTreeNode read FInsertMarkNode write SetInsertMarkNode; |
| o.InsertMarkType = value
result = o.InsertMarkType | property InsertMarkType: TTreeViewInsertMarkType read FInsertMarkType write SetInsertMarkType; |
| result = o:IsEditing() | function IsEditing: Boolean; |
| o.Items = value
result = o.Items | property Items: TTreeNodes read FTreeNodes write SetTreeNodes; |
| o.KeepCollapsedNodes = value
result = o.KeepCollapsedNodes | property KeepCollapsedNodes: boolean read GetKeepCollapsedNodes write SetKeepCollapsedNodes; |
| o:LoadFromFile(FileName) | procedure LoadFromFile(const FileName: string); |
| o:LoadFromStream(Stream) | procedure LoadFromStream(Stream: TStream); |
| o:LockSelectionChangeEvent() | procedure LockSelectionChangeEvent; |
| o:MakeSelectionVisible() | procedure MakeSelectionVisible; |
| o:MoveCollapse()
o:MoveCollapse(ASelect) | procedure MoveCollapse(ASelect: Boolean = False); |
| o:MoveEnd()
o:MoveEnd(ASelect) | procedure MoveEnd(ASelect: Boolean = False); |
| o:MoveExpand()
o:MoveExpand(ASelect) | procedure MoveExpand(ASelect: Boolean = False); |
| o:MoveHome()
o:MoveHome(ASelect) | procedure MoveHome(ASelect: Boolean = False); |
| o:MoveLeft()
o:MoveLeft(ASelect) | procedure MoveLeft(ASelect: Boolean = False); |
| o:MovePageDown()
o:MovePageDown(ASelect) | procedure MovePageDown(ASelect: Boolean = False); |
| o:MovePageUp()
o:MovePageUp(ASelect) | procedure MovePageUp(ASelect: Boolean = False); |
| o:MoveRight()
o:MoveRight(ASelect) | procedure MoveRight(ASelect: Boolean = False); |
| o:MoveToNextNode()
o:MoveToNextNode(ASelect) | procedure MoveToNextNode(ASelect: Boolean = False); |
| o:MoveToPrevNode()
o:MoveToPrevNode(ASelect) | procedure MoveToPrevNode(ASelect: Boolean = False); |
| o.MultiSelectStyle = value
result = o.MultiSelectStyle | property MultiSelectStyle: TMultiSelectStyle read FMultiSelectStyle write SetMultiSelectStyle default DefaultMultiSelectStyle; |
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
| o.Options = value
result = o.Options | property Options: TTreeViewOptions read FOptions write SetOptions default DefaultTreeViewOptions; |
| o:SaveToFile(FileName) | procedure SaveToFile(const FileName: string); |
| o:SaveToStream(Stream) | procedure SaveToStream(Stream: TStream); |
| o.ScrollBars = value
result = o.ScrollBars | property ScrollBars: TScrollStyle read FScrollBars write SetScrollBars default ssBoth; |
| o:Select(Node)
o:Select(Node,ShiftState) | procedure Select(Node: TTreeNode; ShiftState: TShiftState = []); |
| o:Select2(Nodes) | procedure Select(const Nodes: array of TTreeNode); virtual; |
| o.Selected = value
result = o.Selected | property Selected: TTreeNode read GetSelection write SetSelection; |
| o.SelectionColor = value
result = o.SelectionColor | property SelectionColor: TColor read FSelectedColor write SetSelectedColor default clHighlight; |
| result = o.SelectionCount | property SelectionCount: Cardinal read GetSelectionCount; |
| o.SelectionFontColor = value
result = o.SelectionFontColor | property SelectionFontColor: TColor read FSelectedFontColor write SetSelectedFontColor default clWhite; |
| o.SelectionFontColorUsed = value
result = o.SelectionFontColorUsed | property SelectionFontColorUsed: boolean read FSelectedFontColorUsed write FSelectedFontColorUsed default False; |
| result = o:SelectionVisible() | function SelectionVisible: boolean; |
| result = o:Selections(AIndex) | property Selections[AIndex: Integer]: TTreeNode read GetSelections; |
| o.SeparatorColor = value
result = o.SeparatorColor | property SeparatorColor: TColor read fSeparatorColor write SetSeparatorColor default clGray; |
| o:SetInsertMark(AnInsertMarkNode,AnInsertMarkType) | procedure SetInsertMark(AnInsertMarkNode: TTreeNode; AnInsertMarkType: TTreeViewInsertMarkType); |
| o:SetInsertMarkAt(X,Y) | procedure SetInsertMarkAt(X,Y: integer); virtual; |
| o.StateImages = value
result = o.StateImages | property StateImages: TCustomImageList read FStateImages write SetStateImages; |
| o.StateImagesWidth = value
result = o.StateImagesWidth | property StateImagesWidth: Integer read FStateImagesWidth write SetStateImagesWidth default 0; |
| result = o:StoreCurrentSelection() | function StoreCurrentSelection: TStringList; |
| o.TopItem = value
result = o.TopItem | property TopItem: TTreeNode read GetTopItem write SetTopItem; |
| o.TreeLineColor = value
result = o.TreeLineColor | property TreeLineColor: TColor read FTreeLineColor write FTreeLineColor default clWindowFrame; |
| o.TreeLinePenStyle = value
result = o.TreeLinePenStyle | property TreeLinePenStyle: TPenStyle read FTreeLinePenStyle write FTreeLinePenStyle default psPattern; |
| o:UnlockSelectionChangeEvent() | procedure UnlockSelectionChangeEvent; |
| o:WriteDebugReport(Prefix,AllNodes) | procedure WriteDebugReport(const Prefix: string; AllNodes: boolean); |

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
| result = o:Keys(Index)
o:Keys(Index,value) | property Keys[Index: Integer]: string read GetKey write SetKey; |
| o:MoveColRow(IsColumn,FromIndex,ToIndex) | procedure MoveColRow(IsColumn: Boolean; FromIndex, ToIndex: Integer); |
| result = o:RestoreCurrentRow() | function RestoreCurrentRow: Boolean; |
| o:Sort(Index,IndxFrom,IndxTo) | procedure Sort(Index, IndxFrom, IndxTo: Integer); |
| o:Sort2()
o:Sort2(ACol) | procedure Sort(ACol: TVleSortCol = colKey); |
| result = o:Values(Key)
o:Values(Key,value) | property Values[const Key: string]: string read GetValue write SetValue; |

| Lua examples | FP declaration |
| --- | --- |
| o:AddControl() | procedure AddControl; virtual; |
| o:AutoAdjustLayout(AMode,AFromPPI,AToPPI,AOldFormWidth,ANewFormWidth) | procedure AutoAdjustLayout(AMode: TLayoutAdjustmentPolicy; const AFromPPI, AToPPI, AOldFormWidth, ANewFormWidth: Integer); override; |
| o:BeginUpdateBounds() | procedure BeginUpdateBounds; |
| o.BorderWidth = value
result = o.BorderWidth | property BorderWidth: TBorderWidth read FBorderWidth write SetBorderWidth default 0; |
| result = o.BoundsLockCount | property BoundsLockCount: Integer read FBoundsLockCount; |
| ToAllMessage = o:BroadCast() | procedure BroadCast(var ToAllMessage); |
| ToAllMessage = o:BroadCast2(ToAllMessage) | procedure BroadCast(var ToAllMessage); |
| result = o.Brush | property Brush: TBrush read GetBrush; |
| result = o:BrushCreated() | function BrushCreated: Boolean; |
| result = o.CachedClientHeight | property CachedClientHeight: Integer read FClientHeight; |
| result = o.CachedClientWidth | property CachedClientWidth: Integer read FClientWidth; |
| result = o:CanFocus() | function CanFocus: Boolean; virtual; |
| result = o:CanSetFocus() | function CanSetFocus: Boolean; virtual; |
| o.ChildSizing = value
result = o.ChildSizing | property ChildSizing: TControlChildSizing read FChildSizing write SetChildSizing; |
| result = o:ClientRectNeedsInterfaceUpdate() | function ClientRectNeedsInterfaceUpdate: Boolean; |
| result = o:ContainsControl(Control) | function  ContainsControl(Control: TControl): Boolean; |
| result = o:ControlAtPos(Pos,AllowDisabled) | function ControlAtPos(const Pos: TPoint; AllowDisabled: Boolean): TControl; |
| result = o:ControlAtPos2(Pos,AllowDisabled,AllowWinControls) | function ControlAtPos(const Pos: TPoint; AllowDisabled, AllowWinControls: Boolean): TControl; |
| result = o:ControlAtPos3(Pos,Flags) | function ControlAtPos(const Pos: TPoint; Flags: TControlAtPosFlags): TControl; virtual; |
| result = o.ControlCount | property ControlCount: Integer read GetControlCount; |
| result = o:Controls(Index) | property Controls[Index: Integer]: TControl read GetControl; |
| result = o:CreateParentedControl(AParentWindow) | class function CreateParentedControl(AParentWindow: HWND): TWinControl; |
| o.DefWndProc = value
result = o.DefWndProc | property DefWndProc: Pointer read FDefWndProc write FDefWndPRoc; |
| AMessage = o:DefaultHandler() | procedure DefaultHandler(var AMessage); override; |
| AMessage = o:DefaultHandler2(AMessage) | procedure DefaultHandler(var AMessage); override; |
| o.DesignerDeleting = value | property DesignerDeleting: Boolean write SetDesignerDeleting; |
| o:DisableAlign() | procedure DisableAlign; |
| o:DoAdjustClientRectChange()
o:DoAdjustClientRectChange(InvalidateRect) | procedure DoAdjustClientRectChange(const InvalidateRect: Boolean = True); |
| result = o.DockClientCount | property DockClientCount: Integer read GetDockClientCount; |
| result = o:DockClients(Index) | property DockClients[Index: Integer]: TControl read GetDockClients; |
| o:DockDrop(DragDockObject,X,Y) | procedure DockDrop(DragDockObject: TDragDockObject; X, Y: Integer); virtual; |
| o.DockManager = value
result = o.DockManager | property DockManager: TDockManager read FDockManager write SetDockManager; |
| o.DockSite = value
result = o.DockSite | property DockSite: Boolean read FDockSite write SetDockSite default False; |
| o.DoubleBuffered = value
result = o.DoubleBuffered | property DoubleBuffered: Boolean read FDoubleBuffered write SetDoubleBuffered stored DoubleBufferedIsStored; |
| o:EnableAlign() | procedure EnableAlign; |
| o:EndUpdateBounds() | procedure EndUpdateBounds; |
| result = o:FindChildControl(ControlName) | function FindChildControl(const ControlName: string): TControl; |
| o:FixDesignFontsPPIWithChildren(ADesignTimePPI) | procedure FixDesignFontsPPIWithChildren(const ADesignTimePPI: Integer); |
| o:FlipChildren(AllLevels) | procedure FlipChildren(AllLevels: Boolean); virtual; |
| result = o:Focused() | function Focused: Boolean; virtual; |
| result = o:GetControlIndex(AControl) | function GetControlIndex(AControl: TControl): Integer; |
| result = o:GetDockCaption(AControl) | function GetDockCaption(AControl: TControl): string; virtual; |
| o:GetTabOrderList(List) | procedure GetTabOrderList(List: TFPList); virtual; |
| o.Handle = value
result = o.Handle | property Handle: HWND read GetHandle write SetHandle; |
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
| o.ParentDoubleBuffered = value
result = o.ParentDoubleBuffered | property ParentDoubleBuffered: Boolean read FParentDoubleBuffered write SetParentDoubleBuffered default True; |
| o.ParentWindow = value
result = o.ParentWindow | property ParentWindow: HWND read FParentWindow write SetParentWindow; |
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
| o.TabOrder = value
result = o.TabOrder | property TabOrder: TTabOrder read GetTabOrder write SetTabOrder default -1; |
| o.TabStop = value
result = o.TabStop | property TabStop: Boolean read FTabStop write SetTabStop default false; |
| o:UnlockRealizeBounds() | procedure UnlockRealizeBounds; |
| o:UpdateDockCaption()
o:UpdateDockCaption(Exclude) | procedure UpdateDockCaption(Exclude: TControl = nil); virtual; |
| o.UseDockManager = value
result = o.UseDockManager | property UseDockManager: Boolean read FUseDockManager write SetUseDockManager default False; |
| result = o.VisibleDockClientCount | property VisibleDockClientCount: Integer read GetVisibleDockClientCount; |
| o:WriteLayoutDebugReport(Prefix) | procedure WriteLayoutDebugReport(const Prefix: string); override; |
