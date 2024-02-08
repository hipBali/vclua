(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaGraphic;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, Graphics, LCLType, TypInfo;

function IsGraphic(L: Plua_State): Integer; cdecl;
function AsGraphic(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TGraphic; pti: PTypeInfo = nil); overload; inline;
procedure GraphicToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaGraphic = class(TGraphic)
    public
      L:Plua_State;
    end;
var
    GraphicFuncs: aoluaL_Reg;


implementation
Uses LuaProperties, LuaProxy, LuaObject, LuaHelper, LCLClasses;

function VCLua_Graphic_Assign(L: Plua_State): Integer; cdecl;
var
	lGraphic:TLuaGraphic;
	ASource:TPersistent;
begin
	CheckArg(L, 2);
	lGraphic := TLuaGraphic(GetLuaObject(L, 1));
	ASource := TPersistent(GetLuaObject(L,2));
	lGraphic.Assign(ASource);
	
	Result := 0;
end;

function VCLua_Graphic_Clear(L: Plua_State): Integer; cdecl;
var
	lGraphic:TLuaGraphic;
begin
	CheckArg(L, 1);
	lGraphic := TLuaGraphic(GetLuaObject(L, 1));
	lGraphic.Clear();
	
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
	Obj := TObject(GetLuaObject(L,2));
	ret := lGraphic.Equals(Obj);
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
	AResourceType := lua_toStringCP(L,2);
	ret := lGraphic.LazarusResourceTypeValid(AResourceType);
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
	Filename := lua_toStringCP(L,2);
	lGraphic.LoadFromFile(Filename);
	
	Result := 0;
end;

function VCLua_Graphic_LoadFromStream(L: Plua_State): Integer; cdecl;
var
	lGraphic:TLuaGraphic;
	Stream:TStream;
begin
	CheckArg(L, 2);
	lGraphic := TLuaGraphic(GetLuaObject(L, 1));
	Stream := TStream(GetLuaObject(L,2));
	lGraphic.LoadFromStream(Stream);
	
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
	AStream := TStream(GetLuaObject(L,2));
	AMimeType := lua_toStringCP(L,3);
	lGraphic.LoadFromMimeStream(AStream,AMimeType);
	
	Result := 0;
end;

function VCLua_Graphic_LoadFromLazarusResource(L: Plua_State): Integer; cdecl;
var
	lGraphic:TLuaGraphic;
	ResName:String;
begin
	CheckArg(L, 2);
	lGraphic := TLuaGraphic(GetLuaObject(L, 1));
	ResName := lua_toStringCP(L,2);
	lGraphic.LoadFromLazarusResource(ResName);
	
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
	Instance := THandle(lua_tointeger(L,2));
	ResName := lua_toStringCP(L,3);
	lGraphic.LoadFromResourceName(Instance,ResName);
	
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
	Instance := THandle(lua_tointeger(L,2));
	ResID := lua_tointeger(L,3);
	lGraphic.LoadFromResourceID(Instance,ResID);
	
	Result := 0;
end;

function VCLua_Graphic_LoadFromClipboardFormat(L: Plua_State): Integer; cdecl;
var
	lGraphic:TLuaGraphic;
	FormatID:TClipboardFormat;
begin
	CheckArg(L, 2);
	lGraphic := TLuaGraphic(GetLuaObject(L, 1));
	FormatID := TClipboardFormat(GetLuaObject(L,2));
	lGraphic.LoadFromClipboardFormat(FormatID);
	
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
	ClipboardType := TClipboardType(GetLuaObject(L,2));
	FormatID := TClipboardFormat(GetLuaObject(L,3));
	lGraphic.LoadFromClipboardFormatID(ClipboardType,FormatID);
	
	Result := 0;
end;

function VCLua_Graphic_SaveToFile(L: Plua_State): Integer; cdecl;
var
	lGraphic:TLuaGraphic;
	Filename:string;
begin
	CheckArg(L, 2);
	lGraphic := TLuaGraphic(GetLuaObject(L, 1));
	Filename := lua_toStringCP(L,2);
	lGraphic.SaveToFile(Filename);
	
	Result := 0;
end;

function VCLua_Graphic_SaveToStream(L: Plua_State): Integer; cdecl;
var
	lGraphic:TLuaGraphic;
	Stream:TStream;
begin
	CheckArg(L, 2);
	lGraphic := TLuaGraphic(GetLuaObject(L, 1));
	Stream := TStream(GetLuaObject(L,2));
	lGraphic.SaveToStream(Stream);
	
	Result := 0;
end;

function VCLua_Graphic_SaveToClipboardFormat(L: Plua_State): Integer; cdecl;
var
	lGraphic:TLuaGraphic;
	FormatID:TClipboardFormat;
begin
	CheckArg(L, 2);
	lGraphic := TLuaGraphic(GetLuaObject(L, 1));
	FormatID := TClipboardFormat(GetLuaObject(L,2));
	lGraphic.SaveToClipboardFormat(FormatID);
	
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
	ClipboardType := TClipboardType(GetLuaObject(L,2));
	FormatID := TClipboardFormat(GetLuaObject(L,3));
	lGraphic.SaveToClipboardFormatID(ClipboardType,FormatID);
	
	Result := 0;
end;

function VCLua_Graphic_GetSupportedSourceMimeTypes(L: Plua_State): Integer; cdecl;
var
	lGraphic:TLuaGraphic;
	List:TStrings;
begin
	CheckArg(L, 2);
	lGraphic := TLuaGraphic(GetLuaObject(L, 1));
	List := TStrings(GetLuaObject(L,2));
	lGraphic.GetSupportedSourceMimeTypes(List);
	
	Result := 0;
end;

function VCLua_Graphic_GetResourceType(L: Plua_State): Integer; cdecl;
var
	lGraphic:TLuaGraphic;
	ret:TResourceType;
begin
	CheckArg(L, 1);
	lGraphic := TLuaGraphic(GetLuaObject(L, 1));
	ret := lGraphic.GetResourceType();
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
	GraphicToTable(L,-1,v);
end;
procedure GraphicToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	if Sender = nil then begin
		lua_pushnil(L);
		Exit;
	end;
	SetDefaultMethods(L,Index,Sender);
	lua_pushliteral(L,'vmt');
	luaL_getmetatable(L,'TGraphic');
	lua_pushliteral(L,'__index');
	lua_rawget(L,-2);
	lua_remove(L,-2);
	lua_rawset(L,-3);
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
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
