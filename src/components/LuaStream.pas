(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaStream;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaController, TypInfo, LuaVmt, Classes;

procedure lua_push(L: Plua_State; const v: TStream; pti: PTypeInfo = nil); overload; inline;

type
    TLuaStream = class(TStream)
    end;
var
    StreamFuncs: TLuaVmt;
    StreamSets: TLuaVmt;

procedure lua_push(L: Plua_State; const v: TCustomMemoryStream; pti: PTypeInfo = nil); overload; inline;

type
    TLuaCustomMemoryStream = class(TCustomMemoryStream)
    end;
var
    CustomMemoryStreamFuncs: TLuaVmt;
    CustomMemoryStreamSets: TLuaVmt;

function CreateMemoryStream(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TMemoryStream; pti: PTypeInfo = nil); overload; inline;

type
    TLuaMemoryStream = class(TMemoryStream)
    end;
var
    MemoryStreamFuncs: TLuaVmt;
    MemoryStreamSets: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Controls;

function VCLua_Stream_Read(L: Plua_State): Integer; cdecl;
var
	lStream:TLuaStream;
	Buffer:Pointer;
	Count:Longint;
	ret:Longint;
begin
	CheckArg(L, 2);
	lStream := TLuaStream(GetLuaObject(L, 1));
	luaL_check(L,2,@Count);
	try
		ret := lStream.Read(Buffer,Count);
		Result := 2;
	except
		on E: Exception do
			CallError(L, 'Stream', 'Read', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
	lua_pushlightuserdata(L,Buffer);
end;

function VCLua_Stream_Read2(L: Plua_State): Integer; cdecl;
var
	lStream:TLuaStream;
	Buffer:Pointer;
	Count:Longint;
	ret:Longint;
begin
	CheckArg(L, 3);
	lStream := TLuaStream(GetLuaObject(L, 1));
	Buffer := Pointer(lua_touserdata(L,2));
	luaL_check(L,3,@Count);
	try
		ret := lStream.Read(Buffer,Count);
		Result := 2;
	except
		on E: Exception do
			CallError(L, 'Stream', 'Read', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
	lua_pushlightuserdata(L,Buffer);
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
	luaL_check(L,3,@Count);
	try
		ret := lStream.Write(Buffer,Count);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Stream', 'Write', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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
	luaL_check(L,2,@Offset);
	luaL_check(L,3,@Origin);
	try
		ret := lStream.Seek(Offset,Origin);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Stream', 'Seek', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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
	luaL_check(L,2,@Offset);
	luaL_check(L,3,@Origin,TypeInfo(TSeekOrigin));
	try
		ret := lStream.Seek(Offset,Origin);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Stream', 'Seek', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Stream_ReadBuffer(L: Plua_State): Integer; cdecl;
var
	lStream:TLuaStream;
	Buffer:Pointer;
	Count:Longint;
begin
	CheckArg(L, 2);
	lStream := TLuaStream(GetLuaObject(L, 1));
	luaL_check(L,2,@Count);
	try
		lStream.ReadBuffer(Buffer,Count);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Stream', 'ReadBuffer', E.ClassName, E.Message);
	end;
	lua_pushlightuserdata(L,Buffer);
end;

function VCLua_Stream_ReadBuffer2(L: Plua_State): Integer; cdecl;
var
	lStream:TLuaStream;
	Buffer:Pointer;
	Count:Longint;
begin
	CheckArg(L, 3);
	lStream := TLuaStream(GetLuaObject(L, 1));
	Buffer := Pointer(lua_touserdata(L,2));
	luaL_check(L,3,@Count);
	try
		lStream.ReadBuffer(Buffer,Count);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Stream', 'ReadBuffer', E.ClassName, E.Message);
	end;
	lua_pushlightuserdata(L,Buffer);
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
	luaL_check(L,3,@Count);
	try
		lStream.WriteBuffer(Buffer,Count);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Stream', 'WriteBuffer', E.ClassName, E.Message);
	end;
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
	luaL_check(L,2,@Source);
	luaL_check(L,3,@Count);
	try
		ret := lStream.CopyFrom(Source,Count);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Stream', 'CopyFrom', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Stream_ReadComponent(L: Plua_State): Integer; cdecl;
var
	lStream:TLuaStream;
	Instance:TComponent;
	ret:TComponent;
begin
	CheckArg(L, 2);
	lStream := TLuaStream(GetLuaObject(L, 1));
	luaL_check(L,2,@Instance);
	try
		ret := lStream.ReadComponent(Instance);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Stream', 'ReadComponent', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_Stream_ReadComponentRes(L: Plua_State): Integer; cdecl;
var
	lStream:TLuaStream;
	Instance:TComponent;
	ret:TComponent;
begin
	CheckArg(L, 2);
	lStream := TLuaStream(GetLuaObject(L, 1));
	luaL_check(L,2,@Instance);
	try
		ret := lStream.ReadComponentRes(Instance);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Stream', 'ReadComponentRes', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_Stream_WriteComponent(L: Plua_State): Integer; cdecl;
var
	lStream:TLuaStream;
	Instance:TComponent;
begin
	CheckArg(L, 2);
	lStream := TLuaStream(GetLuaObject(L, 1));
	luaL_check(L,2,@Instance);
	try
		lStream.WriteComponent(Instance);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Stream', 'WriteComponent', E.ClassName, E.Message);
	end;
end;

function VCLua_Stream_WriteComponentRes(L: Plua_State): Integer; cdecl;
var
	lStream:TLuaStream;
	ResName:string;
	Instance:TComponent;
begin
	CheckArg(L, 3);
	lStream := TLuaStream(GetLuaObject(L, 1));
	luaL_check(L,2,@ResName);
	luaL_check(L,3,@Instance);
	try
		lStream.WriteComponentRes(ResName,Instance);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Stream', 'WriteComponentRes', E.ClassName, E.Message);
	end;
end;

function VCLua_Stream_WriteDescendent(L: Plua_State): Integer; cdecl;
var
	lStream:TLuaStream;
	Instance:TComponent;
	Ancestor:TComponent;
begin
	CheckArg(L, 3);
	lStream := TLuaStream(GetLuaObject(L, 1));
	luaL_check(L,2,@Instance);
	luaL_check(L,3,@Ancestor);
	try
		lStream.WriteDescendent(Instance,Ancestor);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Stream', 'WriteDescendent', E.ClassName, E.Message);
	end;
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
	luaL_check(L,2,@ResName);
	luaL_check(L,3,@Instance);
	luaL_check(L,4,@Ancestor);
	try
		lStream.WriteDescendentRes(ResName,Instance,Ancestor);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Stream', 'WriteDescendentRes', E.ClassName, E.Message);
	end;
end;

function VCLua_Stream_WriteResourceHeader(L: Plua_State): Integer; cdecl;
var
	lStream:TLuaStream;
	ResName:string;
	FixupInfo:Longint;
begin
	CheckArg(L, 2);
	lStream := TLuaStream(GetLuaObject(L, 1));
	luaL_check(L,2,@ResName);
	try
		lStream.WriteResourceHeader(ResName,FixupInfo);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Stream', 'WriteResourceHeader', E.ClassName, E.Message);
	end;
	lua_push(L,FixupInfo);
end;

function VCLua_Stream_WriteResourceHeader2(L: Plua_State): Integer; cdecl;
var
	lStream:TLuaStream;
	ResName:string;
	FixupInfo:Longint;
begin
	CheckArg(L, 3);
	lStream := TLuaStream(GetLuaObject(L, 1));
	luaL_check(L,2,@ResName);
	luaL_check(L,3,@FixupInfo);
	try
		lStream.WriteResourceHeader(ResName,FixupInfo);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Stream', 'WriteResourceHeader', E.ClassName, E.Message);
	end;
	lua_push(L,FixupInfo);
end;

function VCLua_Stream_FixupResourceHeader(L: Plua_State): Integer; cdecl;
var
	lStream:TLuaStream;
	FixupInfo:Longint;
begin
	CheckArg(L, 2);
	lStream := TLuaStream(GetLuaObject(L, 1));
	luaL_check(L,2,@FixupInfo);
	try
		lStream.FixupResourceHeader(FixupInfo);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Stream', 'FixupResourceHeader', E.ClassName, E.Message);
	end;
end;

function VCLua_Stream_ReadResHeader(L: Plua_State): Integer; cdecl;
var
	lStream:TLuaStream;
begin
	CheckArg(L, 1);
	lStream := TLuaStream(GetLuaObject(L, 1));
	try
		lStream.ReadResHeader();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Stream', 'ReadResHeader', E.ClassName, E.Message);
	end;
end;

function VCLua_Stream_ReadByte(L: Plua_State): Integer; cdecl;
var
	lStream:TLuaStream;
	ret:Byte;
begin
	CheckArg(L, 1);
	lStream := TLuaStream(GetLuaObject(L, 1));
	try
		ret := lStream.ReadByte();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Stream', 'ReadByte', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Stream_ReadWord(L: Plua_State): Integer; cdecl;
var
	lStream:TLuaStream;
	ret:Word;
begin
	CheckArg(L, 1);
	lStream := TLuaStream(GetLuaObject(L, 1));
	try
		ret := lStream.ReadWord();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Stream', 'ReadWord', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Stream_ReadDWord(L: Plua_State): Integer; cdecl;
var
	lStream:TLuaStream;
	ret:Cardinal;
begin
	CheckArg(L, 1);
	lStream := TLuaStream(GetLuaObject(L, 1));
	try
		ret := lStream.ReadDWord();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Stream', 'ReadDWord', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Stream_ReadQWord(L: Plua_State): Integer; cdecl;
var
	lStream:TLuaStream;
	ret:QWord;
begin
	CheckArg(L, 1);
	lStream := TLuaStream(GetLuaObject(L, 1));
	try
		ret := lStream.ReadQWord();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Stream', 'ReadQWord', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Stream_ReadAnsiString(L: Plua_State): Integer; cdecl;
var
	lStream:TLuaStream;
	ret:String;
begin
	CheckArg(L, 1);
	lStream := TLuaStream(GetLuaObject(L, 1));
	try
		ret := lStream.ReadAnsiString();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Stream', 'ReadAnsiString', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Stream_WriteByte(L: Plua_State): Integer; cdecl;
var
	lStream:TLuaStream;
	b:Byte;
begin
	CheckArg(L, 2);
	lStream := TLuaStream(GetLuaObject(L, 1));
	luaL_check(L,2,@b);
	try
		lStream.WriteByte(b);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Stream', 'WriteByte', E.ClassName, E.Message);
	end;
end;

function VCLua_Stream_WriteWord(L: Plua_State): Integer; cdecl;
var
	lStream:TLuaStream;
	w:Word;
begin
	CheckArg(L, 2);
	lStream := TLuaStream(GetLuaObject(L, 1));
	luaL_check(L,2,@w);
	try
		lStream.WriteWord(w);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Stream', 'WriteWord', E.ClassName, E.Message);
	end;
end;

function VCLua_Stream_WriteDWord(L: Plua_State): Integer; cdecl;
var
	lStream:TLuaStream;
	d:Cardinal;
begin
	CheckArg(L, 2);
	lStream := TLuaStream(GetLuaObject(L, 1));
	luaL_check(L,2,@d);
	try
		lStream.WriteDWord(d);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Stream', 'WriteDWord', E.ClassName, E.Message);
	end;
end;

function VCLua_Stream_WriteQWord(L: Plua_State): Integer; cdecl;
var
	lStream:TLuaStream;
	q:QWord;
begin
	CheckArg(L, 2);
	lStream := TLuaStream(GetLuaObject(L, 1));
	luaL_check(L,2,@q);
	try
		lStream.WriteQWord(q);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Stream', 'WriteQWord', E.ClassName, E.Message);
	end;
end;

function VCLua_Stream_WriteAnsiString(L: Plua_State): Integer; cdecl;
var
	lStream:TLuaStream;
	S:String;
begin
	CheckArg(L, 2);
	lStream := TLuaStream(GetLuaObject(L, 1));
	luaL_check(L,2,@S);
	try
		lStream.WriteAnsiString(S);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Stream', 'WriteAnsiString', E.ClassName, E.Message);
	end;
end;

function VCLua_Stream_VCLuaSetPosition(L: Plua_State): Integer; cdecl;
var
	lStream:TLuaStream;
	val:Int64;
begin
	lStream := TLuaStream(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lStream.Position := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Stream', 'SetPosition', E.ClassName, E.Message);
	end;
end;

function VCLua_Stream_VCLuaGetPosition(L: Plua_State): Integer; cdecl;
var
	lStream:TLuaStream;
	ret:Int64;
begin
	lStream := TLuaStream(GetLuaObjectUnsafe(L, 1));
	try
		ret := lStream.Position;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Stream', 'GetPosition', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Stream_VCLuaSetSize(L: Plua_State): Integer; cdecl;
var
	lStream:TLuaStream;
	val:Int64;
begin
	lStream := TLuaStream(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lStream.Size := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Stream', 'SetSize', E.ClassName, E.Message);
	end;
end;

function VCLua_Stream_VCLuaGetSize(L: Plua_State): Integer; cdecl;
var
	lStream:TLuaStream;
	ret:Int64;
begin
	lStream := TLuaStream(GetLuaObjectUnsafe(L, 1));
	try
		ret := lStream.Size;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Stream', 'GetSize', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CustomMemoryStream_Read(L: Plua_State): Integer; cdecl;
var
	lCustomMemoryStream:TLuaCustomMemoryStream;
	Buffer:Pointer;
	Count:LongInt;
	ret:LongInt;
begin
	CheckArg(L, 2);
	lCustomMemoryStream := TLuaCustomMemoryStream(GetLuaObject(L, 1));
	luaL_check(L,2,@Count);
	try
		ret := lCustomMemoryStream.Read(Buffer,Count);
		Result := 2;
	except
		on E: Exception do
			CallError(L, 'CustomMemoryStream', 'Read', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
	lua_pushlightuserdata(L,Buffer);
end;

function VCLua_CustomMemoryStream_Read2(L: Plua_State): Integer; cdecl;
var
	lCustomMemoryStream:TLuaCustomMemoryStream;
	Buffer:Pointer;
	Count:LongInt;
	ret:LongInt;
begin
	CheckArg(L, 3);
	lCustomMemoryStream := TLuaCustomMemoryStream(GetLuaObject(L, 1));
	Buffer := Pointer(lua_touserdata(L,2));
	luaL_check(L,3,@Count);
	try
		ret := lCustomMemoryStream.Read(Buffer,Count);
		Result := 2;
	except
		on E: Exception do
			CallError(L, 'CustomMemoryStream', 'Read', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
	lua_pushlightuserdata(L,Buffer);
end;

function VCLua_CustomMemoryStream_Seek(L: Plua_State): Integer; cdecl;
var
	lCustomMemoryStream:TLuaCustomMemoryStream;
	Offset:Int64;
	Origin:TSeekOrigin;
	ret:Int64;
begin
	CheckArg(L, 3);
	lCustomMemoryStream := TLuaCustomMemoryStream(GetLuaObject(L, 1));
	luaL_check(L,2,@Offset);
	luaL_check(L,3,@Origin,TypeInfo(TSeekOrigin));
	try
		ret := lCustomMemoryStream.Seek(Offset,Origin);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomMemoryStream', 'Seek', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CustomMemoryStream_SaveToStream(L: Plua_State): Integer; cdecl;
var
	lCustomMemoryStream:TLuaCustomMemoryStream;
	Stream:TStream;
begin
	CheckArg(L, 2);
	lCustomMemoryStream := TLuaCustomMemoryStream(GetLuaObject(L, 1));
	luaL_check(L,2,@Stream);
	try
		lCustomMemoryStream.SaveToStream(Stream);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomMemoryStream', 'SaveToStream', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomMemoryStream_SaveToFile(L: Plua_State): Integer; cdecl;
var
	lCustomMemoryStream:TLuaCustomMemoryStream;
	FileName:string;
begin
	CheckArg(L, 2);
	lCustomMemoryStream := TLuaCustomMemoryStream(GetLuaObject(L, 1));
	luaL_check(L,2,@FileName);
	try
		lCustomMemoryStream.SaveToFile(FileName);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomMemoryStream', 'SaveToFile', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomMemoryStream_VCLuaGetMemory(L: Plua_State): Integer; cdecl;
var
	lCustomMemoryStream:TLuaCustomMemoryStream;
	ret:Pointer;
begin
	lCustomMemoryStream := TLuaCustomMemoryStream(GetLuaObjectUnsafe(L, 1));
	try
		ret := lCustomMemoryStream.Memory;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomMemoryStream', 'GetMemory', E.ClassName, E.Message);
	end;
	lua_pushlightuserdata(L,ret);
end;

function VCLua_MemoryStream_Clear(L: Plua_State): Integer; cdecl;
var
	lMemoryStream:TLuaMemoryStream;
begin
	CheckArg(L, 1);
	lMemoryStream := TLuaMemoryStream(GetLuaObject(L, 1));
	try
		lMemoryStream.Clear();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'MemoryStream', 'Clear', E.ClassName, E.Message);
	end;
end;

function VCLua_MemoryStream_LoadFromStream(L: Plua_State): Integer; cdecl;
var
	lMemoryStream:TLuaMemoryStream;
	Stream:TStream;
begin
	CheckArg(L, 2);
	lMemoryStream := TLuaMemoryStream(GetLuaObject(L, 1));
	luaL_check(L,2,@Stream);
	try
		lMemoryStream.LoadFromStream(Stream);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'MemoryStream', 'LoadFromStream', E.ClassName, E.Message);
	end;
end;

function VCLua_MemoryStream_LoadFromFile(L: Plua_State): Integer; cdecl;
var
	lMemoryStream:TLuaMemoryStream;
	FileName:string;
begin
	CheckArg(L, 2);
	lMemoryStream := TLuaMemoryStream(GetLuaObject(L, 1));
	luaL_check(L,2,@FileName);
	try
		lMemoryStream.LoadFromFile(FileName);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'MemoryStream', 'LoadFromFile', E.ClassName, E.Message);
	end;
end;

function VCLua_MemoryStream_Write(L: Plua_State): Integer; cdecl;
var
	lMemoryStream:TLuaMemoryStream;
	Buffer:Pointer;
	Count:LongInt;
	ret:LongInt;
begin
	CheckArg(L, 3);
	lMemoryStream := TLuaMemoryStream(GetLuaObject(L, 1));
	Buffer := Pointer(lua_touserdata(L,2));
	luaL_check(L,3,@Count);
	try
		ret := lMemoryStream.Write(Buffer,Count);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'MemoryStream', 'Write', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_MemoryStream_LoadFromHex(L: Plua_State): Integer; cdecl;
var
  lMemoryStream:TLuaMemoryStream;
  s:String;
  from:Int64;
begin
  CheckArg(L, 2, 3);
  lMemoryStream := TLuaMemoryStream(GetLuaObjectPop(L, 1));
  s := luaL_checkPChar(L, 2, TypeInfo(s));
  TTrait<Int64>.luaL_optcheck(L, 3, @from, 1);
  try
     lMemoryStream.Clear;
     // eg. to skip first 4 bytes (size) in bitmap pass from=5
     from := 2*from-1;
     While from<=Length(s) Do Begin
       lMemoryStream.WriteByte(StrToIntDef('$'+Copy(s,from,2),0));
       Inc(from,2);
     End;
     lMemoryStream.Seek(0, soFromBeginning);
  except
    on E: Exception do
       CallError(L, 'MemoryStream', 'LoadFromHex', E.ClassName, E.Message);
  end;
  Result := 0;
end;

procedure lua_push(L: Plua_State; const v: TStream; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TStream',v);
end;

procedure lua_push(L: Plua_State; const v: TCustomMemoryStream; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TCustomMemoryStream',v);
end;

procedure lua_push(L: Plua_State; const v: TMemoryStream; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TMemoryStream',v);
end;
function CreateMemoryStream(L: Plua_State): Integer; cdecl;
var
	lMemoryStream:TLuaMemoryStream;
begin
	lMemoryStream := TLuaMemoryStream.Create;
	CreateTableForKnownType(L,'TMemoryStream',lMemoryStream);
	Result := 1;
end;
begin
	StreamFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(StreamFuncs, 'Read', @VCLua_Stream_Read);
	TLuaMethodInfo.Create(StreamFuncs, 'Read2', @VCLua_Stream_Read2);
	TLuaMethodInfo.Create(StreamFuncs, 'Write', @VCLua_Stream_Write);
	TLuaMethodInfo.Create(StreamFuncs, 'Seek', @VCLua_Stream_Seek);
	TLuaMethodInfo.Create(StreamFuncs, 'Seek2', @VCLua_Stream_Seek2);
	TLuaMethodInfo.Create(StreamFuncs, 'ReadBuffer', @VCLua_Stream_ReadBuffer);
	TLuaMethodInfo.Create(StreamFuncs, 'ReadBuffer2', @VCLua_Stream_ReadBuffer2);
	TLuaMethodInfo.Create(StreamFuncs, 'WriteBuffer', @VCLua_Stream_WriteBuffer);
	TLuaMethodInfo.Create(StreamFuncs, 'CopyFrom', @VCLua_Stream_CopyFrom);
	TLuaMethodInfo.Create(StreamFuncs, 'ReadComponent', @VCLua_Stream_ReadComponent);
	TLuaMethodInfo.Create(StreamFuncs, 'ReadComponentRes', @VCLua_Stream_ReadComponentRes);
	TLuaMethodInfo.Create(StreamFuncs, 'WriteComponent', @VCLua_Stream_WriteComponent);
	TLuaMethodInfo.Create(StreamFuncs, 'WriteComponentRes', @VCLua_Stream_WriteComponentRes);
	TLuaMethodInfo.Create(StreamFuncs, 'WriteDescendent', @VCLua_Stream_WriteDescendent);
	TLuaMethodInfo.Create(StreamFuncs, 'WriteDescendentRes', @VCLua_Stream_WriteDescendentRes);
	TLuaMethodInfo.Create(StreamFuncs, 'WriteResourceHeader', @VCLua_Stream_WriteResourceHeader);
	TLuaMethodInfo.Create(StreamFuncs, 'WriteResourceHeader2', @VCLua_Stream_WriteResourceHeader2);
	TLuaMethodInfo.Create(StreamFuncs, 'FixupResourceHeader', @VCLua_Stream_FixupResourceHeader);
	TLuaMethodInfo.Create(StreamFuncs, 'ReadResHeader', @VCLua_Stream_ReadResHeader);
	TLuaMethodInfo.Create(StreamFuncs, 'ReadByte', @VCLua_Stream_ReadByte);
	TLuaMethodInfo.Create(StreamFuncs, 'ReadWord', @VCLua_Stream_ReadWord);
	TLuaMethodInfo.Create(StreamFuncs, 'ReadDWord', @VCLua_Stream_ReadDWord);
	TLuaMethodInfo.Create(StreamFuncs, 'ReadQWord', @VCLua_Stream_ReadQWord);
	TLuaMethodInfo.Create(StreamFuncs, 'ReadAnsiString', @VCLua_Stream_ReadAnsiString);
	TLuaMethodInfo.Create(StreamFuncs, 'WriteByte', @VCLua_Stream_WriteByte);
	TLuaMethodInfo.Create(StreamFuncs, 'WriteWord', @VCLua_Stream_WriteWord);
	TLuaMethodInfo.Create(StreamFuncs, 'WriteDWord', @VCLua_Stream_WriteDWord);
	TLuaMethodInfo.Create(StreamFuncs, 'WriteQWord', @VCLua_Stream_WriteQWord);
	TLuaMethodInfo.Create(StreamFuncs, 'WriteAnsiString', @VCLua_Stream_WriteAnsiString);
	TLuaMethodInfo.Create(StreamFuncs, 'Position', @VCLua_Stream_VCLuaGetPosition, mfCall);
	TLuaMethodInfo.Create(StreamFuncs, 'Size', @VCLua_Stream_VCLuaGetSize, mfCall);
	StreamSets := TLuaVmt.Create;
	TLuaMethodInfo.Create(StreamSets, 'Position', @VCLua_Stream_VCLuaSetPosition, mfCall, TypeInfo(Int64));
	TLuaMethodInfo.Create(StreamSets, 'Size', @VCLua_Stream_VCLuaSetSize, mfCall, TypeInfo(Int64));
	CustomMemoryStreamFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(CustomMemoryStreamFuncs, 'Read', @VCLua_CustomMemoryStream_Read);
	TLuaMethodInfo.Create(CustomMemoryStreamFuncs, 'Read2', @VCLua_CustomMemoryStream_Read2);
	TLuaMethodInfo.Create(CustomMemoryStreamFuncs, 'Seek', @VCLua_CustomMemoryStream_Seek);
	TLuaMethodInfo.Create(CustomMemoryStreamFuncs, 'SaveToStream', @VCLua_CustomMemoryStream_SaveToStream);
	TLuaMethodInfo.Create(CustomMemoryStreamFuncs, 'SaveToFile', @VCLua_CustomMemoryStream_SaveToFile);
	TLuaMethodInfo.Create(CustomMemoryStreamFuncs, 'Memory', @VCLua_CustomMemoryStream_VCLuaGetMemory, mfCall);
	CustomMemoryStreamSets := TLuaVmt.Create;
	
	MemoryStreamFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(MemoryStreamFuncs, 'Clear', @VCLua_MemoryStream_Clear);
	TLuaMethodInfo.Create(MemoryStreamFuncs, 'LoadFromStream', @VCLua_MemoryStream_LoadFromStream);
	TLuaMethodInfo.Create(MemoryStreamFuncs, 'LoadFromFile', @VCLua_MemoryStream_LoadFromFile);
	TLuaMethodInfo.Create(MemoryStreamFuncs, 'Write', @VCLua_MemoryStream_Write);
	TLuaMethodInfo.Create(MemoryStreamFuncs, 'LoadFromHex', @VCLua_MemoryStream_LoadFromHex);
	MemoryStreamSets := TLuaVmt.Create;
	
end.
