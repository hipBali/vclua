unit LuaPropertyGrid;

interface

Uses Classes, Types, Forms, Controls, Lua, LuaController, RTTIGrids, PropEdits, Dialogs;

function CreatePropertyGrid(L: Plua_State): Integer; cdecl;

type
     TLuaPropertyGrid = class(TTIPropertyGrid)
            LuaCtl: TVCLuaControl;
            private
               oldTIObject: TPersistent;
               fGraphicPropertyEditor,
               fPicturePropertyEditor,
               fBitmapPropertyEditor
               : TLuaCFunction;
               procedure CollectionItemClick(Sender: TObject);
               procedure CollectionEditorClose(Sender: TObject; var CloseAction: TCloseAction);
            public
               procedure EditorFilterEvent(Sender: TObject; aEditor: TPropertyEditor; var aShow: boolean);
            published
               property GraphicPropertyEditor: TLuaCFunction read fGraphicPropertyEditor write fGraphicPropertyEditor;
               property PicturePropertyEditor: TLuaCFunction read fPicturePropertyEditor write fPicturePropertyEditor;
               property BitmapPropertyEditor: TLuaCFunction read fBitmapPropertyEditor write fBitmapPropertyEditor;
            end;

// ***********************************************

implementation

Uses SysUtils, LuaProperties, LuaObject, LuaHelper,
     StdCtrls, CollectionPropEditForm;

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
  result := 2;
end;

function GetRow(L: Plua_State): Integer; cdecl;
var pg: TLuaPropertyGrid;
begin
  CheckArg(L, 2);
  pg := TLuaPropertyGrid(GetLuaObject(L, 1));
  try
     lua_pushobject(L,pg.Rows[lua_tointeger(L,2)],-1);
  except
     lua_pushnil(L);
  end;
  result := 1;
end;

procedure ToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
  SetDefaultMethods(L, Index, Sender);
  LuaSetTableFunction(L, index, 'GetActiveProperty', @GetActiveProperty);
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
  InitControl(L,lPGrid,Name);
  ToTable(L, -1, lPGrid);
  lPGrid.OnEditorFilter := @lPGrid.EditorFilterEvent;
  Result := 1;
end;

end.
