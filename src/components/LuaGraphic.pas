(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaGraphic;	

{$MODE Delphi}{$T+}

interface

Uses Classes, Lua, LuaController, Graphics, TypInfo, LuaVmt;

procedure lua_push(L: Plua_State; const v: TGraphic; pti: PTypeInfo = nil); overload; inline;

type
    TLuaGraphic = class(TGraphic)
    public
      L:Plua_State;
    end;
var
    GraphicFuncs: TLuaVmt;
    GraphicSets: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, LCLType;

function VCLua_Graphic_Assign(L: Plua_State): Integer; cdecl;
var
	lGraphic:TLuaGraphic;
	ASource:TPersistent;
begin
	CheckArg(L, 2);
	lGraphic := TLuaGraphic(GetLuaObject(L, 1));
	luaL_check(L,2,@ASource);
	try
		lGraphic.Assign(ASource);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Graphic', 'Assign', E.ClassName, E.Message);
	end;
end;

function VCLua_Graphic_Clear(L: Plua_State): Integer; cdecl;
var
	lGraphic:TLuaGraphic;
begin
	CheckArg(L, 1);
	lGraphic := TLuaGraphic(GetLuaObject(L, 1));
	try
		lGraphic.Clear();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Graphic', 'Clear', E.ClassName, E.Message);
	end;
end;

function VCLua_Graphic_Equals(L: Plua_State): Integer; cdecl;
var
	lGraphic:TLuaGraphic;
	Obj:TObject;
	ret:Boolean;
begin
	CheckArg(L, 2);
	lGraphic := TLuaGraphic(GetLuaObject(L, 1));
	luaL_check(L,2,@Obj);
	try
		ret := lGraphic.Equals(Obj);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Graphic', 'Equals', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Graphic_LazarusResourceTypeValid(L: Plua_State): Integer; cdecl;
var
	lGraphic:TLuaGraphic;
	AResourceType:string;
	ret:boolean;
begin
	CheckArg(L, 2);
	lGraphic := TLuaGraphic(GetLuaObject(L, 1));
	luaL_check(L,2,@AResourceType);
	try
		ret := lGraphic.LazarusResourceTypeValid(AResourceType);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Graphic', 'LazarusResourceTypeValid', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Graphic_LoadFromFile(L: Plua_State): Integer; cdecl;
var
	lGraphic:TLuaGraphic;
	Filename:string;
begin
	CheckArg(L, 2);
	lGraphic := TLuaGraphic(GetLuaObject(L, 1));
	luaL_check(L,2,@Filename);
	try
		lGraphic.LoadFromFile(Filename);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Graphic', 'LoadFromFile', E.ClassName, E.Message);
	end;
end;

function VCLua_Graphic_LoadFromStream(L: Plua_State): Integer; cdecl;
var
	lGraphic:TLuaGraphic;
	Stream:TStream;
begin
	CheckArg(L, 2);
	lGraphic := TLuaGraphic(GetLuaObject(L, 1));
	luaL_check(L,2,@Stream);
	try
		lGraphic.LoadFromStream(Stream);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Graphic', 'LoadFromStream', E.ClassName, E.Message);
	end;
end;

function VCLua_Graphic_LoadFromMimeStream(L: Plua_State): Integer; cdecl;
var
	lGraphic:TLuaGraphic;
	AStream:TStream;
	AMimeType:string;
begin
	CheckArg(L, 3);
	lGraphic := TLuaGraphic(GetLuaObject(L, 1));
	luaL_check(L,2,@AStream);
	luaL_check(L,3,@AMimeType);
	try
		lGraphic.LoadFromMimeStream(AStream,AMimeType);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Graphic', 'LoadFromMimeStream', E.ClassName, E.Message);
	end;
end;

function VCLua_Graphic_LoadFromLazarusResource(L: Plua_State): Integer; cdecl;
var
	lGraphic:TLuaGraphic;
	ResName:String;
begin
	CheckArg(L, 2);
	lGraphic := TLuaGraphic(GetLuaObject(L, 1));
	luaL_check(L,2,@ResName);
	try
		lGraphic.LoadFromLazarusResource(ResName);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Graphic', 'LoadFromLazarusResource', E.ClassName, E.Message);
	end;
end;

function VCLua_Graphic_LoadFromResourceName(L: Plua_State): Integer; cdecl;
var
	lGraphic:TLuaGraphic;
	Instance:THandle;
	ResName:String;
begin
	CheckArg(L, 3);
	lGraphic := TLuaGraphic(GetLuaObject(L, 1));
	luaL_check(L,2,@Instance);
	luaL_check(L,3,@ResName);
	try
		lGraphic.LoadFromResourceName(Instance,ResName);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Graphic', 'LoadFromResourceName', E.ClassName, E.Message);
	end;
end;

function VCLua_Graphic_LoadFromResourceID(L: Plua_State): Integer; cdecl;
var
	lGraphic:TLuaGraphic;
	Instance:THandle;
	ResID:PtrInt;
begin
	CheckArg(L, 3);
	lGraphic := TLuaGraphic(GetLuaObject(L, 1));
	luaL_check(L,2,@Instance);
	luaL_check(L,3,@ResID);
	try
		lGraphic.LoadFromResourceID(Instance,ResID);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Graphic', 'LoadFromResourceID', E.ClassName, E.Message);
	end;
end;

function VCLua_Graphic_LoadFromClipboardFormat(L: Plua_State): Integer; cdecl;
var
	lGraphic:TLuaGraphic;
	FormatID:TClipboardFormat;
begin
	CheckArg(L, 2);
	lGraphic := TLuaGraphic(GetLuaObject(L, 1));
	luaL_check(L,2,@FormatID);
	try
		lGraphic.LoadFromClipboardFormat(FormatID);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Graphic', 'LoadFromClipboardFormat', E.ClassName, E.Message);
	end;
end;

function VCLua_Graphic_LoadFromClipboardFormatID(L: Plua_State): Integer; cdecl;
var
	lGraphic:TLuaGraphic;
	ClipboardType:TClipboardType;
	FormatID:TClipboardFormat;
begin
	CheckArg(L, 3);
	lGraphic := TLuaGraphic(GetLuaObject(L, 1));
	luaL_check(L,2,@ClipboardType,TypeInfo(TClipboardType));
	luaL_check(L,3,@FormatID);
	try
		lGraphic.LoadFromClipboardFormatID(ClipboardType,FormatID);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Graphic', 'LoadFromClipboardFormatID', E.ClassName, E.Message);
	end;
end;

function VCLua_Graphic_SaveToFile(L: Plua_State): Integer; cdecl;
var
	lGraphic:TLuaGraphic;
	Filename:string;
begin
	CheckArg(L, 2);
	lGraphic := TLuaGraphic(GetLuaObject(L, 1));
	luaL_check(L,2,@Filename);
	try
		lGraphic.SaveToFile(Filename);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Graphic', 'SaveToFile', E.ClassName, E.Message);
	end;
end;

function VCLua_Graphic_SaveToStream(L: Plua_State): Integer; cdecl;
var
	lGraphic:TLuaGraphic;
	Stream:TStream;
begin
	CheckArg(L, 2);
	lGraphic := TLuaGraphic(GetLuaObject(L, 1));
	luaL_check(L,2,@Stream);
	try
		lGraphic.SaveToStream(Stream);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Graphic', 'SaveToStream', E.ClassName, E.Message);
	end;
end;

function VCLua_Graphic_SaveToClipboardFormat(L: Plua_State): Integer; cdecl;
var
	lGraphic:TLuaGraphic;
	FormatID:TClipboardFormat;
begin
	CheckArg(L, 2);
	lGraphic := TLuaGraphic(GetLuaObject(L, 1));
	luaL_check(L,2,@FormatID);
	try
		lGraphic.SaveToClipboardFormat(FormatID);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Graphic', 'SaveToClipboardFormat', E.ClassName, E.Message);
	end;
end;

function VCLua_Graphic_SaveToClipboardFormatID(L: Plua_State): Integer; cdecl;
var
	lGraphic:TLuaGraphic;
	ClipboardType:TClipboardType;
	FormatID:TClipboardFormat;
begin
	CheckArg(L, 3);
	lGraphic := TLuaGraphic(GetLuaObject(L, 1));
	luaL_check(L,2,@ClipboardType,TypeInfo(TClipboardType));
	luaL_check(L,3,@FormatID);
	try
		lGraphic.SaveToClipboardFormatID(ClipboardType,FormatID);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Graphic', 'SaveToClipboardFormatID', E.ClassName, E.Message);
	end;
end;

function VCLua_Graphic_GetSupportedSourceMimeTypes(L: Plua_State): Integer; cdecl;
var
	lGraphic:TLuaGraphic;
	List:TStrings;
begin
	CheckArg(L, 2);
	lGraphic := TLuaGraphic(GetLuaObject(L, 1));
	luaL_check(L,2,@List);
	try
		lGraphic.GetSupportedSourceMimeTypes(List);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Graphic', 'GetSupportedSourceMimeTypes', E.ClassName, E.Message);
	end;
end;

function VCLua_Graphic_GetResourceType(L: Plua_State): Integer; cdecl;
var
	lGraphic:TLuaGraphic;
	ret:TResourceType;
begin
	CheckArg(L, 1);
	lGraphic := TLuaGraphic(GetLuaObject(L, 1));
	try
		ret := lGraphic.GetResourceType();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Graphic', 'GetResourceType', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

procedure lua_push(L: Plua_State; const v: TGraphic; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TGraphic',v);
end;

begin
	GraphicFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(GraphicFuncs, 'Assign', @VCLua_Graphic_Assign);
	TLuaMethodInfo.Create(GraphicFuncs, 'Clear', @VCLua_Graphic_Clear);
	TLuaMethodInfo.Create(GraphicFuncs, 'Equals', @VCLua_Graphic_Equals);
	TLuaMethodInfo.Create(GraphicFuncs, 'LazarusResourceTypeValid', @VCLua_Graphic_LazarusResourceTypeValid);
	TLuaMethodInfo.Create(GraphicFuncs, 'LoadFromFile', @VCLua_Graphic_LoadFromFile);
	TLuaMethodInfo.Create(GraphicFuncs, 'LoadFromStream', @VCLua_Graphic_LoadFromStream);
	TLuaMethodInfo.Create(GraphicFuncs, 'LoadFromMimeStream', @VCLua_Graphic_LoadFromMimeStream);
	TLuaMethodInfo.Create(GraphicFuncs, 'LoadFromLazarusResource', @VCLua_Graphic_LoadFromLazarusResource);
	TLuaMethodInfo.Create(GraphicFuncs, 'LoadFromResourceName', @VCLua_Graphic_LoadFromResourceName);
	TLuaMethodInfo.Create(GraphicFuncs, 'LoadFromResourceID', @VCLua_Graphic_LoadFromResourceID);
	TLuaMethodInfo.Create(GraphicFuncs, 'LoadFromClipboardFormat', @VCLua_Graphic_LoadFromClipboardFormat);
	TLuaMethodInfo.Create(GraphicFuncs, 'LoadFromClipboardFormatID', @VCLua_Graphic_LoadFromClipboardFormatID);
	TLuaMethodInfo.Create(GraphicFuncs, 'SaveToFile', @VCLua_Graphic_SaveToFile);
	TLuaMethodInfo.Create(GraphicFuncs, 'SaveToStream', @VCLua_Graphic_SaveToStream);
	TLuaMethodInfo.Create(GraphicFuncs, 'SaveToClipboardFormat', @VCLua_Graphic_SaveToClipboardFormat);
	TLuaMethodInfo.Create(GraphicFuncs, 'SaveToClipboardFormatID', @VCLua_Graphic_SaveToClipboardFormatID);
	TLuaMethodInfo.Create(GraphicFuncs, 'GetSupportedSourceMimeTypes', @VCLua_Graphic_GetSupportedSourceMimeTypes);
	TLuaMethodInfo.Create(GraphicFuncs, 'GetResourceType', @VCLua_Graphic_GetResourceType);
	GraphicSets := TLuaVmt.Create;
	
end.
