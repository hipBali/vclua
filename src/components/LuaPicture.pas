(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaPicture;	

{$MODE Delphi}{$T+}

interface

Uses Classes, Lua, LuaController, Graphics, TypInfo;

function CreatePicture(L: Plua_State): Integer; cdecl;
function IsPicture(L: Plua_State): Integer; cdecl;
function AsPicture(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TPicture; pti: PTypeInfo = nil); overload; inline;

type
    TLuaPicture = class(TPicture)
    public
      L:Plua_State;
    end;
var
    PictureFuncs: aoluaL_Reg;


implementation
Uses LuaProperties, LuaProxy, LuaObject, LuaHelper, LCLClasses, SysUtils;

function VCLua_Picture_Clear(L: Plua_State): Integer; cdecl;
var
	lPicture:TLuaPicture;
begin
	CheckArg(L, 1);
	lPicture := TLuaPicture(GetLuaObject(L, 1));
	try
		lPicture.Clear();
	except
		on E: Exception do
			CallError(L, 'Picture', 'Clear', E.ClassName, E.Message);
	end;
	Result := 0;
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
	except
		on E: Exception do
			CallError(L, 'Picture', 'LoadFromFile', E.ClassName, E.Message);
	end;
	Result := 0;
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
	except
		on E: Exception do
			CallError(L, 'Picture', 'LoadFromStream', E.ClassName, E.Message);
	end;
	Result := 0;
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
	except
		on E: Exception do
			CallError(L, 'Picture', 'LoadFromStreamWithFileExt', E.ClassName, E.Message);
	end;
	Result := 0;
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
	except
		on E: Exception do
			CallError(L, 'Picture', 'SaveToFile', E.ClassName, E.Message);
	end;
	Result := 0;
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
	except
		on E: Exception do
			CallError(L, 'Picture', 'SaveToStream', E.ClassName, E.Message);
	end;
	Result := 0;
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
	except
		on E: Exception do
			CallError(L, 'Picture', 'SaveToStreamWithFileExt', E.ClassName, E.Message);
	end;
	Result := 0;
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
	except
		on E: Exception do
			CallError(L, 'Picture', 'Assign', E.ClassName, E.Message);
	end;
	Result := 0;
end;

function IsPicture(L: Plua_State): Integer; cdecl;
begin
  CheckArg(L, 1);
  Result := 1;
  lua_push(L, GetLuaObject(L, 1) is TPicture);
end;
function AsPicture(L: Plua_State): Integer; cdecl;
var o : TObject;
begin
  CheckArg(L, 1);
  Result := 1;
  o := GetLuaObject(L, 1);
  if o is TPicture then
    lua_push(L, TPicture(o))
  else
    lua_pushnil(L);
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
	SetLength(PictureFuncs, 8+1);
	PictureFuncs[0].name:='Clear';
	PictureFuncs[0].func:=@VCLua_Picture_Clear;
	PictureFuncs[1].name:='LoadFromFile';
	PictureFuncs[1].func:=@VCLua_Picture_LoadFromFile;
	PictureFuncs[2].name:='LoadFromStream';
	PictureFuncs[2].func:=@VCLua_Picture_LoadFromStream;
	PictureFuncs[3].name:='LoadFromStreamWithFileExt';
	PictureFuncs[3].func:=@VCLua_Picture_LoadFromStreamWithFileExt;
	PictureFuncs[4].name:='SaveToFile';
	PictureFuncs[4].func:=@VCLua_Picture_SaveToFile;
	PictureFuncs[5].name:='SaveToStream';
	PictureFuncs[5].func:=@VCLua_Picture_SaveToStream;
	PictureFuncs[6].name:='SaveToStreamWithFileExt';
	PictureFuncs[6].func:=@VCLua_Picture_SaveToStreamWithFileExt;
	PictureFuncs[7].name:='Assign';
	PictureFuncs[7].func:=@VCLua_Picture_Assign;
	PictureFuncs[8].name:=nil;
	PictureFuncs[8].func:=nil;

end.
