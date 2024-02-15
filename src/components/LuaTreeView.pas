(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaTreeView;	

{$MODE Delphi}{$T+}

interface

Uses Classes, Lua, LuaController, ComCtrls, Controls, LuaStringList, TypInfo;

function IsTreeNode(L: Plua_State): Integer; cdecl;
function AsTreeNode(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TTreeNode; pti: PTypeInfo = nil); overload; inline;

type
    TLuaTreeNode = class(TTreeNode)
    public
      L:Plua_State;
    end;
var
    TreeNodeFuncs: aoluaL_Reg;

function IsTreeNodes(L: Plua_State): Integer; cdecl;
function AsTreeNodes(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TTreeNodes; pti: PTypeInfo = nil); overload; inline;

type
    TLuaTreeNodes = class(TTreeNodes)
    public
      L:Plua_State;
    end;
var
    TreeNodesFuncs: aoluaL_Reg;

function CreateTreeView(L: Plua_State): Integer; cdecl;
function IsTreeView(L: Plua_State): Integer; cdecl;
function AsTreeView(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TTreeView; pti: PTypeInfo = nil); overload; inline;

type
    TLuaTreeView = class(TTreeView)
        LuaCtl: TVCLuaControl;
    end;
var
    CustomTreeViewFuncs: aoluaL_Reg;


implementation
Uses LuaProperties, LuaProxy, LuaObject, LuaHelper, LCLClasses, SysUtils;


function VCLua_TreeNodes_Add(L: Plua_State): Integer; cdecl;
var
	lTreeNodes:TLuaTreeNodes;
	SiblingNode:TTreeNode;
	S:string;
	ret:TTreeNode;
begin
	CheckArg(L, 3);
	lTreeNodes := TLuaTreeNodes(GetLuaObject(L, 1));
	luaL_check(L,2,@SiblingNode);
	luaL_check(L,3,@S);
	try
		ret := lTreeNodes.Add(SiblingNode,S);
	except
		on E: Exception do
			CallError(L, 'TreeNodes', 'Add', E.ClassName, E.Message);
	end;

	lua_push(L,ret);
	
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
	luaL_check(L,2,@ParentNode);
	luaL_check(L,3,@S);
	try
		ret := lTreeNodes.AddChild(ParentNode,S);
	except
		on E: Exception do
			CallError(L, 'TreeNodes', 'AddChild', E.ClassName, E.Message);
	end;

	lua_push(L,ret);
	
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
	luaL_check(L,2,@ParentNode);
	luaL_check(L,3,@S);
	try
		ret := lTreeNodes.AddChildFirst(ParentNode,S);
	except
		on E: Exception do
			CallError(L, 'TreeNodes', 'AddChildFirst', E.ClassName, E.Message);
	end;

	lua_push(L,ret);
	
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
	luaL_check(L,2,@ParentNode);
	luaL_check(L,3,@S);
	Data := Pointer(lua_touserdata(L,4));
	try
		ret := lTreeNodes.AddChildObject(ParentNode,S,Data);
	except
		on E: Exception do
			CallError(L, 'TreeNodes', 'AddChildObject', E.ClassName, E.Message);
	end;

	lua_push(L,ret);
	
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
	luaL_check(L,2,@ParentNode);
	luaL_check(L,3,@S);
	Data := Pointer(lua_touserdata(L,4));
	try
		ret := lTreeNodes.AddChildObjectFirst(ParentNode,S,Data);
	except
		on E: Exception do
			CallError(L, 'TreeNodes', 'AddChildObjectFirst', E.ClassName, E.Message);
	end;

	lua_push(L,ret);
	
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
	luaL_check(L,2,@SiblingNode);
	luaL_check(L,3,@S);
	try
		ret := lTreeNodes.AddFirst(SiblingNode,S);
	except
		on E: Exception do
			CallError(L, 'TreeNodes', 'AddFirst', E.ClassName, E.Message);
	end;

	lua_push(L,ret);
	
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
	luaL_check(L,2,@Node);
	luaL_check(L,3,@Relative);
	luaL_check(L,4,@S);
	Ptr := Pointer(lua_touserdata(L,5));
	luaL_check(L,6,@Method,TypeInfo(TNodeAttachMode));
	try
		ret := lTreeNodes.AddNode(Node,Relative,S,Ptr,Method);
	except
		on E: Exception do
			CallError(L, 'TreeNodes', 'AddNode', E.ClassName, E.Message);
	end;

	lua_push(L,ret);
	
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
	luaL_check(L,2,@SiblingNode);
	luaL_check(L,3,@S);
	Data := Pointer(lua_touserdata(L,4));
	try
		ret := lTreeNodes.AddObject(SiblingNode,S,Data);
	except
		on E: Exception do
			CallError(L, 'TreeNodes', 'AddObject', E.ClassName, E.Message);
	end;

	lua_push(L,ret);
	
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
	luaL_check(L,2,@SiblingNode);
	luaL_check(L,3,@S);
	Data := Pointer(lua_touserdata(L,4));
	try
		ret := lTreeNodes.AddObjectFirst(SiblingNode,S,Data);
	except
		on E: Exception do
			CallError(L, 'TreeNodes', 'AddObjectFirst', E.ClassName, E.Message);
	end;

	lua_push(L,ret);
	
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
	try
		ret := lTreeNodes.FindNodeWithData(NodeData);
	except
		on E: Exception do
			CallError(L, 'TreeNodes', 'FindNodeWithData', E.ClassName, E.Message);
	end;

	lua_push(L,ret);
	
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
	luaL_check(L,2,@NodeText);
	try
		ret := lTreeNodes.FindNodeWithText(NodeText);
	except
		on E: Exception do
			CallError(L, 'TreeNodes', 'FindNodeWithText', E.ClassName, E.Message);
	end;

	lua_push(L,ret);
	
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
	luaL_check(L,2,@TextPath);
	try
		ret := lTreeNodes.FindNodeWithTextPath(TextPath);
	except
		on E: Exception do
			CallError(L, 'TreeNodes', 'FindNodeWithTextPath', E.ClassName, E.Message);
	end;

	lua_push(L,ret);
	
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
	luaL_check(L,2,@NodeText);
	try
		ret := lTreeNodes.FindTopLvlNode(NodeText);
	except
		on E: Exception do
			CallError(L, 'TreeNodes', 'FindTopLvlNode', E.ClassName, E.Message);
	end;

	lua_push(L,ret);
	
	Result := 1;
end;

function VCLua_TreeNodes_GetFirstNode(L: Plua_State): Integer; cdecl;
var
	lTreeNodes:TLuaTreeNodes;
	ret:TTreeNode;
begin
	CheckArg(L, 1);
	lTreeNodes := TLuaTreeNodes(GetLuaObject(L, 1));
	try
		ret := lTreeNodes.GetFirstNode();
	except
		on E: Exception do
			CallError(L, 'TreeNodes', 'GetFirstNode', E.ClassName, E.Message);
	end;

	lua_push(L,ret);
	
	Result := 1;
end;

function VCLua_TreeNodes_GetFirstVisibleNode(L: Plua_State): Integer; cdecl;
var
	lTreeNodes:TLuaTreeNodes;
	ret:TTreeNode;
begin
	CheckArg(L, 1);
	lTreeNodes := TLuaTreeNodes(GetLuaObject(L, 1));
	try
		ret := lTreeNodes.GetFirstVisibleNode();
	except
		on E: Exception do
			CallError(L, 'TreeNodes', 'GetFirstVisibleNode', E.ClassName, E.Message);
	end;

	lua_push(L,ret);
	
	Result := 1;
end;

function VCLua_TreeNodes_GetLastVisibleNode(L: Plua_State): Integer; cdecl;
var
	lTreeNodes:TLuaTreeNodes;
	ret:TTreeNode;
begin
	CheckArg(L, 1);
	lTreeNodes := TLuaTreeNodes(GetLuaObject(L, 1));
	try
		ret := lTreeNodes.GetLastVisibleNode();
	except
		on E: Exception do
			CallError(L, 'TreeNodes', 'GetLastVisibleNode', E.ClassName, E.Message);
	end;

	lua_push(L,ret);
	
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
	luaL_check(L,2,@AIndex);
	try
		ret := lTreeNodes.GetSelections(AIndex);
	except
		on E: Exception do
			CallError(L, 'TreeNodes', 'GetSelections', E.ClassName, E.Message);
	end;

	lua_push(L,ret);
	
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
	luaL_check(L,2,@NextNode);
	luaL_check(L,3,@S);
	try
		ret := lTreeNodes.Insert(NextNode,S);
	except
		on E: Exception do
			CallError(L, 'TreeNodes', 'Insert', E.ClassName, E.Message);
	end;

	lua_push(L,ret);
	
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
	luaL_check(L,2,@PrevNode);
	luaL_check(L,3,@S);
	try
		ret := lTreeNodes.InsertBehind(PrevNode,S);
	except
		on E: Exception do
			CallError(L, 'TreeNodes', 'InsertBehind', E.ClassName, E.Message);
	end;

	lua_push(L,ret);
	
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
	luaL_check(L,2,@NextNode);
	luaL_check(L,3,@S);
	Data := Pointer(lua_touserdata(L,4));
	try
		ret := lTreeNodes.InsertObject(NextNode,S,Data);
	except
		on E: Exception do
			CallError(L, 'TreeNodes', 'InsertObject', E.ClassName, E.Message);
	end;

	lua_push(L,ret);
	
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
	luaL_check(L,2,@PrevNode);
	luaL_check(L,3,@S);
	Data := Pointer(lua_touserdata(L,4));
	try
		ret := lTreeNodes.InsertObjectBehind(PrevNode,S,Data);
	except
		on E: Exception do
			CallError(L, 'TreeNodes', 'InsertObjectBehind', E.ClassName, E.Message);
	end;

	lua_push(L,ret);
	
	Result := 1;
end;

function VCLua_TreeNodes_IsMultiSelection(L: Plua_State): Integer; cdecl;
var
	lTreeNodes:TLuaTreeNodes;
	ret:boolean;
begin
	CheckArg(L, 1);
	lTreeNodes := TLuaTreeNodes(GetLuaObject(L, 1));
	try
		ret := lTreeNodes.IsMultiSelection();
	except
		on E: Exception do
			CallError(L, 'TreeNodes', 'IsMultiSelection', E.ClassName, E.Message);
	end;

	lua_push(L,ret);
	
	Result := 1;
end;

function VCLua_TreeNodes_Assign(L: Plua_State): Integer; cdecl;
var
	lTreeNodes:TLuaTreeNodes;
	Source:TPersistent;
begin
	CheckArg(L, 2);
	lTreeNodes := TLuaTreeNodes(GetLuaObject(L, 1));
	luaL_check(L,2,@Source);
	try
		lTreeNodes.Assign(Source);
	except
		on E: Exception do
			CallError(L, 'TreeNodes', 'Assign', E.ClassName, E.Message);
	end;

	
	Result := 0;
end;

function VCLua_TreeNodes_BeginUpdate(L: Plua_State): Integer; cdecl;
var
	lTreeNodes:TLuaTreeNodes;
begin
	CheckArg(L, 1);
	lTreeNodes := TLuaTreeNodes(GetLuaObject(L, 1));
	try
		lTreeNodes.BeginUpdate();
	except
		on E: Exception do
			CallError(L, 'TreeNodes', 'BeginUpdate', E.ClassName, E.Message);
	end;

	
	Result := 0;
end;

function VCLua_TreeNodes_Clear(L: Plua_State): Integer; cdecl;
var
	lTreeNodes:TLuaTreeNodes;
begin
	CheckArg(L, 1);
	lTreeNodes := TLuaTreeNodes(GetLuaObject(L, 1));
	try
		lTreeNodes.Clear();
	except
		on E: Exception do
			CallError(L, 'TreeNodes', 'Clear', E.ClassName, E.Message);
	end;

	
	Result := 0;
end;

function VCLua_TreeNodes_ClearMultiSelection(L: Plua_State): Integer; cdecl;
var
	lTreeNodes:TLuaTreeNodes;
	ClearSelected:boolean;
begin
	CheckArg(L, 1, 2);
	lTreeNodes := TLuaTreeNodes(GetLuaObject(L, 1));
	TTrait<boolean>.luaL_optcheck(L, 2, @ClearSelected, false);
	try
		lTreeNodes.ClearMultiSelection(ClearSelected);
	except
		on E: Exception do
			CallError(L, 'TreeNodes', 'ClearMultiSelection', E.ClassName, E.Message);
	end;

	
	Result := 0;
end;

function VCLua_TreeNodes_ConsistencyCheck(L: Plua_State): Integer; cdecl;
var
	lTreeNodes:TLuaTreeNodes;
begin
	CheckArg(L, 1);
	lTreeNodes := TLuaTreeNodes(GetLuaObject(L, 1));
	try
		lTreeNodes.ConsistencyCheck();
	except
		on E: Exception do
			CallError(L, 'TreeNodes', 'ConsistencyCheck', E.ClassName, E.Message);
	end;

	
	Result := 0;
end;

function VCLua_TreeNodes_Delete(L: Plua_State): Integer; cdecl;
var
	lTreeNodes:TLuaTreeNodes;
	Node:TTreeNode;
begin
	CheckArg(L, 2);
	lTreeNodes := TLuaTreeNodes(GetLuaObject(L, 1));
	luaL_check(L,2,@Node);
	try
		lTreeNodes.Delete(Node);
	except
		on E: Exception do
			CallError(L, 'TreeNodes', 'Delete', E.ClassName, E.Message);
	end;

	
	Result := 0;
end;

function VCLua_TreeNodes_EndUpdate(L: Plua_State): Integer; cdecl;
var
	lTreeNodes:TLuaTreeNodes;
begin
	CheckArg(L, 1);
	lTreeNodes := TLuaTreeNodes(GetLuaObject(L, 1));
	try
		lTreeNodes.EndUpdate();
	except
		on E: Exception do
			CallError(L, 'TreeNodes', 'EndUpdate', E.ClassName, E.Message);
	end;

	
	Result := 0;
end;

function VCLua_TreeNodes_FreeAllNodeData(L: Plua_State): Integer; cdecl;
var
	lTreeNodes:TLuaTreeNodes;
begin
	CheckArg(L, 1);
	lTreeNodes := TLuaTreeNodes(GetLuaObject(L, 1));
	try
		lTreeNodes.FreeAllNodeData();
	except
		on E: Exception do
			CallError(L, 'TreeNodes', 'FreeAllNodeData', E.ClassName, E.Message);
	end;

	
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
	luaL_check(L,2,@ANode);
	luaL_check(L,3,@AIsSelected);
	try
		lTreeNodes.SelectionsChanged(ANode,AIsSelected);
	except
		on E: Exception do
			CallError(L, 'TreeNodes', 'SelectionsChanged', E.ClassName, E.Message);
	end;

	
	Result := 0;
end;

function VCLua_TreeNodes_SelectOnlyThis(L: Plua_State): Integer; cdecl;
var
	lTreeNodes:TLuaTreeNodes;
	Node:TTreeNode;
begin
	CheckArg(L, 2);
	lTreeNodes := TLuaTreeNodes(GetLuaObject(L, 1));
	luaL_check(L,2,@Node);
	try
		lTreeNodes.SelectOnlyThis(Node);
	except
		on E: Exception do
			CallError(L, 'TreeNodes', 'SelectOnlyThis', E.ClassName, E.Message);
	end;

	
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
	luaL_check(L,2,@Node);
	luaL_check(L,3,@ClearWholeSelection);
	try
		lTreeNodes.MultiSelect(Node,ClearWholeSelection);
	except
		on E: Exception do
			CallError(L, 'TreeNodes', 'MultiSelect', E.ClassName, E.Message);
	end;

	
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
	luaL_check(L,2,@Prefix);
	luaL_check(L,3,@AllNodes);
	try
		lTreeNodes.WriteDebugReport(Prefix,AllNodes);
	except
		on E: Exception do
			CallError(L, 'TreeNodes', 'WriteDebugReport', E.ClassName, E.Message);
	end;

	
	Result := 0;
end;

function VCLua_TreeView_AlphaSort(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	try
		ret := lTreeView.AlphaSort();
	except
		on E: Exception do
			CallError(L, 'TreeView', 'AlphaSort', E.ClassName, E.Message);
	end;

	lua_push(L,ret);
	
	Result := 1;
end;

function VCLua_TreeView_ClearSelection(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	KeepPrimary:Boolean;
begin
	CheckArg(L, 1, 2);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	TTrait<Boolean>.luaL_optcheck(L, 2, @KeepPrimary, false);
	try
		lTreeView.ClearSelection(KeepPrimary);
	except
		on E: Exception do
			CallError(L, 'TreeView', 'ClearSelection', E.ClassName, E.Message);
	end;

	
	Result := 0;
end;

function VCLua_TreeView_ConsistencyCheck(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
begin
	CheckArg(L, 1);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	try
		lTreeView.ConsistencyCheck();
	except
		on E: Exception do
			CallError(L, 'TreeView', 'ConsistencyCheck', E.ClassName, E.Message);
	end;

	
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
	luaL_check(L,2,@Node1);
	luaL_check(L,3,@Node2);
	try
		ret := lTreeView.DefaultTreeViewSort(Node1,Node2);
	except
		on E: Exception do
			CallError(L, 'TreeView', 'DefaultTreeViewSort', E.ClassName, E.Message);
	end;

	lua_push(L,ret);
	
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
	luaL_check(L,2,@X);
	luaL_check(L,3,@Y);
	try
		ret := lTreeView.GetNodeAt(X,Y);
	except
		on E: Exception do
			CallError(L, 'TreeView', 'GetNodeAt', E.ClassName, E.Message);
	end;

	lua_push(L,ret);
	
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
	luaL_check(L,2,@X);
	luaL_check(L,3,@Y);
	try
		ret := lTreeView.GetNodeWithExpandSignAt(X,Y);
	except
		on E: Exception do
			CallError(L, 'TreeView', 'GetNodeWithExpandSignAt', E.ClassName, E.Message);
	end;

	lua_push(L,ret);
	
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
	luaL_check(L,2,@X);
	luaL_check(L,3,@Y);
	try
		lTreeView.GetInsertMarkAt(X,Y,AnInsertMarkNode,AnInsertMarkType);
	except
		on E: Exception do
			CallError(L, 'TreeView', 'GetInsertMarkAt', E.ClassName, E.Message);
	end;

	lua_push(L,AnInsertMarkNode);
	lua_push(L,AnInsertMarkType,TypeInfo(AnInsertMarkType));
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
	luaL_check(L,2,@AnInsertMarkNode);
	luaL_check(L,3,@AnInsertMarkType,TypeInfo(TTreeViewInsertMarkType));
	try
		lTreeView.SetInsertMark(AnInsertMarkNode,AnInsertMarkType);
	except
		on E: Exception do
			CallError(L, 'TreeView', 'SetInsertMark', E.ClassName, E.Message);
	end;

	
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
	luaL_check(L,2,@X);
	luaL_check(L,3,@Y);
	try
		lTreeView.SetInsertMarkAt(X,Y);
	except
		on E: Exception do
			CallError(L, 'TreeView', 'SetInsertMarkAt', E.ClassName, E.Message);
	end;

	
	Result := 0;
end;

function VCLua_TreeView_Invalidate(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
begin
	CheckArg(L, 1);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	try
		lTreeView.Invalidate();
	except
		on E: Exception do
			CallError(L, 'TreeView', 'Invalidate', E.ClassName, E.Message);
	end;

	
	Result := 0;
end;

function VCLua_TreeView_IsEditing(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	try
		ret := lTreeView.IsEditing();
	except
		on E: Exception do
			CallError(L, 'TreeView', 'IsEditing', E.ClassName, E.Message);
	end;

	lua_push(L,ret);
	
	Result := 1;
end;

function VCLua_TreeView_BeginUpdate(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
begin
	CheckArg(L, 1);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	try
		lTreeView.BeginUpdate();
	except
		on E: Exception do
			CallError(L, 'TreeView', 'BeginUpdate', E.ClassName, E.Message);
	end;

	
	Result := 0;
end;

function VCLua_TreeView_EndUpdate(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
begin
	CheckArg(L, 1);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	try
		lTreeView.EndUpdate();
	except
		on E: Exception do
			CallError(L, 'TreeView', 'EndUpdate', E.ClassName, E.Message);
	end;

	
	Result := 0;
end;

function VCLua_TreeView_FullCollapse(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
begin
	CheckArg(L, 1);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	try
		lTreeView.FullCollapse();
	except
		on E: Exception do
			CallError(L, 'TreeView', 'FullCollapse', E.ClassName, E.Message);
	end;

	
	Result := 0;
end;

function VCLua_TreeView_FullExpand(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
begin
	CheckArg(L, 1);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	try
		lTreeView.FullExpand();
	except
		on E: Exception do
			CallError(L, 'TreeView', 'FullExpand', E.ClassName, E.Message);
	end;

	
	Result := 0;
end;

function VCLua_TreeView_LoadFromFile(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	FileName:string;
begin
	CheckArg(L, 2);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	luaL_check(L,2,@FileName);
	try
		lTreeView.LoadFromFile(FileName);
	except
		on E: Exception do
			CallError(L, 'TreeView', 'LoadFromFile', E.ClassName, E.Message);
	end;

	
	Result := 0;
end;

function VCLua_TreeView_LoadFromStream(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	Stream:TStream;
begin
	CheckArg(L, 2);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	luaL_check(L,2,@Stream);
	try
		lTreeView.LoadFromStream(Stream);
	except
		on E: Exception do
			CallError(L, 'TreeView', 'LoadFromStream', E.ClassName, E.Message);
	end;

	
	Result := 0;
end;

function VCLua_TreeView_SaveToFile(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	FileName:string;
begin
	CheckArg(L, 2);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	luaL_check(L,2,@FileName);
	try
		lTreeView.SaveToFile(FileName);
	except
		on E: Exception do
			CallError(L, 'TreeView', 'SaveToFile', E.ClassName, E.Message);
	end;

	
	Result := 0;
end;

function VCLua_TreeView_SaveToStream(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	Stream:TStream;
begin
	CheckArg(L, 2);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	luaL_check(L,2,@Stream);
	try
		lTreeView.SaveToStream(Stream);
	except
		on E: Exception do
			CallError(L, 'TreeView', 'SaveToStream', E.ClassName, E.Message);
	end;

	
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
	luaL_check(L,2,@Prefix);
	luaL_check(L,3,@AllNodes);
	try
		lTreeView.WriteDebugReport(Prefix,AllNodes);
	except
		on E: Exception do
			CallError(L, 'TreeView', 'WriteDebugReport', E.ClassName, E.Message);
	end;

	
	Result := 0;
end;

function VCLua_TreeView_LockSelectionChangeEvent(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
begin
	CheckArg(L, 1);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	try
		lTreeView.LockSelectionChangeEvent();
	except
		on E: Exception do
			CallError(L, 'TreeView', 'LockSelectionChangeEvent', E.ClassName, E.Message);
	end;

	
	Result := 0;
end;

function VCLua_TreeView_UnlockSelectionChangeEvent(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
begin
	CheckArg(L, 1);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	try
		lTreeView.UnlockSelectionChangeEvent();
	except
		on E: Exception do
			CallError(L, 'TreeView', 'UnlockSelectionChangeEvent', E.ClassName, E.Message);
	end;

	
	Result := 0;
end;

function VCLua_TreeView_GetFirstMultiSelected(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	ret:TTreeNode;
begin
	CheckArg(L, 1);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	try
		ret := lTreeView.GetFirstMultiSelected();
	except
		on E: Exception do
			CallError(L, 'TreeView', 'GetFirstMultiSelected', E.ClassName, E.Message);
	end;

	lua_push(L,ret);
	
	Result := 1;
end;

function VCLua_TreeView_GetLastMultiSelected(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	ret:TTreeNode;
begin
	CheckArg(L, 1);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	try
		ret := lTreeView.GetLastMultiSelected();
	except
		on E: Exception do
			CallError(L, 'TreeView', 'GetLastMultiSelected', E.ClassName, E.Message);
	end;

	lua_push(L,ret);
	
	Result := 1;
end;

function VCLua_TreeView_Select(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	Node:TTreeNode;
	ShiftState:TShiftState;
begin
	CheckArg(L, 2, 3);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	luaL_check(L,2,@Node);
	TTraitPti<TShiftState>.luaL_optcheck(L, 3, @ShiftState, [], TypeInfo(TShiftState));
	try
		lTreeView.Select(Node,ShiftState);
	except
		on E: Exception do
			CallError(L, 'TreeView', 'Select', E.ClassName, E.Message);
	end;

	
	Result := 0;
end;

function VCLua_TreeView_Select2(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	Nodes:array of TTreeNode;
begin
	CheckArg(L, 2);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	TTrait<TTreeNode>.luaL_checkArray(L, 2, @Nodes);
	try
		lTreeView.Select(Nodes);
	except
		on E: Exception do
			CallError(L, 'TreeView', 'Select', E.ClassName, E.Message);
	end;

	
	Result := 0;
end;

function VCLua_TreeView_Select3(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	Nodes:TList;
begin
	CheckArg(L, 2);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	luaL_check(L,2,@Nodes);
	try
		lTreeView.Select(Nodes);
	except
		on E: Exception do
			CallError(L, 'TreeView', 'Select', E.ClassName, E.Message);
	end;

	
	Result := 0;
end;

function VCLua_TreeView_SelectionVisible(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	ret:boolean;
begin
	CheckArg(L, 1);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	try
		ret := lTreeView.SelectionVisible();
	except
		on E: Exception do
			CallError(L, 'TreeView', 'SelectionVisible', E.ClassName, E.Message);
	end;

	lua_push(L,ret);
	
	Result := 1;
end;

function VCLua_TreeView_MakeSelectionVisible(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
begin
	CheckArg(L, 1);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	try
		lTreeView.MakeSelectionVisible();
	except
		on E: Exception do
			CallError(L, 'TreeView', 'MakeSelectionVisible', E.ClassName, E.Message);
	end;

	
	Result := 0;
end;

function VCLua_TreeView_ClearInvisibleSelection(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
begin
	CheckArg(L, 1);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	try
		lTreeView.ClearInvisibleSelection();
	except
		on E: Exception do
			CallError(L, 'TreeView', 'ClearInvisibleSelection', E.ClassName, E.Message);
	end;

	
	Result := 0;
end;

function VCLua_TreeView_StoreCurrentSelection(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	ret:TStringList;
begin
	CheckArg(L, 1);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	try
		ret := lTreeView.StoreCurrentSelection();
	except
		on E: Exception do
			CallError(L, 'TreeView', 'StoreCurrentSelection', E.ClassName, E.Message);
	end;

	lua_push(L,ret);
	
	Result := 1;
end;

function VCLua_TreeView_ApplyStoredSelection(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	ASelection:TStringList;
	FreeList:boolean;
begin
	CheckArg(L, 2, 3);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	luaL_check(L,2,@ASelection);
	TTrait<boolean>.luaL_optcheck(L, 3, @FreeList, True);
	try
		lTreeView.ApplyStoredSelection(ASelection,FreeList);
	except
		on E: Exception do
			CallError(L, 'TreeView', 'ApplyStoredSelection', E.ClassName, E.Message);
	end;

	
	Result := 0;
end;

function VCLua_TreeView_MoveToNextNode(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	ASelect:Boolean;
begin
	CheckArg(L, 1, 2);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	TTrait<Boolean>.luaL_optcheck(L, 2, @ASelect, False);
	try
		lTreeView.MoveToNextNode(ASelect);
	except
		on E: Exception do
			CallError(L, 'TreeView', 'MoveToNextNode', E.ClassName, E.Message);
	end;

	
	Result := 0;
end;

function VCLua_TreeView_MoveToPrevNode(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	ASelect:Boolean;
begin
	CheckArg(L, 1, 2);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	TTrait<Boolean>.luaL_optcheck(L, 2, @ASelect, False);
	try
		lTreeView.MoveToPrevNode(ASelect);
	except
		on E: Exception do
			CallError(L, 'TreeView', 'MoveToPrevNode', E.ClassName, E.Message);
	end;

	
	Result := 0;
end;

function VCLua_TreeView_MovePageDown(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	ASelect:Boolean;
begin
	CheckArg(L, 1, 2);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	TTrait<Boolean>.luaL_optcheck(L, 2, @ASelect, False);
	try
		lTreeView.MovePageDown(ASelect);
	except
		on E: Exception do
			CallError(L, 'TreeView', 'MovePageDown', E.ClassName, E.Message);
	end;

	
	Result := 0;
end;

function VCLua_TreeView_MovePageUp(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	ASelect:Boolean;
begin
	CheckArg(L, 1, 2);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	TTrait<Boolean>.luaL_optcheck(L, 2, @ASelect, False);
	try
		lTreeView.MovePageUp(ASelect);
	except
		on E: Exception do
			CallError(L, 'TreeView', 'MovePageUp', E.ClassName, E.Message);
	end;

	
	Result := 0;
end;

function VCLua_TreeView_MoveHome(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	ASelect:Boolean;
begin
	CheckArg(L, 1, 2);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	TTrait<Boolean>.luaL_optcheck(L, 2, @ASelect, False);
	try
		lTreeView.MoveHome(ASelect);
	except
		on E: Exception do
			CallError(L, 'TreeView', 'MoveHome', E.ClassName, E.Message);
	end;

	
	Result := 0;
end;

function VCLua_TreeView_MoveEnd(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	ASelect:Boolean;
begin
	CheckArg(L, 1, 2);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	TTrait<Boolean>.luaL_optcheck(L, 2, @ASelect, False);
	try
		lTreeView.MoveEnd(ASelect);
	except
		on E: Exception do
			CallError(L, 'TreeView', 'MoveEnd', E.ClassName, E.Message);
	end;

	
	Result := 0;
end;

function IsTreeNode(L: Plua_State): Integer; cdecl;
begin
  CheckArg(L, 1);
  Result := 1;
  lua_push(L, GetLuaObject(L, 1) is TTreeNode);
end;
function AsTreeNode(L: Plua_State): Integer; cdecl;
var o : TObject;
begin
  CheckArg(L, 1);
  Result := 1;
  o := GetLuaObject(L, 1);
  if o is TTreeNode then
    lua_push(L, TTreeNode(o))
  else
    lua_pushnil(L);
end;
procedure lua_push(L: Plua_State; const v: TTreeNode; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TTreeNode',v);
end;

function IsTreeNodes(L: Plua_State): Integer; cdecl;
begin
  CheckArg(L, 1);
  Result := 1;
  lua_push(L, GetLuaObject(L, 1) is TTreeNodes);
end;
function AsTreeNodes(L: Plua_State): Integer; cdecl;
var o : TObject;
begin
  CheckArg(L, 1);
  Result := 1;
  o := GetLuaObject(L, 1);
  if o is TTreeNodes then
    lua_push(L, TTreeNodes(o))
  else
    lua_pushnil(L);
end;
procedure lua_push(L: Plua_State; const v: TTreeNodes; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TTreeNodes',v);
end;

function IsTreeView(L: Plua_State): Integer; cdecl;
begin
  CheckArg(L, 1);
  Result := 1;
  lua_push(L, GetLuaObject(L, 1) is TTreeView);
end;
function AsTreeView(L: Plua_State): Integer; cdecl;
var o : TObject;
begin
  CheckArg(L, 1);
  Result := 1;
  o := GetLuaObject(L, 1);
  if o is TTreeView then
    lua_push(L, TTreeView(o))
  else
    lua_pushnil(L);
end;
procedure lua_push(L: Plua_State; const v: TTreeView; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TCustomTreeView',v);
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
	lTreeView.LuaCtl := TVCLuaControl.Create(lTreeView as TComponent,L,nil,'TCustomTreeView');
	InitControl(L,lTreeView,Name);
	CreateTableForKnownType(L,'TCustomTreeView',lTreeView);
	Result := 1;
end;

begin
	SetLength(TreeNodeFuncs, 0+1);
	
	TreeNodeFuncs[0].name:=nil;
	TreeNodeFuncs[0].func:=nil;

	SetLength(TreeNodesFuncs, 34+1);
	TreeNodesFuncs[0].name:='Add';
	TreeNodesFuncs[0].func:=@VCLua_TreeNodes_Add;
	TreeNodesFuncs[1].name:='AddChild';
	TreeNodesFuncs[1].func:=@VCLua_TreeNodes_AddChild;
	TreeNodesFuncs[2].name:='AddChildFirst';
	TreeNodesFuncs[2].func:=@VCLua_TreeNodes_AddChildFirst;
	TreeNodesFuncs[3].name:='AddChildObject';
	TreeNodesFuncs[3].func:=@VCLua_TreeNodes_AddChildObject;
	TreeNodesFuncs[4].name:='AddChildObjectFirst';
	TreeNodesFuncs[4].func:=@VCLua_TreeNodes_AddChildObjectFirst;
	TreeNodesFuncs[5].name:='AddFirst';
	TreeNodesFuncs[5].func:=@VCLua_TreeNodes_AddFirst;
	TreeNodesFuncs[6].name:='AddNode';
	TreeNodesFuncs[6].func:=@VCLua_TreeNodes_AddNode;
	TreeNodesFuncs[7].name:='AddObject';
	TreeNodesFuncs[7].func:=@VCLua_TreeNodes_AddObject;
	TreeNodesFuncs[8].name:='AddObjectFirst';
	TreeNodesFuncs[8].func:=@VCLua_TreeNodes_AddObjectFirst;
	TreeNodesFuncs[9].name:='FindNodeWithData';
	TreeNodesFuncs[9].func:=@VCLua_TreeNodes_FindNodeWithData;
	TreeNodesFuncs[10].name:='FindNodeWithText';
	TreeNodesFuncs[10].func:=@VCLua_TreeNodes_FindNodeWithText;
	TreeNodesFuncs[11].name:='FindNodeWithTextPath';
	TreeNodesFuncs[11].func:=@VCLua_TreeNodes_FindNodeWithTextPath;
	TreeNodesFuncs[12].name:='FindTopLvlNode';
	TreeNodesFuncs[12].func:=@VCLua_TreeNodes_FindTopLvlNode;
	TreeNodesFuncs[13].name:='GetFirstNode';
	TreeNodesFuncs[13].func:=@VCLua_TreeNodes_GetFirstNode;
	TreeNodesFuncs[14].name:='GetFirstVisibleNode';
	TreeNodesFuncs[14].func:=@VCLua_TreeNodes_GetFirstVisibleNode;
	TreeNodesFuncs[15].name:='GetLastVisibleNode';
	TreeNodesFuncs[15].func:=@VCLua_TreeNodes_GetLastVisibleNode;
	TreeNodesFuncs[16].name:='GetSelections';
	TreeNodesFuncs[16].func:=@VCLua_TreeNodes_GetSelections;
	TreeNodesFuncs[17].name:='Insert';
	TreeNodesFuncs[17].func:=@VCLua_TreeNodes_Insert;
	TreeNodesFuncs[18].name:='InsertBehind';
	TreeNodesFuncs[18].func:=@VCLua_TreeNodes_InsertBehind;
	TreeNodesFuncs[19].name:='InsertObject';
	TreeNodesFuncs[19].func:=@VCLua_TreeNodes_InsertObject;
	TreeNodesFuncs[20].name:='InsertObjectBehind';
	TreeNodesFuncs[20].func:=@VCLua_TreeNodes_InsertObjectBehind;
	TreeNodesFuncs[21].name:='IsMultiSelection';
	TreeNodesFuncs[21].func:=@VCLua_TreeNodes_IsMultiSelection;
	TreeNodesFuncs[22].name:='Assign';
	TreeNodesFuncs[22].func:=@VCLua_TreeNodes_Assign;
	TreeNodesFuncs[23].name:='BeginUpdate';
	TreeNodesFuncs[23].func:=@VCLua_TreeNodes_BeginUpdate;
	TreeNodesFuncs[24].name:='Clear';
	TreeNodesFuncs[24].func:=@VCLua_TreeNodes_Clear;
	TreeNodesFuncs[25].name:='ClearMultiSelection';
	TreeNodesFuncs[25].func:=@VCLua_TreeNodes_ClearMultiSelection;
	TreeNodesFuncs[26].name:='ConsistencyCheck';
	TreeNodesFuncs[26].func:=@VCLua_TreeNodes_ConsistencyCheck;
	TreeNodesFuncs[27].name:='Delete';
	TreeNodesFuncs[27].func:=@VCLua_TreeNodes_Delete;
	TreeNodesFuncs[28].name:='EndUpdate';
	TreeNodesFuncs[28].func:=@VCLua_TreeNodes_EndUpdate;
	TreeNodesFuncs[29].name:='FreeAllNodeData';
	TreeNodesFuncs[29].func:=@VCLua_TreeNodes_FreeAllNodeData;
	TreeNodesFuncs[30].name:='SelectionsChanged';
	TreeNodesFuncs[30].func:=@VCLua_TreeNodes_SelectionsChanged;
	TreeNodesFuncs[31].name:='SelectOnlyThis';
	TreeNodesFuncs[31].func:=@VCLua_TreeNodes_SelectOnlyThis;
	TreeNodesFuncs[32].name:='MultiSelect';
	TreeNodesFuncs[32].func:=@VCLua_TreeNodes_MultiSelect;
	TreeNodesFuncs[33].name:='WriteDebugReport';
	TreeNodesFuncs[33].func:=@VCLua_TreeNodes_WriteDebugReport;
	TreeNodesFuncs[34].name:=nil;
	TreeNodesFuncs[34].func:=nil;

	SetLength(CustomTreeViewFuncs, 38+1);
	CustomTreeViewFuncs[0].name:='AlphaSort';
	CustomTreeViewFuncs[0].func:=@VCLua_TreeView_AlphaSort;
	CustomTreeViewFuncs[1].name:='ClearSelection';
	CustomTreeViewFuncs[1].func:=@VCLua_TreeView_ClearSelection;
	CustomTreeViewFuncs[2].name:='ConsistencyCheck';
	CustomTreeViewFuncs[2].func:=@VCLua_TreeView_ConsistencyCheck;
	CustomTreeViewFuncs[3].name:='DefaultTreeViewSort';
	CustomTreeViewFuncs[3].func:=@VCLua_TreeView_DefaultTreeViewSort;
	CustomTreeViewFuncs[4].name:='GetNodeAt';
	CustomTreeViewFuncs[4].func:=@VCLua_TreeView_GetNodeAt;
	CustomTreeViewFuncs[5].name:='GetNodeWithExpandSignAt';
	CustomTreeViewFuncs[5].func:=@VCLua_TreeView_GetNodeWithExpandSignAt;
	CustomTreeViewFuncs[6].name:='GetInsertMarkAt';
	CustomTreeViewFuncs[6].func:=@VCLua_TreeView_GetInsertMarkAt;
	CustomTreeViewFuncs[7].name:='SetInsertMark';
	CustomTreeViewFuncs[7].func:=@VCLua_TreeView_SetInsertMark;
	CustomTreeViewFuncs[8].name:='SetInsertMarkAt';
	CustomTreeViewFuncs[8].func:=@VCLua_TreeView_SetInsertMarkAt;
	CustomTreeViewFuncs[9].name:='Invalidate';
	CustomTreeViewFuncs[9].func:=@VCLua_TreeView_Invalidate;
	CustomTreeViewFuncs[10].name:='IsEditing';
	CustomTreeViewFuncs[10].func:=@VCLua_TreeView_IsEditing;
	CustomTreeViewFuncs[11].name:='BeginUpdate';
	CustomTreeViewFuncs[11].func:=@VCLua_TreeView_BeginUpdate;
	CustomTreeViewFuncs[12].name:='EndUpdate';
	CustomTreeViewFuncs[12].func:=@VCLua_TreeView_EndUpdate;
	CustomTreeViewFuncs[13].name:='FullCollapse';
	CustomTreeViewFuncs[13].func:=@VCLua_TreeView_FullCollapse;
	CustomTreeViewFuncs[14].name:='FullExpand';
	CustomTreeViewFuncs[14].func:=@VCLua_TreeView_FullExpand;
	CustomTreeViewFuncs[15].name:='LoadFromFile';
	CustomTreeViewFuncs[15].func:=@VCLua_TreeView_LoadFromFile;
	CustomTreeViewFuncs[16].name:='LoadFromStream';
	CustomTreeViewFuncs[16].func:=@VCLua_TreeView_LoadFromStream;
	CustomTreeViewFuncs[17].name:='SaveToFile';
	CustomTreeViewFuncs[17].func:=@VCLua_TreeView_SaveToFile;
	CustomTreeViewFuncs[18].name:='SaveToStream';
	CustomTreeViewFuncs[18].func:=@VCLua_TreeView_SaveToStream;
	CustomTreeViewFuncs[19].name:='WriteDebugReport';
	CustomTreeViewFuncs[19].func:=@VCLua_TreeView_WriteDebugReport;
	CustomTreeViewFuncs[20].name:='LockSelectionChangeEvent';
	CustomTreeViewFuncs[20].func:=@VCLua_TreeView_LockSelectionChangeEvent;
	CustomTreeViewFuncs[21].name:='UnlockSelectionChangeEvent';
	CustomTreeViewFuncs[21].func:=@VCLua_TreeView_UnlockSelectionChangeEvent;
	CustomTreeViewFuncs[22].name:='GetFirstMultiSelected';
	CustomTreeViewFuncs[22].func:=@VCLua_TreeView_GetFirstMultiSelected;
	CustomTreeViewFuncs[23].name:='GetLastMultiSelected';
	CustomTreeViewFuncs[23].func:=@VCLua_TreeView_GetLastMultiSelected;
	CustomTreeViewFuncs[24].name:='Select';
	CustomTreeViewFuncs[24].func:=@VCLua_TreeView_Select;
	CustomTreeViewFuncs[25].name:='Select2';
	CustomTreeViewFuncs[25].func:=@VCLua_TreeView_Select2;
	CustomTreeViewFuncs[26].name:='Select3';
	CustomTreeViewFuncs[26].func:=@VCLua_TreeView_Select3;
	CustomTreeViewFuncs[27].name:='SelectionVisible';
	CustomTreeViewFuncs[27].func:=@VCLua_TreeView_SelectionVisible;
	CustomTreeViewFuncs[28].name:='MakeSelectionVisible';
	CustomTreeViewFuncs[28].func:=@VCLua_TreeView_MakeSelectionVisible;
	CustomTreeViewFuncs[29].name:='ClearInvisibleSelection';
	CustomTreeViewFuncs[29].func:=@VCLua_TreeView_ClearInvisibleSelection;
	CustomTreeViewFuncs[30].name:='StoreCurrentSelection';
	CustomTreeViewFuncs[30].func:=@VCLua_TreeView_StoreCurrentSelection;
	CustomTreeViewFuncs[31].name:='ApplyStoredSelection';
	CustomTreeViewFuncs[31].func:=@VCLua_TreeView_ApplyStoredSelection;
	CustomTreeViewFuncs[32].name:='MoveToNextNode';
	CustomTreeViewFuncs[32].func:=@VCLua_TreeView_MoveToNextNode;
	CustomTreeViewFuncs[33].name:='MoveToPrevNode';
	CustomTreeViewFuncs[33].func:=@VCLua_TreeView_MoveToPrevNode;
	CustomTreeViewFuncs[34].name:='MovePageDown';
	CustomTreeViewFuncs[34].func:=@VCLua_TreeView_MovePageDown;
	CustomTreeViewFuncs[35].name:='MovePageUp';
	CustomTreeViewFuncs[35].func:=@VCLua_TreeView_MovePageUp;
	CustomTreeViewFuncs[36].name:='MoveHome';
	CustomTreeViewFuncs[36].func:=@VCLua_TreeView_MoveHome;
	CustomTreeViewFuncs[37].name:='MoveEnd';
	CustomTreeViewFuncs[37].func:=@VCLua_TreeView_MoveEnd;
	CustomTreeViewFuncs[38].name:=nil;
	CustomTreeViewFuncs[38].func:=nil;

end.
