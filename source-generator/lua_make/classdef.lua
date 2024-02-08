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

VCLUA_FROMLUA = {

	-- default values
	
	["def_string"] = "luaL_optstring(L,#IDX,'#DEF');",
	["def_char"] = "char(luaL_optstring(L,#IDX,'#DEF'));",
	["def_boolean"] = "luaL_optbool(L,#IDX,#DEF);",
	["def_integer"] = "luaL_optint(L,#IDX,#DEF);",
	["def_tshiftstate"] = "lua_toTShiftState(L,#IDX,#DEF);",
	
	-- String UTF-8 cp
	["string"] = "lua_toStringCP(L,#);",
	["pchar"] = "PChar(lua_toStringCP(L,#));",
	
	["array of string"] = "lua_toStringArray(L,#);",
	["char"] = "Char(lua_tostring(L,#));",
	["integer"] = "lua_tointeger(L,#);",
	["boolean"] = "lua_toboolean(L,#);",
	["pointer"] = "Pointer(lua_touserdata(L,#));",
	["longint"] = "lua_tointeger(L,#);",
	["cardinal"] = "lua_tointeger(L,#);",
	["double"] = "lua_tonumber(L,#);",
	["longword"] = "lua_tointeger(L,#);",
	["single"] = "lua_tonumber(L,#);",
	["word"] = "Word(lua_tointeger(L,#));",
	["qword"] = "QWord(lua_tointeger(L,#));",
	["byte"] = "Byte(lua_tointeger(L,#));",
	["int64"] = "Int64(lua_tonumber(L,#));",
	["thandle"] = "THandle(lua_tointeger(L,#));",
	["ptrint"] = "lua_tointeger(L,#);",
	["tcolor"] = "TColor(lua_tointeger(L,#));",
	["tcursor"] = "TCursor(lua_tointeger(L,#));",
	["hicon"] = "THandle(lua_tointeger(L,#));",
	["hbitmap"] = "lua_tointeger(L,#);",
	["toverlay"] = "lua_tointeger(L,#);",
	["tpenpattern"] = "lua_toLongWordArray(L,#);",
	["tutf8char"] = "TUTF8Char(lua_tostring(L,#));",
	
	-- LuaProxy 
	["tpoint"] = "lua_toTPoint(L,#);",
	["array of tpoint"] = "lua_toTPointArray(L,#);",
	["trect"] = "lua_toTRect(L,#);",
	["tsize"] = "lua_toTSize(L,#);",
	["array of tmenuitem"] = "lua_toTMenuItem(L,#);",
	["array of ttreenode"] = "lua_toTTreeNode(L,#);",
	["ttextstyle"] = "lua_toTextStyle(L,#);",
	["tshiftstate"] = "lua_toTShiftState(L,#);",
		
}

-- Generic 'set' template
VCLUA_TOSET_TEMP = "%s(GetEnumValue(TypeInfo(%s),lua_tostring(L,#)));"
