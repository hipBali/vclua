(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaPicture;	

{$MODE Delphi}{$T+}

interface

Uses Classes, Lua, LuaController, Graphics, TypInfo, LuaVmt;

function CreatePicture(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TPicture; pti: PTypeInfo = nil); overload; inline;

type
    TLuaPicture = class(TPicture)
    public
      L:Plua_State;
    end;
var
    PictureFuncs: TLuaVmt;
    PictureSets: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Controls;

function VCLua_Picture_Clear(L: Plua_State): Integer; cdecl;
var
	lPicture:TLuaPicture;
begin
	CheckArg(L, 1);
	lPicture := TLuaPicture(GetLuaObject(L, 1));
	try
		lPicture.Clear();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Picture', 'Clear', E.ClassName, E.Message);
	end;
end;

function VCLua_Picture_LoadFromFile(L: Plua_State): Integer; cdecl;
var
	lPicture:TLuaPicture;
	Filename:string;
begin
	CheckArg(L, 2);
	lPicture := TLuaPicture(GetLuaObject(L, 1));
	luaL_check(L,2,@Filename);
	try
		lPicture.LoadFromFile(Filename);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Picture', 'LoadFromFile', E.ClassName, E.Message);
	end;
end;

function VCLua_Picture_LoadFromStream(L: Plua_State): Integer; cdecl;
var
	lPicture:TLuaPicture;
	Stream:TStream;
begin
	CheckArg(L, 2);
	lPicture := TLuaPicture(GetLuaObject(L, 1));
	luaL_check(L,2,@Stream);
	try
		lPicture.LoadFromStream(Stream);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Picture', 'LoadFromStream', E.ClassName, E.Message);
	end;
end;

function VCLua_Picture_LoadFromStreamWithFileExt(L: Plua_State): Integer; cdecl;
var
	lPicture:TLuaPicture;
	Stream:TStream;
	FileExt:string;
begin
	CheckArg(L, 3);
	lPicture := TLuaPicture(GetLuaObject(L, 1));
	luaL_check(L,2,@Stream);
	luaL_check(L,3,@FileExt);
	try
		lPicture.LoadFromStreamWithFileExt(Stream,FileExt);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Picture', 'LoadFromStreamWithFileExt', E.ClassName, E.Message);
	end;
end;

function VCLua_Picture_SaveToFile(L: Plua_State): Integer; cdecl;
var
	lPicture:TLuaPicture;
	Filename:string;
	FileExt:string;
begin
	CheckArg(L, 2, 3);
	lPicture := TLuaPicture(GetLuaObject(L, 1));
	luaL_check(L,2,@Filename);
	TTrait<string>.luaL_optcheck(L, 3, @FileExt, '');
	try
		lPicture.SaveToFile(Filename,FileExt);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Picture', 'SaveToFile', E.ClassName, E.Message);
	end;
end;

function VCLua_Picture_SaveToStream(L: Plua_State): Integer; cdecl;
var
	lPicture:TLuaPicture;
	Stream:TStream;
begin
	CheckArg(L, 2);
	lPicture := TLuaPicture(GetLuaObject(L, 1));
	luaL_check(L,2,@Stream);
	try
		lPicture.SaveToStream(Stream);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Picture', 'SaveToStream', E.ClassName, E.Message);
	end;
end;

function VCLua_Picture_SaveToStreamWithFileExt(L: Plua_State): Integer; cdecl;
var
	lPicture:TLuaPicture;
	Stream:TStream;
	FileExt:string;
begin
	CheckArg(L, 3);
	lPicture := TLuaPicture(GetLuaObject(L, 1));
	luaL_check(L,2,@Stream);
	luaL_check(L,3,@FileExt);
	try
		lPicture.SaveToStreamWithFileExt(Stream,FileExt);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Picture', 'SaveToStreamWithFileExt', E.ClassName, E.Message);
	end;
end;

function VCLua_Picture_Assign(L: Plua_State): Integer; cdecl;
var
	lPicture:TLuaPicture;
	Source:TPersistent;
begin
	CheckArg(L, 2);
	lPicture := TLuaPicture(GetLuaObject(L, 1));
	luaL_check(L,2,@Source);
	try
		lPicture.Assign(Source);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Picture', 'Assign', E.ClassName, E.Message);
	end;
end;

procedure lua_push(L: Plua_State; const v: TPicture; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TPicture',v);
end;
function CreatePicture(L: Plua_State): Integer; cdecl;
var
	lPicture:TLuaPicture;
begin
	lPicture := TLuaPicture.Create;
	CreateTableForKnownType(L,'TPicture',lPicture);
	Result := 1;
end;
begin
	PictureFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(PictureFuncs, 'Clear', @VCLua_Picture_Clear);
	TLuaMethodInfo.Create(PictureFuncs, 'LoadFromFile', @VCLua_Picture_LoadFromFile);
	TLuaMethodInfo.Create(PictureFuncs, 'LoadFromStream', @VCLua_Picture_LoadFromStream);
	TLuaMethodInfo.Create(PictureFuncs, 'LoadFromStreamWithFileExt', @VCLua_Picture_LoadFromStreamWithFileExt);
	TLuaMethodInfo.Create(PictureFuncs, 'SaveToFile', @VCLua_Picture_SaveToFile);
	TLuaMethodInfo.Create(PictureFuncs, 'SaveToStream', @VCLua_Picture_SaveToStream);
	TLuaMethodInfo.Create(PictureFuncs, 'SaveToStreamWithFileExt', @VCLua_Picture_SaveToStreamWithFileExt);
	TLuaMethodInfo.Create(PictureFuncs, 'Assign', @VCLua_Picture_Assign);
	PictureSets := TLuaVmt.Create;
	
end.
