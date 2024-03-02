(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaApplication;	

{$MODE Delphi}{$T+}

interface

Uses Classes, Lua, LuaController, Forms, TypInfo, LuaVmt;

function CreateApplication(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TApplication; pti: PTypeInfo = nil); overload; inline;

type
    TLuaApplication = class(TApplication)
        LuaCtl: TVCLuaControl;
    end;
var
    ApplicationFuncs: TLuaVmt;
    ApplicationSets: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Controls, Graphics, LCLType, LuaControl;

function VCLua_Application_ActivateHint(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	CursorPos:TPoint;
	CheckHintControlChange:Boolean;
begin
	CheckArg(L, 2, 3);
	lApplication := TLuaApplication(GetLuaObject(L, 1));
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

function VCLua_Application_HandleException(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	Sender:TObject;
begin
	CheckArg(L, 2);
	lApplication := TLuaApplication(GetLuaObject(L, 1));
	luaL_check(L,2,@Sender);
	try
		lApplication.HandleException(Sender);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Application', 'HandleException', E.ClassName, E.Message);
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
	lApplication := TLuaApplication(GetLuaObject(L, 1));
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
	lApplication := TLuaApplication(GetLuaObject(L, 1));
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

function VCLua_Application_Initialize(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
begin
	CheckArg(L, 1);
	lApplication := TLuaApplication(GetLuaObject(L, 1));
	try
		lApplication.Initialize();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Application', 'Initialize', E.ClassName, E.Message);
	end;
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

function VCLua_Application_Terminate(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
begin
	CheckArg(L, 1);
	lApplication := TLuaApplication(GetLuaObject(L, 1));
	try
		lApplication.Terminate();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Application', 'Terminate', E.ClassName, E.Message);
	end;
end;

function VCLua_Application_VCLuaGetActive(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	ret:boolean;
begin
	CheckArg(L, 1);
	lApplication := TLuaApplication(GetLuaObject(L, 1));
	try
		ret := lApplication.Active;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Application', 'Active', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Application_VCLuaSetApplicationType(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	val:TApplicationType;
begin
	CheckArg(L, 2);
	lApplication := TLuaApplication(GetLuaObject(L, 1));
	luaL_check(L,2,@val,TypeInfo(TApplicationType));
	try
		lApplication.ApplicationType := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Application', 'ApplicationType', E.ClassName, E.Message);
	end;
end;

function VCLua_Application_VCLuaGetApplicationType(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	ret:TApplicationType;
begin
	CheckArg(L, 1);
	lApplication := TLuaApplication(GetLuaObject(L, 1));
	try
		ret := lApplication.ApplicationType;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Application', 'ApplicationType', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_Application_VCLuaSetBidiMode(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	val:TBiDiMode;
begin
	CheckArg(L, 2);
	lApplication := TLuaApplication(GetLuaObject(L, 1));
	luaL_check(L,2,@val,TypeInfo(TBiDiMode));
	try
		lApplication.BidiMode := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Application', 'BidiMode', E.ClassName, E.Message);
	end;
end;

function VCLua_Application_VCLuaGetBidiMode(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	ret:TBiDiMode;
begin
	CheckArg(L, 1);
	lApplication := TLuaApplication(GetLuaObject(L, 1));
	try
		ret := lApplication.BidiMode;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Application', 'BidiMode', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_Application_VCLuaSetCaptureExceptions(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	val:boolean;
begin
	CheckArg(L, 2);
	lApplication := TLuaApplication(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lApplication.CaptureExceptions := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Application', 'CaptureExceptions', E.ClassName, E.Message);
	end;
end;

function VCLua_Application_VCLuaGetCaptureExceptions(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	ret:boolean;
begin
	CheckArg(L, 1);
	lApplication := TLuaApplication(GetLuaObject(L, 1));
	try
		ret := lApplication.CaptureExceptions;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Application', 'CaptureExceptions', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Application_VCLuaSetDoubleBuffered(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	val:TApplicationDoubleBuffered;
begin
	CheckArg(L, 2);
	lApplication := TLuaApplication(GetLuaObject(L, 1));
	luaL_check(L,2,@val,TypeInfo(TApplicationDoubleBuffered));
	try
		lApplication.DoubleBuffered := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Application', 'DoubleBuffered', E.ClassName, E.Message);
	end;
end;

function VCLua_Application_VCLuaGetDoubleBuffered(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	ret:TApplicationDoubleBuffered;
begin
	CheckArg(L, 1);
	lApplication := TLuaApplication(GetLuaObject(L, 1));
	try
		ret := lApplication.DoubleBuffered;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Application', 'DoubleBuffered', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_Application_VCLuaSetExceptionDialog(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	val:TApplicationExceptionDlg;
begin
	CheckArg(L, 2);
	lApplication := TLuaApplication(GetLuaObject(L, 1));
	luaL_check(L,2,@val,TypeInfo(TApplicationExceptionDlg));
	try
		lApplication.ExceptionDialog := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Application', 'ExceptionDialog', E.ClassName, E.Message);
	end;
end;

function VCLua_Application_VCLuaGetExceptionDialog(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	ret:TApplicationExceptionDlg;
begin
	CheckArg(L, 1);
	lApplication := TLuaApplication(GetLuaObject(L, 1));
	try
		ret := lApplication.ExceptionDialog;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Application', 'ExceptionDialog', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_Application_VCLuaSetFindGlobalComponentEnabled(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	val:boolean;
begin
	CheckArg(L, 2);
	lApplication := TLuaApplication(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lApplication.FindGlobalComponentEnabled := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Application', 'FindGlobalComponentEnabled', E.ClassName, E.Message);
	end;
end;

function VCLua_Application_VCLuaGetFindGlobalComponentEnabled(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	ret:boolean;
begin
	CheckArg(L, 1);
	lApplication := TLuaApplication(GetLuaObject(L, 1));
	try
		ret := lApplication.FindGlobalComponentEnabled;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Application', 'FindGlobalComponentEnabled', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Application_VCLuaSetFlags(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	val:TApplicationFlags;
begin
	CheckArg(L, 2);
	lApplication := TLuaApplication(GetLuaObject(L, 1));
	luaL_checkSet(L,2,@val,TypeInfo(TApplicationFlags));
	try
		lApplication.Flags := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Application', 'Flags', E.ClassName, E.Message);
	end;
end;

function VCLua_Application_VCLuaGetFlags(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	ret:TApplicationFlags;
begin
	CheckArg(L, 1);
	lApplication := TLuaApplication(GetLuaObject(L, 1));
	try
		ret := lApplication.Flags;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Application', 'Flags', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_Application_VCLuaSetHandle(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	val:THandle;
begin
	CheckArg(L, 2);
	lApplication := TLuaApplication(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lApplication.Handle := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Application', 'Handle', E.ClassName, E.Message);
	end;
end;

function VCLua_Application_VCLuaGetHandle(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	ret:THandle;
begin
	CheckArg(L, 1);
	lApplication := TLuaApplication(GetLuaObject(L, 1));
	try
		ret := lApplication.Handle;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Application', 'Handle', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Application_VCLuaSetHint(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	val:string;
begin
	CheckArg(L, 2);
	lApplication := TLuaApplication(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lApplication.Hint := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Application', 'Hint', E.ClassName, E.Message);
	end;
end;

function VCLua_Application_VCLuaGetHint(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	ret:string;
begin
	CheckArg(L, 1);
	lApplication := TLuaApplication(GetLuaObject(L, 1));
	try
		ret := lApplication.Hint;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Application', 'Hint', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Application_VCLuaSetHintColor(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	val:TColor;
begin
	CheckArg(L, 2);
	lApplication := TLuaApplication(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lApplication.HintColor := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Application', 'HintColor', E.ClassName, E.Message);
	end;
end;

function VCLua_Application_VCLuaGetHintColor(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	ret:TColor;
begin
	CheckArg(L, 1);
	lApplication := TLuaApplication(GetLuaObject(L, 1));
	try
		ret := lApplication.HintColor;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Application', 'HintColor', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Application_VCLuaSetHintHidePause(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	val:Integer;
begin
	CheckArg(L, 2);
	lApplication := TLuaApplication(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lApplication.HintHidePause := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Application', 'HintHidePause', E.ClassName, E.Message);
	end;
end;

function VCLua_Application_VCLuaGetHintHidePause(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	ret:Integer;
begin
	CheckArg(L, 1);
	lApplication := TLuaApplication(GetLuaObject(L, 1));
	try
		ret := lApplication.HintHidePause;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Application', 'HintHidePause', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Application_VCLuaSetHintHidePausePerChar(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	val:Integer;
begin
	CheckArg(L, 2);
	lApplication := TLuaApplication(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lApplication.HintHidePausePerChar := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Application', 'HintHidePausePerChar', E.ClassName, E.Message);
	end;
end;

function VCLua_Application_VCLuaGetHintHidePausePerChar(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	ret:Integer;
begin
	CheckArg(L, 1);
	lApplication := TLuaApplication(GetLuaObject(L, 1));
	try
		ret := lApplication.HintHidePausePerChar;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Application', 'HintHidePausePerChar', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Application_VCLuaSetHintPause(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	val:Integer;
begin
	CheckArg(L, 2);
	lApplication := TLuaApplication(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lApplication.HintPause := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Application', 'HintPause', E.ClassName, E.Message);
	end;
end;

function VCLua_Application_VCLuaGetHintPause(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	ret:Integer;
begin
	CheckArg(L, 1);
	lApplication := TLuaApplication(GetLuaObject(L, 1));
	try
		ret := lApplication.HintPause;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Application', 'HintPause', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Application_VCLuaSetHintShortCuts(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	val:Boolean;
begin
	CheckArg(L, 2);
	lApplication := TLuaApplication(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lApplication.HintShortCuts := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Application', 'HintShortCuts', E.ClassName, E.Message);
	end;
end;

function VCLua_Application_VCLuaGetHintShortCuts(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lApplication := TLuaApplication(GetLuaObject(L, 1));
	try
		ret := lApplication.HintShortCuts;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Application', 'HintShortCuts', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Application_VCLuaSetHintShortPause(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	val:Integer;
begin
	CheckArg(L, 2);
	lApplication := TLuaApplication(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lApplication.HintShortPause := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Application', 'HintShortPause', E.ClassName, E.Message);
	end;
end;

function VCLua_Application_VCLuaGetHintShortPause(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	ret:Integer;
begin
	CheckArg(L, 1);
	lApplication := TLuaApplication(GetLuaObject(L, 1));
	try
		ret := lApplication.HintShortPause;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Application', 'HintShortPause', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Application_VCLuaSetIcon(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	val:TIcon;
begin
	CheckArg(L, 2);
	lApplication := TLuaApplication(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lApplication.Icon := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Application', 'Icon', E.ClassName, E.Message);
	end;
end;

function VCLua_Application_VCLuaGetIcon(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	ret:TIcon;
begin
	CheckArg(L, 1);
	lApplication := TLuaApplication(GetLuaObject(L, 1));
	try
		ret := lApplication.Icon;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Application', 'Icon', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_Application_VCLuaSetLayoutAdjustmentPolicy(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	val:TLayoutAdjustmentPolicy;
begin
	CheckArg(L, 2);
	lApplication := TLuaApplication(GetLuaObject(L, 1));
	luaL_check(L,2,@val,TypeInfo(TLayoutAdjustmentPolicy));
	try
		lApplication.LayoutAdjustmentPolicy := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Application', 'LayoutAdjustmentPolicy', E.ClassName, E.Message);
	end;
end;

function VCLua_Application_VCLuaGetLayoutAdjustmentPolicy(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	ret:TLayoutAdjustmentPolicy;
begin
	CheckArg(L, 1);
	lApplication := TLuaApplication(GetLuaObject(L, 1));
	try
		ret := lApplication.LayoutAdjustmentPolicy;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Application', 'LayoutAdjustmentPolicy', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_Application_VCLuaSetNavigation(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	val:TApplicationNavigationOptions;
begin
	CheckArg(L, 2);
	lApplication := TLuaApplication(GetLuaObject(L, 1));
	luaL_checkSet(L,2,@val,TypeInfo(TApplicationNavigationOptions));
	try
		lApplication.Navigation := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Application', 'Navigation', E.ClassName, E.Message);
	end;
end;

function VCLua_Application_VCLuaGetNavigation(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	ret:TApplicationNavigationOptions;
begin
	CheckArg(L, 1);
	lApplication := TLuaApplication(GetLuaObject(L, 1));
	try
		ret := lApplication.Navigation;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Application', 'Navigation', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_Application_VCLuaGetMainForm(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	ret:TForm;
begin
	CheckArg(L, 1);
	lApplication := TLuaApplication(GetLuaObject(L, 1));
	try
		ret := lApplication.MainForm;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Application', 'MainForm', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Application_VCLuaGetMainFormHandle(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	ret:HWND;
begin
	CheckArg(L, 1);
	lApplication := TLuaApplication(GetLuaObject(L, 1));
	try
		ret := lApplication.MainFormHandle;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Application', 'MainFormHandle', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Application_VCLuaSetMainFormOnTaskBar(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	val:Boolean;
begin
	CheckArg(L, 2);
	lApplication := TLuaApplication(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lApplication.MainFormOnTaskBar := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Application', 'MainFormOnTaskBar', E.ClassName, E.Message);
	end;
end;

function VCLua_Application_VCLuaGetMainFormOnTaskBar(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lApplication := TLuaApplication(GetLuaObject(L, 1));
	try
		ret := lApplication.MainFormOnTaskBar;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Application', 'MainFormOnTaskBar', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Application_VCLuaGetModalLevel(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	ret:Integer;
begin
	CheckArg(L, 1);
	lApplication := TLuaApplication(GetLuaObject(L, 1));
	try
		ret := lApplication.ModalLevel;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Application', 'ModalLevel', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Application_VCLuaSetMoveFormFocusToChildren(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	val:Boolean;
begin
	CheckArg(L, 2);
	lApplication := TLuaApplication(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lApplication.MoveFormFocusToChildren := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Application', 'MoveFormFocusToChildren', E.ClassName, E.Message);
	end;
end;

function VCLua_Application_VCLuaGetMoveFormFocusToChildren(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lApplication := TLuaApplication(GetLuaObject(L, 1));
	try
		ret := lApplication.MoveFormFocusToChildren;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Application', 'MoveFormFocusToChildren', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Application_VCLuaGetMouseControl(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	ret:TControl;
begin
	CheckArg(L, 1);
	lApplication := TLuaApplication(GetLuaObject(L, 1));
	try
		ret := lApplication.MouseControl;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Application', 'MouseControl', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Application_VCLuaSetTaskBarBehavior(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	val:TTaskBarBehavior;
begin
	CheckArg(L, 2);
	lApplication := TLuaApplication(GetLuaObject(L, 1));
	luaL_check(L,2,@val,TypeInfo(TTaskBarBehavior));
	try
		lApplication.TaskBarBehavior := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Application', 'TaskBarBehavior', E.ClassName, E.Message);
	end;
end;

function VCLua_Application_VCLuaGetTaskBarBehavior(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	ret:TTaskBarBehavior;
begin
	CheckArg(L, 1);
	lApplication := TLuaApplication(GetLuaObject(L, 1));
	try
		ret := lApplication.TaskBarBehavior;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Application', 'TaskBarBehavior', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_Application_VCLuaSetUpdateFormatSettings(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	val:Boolean;
begin
	CheckArg(L, 2);
	lApplication := TLuaApplication(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lApplication.UpdateFormatSettings := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Application', 'UpdateFormatSettings', E.ClassName, E.Message);
	end;
end;

function VCLua_Application_VCLuaGetUpdateFormatSettings(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lApplication := TLuaApplication(GetLuaObject(L, 1));
	try
		ret := lApplication.UpdateFormatSettings;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Application', 'UpdateFormatSettings', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Application_VCLuaSetShowButtonGlyphs(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	val:TApplicationShowGlyphs;
begin
	CheckArg(L, 2);
	lApplication := TLuaApplication(GetLuaObject(L, 1));
	luaL_check(L,2,@val,TypeInfo(TApplicationShowGlyphs));
	try
		lApplication.ShowButtonGlyphs := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Application', 'ShowButtonGlyphs', E.ClassName, E.Message);
	end;
end;

function VCLua_Application_VCLuaGetShowButtonGlyphs(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	ret:TApplicationShowGlyphs;
begin
	CheckArg(L, 1);
	lApplication := TLuaApplication(GetLuaObject(L, 1));
	try
		ret := lApplication.ShowButtonGlyphs;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Application', 'ShowButtonGlyphs', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_Application_VCLuaSetShowMenuGlyphs(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	val:TApplicationShowGlyphs;
begin
	CheckArg(L, 2);
	lApplication := TLuaApplication(GetLuaObject(L, 1));
	luaL_check(L,2,@val,TypeInfo(TApplicationShowGlyphs));
	try
		lApplication.ShowMenuGlyphs := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Application', 'ShowMenuGlyphs', E.ClassName, E.Message);
	end;
end;

function VCLua_Application_VCLuaGetShowMenuGlyphs(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	ret:TApplicationShowGlyphs;
begin
	CheckArg(L, 1);
	lApplication := TLuaApplication(GetLuaObject(L, 1));
	try
		ret := lApplication.ShowMenuGlyphs;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Application', 'ShowMenuGlyphs', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_Application_VCLuaSetShowHint(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	val:Boolean;
begin
	CheckArg(L, 2);
	lApplication := TLuaApplication(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lApplication.ShowHint := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Application', 'ShowHint', E.ClassName, E.Message);
	end;
end;

function VCLua_Application_VCLuaGetShowHint(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lApplication := TLuaApplication(GetLuaObject(L, 1));
	try
		ret := lApplication.ShowHint;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Application', 'ShowHint', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Application_VCLuaSetShowMainForm(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	val:Boolean;
begin
	CheckArg(L, 2);
	lApplication := TLuaApplication(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lApplication.ShowMainForm := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Application', 'ShowMainForm', E.ClassName, E.Message);
	end;
end;

function VCLua_Application_VCLuaGetShowMainForm(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lApplication := TLuaApplication(GetLuaObject(L, 1));
	try
		ret := lApplication.ShowMainForm;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Application', 'ShowMainForm', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Application_VCLuaSetTitle(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	val:String;
begin
	CheckArg(L, 2);
	lApplication := TLuaApplication(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lApplication.Title := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Application', 'Title', E.ClassName, E.Message);
	end;
end;

function VCLua_Application_VCLuaGetTitle(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	ret:String;
begin
	CheckArg(L, 1);
	lApplication := TLuaApplication(GetLuaObject(L, 1));
	try
		ret := lApplication.Title;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Application', 'Title', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Application_VCLuaSetScaled(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	val:Boolean;
begin
	CheckArg(L, 2);
	lApplication := TLuaApplication(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lApplication.Scaled := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Application', 'Scaled', E.ClassName, E.Message);
	end;
end;

function VCLua_Application_VCLuaGetScaled(L: Plua_State): Integer; cdecl;
var
	lApplication:TLuaApplication;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lApplication := TLuaApplication(GetLuaObject(L, 1));
	try
		ret := lApplication.Scaled;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Application', 'Scaled', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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
	GetControlParents(L,TWinControl(Parent),Name);
	lApplication := TLuaApplication.Create(Parent);
	// := TWinControl(Parent);
	lApplication.LuaCtl := TVCLuaControl.Create(lApplication as TComponent,L,nil,'TApplication');
	InitControl(L,lApplication,Name);
	CreateTableForKnownType(L,'TApplication',lApplication);
	Result := 1;
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
	TLuaMethodInfo.Create(ApplicationFuncs, 'HandleException', @VCLua_Application_HandleException);
	TLuaMethodInfo.Create(ApplicationFuncs, 'HandleMessage', @VCLua_Application_HandleMessage);
	TLuaMethodInfo.Create(ApplicationFuncs, 'RemoveStayOnTop', @VCLua_Application_RemoveStayOnTop);
	TLuaMethodInfo.Create(ApplicationFuncs, 'RestoreStayOnTop', @VCLua_Application_RestoreStayOnTop);
	TLuaMethodInfo.Create(ApplicationFuncs, 'IsWaiting', @VCLua_Application_IsWaiting);
	TLuaMethodInfo.Create(ApplicationFuncs, 'Initialize', @VCLua_Application_Initialize);
	TLuaMethodInfo.Create(ApplicationFuncs, 'Minimize', @VCLua_Application_Minimize);
	TLuaMethodInfo.Create(ApplicationFuncs, 'ModalStarted', @VCLua_Application_ModalStarted);
	TLuaMethodInfo.Create(ApplicationFuncs, 'ModalFinished', @VCLua_Application_ModalFinished);
	TLuaMethodInfo.Create(ApplicationFuncs, 'Restore', @VCLua_Application_Restore);
	TLuaMethodInfo.Create(ApplicationFuncs, 'Notification', @VCLua_Application_Notification);
	TLuaMethodInfo.Create(ApplicationFuncs, 'ProcessMessages', @VCLua_Application_ProcessMessages);
	TLuaMethodInfo.Create(ApplicationFuncs, 'Idle', @VCLua_Application_Idle);
	TLuaMethodInfo.Create(ApplicationFuncs, 'Run', @VCLua_Application_Run);
	TLuaMethodInfo.Create(ApplicationFuncs, 'Terminate', @VCLua_Application_Terminate);
	TLuaMethodInfo.Create(ApplicationFuncs, 'Active', @VCLua_Application_VCLuaGetActive, mfCall);
	TLuaMethodInfo.Create(ApplicationFuncs, 'ApplicationType', @VCLua_Application_VCLuaGetApplicationType, mfCall);
	TLuaMethodInfo.Create(ApplicationFuncs, 'BidiMode', @VCLua_Application_VCLuaGetBidiMode, mfCall);
	TLuaMethodInfo.Create(ApplicationFuncs, 'CaptureExceptions', @VCLua_Application_VCLuaGetCaptureExceptions, mfCall);
	TLuaMethodInfo.Create(ApplicationFuncs, 'DoubleBuffered', @VCLua_Application_VCLuaGetDoubleBuffered, mfCall);
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
	TLuaMethodInfo.Create(ApplicationSets, 'ApplicationType', @VCLua_Application_VCLuaSetApplicationType, mfCall);
	TLuaMethodInfo.Create(ApplicationSets, 'BidiMode', @VCLua_Application_VCLuaSetBidiMode, mfCall);
	TLuaMethodInfo.Create(ApplicationSets, 'CaptureExceptions', @VCLua_Application_VCLuaSetCaptureExceptions, mfCall);
	TLuaMethodInfo.Create(ApplicationSets, 'DoubleBuffered', @VCLua_Application_VCLuaSetDoubleBuffered, mfCall);
	TLuaMethodInfo.Create(ApplicationSets, 'ExceptionDialog', @VCLua_Application_VCLuaSetExceptionDialog, mfCall);
	TLuaMethodInfo.Create(ApplicationSets, 'FindGlobalComponentEnabled', @VCLua_Application_VCLuaSetFindGlobalComponentEnabled, mfCall);
	TLuaMethodInfo.Create(ApplicationSets, 'Flags', @VCLua_Application_VCLuaSetFlags, mfCall);
	TLuaMethodInfo.Create(ApplicationSets, 'Handle', @VCLua_Application_VCLuaSetHandle, mfCall);
	TLuaMethodInfo.Create(ApplicationSets, 'Hint', @VCLua_Application_VCLuaSetHint, mfCall);
	TLuaMethodInfo.Create(ApplicationSets, 'HintColor', @VCLua_Application_VCLuaSetHintColor, mfCall);
	TLuaMethodInfo.Create(ApplicationSets, 'HintHidePause', @VCLua_Application_VCLuaSetHintHidePause, mfCall);
	TLuaMethodInfo.Create(ApplicationSets, 'HintHidePausePerChar', @VCLua_Application_VCLuaSetHintHidePausePerChar, mfCall);
	TLuaMethodInfo.Create(ApplicationSets, 'HintPause', @VCLua_Application_VCLuaSetHintPause, mfCall);
	TLuaMethodInfo.Create(ApplicationSets, 'HintShortCuts', @VCLua_Application_VCLuaSetHintShortCuts, mfCall);
	TLuaMethodInfo.Create(ApplicationSets, 'HintShortPause', @VCLua_Application_VCLuaSetHintShortPause, mfCall);
	TLuaMethodInfo.Create(ApplicationSets, 'Icon', @VCLua_Application_VCLuaSetIcon, mfCall);
	TLuaMethodInfo.Create(ApplicationSets, 'LayoutAdjustmentPolicy', @VCLua_Application_VCLuaSetLayoutAdjustmentPolicy, mfCall);
	TLuaMethodInfo.Create(ApplicationSets, 'Navigation', @VCLua_Application_VCLuaSetNavigation, mfCall);
	TLuaMethodInfo.Create(ApplicationSets, 'MainFormOnTaskBar', @VCLua_Application_VCLuaSetMainFormOnTaskBar, mfCall);
	TLuaMethodInfo.Create(ApplicationSets, 'MoveFormFocusToChildren', @VCLua_Application_VCLuaSetMoveFormFocusToChildren, mfCall);
	TLuaMethodInfo.Create(ApplicationSets, 'TaskBarBehavior', @VCLua_Application_VCLuaSetTaskBarBehavior, mfCall);
	TLuaMethodInfo.Create(ApplicationSets, 'UpdateFormatSettings', @VCLua_Application_VCLuaSetUpdateFormatSettings, mfCall);
	TLuaMethodInfo.Create(ApplicationSets, 'ShowButtonGlyphs', @VCLua_Application_VCLuaSetShowButtonGlyphs, mfCall);
	TLuaMethodInfo.Create(ApplicationSets, 'ShowMenuGlyphs', @VCLua_Application_VCLuaSetShowMenuGlyphs, mfCall);
	TLuaMethodInfo.Create(ApplicationSets, 'ShowHint', @VCLua_Application_VCLuaSetShowHint, mfCall);
	TLuaMethodInfo.Create(ApplicationSets, 'ShowMainForm', @VCLua_Application_VCLuaSetShowMainForm, mfCall);
	TLuaMethodInfo.Create(ApplicationSets, 'Title', @VCLua_Application_VCLuaSetTitle, mfCall);
	TLuaMethodInfo.Create(ApplicationSets, 'Scaled', @VCLua_Application_VCLuaSetScaled, mfCall);
end.
