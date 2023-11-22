function_defnitions = {
	["DialogExecute"] = {
		src = [[
function #FNAME(L: Plua_State): Integer; cdecl;
var
  d: TCommonDialog;
begin
  d := TCommonDialog(GetLuaObject(L, 1));
  lua_pushboolean(L, d.Execute);
  Result := 1;
end;
]],
		finalMethodName="Execute",
		vcluaMethodName="DoExecute",
	},
	["SetPixel"] = {
		src = [[
function #FNAME(L: Plua_State): Integer; cdecl;
var
	lCanvas:TLuaCanvas;
  	X:Integer;
	Y:Integer;
	C:TColor;    
begin
	CheckArg(L, 4);
	lCanvas := TLuaCanvas(GetLuaObject(L, 1));
	X := lua_tointeger(L,2);
	Y := lua_tointeger(L,3);
	C := TColor(lua_tointeger(L,4));
	lCanvas.Pixels[X,Y] := C; 
    Result := 0;
end;
]],
		finalMethodName="SetPixel",
		vcluaMethodName="SetPixel",
	},
	["AddMenu"] = {
		finalMethodName="Add",
		vcluaMethodName="VCLua_MenuItem_Add",
	},
}