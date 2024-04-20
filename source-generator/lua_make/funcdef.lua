function_defnitions = {

["GetCells"] = {src = [[
function #FNAME(L: Plua_State): Integer; cdecl;
var
  strGrid:TLuaStringGrid;
  c,r :Integer;
begin
  strGrid := TLuaStringGrid(GetLuaObjectUnsafe(L, 1));
  c := lua_tointeger(L,2);
  r := lua_tointeger(L,3);
  lua_push(L,strGrid.Cells[c,r]);
  Result := 1;
end;]],
		finalMethodName="GetCells",
		vcluaMethodName="GetCells",
},

["SetCells"] = {src = [[
function #FNAME(L: Plua_State): Integer; cdecl;
var
  strGrid:TLuaStringGrid;
  c,r :Integer;
begin
  strGrid := TLuaStringGrid(GetLuaObjectUnsafe(L, 1));
  c := lua_tointeger(L,2);
  r := lua_tointeger(L,3);
  strGrid.Cells[c,r] := lua_tostring(L,4);
  Result := 0;
end;]],
		finalMethodName="SetCells",
		vcluaMethodName="SetCells",
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

["LoadFromHex"] = {src = [[
function #FNAME(L: Plua_State): Integer; cdecl;
var
  lMemoryStream:TLuaMemoryStream;
  s:String;
  from:Int64;
begin
  CheckArg(L, 2, 3);
  lMemoryStream := TLuaMemoryStream(GetLuaObjectPop(L, 1));
  s := luaL_checkPChar(L, 2, TypeInfo(s));
  TTrait<Int64>.luaL_optcheck(L, 3, @from, 1);
  try
     lMemoryStream.Clear;
     // eg. to skip first 4 bytes (size) in bitmap pass from=5
     from := 2*from-1;
     While from<=Length(s) Do Begin
       lMemoryStream.WriteByte(StrToIntDef('$'+Copy(s,from,2),0));
       Inc(from,2);
     End;
     lMemoryStream.Seek(0, soFromBeginning);
  except
    on E: Exception do
       CallError(L, 'MemoryStream', 'LoadFromHex', E.ClassName, E.Message);
  end;
  Result := 0;
end;
]],
		finalMethodName="LoadFromHex",
		vcluaMethodName="LoadFromHex",
},

}