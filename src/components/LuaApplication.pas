(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaApplication;	

{$MODE Delphi}{$T+}

interface

Uses Classes, Lua, LuaController, Forms, TypInfo, LuaVmt;

function CreateApplication(L: Plua_State): Integer; cdecl;
function IsApplication(L: Plua_State): Integer; cdecl;
function AsApplication(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TApplication; pti: PTypeInfo = nil); overload; inline;

type
    TLuaApplication = class(TApplication)
        LuaCtl: TVCLuaControl;
    end;
var
    ApplicationFuncs: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Controls, LCLType, LuaControl;

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

function IsApplication(L: Plua_State): Integer; cdecl;
begin
  CheckArg(L, 1);
  Result := 1;
  lua_push(L, GetLuaObject(L, 1) is TApplication);
end;
function AsApplication(L: Plua_State): Integer; cdecl;
var o : TObject;
begin
  CheckArg(L, 1);
  Result := 1;
  o := GetLuaObject(L, 1);
  if o is TApplication then
    lua_push(L, TApplication(o))
  else
    lua_pushnil(L);
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
end.
