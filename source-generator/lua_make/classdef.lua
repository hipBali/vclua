-- **************************************************** --
--                                                      --
-- VCLua 1.1 Class source generator  TOLUA/FROMLUA      --
--                                                      --
-- (C) 2018-2024 Hi-Project Ltd.                        --
--                                                      --
-- **************************************************** --

-- map of types to Refs
typeRef = {}
vcluaTypeRef = {}

-- Generic templates
VCLUA_TOSET = "luaL_checkSet(L,#,@#VAR,TypeInfo(#TYP));"
VCLUA_TOARRAY = "TTrait<#TYP>.luaL_checkArray(L, #, @#VAR);"
VCLUA_OPT_DEFAULT = "TTraitPti<#TYP>.luaL_optcheck(L, #, @#VAR, #DEF, TypeInfo(#TYP));"
VCLUA_FROMLUA_TEMP = "#VARNeedsFree := luaL_checkOrFromTable(L,#,@#VAR,@#PROC);"
VCLUA_FROMLUA_FULL = "luaL_check(L,#,@#VAR,TypeInfo(#TYP));"
VCLUA_PUSHARRAY = "lua_pushArray<#TYP>(L, #VAR);"
VCLUA_TOLUA_FULL = "lua_push(L,#VAR,TypeInfo(#VAR));"
VCLUA_OPT_INLINE_FROMLUA = [[
if not lua_isnoneornil(L, #) then begin
		#FROMLUA
	end else
		#VAR := #DEF;
]]

VCLUA_OPT_INLINE_FROMLUA_LIST = {
  tcolor = 1,
  tgraphicscolor = 1,
}

VCLUA_FROMLUA_TEMP_MAP = {
  tstrings = "luaL_checkStringList",
  tstringlist = "luaL_checkStringList",
}

if checkTypeSupport then

-- enums and sets
VCLUA_ES = {
"TPenStyle",
}

VCLUA_TOLUA_DEFAULT = "lua_push(L,#VAR);"

VCLUA_TOLUA = {
	["pointer"] = "lua_pushlightuserdata(L,#VAR);", -- the only example is Application.CreateForm which returns untyped parameter which should be pushed as our object
	["tshortcut"] = "lua_pushShortCut(L,#VAR);",

	-- if src ~= "T"..cdef.name
	["tcustomimagelist"] = VCLUA_TOLUA_FULL,
	["tcustompage"] = VCLUA_TOLUA_FULL,
	["tcustomform"] = VCLUA_TOLUA_FULL,
	["tcustomlistview"] = VCLUA_TOLUA_FULL,
	["tcustomactionlist"] = VCLUA_TOLUA_FULL,
	["tcustomtreeview"] = VCLUA_TOLUA_FULL,
	["tcustomheadercontrol"] = VCLUA_TOLUA_FULL,
	["tcustomtabcontrol"] = VCLUA_TOLUA_FULL,
	["tcustomcolorbox"] = VCLUA_TOLUA_FULL,

	["tobject"] = VCLUA_TOLUA_FULL,
	["tcomponent"] = VCLUA_TOLUA_FULL,
	["twincontrol"] = VCLUA_TOLUA_FULL,
	["tpage"] = VCLUA_TOLUA_FULL,
	["tlistcolumn"] = VCLUA_TOLUA_FULL,
	["theadersection"] = VCLUA_TOLUA_FULL,
	["tanchorside"] = VCLUA_TOLUA_FULL,
	["ticon"] = VCLUA_TOLUA_FULL,
	["tmergedmenuitems"] = VCLUA_TOLUA_FULL,
	["tmemoscrollbar"] = VCLUA_TOLUA_FULL,
	["ticonoptions"] = VCLUA_TOLUA_FULL,
	["tborderstyle"] = VCLUA_TOLUA_FULL,
	["tcontrolborderspacing"] = VCLUA_TOLUA_FULL,
	["tsizeconstraints"] = VCLUA_TOLUA_FULL,
	["tleftright"] = VCLUA_TOLUA_FULL,
	["tshortcutlist"] = VCLUA_TOLUA_FULL,
	["tmonitor"] = VCLUA_TOLUA_FULL,
	["tcustomcolorlistbox"] = VCLUA_TOLUA_FULL,
}

VCLUA_FROMLUA_DEFAULT = "luaL_check(L,#,@#VAR);"
VCLUA_OPT = "TTrait<#TYP>.luaL_optcheck(L, #, @#VAR, #DEF);"

VCLUA_FROMLUA = {
	["pointer"] = "#VAR := Pointer(lua_touserdata(L,#));",
	["tborderstyle"] = VCLUA_FROMLUA_FULL,
	["tleftright"] = VCLUA_FROMLUA_FULL,
	["tshortcut"] = "#VAR := luaL_checkShortCut(L,#);",
	["tcolor"] = "#VAR := luaL_checkColor(L,#);",
	["tgraphicscolor"] = "#VAR := luaL_checkColor(L,#);",
}

VCLUA_ES_CHECK = {}
for _,t in pairs(VCLUA_ES) do
  local tl = t:lower()
  VCLUA_TOLUA[tl] = VCLUA_TOLUA_FULL
  VCLUA_FROMLUA[tl] = VCLUA_FROMLUA_FULL
  VCLUA_ES_CHECK[tl] = true
end

else
VCLUA_TOLUA_DEFAULT = VCLUA_TOLUA_FULL

VCLUA_TOLUA = {
	["pointer"] = "lua_pushlightuserdata(L,#VAR);", -- the only example is Application.CreateForm which returns untyped parameter which should be pushed as our object
}

VCLUA_FROMLUA_DEFAULT = VCLUA_FROMLUA_FULL
VCLUA_OPT = VCLUA_OPT_DEFAULT

VCLUA_FROMLUA = {
	["pointer"] = "#VAR := Pointer(lua_touserdata(L,#));",
}
end
