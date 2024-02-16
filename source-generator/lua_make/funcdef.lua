function_defnitions = {

["GetCells"] = {src = [[
function #FNAME(L: Plua_State): Integer; cdecl;
var
  strGrid:TLuaStringGrid;
  c,r :Integer;
begin
  CheckArg(L, 3);
  strGrid := TLuaStringGrid(GetLuaObject(L, 1));
  c := lua_tointeger(L,2);
  r := lua_tointeger(L,3);
  lua_pushstringCP(L,pchar(strGrid.Cells[c,r]));
  Result := 1;
end;]],
		finalMethodName="GetCells",
		vcluaMethodName="GridCellsGet",
},

["SetCells"] = {src = [[
function #FNAME(L: Plua_State): Integer; cdecl;
var
  strGrid:TLuaStringGrid;
  c,r :Integer;
begin
  CheckArg(L, 4);
  strGrid := TLuaStringGrid(GetLuaObject(L, 1));
  c := lua_tointeger(L,2);
  r := lua_tointeger(L,3);
  strGrid.Cells[c,r] := lua_tostringCP(L,4);
  Result := 0;
end;]],
		finalMethodName="SetCells",
		vcluaMethodName="GridCellsSet",
},

["GetSelectedCell"] = {src = [[
function #FNAME(L: Plua_State): Integer; cdecl;
var
  strGrid:TLuaStringGrid;
  c,r :Integer;
  Rect : TRect;
begin
  CheckArg(L, 1);
  strGrid := TLuaStringGrid(GetLuaObject(L, 1));
  c := strGrid.Selection.TopLeft.x;
  r := strGrid.Selection.TopLeft.y;
  Rect := strGrid.CellRect(c,r);
  lua_pushnumber(L,c);
  lua_pushnumber(L,r);
  Result := 2;
end;]],
		finalMethodName="GetSelectedCell",
		vcluaMethodName="GridGetSelectedCell",
},

["ItemsToTable"] = {src = [[
function #FNAME(L: Plua_State): Integer; cdecl;
var
  items: TStrings;
begin
  items := TStrings(GetLuaObject(L, 1));
  lua_pushStrings(L, items); 
  Result := 1;
end;
]],
		finalMethodName="ToTable",
		vcluaMethodName="ItemsToTable",
},

["CheckListBoxSetChecked"] = {src = [[
function #FNAME(L: Plua_State): Integer; cdecl;
var
  b: TCustomCheckListBox;
  idx: Integer;
  c: boolean;
begin
  CheckArg(L, 3);
  b := TCustomCheckListBox(GetLuaObject(L, 1));
  idx := lua_tointeger(L,2);
  c := lua_toboolean(L,3);
  b.Checked[idx] := c;
  Result := 0;
end;
]],
		finalMethodName="SetChecked",
		vcluaMethodName="CheckListBoxSetChecked",
},

["CheckListBoxGetChecked"] = {src = [[
function #FNAME(L: Plua_State): Integer; cdecl;
var
  b: TCustomCheckListBox;
  idx: Integer;
begin
  CheckArg(L, 2);
  b := TCustomCheckListBox(GetLuaObject(L, 1));
  idx := lua_tointeger(L,2);
  lua_pushboolean(L, b.Checked[idx]);
  Result := 1;
end;
]],
		finalMethodName="GetChecked",
		vcluaMethodName="CheckListBoxGetChecked",
},
	
["DialogExecute"] = {src = [[
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

["SetPixel"] = {src = [[
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

}