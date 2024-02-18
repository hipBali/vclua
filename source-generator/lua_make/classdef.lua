-- **************************************************** --
--                                                      --
-- VCLua 1.1 Class source generator  TOLUA/FROMLUA      --
--                                                      --
-- (C) 2018-2024 Hi-Project Ltd.                        --
--                                                      --
-- **************************************************** --

-- Generic templates
VCLUA_TOSET = "luaL_checkSet(L,#,@#VAR,TypeInfo(#TYP));"
VCLUA_TOARRAY = "TTrait<#TYP>.luaL_checkArray(L, #, @#VAR);"
VCLUA_OPT_DEFAULT = "TTraitPti<#TYP>.luaL_optcheck(L, #, @#VAR, #DEF, TypeInfo(#TYP));"
VCLUA_TOLUA_FULL = "lua_push(L,ret,TypeInfo(ret));"
VCLUA_FROMLUA_FULL = "luaL_check(L,#,@#VAR,TypeInfo(#TYP));"

if checkTypeSupport then

-- enums and sets
VCLUA_ES = {
"TFillStyle",
}

VCLUA_TOLUA_DEFAULT = "lua_push(L,ret);"

VCLUA_TOLUA = {
	["pointer"] = "lua_pushlightuserdata(L,ret);", -- the only example is Application.CreateForm which returns untyped parameter which should be pushed as our object

	-- if src ~= "T"..cdef.name
	["tcustomimagelist"] = VCLUA_TOLUA_FULL,
	["tcustompage"] = VCLUA_TOLUA_FULL,
	["tcustomform"] = VCLUA_TOLUA_FULL,

	["tcomponent"] = VCLUA_TOLUA_FULL,
	["twincontrol"] = VCLUA_TOLUA_FULL,
}

VCLUA_FROMLUA_DEFAULT = "luaL_check(L,#,@#VAR);"
VCLUA_OPT = "TTrait<#TYP>.luaL_optcheck(L, #, @#VAR, #DEF);"

VCLUA_FROMLUA = {
	["pointer"] = "#VAR := Pointer(lua_touserdata(L,#));",
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
	["pointer"] = "lua_pushlightuserdata(L,ret);", -- the only example is Application.CreateForm which returns untyped parameter which should be pushed as our object
}

VCLUA_FROMLUA_DEFAULT = VCLUA_FROMLUA_FULL
VCLUA_OPT = VCLUA_OPT_DEFAULT

VCLUA_FROMLUA = {
	["pointer"] = "#VAR := Pointer(lua_touserdata(L,#));",
}
end
