(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaStrings;	

{$MODE Delphi}{$T+}

interface

Uses Classes, Lua, LuaController, TypInfo, LuaVmt;

function IsStrings(L: Plua_State): Integer; cdecl;
function AsStrings(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TStrings; pti: PTypeInfo = nil); overload; inline;

type
    TLuaStrings = class(TStrings)
    public
      L:Plua_State;
    end;
var
    StringsFuncs: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Types;

function VCLua_Strings_ToObjectArray(L: Plua_State): Integer; cdecl;
var
	lStrings:TLuaStrings;
	aStart:Integer;
	aEnd:Integer;
	ret:TObjectDynArray;
begin
	CheckArg(L, 3);
	lStrings := TLuaStrings(GetLuaObject(L, 1));
	luaL_check(L,2,@aStart);
	luaL_check(L,3,@aEnd);
	try
		ret := lStrings.ToObjectArray(aStart,aEnd);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Strings', 'ToObjectArray', E.ClassName, E.Message);
	end;
	lua_pushArray<TObject>(L, ret);
end;

function VCLua_Strings_ToObjectArray2(L: Plua_State): Integer; cdecl;
var
	lStrings:TLuaStrings;
	ret:TObjectDynArray;
begin
	CheckArg(L, 1);
	lStrings := TLuaStrings(GetLuaObject(L, 1));
	try
		ret := lStrings.ToObjectArray();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Strings', 'ToObjectArray', E.ClassName, E.Message);
	end;
	lua_pushArray<TObject>(L, ret);
end;

function VCLua_Strings_ToStringArray(L: Plua_State): Integer; cdecl;
var
	lStrings:TLuaStrings;
	aStart:Integer;
	aEnd:Integer;
	ret:TStringDynArray;
begin
	CheckArg(L, 3);
	lStrings := TLuaStrings(GetLuaObject(L, 1));
	luaL_check(L,2,@aStart);
	luaL_check(L,3,@aEnd);
	try
		ret := lStrings.ToStringArray(aStart,aEnd);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Strings', 'ToStringArray', E.ClassName, E.Message);
	end;
	lua_pushArray<AnsiString>(L, ret);
end;

function VCLua_Strings_ToStringArray2(L: Plua_State): Integer; cdecl;
var
	lStrings:TLuaStrings;
	ret:TStringDynArray;
begin
	CheckArg(L, 1);
	lStrings := TLuaStrings(GetLuaObject(L, 1));
	try
		ret := lStrings.ToStringArray();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Strings', 'ToStringArray', E.ClassName, E.Message);
	end;
	lua_pushArray<AnsiString>(L, ret);
end;

function VCLua_Strings_Add(L: Plua_State): Integer; cdecl;
var
	lStrings:TLuaStrings;
	S:string;
	ret:Integer;
begin
	CheckArg(L, 2);
	lStrings := TLuaStrings(GetLuaObject(L, 1));
	luaL_check(L,2,@S);
	try
		ret := lStrings.Add(S);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Strings', 'Add', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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
	luaL_check(L,2,@S);
	luaL_check(L,3,@AObject);
	try
		ret := lStrings.AddObject(S,AObject);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Strings', 'AddObject', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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
	luaL_check(L,2,@AName);
	luaL_check(L,3,@AValue);
	try
		ret := lStrings.AddPair(AName,AValue);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Strings', 'AddPair', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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
	luaL_check(L,2,@AName);
	luaL_check(L,3,@AValue);
	luaL_check(L,4,@AObject);
	try
		ret := lStrings.AddPair(AName,AValue,AObject);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Strings', 'AddPair', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Strings_AddStrings(L: Plua_State): Integer; cdecl;
var
	lStrings:TLuaStrings;
	TheStrings:TStrings;
begin
	CheckArg(L, 2);
	lStrings := TLuaStrings(GetLuaObject(L, 1));
	luaL_check(L,2,@TheStrings);
	try
		lStrings.AddStrings(TheStrings);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Strings', 'AddStrings', E.ClassName, E.Message);
	end;
end;

function VCLua_Strings_AddStrings2(L: Plua_State): Integer; cdecl;
var
	lStrings:TLuaStrings;
	TheStrings:TStrings;
	ClearFirst:Boolean;
begin
	CheckArg(L, 3);
	lStrings := TLuaStrings(GetLuaObject(L, 1));
	luaL_check(L,2,@TheStrings);
	luaL_check(L,3,@ClearFirst);
	try
		lStrings.AddStrings(TheStrings,ClearFirst);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Strings', 'AddStrings', E.ClassName, E.Message);
	end;
end;

function VCLua_Strings_AddStrings3(L: Plua_State): Integer; cdecl;
var
	lStrings:TLuaStrings;
	TheStrings:array of string;
begin
	CheckArg(L, 2);
	lStrings := TLuaStrings(GetLuaObject(L, 1));
	TTrait<string>.luaL_checkArray(L, 2, @TheStrings);
	try
		lStrings.AddStrings(TheStrings);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Strings', 'AddStrings', E.ClassName, E.Message);
	end;
end;

function VCLua_Strings_AddStrings4(L: Plua_State): Integer; cdecl;
var
	lStrings:TLuaStrings;
	TheStrings:array of string;
	ClearFirst:Boolean;
begin
	CheckArg(L, 3);
	lStrings := TLuaStrings(GetLuaObject(L, 1));
	TTrait<string>.luaL_checkArray(L, 2, @TheStrings);
	luaL_check(L,3,@ClearFirst);
	try
		lStrings.AddStrings(TheStrings,ClearFirst);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Strings', 'AddStrings', E.ClassName, E.Message);
	end;
end;

function VCLua_Strings_SetStrings(L: Plua_State): Integer; cdecl;
var
	lStrings:TLuaStrings;
	TheStrings:TStrings;
begin
	CheckArg(L, 2);
	lStrings := TLuaStrings(GetLuaObject(L, 1));
	luaL_check(L,2,@TheStrings);
	try
		lStrings.SetStrings(TheStrings);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Strings', 'SetStrings', E.ClassName, E.Message);
	end;
end;

function VCLua_Strings_SetStrings2(L: Plua_State): Integer; cdecl;
var
	lStrings:TLuaStrings;
	TheStrings:array of string;
begin
	CheckArg(L, 2);
	lStrings := TLuaStrings(GetLuaObject(L, 1));
	TTrait<string>.luaL_checkArray(L, 2, @TheStrings);
	try
		lStrings.SetStrings(TheStrings);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Strings', 'SetStrings', E.ClassName, E.Message);
	end;
end;

function VCLua_Strings_AddText(L: Plua_State): Integer; cdecl;
var
	lStrings:TLuaStrings;
	S:String;
begin
	CheckArg(L, 2);
	lStrings := TLuaStrings(GetLuaObject(L, 1));
	luaL_check(L,2,@S);
	try
		lStrings.AddText(S);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Strings', 'AddText', E.ClassName, E.Message);
	end;
end;

function VCLua_Strings_AddCommaText(L: Plua_State): Integer; cdecl;
var
	lStrings:TLuaStrings;
	S:String;
begin
	CheckArg(L, 2);
	lStrings := TLuaStrings(GetLuaObject(L, 1));
	luaL_check(L,2,@S);
	try
		lStrings.AddCommaText(S);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Strings', 'AddCommaText', E.ClassName, E.Message);
	end;
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
	luaL_check(L,2,@S);
	luaL_check(L,3,@ADelimiter);
	luaL_check(L,4,@AStrictDelimiter);
	try
		lStrings.AddDelimitedText(S,ADelimiter,AStrictDelimiter);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Strings', 'AddDelimitedText', E.ClassName, E.Message);
	end;
end;

function VCLua_Strings_AddDelimitedtext2(L: Plua_State): Integer; cdecl;
var
	lStrings:TLuaStrings;
	S:String;
begin
	CheckArg(L, 2);
	lStrings := TLuaStrings(GetLuaObject(L, 1));
	luaL_check(L,2,@S);
	try
		lStrings.AddDelimitedtext(S);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Strings', 'AddDelimitedtext', E.ClassName, E.Message);
	end;
end;

function VCLua_Strings_Append(L: Plua_State): Integer; cdecl;
var
	lStrings:TLuaStrings;
	S:string;
begin
	CheckArg(L, 2);
	lStrings := TLuaStrings(GetLuaObject(L, 1));
	luaL_check(L,2,@S);
	try
		lStrings.Append(S);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Strings', 'Append', E.ClassName, E.Message);
	end;
end;

function VCLua_Strings_Assign(L: Plua_State): Integer; cdecl;
var
	lStrings:TLuaStrings;
	Source:TPersistent;
begin
	CheckArg(L, 2);
	lStrings := TLuaStrings(GetLuaObject(L, 1));
	luaL_check(L,2,@Source);
	try
		lStrings.Assign(Source);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Strings', 'Assign', E.ClassName, E.Message);
	end;
end;

function VCLua_Strings_BeginUpdate(L: Plua_State): Integer; cdecl;
var
	lStrings:TLuaStrings;
begin
	CheckArg(L, 1);
	lStrings := TLuaStrings(GetLuaObject(L, 1));
	try
		lStrings.BeginUpdate();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Strings', 'BeginUpdate', E.ClassName, E.Message);
	end;
end;

function VCLua_Strings_Clear(L: Plua_State): Integer; cdecl;
var
	lStrings:TLuaStrings;
begin
	CheckArg(L, 1);
	lStrings := TLuaStrings(GetLuaObject(L, 1));
	try
		lStrings.Clear();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Strings', 'Clear', E.ClassName, E.Message);
	end;
end;

function VCLua_Strings_Delete(L: Plua_State): Integer; cdecl;
var
	lStrings:TLuaStrings;
	Index:Integer;
begin
	CheckArg(L, 2);
	lStrings := TLuaStrings(GetLuaObject(L, 1));
	luaL_check(L,2,@Index);
	try
		lStrings.Delete(Index);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Strings', 'Delete', E.ClassName, E.Message);
	end;
end;

function VCLua_Strings_EndUpdate(L: Plua_State): Integer; cdecl;
var
	lStrings:TLuaStrings;
begin
	CheckArg(L, 1);
	lStrings := TLuaStrings(GetLuaObject(L, 1));
	try
		lStrings.EndUpdate();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Strings', 'EndUpdate', E.ClassName, E.Message);
	end;
end;

function VCLua_Strings_Equals(L: Plua_State): Integer; cdecl;
var
	lStrings:TLuaStrings;
	Obj:TObject;
	ret:Boolean;
begin
	CheckArg(L, 2);
	lStrings := TLuaStrings(GetLuaObject(L, 1));
	luaL_check(L,2,@Obj);
	try
		ret := lStrings.Equals(Obj);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Strings', 'Equals', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Strings_Equals2(L: Plua_State): Integer; cdecl;
var
	lStrings:TLuaStrings;
	TheStrings:TStrings;
	ret:Boolean;
begin
	CheckArg(L, 2);
	lStrings := TLuaStrings(GetLuaObject(L, 1));
	luaL_check(L,2,@TheStrings);
	try
		ret := lStrings.Equals(TheStrings);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Strings', 'Equals', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Strings_Exchange(L: Plua_State): Integer; cdecl;
var
	lStrings:TLuaStrings;
	Index1:Integer;
	Index2:Integer;
begin
	CheckArg(L, 3);
	lStrings := TLuaStrings(GetLuaObject(L, 1));
	luaL_check(L,2,@Index1);
	luaL_check(L,3,@Index2);
	try
		lStrings.Exchange(Index1,Index2);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Strings', 'Exchange', E.ClassName, E.Message);
	end;
end;

function VCLua_Strings_ExtractName(L: Plua_State): Integer; cdecl;
var
	lStrings:TLuaStrings;
	S:String;
	ret:String;
begin
	CheckArg(L, 2);
	lStrings := TLuaStrings(GetLuaObject(L, 1));
	luaL_check(L,2,@S);
	try
		ret := lStrings.ExtractName(S);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Strings', 'ExtractName', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Strings_Fill(L: Plua_State): Integer; cdecl;
var
	lStrings:TLuaStrings;
	aValue:String;
	aStart:Integer;
	aEnd:Integer;
begin
	CheckArg(L, 4);
	lStrings := TLuaStrings(GetLuaObject(L, 1));
	luaL_check(L,2,@aValue);
	luaL_check(L,3,@aStart);
	luaL_check(L,4,@aEnd);
	try
		lStrings.Fill(aValue,aStart,aEnd);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Strings', 'Fill', E.ClassName, E.Message);
	end;
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
	luaL_check(L,2,@Index);
	try
		lStrings.GetNameValue(Index,AName,AValue);
		Result := 2;
	except
		on E: Exception do
			CallError(L, 'Strings', 'GetNameValue', E.ClassName, E.Message);
	end;
	lua_push(L,AName);
	lua_push(L,AValue);
end;

function VCLua_Strings_GetText(L: Plua_State): Integer; cdecl;
var
	lStrings:TLuaStrings;
	ret:PChar;
begin
	CheckArg(L, 1);
	lStrings := TLuaStrings(GetLuaObject(L, 1));
	try
		ret := lStrings.GetText();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Strings', 'GetText', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Strings_IndexOf(L: Plua_State): Integer; cdecl;
var
	lStrings:TLuaStrings;
	S:string;
	ret:Integer;
begin
	CheckArg(L, 2);
	lStrings := TLuaStrings(GetLuaObject(L, 1));
	luaL_check(L,2,@S);
	try
		ret := lStrings.IndexOf(S);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Strings', 'IndexOf', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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
	luaL_check(L,2,@S);
	luaL_check(L,3,@aStart);
	try
		ret := lStrings.IndexOf(S,aStart);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Strings', 'IndexOf', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Strings_IndexOfName(L: Plua_State): Integer; cdecl;
var
	lStrings:TLuaStrings;
	Name:string;
	ret:Integer;
begin
	CheckArg(L, 2);
	lStrings := TLuaStrings(GetLuaObject(L, 1));
	luaL_check(L,2,@Name);
	try
		ret := lStrings.IndexOfName(Name);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Strings', 'IndexOfName', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Strings_IndexOfObject(L: Plua_State): Integer; cdecl;
var
	lStrings:TLuaStrings;
	AObject:TObject;
	ret:Integer;
begin
	CheckArg(L, 2);
	lStrings := TLuaStrings(GetLuaObject(L, 1));
	luaL_check(L,2,@AObject);
	try
		ret := lStrings.IndexOfObject(AObject);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Strings', 'IndexOfObject', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Strings_Insert(L: Plua_State): Integer; cdecl;
var
	lStrings:TLuaStrings;
	Index:Integer;
	S:string;
begin
	CheckArg(L, 3);
	lStrings := TLuaStrings(GetLuaObject(L, 1));
	luaL_check(L,2,@Index);
	luaL_check(L,3,@S);
	try
		lStrings.Insert(Index,S);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Strings', 'Insert', E.ClassName, E.Message);
	end;
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
	luaL_check(L,2,@Index);
	luaL_check(L,3,@S);
	luaL_check(L,4,@AObject);
	try
		lStrings.InsertObject(Index,S,AObject);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Strings', 'InsertObject', E.ClassName, E.Message);
	end;
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
	luaL_check(L,2,@S);
	luaL_check(L,3,@aStart);
	try
		ret := lStrings.LastIndexOf(S,aStart);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Strings', 'LastIndexOf', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Strings_LastIndexOf2(L: Plua_State): Integer; cdecl;
var
	lStrings:TLuaStrings;
	S:string;
	ret:Integer;
begin
	CheckArg(L, 2);
	lStrings := TLuaStrings(GetLuaObject(L, 1));
	luaL_check(L,2,@S);
	try
		ret := lStrings.LastIndexOf(S);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Strings', 'LastIndexOf', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Strings_LoadFromFile(L: Plua_State): Integer; cdecl;
var
	lStrings:TLuaStrings;
	FileName:string;
begin
	CheckArg(L, 2);
	lStrings := TLuaStrings(GetLuaObject(L, 1));
	luaL_check(L,2,@FileName);
	try
		lStrings.LoadFromFile(FileName);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Strings', 'LoadFromFile', E.ClassName, E.Message);
	end;
end;

function VCLua_Strings_LoadFromFile2(L: Plua_State): Integer; cdecl;
var
	lStrings:TLuaStrings;
	FileName:string;
	IgnoreEncoding:Boolean;
begin
	CheckArg(L, 3);
	lStrings := TLuaStrings(GetLuaObject(L, 1));
	luaL_check(L,2,@FileName);
	luaL_check(L,3,@IgnoreEncoding);
	try
		lStrings.LoadFromFile(FileName,IgnoreEncoding);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Strings', 'LoadFromFile', E.ClassName, E.Message);
	end;
end;

function VCLua_Strings_LoadFromStream(L: Plua_State): Integer; cdecl;
var
	lStrings:TLuaStrings;
	Stream:TStream;
begin
	CheckArg(L, 2);
	lStrings := TLuaStrings(GetLuaObject(L, 1));
	luaL_check(L,2,@Stream);
	try
		lStrings.LoadFromStream(Stream);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Strings', 'LoadFromStream', E.ClassName, E.Message);
	end;
end;

function VCLua_Strings_LoadFromStream2(L: Plua_State): Integer; cdecl;
var
	lStrings:TLuaStrings;
	Stream:TStream;
	IgnoreEncoding:Boolean;
begin
	CheckArg(L, 3);
	lStrings := TLuaStrings(GetLuaObject(L, 1));
	luaL_check(L,2,@Stream);
	luaL_check(L,3,@IgnoreEncoding);
	try
		lStrings.LoadFromStream(Stream,IgnoreEncoding);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Strings', 'LoadFromStream', E.ClassName, E.Message);
	end;
end;

function VCLua_Strings_Move(L: Plua_State): Integer; cdecl;
var
	lStrings:TLuaStrings;
	CurIndex:Integer;
	NewIndex:Integer;
begin
	CheckArg(L, 3);
	lStrings := TLuaStrings(GetLuaObject(L, 1));
	luaL_check(L,2,@CurIndex);
	luaL_check(L,3,@NewIndex);
	try
		lStrings.Move(CurIndex,NewIndex);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Strings', 'Move', E.ClassName, E.Message);
	end;
end;

function VCLua_Strings_Pop(L: Plua_State): Integer; cdecl;
var
	lStrings:TLuaStrings;
	ret:String;
begin
	CheckArg(L, 1);
	lStrings := TLuaStrings(GetLuaObject(L, 1));
	try
		ret := lStrings.Pop();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Strings', 'Pop', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Strings_Reverse(L: Plua_State): Integer; cdecl;
var
	lStrings:TLuaStrings;
	ret:TStrings;
begin
	CheckArg(L, 1);
	lStrings := TLuaStrings(GetLuaObject(L, 1));
	try
		ret := lStrings.Reverse();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Strings', 'Reverse', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Strings_Reverse2(L: Plua_State): Integer; cdecl;
var
	lStrings:TLuaStrings;
	aList:TStrings;
begin
	CheckArg(L, 2);
	lStrings := TLuaStrings(GetLuaObject(L, 1));
	luaL_check(L,2,@aList);
	try
		lStrings.Reverse(aList);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Strings', 'Reverse', E.ClassName, E.Message);
	end;
end;

function VCLua_Strings_SaveToFile(L: Plua_State): Integer; cdecl;
var
	lStrings:TLuaStrings;
	FileName:string;
begin
	CheckArg(L, 2);
	lStrings := TLuaStrings(GetLuaObject(L, 1));
	luaL_check(L,2,@FileName);
	try
		lStrings.SaveToFile(FileName);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Strings', 'SaveToFile', E.ClassName, E.Message);
	end;
end;

function VCLua_Strings_SaveToFile2(L: Plua_State): Integer; cdecl;
var
	lStrings:TLuaStrings;
	FileName:string;
	IgnoreEncoding:Boolean;
begin
	CheckArg(L, 3);
	lStrings := TLuaStrings(GetLuaObject(L, 1));
	luaL_check(L,2,@FileName);
	luaL_check(L,3,@IgnoreEncoding);
	try
		lStrings.SaveToFile(FileName,IgnoreEncoding);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Strings', 'SaveToFile', E.ClassName, E.Message);
	end;
end;

function VCLua_Strings_SaveToStream(L: Plua_State): Integer; cdecl;
var
	lStrings:TLuaStrings;
	Stream:TStream;
begin
	CheckArg(L, 2);
	lStrings := TLuaStrings(GetLuaObject(L, 1));
	luaL_check(L,2,@Stream);
	try
		lStrings.SaveToStream(Stream);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Strings', 'SaveToStream', E.ClassName, E.Message);
	end;
end;

function VCLua_Strings_SaveToStream2(L: Plua_State): Integer; cdecl;
var
	lStrings:TLuaStrings;
	Stream:TStream;
	IgnoreEncoding:Boolean;
begin
	CheckArg(L, 3);
	lStrings := TLuaStrings(GetLuaObject(L, 1));
	luaL_check(L,2,@Stream);
	luaL_check(L,3,@IgnoreEncoding);
	try
		lStrings.SaveToStream(Stream,IgnoreEncoding);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Strings', 'SaveToStream', E.ClassName, E.Message);
	end;
end;

function VCLua_Strings_Shift(L: Plua_State): Integer; cdecl;
var
	lStrings:TLuaStrings;
	ret:String;
begin
	CheckArg(L, 1);
	lStrings := TLuaStrings(GetLuaObject(L, 1));
	try
		ret := lStrings.Shift();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Strings', 'Shift', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Strings_Slice(L: Plua_State): Integer; cdecl;
var
	lStrings:TLuaStrings;
	fromIndex:integer;
	aList:TStrings;
begin
	CheckArg(L, 3);
	lStrings := TLuaStrings(GetLuaObject(L, 1));
	luaL_check(L,2,@fromIndex);
	luaL_check(L,3,@aList);
	try
		lStrings.Slice(fromIndex,aList);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Strings', 'Slice', E.ClassName, E.Message);
	end;
end;

function VCLua_Strings_Slice2(L: Plua_State): Integer; cdecl;
var
	lStrings:TLuaStrings;
	fromIndex:integer;
	ret:TStrings;
begin
	CheckArg(L, 2);
	lStrings := TLuaStrings(GetLuaObject(L, 1));
	luaL_check(L,2,@fromIndex);
	try
		ret := lStrings.Slice(fromIndex);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Strings', 'Slice', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Strings_SetText(L: Plua_State): Integer; cdecl;
var
	lStrings:TLuaStrings;
	TheText:PChar;
begin
	CheckArg(L, 2);
	lStrings := TLuaStrings(GetLuaObject(L, 1));
	luaL_check(L,2,@TheText);
	try
		lStrings.SetText(TheText);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Strings', 'SetText', E.ClassName, E.Message);
	end;
end;

function VCLua_Strings_Names(L: Plua_State): Integer; cdecl;
var
	lStrings:TLuaStrings;
	Index:Integer;
	ret:string;
begin
	CheckArg(L, 2);
	lStrings := TLuaStrings(GetLuaObject(L, 1));
	luaL_check(L,2,@Index);
	try
		ret := lStrings.Names[Index];
		lua_push(L,ret);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Strings', 'Names', E.ClassName, E.Message);
	end;
end;

function VCLua_Strings_Objects(L: Plua_State): Integer; cdecl;
var
	lStrings:TLuaStrings;
	Index:Integer;
	ret:TObject;
begin
	CheckArg(L, 2, 3);
	lStrings := TLuaStrings(GetLuaObject(L, 1));
	luaL_check(L,2,@Index);
	try
		if lua_isnone(L, 3) then begin
			ret := lStrings.Objects[Index];
			lua_push(L,ret,TypeInfo(ret));
			Result := 1;
		end else begin
			luaL_check(L,3,@ret);
			lStrings.Objects[Index] := ret;
			Result := 0;
		end;
	except
		on E: Exception do
			CallError(L, 'Strings', 'Objects', E.ClassName, E.Message);
	end;
end;

function VCLua_Strings_Strings(L: Plua_State): Integer; cdecl;
var
	lStrings:TLuaStrings;
	Index:Integer;
	ret:string;
begin
	CheckArg(L, 2, 3);
	lStrings := TLuaStrings(GetLuaObject(L, 1));
	luaL_check(L,2,@Index);
	try
		if lua_isnone(L, 3) then begin
			ret := lStrings.Strings[Index];
			lua_push(L,ret);
			Result := 1;
		end else begin
			luaL_check(L,3,@ret);
			lStrings.Strings[Index] := ret;
			Result := 0;
		end;
	except
		on E: Exception do
			CallError(L, 'Strings', 'Strings', E.ClassName, E.Message);
	end;
end;

function VCLua_Strings_ValueFromIndex(L: Plua_State): Integer; cdecl;
var
	lStrings:TLuaStrings;
	Index:Integer;
	ret:string;
begin
	CheckArg(L, 2, 3);
	lStrings := TLuaStrings(GetLuaObject(L, 1));
	luaL_check(L,2,@Index);
	try
		if lua_isnone(L, 3) then begin
			ret := lStrings.ValueFromIndex[Index];
			lua_push(L,ret);
			Result := 1;
		end else begin
			luaL_check(L,3,@ret);
			lStrings.ValueFromIndex[Index] := ret;
			Result := 0;
		end;
	except
		on E: Exception do
			CallError(L, 'Strings', 'ValueFromIndex', E.ClassName, E.Message);
	end;
end;

function VCLua_Strings_Values(L: Plua_State): Integer; cdecl;
var
	lStrings:TLuaStrings;
	Name:string;
	ret:string;
begin
	CheckArg(L, 2, 3);
	lStrings := TLuaStrings(GetLuaObject(L, 1));
	luaL_check(L,2,@Name);
	try
		if lua_isnone(L, 3) then begin
			ret := lStrings.Values[Name];
			lua_push(L,ret);
			Result := 1;
		end else begin
			luaL_check(L,3,@ret);
			lStrings.Values[Name] := ret;
			Result := 0;
		end;
	except
		on E: Exception do
			CallError(L, 'Strings', 'Values', E.ClassName, E.Message);
	end;
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
	CreateTableForKnownType(L,'TStrings',v);
end;

begin
	StringsFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(StringsFuncs, 'ToObjectArray', @VCLua_Strings_ToObjectArray);
	TLuaMethodInfo.Create(StringsFuncs, 'ToObjectArray2', @VCLua_Strings_ToObjectArray2);
	TLuaMethodInfo.Create(StringsFuncs, 'ToStringArray', @VCLua_Strings_ToStringArray);
	TLuaMethodInfo.Create(StringsFuncs, 'ToStringArray2', @VCLua_Strings_ToStringArray2);
	TLuaMethodInfo.Create(StringsFuncs, 'Add', @VCLua_Strings_Add);
	TLuaMethodInfo.Create(StringsFuncs, 'AddObject', @VCLua_Strings_AddObject);
	TLuaMethodInfo.Create(StringsFuncs, 'AddPair', @VCLua_Strings_AddPair);
	TLuaMethodInfo.Create(StringsFuncs, 'AddPair2', @VCLua_Strings_AddPair2);
	TLuaMethodInfo.Create(StringsFuncs, 'AddStrings', @VCLua_Strings_AddStrings);
	TLuaMethodInfo.Create(StringsFuncs, 'AddStrings2', @VCLua_Strings_AddStrings2);
	TLuaMethodInfo.Create(StringsFuncs, 'AddStrings3', @VCLua_Strings_AddStrings3);
	TLuaMethodInfo.Create(StringsFuncs, 'AddStrings4', @VCLua_Strings_AddStrings4);
	TLuaMethodInfo.Create(StringsFuncs, 'SetStrings', @VCLua_Strings_SetStrings);
	TLuaMethodInfo.Create(StringsFuncs, 'SetStrings2', @VCLua_Strings_SetStrings2);
	TLuaMethodInfo.Create(StringsFuncs, 'AddText', @VCLua_Strings_AddText);
	TLuaMethodInfo.Create(StringsFuncs, 'AddCommaText', @VCLua_Strings_AddCommaText);
	TLuaMethodInfo.Create(StringsFuncs, 'AddDelimitedText', @VCLua_Strings_AddDelimitedText);
	TLuaMethodInfo.Create(StringsFuncs, 'AddDelimitedtext2', @VCLua_Strings_AddDelimitedtext2);
	TLuaMethodInfo.Create(StringsFuncs, 'Append', @VCLua_Strings_Append);
	TLuaMethodInfo.Create(StringsFuncs, 'Assign', @VCLua_Strings_Assign);
	TLuaMethodInfo.Create(StringsFuncs, 'BeginUpdate', @VCLua_Strings_BeginUpdate);
	TLuaMethodInfo.Create(StringsFuncs, 'Clear', @VCLua_Strings_Clear);
	TLuaMethodInfo.Create(StringsFuncs, 'Delete', @VCLua_Strings_Delete);
	TLuaMethodInfo.Create(StringsFuncs, 'EndUpdate', @VCLua_Strings_EndUpdate);
	TLuaMethodInfo.Create(StringsFuncs, 'Equals', @VCLua_Strings_Equals);
	TLuaMethodInfo.Create(StringsFuncs, 'Equals2', @VCLua_Strings_Equals2);
	TLuaMethodInfo.Create(StringsFuncs, 'Exchange', @VCLua_Strings_Exchange);
	TLuaMethodInfo.Create(StringsFuncs, 'ExtractName', @VCLua_Strings_ExtractName);
	TLuaMethodInfo.Create(StringsFuncs, 'Fill', @VCLua_Strings_Fill);
	TLuaMethodInfo.Create(StringsFuncs, 'GetNameValue', @VCLua_Strings_GetNameValue);
	TLuaMethodInfo.Create(StringsFuncs, 'GetText', @VCLua_Strings_GetText);
	TLuaMethodInfo.Create(StringsFuncs, 'IndexOf', @VCLua_Strings_IndexOf);
	TLuaMethodInfo.Create(StringsFuncs, 'IndexOf2', @VCLua_Strings_IndexOf2);
	TLuaMethodInfo.Create(StringsFuncs, 'IndexOfName', @VCLua_Strings_IndexOfName);
	TLuaMethodInfo.Create(StringsFuncs, 'IndexOfObject', @VCLua_Strings_IndexOfObject);
	TLuaMethodInfo.Create(StringsFuncs, 'Insert', @VCLua_Strings_Insert);
	TLuaMethodInfo.Create(StringsFuncs, 'InsertObject', @VCLua_Strings_InsertObject);
	TLuaMethodInfo.Create(StringsFuncs, 'LastIndexOf', @VCLua_Strings_LastIndexOf);
	TLuaMethodInfo.Create(StringsFuncs, 'LastIndexOf2', @VCLua_Strings_LastIndexOf2);
	TLuaMethodInfo.Create(StringsFuncs, 'LoadFromFile', @VCLua_Strings_LoadFromFile);
	TLuaMethodInfo.Create(StringsFuncs, 'LoadFromFile2', @VCLua_Strings_LoadFromFile2);
	TLuaMethodInfo.Create(StringsFuncs, 'LoadFromStream', @VCLua_Strings_LoadFromStream);
	TLuaMethodInfo.Create(StringsFuncs, 'LoadFromStream2', @VCLua_Strings_LoadFromStream2);
	TLuaMethodInfo.Create(StringsFuncs, 'Move', @VCLua_Strings_Move);
	TLuaMethodInfo.Create(StringsFuncs, 'Pop', @VCLua_Strings_Pop);
	TLuaMethodInfo.Create(StringsFuncs, 'Reverse', @VCLua_Strings_Reverse);
	TLuaMethodInfo.Create(StringsFuncs, 'Reverse2', @VCLua_Strings_Reverse2);
	TLuaMethodInfo.Create(StringsFuncs, 'SaveToFile', @VCLua_Strings_SaveToFile);
	TLuaMethodInfo.Create(StringsFuncs, 'SaveToFile2', @VCLua_Strings_SaveToFile2);
	TLuaMethodInfo.Create(StringsFuncs, 'SaveToStream', @VCLua_Strings_SaveToStream);
	TLuaMethodInfo.Create(StringsFuncs, 'SaveToStream2', @VCLua_Strings_SaveToStream2);
	TLuaMethodInfo.Create(StringsFuncs, 'Shift', @VCLua_Strings_Shift);
	TLuaMethodInfo.Create(StringsFuncs, 'Slice', @VCLua_Strings_Slice);
	TLuaMethodInfo.Create(StringsFuncs, 'Slice2', @VCLua_Strings_Slice2);
	TLuaMethodInfo.Create(StringsFuncs, 'SetText', @VCLua_Strings_SetText);
	TLuaMethodInfo.Create(StringsFuncs, 'Names', @VCLua_Strings_Names);
	TLuaMethodInfo.Create(StringsFuncs, 'Objects', @VCLua_Strings_Objects);
	TLuaMethodInfo.Create(StringsFuncs, 'Strings', @VCLua_Strings_Strings);
	TLuaMethodInfo.Create(StringsFuncs, 'ValueFromIndex', @VCLua_Strings_ValueFromIndex);
	TLuaMethodInfo.Create(StringsFuncs, 'Values', @VCLua_Strings_Values);
end.
