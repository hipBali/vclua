-- **************************************************** --
--                                                      --
-- VCLua 1.1 Class source generator  TOLUA/FROMLUA      --
--                                                      --
-- (C) 2018-2024 Hi-Project Ltd.                        --
--                                                      --
-- **************************************************** --

VCLUA_OPT_DEFAULT = "TTraitPti<#TYP>.luaL_optcheck(L, #, @#VAR, #DEF, TypeInfo(#TYP));"

if checkTypeSupport then

VCLUA_TOLUA_DEFAULT = "lua_push(L,ret);"

VCLUA_TOLUA = {
	["pointer"] = "lua_pushlightuserdata(L,ret);", -- the only example is Application.CreateForm which returns untyped parameter which should be pushed as our object
	-- enums and sets
	["tcontrolrolesforform"] = "lua_push(L,ret,TypeInfo(ret));",
	["tcalendarpart"] = "lua_push(L,ret,TypeInfo(ret));",
	["tcalendarview"] = "lua_push(L,ret,TypeInfo(ret));",
	["ttreeviewinsertmarktype"] = "lua_push(L,ret,TypeInfo(ret));",
	["tgraphicsdraweffect"] = "lua_push(L,ret,TypeInfo(ret));",
	["tgridzone"] = "lua_push(L,ret,TypeInfo(ret));",

	-- if src ~= "T"..cdef.name
	["tcustomimagelist"] = "lua_push(L,ret,TypeInfo(ret));",
	["tcustompage"] = "lua_push(L,ret,TypeInfo(ret));",
	["tcustomform"] = "lua_push(L,ret,TypeInfo(ret));",

	["tcomponent"] = "lua_push(L,ret,TypeInfo(ret));",
	["twincontrol"] = "lua_push(L,ret,TypeInfo(ret));",
}

else
VCLUA_TOLUA_DEFAULT = "lua_push(L,ret,TypeInfo(ret));"

VCLUA_TOLUA = {
	["pointer"] = "lua_pushlightuserdata(L,ret);", -- the only example is Application.CreateForm which returns untyped parameter which should be pushed as our object
}
end

if checkTypeSupport then

VCLUA_FROMLUA_DEFAULT = "luaL_check(L,#,@#VAR);"
VCLUA_OPT = "TTrait<#TYP>.luaL_optcheck(L, #, @#VAR, #DEF);"

-- enums and sets
VCLUA_FROMLUA_ES = {
"TVleSortCol",
"TNodeAttachMode",
"TTreeViewInsertMarkType",
"TGraphicsDrawEffect",
"TAnchorKind",
"TFindItemKind",
"TDisplayCode",
"TSearchDirection",
"TDrawingStyle",
"TImageType",
"TClipboardType",
"TColumnButtonStyle",
"TOpenOption",
"TVleSortCol",
"TCheckBoxState",
"TFillStyle",
"TGraphicsBevelCut",
"TGradientDirection",
"TOperation",
"TAlign",
"TDefaultColorType",
}

VCLUA_FROMLUA = {
	["pointer"] = "#VAR := Pointer(lua_touserdata(L,#));",
}

VCLUA_TOLUA_ES = {}
for _,t in pairs(VCLUA_FROMLUA_ES) do
  local tl = t:lower()
  VCLUA_FROMLUA[tl] = "luaL_check(L,#,@#VAR,TypeInfo(#TYP));"
  VCLUA_TOLUA_ES[tl] = true
end

else
VCLUA_FROMLUA_DEFAULT = "luaL_check(L,#,@#VAR,TypeInfo(#TYP));"
VCLUA_OPT = VCLUA_OPT_DEFAULT

VCLUA_FROMLUA = {
	["pointer"] = "#VAR := Pointer(lua_touserdata(L,#));",
}
end

-- Generic templates
VCLUA_TOSET = "luaL_checkSet(L,#,@#VAR,TypeInfo(#TYP));"
VCLUA_TOARRAY = "TTrait<#TYP>.luaL_checkArray(L, #, @#VAR);"
