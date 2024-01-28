(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaTreeView;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, ComCtrls, Controls, TypInfo;

procedure lua_push(L: Plua_State; const v: TTreeNode; pti: PTypeInfo = nil); overload; inline;
procedure TreeNodeToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaTreeNode = class(TTreeNode)
    public
      L:Plua_State;
    end;

procedure lua_push(L: Plua_State; const v: TTreeNodes; pti: PTypeInfo = nil); overload; inline;
procedure TreeNodesToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaTreeNodes = class(TTreeNodes)
    public
      L:Plua_State;
    end;

function CreateTreeView(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TTreeView; pti: PTypeInfo = nil); overload; inline;
procedure TreeViewToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaTreeView = class(TTreeView)
        LuaCtl: TVCLuaControl;
    end;


implementation
Uses LuaProperties, LuaProxy, LuaObject, LuaHelper, LCLClasses;


function VCLua_TreeNodes_Add(L: Plua_State): Integer; cdecl;
var 
	lTreeNodes:TLuaTreeNodes;
	SiblingNode:TTreeNode;
	S:string;
	ret:TTreeNode;
begin
	CheckArg(L, 3);
	lTreeNodes := TLuaTreeNodes(GetLuaObject(L, 1));
	SiblingNode := TTreeNode(GetLuaObject(L,2));
	S := lua_toStringCP(L,3);
	ret := lTreeNodes.Add(SiblingNode,S);
	TreeNodeToTable(L,-1,ret);
	
	Result := 1;
end;

function VCLua_TreeNodes_AddChild(L: Plua_State): Integer; cdecl;
var 
	lTreeNodes:TLuaTreeNodes;
	ParentNode:TTreeNode;
	S:string;
	ret:TTreeNode;
begin
	CheckArg(L, 3);
	lTreeNodes := TLuaTreeNodes(GetLuaObject(L, 1));
	ParentNode := TTreeNode(GetLuaObject(L,2));
	S := lua_toStringCP(L,3);
	ret := lTreeNodes.AddChild(ParentNode,S);
	TreeNodeToTable(L,-1,ret);
	
	Result := 1;
end;

function VCLua_TreeNodes_AddChildFirst(L: Plua_State): Integer; cdecl;
var 
	lTreeNodes:TLuaTreeNodes;
	ParentNode:TTreeNode;
	S:string;
	ret:TTreeNode;
begin
	CheckArg(L, 3);
	lTreeNodes := TLuaTreeNodes(GetLuaObject(L, 1));
	ParentNode := TTreeNode(GetLuaObject(L,2));
	S := lua_toStringCP(L,3);
	ret := lTreeNodes.AddChildFirst(ParentNode,S);
	TreeNodeToTable(L,-1,ret);
	
	Result := 1;
end;

function VCLua_TreeNodes_AddChildObject(L: Plua_State): Integer; cdecl;
var 
	lTreeNodes:TLuaTreeNodes;
	ParentNode:TTreeNode;
	S:string;
	Data:Pointer;
	ret:TTreeNode;
begin
	CheckArg(L, 4);
	lTreeNodes := TLuaTreeNodes(GetLuaObject(L, 1));
	ParentNode := TTreeNode(GetLuaObject(L,2));
	S := lua_toStringCP(L,3);
	Data := Pointer(lua_touserdata(L,4));
	ret := lTreeNodes.AddChildObject(ParentNode,S,Data);
	TreeNodeToTable(L,-1,ret);
	
	Result := 1;
end;

function VCLua_TreeNodes_AddChildObjectFirst(L: Plua_State): Integer; cdecl;
var 
	lTreeNodes:TLuaTreeNodes;
	ParentNode:TTreeNode;
	S:string;
	Data:Pointer;
	ret:TTreeNode;
begin
	CheckArg(L, 4);
	lTreeNodes := TLuaTreeNodes(GetLuaObject(L, 1));
	ParentNode := TTreeNode(GetLuaObject(L,2));
	S := lua_toStringCP(L,3);
	Data := Pointer(lua_touserdata(L,4));
	ret := lTreeNodes.AddChildObjectFirst(ParentNode,S,Data);
	TreeNodeToTable(L,-1,ret);
	
	Result := 1;
end;

function VCLua_TreeNodes_AddFirst(L: Plua_State): Integer; cdecl;
var 
	lTreeNodes:TLuaTreeNodes;
	SiblingNode:TTreeNode;
	S:string;
	ret:TTreeNode;
begin
	CheckArg(L, 3);
	lTreeNodes := TLuaTreeNodes(GetLuaObject(L, 1));
	SiblingNode := TTreeNode(GetLuaObject(L,2));
	S := lua_toStringCP(L,3);
	ret := lTreeNodes.AddFirst(SiblingNode,S);
	TreeNodeToTable(L,-1,ret);
	
	Result := 1;
end;

function VCLua_TreeNodes_AddNode(L: Plua_State): Integer; cdecl;
var 
	lTreeNodes:TLuaTreeNodes;
	Node:TTreeNode;
	Relative:TTreeNode;
	S:string;
	Ptr:Pointer;
	Method:TNodeAttachMode;
	ret:TTreeNode;
begin
	CheckArg(L, 6);
	lTreeNodes := TLuaTreeNodes(GetLuaObject(L, 1));
	Node := TTreeNode(GetLuaObject(L,2));
	Relative := TTreeNode(GetLuaObject(L,3));
	S := lua_toStringCP(L,4);
	Ptr := Pointer(lua_touserdata(L,5));
	Method := TNodeAttachMode(GetLuaObject(L,6));
	ret := lTreeNodes.AddNode(Node,Relative,S,Ptr,Method);
	TreeNodeToTable(L,-1,ret);
	
	Result := 1;
end;

function VCLua_TreeNodes_AddObject(L: Plua_State): Integer; cdecl;
var 
	lTreeNodes:TLuaTreeNodes;
	SiblingNode:TTreeNode;
	S:string;
	Data:Pointer;
	ret:TTreeNode;
begin
	CheckArg(L, 4);
	lTreeNodes := TLuaTreeNodes(GetLuaObject(L, 1));
	SiblingNode := TTreeNode(GetLuaObject(L,2));
	S := lua_toStringCP(L,3);
	Data := Pointer(lua_touserdata(L,4));
	ret := lTreeNodes.AddObject(SiblingNode,S,Data);
	TreeNodeToTable(L,-1,ret);
	
	Result := 1;
end;

function VCLua_TreeNodes_AddObjectFirst(L: Plua_State): Integer; cdecl;
var 
	lTreeNodes:TLuaTreeNodes;
	SiblingNode:TTreeNode;
	S:string;
	Data:Pointer;
	ret:TTreeNode;
begin
	CheckArg(L, 4);
	lTreeNodes := TLuaTreeNodes(GetLuaObject(L, 1));
	SiblingNode := TTreeNode(GetLuaObject(L,2));
	S := lua_toStringCP(L,3);
	Data := Pointer(lua_touserdata(L,4));
	ret := lTreeNodes.AddObjectFirst(SiblingNode,S,Data);
	TreeNodeToTable(L,-1,ret);
	
	Result := 1;
end;

function VCLua_TreeNodes_FindNodeWithData(L: Plua_State): Integer; cdecl;
var 
	lTreeNodes:TLuaTreeNodes;
	NodeData:Pointer;
	ret:TTreeNode;
begin
	CheckArg(L, 2);
	lTreeNodes := TLuaTreeNodes(GetLuaObject(L, 1));
	NodeData := Pointer(lua_touserdata(L,2));
	ret := lTreeNodes.FindNodeWithData(NodeData);
	TreeNodeToTable(L,-1,ret);
	
	Result := 1;
end;

function VCLua_TreeNodes_FindNodeWithText(L: Plua_State): Integer; cdecl;
var 
	lTreeNodes:TLuaTreeNodes;
	NodeText:string;
	ret:TTreeNode;
begin
	CheckArg(L, 2);
	lTreeNodes := TLuaTreeNodes(GetLuaObject(L, 1));
	NodeText := lua_toStringCP(L,2);
	ret := lTreeNodes.FindNodeWithText(NodeText);
	TreeNodeToTable(L,-1,ret);
	
	Result := 1;
end;

function VCLua_TreeNodes_FindNodeWithTextPath(L: Plua_State): Integer; cdecl;
var 
	lTreeNodes:TLuaTreeNodes;
	TextPath:string;
	ret:TTreeNode;
begin
	CheckArg(L, 2);
	lTreeNodes := TLuaTreeNodes(GetLuaObject(L, 1));
	TextPath := lua_toStringCP(L,2);
	ret := lTreeNodes.FindNodeWithTextPath(TextPath);
	TreeNodeToTable(L,-1,ret);
	
	Result := 1;
end;

function VCLua_TreeNodes_FindTopLvlNode(L: Plua_State): Integer; cdecl;
var 
	lTreeNodes:TLuaTreeNodes;
	NodeText:string;
	ret:TTreeNode;
begin
	CheckArg(L, 2);
	lTreeNodes := TLuaTreeNodes(GetLuaObject(L, 1));
	NodeText := lua_toStringCP(L,2);
	ret := lTreeNodes.FindTopLvlNode(NodeText);
	TreeNodeToTable(L,-1,ret);
	
	Result := 1;
end;

function VCLua_TreeNodes_GetEnumerator(L: Plua_State): Integer; cdecl;
var 
	lTreeNodes:TLuaTreeNodes;
	ret:TTreeNodesEnumerator;
begin
	CheckArg(L, 1);
	lTreeNodes := TLuaTreeNodes(GetLuaObject(L, 1));
	ret := lTreeNodes.GetEnumerator();
	TreeNodesToTable(L,-1,ret);
	
	Result := 1;
end;

function VCLua_TreeNodes_GetFirstNode(L: Plua_State): Integer; cdecl;
var 
	lTreeNodes:TLuaTreeNodes;
	ret:TTreeNode;
begin
	CheckArg(L, 1);
	lTreeNodes := TLuaTreeNodes(GetLuaObject(L, 1));
	ret := lTreeNodes.GetFirstNode();
	TreeNodeToTable(L,-1,ret);
	
	Result := 1;
end;

function VCLua_TreeNodes_GetFirstVisibleNode(L: Plua_State): Integer; cdecl;
var 
	lTreeNodes:TLuaTreeNodes;
	ret:TTreeNode;
begin
	CheckArg(L, 1);
	lTreeNodes := TLuaTreeNodes(GetLuaObject(L, 1));
	ret := lTreeNodes.GetFirstVisibleNode();
	TreeNodeToTable(L,-1,ret);
	
	Result := 1;
end;

function VCLua_TreeNodes_GetLastVisibleNode(L: Plua_State): Integer; cdecl;
var 
	lTreeNodes:TLuaTreeNodes;
	ret:TTreeNode;
begin
	CheckArg(L, 1);
	lTreeNodes := TLuaTreeNodes(GetLuaObject(L, 1));
	ret := lTreeNodes.GetLastVisibleNode();
	TreeNodeToTable(L,-1,ret);
	
	Result := 1;
end;

function VCLua_TreeNodes_GetSelections(L: Plua_State): Integer; cdecl;
var 
	lTreeNodes:TLuaTreeNodes;
	AIndex:Integer;
	ret:TTreeNode;
begin
	CheckArg(L, 2);
	lTreeNodes := TLuaTreeNodes(GetLuaObject(L, 1));
	AIndex := lua_tointeger(L,2);
	ret := lTreeNodes.GetSelections(AIndex);
	TreeNodeToTable(L,-1,ret);
	
	Result := 1;
end;

function VCLua_TreeNodes_Insert(L: Plua_State): Integer; cdecl;
var 
	lTreeNodes:TLuaTreeNodes;
	NextNode:TTreeNode;
	S:string;
	ret:TTreeNode;
begin
	CheckArg(L, 3);
	lTreeNodes := TLuaTreeNodes(GetLuaObject(L, 1));
	NextNode := TTreeNode(GetLuaObject(L,2));
	S := lua_toStringCP(L,3);
	ret := lTreeNodes.Insert(NextNode,S);
	TreeNodeToTable(L,-1,ret);
	
	Result := 1;
end;

function VCLua_TreeNodes_InsertBehind(L: Plua_State): Integer; cdecl;
var 
	lTreeNodes:TLuaTreeNodes;
	PrevNode:TTreeNode;
	S:string;
	ret:TTreeNode;
begin
	CheckArg(L, 3);
	lTreeNodes := TLuaTreeNodes(GetLuaObject(L, 1));
	PrevNode := TTreeNode(GetLuaObject(L,2));
	S := lua_toStringCP(L,3);
	ret := lTreeNodes.InsertBehind(PrevNode,S);
	TreeNodeToTable(L,-1,ret);
	
	Result := 1;
end;

function VCLua_TreeNodes_InsertObject(L: Plua_State): Integer; cdecl;
var 
	lTreeNodes:TLuaTreeNodes;
	NextNode:TTreeNode;
	S:string;
	Data:Pointer;
	ret:TTreeNode;
begin
	CheckArg(L, 4);
	lTreeNodes := TLuaTreeNodes(GetLuaObject(L, 1));
	NextNode := TTreeNode(GetLuaObject(L,2));
	S := lua_toStringCP(L,3);
	Data := Pointer(lua_touserdata(L,4));
	ret := lTreeNodes.InsertObject(NextNode,S,Data);
	TreeNodeToTable(L,-1,ret);
	
	Result := 1;
end;

function VCLua_TreeNodes_InsertObjectBehind(L: Plua_State): Integer; cdecl;
var 
	lTreeNodes:TLuaTreeNodes;
	PrevNode:TTreeNode;
	S:string;
	Data:Pointer;
	ret:TTreeNode;
begin
	CheckArg(L, 4);
	lTreeNodes := TLuaTreeNodes(GetLuaObject(L, 1));
	PrevNode := TTreeNode(GetLuaObject(L,2));
	S := lua_toStringCP(L,3);
	Data := Pointer(lua_touserdata(L,4));
	ret := lTreeNodes.InsertObjectBehind(PrevNode,S,Data);
	TreeNodeToTable(L,-1,ret);
	
	Result := 1;
end;

function VCLua_TreeNodes_IsMultiSelection(L: Plua_State): Integer; cdecl;
var 
	lTreeNodes:TLuaTreeNodes;
	ret:boolean;
begin
	CheckArg(L, 1);
	lTreeNodes := TLuaTreeNodes(GetLuaObject(L, 1));
	ret := lTreeNodes.IsMultiSelection();
	lua_pushboolean(L,ret);
	
	Result := 1;
end;

function VCLua_TreeNodes_Assign(L: Plua_State): Integer; cdecl;
var 
	lTreeNodes:TLuaTreeNodes;
	Source:TPersistent;
begin
	CheckArg(L, 2);
	lTreeNodes := TLuaTreeNodes(GetLuaObject(L, 1));
	Source := TPersistent(GetLuaObject(L,2));
	lTreeNodes.Assign(Source);
	
	Result := 0;
end;

function VCLua_TreeNodes_BeginUpdate(L: Plua_State): Integer; cdecl;
var 
	lTreeNodes:TLuaTreeNodes;
begin
	CheckArg(L, 1);
	lTreeNodes := TLuaTreeNodes(GetLuaObject(L, 1));
	lTreeNodes.BeginUpdate();
	
	Result := 0;
end;

function VCLua_TreeNodes_Clear(L: Plua_State): Integer; cdecl;
var 
	lTreeNodes:TLuaTreeNodes;
begin
	CheckArg(L, 1);
	lTreeNodes := TLuaTreeNodes(GetLuaObject(L, 1));
	lTreeNodes.Clear();
	
	Result := 0;
end;

function VCLua_TreeNodes_ClearMultiSelection(L: Plua_State): Integer; cdecl;
var 
	lTreeNodes:TLuaTreeNodes;
	ClearSelected:boolean;
begin
	CheckArg(L, -1);
	lTreeNodes := TLuaTreeNodes(GetLuaObject(L, 1));
	ClearSelected := luaL_optbool(L,2,false);
	lTreeNodes.ClearMultiSelection(ClearSelected);
	
	Result := 0;
end;

function VCLua_TreeNodes_ConsistencyCheck(L: Plua_State): Integer; cdecl;
var 
	lTreeNodes:TLuaTreeNodes;
begin
	CheckArg(L, 1);
	lTreeNodes := TLuaTreeNodes(GetLuaObject(L, 1));
	lTreeNodes.ConsistencyCheck();
	
	Result := 0;
end;

function VCLua_TreeNodes_Delete(L: Plua_State): Integer; cdecl;
var 
	lTreeNodes:TLuaTreeNodes;
	Node:TTreeNode;
begin
	CheckArg(L, 2);
	lTreeNodes := TLuaTreeNodes(GetLuaObject(L, 1));
	Node := TTreeNode(GetLuaObject(L,2));
	lTreeNodes.Delete(Node);
	
	Result := 0;
end;

function VCLua_TreeNodes_EndUpdate(L: Plua_State): Integer; cdecl;
var 
	lTreeNodes:TLuaTreeNodes;
begin
	CheckArg(L, 1);
	lTreeNodes := TLuaTreeNodes(GetLuaObject(L, 1));
	lTreeNodes.EndUpdate();
	
	Result := 0;
end;

function VCLua_TreeNodes_FreeAllNodeData(L: Plua_State): Integer; cdecl;
var 
	lTreeNodes:TLuaTreeNodes;
begin
	CheckArg(L, 1);
	lTreeNodes := TLuaTreeNodes(GetLuaObject(L, 1));
	lTreeNodes.FreeAllNodeData();
	
	Result := 0;
end;

function VCLua_TreeNodes_SelectionsChanged(L: Plua_State): Integer; cdecl;
var 
	lTreeNodes:TLuaTreeNodes;
	ANode:TTreeNode;
	AIsSelected:Boolean;
begin
	CheckArg(L, 3);
	lTreeNodes := TLuaTreeNodes(GetLuaObject(L, 1));
	ANode := TTreeNode(GetLuaObject(L,2));
	AIsSelected := lua_toboolean(L,3);
	lTreeNodes.SelectionsChanged(ANode,AIsSelected);
	
	Result := 0;
end;

function VCLua_TreeNodes_SelectOnlyThis(L: Plua_State): Integer; cdecl;
var 
	lTreeNodes:TLuaTreeNodes;
	Node:TTreeNode;
begin
	CheckArg(L, 2);
	lTreeNodes := TLuaTreeNodes(GetLuaObject(L, 1));
	Node := TTreeNode(GetLuaObject(L,2));
	lTreeNodes.SelectOnlyThis(Node);
	
	Result := 0;
end;

function VCLua_TreeNodes_MultiSelect(L: Plua_State): Integer; cdecl;
var 
	lTreeNodes:TLuaTreeNodes;
	Node:TTreeNode;
	ClearWholeSelection:Boolean;
begin
	CheckArg(L, 3);
	lTreeNodes := TLuaTreeNodes(GetLuaObject(L, 1));
	Node := TTreeNode(GetLuaObject(L,2));
	ClearWholeSelection := lua_toboolean(L,3);
	lTreeNodes.MultiSelect(Node,ClearWholeSelection);
	
	Result := 0;
end;

function VCLua_TreeNodes_WriteDebugReport(L: Plua_State): Integer; cdecl;
var 
	lTreeNodes:TLuaTreeNodes;
	Prefix:string;
	AllNodes:boolean;
begin
	CheckArg(L, 3);
	lTreeNodes := TLuaTreeNodes(GetLuaObject(L, 1));
	Prefix := lua_toStringCP(L,2);
	AllNodes := lua_toboolean(L,3);
	lTreeNodes.WriteDebugReport(Prefix,AllNodes);
	
	Result := 0;
end;

function VCLua_TreeView_AlphaSort(L: Plua_State): Integer; cdecl;
var 
	lTreeView:TLuaTreeView;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	ret := lTreeView.AlphaSort();
	lua_pushboolean(L,ret);
	
	Result := 1;
end;

function VCLua_TreeView_ClearSelection(L: Plua_State): Integer; cdecl;
var 
	lTreeView:TLuaTreeView;
	KeepPrimary:Boolean;
begin
	CheckArg(L, -1);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	KeepPrimary := luaL_optbool(L,2,false);
	lTreeView.ClearSelection(KeepPrimary);
	
	Result := 0;
end;

function VCLua_TreeView_ConsistencyCheck(L: Plua_State): Integer; cdecl;
var 
	lTreeView:TLuaTreeView;
begin
	CheckArg(L, 1);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	lTreeView.ConsistencyCheck();
	
	Result := 0;
end;

function VCLua_TreeView_DefaultTreeViewSort(L: Plua_State): Integer; cdecl;
var 
	lTreeView:TLuaTreeView;
	Node1:TTreeNode;
	Node2:TTreeNode;
	ret:Integer;
begin
	CheckArg(L, 3);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	Node1 := TTreeNode(GetLuaObject(L,2));
	Node2 := TTreeNode(GetLuaObject(L,3));
	ret := lTreeView.DefaultTreeViewSort(Node1,Node2);
	lua_pushinteger(L,ret);
	
	Result := 1;
end;

function VCLua_TreeView_GetNodeAt(L: Plua_State): Integer; cdecl;
var 
	lTreeView:TLuaTreeView;
	X:Integer;
	Y:Integer;
	ret:TTreeNode;
begin
	CheckArg(L, 3);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	X := lua_tointeger(L,2);
	Y := lua_tointeger(L,3);
	ret := lTreeView.GetNodeAt(X,Y);
	TreeNodeToTable(L,-1,ret);
	
	Result := 1;
end;

function VCLua_TreeView_GetNodeWithExpandSignAt(L: Plua_State): Integer; cdecl;
var 
	lTreeView:TLuaTreeView;
	X:Integer;
	Y:Integer;
	ret:TTreeNode;
begin
	CheckArg(L, 3);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	X := lua_tointeger(L,2);
	Y := lua_tointeger(L,3);
	ret := lTreeView.GetNodeWithExpandSignAt(X,Y);
	TreeNodeToTable(L,-1,ret);
	
	Result := 1;
end;

function VCLua_TreeView_GetInsertMarkAt(L: Plua_State): Integer; cdecl;
var 
	lTreeView:TLuaTreeView;
	X:Integer;
	Y:Integer;
	AnInsertMarkNode:TTreeNode;
	AnInsertMarkType:TTreeViewInsertMarkType;
begin
	CheckArg(L, 3);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	X := lua_tointeger(L,2);
	Y := lua_tointeger(L,3);
	lTreeView.GetInsertMarkAt(X,Y,AnInsertMarkNode,AnInsertMarkType);
	TreeNodeToTable(L,-1,AnInsertMarkNode);
	lua_pushstring(L,PChar(GetEnumName(typeInfo(TTreeViewInsertMarkType), Ord(AnInsertMarkType))));
	Result := 2;
end;

function VCLua_TreeView_SetInsertMark(L: Plua_State): Integer; cdecl;
var 
	lTreeView:TLuaTreeView;
	AnInsertMarkNode:TTreeNode;
	AnInsertMarkType:TTreeViewInsertMarkType;
begin
	CheckArg(L, 3);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	AnInsertMarkNode := TTreeNode(GetLuaObject(L,2));
	AnInsertMarkType := TTreeViewInsertMarkType(GetLuaObject(L,3));
	lTreeView.SetInsertMark(AnInsertMarkNode,AnInsertMarkType);
	
	Result := 0;
end;

function VCLua_TreeView_SetInsertMarkAt(L: Plua_State): Integer; cdecl;
var 
	lTreeView:TLuaTreeView;
	X:integer;
	Y:integer;
begin
	CheckArg(L, 3);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	X := lua_tointeger(L,2);
	Y := lua_tointeger(L,3);
	lTreeView.SetInsertMarkAt(X,Y);
	
	Result := 0;
end;

function VCLua_TreeView_Invalidate(L: Plua_State): Integer; cdecl;
var 
	lTreeView:TLuaTreeView;
begin
	CheckArg(L, 1);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	lTreeView.Invalidate();
	
	Result := 0;
end;

function VCLua_TreeView_IsEditing(L: Plua_State): Integer; cdecl;
var 
	lTreeView:TLuaTreeView;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	ret := lTreeView.IsEditing();
	lua_pushboolean(L,ret);
	
	Result := 1;
end;

function VCLua_TreeView_BeginUpdate(L: Plua_State): Integer; cdecl;
var 
	lTreeView:TLuaTreeView;
begin
	CheckArg(L, 1);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	lTreeView.BeginUpdate();
	
	Result := 0;
end;

function VCLua_TreeView_EndUpdate(L: Plua_State): Integer; cdecl;
var 
	lTreeView:TLuaTreeView;
begin
	CheckArg(L, 1);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	lTreeView.EndUpdate();
	
	Result := 0;
end;

function VCLua_TreeView_FullCollapse(L: Plua_State): Integer; cdecl;
var 
	lTreeView:TLuaTreeView;
begin
	CheckArg(L, 1);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	lTreeView.FullCollapse();
	
	Result := 0;
end;

function VCLua_TreeView_FullExpand(L: Plua_State): Integer; cdecl;
var 
	lTreeView:TLuaTreeView;
begin
	CheckArg(L, 1);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	lTreeView.FullExpand();
	
	Result := 0;
end;

function VCLua_TreeView_LoadFromFile(L: Plua_State): Integer; cdecl;
var 
	lTreeView:TLuaTreeView;
	FileName:string;
begin
	CheckArg(L, 2);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	FileName := lua_toStringCP(L,2);
	lTreeView.LoadFromFile(FileName);
	
	Result := 0;
end;

function VCLua_TreeView_LoadFromStream(L: Plua_State): Integer; cdecl;
var 
	lTreeView:TLuaTreeView;
	Stream:TStream;
begin
	CheckArg(L, 2);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	Stream := TStream(GetLuaObject(L,2));
	lTreeView.LoadFromStream(Stream);
	
	Result := 0;
end;

function VCLua_TreeView_SaveToFile(L: Plua_State): Integer; cdecl;
var 
	lTreeView:TLuaTreeView;
	FileName:string;
begin
	CheckArg(L, 2);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	FileName := lua_toStringCP(L,2);
	lTreeView.SaveToFile(FileName);
	
	Result := 0;
end;

function VCLua_TreeView_SaveToStream(L: Plua_State): Integer; cdecl;
var 
	lTreeView:TLuaTreeView;
	Stream:TStream;
begin
	CheckArg(L, 2);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	Stream := TStream(GetLuaObject(L,2));
	lTreeView.SaveToStream(Stream);
	
	Result := 0;
end;

function VCLua_TreeView_WriteDebugReport(L: Plua_State): Integer; cdecl;
var 
	lTreeView:TLuaTreeView;
	Prefix:string;
	AllNodes:boolean;
begin
	CheckArg(L, 3);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	Prefix := lua_toStringCP(L,2);
	AllNodes := lua_toboolean(L,3);
	lTreeView.WriteDebugReport(Prefix,AllNodes);
	
	Result := 0;
end;

function VCLua_TreeView_LockSelectionChangeEvent(L: Plua_State): Integer; cdecl;
var 
	lTreeView:TLuaTreeView;
begin
	CheckArg(L, 1);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	lTreeView.LockSelectionChangeEvent();
	
	Result := 0;
end;

function VCLua_TreeView_UnlockSelectionChangeEvent(L: Plua_State): Integer; cdecl;
var 
	lTreeView:TLuaTreeView;
begin
	CheckArg(L, 1);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	lTreeView.UnlockSelectionChangeEvent();
	
	Result := 0;
end;

function VCLua_TreeView_GetFirstMultiSelected(L: Plua_State): Integer; cdecl;
var 
	lTreeView:TLuaTreeView;
	ret:TTreeNode;
begin
	CheckArg(L, 1);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	ret := lTreeView.GetFirstMultiSelected();
	TreeNodeToTable(L,-1,ret);
	
	Result := 1;
end;

function VCLua_TreeView_GetLastMultiSelected(L: Plua_State): Integer; cdecl;
var 
	lTreeView:TLuaTreeView;
	ret:TTreeNode;
begin
	CheckArg(L, 1);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	ret := lTreeView.GetLastMultiSelected();
	TreeNodeToTable(L,-1,ret);
	
	Result := 1;
end;

function VCLua_TreeView_Select(L: Plua_State): Integer; cdecl;
var 
	lTreeView:TLuaTreeView;
	Node:TTreeNode;
	ShiftState:TShiftState;
begin
	CheckArg(L, -1);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	Node := TTreeNode(GetLuaObject(L,2));
	ShiftState := lua_toTShiftState(L,3,[]);
	lTreeView.Select(Node,ShiftState);
	
	Result := 0;
end;

function VCLua_TreeView_Select2(L: Plua_State): Integer; cdecl;
var 
	lTreeView:TLuaTreeView;
	Nodes:array of TTreeNode;
begin
	CheckArg(L, 2);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	Nodes := lua_toTTreeNode(L,2);
	lTreeView.Select(Nodes);
	
	Result := 0;
end;

function VCLua_TreeView_Select3(L: Plua_State): Integer; cdecl;
var 
	lTreeView:TLuaTreeView;
	Nodes:TList;
begin
	CheckArg(L, 2);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	Nodes := TList(GetLuaObject(L,2));
	lTreeView.Select(Nodes);
	
	Result := 0;
end;

function VCLua_TreeView_SelectionVisible(L: Plua_State): Integer; cdecl;
var 
	lTreeView:TLuaTreeView;
	ret:boolean;
begin
	CheckArg(L, 1);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	ret := lTreeView.SelectionVisible();
	lua_pushboolean(L,ret);
	
	Result := 1;
end;

function VCLua_TreeView_MakeSelectionVisible(L: Plua_State): Integer; cdecl;
var 
	lTreeView:TLuaTreeView;
begin
	CheckArg(L, 1);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	lTreeView.MakeSelectionVisible();
	
	Result := 0;
end;

function VCLua_TreeView_ClearInvisibleSelection(L: Plua_State): Integer; cdecl;
var 
	lTreeView:TLuaTreeView;
begin
	CheckArg(L, 1);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	lTreeView.ClearInvisibleSelection();
	
	Result := 0;
end;

function VCLua_TreeView_StoreCurrentSelection(L: Plua_State): Integer; cdecl;
var 
	lTreeView:TLuaTreeView;
	ret:TStringList;
begin
	CheckArg(L, 1);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	ret := lTreeView.StoreCurrentSelection();
	TreeViewToTable(L,-1,ret);
	
	Result := 1;
end;

function VCLua_TreeView_ApplyStoredSelection(L: Plua_State): Integer; cdecl;
var 
	lTreeView:TLuaTreeView;
	ASelection:TStringList;
	FreeList:boolean;
begin
	CheckArg(L, -1);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	ASelection := TStringList(GetLuaObject(L,2));
	FreeList := luaL_optbool(L,3,True);
	lTreeView.ApplyStoredSelection(ASelection,FreeList);
	
	Result := 0;
end;

function VCLua_TreeView_MoveToNextNode(L: Plua_State): Integer; cdecl;
var 
	lTreeView:TLuaTreeView;
	ASelect:Boolean;
begin
	CheckArg(L, -1);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	ASelect := luaL_optbool(L,2,False);
	lTreeView.MoveToNextNode(ASelect);
	
	Result := 0;
end;

function VCLua_TreeView_MoveToPrevNode(L: Plua_State): Integer; cdecl;
var 
	lTreeView:TLuaTreeView;
	ASelect:Boolean;
begin
	CheckArg(L, -1);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	ASelect := luaL_optbool(L,2,False);
	lTreeView.MoveToPrevNode(ASelect);
	
	Result := 0;
end;

function VCLua_TreeView_MovePageDown(L: Plua_State): Integer; cdecl;
var 
	lTreeView:TLuaTreeView;
	ASelect:Boolean;
begin
	CheckArg(L, -1);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	ASelect := luaL_optbool(L,2,False);
	lTreeView.MovePageDown(ASelect);
	
	Result := 0;
end;

function VCLua_TreeView_MovePageUp(L: Plua_State): Integer; cdecl;
var 
	lTreeView:TLuaTreeView;
	ASelect:Boolean;
begin
	CheckArg(L, -1);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	ASelect := luaL_optbool(L,2,False);
	lTreeView.MovePageUp(ASelect);
	
	Result := 0;
end;

function VCLua_TreeView_MoveHome(L: Plua_State): Integer; cdecl;
var 
	lTreeView:TLuaTreeView;
	ASelect:Boolean;
begin
	CheckArg(L, -1);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	ASelect := luaL_optbool(L,2,False);
	lTreeView.MoveHome(ASelect);
	
	Result := 0;
end;

function VCLua_TreeView_MoveEnd(L: Plua_State): Integer; cdecl;
var 
	lTreeView:TLuaTreeView;
	ASelect:Boolean;
begin
	CheckArg(L, -1);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	ASelect := luaL_optbool(L,2,False);
	lTreeView.MoveEnd(ASelect);
	
	Result := 0;
end;

procedure lua_push(L: Plua_State; const v: TTreeNode; pti: PTypeInfo);
begin
	TreeNodeToTable(L,-1,v);
end;
procedure TreeNodeToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	if Sender = nil then begin
		lua_pushnil(L);
		Exit;
	end;
	SetDefaultMethods(L,Index,Sender);
	
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
end;

procedure lua_push(L: Plua_State; const v: TTreeNodes; pti: PTypeInfo);
begin
	TreeNodesToTable(L,-1,v);
end;
procedure TreeNodesToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	if Sender = nil then begin
		lua_pushnil(L);
		Exit;
	end;
	SetDefaultMethods(L,Index,Sender);
	LuaSetTableFunction(L, Index, 'Add', @VCLua_TreeNodes_Add);
	LuaSetTableFunction(L, Index, 'AddChild', @VCLua_TreeNodes_AddChild);
	LuaSetTableFunction(L, Index, 'AddChildFirst', @VCLua_TreeNodes_AddChildFirst);
	LuaSetTableFunction(L, Index, 'AddChildObject', @VCLua_TreeNodes_AddChildObject);
	LuaSetTableFunction(L, Index, 'AddChildObjectFirst', @VCLua_TreeNodes_AddChildObjectFirst);
	LuaSetTableFunction(L, Index, 'AddFirst', @VCLua_TreeNodes_AddFirst);
	LuaSetTableFunction(L, Index, 'AddNode', @VCLua_TreeNodes_AddNode);
	LuaSetTableFunction(L, Index, 'AddObject', @VCLua_TreeNodes_AddObject);
	LuaSetTableFunction(L, Index, 'AddObjectFirst', @VCLua_TreeNodes_AddObjectFirst);
	LuaSetTableFunction(L, Index, 'FindNodeWithData', @VCLua_TreeNodes_FindNodeWithData);
	LuaSetTableFunction(L, Index, 'FindNodeWithText', @VCLua_TreeNodes_FindNodeWithText);
	LuaSetTableFunction(L, Index, 'FindNodeWithTextPath', @VCLua_TreeNodes_FindNodeWithTextPath);
	LuaSetTableFunction(L, Index, 'FindTopLvlNode', @VCLua_TreeNodes_FindTopLvlNode);
	LuaSetTableFunction(L, Index, 'GetEnumerator', @VCLua_TreeNodes_GetEnumerator);
	LuaSetTableFunction(L, Index, 'GetFirstNode', @VCLua_TreeNodes_GetFirstNode);
	LuaSetTableFunction(L, Index, 'GetFirstVisibleNode', @VCLua_TreeNodes_GetFirstVisibleNode);
	LuaSetTableFunction(L, Index, 'GetLastVisibleNode', @VCLua_TreeNodes_GetLastVisibleNode);
	LuaSetTableFunction(L, Index, 'GetSelections', @VCLua_TreeNodes_GetSelections);
	LuaSetTableFunction(L, Index, 'Insert', @VCLua_TreeNodes_Insert);
	LuaSetTableFunction(L, Index, 'InsertBehind', @VCLua_TreeNodes_InsertBehind);
	LuaSetTableFunction(L, Index, 'InsertObject', @VCLua_TreeNodes_InsertObject);
	LuaSetTableFunction(L, Index, 'InsertObjectBehind', @VCLua_TreeNodes_InsertObjectBehind);
	LuaSetTableFunction(L, Index, 'IsMultiSelection', @VCLua_TreeNodes_IsMultiSelection);
	LuaSetTableFunction(L, Index, 'Assign', @VCLua_TreeNodes_Assign);
	LuaSetTableFunction(L, Index, 'BeginUpdate', @VCLua_TreeNodes_BeginUpdate);
	LuaSetTableFunction(L, Index, 'Clear', @VCLua_TreeNodes_Clear);
	LuaSetTableFunction(L, Index, 'ClearMultiSelection', @VCLua_TreeNodes_ClearMultiSelection);
	LuaSetTableFunction(L, Index, 'ConsistencyCheck', @VCLua_TreeNodes_ConsistencyCheck);
	LuaSetTableFunction(L, Index, 'Delete', @VCLua_TreeNodes_Delete);
	LuaSetTableFunction(L, Index, 'EndUpdate', @VCLua_TreeNodes_EndUpdate);
	LuaSetTableFunction(L, Index, 'FreeAllNodeData', @VCLua_TreeNodes_FreeAllNodeData);
	LuaSetTableFunction(L, Index, 'SelectionsChanged', @VCLua_TreeNodes_SelectionsChanged);
	LuaSetTableFunction(L, Index, 'SelectOnlyThis', @VCLua_TreeNodes_SelectOnlyThis);
	LuaSetTableFunction(L, Index, 'MultiSelect', @VCLua_TreeNodes_MultiSelect);
	LuaSetTableFunction(L, Index, 'WriteDebugReport', @VCLua_TreeNodes_WriteDebugReport);
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
end;

procedure lua_push(L: Plua_State; const v: TTreeView; pti: PTypeInfo);
begin
	TreeViewToTable(L,-1,v);
end;
procedure TreeViewToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	if Sender = nil then begin
		lua_pushnil(L);
		Exit;
	end;
	SetDefaultMethods(L,Index,Sender);
	LuaSetTableFunction(L, Index, 'AlphaSort', @VCLua_TreeView_AlphaSort);
	LuaSetTableFunction(L, Index, 'ClearSelection', @VCLua_TreeView_ClearSelection);
	LuaSetTableFunction(L, Index, 'ConsistencyCheck', @VCLua_TreeView_ConsistencyCheck);
	LuaSetTableFunction(L, Index, 'DefaultTreeViewSort', @VCLua_TreeView_DefaultTreeViewSort);
	LuaSetTableFunction(L, Index, 'GetNodeAt', @VCLua_TreeView_GetNodeAt);
	LuaSetTableFunction(L, Index, 'GetNodeWithExpandSignAt', @VCLua_TreeView_GetNodeWithExpandSignAt);
	LuaSetTableFunction(L, Index, 'GetInsertMarkAt', @VCLua_TreeView_GetInsertMarkAt);
	LuaSetTableFunction(L, Index, 'SetInsertMark', @VCLua_TreeView_SetInsertMark);
	LuaSetTableFunction(L, Index, 'SetInsertMarkAt', @VCLua_TreeView_SetInsertMarkAt);
	LuaSetTableFunction(L, Index, 'Invalidate', @VCLua_TreeView_Invalidate);
	LuaSetTableFunction(L, Index, 'IsEditing', @VCLua_TreeView_IsEditing);
	LuaSetTableFunction(L, Index, 'BeginUpdate', @VCLua_TreeView_BeginUpdate);
	LuaSetTableFunction(L, Index, 'EndUpdate', @VCLua_TreeView_EndUpdate);
	LuaSetTableFunction(L, Index, 'FullCollapse', @VCLua_TreeView_FullCollapse);
	LuaSetTableFunction(L, Index, 'FullExpand', @VCLua_TreeView_FullExpand);
	LuaSetTableFunction(L, Index, 'LoadFromFile', @VCLua_TreeView_LoadFromFile);
	LuaSetTableFunction(L, Index, 'LoadFromStream', @VCLua_TreeView_LoadFromStream);
	LuaSetTableFunction(L, Index, 'SaveToFile', @VCLua_TreeView_SaveToFile);
	LuaSetTableFunction(L, Index, 'SaveToStream', @VCLua_TreeView_SaveToStream);
	LuaSetTableFunction(L, Index, 'WriteDebugReport', @VCLua_TreeView_WriteDebugReport);
	LuaSetTableFunction(L, Index, 'LockSelectionChangeEvent', @VCLua_TreeView_LockSelectionChangeEvent);
	LuaSetTableFunction(L, Index, 'UnlockSelectionChangeEvent', @VCLua_TreeView_UnlockSelectionChangeEvent);
	LuaSetTableFunction(L, Index, 'GetFirstMultiSelected', @VCLua_TreeView_GetFirstMultiSelected);
	LuaSetTableFunction(L, Index, 'GetLastMultiSelected', @VCLua_TreeView_GetLastMultiSelected);
	LuaSetTableFunction(L, Index, 'Select', @VCLua_TreeView_Select);
	LuaSetTableFunction(L, Index, 'Select2', @VCLua_TreeView_Select2);
	LuaSetTableFunction(L, Index, 'Select3', @VCLua_TreeView_Select3);
	LuaSetTableFunction(L, Index, 'SelectionVisible', @VCLua_TreeView_SelectionVisible);
	LuaSetTableFunction(L, Index, 'MakeSelectionVisible', @VCLua_TreeView_MakeSelectionVisible);
	LuaSetTableFunction(L, Index, 'ClearInvisibleSelection', @VCLua_TreeView_ClearInvisibleSelection);
	LuaSetTableFunction(L, Index, 'StoreCurrentSelection', @VCLua_TreeView_StoreCurrentSelection);
	LuaSetTableFunction(L, Index, 'ApplyStoredSelection', @VCLua_TreeView_ApplyStoredSelection);
	LuaSetTableFunction(L, Index, 'MoveToNextNode', @VCLua_TreeView_MoveToNextNode);
	LuaSetTableFunction(L, Index, 'MoveToPrevNode', @VCLua_TreeView_MoveToPrevNode);
	LuaSetTableFunction(L, Index, 'MovePageDown', @VCLua_TreeView_MovePageDown);
	LuaSetTableFunction(L, Index, 'MovePageUp', @VCLua_TreeView_MovePageUp);
	LuaSetTableFunction(L, Index, 'MoveHome', @VCLua_TreeView_MoveHome);
	LuaSetTableFunction(L, Index, 'MoveEnd', @VCLua_TreeView_MoveEnd);
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
end;
function CreateTreeView(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lTreeView := TLuaTreeView.Create(Parent);
	lTreeView.Parent := TWinControl(Parent);
	lTreeView.LuaCtl := TVCLuaControl.Create(lTreeView as TComponent,L,@TreeViewToTable);
	InitControl(L,lTreeView,Name);
	TreeViewToTable(L, -1, lTreeView);
	Result := 1;
end;

end.
