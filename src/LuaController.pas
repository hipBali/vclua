unit LuaController;

{$mode delphi}

interface

Uses Controls,
     Forms,
     Lua;

// *************************************************************************

procedure GetControlParents(L: Plua_State; var Parent:TWinControl; var Name:String);
procedure InitControl(L: Plua_State; luaObj:TObject; var Name:String);
procedure PushDefaultMethods(L: Plua_State; Sender:TObject);
procedure SetDefaultMetatable(L: Plua_State; absindex: Integer);
procedure CreateTableForKnownType(L: Plua_State; TypeName:String; Sender:TObject);inline;
procedure SetAsMainForm(aForm:TForm);

// default methods
function ControlFree(L: Plua_State): Integer; cdecl;
function ControlFocus(L: Plua_State): Integer; cdecl;
function ControlBeginUpdateBounds(L: Plua_State): Integer; cdecl;
function ControlEndUpdateBounds(L: Plua_State): Integer; cdecl;

implementation

Uses TypInfo,
     LuaVmt,
     Classes,
     SysUtils,
     LuaProperties,
     LuaHelper,
     LuaProxy;

// ***********************************************
// LUA Control Methods
// ***********************************************
function LuaIs(L: Plua_State): Integer; cdecl;
var
  o: TObject;
begin
  CheckArg(L, 2);
  Result := 1;
  o := GetLuaObject(L, 1);
  if o = nil then
     lua_push(L, false)
  else
    lua_push(L, InheritsFrom(o.ClassInfo, luaL_checkPChar(L, 2, TypeInfo(shortstring))));
end;

procedure PushDefaultMethods(L: Plua_State; Sender: TObject);
var
  index: Integer;
begin
  lua_newtable(L);
  index := lua_gettop(L);
  lua_pushlightuserdata(L, Pointer(Sender));
  lua_setfield(L, index, HandleStr);
  LuaSetTableFunctionAbs(L, index, 'Free', @ControlFree);
  LuaSetTableFunctionAbs(L, index, 'is', @LuaIs);
  if Sender is TWinControl then begin
     LuaSetTableFunctionAbs(L, index, 'SetFocus', @ControlFocus);
     LuaSetTableFunctionAbs(L, index, 'EndUpdateBounds', @ControlEndUpdateBounds);
     LuaSetTableFunctionAbs(L, index, 'BeginUpdateBounds', @ControlBeginUpdateBounds);
  end;
end;

procedure SetDefaultMetatable(L: Plua_State; absindex: Integer);
begin
  luaL_getmetatable(L, 'VCLO');
  lua_setmetatable(L, absindex);
end;

procedure CreateTableForKnownType(L: Plua_State; TypeName:String; Sender:TObject);
begin
  if Sender = nil then begin
    lua_pushnil(L);
    Exit;
  end;
  PushDefaultMethods(L, Sender);
  SetDefaultMetatable(L, lua_gettop(L));
end;

procedure GetControlParents(L: Plua_State; var Parent:TWinControl; var Name:String);
var n:Integer;
begin
  Parent := nil;
  Name := '';
  n := lua_gettop(L);
  if n>0 then begin
    if lua_istable(L,1) then
       Parent := TWinControl(GetLuaObjectPop(L, 1));
    if (n>=2) and lua_isstring(L,2) then
       Name := lua_tostring(L,2);
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
var
  tindex: Integer;
begin
  try
     (luaObj as TComponent).Name := Name;
  except
      on E: Exception do
         LuaError(L, E.ClassName, E.Message);
  end;
  tindex := lua_gettop(L) - 1;
  if (tindex>0) and (lua_istable(L,tindex)) and (GetLuaObjectUnsafePop(L,tindex) = nil) then
     UpdatePropertiesFromLuaTable(L, luaObj.ClassName, tindex + 1, tindex, luaObj);
end;

function ControlFree(L: Plua_State): Integer; cdecl;
var
  o: TObject;
begin
  CheckArg(L, 1);
  o := GetLuaObject(L, 1);
  try
     o.Free;
  except
      on E: Exception do
         CallError(L, 'Object', 'Free', E.ClassName, E.Message);
  end;
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

procedure SetAsMainForm(aForm:TForm);
var
  P: Pointer;
begin
  P := @Application.Mainform;
  Pointer(P^) := aForm;
end;


end.

