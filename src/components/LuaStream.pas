(*
Generated with Lua-fpc parser/generator
(C) 2018-2023 Hi-Project Ltd.
*)
unit LuaStream;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController;

procedure StreamToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaStream = class(TStream)
		public
			L:Plua_State;   
    end;


implementation
Uses LuaProperties, TypInfo, LuaProxy, LuaHelper, LCLClasses; 

function VCLua_Stream_Read(L: Plua_State): Integer; cdecl;
var 
	lStream:TLuaStream;
	Buffer:Pointer;
	Count:Longint;
	ret:Longint;
begin
	CheckArg(L, 2);
	lStream := TLuaStream(GetLuaObject(L, 1));
	Count := lua_tointeger(L,2);
	ret := lStream.Read(Buffer,Count);
	lua_pushinteger(L,ret);
	lua_pushlightuserdata(L,Buffer);
	Result := 2;
end;

function VCLua_Stream_Write(L: Plua_State): Integer; cdecl;
var 
	lStream:TLuaStream;
	Buffer:Pointer;
	Count:Longint;
	ret:Longint;
begin
	CheckArg(L, 3);
	lStream := TLuaStream(GetLuaObject(L, 1));
	Buffer := Pointer(lua_touserdata(L,2));
	Count := lua_tointeger(L,3);
	ret := lStream.Write(Buffer,Count);
	lua_pushinteger(L,ret);
	
	Result := 1;
end;

function VCLua_Stream_Seek(L: Plua_State): Integer; cdecl;
var 
	lStream:TLuaStream;
	Offset:Longint;
	Origin:Word;
	ret:Longint;
begin
	CheckArg(L, 3);
	lStream := TLuaStream(GetLuaObject(L, 1));
	Offset := lua_tointeger(L,2);
	Origin := Word(lua_tointeger(L,3));
	ret := lStream.Seek(Offset,Origin);
	lua_pushinteger(L,ret);
	
	Result := 1;
end;

function VCLua_Stream_Seek2(L: Plua_State): Integer; cdecl;
var 
	lStream:TLuaStream;
	Offset:Int64;
	Origin:TSeekOrigin;
	ret:Int64;
begin
	CheckArg(L, 3);
	lStream := TLuaStream(GetLuaObject(L, 1));
	Offset := Int64(lua_tonumber(L,2));
	Origin := TSeekOrigin(GetLuaObject(L,3));
	ret := lStream.Seek(Offset,Origin);
	lua_pushnumber(L,ret);
	
	Result := 1;
end;

function VCLua_Stream_ReadBuffer(L: Plua_State): Integer; cdecl;
var 
	lStream:TLuaStream;
	Buffer:Pointer;
	Count:Longint;
begin
	CheckArg(L, 2);
	lStream := TLuaStream(GetLuaObject(L, 1));
	Count := lua_tointeger(L,2);
	lStream.ReadBuffer(Buffer,Count);
	lua_pushlightuserdata(L,Buffer);
	Result := 1;
end;

function VCLua_Stream_WriteBuffer(L: Plua_State): Integer; cdecl;
var 
	lStream:TLuaStream;
	Buffer:Pointer;
	Count:Longint;
begin
	CheckArg(L, 3);
	lStream := TLuaStream(GetLuaObject(L, 1));
	Buffer := Pointer(lua_touserdata(L,2));
	Count := lua_tointeger(L,3);
	lStream.WriteBuffer(Buffer,Count);
	
	Result := 0;
end;

function VCLua_Stream_CopyFrom(L: Plua_State): Integer; cdecl;
var 
	lStream:TLuaStream;
	Source:TStream;
	Count:Int64;
	ret:Int64;
begin
	CheckArg(L, 3);
	lStream := TLuaStream(GetLuaObject(L, 1));
	Source := TStream(GetLuaObject(L,2));
	Count := Int64(lua_tonumber(L,3));
	ret := lStream.CopyFrom(Source,Count);
	lua_pushnumber(L,ret);
	
	Result := 1;
end;

function VCLua_Stream_ReadComponent(L: Plua_State): Integer; cdecl;
var 
	lStream:TLuaStream;
	Instance:TComponent;
	ret:TComponent;
begin
	CheckArg(L, 2);
	lStream := TLuaStream(GetLuaObject(L, 1));
	Instance := TComponent(GetLuaObject(L,2));
	ret := lStream.ReadComponent(Instance);
	lua_pushlightuserdata(L,ret);
	
	Result := 1;
end;

function VCLua_Stream_ReadComponentRes(L: Plua_State): Integer; cdecl;
var 
	lStream:TLuaStream;
	Instance:TComponent;
	ret:TComponent;
begin
	CheckArg(L, 2);
	lStream := TLuaStream(GetLuaObject(L, 1));
	Instance := TComponent(GetLuaObject(L,2));
	ret := lStream.ReadComponentRes(Instance);
	lua_pushlightuserdata(L,ret);
	
	Result := 1;
end;

function VCLua_Stream_WriteComponent(L: Plua_State): Integer; cdecl;
var 
	lStream:TLuaStream;
	Instance:TComponent;
begin
	CheckArg(L, 2);
	lStream := TLuaStream(GetLuaObject(L, 1));
	Instance := TComponent(GetLuaObject(L,2));
	lStream.WriteComponent(Instance);
	
	Result := 0;
end;

function VCLua_Stream_WriteComponentRes(L: Plua_State): Integer; cdecl;
var 
	lStream:TLuaStream;
	ResName:string;
	Instance:TComponent;
begin
	CheckArg(L, 3);
	lStream := TLuaStream(GetLuaObject(L, 1));
	ResName := lua_tostring(L,2);
	Instance := TComponent(GetLuaObject(L,3));
	lStream.WriteComponentRes(ResName,Instance);
	
	Result := 0;
end;

function VCLua_Stream_WriteDescendent(L: Plua_State): Integer; cdecl;
var 
	lStream:TLuaStream;
	Instance:TComponent;
	Ancestor:TComponent;
begin
	CheckArg(L, 3);
	lStream := TLuaStream(GetLuaObject(L, 1));
	Instance := TComponent(GetLuaObject(L,2));
	Ancestor := TComponent(GetLuaObject(L,3));
	lStream.WriteDescendent(Instance,Ancestor);
	
	Result := 0;
end;

function VCLua_Stream_WriteDescendentRes(L: Plua_State): Integer; cdecl;
var 
	lStream:TLuaStream;
	ResName:string;
	Instance:TComponent;
	Ancestor:TComponent;
begin
	CheckArg(L, 4);
	lStream := TLuaStream(GetLuaObject(L, 1));
	ResName := lua_tostring(L,2);
	Instance := TComponent(GetLuaObject(L,3));
	Ancestor := TComponent(GetLuaObject(L,4));
	lStream.WriteDescendentRes(ResName,Instance,Ancestor);
	
	Result := 0;
end;

function VCLua_Stream_WriteResourceHeader(L: Plua_State): Integer; cdecl;
var 
	lStream:TLuaStream;
	ResName:string;
	FixupInfo:Longint;
begin
	CheckArg(L, 2);
	lStream := TLuaStream(GetLuaObject(L, 1));
	ResName := lua_tostring(L,2);
	lStream.WriteResourceHeader(ResName,FixupInfo);
	lua_pushinteger(L,FixupInfo);
	Result := 1;
end;

function VCLua_Stream_FixupResourceHeader(L: Plua_State): Integer; cdecl;
var 
	lStream:TLuaStream;
	FixupInfo:Longint;
begin
	CheckArg(L, 2);
	lStream := TLuaStream(GetLuaObject(L, 1));
	FixupInfo := lua_tointeger(L,2);
	lStream.FixupResourceHeader(FixupInfo);
	
	Result := 0;
end;

function VCLua_Stream_ReadResHeader(L: Plua_State): Integer; cdecl;
var 
	lStream:TLuaStream;
begin
	CheckArg(L, 1);
	lStream := TLuaStream(GetLuaObject(L, 1));
	lStream.ReadResHeader();
	
	Result := 0;
end;

function VCLua_Stream_ReadByte(L: Plua_State): Integer; cdecl;
var 
	lStream:TLuaStream;
	ret:Byte;
begin
	CheckArg(L, 1);
	lStream := TLuaStream(GetLuaObject(L, 1));
	ret := lStream.ReadByte();
	lua_pushinteger(L,ret);
	
	Result := 1;
end;

function VCLua_Stream_ReadWord(L: Plua_State): Integer; cdecl;
var 
	lStream:TLuaStream;
	ret:Word;
begin
	CheckArg(L, 1);
	lStream := TLuaStream(GetLuaObject(L, 1));
	ret := lStream.ReadWord();
	lua_pushinteger(L,ret);
	
	Result := 1;
end;

function VCLua_Stream_ReadDWord(L: Plua_State): Integer; cdecl;
var 
	lStream:TLuaStream;
	ret:Cardinal;
begin
	CheckArg(L, 1);
	lStream := TLuaStream(GetLuaObject(L, 1));
	ret := lStream.ReadDWord();
	lua_pushinteger(L,ret);
	
	Result := 1;
end;

function VCLua_Stream_ReadQWord(L: Plua_State): Integer; cdecl;
var 
	lStream:TLuaStream;
	ret:QWord;
begin
	CheckArg(L, 1);
	lStream := TLuaStream(GetLuaObject(L, 1));
	ret := lStream.ReadQWord();
	lua_pushinteger(L,ret);
	
	Result := 1;
end;

function VCLua_Stream_ReadAnsiString(L: Plua_State): Integer; cdecl;
var 
	lStream:TLuaStream;
	ret:String;
begin
	CheckArg(L, 1);
	lStream := TLuaStream(GetLuaObject(L, 1));
	ret := lStream.ReadAnsiString();
	lua_pushstring(L,PChar(ret));
	
	Result := 1;
end;

function VCLua_Stream_WriteByte(L: Plua_State): Integer; cdecl;
var 
	lStream:TLuaStream;
	b :Byte;
begin
	CheckArg(L, 2);
	lStream := TLuaStream(GetLuaObject(L, 1));
	b  := Byte(lua_tointeger(L,2));
	lStream.WriteByte(b );
	
	Result := 0;
end;

function VCLua_Stream_WriteWord(L: Plua_State): Integer; cdecl;
var 
	lStream:TLuaStream;
	w :Word;
begin
	CheckArg(L, 2);
	lStream := TLuaStream(GetLuaObject(L, 1));
	w  := Word(lua_tointeger(L,2));
	lStream.WriteWord(w );
	
	Result := 0;
end;

function VCLua_Stream_WriteDWord(L: Plua_State): Integer; cdecl;
var 
	lStream:TLuaStream;
	d :Cardinal;
begin
	CheckArg(L, 2);
	lStream := TLuaStream(GetLuaObject(L, 1));
	d  := lua_tointeger(L,2);
	lStream.WriteDWord(d );
	
	Result := 0;
end;

function VCLua_Stream_WriteQWord(L: Plua_State): Integer; cdecl;
var 
	lStream:TLuaStream;
	q :QWord;
begin
	CheckArg(L, 2);
	lStream := TLuaStream(GetLuaObject(L, 1));
	q  := QWord(lua_tointeger(L,2));
	lStream.WriteQWord(q );
	
	Result := 0;
end;

procedure StreamToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	SetDefaultMethods(L,Index,Sender);
	LuaSetTableFunction(L, Index, 'Read', @VCLua_Stream_Read);
	LuaSetTableFunction(L, Index, 'Write', @VCLua_Stream_Write);
	LuaSetTableFunction(L, Index, 'Seek', @VCLua_Stream_Seek);
	LuaSetTableFunction(L, Index, 'Seek2', @VCLua_Stream_Seek2);
	LuaSetTableFunction(L, Index, 'ReadBuffer', @VCLua_Stream_ReadBuffer);
	LuaSetTableFunction(L, Index, 'WriteBuffer', @VCLua_Stream_WriteBuffer);
	LuaSetTableFunction(L, Index, 'CopyFrom', @VCLua_Stream_CopyFrom);
	LuaSetTableFunction(L, Index, 'ReadComponent', @VCLua_Stream_ReadComponent);
	LuaSetTableFunction(L, Index, 'ReadComponentRes', @VCLua_Stream_ReadComponentRes);
	LuaSetTableFunction(L, Index, 'WriteComponent', @VCLua_Stream_WriteComponent);
	LuaSetTableFunction(L, Index, 'WriteComponentRes', @VCLua_Stream_WriteComponentRes);
	LuaSetTableFunction(L, Index, 'WriteDescendent', @VCLua_Stream_WriteDescendent);
	LuaSetTableFunction(L, Index, 'WriteDescendentRes', @VCLua_Stream_WriteDescendentRes);
	LuaSetTableFunction(L, Index, 'WriteResourceHeader', @VCLua_Stream_WriteResourceHeader);
	LuaSetTableFunction(L, Index, 'FixupResourceHeader', @VCLua_Stream_FixupResourceHeader);
	LuaSetTableFunction(L, Index, 'ReadResHeader', @VCLua_Stream_ReadResHeader);
	LuaSetTableFunction(L, Index, 'ReadByte', @VCLua_Stream_ReadByte);
	LuaSetTableFunction(L, Index, 'ReadWord', @VCLua_Stream_ReadWord);
	LuaSetTableFunction(L, Index, 'ReadDWord', @VCLua_Stream_ReadDWord);
	LuaSetTableFunction(L, Index, 'ReadQWord', @VCLua_Stream_ReadQWord);
	LuaSetTableFunction(L, Index, 'ReadAnsiString', @VCLua_Stream_ReadAnsiString);
	LuaSetTableFunction(L, Index, 'WriteByte', @VCLua_Stream_WriteByte);
	LuaSetTableFunction(L, Index, 'WriteWord', @VCLua_Stream_WriteWord);
	LuaSetTableFunction(L, Index, 'WriteDWord', @VCLua_Stream_WriteDWord);
	LuaSetTableFunction(L, Index, 'WriteQWord', @VCLua_Stream_WriteQWord);
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
end;

end.
