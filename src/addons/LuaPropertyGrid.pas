unit LuaPropertyGrid;

interface

Uses Classes, Types, Forms, Controls, Lua, LuaController, RTTIGrids, ObjectInspector, PropEdits, Dialogs;

function CreatePropertyGrid(L: Plua_State): Integer; cdecl;

type

     TLuaOIPropertyGridRow = class(TOIPropertyGridRow)
        LuaCtl: TVCLuaControl;
     end;

     TLuaPropertyGrid = class(TTIPropertyGrid)
            LuaCtl: TVCLuaControl;
            private
               oldTIObject: TPersistent;
               procedure CollectionItemClick(Sender: TObject);
               procedure CollectionEditorClose(Sender: TObject; var CloseAction: TCloseAction);
            public
               procedure EditorFilterEvent(Sender: TObject; aEditor: TPropertyEditor; var aShow: boolean);
            published
            end;

// ***********************************************

implementation

Uses SysUtils, LuaProperties, LuaObject, LuaHelper,
     StdCtrls, CollectionPropEditForm;

procedure RowToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
  SetDefaultMethods(L, Index, Sender);
  LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
  LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
end;

function GetActiveRow(L: Plua_State): Integer; cdecl;
var pg: TLuaPropertyGrid;
begin
  CheckArg(L, 1);
  pg := TLuaPropertyGrid(GetLuaObject(L, 1));
  try
     RowToTable(L, -1, TLuaOIPropertyGridRow(pg.GetActiveRow))
  except
     lua_pushnil(L);
  end;
  result := 1;
end;

function PropertyPath(L: Plua_State): Integer; cdecl;
var pg: TLuaPropertyGrid;
    pr: TLuaOIPropertyGridRow;
    ri: Integer;
begin
  CheckArg(L, 2);
  pg := TLuaPropertyGrid(GetLuaObject(L, 1));
  if lua_isnumber(L,2) then begin
     ri := lua_tointeger(L,2);
     lua_pushstring(L, PChar(pg.PropertyPath(ri)))
  end else begin
     try
        pr := TLuaOIPropertyGridRow(GetLuaObject(L, 2));
        lua_pushstring(L, PChar(pg.PropertyPath(pr)))
     except
       lua_pushnil(L);
     end;
  end;
  result := 1;
end;

(*

               function GetRowByPath(const PropPath: string): TOIPropertyGridRow;
               function PropertyPath(Index: integer):string;
*)

function GetActiveProperty(L: Plua_State): Integer; cdecl;
var pg: TLuaPropertyGrid;
    ppath:String;
    pname:String;
begin
  CheckArg(L, 1);
  pg := TLuaPropertyGrid(GetLuaObject(L, 1));
  pname := pg.Rows[pg.ItemIndex].Name;
  ppath := pg.PropertyEditorHook.LookupRoot.GetNamePath;
  lua_pushstring(L,pchar(pname));
  lua_pushstring(L,pchar(ppath));
  if (pg.Rows[pg.ItemIndex].Parent<>nil) then
     lua_pushstring(L,pchar(pg.Rows[pg.ItemIndex].Parent.Name))
  else
     lua_pushnil(L);
  result := 3;
end;

function GetActivePropertyParent(L: Plua_State): Integer; cdecl;
var pg: TLuaPropertyGrid;
begin
  CheckArg(L, 1);
  pg := TLuaPropertyGrid(GetLuaObject(L, 1));
  if (pg.Rows[pg.ItemIndex].Parent<>nil) then
     lua_pushstring(L,pchar(pg.Rows[pg.ItemIndex].Parent.Name))
  else
     lua_pushnil(L);
  result := 1;
end;

function GetRow(L: Plua_State): Integer; cdecl;
var pg: TLuaPropertyGrid;
begin
  CheckArg(L, 2);
  pg := TLuaPropertyGrid(GetLuaObject(L, 1));
  try
     lua_pushobject(L,-1,pg.Rows[lua_tointeger(L,2)]);
  except
     lua_pushnil(L);
  end;
  result := 1;
end;

// Collection editor filter
procedure TLuaPropertyGrid.CollectionItemClick(Sender: TObject);
var i:Integer;
begin
  i := TListBox(Sender).ItemIndex;
  if (i>-1) and (i<TListBox(Sender).Count) then begin
     TIObject := TCollectionPropertyEditorForm(TListBox(Sender).Owner).Collection.Items[i];
  end;
end;

procedure TLuaPropertyGrid.CollectionEditorClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  TIObject := oldTIObject;
  CloseAction := caHide;
end;

procedure TLuaPropertyGrid.EditorFilterEvent(Sender: TObject; aEditor: TPropertyEditor; var aShow: boolean);
var
  ed: TCollectionPropertyEditor;
  fm: TCollectionPropertyEditorForm;
begin
     if (aEditor is TCollectionPropertyEditor) then begin
        oldTIObject := TIObject;
        ed := TCollectionPropertyEditor(aEditor);
        fm := TCollectionPropertyEditorForm(ed.ShowCollectionEditor(nil, nil, ''));
        fm.CollectionListBox.OnClick:=@CollectionItemClick;
        fm.OnClose:=@CollectionEditorClose;
        fm.Hide;
     end;
end;


procedure ToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
  SetDefaultMethods(L, Index, Sender);
  LuaSetTableFunction(L, index, 'GetActiveRow', @GetActiveRow);
  LuaSetTableFunction(L, index, 'PropertyPath', @PropertyPath);
  LuaSetTableFunction(L, index, 'GetActiveProperty', @GetActiveProperty);
  LuaSetTableFunction(L, index, 'GetActivePropertyParent', @GetActivePropertyParent);
  LuaSetTableFunction(L, index, 'GetRow', @GetRow);
  LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
  LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);

end;

function CreatePropertyGrid(L: Plua_State): Integer; cdecl;
var
  lPGrid:TLuaPropertyGrid;
  Parent:TWinControl;
  Name:String;
begin
  GetControlParents(L,Parent,Name);
  lPGrid := TLuaPropertyGrid.Create(Parent);
  lPGrid.Parent := Parent;
  lPGrid.LuaCtl := TVCLuaControl.Create(lPGrid,L,@ToTable);
  ToTable(L, -1, lPGrid);
  InitControl(L,lPGrid,Name);
  lPGrid.OnEditorFilter := @lPGrid.EditorFilterEvent;
  Result := 1;
end;

end.
