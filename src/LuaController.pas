unit LuaController;

interface

Uses Controls,
     ExtCtrls,
     Classes,
     Types,
     Forms,
     Grids,
     ComCtrls,
     Lua,
     LuaHelper,
     SynEdit,
     SynEditKeyCmds,
     LclType,
     Messages,
     SysUtils;

type

    ToTableProc = procedure(LL:Plua_State; Index:Integer; Sender:TObject);

    TLuaCFunction = Integer;

    TVCLuaControl = class(TComponent)

        constructor Create(AOwner:TComponent; LL: Plua_State; T:ToTableProc);
        procedure ToTable(LL:Plua_State; Index:Integer; Sender:TObject);
        public
            L: Plua_State;
            TTable: ToTableProc;
        private
          // LUA Event Strings
          fOnLuaCreate_Func,
          fOnLuaClick_Func,
          fOnLuaDblClick_Func,
          fOnLuaDestroy_Func,
          fOnLuaShow_Func,
          fOnLuaHide_Func,
          fOnLuaActivate_Func,
          fOnLuaDeactivate_Func,
          fOnLuaResize_Func,
          fOnLuaPaint_Func,
          fOnLuaClose_Func,
          fOnLuaCloseQuery_Func,
          fOnLuaWindowStateChange_Func,
          fOnLuaChangeBounds_Func,

          fOnLuaEnter_Func,
          fOnLuaExit_Func,
          fOnLuaChange_Func,
          fOnLuaCloseUp_Func,

          fOnLuaKeyDown_Func,
          fOnLuaKeyUp_Func,
          fOnLuaMouseDown_Func,
          fOnLuaMouseUp_Func,
          fOnLuaMouseMove_Func,
          fOnLuaMouseWheel_Func,
          fOnLuaMouseWheelDown_Func,
          fOnLuaMouseWheelUp_Func,
	  fOnLuaMouseEnter_Func,
          fOnLuaMouseExit_Func,
		  
	  //StringGrid
          fOnLuaHeaderClick_Func,
          fOnLuaEditButtonClick_Func,
	  fOnLuaSelectCell_Func,
          fOnLuaDrawCell_Func,
          fOnLuaGetEditText_Func,
          fOnLuaGetEditMask_Func,
          fOnLuaSetEditText_Func,
          fOnLuaColumnMoved_Func,
          fOnLuaRowMoved_Func,
          fOnLuaTopLeftChanged_Func,
          // DropFiles
          fOnLuaDropFiles_Func,
          // DragDrop
          fOnLuaDragDrop_Func,
          fOnLuaDragOver_Func,
          // Docking
          fOnLuaDockDrop_Func,
	  fOnLuaDockOver_Func,
	  fOnLuaUnDock_Func,
	  fOnLuaStartDock_Func,
	  fOnLuaEndDock_Func,
	  // Action
          fOnLuaExecute_Func,
          fOnLuaUpdate_Func,
	  // Timer
	  fOnLuaTimer_Func,
	  fOnLuaIdleTimer_Func,
	  
          // Extended edit
          fOnLuaAcceptDirectory_Func,
          fOnLuaAcceptFileName_Func,
          fOnLuaAcceptValue_Func,
          fOnLuaAcceptDate_Func,
          // Extended edit and StringGrid
          fOnLuaButtonClick_Func,

          //PageControl
          fOnLuaPageChanged_func,

          //FindDialog
          fOnLuaFind_Func,
          fOnLuaReplace_Func,

          //SynEdit
          fOnLuaReplaceText_Func,
          fOnLuaCommandProcessed_Func,
          fOnLuaClickLink_Func,
          fOnLuaMouseLink_Func,

          // Min/Max
          fOnLuaMinimize_Func,
          fOnLuaMaximize_Func,

          // ListView
          fOnLuaColumnClick_Func,
          fOnLuaSelectItem_Func,

          // TreeView
          fOnLuaEdited_Func,
          fOnLuaNodeChanged_Func,
          fOnLuaSelectionChanged_Func,

          // PropertyGrid
          fOnLuaModified_Func

          : TLuaCFunction;

        published

          // LUA Events
          procedure OnLuaMinimize(Sender: TObject);
          procedure OnLuaMaximize(Sender: TObject);
          procedure OnLuaChangeBounds(Sender: TObject);
          procedure OnLuaCreate(Sender: TObject);
          procedure OnLuaDeactivate(Sender: TObject);
          procedure OnLuaClick(Sender: TObject);
          procedure OnLuaDblClick(Sender: TObject);
          procedure OnLuaDestroy(Sender: TObject);
          procedure OnLuaShow(Sender: TObject);
          procedure OnLuaHide(Sender: TObject);
          procedure OnLuaActivate(Sender: TObject);
          procedure OnLuaResize(Sender: TObject);
          procedure OnLuaPaint(Sender: TObject);
          procedure OnLuaClose(Sender: TObject; var Action: TCloseAction);
          procedure OnLuaCloseQuery(Sender: TObject; var CanClose: Boolean);
          procedure OnLuaWindowStateChange(Sender: TObject);
          procedure OnLuaEnter(Sender: TObject);
          procedure OnLuaExit(Sender: TObject);
          procedure OnLuaChange(Sender: TObject);
          procedure OnLuaCloseUp(Sender: TObject);
          procedure OnLuaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
          procedure OnLuaKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
          procedure OnLuaMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
          procedure OnLuaMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
          procedure OnLuaMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
          procedure OnLuaMouseWheel(Sender: TObject; Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
          procedure OnLuaMouseWheelDown(Sender: TObject; Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
          procedure OnLuaMouseWheelUp(Sender: TObject; Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
	  procedure OnLuaMouseEnter(Sender: TObject);
          procedure OnLuaMouseExit(Sender: TObject);

          //PageControl
          procedure OnLuaPageChanged(Sender: TObject);

          //Action
	  procedure OnLuaExecute(Sender: TObject);
	  procedure OnLuaUpdate(Sender: TObject);

	  //Timer
	  procedure OnLuaTimer(Sender: TObject);
	  procedure OnLuaIdleTimer(Sender: TObject);

          // Extended Edit
          procedure OnAcceptDirectory(Sender: TObject; var Value: String);
          procedure OnAcceptFileName(Sender: TObject; var Value: String);
          procedure OnAcceptValue(Sender: TObject; var AValue: Double; var Action: Boolean);
          procedure OnAcceptDate(Sender: TObject; var ADate: TDateTime; var AcceptDate: Boolean);
          // procedure OnLuaButtonClick(Sender: TObject);
          //StringGrid
          procedure OnLuaButtonClick(Sender: TObject; aCol, aRow: Integer);

          procedure OnLuaHeaderClick(Sender: TObject; IsColumn: Boolean; Index:Integer);
          procedure OnLuaEditButtonClick(Sender: TObject);
	  procedure OnLuaSelectCell(Sender: TObject; ACol, ARow: Longint; var CanSelect: Boolean);
          procedure OnLuaDrawCell(Sender: TObject; ACol, ARow: Longint; Rect: TRect; State: TGridDrawState);
          procedure OnLuaGetEditText(Sender: TObject; ACol, ARow: Longint; var Value: string);
          procedure OnLuaGetEditMask(Sender: TObject; ACol, ARow: Longint; var Value: string);
          procedure OnLuaSetEditText(Sender: TObject; ACol, ARow: Longint; var Value: string);
          procedure OnLuaColumnMoved(Sender: TObject; FromIndex, ToIndex: Longint);
          procedure OnLuaRowMoved(Sender: TObject; FromIndex, ToIndex: Longint);
          procedure OnLuaTopLeftChanged(Sender: TObject);

          // DropFiles
          procedure OnLuaDropFiles(Sender: TObject; const FileNames: array of String);
          // DragDrop
          procedure OnLuaDragDrop(Sender: TObject; Source: TObject; X, Y: Integer);
          procedure OnLuaDragOver(Sender: TObject; Source: TObject; X, Y: Integer;State: TDragState; var Accept: Boolean);
          // Docking
          procedure OnLuaDockDrop(Sender: TObject; Source: TDragDockObject; X, Y: Integer);
          procedure OnLuaDockOver(Sender: TObject; Source: TDragDockObject; X, Y: Integer;State: TDragState; var Accept: Boolean);
          procedure OnLuaUnDock(Sender: TObject; Client: TControl; NewTarget: TWinControl; var Allow: Boolean);
          procedure OnLuaStartDock(Sender: TObject; var DockObject: TDragDockObject);
          procedure OnLuaEndDock(Sender: TObject; Target: TObject; X, Y: Integer);
          // FindDialog
          procedure OnLuaFind(Sender: TObject);
          procedure OnLuaReplace(Sender: TObject);

          //SynEdit
          procedure OnLuaReplaceText(Sender: TObject; const ASearch,
                    AReplace: string; Line, Column: integer; var ReplaceAction: TSynReplaceAction);
          procedure OnLuaCommandProcessed(Sender: TObject;
                    var Command: TSynEditorCommand; var AChar: TUTF8Char; Data: pointer);
          procedure OnLuaClickLink(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
          procedure OnLuaMouseLink(Sender: TObject; X, Y: Integer; var AllowMouseLink: Boolean);

          procedure OnLuaColumnClick(Sender: TObject; Column: TListColumn);
          procedure OnLuaSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);

          //TreeView
          procedure OnLuaEdited(Sender: TObject; Node: TTreeNode; var S: string);
          procedure OnLuaNodeChanged(Sender: TObject; Node: TTreeNode; ChangeReason: TTreeNodeChangeReason);
          procedure OnLuaSelectionChanged(Sender: TObject);

          // PropertyGrid
          procedure OnLuaModified(Sender: TObject);

    // ----------------------------------------------------------------------------------------
    public


          // EVENT HANDLERS

          // SynEdit
          procedure ReplaceTextEventHandler(Sender: TObject; EventCFunc: TLuaCFunction; const ASearch,
                    AReplace: string; Line, Column: integer; var ReplaceAction: TSynReplaceAction);
          procedure CommandProcessedEventHandler(Sender: TObject; EventCFunc: TLuaCFunction;
                    var Command: TSynEditorCommand; var AChar: TUTF8Char; Data: pointer);
          procedure ClickLinkEventHandler(Sender: TObject; EventCFunc: TLuaCFunction; Button: TMouseButton;
                    Shift: TShiftState; X, Y: Integer);
          procedure MouseLinkEventHandler(Sender: TObject; EventCFunc: TLuaCFunction; X, Y: Integer;
                    var AllowMouseLink: Boolean);

          procedure NotifyEventHandler(Sender: TObject; EventCFunc: TLuaCFunction);
          procedure KeyEventHandler(Sender: TObject; EventCFunc: TLuaCFunction; var Key: Word; Shift: TShiftState);
          procedure MouseEventHandler(Sender: TObject; EventCFunc: TLuaCFunction; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
          procedure MouseMoveEventHandler(Sender: TObject; EventCFunc: TLuaCFunction; Shift: TShiftState; X, Y: Integer);
          procedure MouseWheelEventHandler(Sender: TObject; EventCFunc: TLuaCFunction; Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
          procedure MouseWheelUpDownEventHandler(Sender: TObject; EventCFunc: TLuaCFunction; Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
          // DropFiles
          procedure DropFilesEventHandler(Sender: TObject; EventCFunc: TLuaCFunction; const FileNames: array of String);
          // DragDrop
          procedure DragDropEventHandler(Sender: TObject; EventCFunc: TLuaCFunction; Source: TObject; X, Y: Integer);
          procedure DragOverEventHandler(Sender: TObject; EventCFunc: TLuaCFunction; Source: TObject; X, Y: Integer;State: TDragState; var Accept: Boolean);
          procedure StartDragEventHandler(Sender: TObject; EventCFunc: TLuaCFunction; var DragObject: TDragObject);
          procedure EndDragEventHandler(Sender: TObject; EventCFunc: TLuaCFunction; Target: TObject; X, Y: Integer);
          // Dock
          procedure DockDropEventHandler(Sender: TObject; EventCFunc: TLuaCFunction; Source:TDragDockObject; X, Y: Integer);
          procedure DockOverEventHandler(Sender: TObject; EventCFunc: TLuaCFunction; Source:TDragDockObject; X, Y: Integer;State: TDragState; var Accept: Boolean);
          procedure StartDockEventHandler(Sender: TObject; EventCFunc: TLuaCFunction; var DockObject: TDragDockObject);
          procedure EndDockEventHandler(Sender: TObject; EventCFunc: TLuaCFunction; Target: TObject; X, Y: Integer);
          procedure UnDockEventHandler(Sender: TObject; EventCFunc: TLuaCFunction; Client: TControl; NewTarget: TWinControl; var Allow: Boolean);
          // Form related
          procedure CloseEventHandler(Sender: TObject; EventCFunc: TLuaCFunction; var Action: TCloseAction);
          procedure CloseQueryEventHandler(Sender: TObject; EventCFunc: TLuaCFunction; var CanClose: Boolean);
          // StringGrid related
          procedure HeaderClickEventHandler(Sender: TObject; EventCFunc: TLuaCFunction; IsColumn: Boolean; Index:Integer);
	  procedure SelectCellEventHandler(Sender: TObject; EventCFunc: TLuaCFunction; ACol, ARow: Longint; var CanSelect: Boolean);
	  procedure DrawCellEventHandler(Sender: TObject; EventCFunc: TLuaCFunction; ACol, ARow: Longint; Rect: TRect; State: TGridDrawState);
	  procedure GetEditTextEventHandler(Sender: TObject; EventCFunc: TLuaCFunction; ACol, ARow: Longint; var Value: string);
          procedure SetEditTextEventHandler(Sender: TObject; EventCFunc: TLuaCFunction; ACol, ARow: Longint; var Value: string);
	  procedure RowColumnMovedEventHandler(Sender: TObject; EventCFunc: TLuaCFunction; FromIndex, ToIndex: Longint);
          procedure ButtonClickEventHandler(Sender: TObject; EventCFunc: TLuaCFunction; aCol, aRow: Integer);
          // Extended edit
          procedure AcceptDirectoryHandler(Sender: TObject; EventCFunc: TLuaCFunction; var Value: String);
          procedure AcceptFileNameHandler(Sender: TObject; EventCFunc: TLuaCFunction; var Value: String);
          procedure AcceptValueHandler(Sender: TObject; EventCFunc: TLuaCFunction; var AValue: Double; var Action: Boolean);
          procedure AcceptDateHandler(Sender: TObject; EventCFunc: TLuaCFunction; var ADate: TDateTime; var AcceptDate: Boolean);

          // ListView
          procedure ColumnClickEventHandler(Sender: TObject; EventCFunc: TLuaCFunction; Column: TListColumn);
          procedure SelectItemEventHandler(Sender: TObject; EventCFunc: TLuaCFunction; Item: TListItem; Selected: Boolean);

          //TreeView
          procedure EditedEventHandler(Sender: TObject; EventCFunc: TLuaCFunction; Node: TTreeNode; var S: string);
          procedure NodeChangedEventHandler(Sender: TObject;  EventCFunc: TLuaCFunction; Node: TTreeNode; ChangeReason: TTreeNodeChangeReason);

        published

          // LUA Events
          // min/Max
          property OnMinimize_Function: TLuaCFunction read fOnLuaMinimize_Func write fOnLuaMinimize_Func;
          property OnMaximize_Function: TLuaCFunction read fOnLuaMaximize_Func write fOnLuaMaximize_Func;
          // Events
          property OnChangeBounds_Function: TLuaCFunction read fOnLuaChangeBounds_Func write fOnLuaChangeBounds_Func;
          property OnClick_Function: TLuaCFunction read fOnLuaClick_Func write fOnLuaClick_Func;
          property OnDblClick_Function: TLuaCFunction read fOnLuaDblClick_Func write fOnLuaDblClick_Func;
          property OnCreate_Function: TLuaCFunction read fOnLuaCreate_Func write fOnLuaCreate_Func;
          property OnDestroy_Function: TLuaCFunction read fOnLuaDestroy_Func write fOnLuaDestroy_Func;
          property OnShow_Function: TLuaCFunction read fOnLuaShow_Func write fOnLuaShow_Func;
          property OnHide_Function: TLuaCFunction read fOnLuaHide_Func write fOnLuaHide_Func;
          property OnActivate_Function: TLuaCFunction read fOnLuaActivate_Func write fOnLuaActivate_Func;
          property OnDeactivate_Function: TLuaCFunction read fOnLuaDeactivate_Func write fOnLuaDeactivate_Func;
          property OnResize_Function: TLuaCFunction read fOnLuaResize_Func write fOnLuaResize_Func;
          property OnPaint_Function: TLuaCFunction read fOnLuaPaint_Func write fOnLuaPaint_Func;
          property OnClose_Function: TLuaCFunction read fOnLuaClose_Func write fOnLuaClose_Func;
          property OnCloseQuery_Function: TLuaCFunction read fOnLuaCloseQuery_Func write fOnLuaCloseQuery_Func;
          property OnWindowStateChange_Function: TLuaCFunction read fOnLuaWindowStateChange_Func write fOnLuaWindowStateChange_Func;

          property OnEnter_Function: TLuaCFunction read fOnLuaEnter_Func write fOnLuaEnter_Func;
          property OnExit_Function: TLuaCFunction read fOnLuaExit_Func write fOnLuaExit_Func;
          property OnChange_Function: TLuaCFunction read fOnLuaChange_Func write fOnLuaChange_Func;
          property OnCloseUp_Function: TLuaCFunction read fOnLuaCloseUp_Func write fOnLuaCloseUp_Func;

          property OnKeyDown_Function: TLuaCFunction read fOnLuaKeyDown_Func write fOnLuaKeyDown_Func;
          property OnKeyUp_Function: TLuaCFunction read fOnLuaKeyUp_Func write fOnLuaKeyUp_Func;
          property OnMouseDown_Function: TLuaCFunction read fOnLuaMouseDown_Func write fOnLuaMouseDown_Func;
          property OnMouseUp_Function: TLuaCFunction read fOnLuaMouseUp_Func write fOnLuaMouseUp_Func;
          property OnMouseMove_Function: TLuaCFunction read fOnLuaMouseMove_Func write fOnLuaMouseMove_Func;
          property OnMouseWheel_Function: TLuaCFunction read fOnLuaMouseWheel_Func write fOnLuaMouseWheel_Func;
          property OnMouseWheelDown_Function: TLuaCFunction read fOnLuaMouseWheelDown_Func write fOnLuaMouseWheelDown_Func;
          property OnMouseWheelUp_Function: TLuaCFunction read fOnLuaMouseWheelUp_Func write fOnLuaMouseWheelUp_Func;
	  property OnMouseEnter_Function: TLuaCFunction read fOnLuaMouseEnter_Func write fOnLuaMouseEnter_Func;
          property OnMouseExit_Function: TLuaCFunction read fOnLuaMouseExit_Func write fOnLuaMouseExit_Func;

          //PageControl
          property OnPageChanged_Function: TLuaCFunction read fOnLuaPageChanged_func write fOnLuaPageChanged_func;
          // Action
	  property OnExecute_Function: TLuaCFunction read fOnLuaExecute_Func write fOnLuaExecute_Func;
	  property OnUpdate_Function: TLuaCFunction read fOnLuaUpdate_Func write fOnLuaUpdate_Func;

	  // Timer
	  property OnTimer_Function: TLuaCFunction read fOnLuaTimer_Func write fOnLuaTimer_Func;
	  property OnIdleTimer_Function: TLuaCFunction read fOnLuaIdleTimer_Func write fOnLuaIdleTimer_Func;

          // Extended edit
          property OnAcceptDirectory_Function: TLuaCFunction read fOnLuaAcceptDirectory_Func write fOnLuaAcceptDirectory_Func;
          property OnAcceptFileName_Function: TLuaCFunction read fOnLuaAcceptFileName_Func write fOnLuaAcceptFileName_Func;
          property OnAcceptValue_Function: TLuaCFunction read fOnLuaAcceptValue_Func write fOnLuaAcceptValue_Func;
          property OnAcceptDate_Function: TLuaCFunction read fOnLuaAcceptDate_Func write fOnLuaAcceptDate_Func;
	  property OnButtonClick_Function: TLuaCFunction read fOnLuaButtonClick_Func write fOnLuaButtonClick_Func;
          
	  // StringGrid
          property OnEditButtonClick_Function: TLuaCFunction read fOnLuaEditButtonClick_Func write fOnLuaEditButtonClick_Func;
          property OnHeaderClick_Function: TLuaCFunction read fOnLuaHeaderClick_Func write fOnLuaHeaderClick_Func;
	  property OnSelectCell_Function: TLuaCFunction read fOnLuaSelectCell_Func write fOnLuaSelectCell_Func;
          property OnDrawCell_Function: TLuaCFunction read fOnLuaDrawCell_Func write fOnLuaDrawCell_Func;
          property OnGetEditText_Function: TLuaCFunction read fOnLuaGetEditText_Func write fOnLuaGetEditText_Func;
          property OnGetEditMask_Function: TLuaCFunction read fOnLuaGetEditMask_Func write fOnLuaGetEditMask_Func;
          property OnSetEditText_Function: TLuaCFunction read fOnLuaSetEditText_Func write fOnLuaSetEditText_Func;
          property OnColumnMoved_Function: TLuaCFunction read fOnLuaColumnMoved_Func write fOnLuaColumnMoved_Func;
          property OnRowMoved_Function: TLuaCFunction read fOnLuaRowMoved_Func write fOnLuaRowMoved_Func;
          property OnTopLeftChanged_Function: TLuaCFunction read fOnLuaTopLeftChanged_Func write fOnLuaTopLeftChanged_Func;          

          // DropFiles
          property OnDropFiles_Function: TLuaCFunction read fOnLuaDropFiles_Func write fOnLuaDropFiles_Func;
          // DragDrop
          property OnDragDrop_Function: TLuaCFunction read fOnLuaDragDrop_Func write fOnLuaDragDrop_Func;
          property OnDragOver_Function: TLuaCFunction read fOnLuaDragOver_Func write fOnLuaDragOver_Func;
	  // Docking
          property OnDockDrop_Function: TLuaCFunction read fOnLuaDockDrop_Func write fOnLuaDockDrop_Func;
          property OnDockOver_Function: TLuaCFunction read fOnLuaDockOver_Func write fOnLuaDockOver_Func;
          property OnUnDock_Function: TLuaCFunction read fOnLuaUnDock_Func write fOnLuaUnDock_Func;
          property OnStartDock_Function: TLuaCFunction read fOnLuaStartDock_Func write fOnLuaStartDock_Func;
          property OnEndDock_Function: TLuaCFunction read fOnLuaEndDock_Func write fOnLuaEndDock_Func;

          // Find and Replace Dialog
          property OnFind_Function: TLuaCFunction read fOnLuaFind_Func write fOnLuaFind_Func;
          property OnReplace_Function: TLuaCFunction read fOnLuaReplace_Func write fOnLuaReplace_Func;

          //SynEdit
          property OnReplaceText_Function: TLuaCFunction read fOnLuaReplaceText_Func write fOnLuaReplaceText_Func;
          property OnCommandProcessed_Function: TLuaCFunction read fOnLuaCommandProcessed_Func write fOnLuaCommandProcessed_Func;

          property OnClickLink_Function: TLuaCFunction read fOnLuaClickLink_Func write fOnLuaClickLink_Func;
          property OnMouseLink_Function: TLuaCFunction read fOnLuaMouseLink_Func write fOnLuaMouseLink_Func;

          // ListView
          // OnColumnClick
          property OnColumnClick_Function: TLuaCFunction read fOnLuaColumnClick_Func write fOnLuaColumnClick_Func;
          // procedure(Sender: TObject; Column: TListColumn) of object;
          property OnSelectItem_Function: TLuaCFunction read fOnLuaSelectItem_Func write fOnLuaSelectItem_Func;
          // TLVSelectItemEvent = procedure(Sender: TObject; Item: TListItem; Selected: Boolean) of object;

          // TreeView
          property OnEdited_Function: TLuaCFunction read fOnLuaEdited_Func write fOnLuaEdited_Func;
          property OnNodeChanged_Function: TLuaCFunction read fOnLuaNodeChanged_Func write fOnLuaNodeChanged_Func;
          property OnSelectionChanged_Function: TLuaCFunction read fOnLuaSelectionChanged_Func write fOnLuaSelectionChanged_Func;

          // Propertygrid
          property OnModified_Function: TLuaCFunction read fOnLuaModified_Func write fOnLuaModified_Func;

     end;

     TLuaBaseControl = class(TComponent)
         LuaCtl: TVCLuaControl;
     end;

// *************************************************************************
function StringToShiftState(Shift:String):TShiftState;

procedure GetControlParents(L: Plua_State; var Parent:TWinControl; var Name:String);
procedure InitControl(L: Plua_State; luaObj:TObject; var Name:String);
procedure SetDefaultMethods(L: Plua_State; Index:Integer; Sender:TObject);
procedure SetAsMainForm(aForm:TForm);

// extended properties
function ComponentShortCut(Comp: TComponent; scName:String): boolean;

// default methods
function ControlFree(L: Plua_State): Integer; cdecl;
function ControlFocus(L: Plua_State): Integer; cdecl;
function ControlRefresh(L: Plua_State): Integer; cdecl;
function ControlBeginUpdateBounds(L: Plua_State): Integer; cdecl;
function ControlEndUpdateBounds(L: Plua_State): Integer; cdecl;
function ControlBeginUpdate(L: Plua_State): Integer; cdecl;
function ControlEndUpdate(L: Plua_State): Integer; cdecl;
function ControlParentName(L: Plua_State): Integer; cdecl;
function GetLuaState(Sender:TObject):Plua_State;
function GetLuaControl(Sender:TObject):TVCLuaControl;
function CheckEvent(L:Plua_State; Sender: TObject; EFn:TLuaCFunction):Boolean;

implementation

Uses TypInfo,
     base64,
     StrUtils,
     Buttons,
     Graphics,
     ImgList,
     LuaProperties,
     LuaObject,
     ActnList,
     Menus,
     Dialogs,
     LCLProc;

//{$I showstack.inc}
     
// ***********************************************
// LUA Control Methods
// ***********************************************
procedure SetDefaultMethods(L: Plua_State; Index: Integer; Sender: TObject);
begin
	lua_newtable(L);
	LuaSetTableLightUserData(L, Index, HandleStr, Pointer(Sender));
	LuaSetTableFunction(L, index, 'Free', @ControlFree);
	LuaSetTableFunction(L, index, 'SetFocus', @ControlFocus);
        LuaSetTableFunction(L, index, 'Refresh', @ControlRefresh);
        LuaSetTableFunction(L, index, 'EndUpdateBounds', @ControlEndUpdateBounds);
        LuaSetTableFunction(L, index, 'BeginUpdateBounds', @ControlBeginUpdateBounds);
        LuaSetTableFunction(L, Index, 'BeginUpdate', @ControlBeginUpdate);
        LuaSetTableFunction(L, Index, 'EndUpdate', @ControlEndUpdate);
end;

// -----------------------------------------------------------------------------

function ExecMethod(Instance : TObject; Name : String) : Boolean;
type
  TProc= procedure of object;
var
  method : TMethod;
  exec:tproc;
begin
  method.Data := Pointer(Instance);
  method.Code := Instance.MethodAddress(Name);
  Exec:=TProc(Method);
  Result := Assigned(method.Code);
  if Result then Exec;
end;

procedure GetControlParents(L: Plua_State; var Parent:TWinControl; var Name:String);
var n:Integer;
begin
  Parent := nil;
  Name := '';
  n := lua_gettop(L);
  if n>0 then begin
    if lua_istable(L,1) then begin
       Parent := TWinControl(GetLuaObject(L, 1));
       if (n=2) and (lua_isstring(L,2)) then
          Name := lua_tostring(L,2);
    end
  end;
  if not Assigned(Parent) then begin
     Parent := Application.MainForm;
  end;
  if Name = '' then begin
     Name := FormatDateTime('ymdhns',now())+IntToStr(Random(999999));
     for n:=1 to length(Name) do
         Name[n]:=char(ord(Name[n])+17+Random(14)); 
  end;
end;

procedure InitControl(L: Plua_State; luaObj:TObject; var Name:String);
begin
     if (lua_gettop(L)>1) and (lua_istable(L,-1)) and (GetLuaObject(L, -1) = nil) then
        SetPropertiesFromLuaTable(L, luaObj,-1)
     else
         TComponent(luaObj).Name := Name;
end;

function ControlFree(L: Plua_State): Integer; cdecl;
var
  lC: TComponent;
begin
  CheckArg(L, 1);
  lC := TComponent(GetLuaObject(L, 1));
  LC.Free;
  LC := nil;
  LuaSetTableClear(L, 1);
  Result := 0;
end;

function ControlFocus(L: Plua_State): Integer; cdecl;
var
  lC: TWinControl;
begin
  CheckArg(L, 1);
  lC := TWincontrol(GetLuaObject(L, 1));
  lC.Setfocus;
  Result := 0;
end;

function ControlRefresh(L: Plua_State): Integer; cdecl;
var
  lC: TWinControl;
begin
  CheckArg(L, 1);
  lC := TWincontrol(GetLuaObject(L, 1));
  lC.Refresh;
  Result := 0;
end;

function ControlBeginUpdateBounds(L: Plua_State): Integer; cdecl;
var
  lC: TWinControl;
begin
  CheckArg(L, 1);
  lC := TWincontrol(GetLuaObject(L, 1));
  lC.BeginUpdateBounds;
  Result := 0;
end;

function ControlEndUpdateBounds(L: Plua_State): Integer; cdecl;
var
  lC: TWinControl;
begin
  CheckArg(L, 1);
  lC := TWincontrol(GetLuaObject(L, 1));
  lC.EndUpdateBounds;
  Result := 0;
end;

function ControlBeginUpdate(L: Plua_State): Integer; cdecl;
var
  lC: TObject;
begin
  CheckArg(L, 1);
  lC := TObject(GetLuaObject(L, 1));
  ExecMethod(lC,'BeginUpdate');
  Result := 0;
end;

function ControlEndUpdate(L: Plua_State): Integer; cdecl;
var
  lC: TObject;
begin
  CheckArg(L, 1);
  lC := TObject(GetLuaObject(L, 1));
  ExecMethod(lC,'EndUpdate');
  Result := 0;
end;

function ControlParentName(L: Plua_State): Integer; cdecl;
var
  lC: TWinControl;
begin
  CheckArg(L, 1);
  lC := TWincontrol(GetLuaObject(L, 1));
  if (lC<>nil) and Assigned(lC.Parent) then
      lua_pushString(L,pchar(lC.Parent.Name))
  else
      lua_pushnil(L);
  Result := 1;
end;

// ***********************************************
function ComponentShortCut(Comp: TComponent; scName:String): boolean;
begin
     try
        if (comp.InheritsFrom(TAction)) then
            TAction(Comp).ShortCut := TextToShortCut(scName)
        else if (comp.InheritsFrom(TMenuItem)) then
           TMenuItem(Comp).ShortCut := TextToShortCut(scName);
        Result:=true;
     except
        Result:=false;
     end;
end;

// ***********************************************
function GetLuaState(Sender:TObject):Plua_State;
begin
     Result := TVCLuaControl(TComponent(Sender).Components[0]).L;
end;
// ***********************************************
function GetLuaControl(Sender:TObject):TVCLuaControl;
begin
     Result := TVCLuaControl(TComponent(Sender).Components[0]);
end;

// *************************************************************************

procedure SetAsMainForm(aForm:TForm);
var
  P: Pointer;
begin
  P := @Application.Mainform;
  Pointer(P^) := aForm;
end;

constructor TVCLuaControl.Create(AOwner:TComponent; LL: Plua_State; T:ToTableProc);
begin
     inherited Create(AOwner);
     L := LL;
     TTable := T;
     ComponentIndex := 0;
end;

procedure TVCLuaControl.ToTable(LL:Plua_State; Index:Integer; Sender:TObject);
begin
     TTable(LL, Index, Sender);
end;

function ShiftStateToString(Shift:TShiftState):String;
begin
  Result := '';
  if ssShift in Shift then
     Result := 'ssShift,';
  if ssAlt in Shift then
     Result := Result + 'ssAlt,';
  if ssCtrl in Shift then
     Result := Result + 'ssCtrl,';
  if ssLeft in Shift then
     Result := Result + 'ssLeft,';
  if ssRight in Shift then
     Result := Result + 'ssRight,';
  if ssMiddle in Shift then
     Result := Result + 'ssMiddle,';
  if ssDouble in Shift then
     Result := Result + 'ssDouble,';
  if Result <> '' then
     delete(Result,Length(Result),1);
  Result := '['+Result+']';
end;

function StringToShiftState(Shift:String):TShiftState;
begin
  Result := [];
  if AnsiContainsStr(Shift,'ssShift') then
     include(Result,ssShift);
  if AnsiContainsStr(Shift,'ssAlt') then
     include(Result,ssAlt);
  if AnsiContainsStr(Shift,'ssCtrl') then
     include(Result,ssCtrl);
  if AnsiContainsStr(Shift,'ssLeft') then
     include(Result,ssLeft);
  if AnsiContainsStr(Shift,'ssRight') then
     include(Result,ssRight);
  if AnsiContainsStr(Shift,'ssMiddle') then
     include(Result,ssMiddle);
  if AnsiContainsStr(Shift,'ssDouble') then
     include(Result,ssDouble);
end;

function DrawGridStateToString(State:TGridDrawState):String;
begin
  Result := '[';
  if gdSelected in State then
     Result := Result + 'gdSelected,';
  if gdFocused in State then
     Result := Result + 'gdFocused,';
  if gdFixed in State then
     Result := Result + 'gdFixed,';
  if gdHot in State then
     Result := Result + 'gdHot,';
  if gdPushed in State then
     Result := Result + 'gdPushed,';
  if gdRowHighlight in State then
     Result := Result + 'gdRowHighlight,';
  if length(Result)>1 then
     Result[length(Result)] := ']'
  else
     Result := Result + ']';
end;

// ***********************************************
// LUA Events
// ***********************************************
function CheckEvent(L:Plua_State; Sender: TObject; EFn:TLuaCFunction):Boolean;
var n,i,p:integer;
    s:String;
    lfp: ^lua_CFunction;
begin
    Result := False;
    if L=nil then begin
        ShowMessage('Sender has no lua_State: '+Sender.Classname);
        exit;
    end;
    if (EFn = 0) then begin
       LuaError(L,'Event not a Lua function!', Sender.ClassName);
    end;
    // function to top
    lua_rawgeti(L, LUA_REGISTRYINDEX, EFn);
    Result := True;
end;

procedure TVCLuaControl.NotifyEventHandler(Sender: TObject; EventCFunc: TLuaCFunction);
var
  LL:Plua_State;
begin
    LL := GetLuaState(Sender);
    if CheckEvent(LL,Sender,EventCFunc) then begin
      ToTable(LL, -1, Sender);
      DoCall(LL,1);
    end
end;

procedure TVCLuaControl.KeyEventHandler(Sender: TObject; EventCFunc: TLuaCFunction; var Key: Word; Shift: TShiftState);
var LL:Plua_State;
begin
    LL := GetLuaState(Sender);
    if CheckEvent(LL,Sender,EventCFunc) then begin
    ToTable(LL, -1, Sender);
    lua_pushnumber(LL,Word(Key));
    lua_pushstring(LL,pchar(ShiftStateToString(Shift)));
    DoCall(LL,3);
    if lua_isnumber(LL,-1) then
       Key := Word(Round(lua_tonumber(LL,-1)));
    end
end;

procedure TVCLuaControl.MouseEventHandler(Sender: TObject; EventCFunc: TLuaCFunction; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var LL:Plua_State;
begin
    LL := GetLuaState(Sender);
    if CheckEvent(LL,Sender,EventCFunc) then begin
    ToTable(LL, -1, Sender);
    lua_pushstring(LL,pchar(GetEnumName(TypeInfo(TMouseButton),Integer(Button))));
    lua_pushstring(LL,pchar(ShiftStateToString(Shift)));
    lua_pushnumber(LL,X);
    lua_pushnumber(LL,Y);
    DoCall(LL,5);
    end;
end;

procedure TVCLuaControl.MouseMoveEventHandler(Sender: TObject; EventCFunc: TLuaCFunction; Shift: TShiftState; X, Y: Integer);
var LL:Plua_State;
begin
    LL := GetLuaState(Sender);
    if CheckEvent(LL,Sender,EventCFunc) then begin
    ToTable(LL, -1, Sender);
    lua_pushstring(LL,pchar(ShiftStateToString(Shift)));
    lua_pushnumber(LL,X);
    lua_pushnumber(LL,Y);
    DoCall(LL,4);
    end;
end;

procedure TVCLuaControl.MouseWheelEventHandler(Sender: TObject; EventCFunc: TLuaCFunction; Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
var LL:Plua_State;
begin
    LL := GetLuaState(Sender);
    if CheckEvent(LL,Sender,EventCFunc) then begin
    ToTable(LL, -1, Sender);
    lua_pushstring(LL,pchar(ShiftStateToString(Shift)));
    lua_pushnumber(LL,WheelDelta);

    lua_newtable(LL);
    lua_pushliteral(LL,'X');
    lua_pushnumber(LL,MousePos.X);
    lua_rawset(LL,-3);
    lua_pushliteral(LL,'X');
    lua_pushnumber(LL,MousePos.Y);
    lua_rawset(LL,-3);
    lua_pushnumber(LL,2);
    lua_pushliteral(LL,'n');
    lua_rawset(LL,-3);

    lua_pushboolean(LL,Handled);

    DoCall(LL,5);
    if lua_isboolean(LL,-1) then
       Handled := lua_toboolean(LL,-1);
    end;
end;

procedure TVCLuaControl.MouseWheelUpDownEventHandler(Sender: TObject; EventCFunc: TLuaCFunction; Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
var LL:Plua_State;
begin
    LL := GetLuaState(Sender);
    if CheckEvent(LL,Sender,EventCFunc) then begin
    ToTable(LL, -1, Sender);
    lua_pushstring(LL,pchar(ShiftStateToString(Shift)));

    lua_newtable(LL);
    lua_pushliteral(LL,'X');
    lua_pushnumber(LL,MousePos.X);
    lua_rawset(LL,-3);
    lua_pushliteral(LL,'X');
    lua_pushnumber(LL,MousePos.Y);
    lua_rawset(LL,-3);
    lua_pushnumber(LL,2);
    lua_pushliteral(LL,'n');
    lua_rawset(LL,-3);

    lua_pushboolean(LL,Handled);

    DoCall(LL,4);
    if lua_isboolean(LL,-1) then
       Handled := lua_toboolean(LL,-1);
    end;
end;


// Extended Edit

procedure TVCLuaControl.AcceptDirectoryHandler(Sender: TObject; EventCFunc: TLuaCFunction; var Value: String);
var LL:Plua_State;
begin
    LL := GetLuaState(Sender);
    if CheckEvent(LL,Sender,EventCFunc) then begin
    ToTable(LL, -1, Sender);
    lua_pushstring(LL,pchar(Value));
    DoCall(LL,2);
    if lua_isstring(LL,-1) then
       Value := lua_tostring(LL,-1);
    end;
end;

procedure TVCLuaControl.AcceptFileNameHandler(Sender: TObject; EventCFunc: TLuaCFunction; var Value: String);
var LL:Plua_State;
begin
    LL := GetLuaState(Sender);
    if CheckEvent(LL,Sender,EventCFunc) then begin
    ToTable(LL, -1, Sender);
    lua_pushstring(LL,pchar(Value));
    DoCall(LL,2);
    if lua_isstring(LL,-1) then
       Value := lua_tostring(LL,-1);
    end;
end;

procedure TVCLuaControl.AcceptValueHandler(Sender: TObject; EventCFunc: TLuaCFunction; var AValue: Double; var Action: Boolean);
var LL:Plua_State;
begin
    LL := GetLuaState(Sender);
    if CheckEvent(LL,Sender,EventCFunc) then begin
    ToTable(LL, -1, Sender);
    lua_pushnumber(LL,AValue);
    lua_pushboolean(LL,Action);
    DoCall(LL,2);
    if lua_isstring(LL,-1) then
       AValue := lua_tonumber(LL,-1)
    else if lua_isboolean(LL,-1) then
       Action := lua_toboolean(LL,-1);
    if lua_isstring(LL,-2) then
       AValue := lua_tonumber(LL,-2)
    else if lua_isboolean(LL,-2) then
       Action := lua_toboolean(LL,-2);
    end;
end;

procedure TVCLuaControl.AcceptDateHandler(Sender: TObject; EventCFunc: TLuaCFunction; var ADate: TDateTime; var AcceptDate: Boolean);
var LL:Plua_State;
begin
    LL := GetLuaState(Sender);
    if CheckEvent(LL,Sender,EventCFunc) then begin
    ToTable(LL, -1, Sender);
    lua_pushnumber(LL,ADate);
    lua_pushboolean(LL,AcceptDate);
    DoCall(LL,2);
    if lua_isstring(LL,-1) then
       ADate := lua_tonumber(LL,-1)
    else if lua_isboolean(LL,-1) then
       AcceptDate := lua_toboolean(LL,-1);
    if lua_isstring(LL,-2) then
       ADate := lua_tonumber(LL,-2)
    else if lua_isboolean(LL,-2) then
       AcceptDate := lua_toboolean(LL,-2);
    end;
end;

// Form related
procedure TVCLuaControl.CloseEventHandler(Sender: TObject; EventCFunc: TLuaCFunction; var Action: TCloseAction);
var LL:Plua_State;
begin
    LL := GetLuaState(Sender);
    if CheckEvent(LL,Sender,EventCFunc) then begin
    ToTable(LL, -1, Sender);
    lua_pushstring(LL,pchar(GetEnumName(TypeInfo(TCloseAction),Integer(Action))));
    DoCall(LL,2);
    if lua_isstring(LL,-1) then
       Action := TCloseAction(GetEnumValue(TypeInfo(TCloseAction),lua_tostring(LL,-1)));
    end;
end;

procedure TVCLuaControl.CloseQueryEventHandler(Sender: TObject; EventCFunc: TLuaCFunction; var CanClose: Boolean);
var LL:Plua_State;
begin
    LL := GetLuaState(Sender);
    if CheckEvent(LL,Sender,EventCFunc) then begin
    ToTable(LL, -1, Sender);
    lua_pushboolean(LL,CanClose);
    DoCall(LL,2);
    if lua_isboolean(LL,-1) then
       CanClose := lua_toboolean(LL,-1);
    end;
end;

// StringGrid related
procedure TVCLuaControl.ButtonClickEventHandler(Sender: TObject; EventCFunc: TLuaCFunction; aCol, aRow: Integer);
var LL:Plua_State;
begin
    LL := GetLuaState(Sender);
    if CheckEvent(LL,Sender,EventCFunc) then begin
       ToTable(LL, -1, Sender);
       lua_pushinteger(LL,ACol);
       lua_pushinteger(LL,ARow);
       DoCall(LL,3);
    end;
end;

procedure TVCLuaControl.HeaderClickEventHandler(Sender: TObject; EventCFunc: TLuaCFunction; IsColumn: Boolean; Index:Integer);
var LL:Plua_State;
begin
    LL := GetLuaState(Sender);
    if CheckEvent(LL,Sender,EventCFunc) then begin
       ToTable(LL, -1, Sender);
       lua_pushboolean(LL,IsColumn);
       lua_pushnumber(LL,Index);
       DoCall(LL,3);
    end;
end;

procedure TVCLuaControl.SelectCellEventHandler(Sender: TObject; EventCFunc: TLuaCFunction; ACol, ARow: Longint; var CanSelect: Boolean);
var LL:Plua_State;
begin
    LL := GetLuaState(Sender);
    if CheckEvent(LL,Sender,EventCFunc) then begin
    ToTable(LL, -1, Sender);
    lua_pushnumber(LL,ACol);
    lua_pushnumber(LL,ARow);
    lua_pushboolean(LL,CanSelect);
    DoCall(LL,4);

    if lua_isboolean(LL,-1) then
       CanSelect := lua_toboolean(LL,-1);
    end;
end;

procedure TVCLuaControl.DrawCellEventHandler(Sender: TObject; EventCFunc: TLuaCFunction; ACol, ARow: Longint; Rect: TRect; State: TGridDrawState);
var LL:Plua_State;
begin
    LL := GetLuaState(Sender);
    if CheckEvent(LL,Sender,EventCFunc) then begin
    ToTable(LL, -1, Sender);
    lua_pushnumber(LL,ACol);
    lua_pushnumber(LL,ARow);
    
    lua_newtable(LL);
    lua_pushliteral(LL,'Left');
    lua_pushnumber(LL,Rect.Left);    
    lua_rawset(LL,-3);
    lua_pushliteral(LL,'Top');
    lua_pushnumber(LL,Rect.Top);    
    lua_rawset(LL,-3);
    lua_pushliteral(LL,'Right');
    lua_pushnumber(LL,Rect.Right);    
    lua_rawset(LL,-3);
    lua_pushliteral(LL,'Bottom');
    lua_pushnumber(LL,Rect.Bottom);    
    lua_rawset(LL,-3);    
    lua_pushString(LL,pchar(DrawGridStateToString(State)));
    DoCall(LL,5);
    end;
end;

procedure TVCLuaControl.SetEditTextEventHandler(Sender: TObject; EventCFunc: TLuaCFunction; ACol, ARow: Longint; var Value: string);
var LL:Plua_State;
begin
    LL := GetLuaState(Sender);
    if CheckEvent(LL,Sender,EventCFunc) then begin
    ToTable(LL, -1, Sender);
    lua_pushnumber(LL,ACol);
    lua_pushnumber(LL,ARow);
    lua_pushstring(LL,pchar(TStringGrid(Sender).Cells[ACol, ARow]));
    DoCall(LL,4);
  	if lua_isstring(LL,-1) then
//       Value := lua_tostring(LL,-1);
       TStringGrid(Sender).Cells[ACol, ARow] := lua_tostring(LL,-1);
    end;
end;

procedure TVCLuaControl.GetEditTextEventHandler(Sender: TObject; EventCFunc: TLuaCFunction; ACol, ARow: Longint; var Value: string);
var LL:Plua_State;
begin
    LL := GetLuaState(Sender);
    if CheckEvent(LL,Sender,EventCFunc) then begin
    ToTable(LL, -1, Sender);
    lua_pushnumber(LL,ACol);
    lua_pushnumber(LL,ARow);
    lua_pushstring(LL,pchar(Value));
    DoCall(LL,4);
  	if lua_isstring(LL,-1) then
       Value := lua_tostring(LL,-1);
//       TStringGrid(Sender).Cells[ACol, ARow] := lua_tostring(LL,-1);
    end;
end;

procedure TVCLuaControl.RowColumnMovedEventHandler(Sender: TObject; EventCFunc: TLuaCFunction; FromIndex, ToIndex: Longint);
var LL:Plua_State;
begin
    LL := GetLuaState(Sender);
    if CheckEvent(LL,Sender,EventCFunc) then begin
    ToTable(LL, -1, Sender);
    lua_pushnumber(LL,FromIndex);
    lua_pushnumber(LL,ToIndex);
    DoCall(LL,3);
    end;
end;


// DragDrop Events
// TDragDropEvent = procedure(Sender, Source: TObject; X, Y: Integer) of object;
procedure TVCLuaControl.DragDropEventHandler(Sender: TObject; EventCFunc: TLuaCFunction; Source: TObject; X, Y: Integer);
var LL:Plua_State;
begin
    LL := GetLuaState(Sender);
    if CheckEvent(LL,Sender,EventCFunc) then begin
    ToTable(LL, -1, Sender); // 1st
    ToTable(LL, -1, Source); // 2nd
    lua_pushnumber(LL,trunc(X));
    lua_pushnumber(LL,trunc(Y));
    DoCall(LL,4);
    end;
end;

// TDragOverEvent = procedure(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean) of object;
procedure TVCLuaControl.DragOverEventHandler(Sender: TObject; EventCFunc: TLuaCFunction; Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
var LL:Plua_State;
begin
    LL := GetLuaState(Sender);
    if CheckEvent(LL,Sender,EventCFunc) then begin
    ToTable(LL, -1, Sender); // 1st
    ToTable(LL, -1, Source); // 2nd
    lua_pushnumber(LL,trunc(X));
    lua_pushnumber(LL,trunc(Y));
    lua_pushstring(LL,pchar(GetEnumName(TypeInfo(TDragState),Integer(State))));
    DoCall(LL,5);
    if lua_isboolean(LL,-1) then
       Accept := lua_toboolean(LL,-1);
    end;
end;

// type TStartDragEvent = procedure (Sender: TObject; var DragObject: TDragObject) of object; 
procedure TVCLuaControl.StartDragEventHandler(Sender: TObject; EventCFunc: TLuaCFunction; var DragObject: TDragObject);
var LL:Plua_State;
begin
    LL := GetLuaState(Sender);
    if CheckEvent(LL,Sender,EventCFunc) then begin
    ToTable(LL, -1, Sender);
    // If the OnStartDrag event handler sets the DragObject parameter to nil (Delphi) or NULL (C++), a TDragControlObject object is automatically created and dragging begins on the control itself.
    DragObject := nil;
    DoCall(LL,1);
    end;
end;

// type TEndDragEvent = procedure(Sender, Target: TObject; X, Y: Integer) of object;
procedure TVCLuaControl.EndDragEventHandler(Sender: TObject; EventCFunc: TLuaCFunction; Target: TObject; X, Y: Integer);
var LL:Plua_State;
begin
    LL := GetLuaState(Sender);
    if CheckEvent(LL,Sender,EventCFunc) then begin
    ToTable(LL, -1, Sender); // 1st
    ToTable(LL, -1, Target); // 2nd
    lua_pushnumber(LL,trunc(X));
    lua_pushnumber(LL,trunc(Y));
    DoCall(LL,4);
    end;
end;


// Docking Events
procedure TVCLuaControl.DockDropEventHandler(Sender: TObject; EventCFunc: TLuaCFunction; Source: TDragDockObject; X, Y: Integer);
var LL:Plua_State;
begin
    LL := GetLuaState(Sender);
    if CheckEvent(LL,Sender,EventCFunc) then begin;
    ToTable(LL, -1, Sender); // 1st
    ToTable(LL, -1, Source.Control); // 2nd
    lua_pushnumber(LL,trunc(X));
    lua_pushnumber(LL,trunc(Y));
    DoCall(LL,4);
    end;
end;

// TDockOverEvent = procedure(Sender, Source: TObject; X, Y: Integer; State: TDockState; var Accept: Boolean) of object;
procedure TVCLuaControl.DockOverEventHandler(Sender: TObject; EventCFunc: TLuaCFunction; Source: TDragDockObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
var LL:Plua_State;
begin
    LL := GetLuaState(Sender);
    if CheckEvent(LL,Sender,EventCFunc) then begin
    ToTable(LL, -1, Sender); // 1st
    ToTable(LL, -1, Source.Control); // 2nd
    lua_pushnumber(LL,trunc(X));
    lua_pushnumber(LL,trunc(Y));
    lua_pushstring(LL,pchar(GetEnumName(TypeInfo(TDragState),Integer(State))));
    DoCall(LL,5);
    if lua_isboolean(LL,-1) then
       Accept := lua_toboolean(LL,-1);
    end;
end;

// type TStartDockEvent = procedure (Sender: TObject; var DockObject: TDockObject) of object;
procedure TVCLuaControl.StartDockEventHandler(Sender: TObject; EventCFunc: TLuaCFunction; var DockObject: TDragDockObject);
var LL:Plua_State;
begin
    LL := GetLuaState(Sender);
    if CheckEvent(LL,Sender,EventCFunc) then begin
    ToTable(LL, -1, Sender);
    // If the OnStartDock event handler sets the DockObject parameter to nil (Delphi) or NULL (C++), a TDockControlObject object is automatically created and Dockging begins on the control itself.
    DockObject := nil;
    DoCall(LL,1);
    end;
end;

// type TEndDockEvent = procedure(Sender, Target: TObject; X, Y: Integer) of object;
procedure TVCLuaControl.EndDockEventHandler(Sender: TObject; EventCFunc: TLuaCFunction; Target: TObject; X, Y: Integer);
var LL:Plua_State;
begin
    LL := GetLuaState(Sender);
    if CheckEvent(LL,Sender,EventCFunc) then begin
    ToTable(LL, -1, Sender); // 1st
    ToTable(LL, -1, Target); // 2nd
    lua_pushnumber(LL,trunc(X));
    lua_pushnumber(LL,trunc(Y));
    DoCall(LL,4);
    end;
end;

procedure TVCLuaControl.UnDockEventHandler(Sender: TObject; EventCFunc: TLuaCFunction; Client: TControl; NewTarget: TWinControl; var Allow: Boolean);
var LL:Plua_State;
begin
    LL := GetLuaState(Sender);
    if CheckEvent(LL,Sender,EventCFunc) then begin
    ToTable(LL, -1, Sender);
    ToTable(LL, -1, Client);
    ToTable(LL, -1, NewTarget);
    DoCall(LL,3);
    if lua_isboolean(LL,-1) then
       Allow := lua_toboolean(LL,-1);
    end;
end;

procedure TVCLuaControl.DropFilesEventHandler(Sender: TObject; EventCFunc: TLuaCFunction; const FileNames: array of String);
var LL:Plua_State;
    i:Integer;
begin
    LL := GetLuaState(Sender);
    if CheckEvent(LL,Sender,EventCFunc) then begin
      ToTable(LL, -1, Sender);
      For i:=0 to Length(FileNames)-1 do begin
        if i=0 then lua_newtable(LL);
        lua_pushnumber(LL,i+1);
        lua_pushstring(LL,pchar(FileNames[i]));
        lua_rawset(LL,-3);
      end;
      DoCall(LL,2);
    end;
end;


procedure TVCLuaControl.ReplaceTextEventHandler(Sender: TObject; EventCFunc: TLuaCFunction; const ASearch,
  AReplace: string; Line, Column: integer; var ReplaceAction: TSynReplaceAction);
var LL:Plua_State;
begin
    LL := GetLuaState(Sender);
    if CheckEvent(LL,Sender,EventCFunc) then begin
      ToTable(LL, -1, Sender);
      lua_pushstring(LL,pchar(ASearch));
      lua_pushstring(LL,pchar(AReplace));
      lua_pushnumber(LL,Line);
      lua_pushnumber(LL,Column);
      lua_pushstring(LL,pchar(GetEnumName(TypeInfo(TSynReplaceAction),Integer(ReplaceAction))));
      DoCall(LL,6);
      if lua_isstring(LL,-1) then
         ReplaceAction := TSynReplaceAction(GetEnumValue(TypeInfo(TSynReplaceAction),lua_tostring(LL,-1)));
    end;
end;

procedure TVCLuaControl.CommandProcessedEventHandler(Sender: TObject; EventCFunc: TLuaCFunction;
  var Command: TSynEditorCommand; var AChar: TUTF8Char; Data: pointer);
var LL:Plua_State;
    cmd: Longint;
begin
    LL := GetLuaState(Sender);
    if CheckEvent(LL,Sender,EventCFunc) then begin
      ToTable(LL, -1, Sender);
      lua_pushstring(LL,pchar(EditorCommandToCodeString(Command)));
      DoCall(LL,2);
      if lua_isstring(LL,-1) then begin
         IdentToEditorCommand(lua_tostring(LL,-1), cmd );
         Command := TSynEditorCommand(cmd);
      end;
    end;
end;

procedure TVCLuaControl.ClickLinkEventHandler(Sender: TObject; EventCFunc: TLuaCFunction; Button: TMouseButton;
          Shift: TShiftState; X, Y: Integer);
var LL:Plua_State;
begin
    LL := GetLuaState(Sender);
    if CheckEvent(LL,Sender,EventCFunc) then begin
       ToTable(LL, -1, Sender);
       lua_pushstring(LL,pchar(GetEnumName(TypeInfo(TMouseButton),Integer(Button))));
       lua_pushstring(LL,pchar(ShiftStateToString(Shift)));
       lua_pushnumber(LL,X);
       lua_pushnumber(LL,Y);
       DoCall(LL,5);
    end;
end;

procedure TVCLuaControl.MouseLinkEventHandler(Sender: TObject; EventCFunc: TLuaCFunction; X, Y: Integer;
          var AllowMouseLink: Boolean);
var LL:Plua_State;
begin
    LL := GetLuaState(Sender);
    if CheckEvent(LL,Sender,EventCFunc) then begin
       ToTable(LL, -1, Sender);
       lua_pushnumber(LL,X);
       lua_pushnumber(LL,Y);
       lua_pushboolean(LL,AllowMouseLink);
       DoCall(LL,3);
       if lua_isboolean(LL,-1) then
          AllowMouseLink := lua_toboolean(LL,-1);
    end;
end;

procedure TVCLuaControl.ColumnClickEventHandler(Sender: TObject; EventCFunc: TLuaCFunction; Column: TListColumn);
var LL:Plua_State;
begin
    LL := GetLuaState(Sender);
    if CheckEvent(LL,Sender,EventCFunc) then begin
       ToTable(LL, -1, Sender);
       lua_pushobject(LL, Column, -1);
       DoCall(LL,2);
    end;
end;

procedure TVCLuaControl.SelectItemEventHandler(Sender: TObject; EventCFunc: TLuaCFunction; Item: TListItem; Selected: Boolean);
var LL:Plua_State;
begin
    LL := GetLuaState(Sender);
    if CheckEvent(LL,Sender,EventCFunc) then begin
       ToTable(LL, -1, Sender);
       // push as table -1 not -2!
       lua_pushobject(LL, Item, -1);
       lua_pushboolean(LL, Selected);
       DoCall(LL,3);
    end;
end;

// TreeView
procedure TVCLuaControl.EditedEventHandler(Sender: TObject; EventCFunc: TLuaCFunction; Node: TTreeNode; var S: string);
var LL:Plua_State;
begin
    LL := GetLuaState(Sender);
    if CheckEvent(LL,Sender,EventCFunc) then begin
       ToTable(LL, -1, Sender);
       lua_pushobject(LL, Node, -1);
       lua_pushstring(LL, pchar(S));
       DoCall(LL,3);
       if lua_isstring(LL,-1) then
          S := lua_tostring(LL,-1);
    end;
end;

procedure TVCLuaControl.NodeChangedEventHandler(Sender: TObject;  EventCFunc: TLuaCFunction; Node: TTreeNode; ChangeReason: TTreeNodeChangeReason);
var LL:Plua_State;
begin
    LL := GetLuaState(Sender);
    if CheckEvent(LL,Sender,EventCFunc) then begin
       ToTable(LL, -1, Sender);
       lua_pushobject(LL, Node, -1);
       lua_pushstring(LL,pchar(GetEnumName(TypeInfo(TTreeNodeChangeReason),Integer(ChangeReason))));
       DoCall(LL,3);
    end;
end;

//LUA Event Catch
procedure TVCLuaControl.OnLuaMinimize(Sender: TObject);
  begin NotifyEventHandler(Sender, OnMinimize_Function);end;
procedure TVCLuaControl.OnLuaMaximize(Sender: TObject);
  begin NotifyEventHandler(Sender, OnMaximize_Function);end;

procedure TVCLuaControl.OnLuaChangeBounds(Sender: TObject);
  begin NotifyEventHandler(Sender, OnChangeBounds_Function);end;
procedure TVCLuaControl.OnLuaCreate(Sender: TObject);
  begin NotifyEventHandler(Sender, OnCreate_Function);end;
procedure TVCLuaControl.OnLuaClick(Sender: TObject);
  begin NotifyEventHandler(Sender,OnClick_Function);end;
procedure TVCLuaControl.OnLuaDblClick(Sender: TObject);
  begin NotifyEventHandler(Sender, OnDblClick_Function);end;
procedure TVCLuaControl.OnLuaDestroy(Sender: TObject);
  begin NotifyEventHandler(Sender, OnDestroy_Function);end;
procedure TVCLuaControl.OnLuaShow(Sender: TObject);
  begin NotifyEventHandler(Sender, OnShow_Function);end;
procedure TVCLuaControl.OnLuaHide(Sender: TObject);
  begin NotifyEventHandler(Sender, OnHide_Function);end;
procedure TVCLuaControl.OnLuaActivate(Sender: TObject);
  begin NotifyEventHandler(Sender, OnActivate_Function);end;
procedure TVCLuaControl.OnLuaDeactivate(Sender: TObject);
  begin NotifyEventHandler(Sender, OnDeactivate_Function);end;
procedure TVCLuaControl.OnLuaResize(Sender: TObject);
  begin NotifyEventHandler(Sender, OnResize_Function); end;
procedure TVCLuaControl.OnLuaPaint(Sender: TObject);
  begin NotifyEventHandler(Sender, OnPaint_Function);end;
procedure TVCLuaControl.OnLuaChange(Sender: TObject);
  begin NotifyEventHandler(Sender, OnChange_Function);end;
procedure TVCLuaControl.OnLuaCloseUp(Sender: TObject);
  begin NotifyEventHandler(Sender, OnCloseUp_Function);end;

procedure TVCLuaControl.OnLuaClose(Sender: TObject; var Action: TCloseAction);
  begin CloseEventHandler(Sender, OnClose_Function, Action);end;
procedure TVCLuaControl.OnLuaCloseQuery(Sender: TObject; var CanClose: Boolean);
  begin CloseQueryEventHandler(Sender, OnCloseQuery_Function, CanClose);end;
procedure TVCLuaControl.OnLuaWindowStateChange(Sender: TObject);
  begin NotifyEventHandler(Sender, OnWindowStateChange_Function);end;

procedure TVCLuaControl.OnLuaEnter(Sender: TObject);
  begin NotifyEventHandler(Sender, OnEnter_Function);end;
procedure TVCLuaControl.OnLuaExit(Sender: TObject);
  begin NotifyEventHandler(Sender, OnExit_Function);end;

procedure TVCLuaControl.OnLuaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  begin KeyEventHandler(Sender, OnKeyDown_Function, Key, Shift);end;
procedure TVCLuaControl.OnLuaKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  begin KeyEventHandler(Sender, OnKeyUp_Function, Key, Shift);end;

procedure TVCLuaControl.OnLuaMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  begin MouseEventHandler(Sender, OnMouseDown_Function, Button, Shift, X, Y);end;
procedure TVCLuaControl.OnLuaMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  begin MouseEventHandler(Sender, OnMouseUp_Function, Button, Shift, X, Y);end;
procedure TVCLuaControl.OnLuaMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
  begin MouseMoveEventHandler(Sender, OnMouseMove_Function, Shift, X, Y);end;
procedure TVCLuaControl.OnLuaMouseWheel(Sender: TObject; Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
  begin MouseWheelEventHandler(Sender, OnMouseWheel_Function, Shift, WheelDelta, MousePos, Handled);end;
procedure TVCLuaControl.OnLuaMouseWheelDown(Sender: TObject; Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
  begin MouseWheelUpDownEventHandler(Sender, OnMouseWheelDown_Function, Shift, MousePos, Handled);end;
procedure TVCLuaControl.OnLuaMouseWheelUp(Sender: TObject; Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
  begin MouseWheelUpDownEventHandler(Sender, OnMouseWheelUp_Function, Shift, MousePos, Handled);end;
procedure TVCLuaControl.OnLuaMouseEnter(Sender: TObject);
  begin NotifyEventHandler(Sender, OnMouseEnter_Function);end;
procedure TVCLuaControl.OnLuaMouseExit(Sender: TObject);
  begin NotifyEventHandler(Sender, OnMouseExit_Function);end; 

//PageControl
procedure TVCLuaControl.OnLuaPageChanged(Sender: TObject);
  begin NotifyEventHandler(Sender, OnPageChanged_Function);end;
// Action
procedure TVCLuaControl.OnLuaExecute(Sender: TObject);
  begin NotifyEventHandler(Sender, OnExecute_Function);end;
procedure TVCLuaControl.OnLuaUpdate(Sender: TObject);
  begin NotifyEventHandler(Sender, OnUpdate_Function);end;

// Timer
procedure TVCLuaControl.OnLuaTimer(Sender: TObject);
  begin NotifyEventHandler(Sender, OnTimer_Function);end; 
procedure TVCLuaControl.OnLuaIdleTimer(Sender: TObject);
  begin NotifyEventHandler(Sender, OnIdleTimer_Function);end;

// Extended edit
procedure TVCLuaControl.OnAcceptDirectory(Sender: TObject; var Value: String);
  begin AcceptDirectoryHandler(Sender, OnAcceptDirectory_Function, Value); end;

procedure TVCLuaControl.OnAcceptFileName(Sender: TObject; var Value: String);
  begin AcceptFileNameHandler(Sender, OnAcceptFileName_Function, Value); end;

procedure TVCLuaControl.OnAcceptValue(Sender: TObject; var AValue: Double; var Action: Boolean);
begin AcceptValueHandler(Sender, OnAcceptValue_Function, AValue, Action) end;

procedure TVCLuaControl.OnAcceptDate(Sender: TObject; var ADate: TDateTime; var AcceptDate: Boolean);
begin AcceptDateHandler(Sender, OnAcceptDate_Function, ADate, AcceptDate) end;

(*
procedure TVCLuaControl.OnLuaButtonClick(Sender: TObject);
  begin
      NotifyEventHandler(Sender,OnButtonClick_Function);
  end;
*)

// StringGrid
procedure TVCLuaControl.OnLuaButtonClick(Sender: TObject; aCol, aRow: Integer);
begin
    ButtonClickEventHandler(Sender, OnButtonClick_Function, aCol, aRow);
end;

procedure TVCLuaControl.OnLuaHeaderClick(Sender: TObject; IsColumn: Boolean; Index:Integer);
  begin HeaderClickEventHandler(Sender, OnHeaderClick_Function, IsColumn, Index);end;
procedure TVCLuaControl.OnLuaEditButtonClick(Sender: TObject);
  begin NotifyEventHandler(Sender,OnEditButtonClick_Function);end;
procedure TVCLuaControl.OnLuaSelectCell(Sender: TObject; ACol, ARow: Longint; var CanSelect: Boolean);
  begin SelectCellEventHandler(Sender, OnSelectCell_Function, ACol, ARow, CanSelect);end;
procedure TVCLuaControl.OnLuaDrawCell(Sender: TObject; ACol, ARow: Longint; Rect: TRect; State: TGridDrawState);
  begin DrawCellEventHandler(Sender, OnDrawCell_Function, ACol, ARow, Rect, State);end;
procedure TVCLuaControl.OnLuaGetEditText(Sender: TObject; ACol, ARow: Longint; var Value: string);
  begin GetEditTextEventHandler(Sender, OnGetEditText_Function, ACol, ARow, Value);end;
procedure TVCLuaControl.OnLuaGetEditMask(Sender: TObject; ACol, ARow: Longint; var Value: string);
  begin GetEditTextEventHandler(Sender, OnGetEditMask_Function, ACol, ARow, Value);end;
procedure TVCLuaControl.OnLuaSetEditText(Sender: TObject; ACol, ARow: Longint; var Value: string);
  begin SetEditTextEventHandler(Sender, OnSetEditText_Function, ACol, ARow, Value);end;
procedure TVCLuaControl.OnLuaColumnMoved(Sender: TObject; FromIndex, ToIndex: Longint);
  begin RowColumnMovedEventHandler(Sender, OnColumnMoved_Function, FromIndex, ToIndex);end;
procedure TVCLuaControl.OnLuaRowMoved(Sender: TObject; FromIndex, ToIndex: Longint);
  begin RowColumnMovedEventHandler(Sender, OnRowMoved_Function, FromIndex, ToIndex);end;
  
procedure TVCLuaControl.OnLuaTopLeftChanged(Sender: TObject);
  begin NotifyEventHandler(Sender, OnTopLeftChanged_Function);end;
  
// FileDrop
procedure TVCLuaControl.OnLuaDropFiles(Sender: TObject; const FileNames: array of String);
  begin DropFilesEventHandler(Sender, OnDropFiles_Function, FileNames); end;

// DragDrop
procedure TVCLuaControl.OnLuaDragDrop(Sender: TObject; Source: TObject; X, Y: Integer);
  begin DragDropEventHandler(Sender, OnDragDrop_Function, Source, X, Y); end;
procedure TVCLuaControl.OnLuaDragOver(Sender: TObject; Source: TObject; X, Y: Integer;State: TDragState; var Accept: Boolean);
  begin DragOverEventHandler(Sender, OnDragOver_Function, Source, X, Y, State, Accept); end;

// Docking
procedure TVCLuaControl.OnLuaDockDrop(Sender: TObject; Source: TDragDockObject; X, Y: Integer);
  begin DockDropEventHandler(Sender, OnDockDrop_Function, Source, X, Y); end;
procedure TVCLuaControl.OnLuaDockOver(Sender: TObject; Source: TDragDockObject; X, Y: Integer;State: TDragState; var Accept: Boolean);
  begin DockOverEventHandler(Sender, OnDockOver_Function, Source, X, Y, State, Accept); end;
procedure TVCLuaControl.OnLuaUnDock(Sender: TObject; Client: TControl; NewTarget: TWinControl; var Allow: Boolean);
  begin UnDockEventHandler(Sender, OnUnDock_Function, Client, NewTarget, Allow); end;
procedure TVCLuaControl.OnLuaStartDock(Sender: TObject; var DockObject: TDragDockObject);
  begin StartDockEventHandler(Sender, OnStartDock_Function, DockObject); end;
procedure TVCLuaControl.OnLuaEndDock(Sender: TObject; Target: TObject; X, Y: Integer);
  begin EndDockEventHandler(Sender, OnEndDock_Function, Target, X, Y); end;

// FindDialog
procedure TVCLuaControl.OnLuaFind(Sender: TObject);
  begin NotifyEventHandler(Sender, OnFind_Function);end;
procedure TVCLuaControl.OnLuaReplace(Sender: TObject);
  begin NotifyEventHandler(Sender, OnReplace_Function);end;

// SynEdit
procedure TVCLuaControl.OnLuaReplaceText(Sender: TObject; const ASearch,AReplace: string; Line, Column: integer; var ReplaceAction: TSynReplaceAction);
begin ReplaceTextEventHandler(Sender, OnReplaceText_Function, ASearch, AReplace, Line, Column, ReplaceAction); end;
procedure TVCLuaControl.OnLuaCommandProcessed(Sender: TObject; var Command: TSynEditorCommand; var AChar: TUTF8Char; Data: pointer);
begin CommandProcessedEventHandler(Sender, OnCommandProcessed_Function, Command, AChar, Data); end;
procedure TVCLuaControl.OnLuaClickLink(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin ClickLinkEventHandler(Sender, OnClickLink_Function, Button, Shift, X, Y); end;
procedure TVCLuaControl.OnLuaMouseLink(Sender: TObject; X, Y: Integer; var AllowMouseLink: Boolean);
begin MouseLinkEventHandler(Sender, OnMouseLink_Function, X, Y, AllowMouseLink); end;

// Listview
procedure TVCLuaControl.OnLuaColumnClick(Sender: TObject; Column: TListColumn);
begin
  // ColumnClickEventHandler(Sender, OnColumnClick_Function, Column);
end;
procedure TVCLuaControl.OnLuaSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
begin
  // SelectItemEventHandler(Sender, OnSelectItem_Function, Item, Selected);
end;

// TreeView
procedure TVCLuaControl.OnLuaEdited(Sender: TObject; Node: TTreeNode; var S: string);
begin
  // EditedEventHandler(Sender,OnEdited_Function, Node, S);
end;

procedure TVCLuaControl.OnLuaNodeChanged(Sender: TObject; Node: TTreeNode; ChangeReason: TTreeNodeChangeReason);
begin
  // NodeChangedEventHandler(Sender, OnNodeChanged_Function, Node, ChangeReason);
end;

procedure TVCLuaControl.OnLuaSelectionChanged(Sender: TObject);
begin NotifyEventHandler(Sender, OnSelectionChanged_Function);end;

// PropertyGrid
procedure TVCLuaControl.OnLuaModified(Sender: TObject);
begin NotifyEventHandler(Sender, OnModified_Function);end;


end.

