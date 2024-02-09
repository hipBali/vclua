unit LuaController;

{$mode delphi}

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
//     SynEdit,
//     SynEditKeyCmds,
     LclType,
     Messages,
     SysUtils;

type

    ToTableProc = procedure(LL:Plua_State; Index:Integer; Sender:TObject);

    TLuaCFunction = Integer;

    TVCLuaControl = class(TComponent)

        constructor Create(AOwner:TComponent; LL: Plua_State; T:ToTableProc; ATypeName:String = '');
        public
            function PushEvent(var L:Plua_State; Sender: TObject; EFn:TLuaCFunction):Boolean; inline;
            procedure PushObject(L: Plua_State; Sender: TObject); inline;
        public
            L: Plua_State;
            TTable: ToTableProc;
            TypeName:String;
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
          fOnLuaMouseLeave_Func,
		  
	  //StringGrid
          fOnLuaHeaderClick_Func,
          fOnLuaEditButtonClick_Func,
	  fOnLuaSelectCell_Func,
          fOnLuaDrawCell_Func,
          fOnLuaGetEditText_Func,
          fOnLuaGetEditMask_Func,
          fOnLuaSetEditText_Func,
          fOnLuaColRowMoved_Func,
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
          (*
          fOnLuaReplaceText_Func,
          fOnLuaCommandProcessed_Func,
          fOnLuaClickLink_Func,
          fOnLuaMouseLink_Func,
          *)
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
          fOnLuaModified_Func,

          // CheckListBox
          fOnSelectionChange_Func

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
          procedure OnLuaMouseLeave(Sender: TObject);

          //PageControl
          procedure OnLuaPageChanged(Sender: TObject);

          //Action
	  procedure OnLuaExecute(Sender: TObject);
	  procedure OnLuaUpdate(Sender: TObject);

	  //Timer
	  procedure OnLuaTimer(Sender: TObject);
	  procedure OnLuaIdleTimer(Sender: TObject);

          // Extended Edit
          procedure OnLuaAcceptDirectory(Sender: TObject; var Value: String);
          procedure OnLuaAcceptFileName(Sender: TObject; var Value: String);
          procedure OnLuaAcceptValue(Sender: TObject; var AValue: Double; var Accept: Boolean);
          procedure OnLuaAcceptDate(Sender: TObject; var ADate: TDateTime; var AcceptDate: Boolean);
          // procedure OnLuaButtonClick(Sender: TObject);
          //StringGrid
          procedure OnLuaButtonClick(Sender: TObject; aCol, aRow: Integer);

          procedure OnLuaHeaderClick(Sender: TObject; IsColumn: Boolean; Index:Integer);
          procedure OnLuaEditButtonClick(Sender: TObject);
	  procedure OnLuaSelectCell(Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
          procedure OnLuaDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
          procedure OnLuaGetEditText(Sender: TObject; ACol, ARow: Integer; var Value: string);
          procedure OnLuaGetEditMask(Sender: TObject; ACol, ARow: Integer; var Value: string);
          procedure OnLuaSetEditText(Sender: TObject; ACol, ARow: Integer; const Value: string);
          procedure OnLuaColRowMoved(Sender: TObject; IsColumn: Boolean; FromIndex, ToIndex: Integer);
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
          (*
          procedure OnLuaReplaceText(Sender: TObject; const ASearch,
                    AReplace: string; Line, Column: integer; var ReplaceAction: TSynReplaceAction);
          procedure OnLuaCommandProcessed(Sender: TObject;
                    var Command: TSynEditorCommand; var AChar: TUTF8Char; Data: pointer);
          procedure OnLuaClickLink(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
          procedure OnLuaMouseLink(Sender: TObject; X, Y: Integer; var AllowMouseLink: Boolean);
          *)

          // ListView
          procedure OnLuaColumnClick(Sender: TObject; Column: TListColumn);
          procedure OnLuaSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);


          //TreeView
          procedure OnLuaEdited(Sender: TObject; Node: TTreeNode; var S: string);
          procedure OnLuaNodeChanged(Sender: TObject; Node: TTreeNode; ChangeReason: TTreeNodeChangeReason);
          procedure OnLuaSelectionChanged(Sender: TObject);

          // PropertyGrid
          procedure OnLuaModified(Sender: TObject);

          //
          procedure OnLuaSelectionChangeEvent(Sender: TObject; User: boolean);

    // ----------------------------------------------------------------------------------------
    public


          // EVENT HANDLERS

          // SynEdit
          (*
          procedure ReplaceTextEventHandler(Sender: TObject; EventCFunc: TLuaCFunction; const ASearch,
                    AReplace: string; Line, Column: integer; var ReplaceAction: TSynReplaceAction);
          procedure CommandProcessedEventHandler(Sender: TObject; EventCFunc: TLuaCFunction;
                    var Command: TSynEditorCommand; var AChar: TUTF8Char; Data: pointer);
          procedure ClickLinkEventHandler(Sender: TObject; EventCFunc: TLuaCFunction; Button: TMouseButton;
                    Shift: TShiftState; X, Y: Integer);
          procedure MouseLinkEventHandler(Sender: TObject; EventCFunc: TLuaCFunction; X, Y: Integer;
                    var AllowMouseLink: Boolean);
          *)

          // basic events
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
          procedure UnDockEventHandler(Sender: TObject; EventCFunc: TLuaCFunction; Client: TControl; NewTarget: TWinControl; var Allow: Boolean);
          // Form related
          procedure CloseEventHandler(Sender: TObject; EventCFunc: TLuaCFunction; var Action: TCloseAction);
          procedure CloseQueryEventHandler(Sender: TObject; EventCFunc: TLuaCFunction; var CanClose: Boolean);
          // StringGrid related
          procedure HeaderClickEventHandler(Sender: TObject; EventCFunc: TLuaCFunction; IsColumn: Boolean; Index:Integer);
	  procedure SelectCellEventHandler(Sender: TObject; EventCFunc: TLuaCFunction; ACol, ARow: Integer; var CanSelect: Boolean);
	  procedure DrawCellEventHandler(Sender: TObject; EventCFunc: TLuaCFunction; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
	  procedure GetEditTextEventHandler(Sender: TObject; EventCFunc: TLuaCFunction; ACol, ARow: Integer; var Value: string);
          procedure SetEditTextEventHandler(Sender: TObject; EventCFunc: TLuaCFunction; ACol, ARow: Integer; const Value: string);
	  procedure GridOperationEventHandler(Sender: TObject; EventCFunc: TLuaCFunction; IsColumn: Boolean; FromIndex, ToIndex: Integer);
          procedure ButtonClickEventHandler(Sender: TObject; EventCFunc: TLuaCFunction; aCol, aRow: Integer);
          // Extended edit
          procedure AcceptFileNameHandler(Sender: TObject; EventCFunc: TLuaCFunction; var Value: String);
          procedure AcceptValueHandler(Sender: TObject; EventCFunc: TLuaCFunction; var AValue: Double; var Accept: Boolean);
          procedure AcceptDateHandler(Sender: TObject; EventCFunc: TLuaCFunction; var ADate: TDateTime; var AcceptDate: Boolean);

          // ListView
          procedure ColumnClickEventHandler(Sender: TObject; EventCFunc: TLuaCFunction; Column: TListColumn);
          procedure SelectItemEventHandler(Sender: TObject; EventCFunc: TLuaCFunction; Item: TListItem; Selected: Boolean);

          //TreeView
          procedure EditedEventHandler(Sender: TObject; EventCFunc: TLuaCFunction; Node: TTreeNode; var S: string);
          procedure NodeChangedEventHandler(Sender: TObject;  EventCFunc: TLuaCFunction; Node: TTreeNode; ChangeReason: TTreeNodeChangeReason);

          // CheckListBox
          procedure SelectionChangeEventHandler(Sender: TObject; EventCFunc: TLuaCFunction; User: boolean);

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
          property OnMouseLeave_Function: TLuaCFunction read fOnLuaMouseLeave_Func write fOnLuaMouseLeave_Func;

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
          property OnColRowMoved_Function: TLuaCFunction read fOnLuaColRowMoved_Func write fOnLuaColRowMoved_Func;
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
          (*
          property OnReplaceText_Function: TLuaCFunction read fOnLuaReplaceText_Func write fOnLuaReplaceText_Func;
          property OnCommandProcessed_Function: TLuaCFunction read fOnLuaCommandProcessed_Func write fOnLuaCommandProcessed_Func;
          property OnClickLink_Function: TLuaCFunction read fOnLuaClickLink_Func write fOnLuaClickLink_Func;
          property OnMouseLink_Function: TLuaCFunction read fOnLuaMouseLink_Func write fOnLuaMouseLink_Func;
          *)

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

          // CheckListBox
          property OnSelectionChange_Function: TLuaCFunction read fOnSelectionChange_Func write fOnSelectionChange_Func;

     end;

     TLuaBaseControl = class(TComponent)
         LuaCtl: TVCLuaControl;
     end;

// *************************************************************************
// function CheckBoxStateToString(State:TCheckBoxState):String;

procedure GetControlParents(L: Plua_State; var Parent:TWinControl; var Name:String);
procedure InitControl(L: Plua_State; luaObj:TObject; var Name:String);
procedure SetDefaultMethods(L: Plua_State; Index:Integer; Sender:TObject);
procedure CreateTableForKnownType(L: Plua_State; TypeName:String; Sender:TObject);inline;
procedure SetAsMainForm(aForm:TForm);

// extended properties
function ComponentShortCut(Comp: TComponent; scName:String): boolean;

// default methods
function ControlFree(L: Plua_State): Integer; cdecl;
function ControlFocus(L: Plua_State): Integer; cdecl;
function ControlBeginUpdateBounds(L: Plua_State): Integer; cdecl;
function ControlEndUpdateBounds(L: Plua_State): Integer; cdecl;
function ControlParentName(L: Plua_State): Integer; cdecl;
function GetLuaState(Sender:TObject):Plua_State;
function GetLuaControl(Sender:TObject):TVCLuaControl;
function CheckEvent(L:Plua_State; Sender: TObject; EFn:TLuaCFunction):Boolean; inline;

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
     LCLProc,
     LuaProxy,
     {$i luacontroller_uses.inc};

// generic call
// defined here because generics need all used functions (lua_push) available at declaration, so LuaProxy and LuaObject and all components should be available
// Call Method, that is, 'self' should be already put on stack, hence number of params is less by 1
// dunno if type overloading and -M implicitFunctionSpecialization would get along in FPC 3.3.1+
// so I keep numbers at the end of proc names - R.O.
procedure CallM2<T1>(L: Plua_State; const v1:T1);
begin
  lua_push(L,v1,TypeInfo(v1));
  DoCall(L, 2);
end;
procedure CallM3<T1, T2>(L: Plua_State; const v1:T1; const v2:T2);
begin
  lua_push(L,v1,TypeInfo(v1));
  lua_push(L,v2,TypeInfo(v2));
  DoCall(L, 3);
end;
procedure CallM4<T1, T2, T3>(L: Plua_State; const v1:T1; const v2:T2; const v3:T3);
begin
  lua_push(L,v1,TypeInfo(v1));
  lua_push(L,v2,TypeInfo(v2));
  lua_push(L,v3,TypeInfo(v3));
  DoCall(L, 4);
end;
procedure CallM5<T1, T2, T3, T4>(L: Plua_State; const v1:T1; const v2:T2; const v3:T3; const v4:T4);
begin
  lua_push(L,v1,TypeInfo(v1));
  lua_push(L,v2,TypeInfo(v2));
  lua_push(L,v3,TypeInfo(v3));
  lua_push(L,v4,TypeInfo(v4));
  DoCall(L, 5);
end;
procedure CallM6<T1, T2, T3, T4, T5>(L: Plua_State; const v1:T1; const v2:T2; const v3:T3; const v4:T4; const v5:T5);
begin
  lua_push(L,v1,TypeInfo(v1));
  lua_push(L,v2,TypeInfo(v2));
  lua_push(L,v3,TypeInfo(v3));
  lua_push(L,v4,TypeInfo(v4));
  lua_push(L,v5,TypeInfo(v5));
  DoCall(L, 6);
end;

// ***********************************************
// LUA Control Methods
// ***********************************************
function UpCast(L: Plua_State): Integer; cdecl;
var
  o: TObject;
  pti:PTypeInfo;
begin
  CheckArg(L, 1);
  Result := 1;
  o := GetLuaObject(L, 1);
  if o = nil then begin
     lua_pushnil(L);
     Exit;
  end;
  lua_pushliteral(L, 'vmt');
  pti := o.ClassInfo;
  while pti <> nil do begin
    luaL_getmetatable(L, PChar(string(pti^.Name)));
    if lua_istable(L, 3) then begin
       lua_rawset(L, 1);
       Exit;
    end;
    lua_pop(L, 1);
    pti := GetTypeData(pti)^.ParentInfo;
  end;
  lua_pop(L, 1); // to return o
end;

procedure SetDefaultMethods(L: Plua_State; Index: Integer; Sender: TObject);
begin
	lua_newtable(L);
	LuaSetTableLightUserData(L, Index, HandleStr, Pointer(Sender));
	LuaSetTableFunction(L, index, 'Free', @ControlFree);
        LuaSetTableFunction(L, index, 'UpCast', @UpCast);
        if Sender is TWinControl then begin
           LuaSetTableFunction(L, index, 'SetFocus', @ControlFocus);
           LuaSetTableFunction(L, index, 'EndUpdateBounds', @ControlEndUpdateBounds);
           LuaSetTableFunction(L, index, 'BeginUpdateBounds', @ControlBeginUpdateBounds);
        end;
end;

procedure CreateTableForKnownType(L: Plua_State; TypeName:String; Sender:TObject);
var top:integer;
begin
  if Sender = nil then begin
    lua_pushnil(L);
    Exit;
  end;
  SetDefaultMethods(L,-1,Sender);
  top := lua_gettop(L);
  if TypeName <> '' then begin
    lua_pushliteral(L,'vmt');
    luaL_getmetatable(L,PChar(TypeName));
    lua_pushliteral(L,'__index');
    lua_rawget(L,-2);
    lua_remove(L,-2);
    lua_rawset(L,top);
  end;
  LuaSetMetaFunction(L, top, '__index', @LuaGetProperty);
  LuaSetMetaFunction(L, top, '__newindex', @LuaSetProperty);
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
       try
          (luaObj as TComponent).Name := Name;
       except
           on E: Exception do
              LuaError(L, E.ClassName , E.Message );
       end;
end;

function ControlFree(L: Plua_State): Integer; cdecl;
var
  o: TObject;
begin
  CheckArg(L, 1);
  o := GetLuaObject(L, 1);
  o.Free;
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

constructor TVCLuaControl.Create(AOwner:TComponent; LL: Plua_State; T:ToTableProc; ATypeName:String);
begin
     inherited Create(AOwner);
     L := LL;
     TTable := T;
     TypeName := ATypeName;
     ComponentIndex := 0;
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

(*
function StringToCheckBoxState(State:String):TCheckBoxState;
begin
  Result := [];
  if AnsiContainsStr(State,'cbUnchecked') then
     include(Result,cbUnchecked);
  if AnsiContainsStr(State,'cbChecked') then
     include(Result,cbChecked);
  if AnsiContainsStr(State,'cbGrayed') then
     include(Result,cbGrayed);
end;

*)

// ***********************************************
// LUA Events
// ***********************************************
function CheckEvent(L:Plua_State; Sender: TObject; EFn:TLuaCFunction):Boolean;
begin
    Result := False;
    if L = nil then begin
      ShowMessage('Sender has no lua_State: '+Sender.Classname);
      exit;
    end;
    if EFn = 0 then
       LuaError(L,'Event not a Lua function!', Sender.ClassName);
    // function to top
    lua_rawgeti(L, LUA_REGISTRYINDEX, EFn);
    Result := True;
end;
function TVCLuaControl.PushEvent(var L: Plua_State; Sender: TObject; EFn: TLuaCFunction): Boolean;
begin
    L := GetLuaState(Sender);
    Result := CheckEvent(L, Sender, EFn);
    if Result then
       PushObject(L, Sender);
end;
procedure TVCLuaControl.PushObject(L: Plua_State; Sender: TObject);
begin
  if @TTable <> nil then
     TTable(L, -1, Sender)
  else
    CreateTableForKnownType(L, TypeName, Sender);
end;

procedure TVCLuaControl.NotifyEventHandler(Sender: TObject; EventCFunc: TLuaCFunction);
var LL:Plua_State;
begin
    if PushEvent(LL,Sender,EventCFunc) then
      DoCall(LL,1);
end;

procedure TVCLuaControl.KeyEventHandler(Sender: TObject; EventCFunc: TLuaCFunction; var Key: Word; Shift: TShiftState);
var LL:Plua_State;
begin
    if PushEvent(LL,Sender,EventCFunc) then begin
       CallM3<Word, TShiftState>(LL, Key, Shift);
    if lua_isnumber(LL,-1) then
       Key := Word(Round(lua_tonumber(LL,-1)));
    end
end;

procedure TVCLuaControl.MouseEventHandler(Sender: TObject; EventCFunc: TLuaCFunction; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var LL:Plua_State;
begin
    if PushEvent(LL,Sender,EventCFunc) then begin
       CallM5<TMouseButton, TShiftState, Integer, Integer>(LL, Button, Shift, X, Y);
    end;
end;

procedure TVCLuaControl.MouseMoveEventHandler(Sender: TObject; EventCFunc: TLuaCFunction; Shift: TShiftState; X, Y: Integer);
var LL:Plua_State;
begin
    if PushEvent(LL,Sender,EventCFunc) then begin
       CallM4<TShiftState, Integer, Integer>(LL, Shift, X, Y);
    end;
end;

procedure TVCLuaControl.MouseWheelEventHandler(Sender: TObject; EventCFunc: TLuaCFunction; Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
var LL:Plua_State;
begin
    if PushEvent(LL,Sender,EventCFunc) then begin
       CallM5<TShiftState, Integer, TPoint, Boolean>(LL, Shift, WheelDelta, MousePos, Handled);
    if lua_isboolean(LL,-1) then
       Handled := lua_toboolean(LL,-1);
    end;
end;

procedure TVCLuaControl.MouseWheelUpDownEventHandler(Sender: TObject; EventCFunc: TLuaCFunction; Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
var LL:Plua_State;
begin
    if PushEvent(LL,Sender,EventCFunc) then begin
       CallM4<TShiftState, TPoint, Boolean>(LL, Shift, MousePos, Handled);
    if lua_isboolean(LL,-1) then
       Handled := lua_toboolean(LL,-1);
    end;
end;


// Extended Edit

procedure TVCLuaControl.AcceptFileNameHandler(Sender: TObject; EventCFunc: TLuaCFunction; var Value: String);
var LL:Plua_State;
begin
    if PushEvent(LL,Sender,EventCFunc) then begin
       CallM2<string>(LL, Value);
    if lua_isstring(LL,-1) then
       Value := lua_tostring(LL,-1);
    end;
end;

procedure TVCLuaControl.AcceptValueHandler(Sender: TObject; EventCFunc: TLuaCFunction; var AValue: Double; var Accept: Boolean);
var LL:Plua_State;
  newTop,i:integer;
begin
    if PushEvent(LL,Sender,EventCFunc) then begin
       // adjust results to expected number as Lua does (<=2 in this case)
       // store old top, grab results from next slot
       i := lua_gettop(LL)-2;
       CallM3<Double, Boolean>(LL, AValue, Accept);
       newTop := lua_gettop(LL);
       if i < newTop then begin
          // have result, so get (absolute) index
          Inc(i);
          if lua_isnumber(LL,i) then begin
             AValue := lua_tonumber(LL,i);
          end
          else begin
             LuaTypeError(LL, TypeInfo(AValue), i);
          end;
       end;
       if i < newTop then begin
         Inc(i);
         if lua_isboolean(LL,i) then
            Accept := lua_toboolean(LL,i)
         else
            LuaTypeError(LL, TypeInfo(Accept), i);
       end;
    end;
end;

procedure TVCLuaControl.AcceptDateHandler(Sender: TObject; EventCFunc: TLuaCFunction; var ADate: TDateTime; var AcceptDate: Boolean);
var LL:Plua_State;
begin
    if PushEvent(LL,Sender,EventCFunc) then begin
       CallM3<TDateTime, Boolean>(LL, ADate, AcceptDate);
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
    if PushEvent(LL,Sender,EventCFunc) then begin
       CallM2<TCloseAction>(LL, Action);
    if lua_isstring(LL,-1) then
       Action := TCloseAction(GetEnumValue(TypeInfo(TCloseAction),lua_tostring(LL,-1)));
    end;
end;

procedure TVCLuaControl.CloseQueryEventHandler(Sender: TObject; EventCFunc: TLuaCFunction; var CanClose: Boolean);
var LL:Plua_State;
begin
    if PushEvent(LL,Sender,EventCFunc) then begin
       CallM2<Boolean>(LL, CanClose);
    if lua_isboolean(LL,-1) then
       CanClose := lua_toboolean(LL,-1);
    end;
end;

// StringGrid related
procedure TVCLuaControl.ButtonClickEventHandler(Sender: TObject; EventCFunc: TLuaCFunction; aCol, aRow: Integer);
var LL:Plua_State;
begin
    if PushEvent(LL,Sender,EventCFunc) then begin
       CallM3<Integer, Integer>(LL, ACol, ARow);
    end;
end;

procedure TVCLuaControl.HeaderClickEventHandler(Sender: TObject; EventCFunc: TLuaCFunction; IsColumn: Boolean; Index:Integer);
var LL:Plua_State;
begin
    if PushEvent(LL,Sender,EventCFunc) then begin
       CallM3<Boolean, Integer>(LL, IsColumn, Index);
    end;
end;

procedure TVCLuaControl.SelectCellEventHandler(Sender: TObject; EventCFunc: TLuaCFunction; ACol, ARow: Integer; var CanSelect: Boolean);
var LL:Plua_State;
begin
    if PushEvent(LL,Sender,EventCFunc) then begin
       CallM4<Integer, Integer, Boolean>(LL, ACol, ARow, CanSelect);

    if lua_isboolean(LL,-1) then
       CanSelect := lua_toboolean(LL,-1);
    end;
end;

procedure TVCLuaControl.DrawCellEventHandler(Sender: TObject; EventCFunc: TLuaCFunction; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
var LL:Plua_State;
begin
    if PushEvent(LL,Sender,EventCFunc) then begin
       CallM5<Integer, Integer, TRect, TGridDrawState>(LL, ACol, ARow, Rect, State);
    end;
end;

procedure TVCLuaControl.SetEditTextEventHandler(Sender: TObject; EventCFunc: TLuaCFunction; ACol, ARow: Integer; const Value: string);
var LL:Plua_State;
begin
    if PushEvent(LL,Sender,EventCFunc) then begin
       CallM4<Integer, Integer, string>(LL, ACol, ARow, Value);
    end;
end;

procedure TVCLuaControl.GetEditTextEventHandler(Sender: TObject; EventCFunc: TLuaCFunction; ACol, ARow: Integer; var Value: string);
var LL:Plua_State;
begin
    if PushEvent(LL,Sender,EventCFunc) then begin
       CallM4<Integer, Integer, string>(LL, ACol, ARow, Value);
    if lua_isstring(LL,-1) then
       Value := lua_tostring(LL,-1);
//       TStringGrid(Sender).Cells[ACol, ARow] := lua_tostring(LL,-1);
    end;
end;

procedure TVCLuaControl.GridOperationEventHandler(Sender: TObject; EventCFunc: TLuaCFunction; IsColumn: Boolean; FromIndex, ToIndex: Integer);
var LL:Plua_State;
begin
    if PushEvent(LL,Sender,EventCFunc) then begin
       CallM4<Boolean, Integer, Integer>(LL, IsColumn, FromIndex, ToIndex);
    end;
end;


// DragDrop Events
// TDragDropEvent = procedure(Sender, Source: TObject; X, Y: Integer) of object;
procedure TVCLuaControl.DragDropEventHandler(Sender: TObject; EventCFunc: TLuaCFunction; Source: TObject; X, Y: Integer);
var LL:Plua_State;
begin
    if PushEvent(LL,Sender,EventCFunc) then begin
       CallM4<TObject, Integer, Integer>(LL, Source, X, Y);
    end;
end;

// TDragOverEvent = procedure(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean) of object;
procedure TVCLuaControl.DragOverEventHandler(Sender: TObject; EventCFunc: TLuaCFunction; Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
var LL:Plua_State;
begin
    if PushEvent(LL,Sender,EventCFunc) then begin
       CallM6<TObject, Integer, Integer, TDragState, Boolean>(LL, Source, X, Y, State, Accept);
    if lua_isboolean(LL,-1) then
       Accept := lua_toboolean(LL,-1);
    end;
end;

// type TStartDragEvent = procedure (Sender: TObject; var DragObject: TDragObject) of object; 
procedure TVCLuaControl.StartDragEventHandler(Sender: TObject; EventCFunc: TLuaCFunction; var DragObject: TDragObject);
var LL:Plua_State;
begin
    if PushEvent(LL,Sender,EventCFunc) then begin
    // If the OnStartDrag event handler sets the DragObject parameter to nil (Delphi) or NULL (C++), a TDragControlObject object is automatically created and dragging begins on the control itself.
    DragObject := nil;
    DoCall(LL,1);
    end;
end;

// type TEndDragEvent = procedure(Sender, Target: TObject; X, Y: Integer) of object;
procedure TVCLuaControl.EndDragEventHandler(Sender: TObject; EventCFunc: TLuaCFunction; Target: TObject; X, Y: Integer);
var LL:Plua_State;
begin
    if PushEvent(LL,Sender,EventCFunc) then begin
       CallM4<TObject, Integer, Integer>(LL, Target, X, Y);
    end;
end;


// Docking Events
procedure TVCLuaControl.DockDropEventHandler(Sender: TObject; EventCFunc: TLuaCFunction; Source: TDragDockObject; X, Y: Integer);
var LL:Plua_State;
begin
    if PushEvent(LL,Sender,EventCFunc) then begin
       CallM4<TDragDockObject, Integer, Integer>(LL, Source, X, Y);
    end;
end;

// TDockOverEvent = procedure(Sender, Source: TObject; X, Y: Integer; State: TDockState; var Accept: Boolean) of object;
procedure TVCLuaControl.DockOverEventHandler(Sender: TObject; EventCFunc: TLuaCFunction; Source: TDragDockObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
var LL:Plua_State;
begin
    if PushEvent(LL,Sender,EventCFunc) then begin
       CallM6<TDragDockObject, Integer, Integer, TDragState, Boolean>(LL, Source, X, Y, State, Accept);
    if lua_isboolean(LL,-1) then
       Accept := lua_toboolean(LL,-1);
    end;
end;

// type TStartDockEvent = procedure (Sender: TObject; var DockObject: TDockObject) of object;
procedure TVCLuaControl.StartDockEventHandler(Sender: TObject; EventCFunc: TLuaCFunction; var DockObject: TDragDockObject);
var LL:Plua_State;
begin
    if PushEvent(LL,Sender,EventCFunc) then begin
    // If the OnStartDock event handler sets the DockObject parameter to nil (Delphi) or NULL (C++), a TDockControlObject object is automatically created and Dockging begins on the control itself.
    DockObject := nil;
    DoCall(LL,1);
    end;
end;

procedure TVCLuaControl.UnDockEventHandler(Sender: TObject; EventCFunc: TLuaCFunction; Client: TControl; NewTarget: TWinControl; var Allow: Boolean);
var LL:Plua_State;
begin
    if PushEvent(LL,Sender,EventCFunc) then begin
       CallM4<TControl, TWinControl, Boolean>(LL, Client, NewTarget, Allow);
    if lua_isboolean(LL,-1) then
       Allow := lua_toboolean(LL,-1);
    end;
end;

procedure TVCLuaControl.DropFilesEventHandler(Sender: TObject; EventCFunc: TLuaCFunction; const FileNames: array of String);
var LL:Plua_State;
    i:Integer;
begin
    if PushEvent(LL,Sender,EventCFunc) then begin
       lua_pushArray<string>(LL, FileNames);
       DoCall(LL,2);
    end;
end;

// SynEdit
(*
procedure TVCLuaControl.ReplaceTextEventHandler(Sender: TObject; EventCFunc: TLuaCFunction; const ASearch,
  AReplace: string; Line, Column: integer; var ReplaceAction: TSynReplaceAction);
var LL:Plua_State;
begin
    if PushEvent(LL,Sender,EventCFunc) then begin
       CallM6<string, string, integer, integer, TSynReplaceAction>(LL, ASearch, AReplace, Line, Column, ReplaceAction);
      if lua_isstring(LL,-1) then
         ReplaceAction := TSynReplaceAction(GetEnumValue(TypeInfo(TSynReplaceAction),lua_tostring(LL,-1)));
    end;
end;

procedure TVCLuaControl.CommandProcessedEventHandler(Sender: TObject; EventCFunc: TLuaCFunction;
  var Command: TSynEditorCommand; var AChar: TUTF8Char; Data: pointer);
var LL:Plua_State;
    cmd: Longint;
begin
    if PushEvent(LL,Sender,EventCFunc) then begin
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
    if PushEvent(LL,Sender,EventCFunc) then begin
       CallM5<TMouseButton, TShiftState, Integer, Integer>(LL, Button, Shift, X, Y);
    end;
end;

procedure TVCLuaControl.MouseLinkEventHandler(Sender: TObject; EventCFunc: TLuaCFunction; X, Y: Integer;
          var AllowMouseLink: Boolean);
var LL:Plua_State;
begin
    if PushEvent(LL,Sender,EventCFunc) then begin
       CallM4<Integer, Integer, Boolean>(LL, X, Y, AllowMouseLink);
       if lua_isboolean(LL,-1) then
          AllowMouseLink := lua_toboolean(LL,-1);
    end;
end;
*)

// ListView
procedure TVCLuaControl.ColumnClickEventHandler(Sender: TObject; EventCFunc: TLuaCFunction; Column: TListColumn);
var LL:Plua_State;
begin
    if PushEvent(LL,Sender,EventCFunc) then begin
       CallM2<TListColumn>(LL, Column);
    end;
end;

procedure TVCLuaControl.SelectItemEventHandler(Sender: TObject; EventCFunc: TLuaCFunction; Item: TListItem; Selected: Boolean);
var LL:Plua_State;
begin
    if PushEvent(LL,Sender,EventCFunc) then begin
       CallM3<TListItem, Boolean>(LL, Item, Selected);
    end;
end;

// TreeView
procedure TVCLuaControl.EditedEventHandler(Sender: TObject; EventCFunc: TLuaCFunction; Node: TTreeNode; var S: string);
var LL:Plua_State;
begin
    if PushEvent(LL,Sender,EventCFunc) then begin
       CallM3<TTreeNode, string>(LL, Node, S);
       if lua_isstring(LL,-1) then
          S := lua_tostring(LL,-1);
    end;
end;

procedure TVCLuaControl.NodeChangedEventHandler(Sender: TObject;  EventCFunc: TLuaCFunction; Node: TTreeNode; ChangeReason: TTreeNodeChangeReason);
var LL:Plua_State;
begin
    if PushEvent(LL,Sender,EventCFunc) then begin
       CallM3<TTreeNode, TTreeNodeChangeReason>(LL, Node, ChangeReason);
    end;
end;

procedure TVCLuaControl.SelectionChangeEventHandler(Sender: TObject; EventCFunc: TLuaCFunction; User: boolean);
var LL:Plua_State;
begin
    if PushEvent(LL,Sender,EventCFunc) then begin
       CallM2<Boolean>(LL, User);
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
procedure TVCLuaControl.OnLuaMouseLeave(Sender: TObject);
  begin NotifyEventHandler(Sender, OnMouseLeave_Function);end; 

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
procedure TVCLuaControl.OnLuaAcceptDirectory(Sender: TObject; var Value: String);
  begin AcceptFileNameHandler(Sender, OnAcceptDirectory_Function, Value); end;

procedure TVCLuaControl.OnLuaAcceptFileName(Sender: TObject; var Value: String);
  begin AcceptFileNameHandler(Sender, OnAcceptFileName_Function, Value); end;

procedure TVCLuaControl.OnLuaAcceptValue(Sender: TObject; var AValue: Double; var Accept: Boolean);
begin AcceptValueHandler(Sender, OnAcceptValue_Function, AValue, Accept) end;

procedure TVCLuaControl.OnLuaAcceptDate(Sender: TObject; var ADate: TDateTime; var AcceptDate: Boolean);
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
procedure TVCLuaControl.OnLuaSelectCell(Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
  begin SelectCellEventHandler(Sender, OnSelectCell_Function, ACol, ARow, CanSelect);end;
procedure TVCLuaControl.OnLuaDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
  begin DrawCellEventHandler(Sender, OnDrawCell_Function, ACol, ARow, Rect, State);end;
procedure TVCLuaControl.OnLuaGetEditText(Sender: TObject; ACol, ARow: Integer; var Value: string);
  begin GetEditTextEventHandler(Sender, OnGetEditText_Function, ACol, ARow, Value);end;
procedure TVCLuaControl.OnLuaGetEditMask(Sender: TObject; ACol, ARow: Integer; var Value: string);
  begin GetEditTextEventHandler(Sender, OnGetEditMask_Function, ACol, ARow, Value);end;
procedure TVCLuaControl.OnLuaSetEditText(Sender: TObject; ACol, ARow: Integer; const Value: string);
  begin SetEditTextEventHandler(Sender, OnSetEditText_Function, ACol, ARow, Value);end;
procedure TVCLuaControl.OnLuaColRowMoved(Sender: TObject; IsColumn: Boolean; FromIndex, ToIndex: Integer);
  begin GridOperationEventHandler(Sender, OnColRowMoved_Function, IsColumn, FromIndex, ToIndex);end;
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
  begin EndDragEventHandler(Sender, OnEndDock_Function, Target, X, Y); end;

// FindDialog
procedure TVCLuaControl.OnLuaFind(Sender: TObject);
  begin NotifyEventHandler(Sender, OnFind_Function);end;
procedure TVCLuaControl.OnLuaReplace(Sender: TObject);
  begin NotifyEventHandler(Sender, OnReplace_Function);end;

// SynEdit
(*
procedure TVCLuaControl.OnLuaReplaceText(Sender: TObject; const ASearch,AReplace: string; Line, Column: integer; var ReplaceAction: TSynReplaceAction);
begin ReplaceTextEventHandler(Sender, OnReplaceText_Function, ASearch, AReplace, Line, Column, ReplaceAction); end;
procedure TVCLuaControl.OnLuaCommandProcessed(Sender: TObject; var Command: TSynEditorCommand; var AChar: TUTF8Char; Data: pointer);
begin CommandProcessedEventHandler(Sender, OnCommandProcessed_Function, Command, AChar, Data); end;
procedure TVCLuaControl.OnLuaClickLink(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin ClickLinkEventHandler(Sender, OnClickLink_Function, Button, Shift, X, Y); end;
procedure TVCLuaControl.OnLuaMouseLink(Sender: TObject; X, Y: Integer; var AllowMouseLink: Boolean);
begin MouseLinkEventHandler(Sender, OnMouseLink_Function, X, Y, AllowMouseLink); end;
*)
// Listview
procedure TVCLuaControl.OnLuaColumnClick(Sender: TObject; Column: TListColumn);
begin ColumnClickEventHandler(Sender, OnColumnClick_Function, Column); end;
procedure TVCLuaControl.OnLuaSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
begin SelectItemEventHandler(Sender, OnSelectItem_Function, Item, Selected); end;

// TreeView
procedure TVCLuaControl.OnLuaEdited(Sender: TObject; Node: TTreeNode; var S: string);
begin EditedEventHandler(Sender,OnEdited_Function, Node, S); end;

procedure TVCLuaControl.OnLuaNodeChanged(Sender: TObject; Node: TTreeNode; ChangeReason: TTreeNodeChangeReason);
begin NodeChangedEventHandler(Sender, OnNodeChanged_Function, Node, ChangeReason); end;

procedure TVCLuaControl.OnLuaSelectionChanged(Sender: TObject);
begin NotifyEventHandler(Sender, OnSelectionChanged_Function);end;

// PropertyGrid
procedure TVCLuaControl.OnLuaModified(Sender: TObject);
begin NotifyEventHandler(Sender, OnModified_Function);end;

// CheckListBox
// TSelectionChangeEvent = procedure(Sender: TObject; User: boolean) of object;
procedure TVCLuaControl.OnLuaSelectionChangeEvent(Sender: TObject; User: boolean);
begin
    SelectionChangeEventHandler(Sender, OnSelectionChange_Function, User);
end;


end.

(*
type TContextPopupEvent = procedure(
  Sender: TObject;
  MousePos: TPoint;
  var Handled: Boolean
) of object;
*)
