(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaGraphic;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaController, TypInfo, LuaVmt, Graphics;

procedure lua_push(L: Plua_State; const v: TGraphic; pti: PTypeInfo = nil); overload; inline;

type
    TLuaGraphic = class(TGraphic)
    end;
var
    GraphicFuncs: TLuaVmt;
    GraphicSets: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Classes, LCLType, LuaClassesEvents, LuaEvent, LuaFPImageEvents;

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
	ListNeedsFree:Boolean = False;
begin
	CheckArg(L, 2);
	lGraphic := TLuaGraphic(GetLuaObject(L, 1));
	ListNeedsFree := luaL_checkOrFromTable(L,2,@List,@luaL_checkStringList,TypeInfo(List));
	try
		lGraphic.GetSupportedSourceMimeTypes(List);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Graphic', 'GetSupportedSourceMimeTypes', E.ClassName, E.Message);
	end;
	if ListNeedsFree then List.Free;
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

function VCLua_Graphic_GetFileExtensions(L: Plua_State): Integer; cdecl;
var
	lGraphic:TLuaGraphic;
	ret:string;
begin
	CheckArg(L, 1);
	lGraphic := TLuaGraphic(GetLuaObject(L, 1));
	try
		ret := lGraphic.GetFileExtensions();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Graphic', 'GetFileExtensions', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Graphic_IsStreamFormatSupported(L: Plua_State): Integer; cdecl;
var
	lGraphic:TLuaGraphic;
	Stream:TStream;
	ret:Boolean;
begin
	CheckArg(L, 2);
	lGraphic := TLuaGraphic(GetLuaObject(L, 1));
	luaL_check(L,2,@Stream);
	try
		ret := lGraphic.IsStreamFormatSupported(Stream);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Graphic', 'IsStreamFormatSupported', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Graphic_VCLuaGetEmpty(L: Plua_State): Integer; cdecl;
var
	lGraphic:TLuaGraphic;
	ret:Boolean;
begin
	lGraphic := TLuaGraphic(GetLuaObjectUnsafe(L, 1));
	try
		ret := lGraphic.Empty;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Graphic', 'GetEmpty', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Graphic_VCLuaSetHeight(L: Plua_State): Integer; cdecl;
var
	lGraphic:TLuaGraphic;
	val:Integer;
begin
	lGraphic := TLuaGraphic(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lGraphic.Height := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Graphic', 'SetHeight', E.ClassName, E.Message);
	end;
end;

function VCLua_Graphic_VCLuaGetHeight(L: Plua_State): Integer; cdecl;
var
	lGraphic:TLuaGraphic;
	ret:Integer;
begin
	lGraphic := TLuaGraphic(GetLuaObjectUnsafe(L, 1));
	try
		ret := lGraphic.Height;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Graphic', 'GetHeight', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Graphic_VCLuaSetModified(L: Plua_State): Integer; cdecl;
var
	lGraphic:TLuaGraphic;
	val:Boolean;
begin
	lGraphic := TLuaGraphic(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lGraphic.Modified := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Graphic', 'SetModified', E.ClassName, E.Message);
	end;
end;

function VCLua_Graphic_VCLuaGetModified(L: Plua_State): Integer; cdecl;
var
	lGraphic:TLuaGraphic;
	ret:Boolean;
begin
	lGraphic := TLuaGraphic(GetLuaObjectUnsafe(L, 1));
	try
		ret := lGraphic.Modified;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Graphic', 'GetModified', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Graphic_VCLuaGetMimeType(L: Plua_State): Integer; cdecl;
var
	lGraphic:TLuaGraphic;
	ret:string;
begin
	lGraphic := TLuaGraphic(GetLuaObjectUnsafe(L, 1));
	try
		ret := lGraphic.MimeType;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Graphic', 'GetMimeType', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Graphic_VCLuaSetOnChange(L: Plua_State): Integer; cdecl;
var
	lGraphic:TLuaGraphic;
begin
	lGraphic := TLuaGraphic(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lGraphic.OnChange));
	lGraphic.OnChange := TLuaEvent.Factory<TNotifyEvent,TLuaNotifyEvent>(L);
	Result := 0;
end;

function VCLua_Graphic_VCLuaSetOnProgress(L: Plua_State): Integer; cdecl;
var
	lGraphic:TLuaGraphic;
begin
	lGraphic := TLuaGraphic(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lGraphic.OnProgress));
	lGraphic.OnProgress := TLuaEvent.Factory<TProgressEvent,TLuaFPImgProgressEvent>(L);
	Result := 0;
end;

function VCLua_Graphic_VCLuaSetPaletteModified(L: Plua_State): Integer; cdecl;
var
	lGraphic:TLuaGraphic;
	val:Boolean;
begin
	lGraphic := TLuaGraphic(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lGraphic.PaletteModified := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Graphic', 'SetPaletteModified', E.ClassName, E.Message);
	end;
end;

function VCLua_Graphic_VCLuaGetPaletteModified(L: Plua_State): Integer; cdecl;
var
	lGraphic:TLuaGraphic;
	ret:Boolean;
begin
	lGraphic := TLuaGraphic(GetLuaObjectUnsafe(L, 1));
	try
		ret := lGraphic.PaletteModified;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Graphic', 'GetPaletteModified', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Graphic_VCLuaSetTransparent(L: Plua_State): Integer; cdecl;
var
	lGraphic:TLuaGraphic;
	val:Boolean;
begin
	lGraphic := TLuaGraphic(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lGraphic.Transparent := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Graphic', 'SetTransparent', E.ClassName, E.Message);
	end;
end;

function VCLua_Graphic_VCLuaGetTransparent(L: Plua_State): Integer; cdecl;
var
	lGraphic:TLuaGraphic;
	ret:Boolean;
begin
	lGraphic := TLuaGraphic(GetLuaObjectUnsafe(L, 1));
	try
		ret := lGraphic.Transparent;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Graphic', 'GetTransparent', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Graphic_VCLuaSetWidth(L: Plua_State): Integer; cdecl;
var
	lGraphic:TLuaGraphic;
	val:Integer;
begin
	lGraphic := TLuaGraphic(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lGraphic.Width := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Graphic', 'SetWidth', E.ClassName, E.Message);
	end;
end;

function VCLua_Graphic_VCLuaGetWidth(L: Plua_State): Integer; cdecl;
var
	lGraphic:TLuaGraphic;
	ret:Integer;
begin
	lGraphic := TLuaGraphic(GetLuaObjectUnsafe(L, 1));
	try
		ret := lGraphic.Width;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Graphic', 'GetWidth', E.ClassName, E.Message);
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
	TLuaMethodInfo.Create(GraphicFuncs, 'GetFileExtensions', @VCLua_Graphic_GetFileExtensions);
	TLuaMethodInfo.Create(GraphicFuncs, 'IsStreamFormatSupported', @VCLua_Graphic_IsStreamFormatSupported);
	TLuaMethodInfo.Create(GraphicFuncs, 'Empty', @VCLua_Graphic_VCLuaGetEmpty, mfCall);
	TLuaMethodInfo.Create(GraphicFuncs, 'Height', @VCLua_Graphic_VCLuaGetHeight, mfCall);
	TLuaMethodInfo.Create(GraphicFuncs, 'Modified', @VCLua_Graphic_VCLuaGetModified, mfCall);
	TLuaMethodInfo.Create(GraphicFuncs, 'MimeType', @VCLua_Graphic_VCLuaGetMimeType, mfCall);
	TLuaMethodInfo.Create(GraphicFuncs, 'PaletteModified', @VCLua_Graphic_VCLuaGetPaletteModified, mfCall);
	TLuaMethodInfo.Create(GraphicFuncs, 'Transparent', @VCLua_Graphic_VCLuaGetTransparent, mfCall);
	TLuaMethodInfo.Create(GraphicFuncs, 'Width', @VCLua_Graphic_VCLuaGetWidth, mfCall);
	GraphicSets := TLuaVmt.Create;
	TLuaMethodInfo.Create(GraphicSets, 'Height', @VCLua_Graphic_VCLuaSetHeight, mfCall, TypeInfo(Integer));
	TLuaMethodInfo.Create(GraphicSets, 'Modified', @VCLua_Graphic_VCLuaSetModified, mfCall, TypeInfo(Boolean));
	TLuaMethodInfo.Create(GraphicSets, 'OnChange', @VCLua_Graphic_VCLuaSetOnChange, mfCall, TypeInfo(TNotifyEvent));
	TLuaMethodInfo.Create(GraphicSets, 'OnProgress', @VCLua_Graphic_VCLuaSetOnProgress, mfCall, TypeInfo(TProgressEvent));
	TLuaMethodInfo.Create(GraphicSets, 'PaletteModified', @VCLua_Graphic_VCLuaSetPaletteModified, mfCall, TypeInfo(Boolean));
	TLuaMethodInfo.Create(GraphicSets, 'Transparent', @VCLua_Graphic_VCLuaSetTransparent, mfCall, TypeInfo(Boolean));
	TLuaMethodInfo.Create(GraphicSets, 'Width', @VCLua_Graphic_VCLuaSetWidth, mfCall, TypeInfo(Integer));
end.
