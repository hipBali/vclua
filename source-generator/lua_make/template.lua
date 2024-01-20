HDR_INFO = [[(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
]]
VCLua_CDEF_HEADER = [[
unit Lua#CNAME;	
interface
Uses Classes, Lua, LuaController#REF;
]]
VCLua_CLASSDEF = [[
unit Lua#CNAME;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController#REF;

#INTFCE

implementation
Uses LuaProperties, TypInfo, LuaProxy, LuaObject, LuaHelper, LCLClasses; 

#BODY
#CREATE
end.
]]

VCLua_CLASSDEF_NV = [[
unit Lua#CNAME;	

interface

Uses Classes, Lua, LuaController#REF;

#INTFCE

implementation
Uses LuaProperties, TypInfo, LuaProxy, LuaObject, LuaHelper, LCLClasses; 

#BODY
#CREATE
end.
]]

VCLua_CDEF_INTFCE = [[
function Create#CNAME(L: Plua_State): Integer; cdecl;
procedure #CNAMEToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLua#CNAME = class(T#CNAME)
        LuaCtl: TVCLuaControl;
    end;
]]

VCLua_CDEF_INTFCE_CANVAS = [[
function Create#CNAME(L: Plua_State): Integer; cdecl;
procedure #CNAMEToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLua#CNAME = class(T#CNAME)
	  LuaCtl: TVCLuaControl;
	  published
	    property Canvas;
    end;
]]

VCLua_CDEF_INTFCE_NV = [[
function Create#CNAME(L: Plua_State): Integer; cdecl;
procedure #CNAMEToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLua#CNAME = class(T#CNAME)
		public
			L:Plua_State;
    end;
]]


VCLua_CDEF_INTFCE_NOCREATE = [[
procedure #CNAMEToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLua#CNAME = class(T#CNAME)
		public
			L:Plua_State;   
    end;
]]

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
procedure #CNAMEToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	SetDefaultMethods(L,Index,Sender);
	#CMETHODS
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
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
	l#CNAME.#PARENT := #PARENTCLASS(Parent);
	l#CNAME.LuaCtl := TVCLuaControl.Create(TControl(l#CNAME),L,@#CNAMEToTable);
	InitControl(L,l#CNAME,Name);
	#CNAMEToTable(L, -1, l#CNAME);
	Result := 1;
end;
]]

VCLua_CDEF_FOOTER_FORM = [[
function Create#CNAME(L: Plua_State): Integer; cdecl;
var
	l#CNAME:TLua#CNAME;
	Parent:#PARENTCLASS;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	l#CNAME := TLua#CNAME.CreateNew(Parent);
	l#CNAME.#PARENT := #PARENTCLASS(Parent);
	l#CNAME.LuaCtl := TVCLuaControl.Create(TControl(l#CNAME),L,@#CNAMEToTable);
	InitControl(L,l#CNAME,Name);
	#CNAMEToTable(L, -1, l#CNAME);
	Result := 1;
end;
]]

VCLua_CDEF_FOOTER_NV = [[
function Create#CNAME(L: Plua_State): Integer; cdecl;
var
	l#CNAME:TLua#CNAME;
begin
	l#CNAME := TLua#CNAME.Create;
	#CNAMEToTable(L, -1, l#CNAME);
	Result := 1;
end;]]

VCLua_CDEF_FOOTER_BASE = [[
function Create#CNAME(L: Plua_State): Integer; cdecl;
var
	l#CNAME:TLua#CNAME;
	Name:String;
begin
	l#CNAME := TLua#CNAME.Create;
	l#CNAME.LuaCtl := TVCLuaControl.Create(TComponent(l#CNAME),L,@#CNAMEToTable);
	#CNAMEToTable(L, -1, l#CNAME);
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
	l#CNAME.#PARENT := #PARENTCLASS(Parent);
	l#CNAME.LuaCtl := TVCLuaControl.Create(TControl(l#CNAME),L,@#CNAMEToTable);
	InitControl(L,l#CNAME,Name);
	#CNAMEToTable(L, -1, l#CNAME);
	Result := 1;
end;
]]

VCLUA_OBJECT_PUSH = [[
if (comp.InheritsFrom(T#CNAME)) then
	#CNAMEToTable(L,index,Comp)
else]]

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

