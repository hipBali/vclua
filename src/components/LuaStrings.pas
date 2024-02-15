(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaStrings;	

{$MODE Delphi}{$T+}

interface

Uses Classes, Lua, LuaController, TypInfo;

function CreateStrings(L: Plua_State): Integer; cdecl;
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
Uses LuaProperties, LuaProxy, LuaObject, LuaHelper, LCLClasses, SysUtils;

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
	except
		on E: Exception do
			CallError(L, 'Strings', 'Add', E.ClassName, E.Message);
	end;

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
	luaL_check(L,2,@S);
	luaL_check(L,3,@AObject);
	try
		ret := lStrings.AddObject(S,AObject);
	except
		on E: Exception do
			CallError(L, 'Strings', 'AddObject', E.ClassName, E.Message);
	end;

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
	luaL_check(L,2,@AName);
	luaL_check(L,3,@AValue);
	try
		ret := lStrings.AddPair(AName,AValue);
	except
		on E: Exception do
			CallError(L, 'Strings', 'AddPair', E.ClassName, E.Message);
	end;

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
	luaL_check(L,2,@AName);
	luaL_check(L,3,@AValue);
	luaL_check(L,4,@AObject);
	try
		ret := lStrings.AddPair(AName,AValue,AObject);
	except
		on E: Exception do
			CallError(L, 'Strings', 'AddPair', E.ClassName, E.Message);
	end;

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
	luaL_check(L,2,@TheStrings);
	try
		lStrings.AddStrings(TheStrings);
	except
		on E: Exception do
			CallError(L, 'Strings', 'AddStrings', E.ClassName, E.Message);
	end;

	
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
	luaL_check(L,2,@TheStrings);
	luaL_check(L,3,@ClearFirst);
	try
		lStrings.AddStrings(TheStrings,ClearFirst);
	except
		on E: Exception do
			CallError(L, 'Strings', 'AddStrings', E.ClassName, E.Message);
	end;

	
	Result := 0;
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
	except
		on E: Exception do
			CallError(L, 'Strings', 'AddStrings', E.ClassName, E.Message);
	end;

	
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
	TTrait<string>.luaL_checkArray(L, 2, @TheStrings);
	luaL_check(L,3,@ClearFirst);
	try
		lStrings.AddStrings(TheStrings,ClearFirst);
	except
		on E: Exception do
			CallError(L, 'Strings', 'AddStrings', E.ClassName, E.Message);
	end;

	
	Result := 0;
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
	except
		on E: Exception do
			CallError(L, 'Strings', 'SetStrings', E.ClassName, E.Message);
	end;

	
	Result := 0;
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
	except
		on E: Exception do
			CallError(L, 'Strings', 'SetStrings', E.ClassName, E.Message);
	end;

	
	Result := 0;
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
	except
		on E: Exception do
			CallError(L, 'Strings', 'AddCommaText', E.ClassName, E.Message);
	end;

	
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
	luaL_check(L,2,@S);
	luaL_check(L,3,@ADelimiter);
	luaL_check(L,4,@AStrictDelimiter);
	try
		lStrings.AddDelimitedText(S,ADelimiter,AStrictDelimiter);
	except
		on E: Exception do
			CallError(L, 'Strings', 'AddDelimitedText', E.ClassName, E.Message);
	end;

	
	Result := 0;
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
	except
		on E: Exception do
			CallError(L, 'Strings', 'AddDelimitedtext', E.ClassName, E.Message);
	end;

	
	Result := 0;
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
	except
		on E: Exception do
			CallError(L, 'Strings', 'Append', E.ClassName, E.Message);
	end;

	
	Result := 0;
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
	except
		on E: Exception do
			CallError(L, 'Strings', 'Assign', E.ClassName, E.Message);
	end;

	
	Result := 0;
end;

function VCLua_Strings_BeginUpdate(L: Plua_State): Integer; cdecl;
var
	lStrings:TLuaStrings;
begin
	CheckArg(L, 1);
	lStrings := TLuaStrings(GetLuaObject(L, 1));
	try
		lStrings.BeginUpdate();
	except
		on E: Exception do
			CallError(L, 'Strings', 'BeginUpdate', E.ClassName, E.Message);
	end;

	
	Result := 0;
end;

function VCLua_Strings_Clear(L: Plua_State): Integer; cdecl;
var
	lStrings:TLuaStrings;
begin
	CheckArg(L, 1);
	lStrings := TLuaStrings(GetLuaObject(L, 1));
	try
		lStrings.Clear();
	except
		on E: Exception do
			CallError(L, 'Strings', 'Clear', E.ClassName, E.Message);
	end;

	
	Result := 0;
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
	except
		on E: Exception do
			CallError(L, 'Strings', 'Delete', E.ClassName, E.Message);
	end;

	
	Result := 0;
end;

function VCLua_Strings_EndUpdate(L: Plua_State): Integer; cdecl;
var
	lStrings:TLuaStrings;
begin
	CheckArg(L, 1);
	lStrings := TLuaStrings(GetLuaObject(L, 1));
	try
		lStrings.EndUpdate();
	except
		on E: Exception do
			CallError(L, 'Strings', 'EndUpdate', E.ClassName, E.Message);
	end;

	
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
	luaL_check(L,2,@Obj);
	try
		ret := lStrings.Equals(Obj);
	except
		on E: Exception do
			CallError(L, 'Strings', 'Equals', E.ClassName, E.Message);
	end;

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
	luaL_check(L,2,@TheStrings);
	try
		ret := lStrings.Equals(TheStrings);
	except
		on E: Exception do
			CallError(L, 'Strings', 'Equals', E.ClassName, E.Message);
	end;

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
	luaL_check(L,2,@Index1);
	luaL_check(L,3,@Index2);
	try
		lStrings.Exchange(Index1,Index2);
	except
		on E: Exception do
			CallError(L, 'Strings', 'Exchange', E.ClassName, E.Message);
	end;

	
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
	luaL_check(L,2,@S);
	try
		ret := lStrings.ExtractName(S);
	except
		on E: Exception do
			CallError(L, 'Strings', 'ExtractName', E.ClassName, E.Message);
	end;

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
	luaL_check(L,2,@Index);
	try
		lStrings.GetNameValue(Index,AName,AValue);
	except
		on E: Exception do
			CallError(L, 'Strings', 'GetNameValue', E.ClassName, E.Message);
	end;

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
	try
		ret := lStrings.GetText();
	except
		on E: Exception do
			CallError(L, 'Strings', 'GetText', E.ClassName, E.Message);
	end;

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
	luaL_check(L,2,@S);
	try
		ret := lStrings.IndexOf(S);
	except
		on E: Exception do
			CallError(L, 'Strings', 'IndexOf', E.ClassName, E.Message);
	end;

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
	luaL_check(L,2,@S);
	luaL_check(L,3,@aStart);
	try
		ret := lStrings.IndexOf(S,aStart);
	except
		on E: Exception do
			CallError(L, 'Strings', 'IndexOf', E.ClassName, E.Message);
	end;

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
	luaL_check(L,2,@Name);
	try
		ret := lStrings.IndexOfName(Name);
	except
		on E: Exception do
			CallError(L, 'Strings', 'IndexOfName', E.ClassName, E.Message);
	end;

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
	luaL_check(L,2,@AObject);
	try
		ret := lStrings.IndexOfObject(AObject);
	except
		on E: Exception do
			CallError(L, 'Strings', 'IndexOfObject', E.ClassName, E.Message);
	end;

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
	luaL_check(L,2,@Index);
	luaL_check(L,3,@S);
	try
		lStrings.Insert(Index,S);
	except
		on E: Exception do
			CallError(L, 'Strings', 'Insert', E.ClassName, E.Message);
	end;

	
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
	luaL_check(L,2,@Index);
	luaL_check(L,3,@S);
	luaL_check(L,4,@AObject);
	try
		lStrings.InsertObject(Index,S,AObject);
	except
		on E: Exception do
			CallError(L, 'Strings', 'InsertObject', E.ClassName, E.Message);
	end;

	
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
	luaL_check(L,2,@S);
	luaL_check(L,3,@aStart);
	try
		ret := lStrings.LastIndexOf(S,aStart);
	except
		on E: Exception do
			CallError(L, 'Strings', 'LastIndexOf', E.ClassName, E.Message);
	end;

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
	luaL_check(L,2,@S);
	try
		ret := lStrings.LastIndexOf(S);
	except
		on E: Exception do
			CallError(L, 'Strings', 'LastIndexOf', E.ClassName, E.Message);
	end;

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
	luaL_check(L,2,@FileName);
	try
		lStrings.LoadFromFile(FileName);
	except
		on E: Exception do
			CallError(L, 'Strings', 'LoadFromFile', E.ClassName, E.Message);
	end;

	
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
	luaL_check(L,2,@FileName);
	luaL_check(L,3,@IgnoreEncoding);
	try
		lStrings.LoadFromFile(FileName,IgnoreEncoding);
	except
		on E: Exception do
			CallError(L, 'Strings', 'LoadFromFile', E.ClassName, E.Message);
	end;

	
	Result := 0;
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
	except
		on E: Exception do
			CallError(L, 'Strings', 'LoadFromStream', E.ClassName, E.Message);
	end;

	
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
	luaL_check(L,2,@Stream);
	luaL_check(L,3,@IgnoreEncoding);
	try
		lStrings.LoadFromStream(Stream,IgnoreEncoding);
	except
		on E: Exception do
			CallError(L, 'Strings', 'LoadFromStream', E.ClassName, E.Message);
	end;

	
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
	luaL_check(L,2,@CurIndex);
	luaL_check(L,3,@NewIndex);
	try
		lStrings.Move(CurIndex,NewIndex);
	except
		on E: Exception do
			CallError(L, 'Strings', 'Move', E.ClassName, E.Message);
	end;

	
	Result := 0;
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
	except
		on E: Exception do
			CallError(L, 'Strings', 'SaveToFile', E.ClassName, E.Message);
	end;

	
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
	luaL_check(L,2,@FileName);
	luaL_check(L,3,@IgnoreEncoding);
	try
		lStrings.SaveToFile(FileName,IgnoreEncoding);
	except
		on E: Exception do
			CallError(L, 'Strings', 'SaveToFile', E.ClassName, E.Message);
	end;

	
	Result := 0;
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
	except
		on E: Exception do
			CallError(L, 'Strings', 'SaveToStream', E.ClassName, E.Message);
	end;

	
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
	luaL_check(L,2,@Stream);
	luaL_check(L,3,@IgnoreEncoding);
	try
		lStrings.SaveToStream(Stream,IgnoreEncoding);
	except
		on E: Exception do
			CallError(L, 'Strings', 'SaveToStream', E.ClassName, E.Message);
	end;

	
	Result := 0;
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
	except
		on E: Exception do
			CallError(L, 'Strings', 'Shift', E.ClassName, E.Message);
	end;

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
	luaL_check(L,2,@TheText);
	try
		lStrings.SetText(TheText);
	except
		on E: Exception do
			CallError(L, 'Strings', 'SetText', E.ClassName, E.Message);
	end;

	
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
	CreateTableForKnownType(L,'TStrings',v);
end;
function CreateStrings(L: Plua_State): Integer; cdecl;
var
	lStrings:TLuaStrings;
begin
	lStrings := TLuaStrings.Create;
	CreateTableForKnownType(L,'TStrings',lStrings);
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
