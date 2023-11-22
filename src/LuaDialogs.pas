unit LuaDialogs;

interface

Uses Lua, Controls, Dialogs;

function LuaShowMessage(L: Plua_State): Integer; cdecl;
function LuaMessageDlg(L: Plua_State): Integer; cdecl;


implementation

Uses LuaHelper, Typinfo;

// ***********************************************
function LuaShowMessage(L: Plua_State): Integer; cdecl;
begin
  ShowMessage(lua_tostring(L,-1));
  Result := 0;
end;

procedure AddToButtonSet(var BSet:TMsgDlgButtons; But:String);
begin
    Include(BSet,TMsgDlgBtn(GetEnumValue(TypeInfo(TMsgDlgBtn),But)));
end;

// mtConfirmation
// mtInformation
// mtError
function LuaMessageDlg(L: Plua_State): Integer; cdecl;
var
	res: Integer;
  Mdb: TMsgDlgButtons;
  n:   Integer;
  Msg: String;
  MsgType: TMsgDlgType;
begin
  CheckArg(L, 3);
  n := lua_gettop(L);
  Msg := lua_tostring(L,1);
  MsgType := TMsgDlgType(GetEnumValue(TypeInfo(TMsgDlgType),lua_tostring(L,2)));
  Mdb := [];
  if lua_istable(L,3) then begin
     lua_pushnil(L);
     while (lua_next(L, n) <> 0) do begin
        AddToButtonSet(Mdb,lua_tostring(L, -1));
        lua_pop(L, 1);
     end;
  end else
    AddToButtonSet(Mdb,lua_tostring(L,3));
  res := MessageDlg( Msg, MsgType, Mdb, 0 );
  lua_pushstring(L,pchar(ButtonResult[res]));
  Result := 1;
end;

end.
