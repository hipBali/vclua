HDR_INFO = [[(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
]]

VCLua_CLASSDEF = [[
unit Lua#CNAME;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaController, TypInfo, LuaVmt, #REF;

#INTFCE

implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils#IMPLREF;

#BODY
#CREATE
#INIT
end.
]]

VCLua_CLASSDEF_NV = [[
unit Lua#CNAME;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaController, TypInfo, LuaVmt, #REF;

#INTFCE

implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils#IMPLREF;

#BODY
#CREATE
#INIT
end.
]]

VCLua_CDEF_INTFCE = [[
function Create#CNAME(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: T#CNAME; pti: PTypeInfo = nil); overload; inline;

type
    TLua#CNAME = class(T#CNAME)
        LuaCtl: TVCLuaControl;
    end;
]]

VCLua_CDEF_INTFCE_CANVAS = [[
function Create#CNAME(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: T#CNAME; pti: PTypeInfo = nil); overload; inline;

type
    TLua#CNAME = class(T#CNAME)
	  LuaCtl: TVCLuaControl;
	  published
	    property Canvas;
    end;
]]

VCLua_CDEF_INTFCE_NOCREATE = [[
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
	l#CNAME:TLua#CNAME;#VARS#RETVAR;
begin
	CheckArg(L, #VARCOUNT);
	l#CNAME := TLua#CNAME(GetLuaObject(L, 1));#TOVCLUA
#FUNC#PUSHTOLUA#PUSHOUTS
end;
]]

VCLua_TRY = [[
	try
#STMTS
	except
		on E: Exception do
			CallError(L, '#CNAME', '#MNAME', E.ClassName, E.Message);
	end;]]
VCLua_EVENT_SET = [[
	TLuaEvent.MaybeFree(TLuaCb(l#CNAME.#MNAME));
	l#CNAME.#MNAME := TLuaEvent.Factory<#ETYP,#LTYP>(L);
	Result := 0;]]
VCLua_CALL = [[
		#RETl#CNAME.#MNAME#PAR#SET;
		Result := #RETCOUNT;]]
VCLua_PROP_READ = [[
		ret := l#CNAME.#MNAME#PAR;
		#PUSHOUT
		Result := 1;]]
VCLua_PROP_WRITE = [[
		#TOVCLUA
		l#CNAME.#MNAME#PAR := ret;
		Result := 0;]]
VCLua_PROP = [[
		if lua_isnone(L, #IDX) then begin
]]..VCLua_PROP_READ:gsub('\t\t','\t\t\t')..[[

		end else begin
]]..VCLua_PROP_WRITE:gsub('\t\t','\t\t\t')..[[

		end;]]

VCLua_CDEF_TOTABLE = [[
procedure lua_push(L: Plua_State; const v: T#CNAME; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'#CSRC',v);
end;
]]

VCLua_CDEF_SUFFIX = [[
	l#CNAME.#PARENT := #PARENTCLASS(Parent);
	l#CNAME.LuaCtl := TVCLuaControl.Create(l#CNAME as TComponent,L,nil,'#CSRC');
	CreateTableForKnownType(L,'#CSRC',l#CNAME);
	InitControl(L,l#CNAME,Name);
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
    #CSRCFuncs: TLuaVmt;
    #CSRCSets: TLuaVmt;
]]

VCLUA_INIT = [[
	#CSRC#SUF := TLuaVmt.Create;
	#CMETHODS]]

VCLUA_ADD_MAP = [[
  vmts.Add('T#CSRC', @#CSRCFuncs);
  propSets.Add('T#CSRC', @#CSRCSets);
]]

VCLUA_EVENTDEF = [[
unit #UNITNAME;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaEvent#REF;

type
#DECLS

implementation
Uses LuaProxy, LuaObject, LuaHelper#IMPLREF;

#DEFS
end.
]]

VCLUA_EVENT_HANDLER_DECL = [[
  TLua#TYP = class(TLuaEvent)
    public
      procedure Handler(#PAR);
  end;
]]

VCLUA_EVENT_RET = "if # <= luaNewTop then #FROMLUA"

VCLUA_EVENT_HANDLER = [[
procedure TLua#TYP.Handler(#PAR);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  #TOLUA
  DoCall(L,#IDX);#FROMLUA
end;
]]
