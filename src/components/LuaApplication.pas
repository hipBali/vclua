(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaApplication;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaController, TypInfo, LuaVmt, Forms;

function CreateApplication(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TApplication; pti: PTypeInfo = nil); overload; inline;

type
    TLuaApplication = class(TApplication)
    end;
var
    ApplicationFuncs: TLuaVmt;
    ApplicationSets: TLuaVmt;

function TheApplication(L: Plua_State): Integer; cdecl;

implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, ActnList, Classes, Controls, Graphics, LuaActnListEvents, LuaClassesEvents, LuaControl, LuaEvent, LuaFormsEvents, LCLType;

function VCLua_Application_ActivateHint(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	CursorPos:TPoint;
	CheckHintControlChange:Boolean;
begin
	CheckArg(L, 2, 3);
	lApplication := TLuaApplication(CheckLuaObjectPop(L, 1));
	luaL_check(L,2,@CursorPos);
	TTrait<Boolean>.luaL_optcheck(L, 3, @CheckHintControlChange, False);
	try
		lApplication.ActivateHint(CursorPos,CheckHintControlChange);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Application', 'ActivateHint', E.ClassName, E.Message);
	end;
end;

function VCLua_Application_GetControlAtMouse(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	ret:TControl;
begin
	CheckArg(L, 1);
	lApplication := TLuaApplication(GetLuaObject(L, 1));
	try
		ret := lApplication.GetControlAtMouse();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Application', 'GetControlAtMouse', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Application_ControlDestroyed(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	AControl:TControl;
begin
	CheckArg(L, 2);
	lApplication := TLuaApplication(GetLuaObject(L, 1));
	luaL_check(L,2,@AControl);
	try
		lApplication.ControlDestroyed(AControl);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Application', 'ControlDestroyed', E.ClassName, E.Message);
	end;
end;

function VCLua_Application_BigIconHandle(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	ret:HIcon;
begin
	CheckArg(L, 1);
	lApplication := TLuaApplication(GetLuaObject(L, 1));
	try
		ret := lApplication.BigIconHandle();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Application', 'BigIconHandle', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Application_SmallIconHandle(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	ret:HIcon;
begin
	CheckArg(L, 1);
	lApplication := TLuaApplication(GetLuaObject(L, 1));
	try
		ret := lApplication.SmallIconHandle();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Application', 'SmallIconHandle', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Application_BringToFront(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
begin
	CheckArg(L, 1);
	lApplication := TLuaApplication(GetLuaObject(L, 1));
	try
		lApplication.BringToFront();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Application', 'BringToFront', E.ClassName, E.Message);
	end;
end;

function VCLua_Application_UpdateMainForm(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	AForm:TForm;
begin
	CheckArg(L, 2);
	lApplication := TLuaApplication(GetLuaObject(L, 1));
	luaL_check(L,2,@AForm);
	try
		lApplication.UpdateMainForm(AForm);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Application', 'UpdateMainForm', E.ClassName, E.Message);
	end;
end;

function VCLua_Application_ReleaseComponent(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	AComponent:TComponent;
begin
	CheckArg(L, 2);
	lApplication := TLuaApplication(GetLuaObject(L, 1));
	luaL_check(L,2,@AComponent);
	try
		lApplication.ReleaseComponent(AComponent);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Application', 'ReleaseComponent', E.ClassName, E.Message);
	end;
end;

function VCLua_Application_HandleMessage(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
begin
	CheckArg(L, 1);
	lApplication := TLuaApplication(GetLuaObject(L, 1));
	try
		lApplication.HandleMessage();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Application', 'HandleMessage', E.ClassName, E.Message);
	end;
end;

function VCLua_Application_RemoveStayOnTop(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	ASystemTopAlso:Boolean;
begin
	CheckArg(L, 1, 2);
	lApplication := TLuaApplication(CheckLuaObjectPop(L, 1));
	TTrait<Boolean>.luaL_optcheck(L, 2, @ASystemTopAlso, False);
	try
		lApplication.RemoveStayOnTop(ASystemTopAlso);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Application', 'RemoveStayOnTop', E.ClassName, E.Message);
	end;
end;

function VCLua_Application_RestoreStayOnTop(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	ASystemTopAlso:Boolean;
begin
	CheckArg(L, 1, 2);
	lApplication := TLuaApplication(CheckLuaObjectPop(L, 1));
	TTrait<Boolean>.luaL_optcheck(L, 2, @ASystemTopAlso, False);
	try
		lApplication.RestoreStayOnTop(ASystemTopAlso);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Application', 'RestoreStayOnTop', E.ClassName, E.Message);
	end;
end;

function VCLua_Application_IsWaiting(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	ret:boolean;
begin
	CheckArg(L, 1);
	lApplication := TLuaApplication(GetLuaObject(L, 1));
	try
		ret := lApplication.IsWaiting();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Application', 'IsWaiting', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Application_Minimize(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
begin
	CheckArg(L, 1);
	lApplication := TLuaApplication(GetLuaObject(L, 1));
	try
		lApplication.Minimize();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Application', 'Minimize', E.ClassName, E.Message);
	end;
end;

function VCLua_Application_ModalStarted(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
begin
	CheckArg(L, 1);
	lApplication := TLuaApplication(GetLuaObject(L, 1));
	try
		lApplication.ModalStarted();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Application', 'ModalStarted', E.ClassName, E.Message);
	end;
end;

function VCLua_Application_ModalFinished(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
begin
	CheckArg(L, 1);
	lApplication := TLuaApplication(GetLuaObject(L, 1));
	try
		lApplication.ModalFinished();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Application', 'ModalFinished', E.ClassName, E.Message);
	end;
end;

function VCLua_Application_Restore(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
begin
	CheckArg(L, 1);
	lApplication := TLuaApplication(GetLuaObject(L, 1));
	try
		lApplication.Restore();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Application', 'Restore', E.ClassName, E.Message);
	end;
end;

function VCLua_Application_Notification(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	AComponent:TComponent;
	Operation:TOperation;
begin
	CheckArg(L, 3);
	lApplication := TLuaApplication(GetLuaObject(L, 1));
	luaL_check(L,2,@AComponent);
	luaL_check(L,3,@Operation,TypeInfo(TOperation));
	try
		lApplication.Notification(AComponent,Operation);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Application', 'Notification', E.ClassName, E.Message);
	end;
end;

function VCLua_Application_ProcessMessages(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
begin
	CheckArg(L, 1);
	lApplication := TLuaApplication(GetLuaObject(L, 1));
	try
		lApplication.ProcessMessages();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Application', 'ProcessMessages', E.ClassName, E.Message);
	end;
end;

function VCLua_Application_Idle(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	Wait:Boolean;
begin
	CheckArg(L, 2);
	lApplication := TLuaApplication(GetLuaObject(L, 1));
	luaL_check(L,2,@Wait);
	try
		lApplication.Idle(Wait);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Application', 'Idle', E.ClassName, E.Message);
	end;
end;

function VCLua_Application_Run(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
begin
	CheckArg(L, 1);
	lApplication := TLuaApplication(GetLuaObject(L, 1));
	try
		lApplication.Run();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Application', 'Run', E.ClassName, E.Message);
	end;
end;

function VCLua_Application_VCLuaGetActive(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	ret:boolean;
begin
	lApplication := TLuaApplication(GetLuaObjectUnsafe(L, 1));
	try
		ret := lApplication.Active;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Application', 'GetActive', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Application_VCLuaSetApplicationType(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	val:TApplicationType;
begin
	lApplication := TLuaApplication(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val,TypeInfo(TApplicationType));
	try
		lApplication.ApplicationType := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Application', 'SetApplicationType', E.ClassName, E.Message);
	end;
end;

function VCLua_Application_VCLuaGetApplicationType(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	ret:TApplicationType;
begin
	lApplication := TLuaApplication(GetLuaObjectUnsafe(L, 1));
	try
		ret := lApplication.ApplicationType;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Application', 'GetApplicationType', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_Application_VCLuaSetBidiMode(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	val:TBiDiMode;
begin
	lApplication := TLuaApplication(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val,TypeInfo(TBiDiMode));
	try
		lApplication.BidiMode := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Application', 'SetBidiMode', E.ClassName, E.Message);
	end;
end;

function VCLua_Application_VCLuaGetBidiMode(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	ret:TBiDiMode;
begin
	lApplication := TLuaApplication(GetLuaObjectUnsafe(L, 1));
	try
		ret := lApplication.BidiMode;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Application', 'GetBidiMode', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_Application_VCLuaSetCaptureExceptions(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	val:boolean;
begin
	lApplication := TLuaApplication(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lApplication.CaptureExceptions := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Application', 'SetCaptureExceptions', E.ClassName, E.Message);
	end;
end;

function VCLua_Application_VCLuaGetCaptureExceptions(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	ret:boolean;
begin
	lApplication := TLuaApplication(GetLuaObjectUnsafe(L, 1));
	try
		ret := lApplication.CaptureExceptions;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Application', 'GetCaptureExceptions', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Application_VCLuaSetDoubleBuffered(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	val:TApplicationDoubleBuffered;
begin
	lApplication := TLuaApplication(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val,TypeInfo(TApplicationDoubleBuffered));
	try
		lApplication.DoubleBuffered := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Application', 'SetDoubleBuffered', E.ClassName, E.Message);
	end;
end;

function VCLua_Application_VCLuaGetDoubleBuffered(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	ret:TApplicationDoubleBuffered;
begin
	lApplication := TLuaApplication(GetLuaObjectUnsafe(L, 1));
	try
		ret := lApplication.DoubleBuffered;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Application', 'GetDoubleBuffered', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_Application_VCLuaSetExtendedKeysSupport(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	val:Boolean;
begin
	lApplication := TLuaApplication(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lApplication.ExtendedKeysSupport := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Application', 'SetExtendedKeysSupport', E.ClassName, E.Message);
	end;
end;

function VCLua_Application_VCLuaGetExtendedKeysSupport(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	ret:Boolean;
begin
	lApplication := TLuaApplication(GetLuaObjectUnsafe(L, 1));
	try
		ret := lApplication.ExtendedKeysSupport;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Application', 'GetExtendedKeysSupport', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Application_VCLuaSetExceptionDialog(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	val:TApplicationExceptionDlg;
begin
	lApplication := TLuaApplication(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val,TypeInfo(TApplicationExceptionDlg));
	try
		lApplication.ExceptionDialog := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Application', 'SetExceptionDialog', E.ClassName, E.Message);
	end;
end;

function VCLua_Application_VCLuaGetExceptionDialog(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	ret:TApplicationExceptionDlg;
begin
	lApplication := TLuaApplication(GetLuaObjectUnsafe(L, 1));
	try
		ret := lApplication.ExceptionDialog;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Application', 'GetExceptionDialog', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_Application_VCLuaSetFindGlobalComponentEnabled(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	val:boolean;
begin
	lApplication := TLuaApplication(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lApplication.FindGlobalComponentEnabled := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Application', 'SetFindGlobalComponentEnabled', E.ClassName, E.Message);
	end;
end;

function VCLua_Application_VCLuaGetFindGlobalComponentEnabled(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	ret:boolean;
begin
	lApplication := TLuaApplication(GetLuaObjectUnsafe(L, 1));
	try
		ret := lApplication.FindGlobalComponentEnabled;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Application', 'GetFindGlobalComponentEnabled', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Application_VCLuaSetFlags(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	val:TApplicationFlags;
begin
	lApplication := TLuaApplication(GetLuaObjectUnsafe(L, 1));
	luaL_checkSet(L,2,@val,TypeInfo(TApplicationFlags));
	try
		lApplication.Flags := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Application', 'SetFlags', E.ClassName, E.Message);
	end;
end;

function VCLua_Application_VCLuaGetFlags(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	ret:TApplicationFlags;
begin
	lApplication := TLuaApplication(GetLuaObjectUnsafe(L, 1));
	try
		ret := lApplication.Flags;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Application', 'GetFlags', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_Application_VCLuaSetHandle(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	val:THandle;
begin
	lApplication := TLuaApplication(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lApplication.Handle := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Application', 'SetHandle', E.ClassName, E.Message);
	end;
end;

function VCLua_Application_VCLuaGetHandle(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	ret:THandle;
begin
	lApplication := TLuaApplication(GetLuaObjectUnsafe(L, 1));
	try
		ret := lApplication.Handle;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Application', 'GetHandle', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Application_VCLuaSetHint(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	val:string;
begin
	lApplication := TLuaApplication(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lApplication.Hint := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Application', 'SetHint', E.ClassName, E.Message);
	end;
end;

function VCLua_Application_VCLuaGetHint(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	ret:string;
begin
	lApplication := TLuaApplication(GetLuaObjectUnsafe(L, 1));
	try
		ret := lApplication.Hint;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Application', 'GetHint', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Application_VCLuaSetHintColor(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	val:TColor;
begin
	lApplication := TLuaApplication(GetLuaObjectUnsafe(L, 1));
	val := luaL_checkColor(L,2);
	try
		lApplication.HintColor := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Application', 'SetHintColor', E.ClassName, E.Message);
	end;
end;

function VCLua_Application_VCLuaGetHintColor(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	ret:TColor;
begin
	lApplication := TLuaApplication(GetLuaObjectUnsafe(L, 1));
	try
		ret := lApplication.HintColor;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Application', 'GetHintColor', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Application_VCLuaSetHintHidePause(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	val:Integer;
begin
	lApplication := TLuaApplication(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lApplication.HintHidePause := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Application', 'SetHintHidePause', E.ClassName, E.Message);
	end;
end;

function VCLua_Application_VCLuaGetHintHidePause(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	ret:Integer;
begin
	lApplication := TLuaApplication(GetLuaObjectUnsafe(L, 1));
	try
		ret := lApplication.HintHidePause;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Application', 'GetHintHidePause', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Application_VCLuaSetHintHidePausePerChar(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	val:Integer;
begin
	lApplication := TLuaApplication(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lApplication.HintHidePausePerChar := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Application', 'SetHintHidePausePerChar', E.ClassName, E.Message);
	end;
end;

function VCLua_Application_VCLuaGetHintHidePausePerChar(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	ret:Integer;
begin
	lApplication := TLuaApplication(GetLuaObjectUnsafe(L, 1));
	try
		ret := lApplication.HintHidePausePerChar;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Application', 'GetHintHidePausePerChar', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Application_VCLuaSetHintPause(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	val:Integer;
begin
	lApplication := TLuaApplication(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lApplication.HintPause := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Application', 'SetHintPause', E.ClassName, E.Message);
	end;
end;

function VCLua_Application_VCLuaGetHintPause(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	ret:Integer;
begin
	lApplication := TLuaApplication(GetLuaObjectUnsafe(L, 1));
	try
		ret := lApplication.HintPause;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Application', 'GetHintPause', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Application_VCLuaSetHintShortCuts(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	val:Boolean;
begin
	lApplication := TLuaApplication(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lApplication.HintShortCuts := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Application', 'SetHintShortCuts', E.ClassName, E.Message);
	end;
end;

function VCLua_Application_VCLuaGetHintShortCuts(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	ret:Boolean;
begin
	lApplication := TLuaApplication(GetLuaObjectUnsafe(L, 1));
	try
		ret := lApplication.HintShortCuts;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Application', 'GetHintShortCuts', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Application_VCLuaSetHintShortPause(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	val:Integer;
begin
	lApplication := TLuaApplication(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lApplication.HintShortPause := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Application', 'SetHintShortPause', E.ClassName, E.Message);
	end;
end;

function VCLua_Application_VCLuaGetHintShortPause(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	ret:Integer;
begin
	lApplication := TLuaApplication(GetLuaObjectUnsafe(L, 1));
	try
		ret := lApplication.HintShortPause;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Application', 'GetHintShortPause', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Application_VCLuaSetIcon(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	val:TIcon;
begin
	lApplication := TLuaApplication(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lApplication.Icon := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Application', 'SetIcon', E.ClassName, E.Message);
	end;
end;

function VCLua_Application_VCLuaGetIcon(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	ret:TIcon;
begin
	lApplication := TLuaApplication(GetLuaObjectUnsafe(L, 1));
	try
		ret := lApplication.Icon;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Application', 'GetIcon', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_Application_VCLuaSetLayoutAdjustmentPolicy(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	val:TLayoutAdjustmentPolicy;
begin
	lApplication := TLuaApplication(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val,TypeInfo(TLayoutAdjustmentPolicy));
	try
		lApplication.LayoutAdjustmentPolicy := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Application', 'SetLayoutAdjustmentPolicy', E.ClassName, E.Message);
	end;
end;

function VCLua_Application_VCLuaGetLayoutAdjustmentPolicy(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	ret:TLayoutAdjustmentPolicy;
begin
	lApplication := TLuaApplication(GetLuaObjectUnsafe(L, 1));
	try
		ret := lApplication.LayoutAdjustmentPolicy;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Application', 'GetLayoutAdjustmentPolicy', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_Application_VCLuaSetNavigation(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	val:TApplicationNavigationOptions;
begin
	lApplication := TLuaApplication(GetLuaObjectUnsafe(L, 1));
	luaL_checkSet(L,2,@val,TypeInfo(TApplicationNavigationOptions));
	try
		lApplication.Navigation := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Application', 'SetNavigation', E.ClassName, E.Message);
	end;
end;

function VCLua_Application_VCLuaGetNavigation(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	ret:TApplicationNavigationOptions;
begin
	lApplication := TLuaApplication(GetLuaObjectUnsafe(L, 1));
	try
		ret := lApplication.Navigation;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Application', 'GetNavigation', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_Application_VCLuaGetMainForm(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	ret:TForm;
begin
	lApplication := TLuaApplication(GetLuaObjectUnsafe(L, 1));
	try
		ret := lApplication.MainForm;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Application', 'GetMainForm', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Application_VCLuaGetMainFormHandle(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	ret:HWND;
begin
	lApplication := TLuaApplication(GetLuaObjectUnsafe(L, 1));
	try
		ret := lApplication.MainFormHandle;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Application', 'GetMainFormHandle', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Application_VCLuaSetMainFormOnTaskBar(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	val:Boolean;
begin
	lApplication := TLuaApplication(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lApplication.MainFormOnTaskBar := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Application', 'SetMainFormOnTaskBar', E.ClassName, E.Message);
	end;
end;

function VCLua_Application_VCLuaGetMainFormOnTaskBar(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	ret:Boolean;
begin
	lApplication := TLuaApplication(GetLuaObjectUnsafe(L, 1));
	try
		ret := lApplication.MainFormOnTaskBar;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Application', 'GetMainFormOnTaskBar', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Application_VCLuaGetModalLevel(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	ret:Integer;
begin
	lApplication := TLuaApplication(GetLuaObjectUnsafe(L, 1));
	try
		ret := lApplication.ModalLevel;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Application', 'GetModalLevel', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Application_VCLuaSetMoveFormFocusToChildren(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	val:Boolean;
begin
	lApplication := TLuaApplication(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lApplication.MoveFormFocusToChildren := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Application', 'SetMoveFormFocusToChildren', E.ClassName, E.Message);
	end;
end;

function VCLua_Application_VCLuaGetMoveFormFocusToChildren(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	ret:Boolean;
begin
	lApplication := TLuaApplication(GetLuaObjectUnsafe(L, 1));
	try
		ret := lApplication.MoveFormFocusToChildren;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Application', 'GetMoveFormFocusToChildren', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Application_VCLuaGetMouseControl(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	ret:TControl;
begin
	lApplication := TLuaApplication(GetLuaObjectUnsafe(L, 1));
	try
		ret := lApplication.MouseControl;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Application', 'GetMouseControl', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Application_VCLuaSetTaskBarBehavior(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	val:TTaskBarBehavior;
begin
	lApplication := TLuaApplication(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val,TypeInfo(TTaskBarBehavior));
	try
		lApplication.TaskBarBehavior := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Application', 'SetTaskBarBehavior', E.ClassName, E.Message);
	end;
end;

function VCLua_Application_VCLuaGetTaskBarBehavior(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	ret:TTaskBarBehavior;
begin
	lApplication := TLuaApplication(GetLuaObjectUnsafe(L, 1));
	try
		ret := lApplication.TaskBarBehavior;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Application', 'GetTaskBarBehavior', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_Application_VCLuaSetUpdateFormatSettings(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	val:Boolean;
begin
	lApplication := TLuaApplication(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lApplication.UpdateFormatSettings := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Application', 'SetUpdateFormatSettings', E.ClassName, E.Message);
	end;
end;

function VCLua_Application_VCLuaGetUpdateFormatSettings(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	ret:Boolean;
begin
	lApplication := TLuaApplication(GetLuaObjectUnsafe(L, 1));
	try
		ret := lApplication.UpdateFormatSettings;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Application', 'GetUpdateFormatSettings', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Application_VCLuaSetOnActionExecute(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
begin
	lApplication := TLuaApplication(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lApplication.OnActionExecute));
	lApplication.OnActionExecute := TLuaEvent.Factory<TActionEvent,TLuaActionEvent>(L);
	Result := 0;
end;

function VCLua_Application_VCLuaSetOnActionUpdate(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
begin
	lApplication := TLuaApplication(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lApplication.OnActionUpdate));
	lApplication.OnActionUpdate := TLuaEvent.Factory<TActionEvent,TLuaActionEvent>(L);
	Result := 0;
end;

function VCLua_Application_VCLuaSetOnActivate(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
begin
	lApplication := TLuaApplication(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lApplication.OnActivate));
	lApplication.OnActivate := TLuaEvent.Factory<TNotifyEvent,TLuaNotifyEvent>(L);
	Result := 0;
end;

function VCLua_Application_VCLuaSetOnDeactivate(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
begin
	lApplication := TLuaApplication(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lApplication.OnDeactivate));
	lApplication.OnDeactivate := TLuaEvent.Factory<TNotifyEvent,TLuaNotifyEvent>(L);
	Result := 0;
end;

function VCLua_Application_VCLuaSetOnGetMainFormHandle(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
begin
	lApplication := TLuaApplication(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lApplication.OnGetMainFormHandle));
	lApplication.OnGetMainFormHandle := TLuaEvent.Factory<TGetHandleEvent,TLuaGetHandleEvent>(L);
	Result := 0;
end;

function VCLua_Application_VCLuaSetOnIdle(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
begin
	lApplication := TLuaApplication(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lApplication.OnIdle));
	lApplication.OnIdle := TLuaEvent.Factory<TIdleEvent,TLuaIdleEvent>(L);
	Result := 0;
end;

function VCLua_Application_VCLuaSetOnIdleEnd(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
begin
	lApplication := TLuaApplication(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lApplication.OnIdleEnd));
	lApplication.OnIdleEnd := TLuaEvent.Factory<TNotifyEvent,TLuaNotifyEvent>(L);
	Result := 0;
end;

function VCLua_Application_VCLuaSetOnEndSession(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
begin
	lApplication := TLuaApplication(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lApplication.OnEndSession));
	lApplication.OnEndSession := TLuaEvent.Factory<TNotifyEvent,TLuaNotifyEvent>(L);
	Result := 0;
end;

function VCLua_Application_VCLuaSetOnQueryEndSession(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
begin
	lApplication := TLuaApplication(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lApplication.OnQueryEndSession));
	lApplication.OnQueryEndSession := TLuaEvent.Factory<TQueryEndSessionEvent,TLuaQueryEndSessionEvent>(L);
	Result := 0;
end;

function VCLua_Application_VCLuaSetOnMinimize(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
begin
	lApplication := TLuaApplication(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lApplication.OnMinimize));
	lApplication.OnMinimize := TLuaEvent.Factory<TNotifyEvent,TLuaNotifyEvent>(L);
	Result := 0;
end;

function VCLua_Application_VCLuaSetOnMessageDialogFinished(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
begin
	lApplication := TLuaApplication(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lApplication.OnMessageDialogFinished));
	lApplication.OnMessageDialogFinished := TLuaEvent.Factory<TModalDialogFinished,TLuaModalDialogFinished>(L);
	Result := 0;
end;

function VCLua_Application_VCLuaSetOnModalBegin(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
begin
	lApplication := TLuaApplication(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lApplication.OnModalBegin));
	lApplication.OnModalBegin := TLuaEvent.Factory<TNotifyEvent,TLuaNotifyEvent>(L);
	Result := 0;
end;

function VCLua_Application_VCLuaSetOnModalEnd(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
begin
	lApplication := TLuaApplication(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lApplication.OnModalEnd));
	lApplication.OnModalEnd := TLuaEvent.Factory<TNotifyEvent,TLuaNotifyEvent>(L);
	Result := 0;
end;

function VCLua_Application_VCLuaSetOnRestore(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
begin
	lApplication := TLuaApplication(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lApplication.OnRestore));
	lApplication.OnRestore := TLuaEvent.Factory<TNotifyEvent,TLuaNotifyEvent>(L);
	Result := 0;
end;

function VCLua_Application_VCLuaSetOnDropFiles(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
begin
	lApplication := TLuaApplication(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lApplication.OnDropFiles));
	lApplication.OnDropFiles := TLuaEvent.Factory<TDropFilesEvent,TLuaDropFilesEvent>(L);
	Result := 0;
end;

function VCLua_Application_VCLuaSetOnHint(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
begin
	lApplication := TLuaApplication(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lApplication.OnHint));
	lApplication.OnHint := TLuaEvent.Factory<TNotifyEvent,TLuaNotifyEvent>(L);
	Result := 0;
end;

function VCLua_Application_VCLuaSetOnUserInput(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
begin
	lApplication := TLuaApplication(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lApplication.OnUserInput));
	lApplication.OnUserInput := TLuaEvent.Factory<TOnUserInputEvent,TLuaOnUserInputEvent>(L);
	Result := 0;
end;

function VCLua_Application_VCLuaSetOnDestroy(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
begin
	lApplication := TLuaApplication(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lApplication.OnDestroy));
	lApplication.OnDestroy := TLuaEvent.Factory<TNotifyEvent,TLuaNotifyEvent>(L);
	Result := 0;
end;

function VCLua_Application_VCLuaSetOnCircularException(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
begin
	lApplication := TLuaApplication(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lApplication.OnCircularException));
	lApplication.OnCircularException := TLuaEvent.Factory<TExceptionEvent,TLuaExceptionEvent>(L);
	Result := 0;
end;

function VCLua_Application_VCLuaSetShowButtonGlyphs(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	val:TApplicationShowGlyphs;
begin
	lApplication := TLuaApplication(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val,TypeInfo(TApplicationShowGlyphs));
	try
		lApplication.ShowButtonGlyphs := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Application', 'SetShowButtonGlyphs', E.ClassName, E.Message);
	end;
end;

function VCLua_Application_VCLuaGetShowButtonGlyphs(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	ret:TApplicationShowGlyphs;
begin
	lApplication := TLuaApplication(GetLuaObjectUnsafe(L, 1));
	try
		ret := lApplication.ShowButtonGlyphs;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Application', 'GetShowButtonGlyphs', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_Application_VCLuaSetShowMenuGlyphs(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	val:TApplicationShowGlyphs;
begin
	lApplication := TLuaApplication(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val,TypeInfo(TApplicationShowGlyphs));
	try
		lApplication.ShowMenuGlyphs := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Application', 'SetShowMenuGlyphs', E.ClassName, E.Message);
	end;
end;

function VCLua_Application_VCLuaGetShowMenuGlyphs(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	ret:TApplicationShowGlyphs;
begin
	lApplication := TLuaApplication(GetLuaObjectUnsafe(L, 1));
	try
		ret := lApplication.ShowMenuGlyphs;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Application', 'GetShowMenuGlyphs', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_Application_VCLuaSetShowHint(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	val:Boolean;
begin
	lApplication := TLuaApplication(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lApplication.ShowHint := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Application', 'SetShowHint', E.ClassName, E.Message);
	end;
end;

function VCLua_Application_VCLuaGetShowHint(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	ret:Boolean;
begin
	lApplication := TLuaApplication(GetLuaObjectUnsafe(L, 1));
	try
		ret := lApplication.ShowHint;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Application', 'GetShowHint', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Application_VCLuaSetShowMainForm(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	val:Boolean;
begin
	lApplication := TLuaApplication(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lApplication.ShowMainForm := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Application', 'SetShowMainForm', E.ClassName, E.Message);
	end;
end;

function VCLua_Application_VCLuaGetShowMainForm(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	ret:Boolean;
begin
	lApplication := TLuaApplication(GetLuaObjectUnsafe(L, 1));
	try
		ret := lApplication.ShowMainForm;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Application', 'GetShowMainForm', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Application_VCLuaSetTitle(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	val:String;
begin
	lApplication := TLuaApplication(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lApplication.Title := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Application', 'SetTitle', E.ClassName, E.Message);
	end;
end;

function VCLua_Application_VCLuaGetTitle(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	ret:String;
begin
	lApplication := TLuaApplication(GetLuaObjectUnsafe(L, 1));
	try
		ret := lApplication.Title;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Application', 'GetTitle', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Application_VCLuaSetScaled(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	val:Boolean;
begin
	lApplication := TLuaApplication(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lApplication.Scaled := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Application', 'SetScaled', E.ClassName, E.Message);
	end;
end;

function VCLua_Application_VCLuaGetScaled(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	ret:Boolean;
begin
	lApplication := TLuaApplication(GetLuaObjectUnsafe(L, 1));
	try
		ret := lApplication.Scaled;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Application', 'GetScaled', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function TheApplication(L: Plua_State): Integer; cdecl;
begin
	lua_push(L,Application);
	Result := 1;
end;
procedure lua_push(L: Plua_State; const v: TApplication; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TApplication',v);
end;
function CreateApplication(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	Parent:TWinControl;
	Name:String;
begin
	try
	GetControlParents(L,TWinControl(Parent),Name);
	lApplication := TLuaApplication.Create(Parent);
	// := TWinControl(Parent);
	CreateTableForKnownType(L,'TApplication',lApplication);
	InitControl(L,lApplication,Name);
	Result := 1;
	except
		on E: Exception do
			CallError(L, 'VCL', 'Application', E.ClassName, E.Message);
	end;
end;

begin
	ApplicationFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(ApplicationFuncs, 'ActivateHint', @VCLua_Application_ActivateHint);
	TLuaMethodInfo.Create(ApplicationFuncs, 'GetControlAtMouse', @VCLua_Application_GetControlAtMouse);
	TLuaMethodInfo.Create(ApplicationFuncs, 'ControlDestroyed', @VCLua_Application_ControlDestroyed);
	TLuaMethodInfo.Create(ApplicationFuncs, 'BigIconHandle', @VCLua_Application_BigIconHandle);
	TLuaMethodInfo.Create(ApplicationFuncs, 'SmallIconHandle', @VCLua_Application_SmallIconHandle);
	TLuaMethodInfo.Create(ApplicationFuncs, 'BringToFront', @VCLua_Application_BringToFront);
	TLuaMethodInfo.Create(ApplicationFuncs, 'UpdateMainForm', @VCLua_Application_UpdateMainForm);
	TLuaMethodInfo.Create(ApplicationFuncs, 'ReleaseComponent', @VCLua_Application_ReleaseComponent);
	TLuaMethodInfo.Create(ApplicationFuncs, 'HandleMessage', @VCLua_Application_HandleMessage);
	TLuaMethodInfo.Create(ApplicationFuncs, 'RemoveStayOnTop', @VCLua_Application_RemoveStayOnTop);
	TLuaMethodInfo.Create(ApplicationFuncs, 'RestoreStayOnTop', @VCLua_Application_RestoreStayOnTop);
	TLuaMethodInfo.Create(ApplicationFuncs, 'IsWaiting', @VCLua_Application_IsWaiting);
	TLuaMethodInfo.Create(ApplicationFuncs, 'Minimize', @VCLua_Application_Minimize);
	TLuaMethodInfo.Create(ApplicationFuncs, 'ModalStarted', @VCLua_Application_ModalStarted);
	TLuaMethodInfo.Create(ApplicationFuncs, 'ModalFinished', @VCLua_Application_ModalFinished);
	TLuaMethodInfo.Create(ApplicationFuncs, 'Restore', @VCLua_Application_Restore);
	TLuaMethodInfo.Create(ApplicationFuncs, 'Notification', @VCLua_Application_Notification);
	TLuaMethodInfo.Create(ApplicationFuncs, 'ProcessMessages', @VCLua_Application_ProcessMessages);
	TLuaMethodInfo.Create(ApplicationFuncs, 'Idle', @VCLua_Application_Idle);
	TLuaMethodInfo.Create(ApplicationFuncs, 'Run', @VCLua_Application_Run);
	TLuaMethodInfo.Create(ApplicationFuncs, 'Active', @VCLua_Application_VCLuaGetActive, mfCall);
	TLuaMethodInfo.Create(ApplicationFuncs, 'ApplicationType', @VCLua_Application_VCLuaGetApplicationType, mfCall);
	TLuaMethodInfo.Create(ApplicationFuncs, 'BidiMode', @VCLua_Application_VCLuaGetBidiMode, mfCall);
	TLuaMethodInfo.Create(ApplicationFuncs, 'CaptureExceptions', @VCLua_Application_VCLuaGetCaptureExceptions, mfCall);
	TLuaMethodInfo.Create(ApplicationFuncs, 'DoubleBuffered', @VCLua_Application_VCLuaGetDoubleBuffered, mfCall);
	TLuaMethodInfo.Create(ApplicationFuncs, 'ExtendedKeysSupport', @VCLua_Application_VCLuaGetExtendedKeysSupport, mfCall);
	TLuaMethodInfo.Create(ApplicationFuncs, 'ExceptionDialog', @VCLua_Application_VCLuaGetExceptionDialog, mfCall);
	TLuaMethodInfo.Create(ApplicationFuncs, 'FindGlobalComponentEnabled', @VCLua_Application_VCLuaGetFindGlobalComponentEnabled, mfCall);
	TLuaMethodInfo.Create(ApplicationFuncs, 'Flags', @VCLua_Application_VCLuaGetFlags, mfCall);
	TLuaMethodInfo.Create(ApplicationFuncs, 'Handle', @VCLua_Application_VCLuaGetHandle, mfCall);
	TLuaMethodInfo.Create(ApplicationFuncs, 'Hint', @VCLua_Application_VCLuaGetHint, mfCall);
	TLuaMethodInfo.Create(ApplicationFuncs, 'HintColor', @VCLua_Application_VCLuaGetHintColor, mfCall);
	TLuaMethodInfo.Create(ApplicationFuncs, 'HintHidePause', @VCLua_Application_VCLuaGetHintHidePause, mfCall);
	TLuaMethodInfo.Create(ApplicationFuncs, 'HintHidePausePerChar', @VCLua_Application_VCLuaGetHintHidePausePerChar, mfCall);
	TLuaMethodInfo.Create(ApplicationFuncs, 'HintPause', @VCLua_Application_VCLuaGetHintPause, mfCall);
	TLuaMethodInfo.Create(ApplicationFuncs, 'HintShortCuts', @VCLua_Application_VCLuaGetHintShortCuts, mfCall);
	TLuaMethodInfo.Create(ApplicationFuncs, 'HintShortPause', @VCLua_Application_VCLuaGetHintShortPause, mfCall);
	TLuaMethodInfo.Create(ApplicationFuncs, 'Icon', @VCLua_Application_VCLuaGetIcon, mfCall);
	TLuaMethodInfo.Create(ApplicationFuncs, 'LayoutAdjustmentPolicy', @VCLua_Application_VCLuaGetLayoutAdjustmentPolicy, mfCall);
	TLuaMethodInfo.Create(ApplicationFuncs, 'Navigation', @VCLua_Application_VCLuaGetNavigation, mfCall);
	TLuaMethodInfo.Create(ApplicationFuncs, 'MainForm', @VCLua_Application_VCLuaGetMainForm, mfCall);
	TLuaMethodInfo.Create(ApplicationFuncs, 'MainFormHandle', @VCLua_Application_VCLuaGetMainFormHandle, mfCall);
	TLuaMethodInfo.Create(ApplicationFuncs, 'MainFormOnTaskBar', @VCLua_Application_VCLuaGetMainFormOnTaskBar, mfCall);
	TLuaMethodInfo.Create(ApplicationFuncs, 'ModalLevel', @VCLua_Application_VCLuaGetModalLevel, mfCall);
	TLuaMethodInfo.Create(ApplicationFuncs, 'MoveFormFocusToChildren', @VCLua_Application_VCLuaGetMoveFormFocusToChildren, mfCall);
	TLuaMethodInfo.Create(ApplicationFuncs, 'MouseControl', @VCLua_Application_VCLuaGetMouseControl, mfCall);
	TLuaMethodInfo.Create(ApplicationFuncs, 'TaskBarBehavior', @VCLua_Application_VCLuaGetTaskBarBehavior, mfCall);
	TLuaMethodInfo.Create(ApplicationFuncs, 'UpdateFormatSettings', @VCLua_Application_VCLuaGetUpdateFormatSettings, mfCall);
	TLuaMethodInfo.Create(ApplicationFuncs, 'ShowButtonGlyphs', @VCLua_Application_VCLuaGetShowButtonGlyphs, mfCall);
	TLuaMethodInfo.Create(ApplicationFuncs, 'ShowMenuGlyphs', @VCLua_Application_VCLuaGetShowMenuGlyphs, mfCall);
	TLuaMethodInfo.Create(ApplicationFuncs, 'ShowHint', @VCLua_Application_VCLuaGetShowHint, mfCall);
	TLuaMethodInfo.Create(ApplicationFuncs, 'ShowMainForm', @VCLua_Application_VCLuaGetShowMainForm, mfCall);
	TLuaMethodInfo.Create(ApplicationFuncs, 'Title', @VCLua_Application_VCLuaGetTitle, mfCall);
	TLuaMethodInfo.Create(ApplicationFuncs, 'Scaled', @VCLua_Application_VCLuaGetScaled, mfCall);
	ApplicationSets := TLuaVmt.Create;
	TLuaMethodInfo.Create(ApplicationSets, 'ApplicationType', @VCLua_Application_VCLuaSetApplicationType, mfCall, TypeInfo(TApplicationType));
	TLuaMethodInfo.Create(ApplicationSets, 'BidiMode', @VCLua_Application_VCLuaSetBidiMode, mfCall, TypeInfo(TBiDiMode));
	TLuaMethodInfo.Create(ApplicationSets, 'CaptureExceptions', @VCLua_Application_VCLuaSetCaptureExceptions, mfCall, TypeInfo(boolean));
	TLuaMethodInfo.Create(ApplicationSets, 'DoubleBuffered', @VCLua_Application_VCLuaSetDoubleBuffered, mfCall, TypeInfo(TApplicationDoubleBuffered));
	TLuaMethodInfo.Create(ApplicationSets, 'ExtendedKeysSupport', @VCLua_Application_VCLuaSetExtendedKeysSupport, mfCall, TypeInfo(Boolean));
	TLuaMethodInfo.Create(ApplicationSets, 'ExceptionDialog', @VCLua_Application_VCLuaSetExceptionDialog, mfCall, TypeInfo(TApplicationExceptionDlg));
	TLuaMethodInfo.Create(ApplicationSets, 'FindGlobalComponentEnabled', @VCLua_Application_VCLuaSetFindGlobalComponentEnabled, mfCall, TypeInfo(boolean));
	TLuaMethodInfo.Create(ApplicationSets, 'Flags', @VCLua_Application_VCLuaSetFlags, mfCall, TypeInfo(TApplicationFlags));
	TLuaMethodInfo.Create(ApplicationSets, 'Handle', @VCLua_Application_VCLuaSetHandle, mfCall, TypeInfo(THandle));
	TLuaMethodInfo.Create(ApplicationSets, 'Hint', @VCLua_Application_VCLuaSetHint, mfCall, TypeInfo(string));
	TLuaMethodInfo.Create(ApplicationSets, 'HintColor', @VCLua_Application_VCLuaSetHintColor, mfCall, TypeInfo(TColor));
	TLuaMethodInfo.Create(ApplicationSets, 'HintHidePause', @VCLua_Application_VCLuaSetHintHidePause, mfCall, TypeInfo(Integer));
	TLuaMethodInfo.Create(ApplicationSets, 'HintHidePausePerChar', @VCLua_Application_VCLuaSetHintHidePausePerChar, mfCall, TypeInfo(Integer));
	TLuaMethodInfo.Create(ApplicationSets, 'HintPause', @VCLua_Application_VCLuaSetHintPause, mfCall, TypeInfo(Integer));
	TLuaMethodInfo.Create(ApplicationSets, 'HintShortCuts', @VCLua_Application_VCLuaSetHintShortCuts, mfCall, TypeInfo(Boolean));
	TLuaMethodInfo.Create(ApplicationSets, 'HintShortPause', @VCLua_Application_VCLuaSetHintShortPause, mfCall, TypeInfo(Integer));
	TLuaMethodInfo.Create(ApplicationSets, 'Icon', @VCLua_Application_VCLuaSetIcon, mfCall, TypeInfo(TIcon));
	TLuaMethodInfo.Create(ApplicationSets, 'LayoutAdjustmentPolicy', @VCLua_Application_VCLuaSetLayoutAdjustmentPolicy, mfCall, TypeInfo(TLayoutAdjustmentPolicy));
	TLuaMethodInfo.Create(ApplicationSets, 'Navigation', @VCLua_Application_VCLuaSetNavigation, mfCall, TypeInfo(TApplicationNavigationOptions));
	TLuaMethodInfo.Create(ApplicationSets, 'MainFormOnTaskBar', @VCLua_Application_VCLuaSetMainFormOnTaskBar, mfCall, TypeInfo(Boolean));
	TLuaMethodInfo.Create(ApplicationSets, 'MoveFormFocusToChildren', @VCLua_Application_VCLuaSetMoveFormFocusToChildren, mfCall, TypeInfo(Boolean));
	TLuaMethodInfo.Create(ApplicationSets, 'TaskBarBehavior', @VCLua_Application_VCLuaSetTaskBarBehavior, mfCall, TypeInfo(TTaskBarBehavior));
	TLuaMethodInfo.Create(ApplicationSets, 'UpdateFormatSettings', @VCLua_Application_VCLuaSetUpdateFormatSettings, mfCall, TypeInfo(Boolean));
	TLuaMethodInfo.Create(ApplicationSets, 'OnActionExecute', @VCLua_Application_VCLuaSetOnActionExecute, mfCall, TypeInfo(TActionEvent));
	TLuaMethodInfo.Create(ApplicationSets, 'OnActionUpdate', @VCLua_Application_VCLuaSetOnActionUpdate, mfCall, TypeInfo(TActionEvent));
	TLuaMethodInfo.Create(ApplicationSets, 'OnActivate', @VCLua_Application_VCLuaSetOnActivate, mfCall, TypeInfo(TNotifyEvent));
	TLuaMethodInfo.Create(ApplicationSets, 'OnDeactivate', @VCLua_Application_VCLuaSetOnDeactivate, mfCall, TypeInfo(TNotifyEvent));
	TLuaMethodInfo.Create(ApplicationSets, 'OnGetMainFormHandle', @VCLua_Application_VCLuaSetOnGetMainFormHandle, mfCall, TypeInfo(TGetHandleEvent));
	TLuaMethodInfo.Create(ApplicationSets, 'OnIdle', @VCLua_Application_VCLuaSetOnIdle, mfCall, TypeInfo(TIdleEvent));
	TLuaMethodInfo.Create(ApplicationSets, 'OnIdleEnd', @VCLua_Application_VCLuaSetOnIdleEnd, mfCall, TypeInfo(TNotifyEvent));
	TLuaMethodInfo.Create(ApplicationSets, 'OnEndSession', @VCLua_Application_VCLuaSetOnEndSession, mfCall, TypeInfo(TNotifyEvent));
	TLuaMethodInfo.Create(ApplicationSets, 'OnQueryEndSession', @VCLua_Application_VCLuaSetOnQueryEndSession, mfCall, TypeInfo(TQueryEndSessionEvent));
	TLuaMethodInfo.Create(ApplicationSets, 'OnMinimize', @VCLua_Application_VCLuaSetOnMinimize, mfCall, TypeInfo(TNotifyEvent));
	TLuaMethodInfo.Create(ApplicationSets, 'OnMessageDialogFinished', @VCLua_Application_VCLuaSetOnMessageDialogFinished, mfCall, TypeInfo(TModalDialogFinished));
	TLuaMethodInfo.Create(ApplicationSets, 'OnModalBegin', @VCLua_Application_VCLuaSetOnModalBegin, mfCall, TypeInfo(TNotifyEvent));
	TLuaMethodInfo.Create(ApplicationSets, 'OnModalEnd', @VCLua_Application_VCLuaSetOnModalEnd, mfCall, TypeInfo(TNotifyEvent));
	TLuaMethodInfo.Create(ApplicationSets, 'OnRestore', @VCLua_Application_VCLuaSetOnRestore, mfCall, TypeInfo(TNotifyEvent));
	TLuaMethodInfo.Create(ApplicationSets, 'OnDropFiles', @VCLua_Application_VCLuaSetOnDropFiles, mfCall, TypeInfo(TDropFilesEvent));
	TLuaMethodInfo.Create(ApplicationSets, 'OnHint', @VCLua_Application_VCLuaSetOnHint, mfCall, TypeInfo(TNotifyEvent));
	TLuaMethodInfo.Create(ApplicationSets, 'OnUserInput', @VCLua_Application_VCLuaSetOnUserInput, mfCall, TypeInfo(TOnUserInputEvent));
	TLuaMethodInfo.Create(ApplicationSets, 'OnDestroy', @VCLua_Application_VCLuaSetOnDestroy, mfCall, TypeInfo(TNotifyEvent));
	TLuaMethodInfo.Create(ApplicationSets, 'OnCircularException', @VCLua_Application_VCLuaSetOnCircularException, mfCall, TypeInfo(TExceptionEvent));
	TLuaMethodInfo.Create(ApplicationSets, 'ShowButtonGlyphs', @VCLua_Application_VCLuaSetShowButtonGlyphs, mfCall, TypeInfo(TApplicationShowGlyphs));
	TLuaMethodInfo.Create(ApplicationSets, 'ShowMenuGlyphs', @VCLua_Application_VCLuaSetShowMenuGlyphs, mfCall, TypeInfo(TApplicationShowGlyphs));
	TLuaMethodInfo.Create(ApplicationSets, 'ShowHint', @VCLua_Application_VCLuaSetShowHint, mfCall, TypeInfo(Boolean));
	TLuaMethodInfo.Create(ApplicationSets, 'ShowMainForm', @VCLua_Application_VCLuaSetShowMainForm, mfCall, TypeInfo(Boolean));
	TLuaMethodInfo.Create(ApplicationSets, 'Title', @VCLua_Application_VCLuaSetTitle, mfCall, TypeInfo(String));
	TLuaMethodInfo.Create(ApplicationSets, 'Scaled', @VCLua_Application_VCLuaSetScaled, mfCall, TypeInfo(Boolean));
end.
