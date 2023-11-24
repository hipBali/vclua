(*
Generated with Lua-fpc parser/generator
(C) 2018-2023 Hi-Project Ltd.
*)
unit LuaApplication;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, Forms, LCLType, LMessages, Controls;

function CreateApplication(L: Plua_State): Integer; cdecl;
procedure ApplicationToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaApplication = class(TApplication)
        LuaCtl: TVCLuaControl;
    end;


implementation
Uses LuaProperties, TypInfo, LuaProxy, LuaHelper, LCLClasses; 

function VCLua_Application_ActivateHint(L: Plua_State): Integer; cdecl;
var 
	lApplication:TLuaApplication;
	CursorPos:TPoint;
	CheckHintControlChange:Boolean;
begin
	CheckArg(L, -1);
	lApplication := TLuaApplication(GetLuaObject(L, 1));
	CursorPos := lua_toTPoint(L,2);
	CheckHintControlChange := luaL_optbool(L,3, False);
	lApplication.ActivateHint(CursorPos,CheckHintControlChange);
	
	Result := 0;
end;

function VCLua_Application_GetControlAtMouse(L: Plua_State): Integer; cdecl;
var 
	lApplication:TLuaApplication;
	ret:TControl;
begin
	CheckArg(L, 1);
	lApplication := TLuaApplication(GetLuaObject(L, 1));
	ret := lApplication.GetControlAtMouse();
	lua_pushlightuserdata(L,ret);
	
	Result := 1;
end;

function VCLua_Application_ControlDestroyed(L: Plua_State): Integer; cdecl;
var 
	lApplication:TLuaApplication;
	AControl:TControl;
begin
	CheckArg(L, 2);
	lApplication := TLuaApplication(GetLuaObject(L, 1));
	AControl := TControl(GetLuaObject(L,2));
	lApplication.ControlDestroyed(AControl);
	
	Result := 0;
end;

function VCLua_Application_BigIconHandle(L: Plua_State): Integer; cdecl;
var 
	lApplication:TLuaApplication;
	ret:HIcon;
begin
	CheckArg(L, 1);
	lApplication := TLuaApplication(GetLuaObject(L, 1));
	ret := lApplication.BigIconHandle();
	lua_pushlightuserdata(L,@ret);
	
	Result := 1;
end;

function VCLua_Application_SmallIconHandle(L: Plua_State): Integer; cdecl;
var 
	lApplication:TLuaApplication;
	ret:HIcon;
begin
	CheckArg(L, 1);
	lApplication := TLuaApplication(GetLuaObject(L, 1));
	ret := lApplication.SmallIconHandle();
	lua_pushlightuserdata(L,@ret);
	
	Result := 1;
end;

function VCLua_Application_BringToFront(L: Plua_State): Integer; cdecl;
var 
	lApplication:TLuaApplication;
begin
	CheckArg(L, 1);
	lApplication := TLuaApplication(GetLuaObject(L, 1));
	lApplication.BringToFront();
	
	Result := 0;
end;

function VCLua_Application_CreateForm(L: Plua_State): Integer; cdecl;
var 
	lApplication:TLuaApplication;
	InstanceClass:TComponentClass;
	Reference:Pointer;
begin
	CheckArg(L, 2);
	lApplication := TLuaApplication(GetLuaObject(L, 1));
	InstanceClass := TComponentClass(GetLuaObject(L,2));
	lApplication.CreateForm(InstanceClass,Reference);
	lua_pushlightuserdata(L,Reference);
	Result := 1;
end;

function VCLua_Application_UpdateMainForm(L: Plua_State): Integer; cdecl;
var 
	lApplication:TLuaApplication;
	AForm:TForm;
begin
	CheckArg(L, 2);
	lApplication := TLuaApplication(GetLuaObject(L, 1));
	AForm := TForm(GetLuaObject(L,2));
	lApplication.UpdateMainForm(AForm);
	
	Result := 0;
end;

function VCLua_Application_ReleaseComponent(L: Plua_State): Integer; cdecl;
var 
	lApplication:TLuaApplication;
	AComponent:TComponent;
begin
	CheckArg(L, 2);
	lApplication := TLuaApplication(GetLuaObject(L, 1));
	AComponent := TComponent(GetLuaObject(L,2));
	lApplication.ReleaseComponent(AComponent);
	
	Result := 0;
end;

function VCLua_Application_HandleException(L: Plua_State): Integer; cdecl;
var 
	lApplication:TLuaApplication;
	Sender:TObject;
begin
	CheckArg(L, 2);
	lApplication := TLuaApplication(GetLuaObject(L, 1));
	Sender := TObject(GetLuaObject(L,2));
	lApplication.HandleException(Sender);
	
	Result := 0;
end;

function VCLua_Application_HandleMessage(L: Plua_State): Integer; cdecl;
var 
	lApplication:TLuaApplication;
begin
	CheckArg(L, 1);
	lApplication := TLuaApplication(GetLuaObject(L, 1));
	lApplication.HandleMessage();
	
	Result := 0;
end;

function VCLua_Application_RemoveStayOnTop(L: Plua_State): Integer; cdecl;
var 
	lApplication:TLuaApplication;
	ASystemTopAlso:Boolean;
begin
	CheckArg(L, -1);
	lApplication := TLuaApplication(GetLuaObject(L, 1));
	ASystemTopAlso := luaL_optbool(L,2, False);
	lApplication.RemoveStayOnTop(ASystemTopAlso);
	
	Result := 0;
end;

function VCLua_Application_RestoreStayOnTop(L: Plua_State): Integer; cdecl;
var 
	lApplication:TLuaApplication;
	ASystemTopAlso:Boolean;
begin
	CheckArg(L, -1);
	lApplication := TLuaApplication(GetLuaObject(L, 1));
	ASystemTopAlso := luaL_optbool(L,2, False);
	lApplication.RestoreStayOnTop(ASystemTopAlso);
	
	Result := 0;
end;

function VCLua_Application_IsWaiting(L: Plua_State): Integer; cdecl;
var 
	lApplication:TLuaApplication;
	ret:boolean;
begin
	CheckArg(L, 1);
	lApplication := TLuaApplication(GetLuaObject(L, 1));
	ret := lApplication.IsWaiting();
	lua_pushboolean(L,ret);
	
	Result := 1;
end;

function VCLua_Application_Initialize(L: Plua_State): Integer; cdecl;
var 
	lApplication:TLuaApplication;
begin
	CheckArg(L, 1);
	lApplication := TLuaApplication(GetLuaObject(L, 1));
	lApplication.Initialize();
	
	Result := 0;
end;

function VCLua_Application_Minimize(L: Plua_State): Integer; cdecl;
var 
	lApplication:TLuaApplication;
begin
	CheckArg(L, 1);
	lApplication := TLuaApplication(GetLuaObject(L, 1));
	lApplication.Minimize();
	
	Result := 0;
end;

function VCLua_Application_ModalStarted(L: Plua_State): Integer; cdecl;
var 
	lApplication:TLuaApplication;
begin
	CheckArg(L, 1);
	lApplication := TLuaApplication(GetLuaObject(L, 1));
	lApplication.ModalStarted();
	
	Result := 0;
end;

function VCLua_Application_ModalFinished(L: Plua_State): Integer; cdecl;
var 
	lApplication:TLuaApplication;
begin
	CheckArg(L, 1);
	lApplication := TLuaApplication(GetLuaObject(L, 1));
	lApplication.ModalFinished();
	
	Result := 0;
end;

function VCLua_Application_Restore(L: Plua_State): Integer; cdecl;
var 
	lApplication:TLuaApplication;
begin
	CheckArg(L, 1);
	lApplication := TLuaApplication(GetLuaObject(L, 1));
	lApplication.Restore();
	
	Result := 0;
end;

function VCLua_Application_Notification(L: Plua_State): Integer; cdecl;
var 
	lApplication:TLuaApplication;
	AComponent:TComponent;
	Operation:TOperation;
begin
	CheckArg(L, 3);
	lApplication := TLuaApplication(GetLuaObject(L, 1));
	AComponent := TComponent(GetLuaObject(L,2));
	Operation := TOperation(GetLuaObject(L,3));
	lApplication.Notification(AComponent,Operation);
	
	Result := 0;
end;

function VCLua_Application_ProcessMessages(L: Plua_State): Integer; cdecl;
var 
	lApplication:TLuaApplication;
begin
	CheckArg(L, 1);
	lApplication := TLuaApplication(GetLuaObject(L, 1));
	lApplication.ProcessMessages();
	
	Result := 0;
end;

function VCLua_Application_Idle(L: Plua_State): Integer; cdecl;
var 
	lApplication:TLuaApplication;
	Wait:Boolean;
begin
	CheckArg(L, 2);
	lApplication := TLuaApplication(GetLuaObject(L, 1));
	Wait := lua_toboolean(L,2);
	lApplication.Idle(Wait);
	
	Result := 0;
end;

function VCLua_Application_Run(L: Plua_State): Integer; cdecl;
var 
	lApplication:TLuaApplication;
begin
	CheckArg(L, 1);
	lApplication := TLuaApplication(GetLuaObject(L, 1));
	lApplication.Run();
	
	Result := 0;
end;

function VCLua_Application_Terminate(L: Plua_State): Integer; cdecl;
var 
	lApplication:TLuaApplication;
begin
	CheckArg(L, 1);
	lApplication := TLuaApplication(GetLuaObject(L, 1));
	lApplication.Terminate();
	
	Result := 0;
end;

procedure ApplicationToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	SetDefaultMethods(L,Index,Sender);
	LuaSetTableFunction(L, Index, 'ActivateHint', @VCLua_Application_ActivateHint);
	LuaSetTableFunction(L, Index, 'GetControlAtMouse', @VCLua_Application_GetControlAtMouse);
	LuaSetTableFunction(L, Index, 'ControlDestroyed', @VCLua_Application_ControlDestroyed);
	LuaSetTableFunction(L, Index, 'BigIconHandle', @VCLua_Application_BigIconHandle);
	LuaSetTableFunction(L, Index, 'SmallIconHandle', @VCLua_Application_SmallIconHandle);
	LuaSetTableFunction(L, Index, 'BringToFront', @VCLua_Application_BringToFront);
	LuaSetTableFunction(L, Index, 'CreateForm', @VCLua_Application_CreateForm);
	LuaSetTableFunction(L, Index, 'UpdateMainForm', @VCLua_Application_UpdateMainForm);
	LuaSetTableFunction(L, Index, 'ReleaseComponent', @VCLua_Application_ReleaseComponent);
	LuaSetTableFunction(L, Index, 'HandleException', @VCLua_Application_HandleException);
	LuaSetTableFunction(L, Index, 'HandleMessage', @VCLua_Application_HandleMessage);
	LuaSetTableFunction(L, Index, 'RemoveStayOnTop', @VCLua_Application_RemoveStayOnTop);
	LuaSetTableFunction(L, Index, 'RestoreStayOnTop', @VCLua_Application_RestoreStayOnTop);
	LuaSetTableFunction(L, Index, 'IsWaiting', @VCLua_Application_IsWaiting);
	LuaSetTableFunction(L, Index, 'Initialize', @VCLua_Application_Initialize);
	LuaSetTableFunction(L, Index, 'Minimize', @VCLua_Application_Minimize);
	LuaSetTableFunction(L, Index, 'ModalStarted', @VCLua_Application_ModalStarted);
	LuaSetTableFunction(L, Index, 'ModalFinished', @VCLua_Application_ModalFinished);
	LuaSetTableFunction(L, Index, 'Restore', @VCLua_Application_Restore);
	LuaSetTableFunction(L, Index, 'Notification', @VCLua_Application_Notification);
	LuaSetTableFunction(L, Index, 'ProcessMessages', @VCLua_Application_ProcessMessages);
	LuaSetTableFunction(L, Index, 'Idle', @VCLua_Application_Idle);
	LuaSetTableFunction(L, Index, 'Run', @VCLua_Application_Run);
	LuaSetTableFunction(L, Index, 'Terminate', @VCLua_Application_Terminate);
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
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
	lApplication.LuaCtl := TVCLuaControl.Create(TControl(lApplication),L,@ApplicationToTable);
	InitControl(L,lApplication,Name);
	ApplicationToTable(L, -1, lApplication);
	Result := 1;
end;

end.
