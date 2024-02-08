(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaStrings;	

interface

Uses Classes, Lua, LuaController, TypInfo;

function CreateStrings(L: Plua_State): Integer; cdecl;
function IsStrings(L: Plua_State): Integer; cdecl;
function AsStrings(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TStrings; pti: PTypeInfo = nil); overload; inline;
procedure StringsToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaStrings = class(TStrings)
    public
      L:Plua_State;
    end;
var
    StringsFuncs: aoluaL_Reg;


implementation
Uses LuaProperties, LuaProxy, LuaObject, LuaHelper, LCLClasses;

function VCLua_Strings_Add(L: Plua_State): Integer; cdecl;
var
	lStrings:TLuaStrings;
	S:string;
	ret:Integer;
begin
	CheckArg(L, 2);
	lStrings := TLuaStrings(GetLuaObject(L, 1));
	S := lua_toStringCP(L,2);
	ret := lStrings.Add(S);
	lua_push(L,ret);
	
	Result := 1;
end;

function VCLua_Strings_AddObject(L: Plua_State): Integer; cdecl;
var
	lStrings:TLuaStrings;
	S:string;
	AObject:TObject;
	ret:Integer;
begin
	CheckArg(L, 3);
	lStrings := TLuaStrings(GetLuaObject(L, 1));
	S := lua_toStringCP(L,2);
	AObject := TObject(GetLuaObject(L,3));
	ret := lStrings.AddObject(S,AObject);
	lua_push(L,ret);
	
	Result := 1;
end;

function VCLua_Strings_AddPair(L: Plua_State): Integer; cdecl;
var
	lStrings:TLuaStrings;
	AName:string;
	AValue:string;
	ret:TStrings;
begin
	CheckArg(L, 3);
	lStrings := TLuaStrings(GetLuaObject(L, 1));
	AName := lua_toStringCP(L,2);
	AValue := lua_toStringCP(L,3);
	ret := lStrings.AddPair(AName,AValue);
	lua_push(L,ret);
	
	Result := 1;
end;

function VCLua_Strings_AddPair2(L: Plua_State): Integer; cdecl;
var
	lStrings:TLuaStrings;
	AName:string;
	AValue:string;
	AObject:TObject;
	ret:TStrings;
begin
	CheckArg(L, 4);
	lStrings := TLuaStrings(GetLuaObject(L, 1));
	AName := lua_toStringCP(L,2);
	AValue := lua_toStringCP(L,3);
	AObject := TObject(GetLuaObject(L,4));
	ret := lStrings.AddPair(AName,AValue,AObject);
	lua_push(L,ret);
	
	Result := 1;
end;

function VCLua_Strings_AddStrings(L: Plua_State): Integer; cdecl;
var
	lStrings:TLuaStrings;
	TheStrings:TStrings;
begin
	CheckArg(L, 2);
	lStrings := TLuaStrings(GetLuaObject(L, 1));
	TheStrings := TStrings(GetLuaObject(L,2));
	lStrings.AddStrings(TheStrings);
	
	Result := 0;
end;

function VCLua_Strings_AddStrings2(L: Plua_State): Integer; cdecl;
var
	lStrings:TLuaStrings;
	TheStrings:TStrings;
	ClearFirst:Boolean;
begin
	CheckArg(L, 3);
	lStrings := TLuaStrings(GetLuaObject(L, 1));
	TheStrings := TStrings(GetLuaObject(L,2));
	ClearFirst := lua_toboolean(L,3);
	lStrings.AddStrings(TheStrings,ClearFirst);
	
	Result := 0;
end;

function VCLua_Strings_AddStrings3(L: Plua_State): Integer; cdecl;
var
	lStrings:TLuaStrings;
	TheStrings:array of string;
begin
	CheckArg(L, 2);
	lStrings := TLuaStrings(GetLuaObject(L, 1));
	TheStrings := lua_toStringArray(L,2);
	lStrings.AddStrings(TheStrings);
	
	Result := 0;
end;

function VCLua_Strings_AddStrings4(L: Plua_State): Integer; cdecl;
var
	lStrings:TLuaStrings;
	TheStrings:array of string;
	ClearFirst:Boolean;
begin
	CheckArg(L, 3);
	lStrings := TLuaStrings(GetLuaObject(L, 1));
	TheStrings := lua_toStringArray(L,2);
	ClearFirst := lua_toboolean(L,3);
	lStrings.AddStrings(TheStrings,ClearFirst);
	
	Result := 0;
end;

function VCLua_Strings_SetStrings(L: Plua_State): Integer; cdecl;
var
	lStrings:TLuaStrings;
	TheStrings:TStrings;
begin
	CheckArg(L, 2);
	lStrings := TLuaStrings(GetLuaObject(L, 1));
	TheStrings := TStrings(GetLuaObject(L,2));
	lStrings.SetStrings(TheStrings);
	
	Result := 0;
end;

function VCLua_Strings_SetStrings2(L: Plua_State): Integer; cdecl;
var
	lStrings:TLuaStrings;
	TheStrings:array of string;
begin
	CheckArg(L, 2);
	lStrings := TLuaStrings(GetLuaObject(L, 1));
	TheStrings := lua_toStringArray(L,2);
	lStrings.SetStrings(TheStrings);
	
	Result := 0;
end;

function VCLua_Strings_AddCommaText(L: Plua_State): Integer; cdecl;
var
	lStrings:TLuaStrings;
	S:String;
begin
	CheckArg(L, 2);
	lStrings := TLuaStrings(GetLuaObject(L, 1));
	S := lua_toStringCP(L,2);
	lStrings.AddCommaText(S);
	
	Result := 0;
end;

function VCLua_Strings_AddDelimitedText(L: Plua_State): Integer; cdecl;
var
	lStrings:TLuaStrings;
	S:String;
	ADelimiter:char;
	AStrictDelimiter:Boolean;
begin
	CheckArg(L, 4);
	lStrings := TLuaStrings(GetLuaObject(L, 1));
	S := lua_toStringCP(L,2);
	ADelimiter := Char(lua_tostring(L,3));
	AStrictDelimiter := lua_toboolean(L,4);
	lStrings.AddDelimitedText(S,ADelimiter,AStrictDelimiter);
	
	Result := 0;
end;

function VCLua_Strings_AddDelimitedtext2(L: Plua_State): Integer; cdecl;
var
	lStrings:TLuaStrings;
	S:String;
begin
	CheckArg(L, 2);
	lStrings := TLuaStrings(GetLuaObject(L, 1));
	S := lua_toStringCP(L,2);
	lStrings.AddDelimitedtext(S);
	
	Result := 0;
end;

function VCLua_Strings_Append(L: Plua_State): Integer; cdecl;
var
	lStrings:TLuaStrings;
	S:string;
begin
	CheckArg(L, 2);
	lStrings := TLuaStrings(GetLuaObject(L, 1));
	S := lua_toStringCP(L,2);
	lStrings.Append(S);
	
	Result := 0;
end;

function VCLua_Strings_Assign(L: Plua_State): Integer; cdecl;
var
	lStrings:TLuaStrings;
	Source:TPersistent;
begin
	CheckArg(L, 2);
	lStrings := TLuaStrings(GetLuaObject(L, 1));
	Source := TPersistent(GetLuaObject(L,2));
	lStrings.Assign(Source);
	
	Result := 0;
end;

function VCLua_Strings_BeginUpdate(L: Plua_State): Integer; cdecl;
var
	lStrings:TLuaStrings;
begin
	CheckArg(L, 1);
	lStrings := TLuaStrings(GetLuaObject(L, 1));
	lStrings.BeginUpdate();
	
	Result := 0;
end;

function VCLua_Strings_Clear(L: Plua_State): Integer; cdecl;
var
	lStrings:TLuaStrings;
begin
	CheckArg(L, 1);
	lStrings := TLuaStrings(GetLuaObject(L, 1));
	lStrings.Clear();
	
	Result := 0;
end;

function VCLua_Strings_Delete(L: Plua_State): Integer; cdecl;
var
	lStrings:TLuaStrings;
	Index:Integer;
begin
	CheckArg(L, 2);
	lStrings := TLuaStrings(GetLuaObject(L, 1));
	Index := lua_tointeger(L,2);
	lStrings.Delete(Index);
	
	Result := 0;
end;

function VCLua_Strings_EndUpdate(L: Plua_State): Integer; cdecl;
var
	lStrings:TLuaStrings;
begin
	CheckArg(L, 1);
	lStrings := TLuaStrings(GetLuaObject(L, 1));
	lStrings.EndUpdate();
	
	Result := 0;
end;

function VCLua_Strings_Equals(L: Plua_State): Integer; cdecl;
var
	lStrings:TLuaStrings;
	Obj:TObject;
	ret:Boolean;
begin
	CheckArg(L, 2);
	lStrings := TLuaStrings(GetLuaObject(L, 1));
	Obj := TObject(GetLuaObject(L,2));
	ret := lStrings.Equals(Obj);
	lua_push(L,ret);
	
	Result := 1;
end;

function VCLua_Strings_Equals2(L: Plua_State): Integer; cdecl;
var
	lStrings:TLuaStrings;
	TheStrings:TStrings;
	ret:Boolean;
begin
	CheckArg(L, 2);
	lStrings := TLuaStrings(GetLuaObject(L, 1));
	TheStrings := TStrings(GetLuaObject(L,2));
	ret := lStrings.Equals(TheStrings);
	lua_push(L,ret);
	
	Result := 1;
end;

function VCLua_Strings_Exchange(L: Plua_State): Integer; cdecl;
var
	lStrings:TLuaStrings;
	Index1:Integer;
	Index2:Integer;
begin
	CheckArg(L, 3);
	lStrings := TLuaStrings(GetLuaObject(L, 1));
	Index1 := lua_tointeger(L,2);
	Index2 := lua_tointeger(L,3);
	lStrings.Exchange(Index1,Index2);
	
	Result := 0;
end;

function VCLua_Strings_ExtractName(L: Plua_State): Integer; cdecl;
var
	lStrings:TLuaStrings;
	S:String;
	ret:String;
begin
	CheckArg(L, 2);
	lStrings := TLuaStrings(GetLuaObject(L, 1));
	S := lua_toStringCP(L,2);
	ret := lStrings.ExtractName(S);
	lua_push(L,ret);
	
	Result := 1;
end;

function VCLua_Strings_GetNameValue(L: Plua_State): Integer; cdecl;
var
	lStrings:TLuaStrings;
	Index:Integer;
	AName:String;
	AValue:String;
begin
	CheckArg(L, 2);
	lStrings := TLuaStrings(GetLuaObject(L, 1));
	Index := lua_tointeger(L,2);
	lStrings.GetNameValue(Index,AName,AValue);
	lua_push(L,AName);
	lua_push(L,AValue);
	Result := 2;
end;

function VCLua_Strings_GetText(L: Plua_State): Integer; cdecl;
var
	lStrings:TLuaStrings;
	ret:PChar;
begin
	CheckArg(L, 1);
	lStrings := TLuaStrings(GetLuaObject(L, 1));
	ret := lStrings.GetText();
	lua_push(L,ret);
	
	Result := 1;
end;

function VCLua_Strings_IndexOf(L: Plua_State): Integer; cdecl;
var
	lStrings:TLuaStrings;
	S:string;
	ret:Integer;
begin
	CheckArg(L, 2);
	lStrings := TLuaStrings(GetLuaObject(L, 1));
	S := lua_toStringCP(L,2);
	ret := lStrings.IndexOf(S);
	lua_push(L,ret);
	
	Result := 1;
end;

function VCLua_Strings_IndexOf2(L: Plua_State): Integer; cdecl;
var
	lStrings:TLuaStrings;
	S:string;
	aStart:Integer;
	ret:Integer;
begin
	CheckArg(L, 3);
	lStrings := TLuaStrings(GetLuaObject(L, 1));
	S := lua_toStringCP(L,2);
	aStart := lua_tointeger(L,3);
	ret := lStrings.IndexOf(S,aStart);
	lua_push(L,ret);
	
	Result := 1;
end;

function VCLua_Strings_IndexOfName(L: Plua_State): Integer; cdecl;
var
	lStrings:TLuaStrings;
	Name:string;
	ret:Integer;
begin
	CheckArg(L, 2);
	lStrings := TLuaStrings(GetLuaObject(L, 1));
	Name := lua_toStringCP(L,2);
	ret := lStrings.IndexOfName(Name);
	lua_push(L,ret);
	
	Result := 1;
end;

function VCLua_Strings_IndexOfObject(L: Plua_State): Integer; cdecl;
var
	lStrings:TLuaStrings;
	AObject:TObject;
	ret:Integer;
begin
	CheckArg(L, 2);
	lStrings := TLuaStrings(GetLuaObject(L, 1));
	AObject := TObject(GetLuaObject(L,2));
	ret := lStrings.IndexOfObject(AObject);
	lua_push(L,ret);
	
	Result := 1;
end;

function VCLua_Strings_Insert(L: Plua_State): Integer; cdecl;
var
	lStrings:TLuaStrings;
	Index:Integer;
	S:string;
begin
	CheckArg(L, 3);
	lStrings := TLuaStrings(GetLuaObject(L, 1));
	Index := lua_tointeger(L,2);
	S := lua_toStringCP(L,3);
	lStrings.Insert(Index,S);
	
	Result := 0;
end;

function VCLua_Strings_InsertObject(L: Plua_State): Integer; cdecl;
var
	lStrings:TLuaStrings;
	Index:Integer;
	S:string;
	AObject:TObject;
begin
	CheckArg(L, 4);
	lStrings := TLuaStrings(GetLuaObject(L, 1));
	Index := lua_tointeger(L,2);
	S := lua_toStringCP(L,3);
	AObject := TObject(GetLuaObject(L,4));
	lStrings.InsertObject(Index,S,AObject);
	
	Result := 0;
end;

function VCLua_Strings_LastIndexOf(L: Plua_State): Integer; cdecl;
var
	lStrings:TLuaStrings;
	S:string;
	aStart:Integer;
	ret:Integer;
begin
	CheckArg(L, 3);
	lStrings := TLuaStrings(GetLuaObject(L, 1));
	S := lua_toStringCP(L,2);
	aStart := lua_tointeger(L,3);
	ret := lStrings.LastIndexOf(S,aStart);
	lua_push(L,ret);
	
	Result := 1;
end;

function VCLua_Strings_LastIndexOf2(L: Plua_State): Integer; cdecl;
var
	lStrings:TLuaStrings;
	S:string;
	ret:Integer;
begin
	CheckArg(L, 2);
	lStrings := TLuaStrings(GetLuaObject(L, 1));
	S := lua_toStringCP(L,2);
	ret := lStrings.LastIndexOf(S);
	lua_push(L,ret);
	
	Result := 1;
end;

function VCLua_Strings_LoadFromFile(L: Plua_State): Integer; cdecl;
var
	lStrings:TLuaStrings;
	FileName:string;
begin
	CheckArg(L, 2);
	lStrings := TLuaStrings(GetLuaObject(L, 1));
	FileName := lua_toStringCP(L,2);
	lStrings.LoadFromFile(FileName);
	
	Result := 0;
end;

function VCLua_Strings_LoadFromFile2(L: Plua_State): Integer; cdecl;
var
	lStrings:TLuaStrings;
	FileName:string;
	IgnoreEncoding:Boolean;
begin
	CheckArg(L, 3);
	lStrings := TLuaStrings(GetLuaObject(L, 1));
	FileName := lua_toStringCP(L,2);
	IgnoreEncoding := lua_toboolean(L,3);
	lStrings.LoadFromFile(FileName,IgnoreEncoding);
	
	Result := 0;
end;

function VCLua_Strings_LoadFromStream(L: Plua_State): Integer; cdecl;
var
	lStrings:TLuaStrings;
	Stream:TStream;
begin
	CheckArg(L, 2);
	lStrings := TLuaStrings(GetLuaObject(L, 1));
	Stream := TStream(GetLuaObject(L,2));
	lStrings.LoadFromStream(Stream);
	
	Result := 0;
end;

function VCLua_Strings_LoadFromStream2(L: Plua_State): Integer; cdecl;
var
	lStrings:TLuaStrings;
	Stream:TStream;
	IgnoreEncoding:Boolean;
begin
	CheckArg(L, 3);
	lStrings := TLuaStrings(GetLuaObject(L, 1));
	Stream := TStream(GetLuaObject(L,2));
	IgnoreEncoding := lua_toboolean(L,3);
	lStrings.LoadFromStream(Stream,IgnoreEncoding);
	
	Result := 0;
end;

function VCLua_Strings_Move(L: Plua_State): Integer; cdecl;
var
	lStrings:TLuaStrings;
	CurIndex:Integer;
	NewIndex:Integer;
begin
	CheckArg(L, 3);
	lStrings := TLuaStrings(GetLuaObject(L, 1));
	CurIndex := lua_tointeger(L,2);
	NewIndex := lua_tointeger(L,3);
	lStrings.Move(CurIndex,NewIndex);
	
	Result := 0;
end;

function VCLua_Strings_SaveToFile(L: Plua_State): Integer; cdecl;
var
	lStrings:TLuaStrings;
	FileName:string;
begin
	CheckArg(L, 2);
	lStrings := TLuaStrings(GetLuaObject(L, 1));
	FileName := lua_toStringCP(L,2);
	lStrings.SaveToFile(FileName);
	
	Result := 0;
end;

function VCLua_Strings_SaveToFile2(L: Plua_State): Integer; cdecl;
var
	lStrings:TLuaStrings;
	FileName:string;
	IgnoreEncoding:Boolean;
begin
	CheckArg(L, 3);
	lStrings := TLuaStrings(GetLuaObject(L, 1));
	FileName := lua_toStringCP(L,2);
	IgnoreEncoding := lua_toboolean(L,3);
	lStrings.SaveToFile(FileName,IgnoreEncoding);
	
	Result := 0;
end;

function VCLua_Strings_SaveToStream(L: Plua_State): Integer; cdecl;
var
	lStrings:TLuaStrings;
	Stream:TStream;
begin
	CheckArg(L, 2);
	lStrings := TLuaStrings(GetLuaObject(L, 1));
	Stream := TStream(GetLuaObject(L,2));
	lStrings.SaveToStream(Stream);
	
	Result := 0;
end;

function VCLua_Strings_SaveToStream2(L: Plua_State): Integer; cdecl;
var
	lStrings:TLuaStrings;
	Stream:TStream;
	IgnoreEncoding:Boolean;
begin
	CheckArg(L, 3);
	lStrings := TLuaStrings(GetLuaObject(L, 1));
	Stream := TStream(GetLuaObject(L,2));
	IgnoreEncoding := lua_toboolean(L,3);
	lStrings.SaveToStream(Stream,IgnoreEncoding);
	
	Result := 0;
end;

function VCLua_Strings_Shift(L: Plua_State): Integer; cdecl;
var
	lStrings:TLuaStrings;
	ret:String;
begin
	CheckArg(L, 1);
	lStrings := TLuaStrings(GetLuaObject(L, 1));
	ret := lStrings.Shift();
	lua_push(L,ret);
	
	Result := 1;
end;

function VCLua_Strings_SetText(L: Plua_State): Integer; cdecl;
var
	lStrings:TLuaStrings;
	TheText:PChar;
begin
	CheckArg(L, 2);
	lStrings := TLuaStrings(GetLuaObject(L, 1));
	TheText := PChar(lua_toStringCP(L,2));
	lStrings.SetText(TheText);
	
	Result := 0;
end;

function VCLua_Strings_ItemsToTable(L: Plua_State): Integer; cdecl;
var
  items: TStrings;
begin
  items := TStrings(GetLuaObject(L, 1));
  lua_pushStrings(L, items); 
  Result := 1;
end;

function IsStrings(L: Plua_State): Integer; cdecl;
begin
  CheckArg(L, 1);
  Result := 1;
  lua_push(L, GetLuaObject(L, 1) is TStrings);
end;
function AsStrings(L: Plua_State): Integer; cdecl;
var o : TObject;
begin
  CheckArg(L, 1);
  Result := 1;
  o := GetLuaObject(L, 1);
  if o is TStrings then
    lua_push(L, TStrings(o))
  else
    lua_pushnil(L);
end;
procedure lua_push(L: Plua_State; const v: TStrings; pti: PTypeInfo);
begin
	StringsToTable(L,-1,v);
end;
procedure StringsToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	if Sender = nil then begin
		lua_pushnil(L);
		Exit;
	end;
	SetDefaultMethods(L,Index,Sender);
	lua_pushliteral(L,'vmt');
	luaL_getmetatable(L,'TStrings');
	lua_pushliteral(L,'__index');
	lua_rawget(L,-2);
	lua_remove(L,-2);
	lua_rawset(L,-3);
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
end;
function CreateStrings(L: Plua_State): Integer; cdecl;
var
	lStrings:TLuaStrings;
begin
	lStrings := TLuaStrings.Create;
	StringsToTable(L, -1, lStrings);
	Result := 1;
end;
begin
	SetLength(StringsFuncs, 45+1);
	StringsFuncs[0].name:='Add';
	StringsFuncs[0].func:=@VCLua_Strings_Add;
	StringsFuncs[1].name:='AddObject';
	StringsFuncs[1].func:=@VCLua_Strings_AddObject;
	StringsFuncs[2].name:='AddPair';
	StringsFuncs[2].func:=@VCLua_Strings_AddPair;
	StringsFuncs[3].name:='AddPair2';
	StringsFuncs[3].func:=@VCLua_Strings_AddPair2;
	StringsFuncs[4].name:='AddStrings';
	StringsFuncs[4].func:=@VCLua_Strings_AddStrings;
	StringsFuncs[5].name:='AddStrings2';
	StringsFuncs[5].func:=@VCLua_Strings_AddStrings2;
	StringsFuncs[6].name:='AddStrings3';
	StringsFuncs[6].func:=@VCLua_Strings_AddStrings3;
	StringsFuncs[7].name:='AddStrings4';
	StringsFuncs[7].func:=@VCLua_Strings_AddStrings4;
	StringsFuncs[8].name:='SetStrings';
	StringsFuncs[8].func:=@VCLua_Strings_SetStrings;
	StringsFuncs[9].name:='SetStrings2';
	StringsFuncs[9].func:=@VCLua_Strings_SetStrings2;
	StringsFuncs[10].name:='AddCommaText';
	StringsFuncs[10].func:=@VCLua_Strings_AddCommaText;
	StringsFuncs[11].name:='AddDelimitedText';
	StringsFuncs[11].func:=@VCLua_Strings_AddDelimitedText;
	StringsFuncs[12].name:='AddDelimitedtext2';
	StringsFuncs[12].func:=@VCLua_Strings_AddDelimitedtext2;
	StringsFuncs[13].name:='Append';
	StringsFuncs[13].func:=@VCLua_Strings_Append;
	StringsFuncs[14].name:='Assign';
	StringsFuncs[14].func:=@VCLua_Strings_Assign;
	StringsFuncs[15].name:='BeginUpdate';
	StringsFuncs[15].func:=@VCLua_Strings_BeginUpdate;
	StringsFuncs[16].name:='Clear';
	StringsFuncs[16].func:=@VCLua_Strings_Clear;
	StringsFuncs[17].name:='Delete';
	StringsFuncs[17].func:=@VCLua_Strings_Delete;
	StringsFuncs[18].name:='EndUpdate';
	StringsFuncs[18].func:=@VCLua_Strings_EndUpdate;
	StringsFuncs[19].name:='Equals';
	StringsFuncs[19].func:=@VCLua_Strings_Equals;
	StringsFuncs[20].name:='Equals2';
	StringsFuncs[20].func:=@VCLua_Strings_Equals2;
	StringsFuncs[21].name:='Exchange';
	StringsFuncs[21].func:=@VCLua_Strings_Exchange;
	StringsFuncs[22].name:='ExtractName';
	StringsFuncs[22].func:=@VCLua_Strings_ExtractName;
	StringsFuncs[23].name:='GetNameValue';
	StringsFuncs[23].func:=@VCLua_Strings_GetNameValue;
	StringsFuncs[24].name:='GetText';
	StringsFuncs[24].func:=@VCLua_Strings_GetText;
	StringsFuncs[25].name:='IndexOf';
	StringsFuncs[25].func:=@VCLua_Strings_IndexOf;
	StringsFuncs[26].name:='IndexOf2';
	StringsFuncs[26].func:=@VCLua_Strings_IndexOf2;
	StringsFuncs[27].name:='IndexOfName';
	StringsFuncs[27].func:=@VCLua_Strings_IndexOfName;
	StringsFuncs[28].name:='IndexOfObject';
	StringsFuncs[28].func:=@VCLua_Strings_IndexOfObject;
	StringsFuncs[29].name:='Insert';
	StringsFuncs[29].func:=@VCLua_Strings_Insert;
	StringsFuncs[30].name:='InsertObject';
	StringsFuncs[30].func:=@VCLua_Strings_InsertObject;
	StringsFuncs[31].name:='LastIndexOf';
	StringsFuncs[31].func:=@VCLua_Strings_LastIndexOf;
	StringsFuncs[32].name:='LastIndexOf2';
	StringsFuncs[32].func:=@VCLua_Strings_LastIndexOf2;
	StringsFuncs[33].name:='LoadFromFile';
	StringsFuncs[33].func:=@VCLua_Strings_LoadFromFile;
	StringsFuncs[34].name:='LoadFromFile2';
	StringsFuncs[34].func:=@VCLua_Strings_LoadFromFile2;
	StringsFuncs[35].name:='LoadFromStream';
	StringsFuncs[35].func:=@VCLua_Strings_LoadFromStream;
	StringsFuncs[36].name:='LoadFromStream2';
	StringsFuncs[36].func:=@VCLua_Strings_LoadFromStream2;
	StringsFuncs[37].name:='Move';
	StringsFuncs[37].func:=@VCLua_Strings_Move;
	StringsFuncs[38].name:='SaveToFile';
	StringsFuncs[38].func:=@VCLua_Strings_SaveToFile;
	StringsFuncs[39].name:='SaveToFile2';
	StringsFuncs[39].func:=@VCLua_Strings_SaveToFile2;
	StringsFuncs[40].name:='SaveToStream';
	StringsFuncs[40].func:=@VCLua_Strings_SaveToStream;
	StringsFuncs[41].name:='SaveToStream2';
	StringsFuncs[41].func:=@VCLua_Strings_SaveToStream2;
	StringsFuncs[42].name:='Shift';
	StringsFuncs[42].func:=@VCLua_Strings_Shift;
	StringsFuncs[43].name:='SetText';
	StringsFuncs[43].func:=@VCLua_Strings_SetText;
	StringsFuncs[44].name:='ToTable';
	StringsFuncs[44].func:=@VCLua_Strings_ItemsToTable;
	StringsFuncs[45].name:=nil;
	StringsFuncs[45].func:=nil;

end.
