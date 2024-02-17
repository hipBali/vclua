(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaGraphic;	

{$MODE Delphi}{$T+}

interface

Uses Classes, Lua, LuaController, Graphics, LCLType, TypInfo;

function IsGraphic(L: Plua_State): Integer; cdecl;
function AsGraphic(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TGraphic; pti: PTypeInfo = nil); overload; inline;

type
    TLuaGraphic = class(TGraphic)
    public
      L:Plua_State;
    end;
var
    GraphicFuncs: aoluaL_Reg;


implementation
Uses LuaProperties, LuaProxy, LuaObject, LuaHelper, LCLClasses, SysUtils;

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
	except
		on E: Exception do
			CallError(L, 'Graphic', 'Assign', E.ClassName, E.Message);
	end;
	Result := 0;
end;

function VCLua_Graphic_Clear(L: Plua_State): Integer; cdecl;
var
	lGraphic:TLuaGraphic;
begin
	CheckArg(L, 1);
	lGraphic := TLuaGraphic(GetLuaObject(L, 1));
	try
		lGraphic.Clear();
	except
		on E: Exception do
			CallError(L, 'Graphic', 'Clear', E.ClassName, E.Message);
	end;
	Result := 0;
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
	except
		on E: Exception do
			CallError(L, 'Graphic', 'Equals', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
	Result := 1;
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
	except
		on E: Exception do
			CallError(L, 'Graphic', 'LazarusResourceTypeValid', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
	Result := 1;
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
	except
		on E: Exception do
			CallError(L, 'Graphic', 'LoadFromFile', E.ClassName, E.Message);
	end;
	Result := 0;
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
	except
		on E: Exception do
			CallError(L, 'Graphic', 'LoadFromStream', E.ClassName, E.Message);
	end;
	Result := 0;
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
	except
		on E: Exception do
			CallError(L, 'Graphic', 'LoadFromMimeStream', E.ClassName, E.Message);
	end;
	Result := 0;
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
	except
		on E: Exception do
			CallError(L, 'Graphic', 'LoadFromLazarusResource', E.ClassName, E.Message);
	end;
	Result := 0;
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
	except
		on E: Exception do
			CallError(L, 'Graphic', 'LoadFromResourceName', E.ClassName, E.Message);
	end;
	Result := 0;
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
	except
		on E: Exception do
			CallError(L, 'Graphic', 'LoadFromResourceID', E.ClassName, E.Message);
	end;
	Result := 0;
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
	except
		on E: Exception do
			CallError(L, 'Graphic', 'LoadFromClipboardFormat', E.ClassName, E.Message);
	end;
	Result := 0;
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
	except
		on E: Exception do
			CallError(L, 'Graphic', 'LoadFromClipboardFormatID', E.ClassName, E.Message);
	end;
	Result := 0;
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
	except
		on E: Exception do
			CallError(L, 'Graphic', 'SaveToFile', E.ClassName, E.Message);
	end;
	Result := 0;
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
	except
		on E: Exception do
			CallError(L, 'Graphic', 'SaveToStream', E.ClassName, E.Message);
	end;
	Result := 0;
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
	except
		on E: Exception do
			CallError(L, 'Graphic', 'SaveToClipboardFormat', E.ClassName, E.Message);
	end;
	Result := 0;
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
	except
		on E: Exception do
			CallError(L, 'Graphic', 'SaveToClipboardFormatID', E.ClassName, E.Message);
	end;
	Result := 0;
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
	except
		on E: Exception do
			CallError(L, 'Graphic', 'GetSupportedSourceMimeTypes', E.ClassName, E.Message);
	end;
	Result := 0;
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
	except
		on E: Exception do
			CallError(L, 'Graphic', 'GetResourceType', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
	Result := 1;
end;

function IsGraphic(L: Plua_State): Integer; cdecl;
begin
  CheckArg(L, 1);
  Result := 1;
  lua_push(L, GetLuaObject(L, 1) is TGraphic);
end;
function AsGraphic(L: Plua_State): Integer; cdecl;
var o : TObject;
begin
  CheckArg(L, 1);
  Result := 1;
  o := GetLuaObject(L, 1);
  if o is TGraphic then
    lua_push(L, TGraphic(o))
  else
    lua_pushnil(L);
end;
procedure lua_push(L: Plua_State; const v: TGraphic; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TGraphic',v);
end;

begin
	SetLength(GraphicFuncs, 18+1);
	GraphicFuncs[0].name:='Assign';
	GraphicFuncs[0].func:=@VCLua_Graphic_Assign;
	GraphicFuncs[1].name:='Clear';
	GraphicFuncs[1].func:=@VCLua_Graphic_Clear;
	GraphicFuncs[2].name:='Equals';
	GraphicFuncs[2].func:=@VCLua_Graphic_Equals;
	GraphicFuncs[3].name:='LazarusResourceTypeValid';
	GraphicFuncs[3].func:=@VCLua_Graphic_LazarusResourceTypeValid;
	GraphicFuncs[4].name:='LoadFromFile';
	GraphicFuncs[4].func:=@VCLua_Graphic_LoadFromFile;
	GraphicFuncs[5].name:='LoadFromStream';
	GraphicFuncs[5].func:=@VCLua_Graphic_LoadFromStream;
	GraphicFuncs[6].name:='LoadFromMimeStream';
	GraphicFuncs[6].func:=@VCLua_Graphic_LoadFromMimeStream;
	GraphicFuncs[7].name:='LoadFromLazarusResource';
	GraphicFuncs[7].func:=@VCLua_Graphic_LoadFromLazarusResource;
	GraphicFuncs[8].name:='LoadFromResourceName';
	GraphicFuncs[8].func:=@VCLua_Graphic_LoadFromResourceName;
	GraphicFuncs[9].name:='LoadFromResourceID';
	GraphicFuncs[9].func:=@VCLua_Graphic_LoadFromResourceID;
	GraphicFuncs[10].name:='LoadFromClipboardFormat';
	GraphicFuncs[10].func:=@VCLua_Graphic_LoadFromClipboardFormat;
	GraphicFuncs[11].name:='LoadFromClipboardFormatID';
	GraphicFuncs[11].func:=@VCLua_Graphic_LoadFromClipboardFormatID;
	GraphicFuncs[12].name:='SaveToFile';
	GraphicFuncs[12].func:=@VCLua_Graphic_SaveToFile;
	GraphicFuncs[13].name:='SaveToStream';
	GraphicFuncs[13].func:=@VCLua_Graphic_SaveToStream;
	GraphicFuncs[14].name:='SaveToClipboardFormat';
	GraphicFuncs[14].func:=@VCLua_Graphic_SaveToClipboardFormat;
	GraphicFuncs[15].name:='SaveToClipboardFormatID';
	GraphicFuncs[15].func:=@VCLua_Graphic_SaveToClipboardFormatID;
	GraphicFuncs[16].name:='GetSupportedSourceMimeTypes';
	GraphicFuncs[16].func:=@VCLua_Graphic_GetSupportedSourceMimeTypes;
	GraphicFuncs[17].name:='GetResourceType';
	GraphicFuncs[17].func:=@VCLua_Graphic_GetResourceType;
	GraphicFuncs[18].name:=nil;
	GraphicFuncs[18].func:=nil;

end.
