unit LuaHelper;

interface

uses
  Dialogs,
  Classes, SysUtils, Lua;

const
  HandleStr = 'Handle';

  ButtonResult : Array [0..10] of string =
      ('mrNone','mrOk','mrCancel','mrAbort','mrRetry','mrIgnore','mrYes','mrNo',
       'mrAll','mrNoToAll','mrYesToAll');


function RunSeparate(L: Plua_State):integer;cdecl;

procedure LuaError(L: Plua_State; text: String; err: String);
procedure DoScript(L: Plua_State; fileName: String);
procedure DoCall(L: Plua_State; paramCount:integer);

procedure CheckArg(L: Plua_State; N: Integer);
function GetLuaObject(L: Plua_State; Index: Integer): TObject;
function GetLuaUserData(L: Plua_State; Index: Integer): Pointer;
function LuaGetTableLightUserData(L: Plua_State; TableIndex: Integer; const Key: string): Pointer;
procedure LuaGetTable(L: Plua_State; TableIndex: Integer; const Key: string);

procedure LuaSetTableLightUserData(L: Plua_State; TableIndex: Integer; const Key: string; P: Pointer);
procedure LuaSetTableFunction(L: Plua_State; TableIndex: Integer; const Key: string; F: lua_CFunction);
procedure LuaSetTableClear(L: Plua_State; TableIndex: Integer);

procedure LuaPushKeyString(L: Plua_State; var Index: Integer; const Key: string);
function LuaAbsIndex(L: Plua_State; Index: Integer): Integer;

procedure LuaRawSetTableNil(L: Plua_State; TableIndex: Integer; const Key: string);
procedure LuaRawSetTableBoolean(L: Plua_State; TableIndex: Integer; const Key: string; B: Boolean);
procedure LuaRawSetTableNumber(L: Plua_State; TableIndex: Integer; const Key: string; N: Double);
procedure LuaRawSetTableString(L: Plua_State; TableIndex: Integer; const Key: string; S: string);
procedure LuaRawSetTableLightUserData(L: Plua_State; TableIndex: Integer; const Key: string; P: Pointer);
procedure LuaRawSetTableValue(L: Plua_State; TableIndex: Integer; const Key: string; ValueIndex: Integer);
procedure LuaRawSetTableFunction(L: Plua_State; TableIndex: Integer; const Key: string; F: lua_CFunction);

procedure LuaRawGetTable(L: Plua_State; TableIndex: Integer; const Key: string);
function LuaRawGetTableBoolean(L: Plua_State; TableIndex: Integer; const Key: string): Boolean;
function LuaRawGetTableNumber(L: Plua_State; TableIndex: Integer; const Key: string): Double;
function LuaRawGetTableString(L: Plua_State; TableIndex: Integer; const Key: string): string;
function LuaRawGetTableFunction(L: Plua_State; TableIndex: Integer; const Key: string): lua_CFunction;
function LuaRawGetTableLightUserData(L: Plua_State; TableIndex: Integer; const Key: string): Pointer;

function LuaGetMetaFunction(L: Plua_State; Index: Integer; Key: string): lua_CFunction;
procedure LuaSetMetaFunction(L: Plua_State; Index: Integer; Key: string; F: lua_CFunction);

function LuaStackDump(L: Plua_State):String;

function luaL_optint(L : Plua_State; n, d : Integer): Integer;
function luaL_optbool(L : Plua_State; n: Integer; d: boolean): Boolean;

implementation

Uses Forms;

// *****************************************************************************

function luaL_optint(L : Plua_State; n, d : Integer): Integer;
begin
  luaL_optint := luaL_optinteger(L, n, d);
end;

function luaL_optbool(L : Plua_State; n: Integer; d: boolean): Boolean;
begin
  if ( lua_isboolean( L, n )) then
     result := lua_toboolean( L, n )
  else
     result := boolean(luaL_optint( L, n, Integer(d) ));
end;

function RunSeparate(L: Plua_State):integer;cdecl;
var
  SL: Plua_State = nil; //separated lua state
  n, i, pc, status: integer;      //0 if script executes ok
  msg, errStr: String;
  arg, scrName: String;
  vclexception:boolean;
begin
  vclexception := false;
  result := 1;
  // count, script, params...
  n := lua_gettop(L);
  // writeln('>>DEBUG: '+ 'luaL_newstate');
{$IFDEF LUA51}
	SL := lua_open();
{$ELSE}
	SL := luaL_newstate();
{$ENDIF} 
  // writeln('>>DEBUG: '+ 'luaL_openlibs');
  luaL_openlibs(SL);
  pc := lua_tointeger(L,1);
  scrName := lua_tostring(L,2);
  // writeln('>>DEBUG: '+ scrName);
  n := 2;

  for i :=n to pc+n do begin
    lua_pushstring(SL, lua_tostring(L,i));
  end;
  lua_createtable(SL, pc, 1);
  for i := 0 to pc do begin
    lua_pushstring(SL, lua_tostring(L,n+i));
    lua_rawseti(SL, -2, i);
  end;

  lua_setglobal(SL, 'arg');
  status := luaL_loadfile(SL, pchar(scrName)); //
  lua_insert(SL, -(pc+1));

  if status=0 then
  try
        // writeln('>>DEBUG: '+ 'lua_pcall');
	status := lua_pcall(SL, pc, LUA_MULTRET, 0);
        // writeln('>>DEBUG: '+ inttostr(status));
        Result := 0;
  except
	on e: Exception do begin
          vclexception := true;
          errStr := e.Message;
          lua_newtable(L);
          lua_pushnumber(L,1);
          lua_pushstring(L,pchar(errStr));
          lua_rawset(L,-3);
          // writeln('>>DEBUG: '+ 'exception');
          // writeln('>>DEBUG: '+ errStr);
        end;
  end;

  if (not vclexception) and (not lua_isnil(SL,-1)) then begin
     n := lua_gettop(SL);
     Result := 1;
     lua_newtable(L);
     for i:= 1 to n-1 do begin
           lua_pushnumber(L,i);
           lua_pushstring(L,lua_tostring(SL,i+1));
           lua_rawset(L,-3);
           if status <> 0 then break;
     end;
  end;

  lua_close(SL);
end;

// *****************************************************************************

procedure LuaError(L: Plua_State; text: String; err:String);
begin

     if not(AppInitialized in Application.Flags) then
        Application.Initialize;
     if (AppInitialized in Application.Flags) then
         ShowMessage('LUA Error:'+#10#13+err+#10#13+text)
     else
        writeln('LUA Error:'+#10#13+err+#10#13+text);
     luaL_error(L, 'VCLua Error');
     // Halt;
end;

procedure DoScript(L: Plua_State; fileName: String);
begin
     if (luaL_loadfile(L, PChar(FileName)) <> 0) then begin
         ShowMessage('Cant load Lua script!');
         Halt;
     end;
     if (lua_pcall(L, 0, LUA_MULTRET, 0) <> 0) then begin
         ShowMessage('Cant execute Lua script!');
         Halt;
     end;
end;

procedure DoCall(L: Plua_State; paramCount:integer);
begin
     if (lua_pcall(L, paramCount, LUA_MULTRET, 0) <> 0) then begin
         LuaError(L,'Error in Lua script!', lua_tostring(L,-1));
     end;
end;

// ****************************************************************

function GetLuaObject(L: Plua_State; Index: Integer): TObject;
begin
	if (not lua_isnil(L, Index)) then
		Result := TObject(LuaGetTableLightUserData(L, Index, HandleStr))
	else
		Result := nil;
end;

function GetLuaUserData(L: Plua_State; Index: Integer): Pointer;
begin
	if (not lua_isnil(L, Index)) then
		Result := LuaGetTableLightUserData(L, Index, HandleStr)
	else
		Result := nil;
end;

function LuaGetTableLightUserData(L: Plua_State; TableIndex: Integer; const Key: string): Pointer;
begin
  LuaGetTable(L, TableIndex, Key);
  if lua_isnil(L,-1) then
     Result := nil
  else
     Result := lua_touserdata(L, -1);
  lua_pop(L, 1);
end;

procedure LuaGetTable(L: Plua_State; TableIndex: Integer; const Key: string);
begin
  LuaPushKeyString(L, TableIndex, Key);
  lua_gettable(L, TableIndex);
end;


procedure LuaSetTableLightUserData(L: Plua_State; TableIndex: Integer; const Key: string; P: Pointer);
begin
  LuaPushKeyString(L, TableIndex, Key);
  lua_pushlightuserdata(L, P);
  lua_settable(L, TableIndex);
end;

procedure LuaSetTableFunction(L: Plua_State; TableIndex: Integer; const Key: string; F: lua_CFunction);
begin
  LuaPushKeyString(L, TableIndex, Key);
  lua_pushcfunction(L, F);
  lua_settable(L, TableIndex);
end;

procedure LuaSetTableClear(L: Plua_State; TableIndex: Integer);
begin
  TableIndex := LuaAbsIndex(L, TableIndex);
  lua_pushnil(L);
  while (lua_next(L, TableIndex) <> 0) do
  begin
    lua_pushnil(L);
    lua_replace(L, -1 - 1);
    lua_settable(L, TableIndex);
    lua_pushnil(L);
  end;
end;

procedure LuaPushKeyString(L: Plua_State; var Index: Integer; const Key: string);
begin
  Index := LuaAbsIndex(L, Index);
  lua_pushstring(L, PChar(Key));
end;

function LuaAbsIndex(L: Plua_State; Index: Integer): Integer;
begin
{$IFDEF LUA51}
  if ((Index = LUA_GLOBALSINDEX) or (Index = LUA_REGISTRYINDEX)) then
{$ELSE}
  if ((Index = LUA_REGISTRYINDEX)) then
{$ENDIF} 
  begin
    Result := Index;
    Exit;
  end;
  if (Index < 0) then
    Result := Index + lua_gettop(L) + 1
  else
    Result := Index;
end;

procedure CheckArg(L: Plua_State; N: Integer);
begin
  if ((lua_gettop(L) <> N) and (N<>-1)) then
    LuaError(L, 'BAD parameter call!', IntToStr(N)+ 'params required!');
end;

procedure LuaRawSetTableFunction(L: Plua_State; TableIndex: Integer; const Key: string; F: lua_CFunction);
begin
  LuaPushKeyString(L, TableIndex, Key);
  lua_pushcfunction(L, F);
  lua_rawset(L, TableIndex);
end;

procedure LuaRawSetTableNil(L: Plua_State; TableIndex: Integer; const Key: string);
begin
  LuaPushKeyString(L, TableIndex, Key);
  lua_pushnil(L);
  lua_rawset(L, TableIndex);
end;

procedure LuaRawSetTableBoolean(L: Plua_State; TableIndex: Integer; const Key: string; B: Boolean);
begin
  LuaPushKeyString(L, TableIndex, Key);
  lua_pushboolean(L, B);
  lua_rawset(L, TableIndex);
end;

procedure LuaRawSetTableNumber(L: Plua_State; TableIndex: Integer; const Key: string; N: Double);
begin
  LuaPushKeyString(L, TableIndex, Key);
  lua_pushnumber(L, N);
  lua_rawset(L, TableIndex);
end;

procedure LuaRawSetTableString(L: Plua_State; TableIndex: Integer; const Key: string; S: string);
begin
  LuaPushKeyString(L, TableIndex, Key);
  lua_pushstring(L, PChar(S));
  lua_rawset(L, TableIndex);
end;

procedure LuaRawSetTableLightUserData(L: Plua_State; TableIndex: Integer; const Key: string; P: Pointer);
begin
  LuaPushKeyString(L, TableIndex, Key);
  lua_pushlightuserdata(L, P);
  lua_rawset(L, TableIndex);
end;

procedure LuaRawSetTableValue(L: Plua_State; TableIndex: Integer; const Key: string; ValueIndex: Integer);
begin
  TableIndex := LuaAbsIndex(L, TableIndex);
  ValueIndex := LuaAbsIndex(L, ValueIndex);
  lua_pushstring(L, PChar(Key));
  lua_pushvalue(L, ValueIndex);
  lua_rawset(L, TableIndex);
end;

procedure LuaRawGetTable(L: Plua_State; TableIndex: Integer; const Key: string);
begin
  LuaPushKeyString(L, TableIndex, Key);
  lua_rawget(L, TableIndex);
end;

function LuaRawGetTableBoolean(L: Plua_State; TableIndex: Integer; const Key: string): Boolean;
begin
  LuaRawGetTable(L, TableIndex, Key);
  Result := lua_toboolean(L, -1);
  lua_pop(L, 1);
end;

function LuaRawGetTableNumber(L: Plua_State; TableIndex: Integer; const Key: string): Double;
begin
  LuaRawGetTable(L, TableIndex, Key);
  Result := lua_tonumber(L, -1);
  lua_pop(L, 1);
end;

function LuaRawGetTableString(L: Plua_State; TableIndex: Integer; const Key: string): string;
begin
  LuaRawGetTable(L, TableIndex, Key);
  Result := lua_tostring(L, -1);
  lua_pop(L, 1);
end;

function LuaRawGetTableFunction(L: Plua_State; TableIndex: Integer; const Key: string): lua_CFunction;
begin
  LuaRawGetTable(L, TableIndex, Key);
  Result := lua_tocfunction(L, -1);
  lua_pop(L, 1);
end;

function LuaRawGetTableLightUserData(L: Plua_State; TableIndex: Integer; const Key: string): Pointer;
begin
  LuaRawGetTable(L, TableIndex, Key);
  Result := lua_touserdata(L, -1);
  lua_pop(L, 1);
end;



function LuaGetMetaFunction(L: Plua_State; Index: Integer; Key: string): lua_CFunction;
begin
  Result := nil;
  Index := LuaAbsIndex(L, Index);
  
{$IF defined(LUA51)}
  if not lua_getmetatable(L, Index) then
{$ELSE}
  if (lua_getmetatable(L, Index) = 0) then
{$ENDIF} 
    Exit;
  LuaGetTable(L, -1, Key);
  if lua_iscfunction(L, -1) then
    Result := lua_tocfunction(L, -1);
  lua_pop(L, 2);
end;

procedure LuaSetMetaFunction(L: Plua_State; Index: Integer; Key: string; F: lua_CFunction);
// Key = __add, __sub, __mul, __div, __pow, __unm, __concat,
//       __eq, __lt, __le, __index, __newindex, __call
begin
  Index := LuaAbsIndex(L, Index);
{$IF defined(LUA51)}
  if not lua_getmetatable(L, Index) then
{$ELSE}
  if (lua_getmetatable(L, Index) = 0) then
{$ENDIF} 
    lua_newtable(L);

  LuaRawSetTableFunction(L, -1, Key, F);
  lua_setmetatable(L, Index);
end;

function LuaStackDump(L: Plua_State):String;
var i,t,top: integer;
    ds : String;
begin
  top := lua_gettop(L);
  ds := '';
  for i := 1 to top do begin
         t := lua_type(L, i);
         case (t) of

           LUA_TSTRING:
             ds := ds + string(lua_tostring(L, i));
           LUA_TBOOLEAN:
             ds := ds + BoolToStr(lua_toboolean(L, i));
           LUA_TNUMBER:
             ds := ds + FloatToStr(lua_tonumber(L, i));
           else
             ds := ds + string(lua_typename(L, t));
         end;
         ds := IntToStr(i) + ': ' + ds + #10#13;
  end;
  result := ds;
end;

end.

