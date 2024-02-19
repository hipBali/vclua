(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaStrings;	

{$MODE Delphi}{$T+}

interface

Uses Classes, Lua, LuaController, TypInfo;

function IsStrings(L: Plua_State): Integer; cdecl;
function AsStrings(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TStrings; pti: PTypeInfo = nil); overload; inline;

type
    TLuaStrings = class(TStrings)
    public
      L:Plua_State;
    end;
var
    StringsFuncs: aoluaL_Reg;


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
	SetLength(StringsFuncs, 60+1);
	StringsFuncs[0].name:='ToObjectArray';
	StringsFuncs[0].func:=@VCLua_Strings_ToObjectArray;
	StringsFuncs[1].name:='ToObjectArray2';
	StringsFuncs[1].func:=@VCLua_Strings_ToObjectArray2;
	StringsFuncs[2].name:='ToStringArray';
	StringsFuncs[2].func:=@VCLua_Strings_ToStringArray;
	StringsFuncs[3].name:='ToStringArray2';
	StringsFuncs[3].func:=@VCLua_Strings_ToStringArray2;
	StringsFuncs[4].name:='Add';
	StringsFuncs[4].func:=@VCLua_Strings_Add;
	StringsFuncs[5].name:='AddObject';
	StringsFuncs[5].func:=@VCLua_Strings_AddObject;
	StringsFuncs[6].name:='AddPair';
	StringsFuncs[6].func:=@VCLua_Strings_AddPair;
	StringsFuncs[7].name:='AddPair2';
	StringsFuncs[7].func:=@VCLua_Strings_AddPair2;
	StringsFuncs[8].name:='AddStrings';
	StringsFuncs[8].func:=@VCLua_Strings_AddStrings;
	StringsFuncs[9].name:='AddStrings2';
	StringsFuncs[9].func:=@VCLua_Strings_AddStrings2;
	StringsFuncs[10].name:='AddStrings3';
	StringsFuncs[10].func:=@VCLua_Strings_AddStrings3;
	StringsFuncs[11].name:='AddStrings4';
	StringsFuncs[11].func:=@VCLua_Strings_AddStrings4;
	StringsFuncs[12].name:='SetStrings';
	StringsFuncs[12].func:=@VCLua_Strings_SetStrings;
	StringsFuncs[13].name:='SetStrings2';
	StringsFuncs[13].func:=@VCLua_Strings_SetStrings2;
	StringsFuncs[14].name:='AddText';
	StringsFuncs[14].func:=@VCLua_Strings_AddText;
	StringsFuncs[15].name:='AddCommaText';
	StringsFuncs[15].func:=@VCLua_Strings_AddCommaText;
	StringsFuncs[16].name:='AddDelimitedText';
	StringsFuncs[16].func:=@VCLua_Strings_AddDelimitedText;
	StringsFuncs[17].name:='AddDelimitedtext2';
	StringsFuncs[17].func:=@VCLua_Strings_AddDelimitedtext2;
	StringsFuncs[18].name:='Append';
	StringsFuncs[18].func:=@VCLua_Strings_Append;
	StringsFuncs[19].name:='Assign';
	StringsFuncs[19].func:=@VCLua_Strings_Assign;
	StringsFuncs[20].name:='BeginUpdate';
	StringsFuncs[20].func:=@VCLua_Strings_BeginUpdate;
	StringsFuncs[21].name:='Clear';
	StringsFuncs[21].func:=@VCLua_Strings_Clear;
	StringsFuncs[22].name:='Delete';
	StringsFuncs[22].func:=@VCLua_Strings_Delete;
	StringsFuncs[23].name:='EndUpdate';
	StringsFuncs[23].func:=@VCLua_Strings_EndUpdate;
	StringsFuncs[24].name:='Equals';
	StringsFuncs[24].func:=@VCLua_Strings_Equals;
	StringsFuncs[25].name:='Equals2';
	StringsFuncs[25].func:=@VCLua_Strings_Equals2;
	StringsFuncs[26].name:='Exchange';
	StringsFuncs[26].func:=@VCLua_Strings_Exchange;
	StringsFuncs[27].name:='ExtractName';
	StringsFuncs[27].func:=@VCLua_Strings_ExtractName;
	StringsFuncs[28].name:='Fill';
	StringsFuncs[28].func:=@VCLua_Strings_Fill;
	StringsFuncs[29].name:='GetNameValue';
	StringsFuncs[29].func:=@VCLua_Strings_GetNameValue;
	StringsFuncs[30].name:='GetText';
	StringsFuncs[30].func:=@VCLua_Strings_GetText;
	StringsFuncs[31].name:='IndexOf';
	StringsFuncs[31].func:=@VCLua_Strings_IndexOf;
	StringsFuncs[32].name:='IndexOf2';
	StringsFuncs[32].func:=@VCLua_Strings_IndexOf2;
	StringsFuncs[33].name:='IndexOfName';
	StringsFuncs[33].func:=@VCLua_Strings_IndexOfName;
	StringsFuncs[34].name:='IndexOfObject';
	StringsFuncs[34].func:=@VCLua_Strings_IndexOfObject;
	StringsFuncs[35].name:='Insert';
	StringsFuncs[35].func:=@VCLua_Strings_Insert;
	StringsFuncs[36].name:='InsertObject';
	StringsFuncs[36].func:=@VCLua_Strings_InsertObject;
	StringsFuncs[37].name:='LastIndexOf';
	StringsFuncs[37].func:=@VCLua_Strings_LastIndexOf;
	StringsFuncs[38].name:='LastIndexOf2';
	StringsFuncs[38].func:=@VCLua_Strings_LastIndexOf2;
	StringsFuncs[39].name:='LoadFromFile';
	StringsFuncs[39].func:=@VCLua_Strings_LoadFromFile;
	StringsFuncs[40].name:='LoadFromFile2';
	StringsFuncs[40].func:=@VCLua_Strings_LoadFromFile2;
	StringsFuncs[41].name:='LoadFromStream';
	StringsFuncs[41].func:=@VCLua_Strings_LoadFromStream;
	StringsFuncs[42].name:='LoadFromStream2';
	StringsFuncs[42].func:=@VCLua_Strings_LoadFromStream2;
	StringsFuncs[43].name:='Move';
	StringsFuncs[43].func:=@VCLua_Strings_Move;
	StringsFuncs[44].name:='Pop';
	StringsFuncs[44].func:=@VCLua_Strings_Pop;
	StringsFuncs[45].name:='Reverse';
	StringsFuncs[45].func:=@VCLua_Strings_Reverse;
	StringsFuncs[46].name:='Reverse2';
	StringsFuncs[46].func:=@VCLua_Strings_Reverse2;
	StringsFuncs[47].name:='SaveToFile';
	StringsFuncs[47].func:=@VCLua_Strings_SaveToFile;
	StringsFuncs[48].name:='SaveToFile2';
	StringsFuncs[48].func:=@VCLua_Strings_SaveToFile2;
	StringsFuncs[49].name:='SaveToStream';
	StringsFuncs[49].func:=@VCLua_Strings_SaveToStream;
	StringsFuncs[50].name:='SaveToStream2';
	StringsFuncs[50].func:=@VCLua_Strings_SaveToStream2;
	StringsFuncs[51].name:='Shift';
	StringsFuncs[51].func:=@VCLua_Strings_Shift;
	StringsFuncs[52].name:='Slice';
	StringsFuncs[52].func:=@VCLua_Strings_Slice;
	StringsFuncs[53].name:='Slice2';
	StringsFuncs[53].func:=@VCLua_Strings_Slice2;
	StringsFuncs[54].name:='SetText';
	StringsFuncs[54].func:=@VCLua_Strings_SetText;
	StringsFuncs[55].name:='Names';
	StringsFuncs[55].func:=@VCLua_Strings_Names;
	StringsFuncs[56].name:='Objects';
	StringsFuncs[56].func:=@VCLua_Strings_Objects;
	StringsFuncs[57].name:='Strings';
	StringsFuncs[57].func:=@VCLua_Strings_Strings;
	StringsFuncs[58].name:='ValueFromIndex';
	StringsFuncs[58].func:=@VCLua_Strings_ValueFromIndex;
	StringsFuncs[59].name:='Values';
	StringsFuncs[59].func:=@VCLua_Strings_Values;
	StringsFuncs[60].name:=nil;
	StringsFuncs[60].func:=nil;

end.
