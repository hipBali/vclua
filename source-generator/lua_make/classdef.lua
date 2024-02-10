-- **************************************************** --
--                                                      --
-- VCLua 1.1 Class source generator  TOLUA/FROMLUA      --
--                                                      --
-- (C) 2018-2024 Hi-Project Ltd.                        --
--                                                      --
-- **************************************************** --

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

	-- default values
	
	["def_string"] = "luaL_optstring(L,#IDX,'#DEF');",
	["def_char"] = "char(luaL_optstring(L,#IDX,'#DEF'));",
	["def_boolean"] = "luaL_optbool(L,#IDX,#DEF);",
	["def_integer"] = "luaL_optint(L,#IDX,#DEF);",
	["def_tshiftstate"] = "lua_toTShiftState(L,#IDX,#DEF);",
	
	-- String UTF-8 cp
	["string"] = "#VAR := lua_toStringCP(L,#);",
	["pchar"] = "#VAR := PChar(lua_toStringCP(L,#));",
	
	["array of string"] = "#VAR := lua_toStringArray(L,#);",
	["char"] = "#VAR := Char(lua_tostring(L,#));",
	["pointer"] = "#VAR := Pointer(lua_touserdata(L,#));",
	["tpenpattern"] = "#VAR := lua_toLongWordArray(L,#);",
	["tutf8char"] = "#VAR := TUTF8Char(lua_tostring(L,#));",
	
	-- LuaProxy 
	["tpoint"] = "#VAR := lua_toTPoint(L,#);",
	["array of tpoint"] = "#VAR := lua_toTPointArray(L,#);",
	["trect"] = "#VAR := lua_toTRect(L,#);",
	["tsize"] = "#VAR := lua_toTSize(L,#);",
	["array of tmenuitem"] = "#VAR := lua_toTMenuItem(L,#);",
	["array of ttreenode"] = "#VAR := lua_toTTreeNode(L,#);",
	["ttextstyle"] = "#VAR := lua_toTextStyle(L,#);",
}

for _,t in pairs(VCLUA_FROMLUA_ES) do VCLUA_FROMLUA[t:lower()] = "luaL_check(L,#,@#VAR,TypeInfo(#TYP));" end

else
VCLUA_FROMLUA_DEFAULT = "luaL_check(L,#,@#VAR,TypeInfo(#TYP));"

VCLUA_FROMLUA = {
}
end

-- Generic 'set' template
VCLUA_TOSET_TEMP = "luaL_checkSet(L,#,@#VAR,TypeInfo(#TYP));"
