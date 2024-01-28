unit LuaObject;

{$mode objfpc}

interface

uses
  Classes,
  SysUtils,
  TypInfo,
  LuaHelper,
  LuaProperties,
  Lua,
  {$i luaobject_uses.inc};

procedure lua_pushobject(L: Plua_State; index: Integer; Comp:TObject);overload;

// TStrings
procedure lua_pushStrings(L: Plua_State; ItemOwner:TPersistent);
// getters -- e.g. StringGrid
procedure lua_pushItems(L: Plua_State; ItemOwner:TCollection);
procedure lua_pushCells(L: Plua_State; ItemOwner:TPersistent);
// setters -- e.g. StringGrid
function lua_setArrayProperty(L: Plua_State): Integer; cdecl;

implementation

uses
  LuaProxy;

procedure _lua_pushobject(L: Plua_State; index: Integer; Comp:TObject);overload;
begin
    lua_newtable(L);
    LuaSetTableLightUserData(L, index, HandleStr, Pointer(Comp));
    LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
    LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
end;

procedure lua_pushobject(L: Plua_State; index: Integer; Comp:TObject);overload;
var cName: String;
begin
    // GENERATED STUFF
    {$i luaobject_push.inc}
    begin
          _lua_pushobject(L,index,Comp);
    end
end;

procedure lua_pushStrings(L: Plua_State; ItemOwner:TPersistent);
var i,top:Integer;
begin
    lua_newtable(L);
    top := lua_gettop(L);
    for i:=0 to TStrings(ItemOwner).Count-1 do begin
      lua_pushinteger(L, i + 1 );
      lua_pushstring(L, PChar(TStrings(ItemOwner).Strings[i]));
      lua_settable(L, top);
    end;
    if TStrings(ItemOwner).Count=0 then begin
       lua_pushinteger(L, 1 );
       lua_pushnil(L);
       lua_settable(L, top);
    end;
end;

procedure lua_pushItems(L: Plua_State; ItemOwner:TCollection);
var i,top:Integer;
begin
    lua_newtable(L);
    top := lua_gettop(L);
    for i:=0 to ItemOwner.Count-1 do begin
      lua_pushinteger(L, i + 1 );
      lua_pushobject(L, -1, ItemOwner.Items[i]);
      lua_settable(L, top);
    end;
    if ItemOwner.Count=0 then
       lua_settable(L, top);
end;

procedure lua_pushCells(L: Plua_State; ItemOwner:TPersistent);
var i,j,top,ttop:Integer;
    Grid: TStringGrid;
begin
    Grid := TStringGrid(ItemOwner);
    lua_newtable(L);
    for i:=0 to Grid.ColCount-1 do begin
        top := lua_gettop(L);
        lua_pushinteger(L,i+1);
        lua_newtable(L);
        for j:=0 to Grid.RowCount-1 do begin
           lua_pushinteger(L, j+1);
           lua_pushstring(L, PChar(Grid.Cells[i, j]));
           lua_settable(L, -3);
        end;
        lua_settable(L, top);
    end;
end;

function lua_setArrayProperty(L: Plua_State): Integer; cdecl;
var
    luaObject: TObject;
    test:Variant;
    propName: String;
    objName: String;
    istd: boolean;
    i,j:Integer;
begin
    CheckArg(L, 4);
    luaObject := TObject(GetLuaObject(L, 1));
    objName := luaObject.ClassName;
    propName := lua_tostring(L, 2);
    if lua_istable(L,3) then begin
      lua_pushnil(L);
      while (lua_next(L, 3) <> 0) do begin
        if (lua_tointeger(L,-2)=1) then
           i :=  lua_tointeger(L, -1)
        else if (lua_tointeger(L,-2)=2) then
           j :=  lua_tointeger(L, -1);
        lua_pop(L, 1);
      end;
      istd := true;
    end
    else begin
        i := lua_tointeger(L, 3);
        istd := false;
    end;
    if luaObject <> nil then
       case objName of
            'TLuaStringGrid' : begin
                case lowercase(propName) of
                    'cells' :
                        try
                           TStringGrid(luaObject).Cells[i,j] := String(lua_tostring(L,4))
                        except
                            on E: Exception do
                               LuaError(L, E.ClassName , E.Message );
                        end;
                    'cols' :
                        try
                           TStringGrid(luaObject).Cols[i] := lua_toStringList(L,4)
                        except
                            on E: Exception do
                               LuaError(L, E.ClassName , E.Message );
                        end;
                    'rows' :
                        try
                           TStringGrid(luaObject).Rows[i] := lua_toStringList(L,4)
                        except
                            on E: Exception do
                               LuaError(L, E.ClassName , E.Message );
                        end;
                    'objects' :
                        try
                           TStringGrid(luaObject).Objects[i,j] := GetLuaObject(L, 4)
                        except
                            on E: Exception do
                               LuaError(L, E.ClassName , E.Message );
                        end;
                else
                    LuaError(L, 'Property not supported! ' , propName );
                end;
            end
            else begin
                LuaError(L, 'Setter not supported! ' , objName );
            end;
       end
    else begin
       LuaError(L, 'Can''t set array property! ' , objName +'.'+propName );
    end;


  result := 0;
end;

end.

