(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaTreeView;	

{$MODE Delphi}{$T+}

interface

Uses Classes, Lua, LuaController, ComCtrls, TypInfo, LuaVmt;

function IsTreeNode(L: Plua_State): Integer; cdecl;
function AsTreeNode(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TTreeNode; pti: PTypeInfo = nil); overload; inline;

type
    TLuaTreeNode = class(TTreeNode)
    public
      L:Plua_State;
    end;
var
    TreeNodeFuncs: TLuaVmt;

function IsTreeNodes(L: Plua_State): Integer; cdecl;
function AsTreeNodes(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TTreeNodes; pti: PTypeInfo = nil); overload; inline;

type
    TLuaTreeNodes = class(TTreeNodes)
    public
      L:Plua_State;
    end;
var
    TreeNodesFuncs: TLuaVmt;

function CreateTreeView(L: Plua_State): Integer; cdecl;
function IsTreeView(L: Plua_State): Integer; cdecl;
function AsTreeView(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TTreeView; pti: PTypeInfo = nil); overload; inline;

type
    TLuaTreeView = class(TTreeView)
        LuaCtl: TVCLuaControl;
    end;
var
    CustomTreeViewFuncs: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Controls, LuaStringList;

function VCLua_TreeNode_Items(L: Plua_State): Integer; cdecl;
var
	lTreeNode:TLuaTreeNode;
	ItemIndex:Integer;
	ret:TTreeNode;
begin
	CheckArg(L, 2, 3);
	lTreeNode := TLuaTreeNode(GetLuaObject(L, 1));
	luaL_check(L,2,@ItemIndex);
	try
		if lua_isnone(L, 3) then begin
			ret := lTreeNode.Items[ItemIndex];
			lua_push(L,ret);
			Result := 1;
		end else begin
			luaL_check(L,3,@ret);
			lTreeNode.Items[ItemIndex] := ret;
			Result := 0;
		end;
	except
		on E: Exception do
			CallError(L, 'TreeNode', 'Items', E.ClassName, E.Message);
	end;
end;

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
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeNodes', 'Add', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeNodes', 'AddChild', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeNodes', 'AddChildFirst', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeNodes', 'AddChildObject', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeNodes', 'AddChildObjectFirst', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeNodes', 'AddFirst', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeNodes', 'AddNode', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeNodes', 'AddObject', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeNodes', 'AddObjectFirst', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeNodes', 'FindNodeWithData', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeNodes', 'FindNodeWithText', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeNodes', 'FindNodeWithTextPath', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeNodes', 'FindTopLvlNode', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeNodes', 'GetFirstNode', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeNodes', 'GetFirstVisibleNode', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeNodes', 'GetLastVisibleNode', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeNodes', 'GetSelections', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeNodes', 'Insert', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeNodes', 'InsertBehind', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeNodes', 'InsertObject', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeNodes', 'InsertObjectBehind', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeNodes', 'IsMultiSelection', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeNodes', 'Assign', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeNodes_BeginUpdate(L: Plua_State): Integer; cdecl;
var
	lTreeNodes:TLuaTreeNodes;
begin
	CheckArg(L, 1);
	lTreeNodes := TLuaTreeNodes(GetLuaObject(L, 1));
	try
		lTreeNodes.BeginUpdate();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeNodes', 'BeginUpdate', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeNodes_Clear(L: Plua_State): Integer; cdecl;
var
	lTreeNodes:TLuaTreeNodes;
begin
	CheckArg(L, 1);
	lTreeNodes := TLuaTreeNodes(GetLuaObject(L, 1));
	try
		lTreeNodes.Clear();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeNodes', 'Clear', E.ClassName, E.Message);
	end;
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
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeNodes', 'ClearMultiSelection', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeNodes_ConsistencyCheck(L: Plua_State): Integer; cdecl;
var
	lTreeNodes:TLuaTreeNodes;
begin
	CheckArg(L, 1);
	lTreeNodes := TLuaTreeNodes(GetLuaObject(L, 1));
	try
		lTreeNodes.ConsistencyCheck();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeNodes', 'ConsistencyCheck', E.ClassName, E.Message);
	end;
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
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeNodes', 'Delete', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeNodes_EndUpdate(L: Plua_State): Integer; cdecl;
var
	lTreeNodes:TLuaTreeNodes;
begin
	CheckArg(L, 1);
	lTreeNodes := TLuaTreeNodes(GetLuaObject(L, 1));
	try
		lTreeNodes.EndUpdate();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeNodes', 'EndUpdate', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeNodes_FreeAllNodeData(L: Plua_State): Integer; cdecl;
var
	lTreeNodes:TLuaTreeNodes;
begin
	CheckArg(L, 1);
	lTreeNodes := TLuaTreeNodes(GetLuaObject(L, 1));
	try
		lTreeNodes.FreeAllNodeData();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeNodes', 'FreeAllNodeData', E.ClassName, E.Message);
	end;
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
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeNodes', 'SelectionsChanged', E.ClassName, E.Message);
	end;
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
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeNodes', 'SelectOnlyThis', E.ClassName, E.Message);
	end;
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
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeNodes', 'MultiSelect', E.ClassName, E.Message);
	end;
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
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeNodes', 'WriteDebugReport', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeNodes_Item(L: Plua_State): Integer; cdecl;
var
	lTreeNodes:TLuaTreeNodes;
	Index:Integer;
	ret:TTreeNode;
begin
	CheckArg(L, 2);
	lTreeNodes := TLuaTreeNodes(GetLuaObject(L, 1));
	luaL_check(L,2,@Index);
	try
		ret := lTreeNodes.Item[Index];
		lua_push(L,ret);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeNodes', 'Item', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeNodes_TopLvlItems(L: Plua_State): Integer; cdecl;
var
	lTreeNodes:TLuaTreeNodes;
	Index:integer;
	ret:TTreeNode;
begin
	CheckArg(L, 2, 3);
	lTreeNodes := TLuaTreeNodes(GetLuaObject(L, 1));
	luaL_check(L,2,@Index);
	try
		if lua_isnone(L, 3) then begin
			ret := lTreeNodes.TopLvlItems[Index];
			lua_push(L,ret);
			Result := 1;
		end else begin
			luaL_check(L,3,@ret);
			lTreeNodes.TopLvlItems[Index] := ret;
			Result := 0;
		end;
	except
		on E: Exception do
			CallError(L, 'TreeNodes', 'TopLvlItems', E.ClassName, E.Message);
	end;
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
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'AlphaSort', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'ClearSelection', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeView_ConsistencyCheck(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
begin
	CheckArg(L, 1);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	try
		lTreeView.ConsistencyCheck();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'ConsistencyCheck', E.ClassName, E.Message);
	end;
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
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'DefaultTreeViewSort', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'GetNodeAt', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'GetNodeWithExpandSignAt', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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
		Result := 2;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'GetInsertMarkAt', E.ClassName, E.Message);
	end;
	lua_push(L,AnInsertMarkNode);
	lua_push(L,AnInsertMarkType,TypeInfo(AnInsertMarkType));
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
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'SetInsertMark', E.ClassName, E.Message);
	end;
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
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'SetInsertMarkAt', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeView_Invalidate(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
begin
	CheckArg(L, 1);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	try
		lTreeView.Invalidate();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'Invalidate', E.ClassName, E.Message);
	end;
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
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'IsEditing', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeView_BeginUpdate(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
begin
	CheckArg(L, 1);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	try
		lTreeView.BeginUpdate();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'BeginUpdate', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeView_EndUpdate(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
begin
	CheckArg(L, 1);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	try
		lTreeView.EndUpdate();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'EndUpdate', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeView_FullCollapse(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
begin
	CheckArg(L, 1);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	try
		lTreeView.FullCollapse();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'FullCollapse', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeView_FullExpand(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
begin
	CheckArg(L, 1);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	try
		lTreeView.FullExpand();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'FullExpand', E.ClassName, E.Message);
	end;
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
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'LoadFromFile', E.ClassName, E.Message);
	end;
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
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'LoadFromStream', E.ClassName, E.Message);
	end;
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
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'SaveToFile', E.ClassName, E.Message);
	end;
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
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'SaveToStream', E.ClassName, E.Message);
	end;
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
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'WriteDebugReport', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeView_LockSelectionChangeEvent(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
begin
	CheckArg(L, 1);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	try
		lTreeView.LockSelectionChangeEvent();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'LockSelectionChangeEvent', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeView_UnlockSelectionChangeEvent(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
begin
	CheckArg(L, 1);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	try
		lTreeView.UnlockSelectionChangeEvent();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'UnlockSelectionChangeEvent', E.ClassName, E.Message);
	end;
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
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'GetFirstMultiSelected', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'GetLastMultiSelected', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'Select', E.ClassName, E.Message);
	end;
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
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'Select', E.ClassName, E.Message);
	end;
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
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'Select', E.ClassName, E.Message);
	end;
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
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'SelectionVisible', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeView_MakeSelectionVisible(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
begin
	CheckArg(L, 1);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	try
		lTreeView.MakeSelectionVisible();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'MakeSelectionVisible', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeView_ClearInvisibleSelection(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
begin
	CheckArg(L, 1);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	try
		lTreeView.ClearInvisibleSelection();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'ClearInvisibleSelection', E.ClassName, E.Message);
	end;
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
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'StoreCurrentSelection', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'ApplyStoredSelection', E.ClassName, E.Message);
	end;
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
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'MoveToNextNode', E.ClassName, E.Message);
	end;
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
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'MoveToPrevNode', E.ClassName, E.Message);
	end;
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
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'MovePageDown', E.ClassName, E.Message);
	end;
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
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'MovePageUp', E.ClassName, E.Message);
	end;
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
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'MoveHome', E.ClassName, E.Message);
	end;
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
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'MoveEnd', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeView_Selections(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	AIndex:Integer;
	ret:TTreeNode;
begin
	CheckArg(L, 2);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	luaL_check(L,2,@AIndex);
	try
		ret := lTreeView.Selections[AIndex];
		lua_push(L,ret);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'Selections', E.ClassName, E.Message);
	end;
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
	TreeNodeFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(TreeNodeFuncs, 'Items', @VCLua_TreeNode_Items);
	TreeNodesFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(TreeNodesFuncs, 'Add', @VCLua_TreeNodes_Add);
	TLuaMethodInfo.Create(TreeNodesFuncs, 'AddChild', @VCLua_TreeNodes_AddChild);
	TLuaMethodInfo.Create(TreeNodesFuncs, 'AddChildFirst', @VCLua_TreeNodes_AddChildFirst);
	TLuaMethodInfo.Create(TreeNodesFuncs, 'AddChildObject', @VCLua_TreeNodes_AddChildObject);
	TLuaMethodInfo.Create(TreeNodesFuncs, 'AddChildObjectFirst', @VCLua_TreeNodes_AddChildObjectFirst);
	TLuaMethodInfo.Create(TreeNodesFuncs, 'AddFirst', @VCLua_TreeNodes_AddFirst);
	TLuaMethodInfo.Create(TreeNodesFuncs, 'AddNode', @VCLua_TreeNodes_AddNode);
	TLuaMethodInfo.Create(TreeNodesFuncs, 'AddObject', @VCLua_TreeNodes_AddObject);
	TLuaMethodInfo.Create(TreeNodesFuncs, 'AddObjectFirst', @VCLua_TreeNodes_AddObjectFirst);
	TLuaMethodInfo.Create(TreeNodesFuncs, 'FindNodeWithData', @VCLua_TreeNodes_FindNodeWithData);
	TLuaMethodInfo.Create(TreeNodesFuncs, 'FindNodeWithText', @VCLua_TreeNodes_FindNodeWithText);
	TLuaMethodInfo.Create(TreeNodesFuncs, 'FindNodeWithTextPath', @VCLua_TreeNodes_FindNodeWithTextPath);
	TLuaMethodInfo.Create(TreeNodesFuncs, 'FindTopLvlNode', @VCLua_TreeNodes_FindTopLvlNode);
	TLuaMethodInfo.Create(TreeNodesFuncs, 'GetFirstNode', @VCLua_TreeNodes_GetFirstNode);
	TLuaMethodInfo.Create(TreeNodesFuncs, 'GetFirstVisibleNode', @VCLua_TreeNodes_GetFirstVisibleNode);
	TLuaMethodInfo.Create(TreeNodesFuncs, 'GetLastVisibleNode', @VCLua_TreeNodes_GetLastVisibleNode);
	TLuaMethodInfo.Create(TreeNodesFuncs, 'GetSelections', @VCLua_TreeNodes_GetSelections);
	TLuaMethodInfo.Create(TreeNodesFuncs, 'Insert', @VCLua_TreeNodes_Insert);
	TLuaMethodInfo.Create(TreeNodesFuncs, 'InsertBehind', @VCLua_TreeNodes_InsertBehind);
	TLuaMethodInfo.Create(TreeNodesFuncs, 'InsertObject', @VCLua_TreeNodes_InsertObject);
	TLuaMethodInfo.Create(TreeNodesFuncs, 'InsertObjectBehind', @VCLua_TreeNodes_InsertObjectBehind);
	TLuaMethodInfo.Create(TreeNodesFuncs, 'IsMultiSelection', @VCLua_TreeNodes_IsMultiSelection);
	TLuaMethodInfo.Create(TreeNodesFuncs, 'Assign', @VCLua_TreeNodes_Assign);
	TLuaMethodInfo.Create(TreeNodesFuncs, 'BeginUpdate', @VCLua_TreeNodes_BeginUpdate);
	TLuaMethodInfo.Create(TreeNodesFuncs, 'Clear', @VCLua_TreeNodes_Clear);
	TLuaMethodInfo.Create(TreeNodesFuncs, 'ClearMultiSelection', @VCLua_TreeNodes_ClearMultiSelection);
	TLuaMethodInfo.Create(TreeNodesFuncs, 'ConsistencyCheck', @VCLua_TreeNodes_ConsistencyCheck);
	TLuaMethodInfo.Create(TreeNodesFuncs, 'Delete', @VCLua_TreeNodes_Delete);
	TLuaMethodInfo.Create(TreeNodesFuncs, 'EndUpdate', @VCLua_TreeNodes_EndUpdate);
	TLuaMethodInfo.Create(TreeNodesFuncs, 'FreeAllNodeData', @VCLua_TreeNodes_FreeAllNodeData);
	TLuaMethodInfo.Create(TreeNodesFuncs, 'SelectionsChanged', @VCLua_TreeNodes_SelectionsChanged);
	TLuaMethodInfo.Create(TreeNodesFuncs, 'SelectOnlyThis', @VCLua_TreeNodes_SelectOnlyThis);
	TLuaMethodInfo.Create(TreeNodesFuncs, 'MultiSelect', @VCLua_TreeNodes_MultiSelect);
	TLuaMethodInfo.Create(TreeNodesFuncs, 'WriteDebugReport', @VCLua_TreeNodes_WriteDebugReport);
	TLuaMethodInfo.Create(TreeNodesFuncs, 'Item', @VCLua_TreeNodes_Item);
	TLuaMethodInfo.Create(TreeNodesFuncs, 'TopLvlItems', @VCLua_TreeNodes_TopLvlItems);
	CustomTreeViewFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(CustomTreeViewFuncs, 'AlphaSort', @VCLua_TreeView_AlphaSort);
	TLuaMethodInfo.Create(CustomTreeViewFuncs, 'ClearSelection', @VCLua_TreeView_ClearSelection);
	TLuaMethodInfo.Create(CustomTreeViewFuncs, 'ConsistencyCheck', @VCLua_TreeView_ConsistencyCheck);
	TLuaMethodInfo.Create(CustomTreeViewFuncs, 'DefaultTreeViewSort', @VCLua_TreeView_DefaultTreeViewSort);
	TLuaMethodInfo.Create(CustomTreeViewFuncs, 'GetNodeAt', @VCLua_TreeView_GetNodeAt);
	TLuaMethodInfo.Create(CustomTreeViewFuncs, 'GetNodeWithExpandSignAt', @VCLua_TreeView_GetNodeWithExpandSignAt);
	TLuaMethodInfo.Create(CustomTreeViewFuncs, 'GetInsertMarkAt', @VCLua_TreeView_GetInsertMarkAt);
	TLuaMethodInfo.Create(CustomTreeViewFuncs, 'SetInsertMark', @VCLua_TreeView_SetInsertMark);
	TLuaMethodInfo.Create(CustomTreeViewFuncs, 'SetInsertMarkAt', @VCLua_TreeView_SetInsertMarkAt);
	TLuaMethodInfo.Create(CustomTreeViewFuncs, 'Invalidate', @VCLua_TreeView_Invalidate);
	TLuaMethodInfo.Create(CustomTreeViewFuncs, 'IsEditing', @VCLua_TreeView_IsEditing);
	TLuaMethodInfo.Create(CustomTreeViewFuncs, 'BeginUpdate', @VCLua_TreeView_BeginUpdate);
	TLuaMethodInfo.Create(CustomTreeViewFuncs, 'EndUpdate', @VCLua_TreeView_EndUpdate);
	TLuaMethodInfo.Create(CustomTreeViewFuncs, 'FullCollapse', @VCLua_TreeView_FullCollapse);
	TLuaMethodInfo.Create(CustomTreeViewFuncs, 'FullExpand', @VCLua_TreeView_FullExpand);
	TLuaMethodInfo.Create(CustomTreeViewFuncs, 'LoadFromFile', @VCLua_TreeView_LoadFromFile);
	TLuaMethodInfo.Create(CustomTreeViewFuncs, 'LoadFromStream', @VCLua_TreeView_LoadFromStream);
	TLuaMethodInfo.Create(CustomTreeViewFuncs, 'SaveToFile', @VCLua_TreeView_SaveToFile);
	TLuaMethodInfo.Create(CustomTreeViewFuncs, 'SaveToStream', @VCLua_TreeView_SaveToStream);
	TLuaMethodInfo.Create(CustomTreeViewFuncs, 'WriteDebugReport', @VCLua_TreeView_WriteDebugReport);
	TLuaMethodInfo.Create(CustomTreeViewFuncs, 'LockSelectionChangeEvent', @VCLua_TreeView_LockSelectionChangeEvent);
	TLuaMethodInfo.Create(CustomTreeViewFuncs, 'UnlockSelectionChangeEvent', @VCLua_TreeView_UnlockSelectionChangeEvent);
	TLuaMethodInfo.Create(CustomTreeViewFuncs, 'GetFirstMultiSelected', @VCLua_TreeView_GetFirstMultiSelected);
	TLuaMethodInfo.Create(CustomTreeViewFuncs, 'GetLastMultiSelected', @VCLua_TreeView_GetLastMultiSelected);
	TLuaMethodInfo.Create(CustomTreeViewFuncs, 'Select', @VCLua_TreeView_Select);
	TLuaMethodInfo.Create(CustomTreeViewFuncs, 'Select2', @VCLua_TreeView_Select2);
	TLuaMethodInfo.Create(CustomTreeViewFuncs, 'Select3', @VCLua_TreeView_Select3);
	TLuaMethodInfo.Create(CustomTreeViewFuncs, 'SelectionVisible', @VCLua_TreeView_SelectionVisible);
	TLuaMethodInfo.Create(CustomTreeViewFuncs, 'MakeSelectionVisible', @VCLua_TreeView_MakeSelectionVisible);
	TLuaMethodInfo.Create(CustomTreeViewFuncs, 'ClearInvisibleSelection', @VCLua_TreeView_ClearInvisibleSelection);
	TLuaMethodInfo.Create(CustomTreeViewFuncs, 'StoreCurrentSelection', @VCLua_TreeView_StoreCurrentSelection);
	TLuaMethodInfo.Create(CustomTreeViewFuncs, 'ApplyStoredSelection', @VCLua_TreeView_ApplyStoredSelection);
	TLuaMethodInfo.Create(CustomTreeViewFuncs, 'MoveToNextNode', @VCLua_TreeView_MoveToNextNode);
	TLuaMethodInfo.Create(CustomTreeViewFuncs, 'MoveToPrevNode', @VCLua_TreeView_MoveToPrevNode);
	TLuaMethodInfo.Create(CustomTreeViewFuncs, 'MovePageDown', @VCLua_TreeView_MovePageDown);
	TLuaMethodInfo.Create(CustomTreeViewFuncs, 'MovePageUp', @VCLua_TreeView_MovePageUp);
	TLuaMethodInfo.Create(CustomTreeViewFuncs, 'MoveHome', @VCLua_TreeView_MoveHome);
	TLuaMethodInfo.Create(CustomTreeViewFuncs, 'MoveEnd', @VCLua_TreeView_MoveEnd);
	TLuaMethodInfo.Create(CustomTreeViewFuncs, 'Selections', @VCLua_TreeView_Selections);
end.
