(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaTreeView;	

{$MODE Delphi}{$T+}

interface

Uses Classes, Lua, LuaController, ComCtrls, TypInfo, LuaVmt;

procedure lua_push(L: Plua_State; const v: TTreeNode; pti: PTypeInfo = nil); overload; inline;

type
    TLuaTreeNode = class(TTreeNode)
    public
      L:Plua_State;
    end;
var
    TreeNodeFuncs: TLuaVmt;
    TreeNodeSets: TLuaVmt;

procedure lua_push(L: Plua_State; const v: TTreeNodes; pti: PTypeInfo = nil); overload; inline;

type
    TLuaTreeNodes = class(TTreeNodes)
    public
      L:Plua_State;
    end;
var
    TreeNodesFuncs: TLuaVmt;
    TreeNodesSets: TLuaVmt;

function CreateTreeView(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TTreeView; pti: PTypeInfo = nil); overload; inline;

type
    TLuaTreeView = class(TTreeView)
        LuaCtl: TVCLuaControl;
    end;
var
    CustomTreeViewFuncs: TLuaVmt;
    CustomTreeViewSets: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Controls, Graphics, ImgList, LuaImageList, LuaStringList, StdCtrls;

function VCLua_TreeNode_VCLuaSetData(L: Plua_State): Integer; cdecl;
var
	lTreeNode:TLuaTreeNode;
	val:Pointer;
begin
	CheckArg(L, 2);
	lTreeNode := TLuaTreeNode(GetLuaObject(L, 1));
	val := Pointer(lua_touserdata(L,2));
	try
		lTreeNode.Data := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeNode', 'Data', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeNode_VCLuaGetData(L: Plua_State): Integer; cdecl;
var
	lTreeNode:TLuaTreeNode;
	ret:Pointer;
begin
	CheckArg(L, 1);
	lTreeNode := TLuaTreeNode(GetLuaObject(L, 1));
	try
		ret := lTreeNode.Data;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeNode', 'Data', E.ClassName, E.Message);
	end;
	lua_pushlightuserdata(L,ret);
end;

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

function VCLua_TreeNodes_VCLuaGetTopLvlCount(L: Plua_State): Integer; cdecl;
var
	lTreeNodes:TLuaTreeNodes;
	ret:integer;
begin
	CheckArg(L, 1);
	lTreeNodes := TLuaTreeNodes(GetLuaObject(L, 1));
	try
		ret := lTreeNodes.TopLvlCount;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeNodes', 'TopLvlCount', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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

function VCLua_TreeView_VCLuaSetAccessibilityOn(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	val:Boolean;
begin
	CheckArg(L, 2);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lTreeView.AccessibilityOn := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'AccessibilityOn', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeView_VCLuaGetAccessibilityOn(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	try
		ret := lTreeView.AccessibilityOn;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'AccessibilityOn', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeView_VCLuaSetAutoExpand(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	val:Boolean;
begin
	CheckArg(L, 2);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lTreeView.AutoExpand := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'AutoExpand', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeView_VCLuaGetAutoExpand(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	try
		ret := lTreeView.AutoExpand;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'AutoExpand', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeView_VCLuaSetHideSelection(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	val:Boolean;
begin
	CheckArg(L, 2);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lTreeView.HideSelection := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'HideSelection', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeView_VCLuaGetHideSelection(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	try
		ret := lTreeView.HideSelection;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'HideSelection', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeView_VCLuaSetHotTrack(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	val:Boolean;
begin
	CheckArg(L, 2);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lTreeView.HotTrack := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'HotTrack', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeView_VCLuaGetHotTrack(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	try
		ret := lTreeView.HotTrack;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'HotTrack', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeView_VCLuaSetHotTrackColor(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	val:TColor;
begin
	CheckArg(L, 2);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lTreeView.HotTrackColor := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'HotTrackColor', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeView_VCLuaGetHotTrackColor(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	ret:TColor;
begin
	CheckArg(L, 1);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	try
		ret := lTreeView.HotTrackColor;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'HotTrackColor', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeView_VCLuaSetDisabledFontColor(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	val:TColor;
begin
	CheckArg(L, 2);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lTreeView.DisabledFontColor := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'DisabledFontColor', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeView_VCLuaGetDisabledFontColor(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	ret:TColor;
begin
	CheckArg(L, 1);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	try
		ret := lTreeView.DisabledFontColor;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'DisabledFontColor', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeView_VCLuaSetIndent(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	val:Integer;
begin
	CheckArg(L, 2);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lTreeView.Indent := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'Indent', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeView_VCLuaGetIndent(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	ret:Integer;
begin
	CheckArg(L, 1);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	try
		ret := lTreeView.Indent;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'Indent', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeView_VCLuaSetMultiSelect(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	val:Boolean;
begin
	CheckArg(L, 2);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lTreeView.MultiSelect := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'MultiSelect', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeView_VCLuaGetMultiSelect(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	try
		ret := lTreeView.MultiSelect;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'MultiSelect', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeView_VCLuaSetReadOnly(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	val:Boolean;
begin
	CheckArg(L, 2);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lTreeView.ReadOnly := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'ReadOnly', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeView_VCLuaGetReadOnly(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	try
		ret := lTreeView.ReadOnly;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'ReadOnly', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeView_VCLuaSetRightClickSelect(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	val:Boolean;
begin
	CheckArg(L, 2);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lTreeView.RightClickSelect := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'RightClickSelect', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeView_VCLuaGetRightClickSelect(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	try
		ret := lTreeView.RightClickSelect;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'RightClickSelect', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeView_VCLuaSetRowSelect(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	val:Boolean;
begin
	CheckArg(L, 2);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lTreeView.RowSelect := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'RowSelect', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeView_VCLuaGetRowSelect(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	try
		ret := lTreeView.RowSelect;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'RowSelect', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeView_VCLuaSetScrolledLeft(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	val:integer;
begin
	CheckArg(L, 2);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lTreeView.ScrolledLeft := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'ScrolledLeft', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeView_VCLuaGetScrolledLeft(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	ret:integer;
begin
	CheckArg(L, 1);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	try
		ret := lTreeView.ScrolledLeft;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'ScrolledLeft', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeView_VCLuaSetScrolledTop(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	val:integer;
begin
	CheckArg(L, 2);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lTreeView.ScrolledTop := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'ScrolledTop', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeView_VCLuaGetScrolledTop(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	ret:integer;
begin
	CheckArg(L, 1);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	try
		ret := lTreeView.ScrolledTop;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'ScrolledTop', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeView_VCLuaSetShowButtons(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	val:Boolean;
begin
	CheckArg(L, 2);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lTreeView.ShowButtons := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'ShowButtons', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeView_VCLuaGetShowButtons(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	try
		ret := lTreeView.ShowButtons;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'ShowButtons', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeView_VCLuaSetShowLines(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	val:Boolean;
begin
	CheckArg(L, 2);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lTreeView.ShowLines := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'ShowLines', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeView_VCLuaGetShowLines(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	try
		ret := lTreeView.ShowLines;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'ShowLines', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeView_VCLuaSetShowRoot(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	val:Boolean;
begin
	CheckArg(L, 2);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lTreeView.ShowRoot := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'ShowRoot', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeView_VCLuaGetShowRoot(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	try
		ret := lTreeView.ShowRoot;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'ShowRoot', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeView_VCLuaSetShowSeparators(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	val:Boolean;
begin
	CheckArg(L, 2);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lTreeView.ShowSeparators := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'ShowSeparators', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeView_VCLuaGetShowSeparators(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	try
		ret := lTreeView.ShowSeparators;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'ShowSeparators', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeView_VCLuaSetSortType(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	val:TSortType;
begin
	CheckArg(L, 2);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	luaL_check(L,2,@val,TypeInfo(TSortType));
	try
		lTreeView.SortType := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'SortType', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeView_VCLuaGetSortType(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	ret:TSortType;
begin
	CheckArg(L, 1);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	try
		ret := lTreeView.SortType;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'SortType', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_TreeView_VCLuaSetToolTips(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	val:Boolean;
begin
	CheckArg(L, 2);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lTreeView.ToolTips := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'ToolTips', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeView_VCLuaGetToolTips(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	try
		ret := lTreeView.ToolTips;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'ToolTips', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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

function VCLua_TreeView_VCLuaSetBackgroundColor(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	val:TColor;
begin
	CheckArg(L, 2);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lTreeView.BackgroundColor := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'BackgroundColor', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeView_VCLuaGetBackgroundColor(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	ret:TColor;
begin
	CheckArg(L, 1);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	try
		ret := lTreeView.BackgroundColor;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'BackgroundColor', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeView_VCLuaSetBottomItem(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	val:TTreeNode;
begin
	CheckArg(L, 2);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lTreeView.BottomItem := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'BottomItem', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeView_VCLuaGetBottomItem(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	ret:TTreeNode;
begin
	CheckArg(L, 1);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	try
		ret := lTreeView.BottomItem;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'BottomItem', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeView_VCLuaSetDefaultItemHeight(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	val:integer;
begin
	CheckArg(L, 2);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lTreeView.DefaultItemHeight := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'DefaultItemHeight', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeView_VCLuaGetDefaultItemHeight(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	ret:integer;
begin
	CheckArg(L, 1);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	try
		ret := lTreeView.DefaultItemHeight;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'DefaultItemHeight', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeView_VCLuaSetDropTarget(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	val:TTreeNode;
begin
	CheckArg(L, 2);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lTreeView.DropTarget := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'DropTarget', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeView_VCLuaGetDropTarget(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	ret:TTreeNode;
begin
	CheckArg(L, 1);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	try
		ret := lTreeView.DropTarget;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'DropTarget', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeView_VCLuaSetExpandSignColor(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	val:TColor;
begin
	CheckArg(L, 2);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lTreeView.ExpandSignColor := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'ExpandSignColor', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeView_VCLuaGetExpandSignColor(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	ret:TColor;
begin
	CheckArg(L, 1);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	try
		ret := lTreeView.ExpandSignColor;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'ExpandSignColor', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeView_VCLuaSetExpandSignSize(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	val:integer;
begin
	CheckArg(L, 2);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lTreeView.ExpandSignSize := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'ExpandSignSize', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeView_VCLuaGetExpandSignSize(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	ret:integer;
begin
	CheckArg(L, 1);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	try
		ret := lTreeView.ExpandSignSize;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'ExpandSignSize', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeView_VCLuaSetExpandSignType(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	val:TTreeViewExpandSignType;
begin
	CheckArg(L, 2);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	luaL_check(L,2,@val,TypeInfo(TTreeViewExpandSignType));
	try
		lTreeView.ExpandSignType := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'ExpandSignType', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeView_VCLuaGetExpandSignType(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	ret:TTreeViewExpandSignType;
begin
	CheckArg(L, 1);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	try
		ret := lTreeView.ExpandSignType;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'ExpandSignType', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_TreeView_VCLuaSetImages(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	val:TCustomImageList;
begin
	CheckArg(L, 2);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lTreeView.Images := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'Images', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeView_VCLuaGetImages(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	ret:TCustomImageList;
begin
	CheckArg(L, 1);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	try
		ret := lTreeView.Images;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'Images', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_TreeView_VCLuaSetImagesWidth(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	val:Integer;
begin
	CheckArg(L, 2);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lTreeView.ImagesWidth := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'ImagesWidth', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeView_VCLuaGetImagesWidth(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	ret:Integer;
begin
	CheckArg(L, 1);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	try
		ret := lTreeView.ImagesWidth;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'ImagesWidth', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeView_VCLuaSetInsertMarkNode(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	val:TTreeNode;
begin
	CheckArg(L, 2);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lTreeView.InsertMarkNode := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'InsertMarkNode', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeView_VCLuaGetInsertMarkNode(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	ret:TTreeNode;
begin
	CheckArg(L, 1);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	try
		ret := lTreeView.InsertMarkNode;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'InsertMarkNode', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeView_VCLuaSetInsertMarkType(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	val:TTreeViewInsertMarkType;
begin
	CheckArg(L, 2);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	luaL_check(L,2,@val,TypeInfo(TTreeViewInsertMarkType));
	try
		lTreeView.InsertMarkType := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'InsertMarkType', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeView_VCLuaGetInsertMarkType(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	ret:TTreeViewInsertMarkType;
begin
	CheckArg(L, 1);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	try
		ret := lTreeView.InsertMarkType;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'InsertMarkType', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_TreeView_VCLuaSetItems(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	val:TTreeNodes;
begin
	CheckArg(L, 2);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lTreeView.Items := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'Items', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeView_VCLuaGetItems(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	ret:TTreeNodes;
begin
	CheckArg(L, 1);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	try
		ret := lTreeView.Items;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'Items', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeView_VCLuaSetKeepCollapsedNodes(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	val:boolean;
begin
	CheckArg(L, 2);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lTreeView.KeepCollapsedNodes := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'KeepCollapsedNodes', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeView_VCLuaGetKeepCollapsedNodes(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	ret:boolean;
begin
	CheckArg(L, 1);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	try
		ret := lTreeView.KeepCollapsedNodes;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'KeepCollapsedNodes', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeView_VCLuaSetMultiSelectStyle(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	val:TMultiSelectStyle;
begin
	CheckArg(L, 2);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	luaL_checkSet(L,2,@val,TypeInfo(TMultiSelectStyle));
	try
		lTreeView.MultiSelectStyle := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'MultiSelectStyle', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeView_VCLuaGetMultiSelectStyle(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	ret:TMultiSelectStyle;
begin
	CheckArg(L, 1);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	try
		ret := lTreeView.MultiSelectStyle;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'MultiSelectStyle', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_TreeView_VCLuaSetOptions(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	val:TTreeViewOptions;
begin
	CheckArg(L, 2);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	luaL_checkSet(L,2,@val,TypeInfo(TTreeViewOptions));
	try
		lTreeView.Options := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'Options', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeView_VCLuaGetOptions(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	ret:TTreeViewOptions;
begin
	CheckArg(L, 1);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	try
		ret := lTreeView.Options;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'Options', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_TreeView_VCLuaSetScrollBars(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	val:TScrollStyle;
begin
	CheckArg(L, 2);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	luaL_check(L,2,@val,TypeInfo(TScrollStyle));
	try
		lTreeView.ScrollBars := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'ScrollBars', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeView_VCLuaGetScrollBars(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	ret:TScrollStyle;
begin
	CheckArg(L, 1);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	try
		ret := lTreeView.ScrollBars;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'ScrollBars', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_TreeView_VCLuaSetSelected(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	val:TTreeNode;
begin
	CheckArg(L, 2);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lTreeView.Selected := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'Selected', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeView_VCLuaGetSelected(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	ret:TTreeNode;
begin
	CheckArg(L, 1);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	try
		ret := lTreeView.Selected;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'Selected', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeView_VCLuaSetSelectionColor(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	val:TColor;
begin
	CheckArg(L, 2);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lTreeView.SelectionColor := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'SelectionColor', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeView_VCLuaGetSelectionColor(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	ret:TColor;
begin
	CheckArg(L, 1);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	try
		ret := lTreeView.SelectionColor;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'SelectionColor', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeView_VCLuaGetSelectionCount(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	ret:Cardinal;
begin
	CheckArg(L, 1);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	try
		ret := lTreeView.SelectionCount;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'SelectionCount', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeView_VCLuaSetSelectionFontColor(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	val:TColor;
begin
	CheckArg(L, 2);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lTreeView.SelectionFontColor := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'SelectionFontColor', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeView_VCLuaGetSelectionFontColor(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	ret:TColor;
begin
	CheckArg(L, 1);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	try
		ret := lTreeView.SelectionFontColor;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'SelectionFontColor', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeView_VCLuaSetSelectionFontColorUsed(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	val:boolean;
begin
	CheckArg(L, 2);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lTreeView.SelectionFontColorUsed := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'SelectionFontColorUsed', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeView_VCLuaGetSelectionFontColorUsed(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	ret:boolean;
begin
	CheckArg(L, 1);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	try
		ret := lTreeView.SelectionFontColorUsed;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'SelectionFontColorUsed', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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

function VCLua_TreeView_VCLuaSetSeparatorColor(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	val:TColor;
begin
	CheckArg(L, 2);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lTreeView.SeparatorColor := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'SeparatorColor', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeView_VCLuaGetSeparatorColor(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	ret:TColor;
begin
	CheckArg(L, 1);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	try
		ret := lTreeView.SeparatorColor;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'SeparatorColor', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeView_VCLuaSetStateImages(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	val:TCustomImageList;
begin
	CheckArg(L, 2);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lTreeView.StateImages := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'StateImages', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeView_VCLuaGetStateImages(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	ret:TCustomImageList;
begin
	CheckArg(L, 1);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	try
		ret := lTreeView.StateImages;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'StateImages', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_TreeView_VCLuaSetStateImagesWidth(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	val:Integer;
begin
	CheckArg(L, 2);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lTreeView.StateImagesWidth := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'StateImagesWidth', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeView_VCLuaGetStateImagesWidth(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	ret:Integer;
begin
	CheckArg(L, 1);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	try
		ret := lTreeView.StateImagesWidth;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'StateImagesWidth', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeView_VCLuaSetTopItem(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	val:TTreeNode;
begin
	CheckArg(L, 2);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lTreeView.TopItem := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'TopItem', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeView_VCLuaGetTopItem(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	ret:TTreeNode;
begin
	CheckArg(L, 1);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	try
		ret := lTreeView.TopItem;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'TopItem', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeView_VCLuaSetTreeLineColor(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	val:TColor;
begin
	CheckArg(L, 2);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lTreeView.TreeLineColor := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'TreeLineColor', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeView_VCLuaGetTreeLineColor(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	ret:TColor;
begin
	CheckArg(L, 1);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	try
		ret := lTreeView.TreeLineColor;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'TreeLineColor', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeView_VCLuaSetTreeLinePenStyle(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	val:TPenStyle;
begin
	CheckArg(L, 2);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	luaL_check(L,2,@val,TypeInfo(TPenStyle));
	try
		lTreeView.TreeLinePenStyle := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'TreeLinePenStyle', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeView_VCLuaGetTreeLinePenStyle(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	ret:TPenStyle;
begin
	CheckArg(L, 1);
	lTreeView := TLuaTreeView(GetLuaObject(L, 1));
	try
		ret := lTreeView.TreeLinePenStyle;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'TreeLinePenStyle', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

procedure lua_push(L: Plua_State; const v: TTreeNode; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TTreeNode',v);
end;

procedure lua_push(L: Plua_State; const v: TTreeNodes; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TTreeNodes',v);
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
	TLuaMethodInfo.Create(TreeNodeFuncs, 'Data', @VCLua_TreeNode_VCLuaGetData, mfCall);
	TLuaMethodInfo.Create(TreeNodeFuncs, 'Items', @VCLua_TreeNode_Items);
	TreeNodeSets := TLuaVmt.Create;
	TLuaMethodInfo.Create(TreeNodeSets, 'Data', @VCLua_TreeNode_VCLuaSetData, mfCall);
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
	TLuaMethodInfo.Create(TreeNodesFuncs, 'TopLvlCount', @VCLua_TreeNodes_VCLuaGetTopLvlCount, mfCall);
	TLuaMethodInfo.Create(TreeNodesFuncs, 'TopLvlItems', @VCLua_TreeNodes_TopLvlItems);
	TreeNodesSets := TLuaVmt.Create;
	
	CustomTreeViewFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(CustomTreeViewFuncs, 'AccessibilityOn', @VCLua_TreeView_VCLuaGetAccessibilityOn, mfCall);
	TLuaMethodInfo.Create(CustomTreeViewFuncs, 'AutoExpand', @VCLua_TreeView_VCLuaGetAutoExpand, mfCall);
	TLuaMethodInfo.Create(CustomTreeViewFuncs, 'HideSelection', @VCLua_TreeView_VCLuaGetHideSelection, mfCall);
	TLuaMethodInfo.Create(CustomTreeViewFuncs, 'HotTrack', @VCLua_TreeView_VCLuaGetHotTrack, mfCall);
	TLuaMethodInfo.Create(CustomTreeViewFuncs, 'HotTrackColor', @VCLua_TreeView_VCLuaGetHotTrackColor, mfCall);
	TLuaMethodInfo.Create(CustomTreeViewFuncs, 'DisabledFontColor', @VCLua_TreeView_VCLuaGetDisabledFontColor, mfCall);
	TLuaMethodInfo.Create(CustomTreeViewFuncs, 'Indent', @VCLua_TreeView_VCLuaGetIndent, mfCall);
	TLuaMethodInfo.Create(CustomTreeViewFuncs, 'MultiSelect', @VCLua_TreeView_VCLuaGetMultiSelect, mfCall);
	TLuaMethodInfo.Create(CustomTreeViewFuncs, 'ReadOnly', @VCLua_TreeView_VCLuaGetReadOnly, mfCall);
	TLuaMethodInfo.Create(CustomTreeViewFuncs, 'RightClickSelect', @VCLua_TreeView_VCLuaGetRightClickSelect, mfCall);
	TLuaMethodInfo.Create(CustomTreeViewFuncs, 'RowSelect', @VCLua_TreeView_VCLuaGetRowSelect, mfCall);
	TLuaMethodInfo.Create(CustomTreeViewFuncs, 'ScrolledLeft', @VCLua_TreeView_VCLuaGetScrolledLeft, mfCall);
	TLuaMethodInfo.Create(CustomTreeViewFuncs, 'ScrolledTop', @VCLua_TreeView_VCLuaGetScrolledTop, mfCall);
	TLuaMethodInfo.Create(CustomTreeViewFuncs, 'ShowButtons', @VCLua_TreeView_VCLuaGetShowButtons, mfCall);
	TLuaMethodInfo.Create(CustomTreeViewFuncs, 'ShowLines', @VCLua_TreeView_VCLuaGetShowLines, mfCall);
	TLuaMethodInfo.Create(CustomTreeViewFuncs, 'ShowRoot', @VCLua_TreeView_VCLuaGetShowRoot, mfCall);
	TLuaMethodInfo.Create(CustomTreeViewFuncs, 'ShowSeparators', @VCLua_TreeView_VCLuaGetShowSeparators, mfCall);
	TLuaMethodInfo.Create(CustomTreeViewFuncs, 'SortType', @VCLua_TreeView_VCLuaGetSortType, mfCall);
	TLuaMethodInfo.Create(CustomTreeViewFuncs, 'ToolTips', @VCLua_TreeView_VCLuaGetToolTips, mfCall);
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
	TLuaMethodInfo.Create(CustomTreeViewFuncs, 'BackgroundColor', @VCLua_TreeView_VCLuaGetBackgroundColor, mfCall);
	TLuaMethodInfo.Create(CustomTreeViewFuncs, 'BottomItem', @VCLua_TreeView_VCLuaGetBottomItem, mfCall);
	TLuaMethodInfo.Create(CustomTreeViewFuncs, 'DefaultItemHeight', @VCLua_TreeView_VCLuaGetDefaultItemHeight, mfCall);
	TLuaMethodInfo.Create(CustomTreeViewFuncs, 'DropTarget', @VCLua_TreeView_VCLuaGetDropTarget, mfCall);
	TLuaMethodInfo.Create(CustomTreeViewFuncs, 'ExpandSignColor', @VCLua_TreeView_VCLuaGetExpandSignColor, mfCall);
	TLuaMethodInfo.Create(CustomTreeViewFuncs, 'ExpandSignSize', @VCLua_TreeView_VCLuaGetExpandSignSize, mfCall);
	TLuaMethodInfo.Create(CustomTreeViewFuncs, 'ExpandSignType', @VCLua_TreeView_VCLuaGetExpandSignType, mfCall);
	TLuaMethodInfo.Create(CustomTreeViewFuncs, 'Images', @VCLua_TreeView_VCLuaGetImages, mfCall);
	TLuaMethodInfo.Create(CustomTreeViewFuncs, 'ImagesWidth', @VCLua_TreeView_VCLuaGetImagesWidth, mfCall);
	TLuaMethodInfo.Create(CustomTreeViewFuncs, 'InsertMarkNode', @VCLua_TreeView_VCLuaGetInsertMarkNode, mfCall);
	TLuaMethodInfo.Create(CustomTreeViewFuncs, 'InsertMarkType', @VCLua_TreeView_VCLuaGetInsertMarkType, mfCall);
	TLuaMethodInfo.Create(CustomTreeViewFuncs, 'Items', @VCLua_TreeView_VCLuaGetItems, mfCall);
	TLuaMethodInfo.Create(CustomTreeViewFuncs, 'KeepCollapsedNodes', @VCLua_TreeView_VCLuaGetKeepCollapsedNodes, mfCall);
	TLuaMethodInfo.Create(CustomTreeViewFuncs, 'MultiSelectStyle', @VCLua_TreeView_VCLuaGetMultiSelectStyle, mfCall);
	TLuaMethodInfo.Create(CustomTreeViewFuncs, 'Options', @VCLua_TreeView_VCLuaGetOptions, mfCall);
	TLuaMethodInfo.Create(CustomTreeViewFuncs, 'ScrollBars', @VCLua_TreeView_VCLuaGetScrollBars, mfCall);
	TLuaMethodInfo.Create(CustomTreeViewFuncs, 'Selected', @VCLua_TreeView_VCLuaGetSelected, mfCall);
	TLuaMethodInfo.Create(CustomTreeViewFuncs, 'SelectionColor', @VCLua_TreeView_VCLuaGetSelectionColor, mfCall);
	TLuaMethodInfo.Create(CustomTreeViewFuncs, 'SelectionCount', @VCLua_TreeView_VCLuaGetSelectionCount, mfCall);
	TLuaMethodInfo.Create(CustomTreeViewFuncs, 'SelectionFontColor', @VCLua_TreeView_VCLuaGetSelectionFontColor, mfCall);
	TLuaMethodInfo.Create(CustomTreeViewFuncs, 'SelectionFontColorUsed', @VCLua_TreeView_VCLuaGetSelectionFontColorUsed, mfCall);
	TLuaMethodInfo.Create(CustomTreeViewFuncs, 'Selections', @VCLua_TreeView_Selections);
	TLuaMethodInfo.Create(CustomTreeViewFuncs, 'SeparatorColor', @VCLua_TreeView_VCLuaGetSeparatorColor, mfCall);
	TLuaMethodInfo.Create(CustomTreeViewFuncs, 'StateImages', @VCLua_TreeView_VCLuaGetStateImages, mfCall);
	TLuaMethodInfo.Create(CustomTreeViewFuncs, 'StateImagesWidth', @VCLua_TreeView_VCLuaGetStateImagesWidth, mfCall);
	TLuaMethodInfo.Create(CustomTreeViewFuncs, 'TopItem', @VCLua_TreeView_VCLuaGetTopItem, mfCall);
	TLuaMethodInfo.Create(CustomTreeViewFuncs, 'TreeLineColor', @VCLua_TreeView_VCLuaGetTreeLineColor, mfCall);
	TLuaMethodInfo.Create(CustomTreeViewFuncs, 'TreeLinePenStyle', @VCLua_TreeView_VCLuaGetTreeLinePenStyle, mfCall);
	CustomTreeViewSets := TLuaVmt.Create;
	TLuaMethodInfo.Create(CustomTreeViewSets, 'AccessibilityOn', @VCLua_TreeView_VCLuaSetAccessibilityOn, mfCall);
	TLuaMethodInfo.Create(CustomTreeViewSets, 'AutoExpand', @VCLua_TreeView_VCLuaSetAutoExpand, mfCall);
	TLuaMethodInfo.Create(CustomTreeViewSets, 'HideSelection', @VCLua_TreeView_VCLuaSetHideSelection, mfCall);
	TLuaMethodInfo.Create(CustomTreeViewSets, 'HotTrack', @VCLua_TreeView_VCLuaSetHotTrack, mfCall);
	TLuaMethodInfo.Create(CustomTreeViewSets, 'HotTrackColor', @VCLua_TreeView_VCLuaSetHotTrackColor, mfCall);
	TLuaMethodInfo.Create(CustomTreeViewSets, 'DisabledFontColor', @VCLua_TreeView_VCLuaSetDisabledFontColor, mfCall);
	TLuaMethodInfo.Create(CustomTreeViewSets, 'Indent', @VCLua_TreeView_VCLuaSetIndent, mfCall);
	TLuaMethodInfo.Create(CustomTreeViewSets, 'MultiSelect', @VCLua_TreeView_VCLuaSetMultiSelect, mfCall);
	TLuaMethodInfo.Create(CustomTreeViewSets, 'ReadOnly', @VCLua_TreeView_VCLuaSetReadOnly, mfCall);
	TLuaMethodInfo.Create(CustomTreeViewSets, 'RightClickSelect', @VCLua_TreeView_VCLuaSetRightClickSelect, mfCall);
	TLuaMethodInfo.Create(CustomTreeViewSets, 'RowSelect', @VCLua_TreeView_VCLuaSetRowSelect, mfCall);
	TLuaMethodInfo.Create(CustomTreeViewSets, 'ScrolledLeft', @VCLua_TreeView_VCLuaSetScrolledLeft, mfCall);
	TLuaMethodInfo.Create(CustomTreeViewSets, 'ScrolledTop', @VCLua_TreeView_VCLuaSetScrolledTop, mfCall);
	TLuaMethodInfo.Create(CustomTreeViewSets, 'ShowButtons', @VCLua_TreeView_VCLuaSetShowButtons, mfCall);
	TLuaMethodInfo.Create(CustomTreeViewSets, 'ShowLines', @VCLua_TreeView_VCLuaSetShowLines, mfCall);
	TLuaMethodInfo.Create(CustomTreeViewSets, 'ShowRoot', @VCLua_TreeView_VCLuaSetShowRoot, mfCall);
	TLuaMethodInfo.Create(CustomTreeViewSets, 'ShowSeparators', @VCLua_TreeView_VCLuaSetShowSeparators, mfCall);
	TLuaMethodInfo.Create(CustomTreeViewSets, 'SortType', @VCLua_TreeView_VCLuaSetSortType, mfCall);
	TLuaMethodInfo.Create(CustomTreeViewSets, 'ToolTips', @VCLua_TreeView_VCLuaSetToolTips, mfCall);
	TLuaMethodInfo.Create(CustomTreeViewSets, 'BackgroundColor', @VCLua_TreeView_VCLuaSetBackgroundColor, mfCall);
	TLuaMethodInfo.Create(CustomTreeViewSets, 'BottomItem', @VCLua_TreeView_VCLuaSetBottomItem, mfCall);
	TLuaMethodInfo.Create(CustomTreeViewSets, 'DefaultItemHeight', @VCLua_TreeView_VCLuaSetDefaultItemHeight, mfCall);
	TLuaMethodInfo.Create(CustomTreeViewSets, 'DropTarget', @VCLua_TreeView_VCLuaSetDropTarget, mfCall);
	TLuaMethodInfo.Create(CustomTreeViewSets, 'ExpandSignColor', @VCLua_TreeView_VCLuaSetExpandSignColor, mfCall);
	TLuaMethodInfo.Create(CustomTreeViewSets, 'ExpandSignSize', @VCLua_TreeView_VCLuaSetExpandSignSize, mfCall);
	TLuaMethodInfo.Create(CustomTreeViewSets, 'ExpandSignType', @VCLua_TreeView_VCLuaSetExpandSignType, mfCall);
	TLuaMethodInfo.Create(CustomTreeViewSets, 'Images', @VCLua_TreeView_VCLuaSetImages, mfCall);
	TLuaMethodInfo.Create(CustomTreeViewSets, 'ImagesWidth', @VCLua_TreeView_VCLuaSetImagesWidth, mfCall);
	TLuaMethodInfo.Create(CustomTreeViewSets, 'InsertMarkNode', @VCLua_TreeView_VCLuaSetInsertMarkNode, mfCall);
	TLuaMethodInfo.Create(CustomTreeViewSets, 'InsertMarkType', @VCLua_TreeView_VCLuaSetInsertMarkType, mfCall);
	TLuaMethodInfo.Create(CustomTreeViewSets, 'Items', @VCLua_TreeView_VCLuaSetItems, mfCall);
	TLuaMethodInfo.Create(CustomTreeViewSets, 'KeepCollapsedNodes', @VCLua_TreeView_VCLuaSetKeepCollapsedNodes, mfCall);
	TLuaMethodInfo.Create(CustomTreeViewSets, 'MultiSelectStyle', @VCLua_TreeView_VCLuaSetMultiSelectStyle, mfCall);
	TLuaMethodInfo.Create(CustomTreeViewSets, 'Options', @VCLua_TreeView_VCLuaSetOptions, mfCall);
	TLuaMethodInfo.Create(CustomTreeViewSets, 'ScrollBars', @VCLua_TreeView_VCLuaSetScrollBars, mfCall);
	TLuaMethodInfo.Create(CustomTreeViewSets, 'Selected', @VCLua_TreeView_VCLuaSetSelected, mfCall);
	TLuaMethodInfo.Create(CustomTreeViewSets, 'SelectionColor', @VCLua_TreeView_VCLuaSetSelectionColor, mfCall);
	TLuaMethodInfo.Create(CustomTreeViewSets, 'SelectionFontColor', @VCLua_TreeView_VCLuaSetSelectionFontColor, mfCall);
	TLuaMethodInfo.Create(CustomTreeViewSets, 'SelectionFontColorUsed', @VCLua_TreeView_VCLuaSetSelectionFontColorUsed, mfCall);
	TLuaMethodInfo.Create(CustomTreeViewSets, 'SeparatorColor', @VCLua_TreeView_VCLuaSetSeparatorColor, mfCall);
	TLuaMethodInfo.Create(CustomTreeViewSets, 'StateImages', @VCLua_TreeView_VCLuaSetStateImages, mfCall);
	TLuaMethodInfo.Create(CustomTreeViewSets, 'StateImagesWidth', @VCLua_TreeView_VCLuaSetStateImagesWidth, mfCall);
	TLuaMethodInfo.Create(CustomTreeViewSets, 'TopItem', @VCLua_TreeView_VCLuaSetTopItem, mfCall);
	TLuaMethodInfo.Create(CustomTreeViewSets, 'TreeLineColor', @VCLua_TreeView_VCLuaSetTreeLineColor, mfCall);
	TLuaMethodInfo.Create(CustomTreeViewSets, 'TreeLinePenStyle', @VCLua_TreeView_VCLuaSetTreeLinePenStyle, mfCall);
end.
