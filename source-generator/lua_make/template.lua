HDR_INFO = [[(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
]]

VCLua_CLASSDEF = [[
unit Lua#CNAME;	

{$MODE Delphi}{$T+}

interface

Uses Classes, Lua, LuaController#REF, TypInfo;

#INTFCE

implementation
Uses LuaProperties, LuaProxy, LuaObject, LuaHelper, LCLClasses, SysUtils;

#BODY
#CREATE
#INIT
end.
]]

VCLua_CLASSDEF_NV = [[
unit Lua#CNAME;	

{$MODE Delphi}{$T+}

interface

Uses Classes, Lua, LuaController#REF, TypInfo;

#INTFCE

implementation
Uses LuaProperties, LuaProxy, LuaObject, LuaHelper, LCLClasses, SysUtils;

#BODY
#CREATE
#INIT
end.
]]

VCLua_CDEF_INTFCE = [[
function Create#CNAME(L: Plua_State): Integer; cdecl;
function Is#CNAME(L: Plua_State): Integer; cdecl;
function As#CNAME(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: T#CNAME; pti: PTypeInfo = nil); overload; inline;

type
    TLua#CNAME = class(T#CNAME)
        LuaCtl: TVCLuaControl;
    end;
]]

VCLua_CDEF_INTFCE_CANVAS = [[
function Create#CNAME(L: Plua_State): Integer; cdecl;
function Is#CNAME(L: Plua_State): Integer; cdecl;
function As#CNAME(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: T#CNAME; pti: PTypeInfo = nil); overload; inline;

type
    TLua#CNAME = class(T#CNAME)
	  LuaCtl: TVCLuaControl;
	  published
	    property Canvas;
    end;
]]

VCLua_CDEF_INTFCE_NOCREATE = [[
function Is#CNAME(L: Plua_State): Integer; cdecl;
function As#CNAME(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: T#CNAME; pti: PTypeInfo = nil); overload; inline;

type
    TLua#CNAME = class(T#CNAME)
    public
      L:Plua_State;
    end;
]]

VCLua_CDEF_INTFCE_NV = [[
function Create#CNAME(L: Plua_State): Integer; cdecl;
]]..VCLua_CDEF_INTFCE_NOCREATE

VCLua_CDEF_LUAFUNC = [[
function #FNAME(L: Plua_State): Integer; cdecl;
var
	l#CNAME:TLua#CNAME;#VARS;#RETVAR;
begin
	CheckArg(L, #VARCOUNT);
	l#CNAME := TLua#CNAME(GetLuaObject(L, 1));#TOVCLUA#FUNC#PUSHTOLUA#PUSHOUTS
	Result := #RETCOUNT;
end;
]]

VCLua_CDEF_TOTABLE = [[
function Is#CNAME(L: Plua_State): Integer; cdecl;
begin
  CheckArg(L, 1);
  Result := 1;
  lua_push(L, GetLuaObject(L, 1) is T#CNAME);
end;
function As#CNAME(L: Plua_State): Integer; cdecl;
var o : TObject;
begin
  CheckArg(L, 1);
  Result := 1;
  o := GetLuaObject(L, 1);
  if o is T#CNAME then
    lua_push(L, T#CNAME(o))
  else
    lua_pushnil(L);
end;
procedure lua_push(L: Plua_State; const v: T#CNAME; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'#CSRC',v);
end;
]]

VCLua_CDEF_SUFFIX = [[
	l#CNAME.#PARENT := #PARENTCLASS(Parent);
	l#CNAME.LuaCtl := TVCLuaControl.Create(l#CNAME as TComponent,L,nil,'#CSRC');
	InitControl(L,l#CNAME,Name);
	CreateTableForKnownType(L,'#CSRC',l#CNAME);
	Result := 1;
end;
]]

VCLua_CDEF_FOOTER = [[
function Create#CNAME(L: Plua_State): Integer; cdecl;
var
	l#CNAME:TLua#CNAME;
	Parent:#PARENTCLASS;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	l#CNAME := TLua#CNAME.Create(Parent);
]]..VCLua_CDEF_SUFFIX

VCLua_CDEF_FOOTER_FORM = [[
function Create#CNAME(L: Plua_State): Integer; cdecl;
var
	l#CNAME:TLua#CNAME;
	Parent:#PARENTCLASS;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	l#CNAME := TLua#CNAME.CreateNew(Parent);
]]..VCLua_CDEF_SUFFIX

VCLua_CDEF_FOOTER_NV = [[
function Create#CNAME(L: Plua_State): Integer; cdecl;
var
	l#CNAME:TLua#CNAME;
begin
	l#CNAME := TLua#CNAME.Create;
	CreateTableForKnownType(L,'#CSRC',l#CNAME);
	Result := 1;
end;]]

VCLua_CDEF_FOOTER_BASE = [[
function Create#CNAME(L: Plua_State): Integer; cdecl;
var
	l#CNAME:TLua#CNAME;
	Name:String;
begin
	l#CNAME := TLua#CNAME.Create;
	l#CNAME.LuaCtl := TVCLuaControl.Create(TComponent(l#CNAME),L,nil,'#CSRC'); // although it's not a TComponent
	CreateTableForKnownType(L,'#CSRC',l#CNAME);
	Result := 1;
end;
]]

VCLua_CDEF_FOOTER_WCLASS= [[
function Create#CNAME(L: Plua_State): Integer; cdecl;
var
	l#CNAME:TLua#CNAME;
	Parent:#PARENTCLASS;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	l#CNAME := TLua#CNAME.Create(Parent, #WCLASS);
]]..VCLua_CDEF_SUFFIX

VCLUA_INC = [[
	
	// GENERATED SOURCES ***********************
	#PASCALSOURCE;
	// *****************************************
	
	const
		LUA_VCL_LIBNAME = 'vcl';

	var
	vcl_lib : array[0..#LIBCOUNT] of lual_reg = (
		#LUALIBS
		(name:nil;func:nil)
	);
]]

VCLUA_INIT_INTFCE = [[
var
    #CSRCFuncs: aoluaL_Reg;
]]

VCLUA_INIT = [[
	SetLength(#CSRCFuncs, #MIDX+1);
	#CMETHODS
	#CSRCFuncs[#MIDX].name:=nil;
	#CSRCFuncs[#MIDX].func:=nil;
]]

VCLUA_ADD_MAP = [[
  funcs.Add('T#CSRC', #CSRCFuncs);
]]