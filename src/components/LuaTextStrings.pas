(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaTextStrings;	

interface

Uses Classes, Lua, LuaController, TextStrings, TypInfo;

function CreateTextStrings(L: Plua_State): Integer; cdecl;
function IsTextStrings(L: Plua_State): Integer; cdecl;
function AsTextStrings(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TTextStrings; pti: PTypeInfo = nil); overload; inline;

type
    TLuaTextStrings = class(TTextStrings)
    public
      L:Plua_State;
    end;
var
    TextStringsFuncs: aoluaL_Reg;


implementation
Uses LuaProperties, LuaProxy, LuaObject, LuaHelper, LCLClasses;

function VCLua_TextStrings_Clear(L: Plua_State): Integer; cdecl;
var
	lTextStrings:TLuaTextStrings;
begin
	CheckArg(L, 1);
	lTextStrings := TLuaTextStrings(GetLuaObject(L, 1));
	lTextStrings.Clear();
	
	Result := 0;
end;

function VCLua_TextStrings_SetText(L: Plua_State): Integer; cdecl;
var
	lTextStrings:TLuaTextStrings;
	TheText:PChar;
begin
	CheckArg(L, 2);
	lTextStrings := TLuaTextStrings(GetLuaObject(L, 1));
	TheText := PChar(lua_toStringCP(L,2));
	lTextStrings.SetText(TheText);
	
	Result := 0;
end;

function VCLua_TextStrings_Insert(L: Plua_State): Integer; cdecl;
var
	lTextStrings:TLuaTextStrings;
	Index:Integer;
	S:string;
begin
	CheckArg(L, 3);
	lTextStrings := TLuaTextStrings(GetLuaObject(L, 1));
	Index := lua_tointeger(L,2);
	S := lua_toStringCP(L,3);
	lTextStrings.Insert(Index,S);
	
	Result := 0;
end;

function VCLua_TextStrings_Delete(L: Plua_State): Integer; cdecl;
var
	lTextStrings:TLuaTextStrings;
	Index:Integer;
begin
	CheckArg(L, 2);
	lTextStrings := TLuaTextStrings(GetLuaObject(L, 1));
	Index := lua_tointeger(L,2);
	lTextStrings.Delete(Index);
	
	Result := 0;
end;

function VCLua_TextStrings_Exchange(L: Plua_State): Integer; cdecl;
var
	lTextStrings:TLuaTextStrings;
	Index1:Integer;
	Index2:Integer;
begin
	CheckArg(L, 3);
	lTextStrings := TLuaTextStrings(GetLuaObject(L, 1));
	Index1 := lua_tointeger(L,2);
	Index2 := lua_tointeger(L,3);
	lTextStrings.Exchange(Index1,Index2);
	
	Result := 0;
end;

function VCLua_TextStrings_Move(L: Plua_State): Integer; cdecl;
var
	lTextStrings:TLuaTextStrings;
	CurIndex:Integer;
	NewIndex:Integer;
begin
	CheckArg(L, 3);
	lTextStrings := TLuaTextStrings(GetLuaObject(L, 1));
	CurIndex := lua_tointeger(L,2);
	NewIndex := lua_tointeger(L,3);
	lTextStrings.Move(CurIndex,NewIndex);
	
	Result := 0;
end;

function VCLua_TextStrings_MakeTextBufferUnique(L: Plua_State): Integer; cdecl;
var
	lTextStrings:TLuaTextStrings;
begin
	CheckArg(L, 1);
	lTextStrings := TLuaTextStrings(GetLuaObject(L, 1));
	lTextStrings.MakeTextBufferUnique();
	
	Result := 0;
end;

function VCLua_TextStrings_BeginUpdate(L: Plua_State): Integer; cdecl;
var
	lTextStrings:TLuaTextStrings;
begin
	CheckArg(L, 1);
	lTextStrings := TLuaTextStrings(GetLuaObject(L, 1));
	lTextStrings.BeginUpdate();
	
	Result := 0;
end;

function VCLua_TextStrings_EndUpdate(L: Plua_State): Integer; cdecl;
var
	lTextStrings:TLuaTextStrings;
begin
	CheckArg(L, 1);
	lTextStrings := TLuaTextStrings(GetLuaObject(L, 1));
	lTextStrings.EndUpdate();
	
	Result := 0;
end;

function VCLua_TextStrings_GetText(L: Plua_State): Integer; cdecl;
var
	lTextStrings:TLuaTextStrings;
	ret:PChar;
begin
	CheckArg(L, 1);
	lTextStrings := TLuaTextStrings(GetLuaObject(L, 1));
	ret := lTextStrings.GetText();
	lua_push(L,ret);
	
	Result := 1;
end;

function VCLua_TextStrings_IndexOf(L: Plua_State): Integer; cdecl;
var
	lTextStrings:TLuaTextStrings;
	S:string;
	ret:Integer;
begin
	CheckArg(L, 2);
	lTextStrings := TLuaTextStrings(GetLuaObject(L, 1));
	S := lua_toStringCP(L,2);
	ret := lTextStrings.IndexOf(S);
	lua_push(L,ret);
	
	Result := 1;
end;

function VCLua_TextStrings_Add(L: Plua_State): Integer; cdecl;
var
	lTextStrings:TLuaTextStrings;
	S:string;
	ret:Integer;
begin
	CheckArg(L, 2);
	lTextStrings := TLuaTextStrings(GetLuaObject(L, 1));
	S := lua_toStringCP(L,2);
	ret := lTextStrings.Add(S);
	lua_push(L,ret);
	
	Result := 1;
end;

function VCLua_TextStrings_AddObject(L: Plua_State): Integer; cdecl;
var
	lTextStrings:TLuaTextStrings;
	S:string;
	AObject:TObject;
	ret:Integer;
begin
	CheckArg(L, 3);
	lTextStrings := TLuaTextStrings(GetLuaObject(L, 1));
	S := lua_toStringCP(L,2);
	AObject := TObject(GetLuaObject(L,3));
	ret := lTextStrings.AddObject(S,AObject);
	lua_push(L,ret);
	
	Result := 1;
end;

function VCLua_TextStrings_AddStrings(L: Plua_State): Integer; cdecl;
var
	lTextStrings:TLuaTextStrings;
	TheStrings:TStrings;
begin
	CheckArg(L, 2);
	lTextStrings := TLuaTextStrings(GetLuaObject(L, 1));
	TheStrings := TStrings(GetLuaObject(L,2));
	lTextStrings.AddStrings(TheStrings);
	
	Result := 0;
end;

function VCLua_TextStrings_LoadFromFile(L: Plua_State): Integer; cdecl;
var
	lTextStrings:TLuaTextStrings;
	FileName:string;
begin
	CheckArg(L, 2);
	lTextStrings := TLuaTextStrings(GetLuaObject(L, 1));
	FileName := lua_toStringCP(L,2);
	lTextStrings.LoadFromFile(FileName);
	
	Result := 0;
end;

function VCLua_TextStrings_SaveToFile(L: Plua_State): Integer; cdecl;
var
	lTextStrings:TLuaTextStrings;
	FileName:string;
begin
	CheckArg(L, 2);
	lTextStrings := TLuaTextStrings(GetLuaObject(L, 1));
	FileName := lua_toStringCP(L,2);
	lTextStrings.SaveToFile(FileName);
	
	Result := 0;
end;

function IsTextStrings(L: Plua_State): Integer; cdecl;
begin
  CheckArg(L, 1);
  Result := 1;
  lua_push(L, GetLuaObject(L, 1) is TTextStrings);
end;
function AsTextStrings(L: Plua_State): Integer; cdecl;
var o : TObject;
begin
  CheckArg(L, 1);
  Result := 1;
  o := GetLuaObject(L, 1);
  if o is TTextStrings then
    lua_push(L, TTextStrings(o))
  else
    lua_pushnil(L);
end;
procedure lua_push(L: Plua_State; const v: TTextStrings; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TTextStrings',v);
end;
function CreateTextStrings(L: Plua_State): Integer; cdecl;
var
	lTextStrings:TLuaTextStrings;
begin
	lTextStrings := TLuaTextStrings.Create;
	CreateTableForKnownType(L,'TTextStrings',lTextStrings);
	Result := 1;
end;
begin
	SetLength(TextStringsFuncs, 16+1);
	TextStringsFuncs[0].name:='Clear';
	TextStringsFuncs[0].func:=@VCLua_TextStrings_Clear;
	TextStringsFuncs[1].name:='SetText';
	TextStringsFuncs[1].func:=@VCLua_TextStrings_SetText;
	TextStringsFuncs[2].name:='Insert';
	TextStringsFuncs[2].func:=@VCLua_TextStrings_Insert;
	TextStringsFuncs[3].name:='Delete';
	TextStringsFuncs[3].func:=@VCLua_TextStrings_Delete;
	TextStringsFuncs[4].name:='Exchange';
	TextStringsFuncs[4].func:=@VCLua_TextStrings_Exchange;
	TextStringsFuncs[5].name:='Move';
	TextStringsFuncs[5].func:=@VCLua_TextStrings_Move;
	TextStringsFuncs[6].name:='MakeTextBufferUnique';
	TextStringsFuncs[6].func:=@VCLua_TextStrings_MakeTextBufferUnique;
	TextStringsFuncs[7].name:='BeginUpdate';
	TextStringsFuncs[7].func:=@VCLua_TextStrings_BeginUpdate;
	TextStringsFuncs[8].name:='EndUpdate';
	TextStringsFuncs[8].func:=@VCLua_TextStrings_EndUpdate;
	TextStringsFuncs[9].name:='GetText';
	TextStringsFuncs[9].func:=@VCLua_TextStrings_GetText;
	TextStringsFuncs[10].name:='IndexOf';
	TextStringsFuncs[10].func:=@VCLua_TextStrings_IndexOf;
	TextStringsFuncs[11].name:='Add';
	TextStringsFuncs[11].func:=@VCLua_TextStrings_Add;
	TextStringsFuncs[12].name:='AddObject';
	TextStringsFuncs[12].func:=@VCLua_TextStrings_AddObject;
	TextStringsFuncs[13].name:='AddStrings';
	TextStringsFuncs[13].func:=@VCLua_TextStrings_AddStrings;
	TextStringsFuncs[14].name:='LoadFromFile';
	TextStringsFuncs[14].func:=@VCLua_TextStrings_LoadFromFile;
	TextStringsFuncs[15].name:='SaveToFile';
	TextStringsFuncs[15].func:=@VCLua_TextStrings_SaveToFile;
	TextStringsFuncs[16].name:=nil;
	TextStringsFuncs[16].func:=nil;

end.
