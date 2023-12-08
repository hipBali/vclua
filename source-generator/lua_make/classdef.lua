-- **************************************************** --
--                                                      --
-- VCLua 1.1 Class source generator  TOLUA/FROMLUA      --
--                                                      --
-- (C) 2018-2023 Hi-Project Ltd.                             --
--                                                      --
-- **************************************************** --

VCLUA_TOLUA = {
	["string"] = "lua_pushstring(L,PChar(ret));",
	["pchar"] = "lua_pushstring(L,PChar(ret));",
	["integer"] = "lua_pushinteger(L,ret);",
	["boolean"] = "lua_pushboolean(L,ret);",
	["longint"] = "lua_pushinteger(L,ret);",
	["cardinal"] = "lua_pushinteger(L,ret);",
	["double"] = "lua_pushnumber(L,ret);",
	["word"] = "lua_pushinteger(L,ret);",
	["qword"] = "lua_pushinteger(L,ret);",
	["byte"] = "lua_pushinteger(L,ret);",
	["int64"] = "lua_pushnumber(L,ret);",
	["pointer"] = "lua_pushlightuserdata(L,ret);",
	["thandle"] = "lua_pushinteger(L,ret);",
	["tcontrol"] = "lua_pushlightuserdata(L,ret);",
	["tcomponent"] = "lua_pushlightuserdata(L,ret);",
	["tcolor"] = "lua_pushinteger(L,ret);",
	["tpoint"] = "lua_pushTPoint(L,ret);",
	["trect"] = "lua_pushTRect(L,ret);",
	["hicon"] = "lua_pushlightuserdata(L,@ret);",
	["hbitmap"] = "lua_pushinteger(L,ret);",
	["tresourcetype"] = "lua_pushstring(L,PChar(ret));",
	["tcontrolrolesforform"] = "lua_pushlightuserdata(L,@ret);",
	["tcustomform"] = "lua_pushlightuserdata(L,@ret);",
	["thelpcontext"] = "lua_pushinteger(L,ret);",
	["tcalendarpart"] = "lua_pushlightuserdata(L,@ret);",
	["tcalendarview"] = "lua_pushlightuserdata(L,@ret);",
	
	["TGENERICCLASS"] = "if ret=nil then lua_pushnil(L) else %sToTable(L,-1,ret);",
	
	-- treeview
	["ttreeviewinsertmarktype"] = "lua_pushstring(L,PChar(GetEnumName(typeInfo(TTreeViewInsertMarkType), Ord(ret))));",
	-- treeview function result is a treenode!
	["ttreenode"] = "if ret=nil then lua_pushnil(L) else TreeNodeToTable(L,-1,ret);",
	
	-- stringgrid
	["tgridcolumn"] = "GridColumnToTable(L,-1,ret);",
	
	-- inherited classes
	["tcustomimagelist"] = "ImageListToTable(L,-1,ret);",
	["tcontainedaction"] = "ActionToTable(L,-1,ret);",
	
}

VCLUA_FROMLUA = {

	-- default values
	
	["def_string"] = "luaL_optstring(L,#IDX,'#DEF');",
	["def_char"] = "char(luaL_optstring(L,#IDX,'#DEF'));",
	["def_boolean"] = "luaL_optbool(L,#IDX,#DEF);",
	["def_integer"] = "luaL_optint(L,#IDX,#DEF);",
	["def_tshiftstate"] = "lua_toTShiftState(L,#IDX,#DEF);",
	

	["string"] = "lua_tostring(L,#);",
	["array of string"] = "lua_toStringArray(L,#);",
	["pchar"] = "PChar(lua_tostring(L,#));",
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
