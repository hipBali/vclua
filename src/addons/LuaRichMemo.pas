unit LuaRichMemo;	
interface
Uses Classes, Controls, StdCtrls, RichMemo, TypInfo, LuaPas, LuaController;
function CreateRichMemo(L: Plua_State): Integer; cdecl;
type
    TLuaRichMemo = class(TRichMemo)
        LuaCtl: TVCLuaControl; 			
    end;
implementation
Uses LuaProperties, LuaProxy, LuaHelper, LCLClasses; 

procedure MemoToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
  SetDefaultMethods(L,Index,Sender);
  LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
  LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
end;
function CreateRichMemo(L: Plua_State): Integer; cdecl;
var
  lMemo:TLuaRichMemo;
  Parent:TComponent;
  Name:String;
begin
  GetControlParents(L,TWinControl(Parent),Name);
  lMemo := TLuaRichMemo.Create(Parent);
  lMemo.Parent := TWinControl(Parent);
  lMemo.LuaCtl := TVCLuaControl.Create(TControl(lMemo),L, @MemoToTable);
  InitControl(L,lMemo,Name);  
  MemoToTable(L, -1, lMemo);
  Result := 1;
end;
end.
