(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaStrings;	

interface

Uses Classes, Lua, LuaController;

function CreateStrings(L: Plua_State): Integer; cdecl;
procedure StringsToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaStrings = class(TStrings)
    public
      L:Plua_State;
    end;


implementation
Uses LuaProperties, TypInfo, LuaProxy, LuaObject, LuaHelper, LCLClasses; 

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
	lua_pushinteger(L,ret);
	
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
	lua_pushinteger(L,ret);
	
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
	StringsToTable(L,-1,ret);
	
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
	StringsToTable(L,-1,ret);
	
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

function VCLua_Strings_AddDelimitedtext_(L: Plua_State): Integer; cdecl;
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
	lua_pushboolean(L,ret);
	
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
	lua_pushboolean(L,ret);
	
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
	lua_pushStringCP(L,ret);
	
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
	lua_pushStringCP(L,AName);
	lua_pushStringCP(L,AValue);
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
	lua_pushStringCP(L,ret);
	
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
	lua_pushinteger(L,ret);
	
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
	lua_pushinteger(L,ret);
	
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
	lua_pushinteger(L,ret);
	
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
	lua_pushinteger(L,ret);
	
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
	lua_pushinteger(L,ret);
	
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
	lua_pushinteger(L,ret);
	
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
	lua_pushStringCP(L,ret);
	
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

procedure StringsToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	if Sender = nil then begin
		lua_pushnil(L);
		Exit;
	end;
	SetDefaultMethods(L,Index,Sender);
	LuaSetTableFunction(L, Index, 'Add', @VCLua_Strings_Add);
	LuaSetTableFunction(L, Index, 'AddObject', @VCLua_Strings_AddObject);
	LuaSetTableFunction(L, Index, 'AddPair', @VCLua_Strings_AddPair);
	LuaSetTableFunction(L, Index, 'AddPair2', @VCLua_Strings_AddPair2);
	LuaSetTableFunction(L, Index, 'AddStrings', @VCLua_Strings_AddStrings);
	LuaSetTableFunction(L, Index, 'AddStrings2', @VCLua_Strings_AddStrings2);
	LuaSetTableFunction(L, Index, 'AddStrings3', @VCLua_Strings_AddStrings3);
	LuaSetTableFunction(L, Index, 'AddStrings4', @VCLua_Strings_AddStrings4);
	LuaSetTableFunction(L, Index, 'SetStrings', @VCLua_Strings_SetStrings);
	LuaSetTableFunction(L, Index, 'SetStrings2', @VCLua_Strings_SetStrings2);
	LuaSetTableFunction(L, Index, 'AddCommaText', @VCLua_Strings_AddCommaText);
	LuaSetTableFunction(L, Index, 'AddDelimitedText', @VCLua_Strings_AddDelimitedText);
	LuaSetTableFunction(L, Index, 'AddDelimitedtext', @VCLua_Strings_AddDelimitedtext_);
	LuaSetTableFunction(L, Index, 'Append', @VCLua_Strings_Append);
	LuaSetTableFunction(L, Index, 'Assign', @VCLua_Strings_Assign);
	LuaSetTableFunction(L, Index, 'BeginUpdate', @VCLua_Strings_BeginUpdate);
	LuaSetTableFunction(L, Index, 'Clear', @VCLua_Strings_Clear);
	LuaSetTableFunction(L, Index, 'Delete', @VCLua_Strings_Delete);
	LuaSetTableFunction(L, Index, 'EndUpdate', @VCLua_Strings_EndUpdate);
	LuaSetTableFunction(L, Index, 'Equals', @VCLua_Strings_Equals);
	LuaSetTableFunction(L, Index, 'Equals2', @VCLua_Strings_Equals2);
	LuaSetTableFunction(L, Index, 'Exchange', @VCLua_Strings_Exchange);
	LuaSetTableFunction(L, Index, 'ExtractName', @VCLua_Strings_ExtractName);
	LuaSetTableFunction(L, Index, 'GetNameValue', @VCLua_Strings_GetNameValue);
	LuaSetTableFunction(L, Index, 'GetText', @VCLua_Strings_GetText);
	LuaSetTableFunction(L, Index, 'IndexOf', @VCLua_Strings_IndexOf);
	LuaSetTableFunction(L, Index, 'IndexOf2', @VCLua_Strings_IndexOf2);
	LuaSetTableFunction(L, Index, 'IndexOfName', @VCLua_Strings_IndexOfName);
	LuaSetTableFunction(L, Index, 'IndexOfObject', @VCLua_Strings_IndexOfObject);
	LuaSetTableFunction(L, Index, 'Insert', @VCLua_Strings_Insert);
	LuaSetTableFunction(L, Index, 'InsertObject', @VCLua_Strings_InsertObject);
	LuaSetTableFunction(L, Index, 'LastIndexOf', @VCLua_Strings_LastIndexOf);
	LuaSetTableFunction(L, Index, 'LastIndexOf2', @VCLua_Strings_LastIndexOf2);
	LuaSetTableFunction(L, Index, 'LoadFromFile', @VCLua_Strings_LoadFromFile);
	LuaSetTableFunction(L, Index, 'LoadFromFile2', @VCLua_Strings_LoadFromFile2);
	LuaSetTableFunction(L, Index, 'LoadFromStream', @VCLua_Strings_LoadFromStream);
	LuaSetTableFunction(L, Index, 'LoadFromStream2', @VCLua_Strings_LoadFromStream2);
	LuaSetTableFunction(L, Index, 'Move', @VCLua_Strings_Move);
	LuaSetTableFunction(L, Index, 'SaveToFile', @VCLua_Strings_SaveToFile);
	LuaSetTableFunction(L, Index, 'SaveToFile2', @VCLua_Strings_SaveToFile2);
	LuaSetTableFunction(L, Index, 'SaveToStream', @VCLua_Strings_SaveToStream);
	LuaSetTableFunction(L, Index, 'SaveToStream2', @VCLua_Strings_SaveToStream2);
	LuaSetTableFunction(L, Index, 'Shift', @VCLua_Strings_Shift);
	LuaSetTableFunction(L, Index, 'SetText', @VCLua_Strings_SetText);
	LuaSetTableFunction(L, Index, 'ToTable', @VCLua_Strings_ItemsToTable);
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
end.
