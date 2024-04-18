(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaTreeView;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaController, TypInfo, LuaVmt, ComCtrls;

procedure lua_push(L: Plua_State; const v: TTreeNode; pti: PTypeInfo = nil); overload; inline;

type
    TLuaTreeNode = class(TTreeNode)
    end;
var
    TreeNodeFuncs: TLuaVmt;
    TreeNodeSets: TLuaVmt;

procedure lua_push(L: Plua_State; const v: TTreeNodes; pti: PTypeInfo = nil); overload; inline;

type
    TLuaTreeNodes = class(TTreeNodes)
    end;
var
    TreeNodesFuncs: TLuaVmt;
    TreeNodesSets: TLuaVmt;

function CreateTreeView(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TTreeView; pti: PTypeInfo = nil); overload; inline;

type
    TLuaTreeView = class(TTreeView)
    end;
var
    CustomTreeViewFuncs: TLuaVmt;
    CustomTreeViewSets: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Classes, Controls, GraphType, Graphics, ImgList, LuaClassesEvents, LuaComCtrlsEvents, LuaEvent, LuaImageList, LuaStringList, StdCtrls;

function VCLua_TreeNode_AlphaSort(L: Plua_State): Integer; cdecl;
var
	lTreeNode:TLuaTreeNode;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lTreeNode := TLuaTreeNode(GetLuaObject(L, 1));
	try
		ret := lTreeNode.AlphaSort();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeNode', 'AlphaSort', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeNode_Bottom(L: Plua_State): Integer; cdecl;
var
	lTreeNode:TLuaTreeNode;
	ret:integer;
begin
	CheckArg(L, 1);
	lTreeNode := TLuaTreeNode(GetLuaObject(L, 1));
	try
		ret := lTreeNode.Bottom();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeNode', 'Bottom', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeNode_BottomExpanded(L: Plua_State): Integer; cdecl;
var
	lTreeNode:TLuaTreeNode;
	ret:integer;
begin
	CheckArg(L, 1);
	lTreeNode := TLuaTreeNode(GetLuaObject(L, 1));
	try
		ret := lTreeNode.BottomExpanded();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeNode', 'BottomExpanded', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeNode_DefaultTreeViewSort(L: Plua_State): Integer; cdecl;
var
	lTreeNode:TLuaTreeNode;
	Node1:TTreeNode;
	Node2:TTreeNode;
	ret:Integer;
begin
	CheckArg(L, 3);
	lTreeNode := TLuaTreeNode(GetLuaObject(L, 1));
	luaL_check(L,2,@Node1);
	luaL_check(L,3,@Node2);
	try
		ret := lTreeNode.DefaultTreeViewSort(Node1,Node2);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeNode', 'DefaultTreeViewSort', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeNode_DisplayExpandSignLeft(L: Plua_State): Integer; cdecl;
var
	lTreeNode:TLuaTreeNode;
	ret:integer;
begin
	CheckArg(L, 1);
	lTreeNode := TLuaTreeNode(GetLuaObject(L, 1));
	try
		ret := lTreeNode.DisplayExpandSignLeft();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeNode', 'DisplayExpandSignLeft', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeNode_DisplayExpandSignRect(L: Plua_State): Integer; cdecl;
var
	lTreeNode:TLuaTreeNode;
	ret:TRect;
begin
	CheckArg(L, 1);
	lTreeNode := TLuaTreeNode(GetLuaObject(L, 1));
	try
		ret := lTreeNode.DisplayExpandSignRect();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeNode', 'DisplayExpandSignRect', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeNode_DisplayExpandSignRight(L: Plua_State): Integer; cdecl;
var
	lTreeNode:TLuaTreeNode;
	ret:integer;
begin
	CheckArg(L, 1);
	lTreeNode := TLuaTreeNode(GetLuaObject(L, 1));
	try
		ret := lTreeNode.DisplayExpandSignRight();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeNode', 'DisplayExpandSignRight', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeNode_DisplayIconLeft(L: Plua_State): Integer; cdecl;
var
	lTreeNode:TLuaTreeNode;
	ret:integer;
begin
	CheckArg(L, 1);
	lTreeNode := TLuaTreeNode(GetLuaObject(L, 1));
	try
		ret := lTreeNode.DisplayIconLeft();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeNode', 'DisplayIconLeft', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeNode_DisplayRect(L: Plua_State): Integer; cdecl;
var
	lTreeNode:TLuaTreeNode;
	TextOnly:Boolean;
	ret:TRect;
begin
	CheckArg(L, 2);
	lTreeNode := TLuaTreeNode(GetLuaObject(L, 1));
	luaL_check(L,2,@TextOnly);
	try
		ret := lTreeNode.DisplayRect(TextOnly);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeNode', 'DisplayRect', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeNode_DisplayStateIconLeft(L: Plua_State): Integer; cdecl;
var
	lTreeNode:TLuaTreeNode;
	ret:integer;
begin
	CheckArg(L, 1);
	lTreeNode := TLuaTreeNode(GetLuaObject(L, 1));
	try
		ret := lTreeNode.DisplayStateIconLeft();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeNode', 'DisplayStateIconLeft', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeNode_DisplayTextLeft(L: Plua_State): Integer; cdecl;
var
	lTreeNode:TLuaTreeNode;
	ret:integer;
begin
	CheckArg(L, 1);
	lTreeNode := TLuaTreeNode(GetLuaObject(L, 1));
	try
		ret := lTreeNode.DisplayTextLeft();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeNode', 'DisplayTextLeft', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeNode_DisplayTextRight(L: Plua_State): Integer; cdecl;
var
	lTreeNode:TLuaTreeNode;
	ret:integer;
begin
	CheckArg(L, 1);
	lTreeNode := TLuaTreeNode(GetLuaObject(L, 1));
	try
		ret := lTreeNode.DisplayTextRight();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeNode', 'DisplayTextRight', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeNode_EditText(L: Plua_State): Integer; cdecl;
var
	lTreeNode:TLuaTreeNode;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lTreeNode := TLuaTreeNode(GetLuaObject(L, 1));
	try
		ret := lTreeNode.EditText();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeNode', 'EditText', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeNode_FindNode(L: Plua_State): Integer; cdecl;
var
	lTreeNode:TLuaTreeNode;
	NodeText:string;
	ret:TTreeNode;
begin
	CheckArg(L, 2);
	lTreeNode := TLuaTreeNode(GetLuaObject(L, 1));
	luaL_check(L,2,@NodeText);
	try
		ret := lTreeNode.FindNode(NodeText);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeNode', 'FindNode', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeNode_GetFirstChild(L: Plua_State): Integer; cdecl;
var
	lTreeNode:TLuaTreeNode;
	ret:TTreeNode;
begin
	CheckArg(L, 1);
	lTreeNode := TLuaTreeNode(GetLuaObject(L, 1));
	try
		ret := lTreeNode.GetFirstChild();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeNode', 'GetFirstChild', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeNode_GetFirstSibling(L: Plua_State): Integer; cdecl;
var
	lTreeNode:TLuaTreeNode;
	ret:TTreeNode;
begin
	CheckArg(L, 1);
	lTreeNode := TLuaTreeNode(GetLuaObject(L, 1));
	try
		ret := lTreeNode.GetFirstSibling();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeNode', 'GetFirstSibling', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeNode_GetFirstVisibleChild(L: Plua_State): Integer; cdecl;
var
	lTreeNode:TLuaTreeNode;
	ret:TTreeNode;
begin
	CheckArg(L, 1);
	lTreeNode := TLuaTreeNode(GetLuaObject(L, 1));
	try
		ret := lTreeNode.GetFirstVisibleChild();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeNode', 'GetFirstVisibleChild', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeNode_GetHandle(L: Plua_State): Integer; cdecl;
var
	lTreeNode:TLuaTreeNode;
	ret:THandle;
begin
	CheckArg(L, 1);
	lTreeNode := TLuaTreeNode(GetLuaObject(L, 1));
	try
		ret := lTreeNode.GetHandle();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeNode', 'GetHandle', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeNode_GetLastChild(L: Plua_State): Integer; cdecl;
var
	lTreeNode:TLuaTreeNode;
	ret:TTreeNode;
begin
	CheckArg(L, 1);
	lTreeNode := TLuaTreeNode(GetLuaObject(L, 1));
	try
		ret := lTreeNode.GetLastChild();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeNode', 'GetLastChild', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeNode_GetLastSibling(L: Plua_State): Integer; cdecl;
var
	lTreeNode:TLuaTreeNode;
	ret:TTreeNode;
begin
	CheckArg(L, 1);
	lTreeNode := TLuaTreeNode(GetLuaObject(L, 1));
	try
		ret := lTreeNode.GetLastSibling();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeNode', 'GetLastSibling', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeNode_GetLastSubChild(L: Plua_State): Integer; cdecl;
var
	lTreeNode:TLuaTreeNode;
	ret:TTreeNode;
begin
	CheckArg(L, 1);
	lTreeNode := TLuaTreeNode(GetLuaObject(L, 1));
	try
		ret := lTreeNode.GetLastSubChild();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeNode', 'GetLastSubChild', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeNode_GetLastVisibleChild(L: Plua_State): Integer; cdecl;
var
	lTreeNode:TLuaTreeNode;
	ret:TTreeNode;
begin
	CheckArg(L, 1);
	lTreeNode := TLuaTreeNode(GetLuaObject(L, 1));
	try
		ret := lTreeNode.GetLastVisibleChild();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeNode', 'GetLastVisibleChild', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeNode_GetNext(L: Plua_State): Integer; cdecl;
var
	lTreeNode:TLuaTreeNode;
	ret:TTreeNode;
begin
	CheckArg(L, 1);
	lTreeNode := TLuaTreeNode(GetLuaObject(L, 1));
	try
		ret := lTreeNode.GetNext();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeNode', 'GetNext', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeNode_GetNextChild(L: Plua_State): Integer; cdecl;
var
	lTreeNode:TLuaTreeNode;
	AValue:TTreeNode;
	ret:TTreeNode;
begin
	CheckArg(L, 2);
	lTreeNode := TLuaTreeNode(GetLuaObject(L, 1));
	luaL_check(L,2,@AValue);
	try
		ret := lTreeNode.GetNextChild(AValue);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeNode', 'GetNextChild', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeNode_GetNextExpanded(L: Plua_State): Integer; cdecl;
var
	lTreeNode:TLuaTreeNode;
	ret:TTreeNode;
begin
	CheckArg(L, 1);
	lTreeNode := TLuaTreeNode(GetLuaObject(L, 1));
	try
		ret := lTreeNode.GetNextExpanded();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeNode', 'GetNextExpanded', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeNode_GetNextMultiSelected(L: Plua_State): Integer; cdecl;
var
	lTreeNode:TLuaTreeNode;
	ret:TTreeNode;
begin
	CheckArg(L, 1);
	lTreeNode := TLuaTreeNode(GetLuaObject(L, 1));
	try
		ret := lTreeNode.GetNextMultiSelected();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeNode', 'GetNextMultiSelected', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeNode_GetNextSibling(L: Plua_State): Integer; cdecl;
var
	lTreeNode:TLuaTreeNode;
	ret:TTreeNode;
begin
	CheckArg(L, 1);
	lTreeNode := TLuaTreeNode(GetLuaObject(L, 1));
	try
		ret := lTreeNode.GetNextSibling();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeNode', 'GetNextSibling', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeNode_GetNextSkipChildren(L: Plua_State): Integer; cdecl;
var
	lTreeNode:TLuaTreeNode;
	ret:TTreeNode;
begin
	CheckArg(L, 1);
	lTreeNode := TLuaTreeNode(GetLuaObject(L, 1));
	try
		ret := lTreeNode.GetNextSkipChildren();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeNode', 'GetNextSkipChildren', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeNode_GetNextVisible(L: Plua_State): Integer; cdecl;
var
	lTreeNode:TLuaTreeNode;
	ret:TTreeNode;
begin
	CheckArg(L, 1);
	lTreeNode := TLuaTreeNode(GetLuaObject(L, 1));
	try
		ret := lTreeNode.GetNextVisible();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeNode', 'GetNextVisible', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeNode_GetNextVisibleSibling(L: Plua_State): Integer; cdecl;
var
	lTreeNode:TLuaTreeNode;
	ret:TTreeNode;
begin
	CheckArg(L, 1);
	lTreeNode := TLuaTreeNode(GetLuaObject(L, 1));
	try
		ret := lTreeNode.GetNextVisibleSibling();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeNode', 'GetNextVisibleSibling', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeNode_GetParentNodeOfAbsoluteLevel(L: Plua_State): Integer; cdecl;
var
	lTreeNode:TLuaTreeNode;
	TheAbsoluteLevel:integer;
	ret:TTreeNode;
begin
	CheckArg(L, 2);
	lTreeNode := TLuaTreeNode(GetLuaObject(L, 1));
	luaL_check(L,2,@TheAbsoluteLevel);
	try
		ret := lTreeNode.GetParentNodeOfAbsoluteLevel(TheAbsoluteLevel);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeNode', 'GetParentNodeOfAbsoluteLevel', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeNode_GetPrev(L: Plua_State): Integer; cdecl;
var
	lTreeNode:TLuaTreeNode;
	ret:TTreeNode;
begin
	CheckArg(L, 1);
	lTreeNode := TLuaTreeNode(GetLuaObject(L, 1));
	try
		ret := lTreeNode.GetPrev();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeNode', 'GetPrev', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeNode_GetPrevChild(L: Plua_State): Integer; cdecl;
var
	lTreeNode:TLuaTreeNode;
	AValue:TTreeNode;
	ret:TTreeNode;
begin
	CheckArg(L, 2);
	lTreeNode := TLuaTreeNode(GetLuaObject(L, 1));
	luaL_check(L,2,@AValue);
	try
		ret := lTreeNode.GetPrevChild(AValue);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeNode', 'GetPrevChild', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeNode_GetPrevExpanded(L: Plua_State): Integer; cdecl;
var
	lTreeNode:TLuaTreeNode;
	ret:TTreeNode;
begin
	CheckArg(L, 1);
	lTreeNode := TLuaTreeNode(GetLuaObject(L, 1));
	try
		ret := lTreeNode.GetPrevExpanded();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeNode', 'GetPrevExpanded', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeNode_GetPrevMultiSelected(L: Plua_State): Integer; cdecl;
var
	lTreeNode:TLuaTreeNode;
	ret:TTreeNode;
begin
	CheckArg(L, 1);
	lTreeNode := TLuaTreeNode(GetLuaObject(L, 1));
	try
		ret := lTreeNode.GetPrevMultiSelected();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeNode', 'GetPrevMultiSelected', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeNode_GetPrevSibling(L: Plua_State): Integer; cdecl;
var
	lTreeNode:TLuaTreeNode;
	ret:TTreeNode;
begin
	CheckArg(L, 1);
	lTreeNode := TLuaTreeNode(GetLuaObject(L, 1));
	try
		ret := lTreeNode.GetPrevSibling();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeNode', 'GetPrevSibling', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeNode_GetPrevVisible(L: Plua_State): Integer; cdecl;
var
	lTreeNode:TLuaTreeNode;
	ret:TTreeNode;
begin
	CheckArg(L, 1);
	lTreeNode := TLuaTreeNode(GetLuaObject(L, 1));
	try
		ret := lTreeNode.GetPrevVisible();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeNode', 'GetPrevVisible', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeNode_GetPrevVisibleSibling(L: Plua_State): Integer; cdecl;
var
	lTreeNode:TLuaTreeNode;
	ret:TTreeNode;
begin
	CheckArg(L, 1);
	lTreeNode := TLuaTreeNode(GetLuaObject(L, 1));
	try
		ret := lTreeNode.GetPrevVisibleSibling();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeNode', 'GetPrevVisibleSibling', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeNode_GetTextPath(L: Plua_State): Integer; cdecl;
var
	lTreeNode:TLuaTreeNode;
	ret:string;
begin
	CheckArg(L, 1);
	lTreeNode := TLuaTreeNode(GetLuaObject(L, 1));
	try
		ret := lTreeNode.GetTextPath();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeNode', 'GetTextPath', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeNode_HasAsParent(L: Plua_State): Integer; cdecl;
var
	lTreeNode:TLuaTreeNode;
	AValue:TTreeNode;
	ret:Boolean;
begin
	CheckArg(L, 2);
	lTreeNode := TLuaTreeNode(GetLuaObject(L, 1));
	luaL_check(L,2,@AValue);
	try
		ret := lTreeNode.HasAsParent(AValue);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeNode', 'HasAsParent', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeNode_IndexOf(L: Plua_State): Integer; cdecl;
var
	lTreeNode:TLuaTreeNode;
	AValue:TTreeNode;
	ret:Integer;
begin
	CheckArg(L, 2);
	lTreeNode := TLuaTreeNode(GetLuaObject(L, 1));
	luaL_check(L,2,@AValue);
	try
		ret := lTreeNode.IndexOf(AValue);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeNode', 'IndexOf', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeNode_IndexOfText(L: Plua_State): Integer; cdecl;
var
	lTreeNode:TLuaTreeNode;
	NodeText:string;
	ret:Integer;
begin
	CheckArg(L, 2);
	lTreeNode := TLuaTreeNode(GetLuaObject(L, 1));
	luaL_check(L,2,@NodeText);
	try
		ret := lTreeNode.IndexOfText(NodeText);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeNode', 'IndexOfText', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeNode_Assign(L: Plua_State): Integer; cdecl;
var
	lTreeNode:TLuaTreeNode;
	Source:TPersistent;
begin
	CheckArg(L, 2);
	lTreeNode := TLuaTreeNode(GetLuaObject(L, 1));
	luaL_check(L,2,@Source);
	try
		lTreeNode.Assign(Source);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeNode', 'Assign', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeNode_Collapse(L: Plua_State): Integer; cdecl;
var
	lTreeNode:TLuaTreeNode;
	Recurse:Boolean;
begin
	CheckArg(L, 2);
	lTreeNode := TLuaTreeNode(GetLuaObject(L, 1));
	luaL_check(L,2,@Recurse);
	try
		lTreeNode.Collapse(Recurse);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeNode', 'Collapse', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeNode_ConsistencyCheck(L: Plua_State): Integer; cdecl;
var
	lTreeNode:TLuaTreeNode;
begin
	CheckArg(L, 1);
	lTreeNode := TLuaTreeNode(GetLuaObject(L, 1));
	try
		lTreeNode.ConsistencyCheck();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeNode', 'ConsistencyCheck', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeNode_Delete(L: Plua_State): Integer; cdecl;
var
	lTreeNode:TLuaTreeNode;
begin
	CheckArg(L, 1);
	lTreeNode := TLuaTreeNode(GetLuaObject(L, 1));
	try
		lTreeNode.Delete();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeNode', 'Delete', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeNode_DeleteChildren(L: Plua_State): Integer; cdecl;
var
	lTreeNode:TLuaTreeNode;
begin
	CheckArg(L, 1);
	lTreeNode := TLuaTreeNode(GetLuaObject(L, 1));
	try
		lTreeNode.DeleteChildren();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeNode', 'DeleteChildren', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeNode_EndEdit(L: Plua_State): Integer; cdecl;
var
	lTreeNode:TLuaTreeNode;
	Cancel:Boolean;
begin
	CheckArg(L, 2);
	lTreeNode := TLuaTreeNode(GetLuaObject(L, 1));
	luaL_check(L,2,@Cancel);
	try
		lTreeNode.EndEdit(Cancel);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeNode', 'EndEdit', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeNode_Expand(L: Plua_State): Integer; cdecl;
var
	lTreeNode:TLuaTreeNode;
	Recurse:Boolean;
begin
	CheckArg(L, 2);
	lTreeNode := TLuaTreeNode(GetLuaObject(L, 1));
	luaL_check(L,2,@Recurse);
	try
		lTreeNode.Expand(Recurse);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeNode', 'Expand', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeNode_ExpandParents(L: Plua_State): Integer; cdecl;
var
	lTreeNode:TLuaTreeNode;
begin
	CheckArg(L, 1);
	lTreeNode := TLuaTreeNode(GetLuaObject(L, 1));
	try
		lTreeNode.ExpandParents();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeNode', 'ExpandParents', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeNode_FreeAllNodeData(L: Plua_State): Integer; cdecl;
var
	lTreeNode:TLuaTreeNode;
begin
	CheckArg(L, 1);
	lTreeNode := TLuaTreeNode(GetLuaObject(L, 1));
	try
		lTreeNode.FreeAllNodeData();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeNode', 'FreeAllNodeData', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeNode_MakeVisible(L: Plua_State): Integer; cdecl;
var
	lTreeNode:TLuaTreeNode;
begin
	CheckArg(L, 1);
	lTreeNode := TLuaTreeNode(GetLuaObject(L, 1));
	try
		lTreeNode.MakeVisible();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeNode', 'MakeVisible', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeNode_MoveTo(L: Plua_State): Integer; cdecl;
var
	lTreeNode:TLuaTreeNode;
	Destination:TTreeNode;
	Mode:TNodeAttachMode;
begin
	CheckArg(L, 3);
	lTreeNode := TLuaTreeNode(GetLuaObject(L, 1));
	luaL_check(L,2,@Destination);
	luaL_check(L,3,@Mode,TypeInfo(TNodeAttachMode));
	try
		lTreeNode.MoveTo(Destination,Mode);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeNode', 'MoveTo', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeNode_MultiSelectGroup(L: Plua_State): Integer; cdecl;
var
	lTreeNode:TLuaTreeNode;
begin
	CheckArg(L, 1);
	lTreeNode := TLuaTreeNode(GetLuaObject(L, 1));
	try
		lTreeNode.MultiSelectGroup();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeNode', 'MultiSelectGroup', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeNode_Update(L: Plua_State): Integer; cdecl;
var
	lTreeNode:TLuaTreeNode;
begin
	CheckArg(L, 1);
	lTreeNode := TLuaTreeNode(GetLuaObject(L, 1));
	try
		lTreeNode.Update();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeNode', 'Update', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeNode_WriteDebugReport(L: Plua_State): Integer; cdecl;
var
	lTreeNode:TLuaTreeNode;
	Prefix:string;
	Recurse:boolean;
begin
	CheckArg(L, 3);
	lTreeNode := TLuaTreeNode(GetLuaObject(L, 1));
	luaL_check(L,2,@Prefix);
	luaL_check(L,3,@Recurse);
	try
		lTreeNode.WriteDebugReport(Prefix,Recurse);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeNode', 'WriteDebugReport', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeNode_VCLuaGetAbsoluteIndex(L: Plua_State): Integer; cdecl;
var
	lTreeNode:TLuaTreeNode;
	ret:Integer;
begin
	lTreeNode := TLuaTreeNode(GetLuaObjectUnsafe(L, 1));
	try
		ret := lTreeNode.AbsoluteIndex;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeNode', 'GetAbsoluteIndex', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeNode_VCLuaGetCount(L: Plua_State): Integer; cdecl;
var
	lTreeNode:TLuaTreeNode;
	ret:Integer;
begin
	lTreeNode := TLuaTreeNode(GetLuaObjectUnsafe(L, 1));
	try
		ret := lTreeNode.Count;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeNode', 'GetCount', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeNode_VCLuaSetCut(L: Plua_State): Integer; cdecl;
var
	lTreeNode:TLuaTreeNode;
	val:Boolean;
begin
	lTreeNode := TLuaTreeNode(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lTreeNode.Cut := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeNode', 'SetCut', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeNode_VCLuaGetCut(L: Plua_State): Integer; cdecl;
var
	lTreeNode:TLuaTreeNode;
	ret:Boolean;
begin
	lTreeNode := TLuaTreeNode(GetLuaObjectUnsafe(L, 1));
	try
		ret := lTreeNode.Cut;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeNode', 'GetCut', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeNode_VCLuaSetData(L: Plua_State): Integer; cdecl;
var
	lTreeNode:TLuaTreeNode;
	val:Pointer;
begin
	lTreeNode := TLuaTreeNode(GetLuaObjectUnsafe(L, 1));
	val := lua_touserdata(L,2);
	try
		lTreeNode.Data := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeNode', 'SetData', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeNode_VCLuaGetData(L: Plua_State): Integer; cdecl;
var
	lTreeNode:TLuaTreeNode;
	ret:Pointer;
begin
	lTreeNode := TLuaTreeNode(GetLuaObjectUnsafe(L, 1));
	try
		ret := lTreeNode.Data;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeNode', 'GetData', E.ClassName, E.Message);
	end;
	lua_pushlightuserdata(L,ret);
end;

function VCLua_TreeNode_VCLuaGetDeleting(L: Plua_State): Integer; cdecl;
var
	lTreeNode:TLuaTreeNode;
	ret:Boolean;
begin
	lTreeNode := TLuaTreeNode(GetLuaObjectUnsafe(L, 1));
	try
		ret := lTreeNode.Deleting;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeNode', 'GetDeleting', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeNode_VCLuaSetDropTarget(L: Plua_State): Integer; cdecl;
var
	lTreeNode:TLuaTreeNode;
	val:Boolean;
begin
	lTreeNode := TLuaTreeNode(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lTreeNode.DropTarget := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeNode', 'SetDropTarget', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeNode_VCLuaGetDropTarget(L: Plua_State): Integer; cdecl;
var
	lTreeNode:TLuaTreeNode;
	ret:Boolean;
begin
	lTreeNode := TLuaTreeNode(GetLuaObjectUnsafe(L, 1));
	try
		ret := lTreeNode.DropTarget;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeNode', 'GetDropTarget', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeNode_VCLuaSetExpanded(L: Plua_State): Integer; cdecl;
var
	lTreeNode:TLuaTreeNode;
	val:Boolean;
begin
	lTreeNode := TLuaTreeNode(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lTreeNode.Expanded := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeNode', 'SetExpanded', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeNode_VCLuaGetExpanded(L: Plua_State): Integer; cdecl;
var
	lTreeNode:TLuaTreeNode;
	ret:Boolean;
begin
	lTreeNode := TLuaTreeNode(GetLuaObjectUnsafe(L, 1));
	try
		ret := lTreeNode.Expanded;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeNode', 'GetExpanded', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeNode_VCLuaSetFocused(L: Plua_State): Integer; cdecl;
var
	lTreeNode:TLuaTreeNode;
	val:Boolean;
begin
	lTreeNode := TLuaTreeNode(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lTreeNode.Focused := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeNode', 'SetFocused', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeNode_VCLuaGetFocused(L: Plua_State): Integer; cdecl;
var
	lTreeNode:TLuaTreeNode;
	ret:Boolean;
begin
	lTreeNode := TLuaTreeNode(GetLuaObjectUnsafe(L, 1));
	try
		ret := lTreeNode.Focused;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeNode', 'GetFocused', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeNode_VCLuaGetHandle(L: Plua_State): Integer; cdecl;
var
	lTreeNode:TLuaTreeNode;
	ret:THandle;
begin
	lTreeNode := TLuaTreeNode(GetLuaObjectUnsafe(L, 1));
	try
		ret := lTreeNode.Handle;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeNode', 'GetHandle', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeNode_VCLuaSetHasChildren(L: Plua_State): Integer; cdecl;
var
	lTreeNode:TLuaTreeNode;
	val:Boolean;
begin
	lTreeNode := TLuaTreeNode(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lTreeNode.HasChildren := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeNode', 'SetHasChildren', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeNode_VCLuaGetHasChildren(L: Plua_State): Integer; cdecl;
var
	lTreeNode:TLuaTreeNode;
	ret:Boolean;
begin
	lTreeNode := TLuaTreeNode(GetLuaObjectUnsafe(L, 1));
	try
		ret := lTreeNode.HasChildren;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeNode', 'GetHasChildren', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeNode_VCLuaSetHeight(L: Plua_State): Integer; cdecl;
var
	lTreeNode:TLuaTreeNode;
	val:integer;
begin
	lTreeNode := TLuaTreeNode(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lTreeNode.Height := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeNode', 'SetHeight', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeNode_VCLuaGetHeight(L: Plua_State): Integer; cdecl;
var
	lTreeNode:TLuaTreeNode;
	ret:integer;
begin
	lTreeNode := TLuaTreeNode(GetLuaObjectUnsafe(L, 1));
	try
		ret := lTreeNode.Height;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeNode', 'GetHeight', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeNode_VCLuaSetImageIndex(L: Plua_State): Integer; cdecl;
var
	lTreeNode:TLuaTreeNode;
	val:TImageIndex;
begin
	lTreeNode := TLuaTreeNode(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lTreeNode.ImageIndex := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeNode', 'SetImageIndex', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeNode_VCLuaGetImageIndex(L: Plua_State): Integer; cdecl;
var
	lTreeNode:TLuaTreeNode;
	ret:TImageIndex;
begin
	lTreeNode := TLuaTreeNode(GetLuaObjectUnsafe(L, 1));
	try
		ret := lTreeNode.ImageIndex;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeNode', 'GetImageIndex', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeNode_VCLuaSetIndex(L: Plua_State): Integer; cdecl;
var
	lTreeNode:TLuaTreeNode;
	val:Integer;
begin
	lTreeNode := TLuaTreeNode(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lTreeNode.Index := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeNode', 'SetIndex', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeNode_VCLuaGetIndex(L: Plua_State): Integer; cdecl;
var
	lTreeNode:TLuaTreeNode;
	ret:Integer;
begin
	lTreeNode := TLuaTreeNode(GetLuaObjectUnsafe(L, 1));
	try
		ret := lTreeNode.Index;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeNode', 'GetIndex', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeNode_VCLuaGetIsFullHeightVisible(L: Plua_State): Integer; cdecl;
var
	lTreeNode:TLuaTreeNode;
	ret:Boolean;
begin
	lTreeNode := TLuaTreeNode(GetLuaObjectUnsafe(L, 1));
	try
		ret := lTreeNode.IsFullHeightVisible;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeNode', 'GetIsFullHeightVisible', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeNode_VCLuaGetIsVisible(L: Plua_State): Integer; cdecl;
var
	lTreeNode:TLuaTreeNode;
	ret:Boolean;
begin
	lTreeNode := TLuaTreeNode(GetLuaObjectUnsafe(L, 1));
	try
		ret := lTreeNode.IsVisible;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeNode', 'GetIsVisible', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeNode_Items(L: Plua_State): Integer; cdecl;
var
	lTreeNode:TLuaTreeNode;
	ItemIndex:Integer;
	ret:TTreeNode;
begin
	CheckArg(L, 2, 3);
	lTreeNode := TLuaTreeNode(CheckLuaObjectPop(L, 1));
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

function VCLua_TreeNode_VCLuaGetLevel(L: Plua_State): Integer; cdecl;
var
	lTreeNode:TLuaTreeNode;
	ret:Integer;
begin
	lTreeNode := TLuaTreeNode(GetLuaObjectUnsafe(L, 1));
	try
		ret := lTreeNode.Level;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeNode', 'GetLevel', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeNode_VCLuaSetMultiSelected(L: Plua_State): Integer; cdecl;
var
	lTreeNode:TLuaTreeNode;
	val:Boolean;
begin
	lTreeNode := TLuaTreeNode(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lTreeNode.MultiSelected := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeNode', 'SetMultiSelected', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeNode_VCLuaGetMultiSelected(L: Plua_State): Integer; cdecl;
var
	lTreeNode:TLuaTreeNode;
	ret:Boolean;
begin
	lTreeNode := TLuaTreeNode(GetLuaObjectUnsafe(L, 1));
	try
		ret := lTreeNode.MultiSelected;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeNode', 'GetMultiSelected', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeNode_VCLuaSetNodeEffect(L: Plua_State): Integer; cdecl;
var
	lTreeNode:TLuaTreeNode;
	val:TGraphicsDrawEffect;
begin
	lTreeNode := TLuaTreeNode(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val,TypeInfo(TGraphicsDrawEffect));
	try
		lTreeNode.NodeEffect := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeNode', 'SetNodeEffect', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeNode_VCLuaGetNodeEffect(L: Plua_State): Integer; cdecl;
var
	lTreeNode:TLuaTreeNode;
	ret:TGraphicsDrawEffect;
begin
	lTreeNode := TLuaTreeNode(GetLuaObjectUnsafe(L, 1));
	try
		ret := lTreeNode.NodeEffect;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeNode', 'GetNodeEffect', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_TreeNode_VCLuaSetOverlayIndex(L: Plua_State): Integer; cdecl;
var
	lTreeNode:TLuaTreeNode;
	val:Integer;
begin
	lTreeNode := TLuaTreeNode(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lTreeNode.OverlayIndex := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeNode', 'SetOverlayIndex', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeNode_VCLuaGetOverlayIndex(L: Plua_State): Integer; cdecl;
var
	lTreeNode:TLuaTreeNode;
	ret:Integer;
begin
	lTreeNode := TLuaTreeNode(GetLuaObjectUnsafe(L, 1));
	try
		ret := lTreeNode.OverlayIndex;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeNode', 'GetOverlayIndex', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeNode_VCLuaGetOwner(L: Plua_State): Integer; cdecl;
var
	lTreeNode:TLuaTreeNode;
	ret:TTreeNodes;
begin
	lTreeNode := TLuaTreeNode(GetLuaObjectUnsafe(L, 1));
	try
		ret := lTreeNode.Owner;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeNode', 'GetOwner', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeNode_VCLuaGetParent(L: Plua_State): Integer; cdecl;
var
	lTreeNode:TLuaTreeNode;
	ret:TTreeNode;
begin
	lTreeNode := TLuaTreeNode(GetLuaObjectUnsafe(L, 1));
	try
		ret := lTreeNode.Parent;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeNode', 'GetParent', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeNode_VCLuaSetSelected(L: Plua_State): Integer; cdecl;
var
	lTreeNode:TLuaTreeNode;
	val:Boolean;
begin
	lTreeNode := TLuaTreeNode(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lTreeNode.Selected := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeNode', 'SetSelected', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeNode_VCLuaGetSelected(L: Plua_State): Integer; cdecl;
var
	lTreeNode:TLuaTreeNode;
	ret:Boolean;
begin
	lTreeNode := TLuaTreeNode(GetLuaObjectUnsafe(L, 1));
	try
		ret := lTreeNode.Selected;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeNode', 'GetSelected', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeNode_VCLuaSetSelectedIndex(L: Plua_State): Integer; cdecl;
var
	lTreeNode:TLuaTreeNode;
	val:Integer;
begin
	lTreeNode := TLuaTreeNode(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lTreeNode.SelectedIndex := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeNode', 'SetSelectedIndex', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeNode_VCLuaGetSelectedIndex(L: Plua_State): Integer; cdecl;
var
	lTreeNode:TLuaTreeNode;
	ret:Integer;
begin
	lTreeNode := TLuaTreeNode(GetLuaObjectUnsafe(L, 1));
	try
		ret := lTreeNode.SelectedIndex;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeNode', 'GetSelectedIndex', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeNode_VCLuaSetStateIndex(L: Plua_State): Integer; cdecl;
var
	lTreeNode:TLuaTreeNode;
	val:Integer;
begin
	lTreeNode := TLuaTreeNode(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lTreeNode.StateIndex := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeNode', 'SetStateIndex', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeNode_VCLuaGetStateIndex(L: Plua_State): Integer; cdecl;
var
	lTreeNode:TLuaTreeNode;
	ret:Integer;
begin
	lTreeNode := TLuaTreeNode(GetLuaObjectUnsafe(L, 1));
	try
		ret := lTreeNode.StateIndex;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeNode', 'GetStateIndex', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeNode_VCLuaGetStates(L: Plua_State): Integer; cdecl;
var
	lTreeNode:TLuaTreeNode;
	ret:TNodeStates;
begin
	lTreeNode := TLuaTreeNode(GetLuaObjectUnsafe(L, 1));
	try
		ret := lTreeNode.States;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeNode', 'GetStates', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_TreeNode_VCLuaGetSubTreeCount(L: Plua_State): Integer; cdecl;
var
	lTreeNode:TLuaTreeNode;
	ret:integer;
begin
	lTreeNode := TLuaTreeNode(GetLuaObjectUnsafe(L, 1));
	try
		ret := lTreeNode.SubTreeCount;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeNode', 'GetSubTreeCount', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeNode_VCLuaSetText(L: Plua_State): Integer; cdecl;
var
	lTreeNode:TLuaTreeNode;
	val:string;
begin
	lTreeNode := TLuaTreeNode(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lTreeNode.Text := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeNode', 'SetText', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeNode_VCLuaGetText(L: Plua_State): Integer; cdecl;
var
	lTreeNode:TLuaTreeNode;
	ret:string;
begin
	lTreeNode := TLuaTreeNode(GetLuaObjectUnsafe(L, 1));
	try
		ret := lTreeNode.Text;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeNode', 'GetText', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeNode_VCLuaGetTop(L: Plua_State): Integer; cdecl;
var
	lTreeNode:TLuaTreeNode;
	ret:integer;
begin
	lTreeNode := TLuaTreeNode(GetLuaObjectUnsafe(L, 1));
	try
		ret := lTreeNode.Top;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeNode', 'GetTop', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeNode_VCLuaGetTreeNodes(L: Plua_State): Integer; cdecl;
var
	lTreeNode:TLuaTreeNode;
	ret:TTreeNodes;
begin
	lTreeNode := TLuaTreeNode(GetLuaObjectUnsafe(L, 1));
	try
		ret := lTreeNode.TreeNodes;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeNode', 'GetTreeNodes', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeNode_VCLuaGetTreeView(L: Plua_State): Integer; cdecl;
var
	lTreeNode:TLuaTreeNode;
	ret:TCustomTreeView;
begin
	lTreeNode := TLuaTreeNode(GetLuaObjectUnsafe(L, 1));
	try
		ret := lTreeNode.TreeView;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeNode', 'GetTreeView', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_TreeNode_VCLuaSetVisible(L: Plua_State): Integer; cdecl;
var
	lTreeNode:TLuaTreeNode;
	val:Boolean;
begin
	lTreeNode := TLuaTreeNode(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lTreeNode.Visible := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeNode', 'SetVisible', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeNode_VCLuaGetVisible(L: Plua_State): Integer; cdecl;
var
	lTreeNode:TLuaTreeNode;
	ret:Boolean;
begin
	lTreeNode := TLuaTreeNode(GetLuaObjectUnsafe(L, 1));
	try
		ret := lTreeNode.Visible;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeNode', 'GetVisible', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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
	Data := lua_touserdata(L,4);
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
	Data := lua_touserdata(L,4);
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
	Ptr := lua_touserdata(L,5);
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
	Data := lua_touserdata(L,4);
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
	Data := lua_touserdata(L,4);
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
	NodeData := lua_touserdata(L,2);
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

function VCLua_TreeNodes_GetLastExpandedSubNode(L: Plua_State): Integer; cdecl;
var
	lTreeNodes:TLuaTreeNodes;
	ret:TTreeNode;
begin
	CheckArg(L, 1);
	lTreeNodes := TLuaTreeNodes(GetLuaObject(L, 1));
	try
		ret := lTreeNodes.GetLastExpandedSubNode();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeNodes', 'GetLastExpandedSubNode', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeNodes_GetLastNode(L: Plua_State): Integer; cdecl;
var
	lTreeNodes:TLuaTreeNodes;
	ret:TTreeNode;
begin
	CheckArg(L, 1);
	lTreeNodes := TLuaTreeNodes(GetLuaObject(L, 1));
	try
		ret := lTreeNodes.GetLastNode();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeNodes', 'GetLastNode', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeNodes_GetLastSubNode(L: Plua_State): Integer; cdecl;
var
	lTreeNodes:TLuaTreeNodes;
	ret:TTreeNode;
begin
	CheckArg(L, 1);
	lTreeNodes := TLuaTreeNodes(GetLuaObject(L, 1));
	try
		ret := lTreeNodes.GetLastSubNode();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeNodes', 'GetLastSubNode', E.ClassName, E.Message);
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
	Data := lua_touserdata(L,4);
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
	Data := lua_touserdata(L,4);
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
	lTreeNodes := TLuaTreeNodes(CheckLuaObjectPop(L, 1));
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

function VCLua_TreeNodes_VCLuaGetCount(L: Plua_State): Integer; cdecl;
var
	lTreeNodes:TLuaTreeNodes;
	ret:Integer;
begin
	lTreeNodes := TLuaTreeNodes(GetLuaObjectUnsafe(L, 1));
	try
		ret := lTreeNodes.Count;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeNodes', 'GetCount', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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

function VCLua_TreeNodes_VCLuaSetKeepCollapsedNodes(L: Plua_State): Integer; cdecl;
var
	lTreeNodes:TLuaTreeNodes;
	val:boolean;
begin
	lTreeNodes := TLuaTreeNodes(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lTreeNodes.KeepCollapsedNodes := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeNodes', 'SetKeepCollapsedNodes', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeNodes_VCLuaGetKeepCollapsedNodes(L: Plua_State): Integer; cdecl;
var
	lTreeNodes:TLuaTreeNodes;
	ret:boolean;
begin
	lTreeNodes := TLuaTreeNodes(GetLuaObjectUnsafe(L, 1));
	try
		ret := lTreeNodes.KeepCollapsedNodes;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeNodes', 'GetKeepCollapsedNodes', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeNodes_VCLuaGetOwner(L: Plua_State): Integer; cdecl;
var
	lTreeNodes:TLuaTreeNodes;
	ret:TCustomTreeView;
begin
	lTreeNodes := TLuaTreeNodes(GetLuaObjectUnsafe(L, 1));
	try
		ret := lTreeNodes.Owner;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeNodes', 'GetOwner', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_TreeNodes_VCLuaGetSelectionCount(L: Plua_State): Integer; cdecl;
var
	lTreeNodes:TLuaTreeNodes;
	ret:Cardinal;
begin
	lTreeNodes := TLuaTreeNodes(GetLuaObjectUnsafe(L, 1));
	try
		ret := lTreeNodes.SelectionCount;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeNodes', 'GetSelectionCount', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeNodes_VCLuaGetTopLvlCount(L: Plua_State): Integer; cdecl;
var
	lTreeNodes:TLuaTreeNodes;
	ret:integer;
begin
	lTreeNodes := TLuaTreeNodes(GetLuaObjectUnsafe(L, 1));
	try
		ret := lTreeNodes.TopLvlCount;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeNodes', 'GetTopLvlCount', E.ClassName, E.Message);
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
	lTreeNodes := TLuaTreeNodes(CheckLuaObjectPop(L, 1));
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
	lTreeView := TLuaTreeView(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lTreeView.AccessibilityOn := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'SetAccessibilityOn', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeView_VCLuaGetAccessibilityOn(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	ret:Boolean;
begin
	lTreeView := TLuaTreeView(GetLuaObjectUnsafe(L, 1));
	try
		ret := lTreeView.AccessibilityOn;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'GetAccessibilityOn', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeView_VCLuaSetOnAddition(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
begin
	lTreeView := TLuaTreeView(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lTreeView.OnAddition));
	lTreeView.OnAddition := TLuaEvent.Factory<TTVExpandedEvent,TLuaTVExpandedEvent>(L);
	Result := 0;
end;

function VCLua_TreeView_VCLuaSetOnAdvancedCustomDraw(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
begin
	lTreeView := TLuaTreeView(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lTreeView.OnAdvancedCustomDraw));
	lTreeView.OnAdvancedCustomDraw := TLuaEvent.Factory<TTVAdvancedCustomDrawEvent,TLuaTVAdvancedCustomDrawEvent>(L);
	Result := 0;
end;

function VCLua_TreeView_VCLuaSetOnAdvancedCustomDrawItem(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
begin
	lTreeView := TLuaTreeView(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lTreeView.OnAdvancedCustomDrawItem));
	lTreeView.OnAdvancedCustomDrawItem := TLuaEvent.Factory<TTVAdvancedCustomDrawItemEvent,TLuaTVAdvancedCustomDrawItemEvent>(L);
	Result := 0;
end;

function VCLua_TreeView_VCLuaSetOnChange(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
begin
	lTreeView := TLuaTreeView(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lTreeView.OnChange));
	lTreeView.OnChange := TLuaEvent.Factory<TTVChangedEvent,TLuaTVChangedEvent>(L);
	Result := 0;
end;

function VCLua_TreeView_VCLuaSetOnChanging(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
begin
	lTreeView := TLuaTreeView(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lTreeView.OnChanging));
	lTreeView.OnChanging := TLuaEvent.Factory<TTVChangingEvent,TLuaTVChangingEvent>(L);
	Result := 0;
end;

function VCLua_TreeView_VCLuaSetOnCollapsed(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
begin
	lTreeView := TLuaTreeView(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lTreeView.OnCollapsed));
	lTreeView.OnCollapsed := TLuaEvent.Factory<TTVExpandedEvent,TLuaTVExpandedEvent>(L);
	Result := 0;
end;

function VCLua_TreeView_VCLuaSetOnCollapsing(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
begin
	lTreeView := TLuaTreeView(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lTreeView.OnCollapsing));
	lTreeView.OnCollapsing := TLuaEvent.Factory<TTVCollapsingEvent,TLuaTVCollapsingEvent>(L);
	Result := 0;
end;

function VCLua_TreeView_VCLuaSetOnCompare(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
begin
	lTreeView := TLuaTreeView(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lTreeView.OnCompare));
	lTreeView.OnCompare := TLuaEvent.Factory<TTVCompareEvent,TLuaTVCompareEvent>(L);
	Result := 0;
end;

function VCLua_TreeView_VCLuaSetOnCustomCreateItem(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
begin
	lTreeView := TLuaTreeView(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lTreeView.OnCustomCreateItem));
	lTreeView.OnCustomCreateItem := TLuaEvent.Factory<TTVCustomCreateNodeEvent,TLuaTVCustomCreateNodeEvent>(L);
	Result := 0;
end;

function VCLua_TreeView_VCLuaSetOnCustomDraw(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
begin
	lTreeView := TLuaTreeView(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lTreeView.OnCustomDraw));
	lTreeView.OnCustomDraw := TLuaEvent.Factory<TTVCustomDrawEvent,TLuaTVCustomDrawEvent>(L);
	Result := 0;
end;

function VCLua_TreeView_VCLuaSetOnCustomDrawItem(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
begin
	lTreeView := TLuaTreeView(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lTreeView.OnCustomDrawItem));
	lTreeView.OnCustomDrawItem := TLuaEvent.Factory<TTVCustomDrawItemEvent,TLuaTVCustomDrawItemEvent>(L);
	Result := 0;
end;

function VCLua_TreeView_VCLuaSetOnCustomDrawArrow(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
begin
	lTreeView := TLuaTreeView(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lTreeView.OnCustomDrawArrow));
	lTreeView.OnCustomDrawArrow := TLuaEvent.Factory<TTVCustomDrawArrowEvent,TLuaTVCustomDrawArrowEvent>(L);
	Result := 0;
end;

function VCLua_TreeView_VCLuaSetOnDeletion(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
begin
	lTreeView := TLuaTreeView(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lTreeView.OnDeletion));
	lTreeView.OnDeletion := TLuaEvent.Factory<TTVExpandedEvent,TLuaTVExpandedEvent>(L);
	Result := 0;
end;

function VCLua_TreeView_VCLuaSetOnEdited(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
begin
	lTreeView := TLuaTreeView(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lTreeView.OnEdited));
	lTreeView.OnEdited := TLuaEvent.Factory<TTVEditedEvent,TLuaTVEditedEvent>(L);
	Result := 0;
end;

function VCLua_TreeView_VCLuaSetOnEditing(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
begin
	lTreeView := TLuaTreeView(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lTreeView.OnEditing));
	lTreeView.OnEditing := TLuaEvent.Factory<TTVEditingEvent,TLuaTVEditingEvent>(L);
	Result := 0;
end;

function VCLua_TreeView_VCLuaSetOnEditingEnd(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
begin
	lTreeView := TLuaTreeView(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lTreeView.OnEditingEnd));
	lTreeView.OnEditingEnd := TLuaEvent.Factory<TTVEditingEndEvent,TLuaTVEditingEndEvent>(L);
	Result := 0;
end;

function VCLua_TreeView_VCLuaSetOnExpanded(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
begin
	lTreeView := TLuaTreeView(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lTreeView.OnExpanded));
	lTreeView.OnExpanded := TLuaEvent.Factory<TTVExpandedEvent,TLuaTVExpandedEvent>(L);
	Result := 0;
end;

function VCLua_TreeView_VCLuaSetOnExpanding(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
begin
	lTreeView := TLuaTreeView(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lTreeView.OnExpanding));
	lTreeView.OnExpanding := TLuaEvent.Factory<TTVExpandingEvent,TLuaTVExpandingEvent>(L);
	Result := 0;
end;

function VCLua_TreeView_VCLuaSetOnGetImageIndex(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
begin
	lTreeView := TLuaTreeView(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lTreeView.OnGetImageIndex));
	lTreeView.OnGetImageIndex := TLuaEvent.Factory<TTVExpandedEvent,TLuaTVExpandedEvent>(L);
	Result := 0;
end;

function VCLua_TreeView_VCLuaSetOnGetSelectedIndex(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
begin
	lTreeView := TLuaTreeView(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lTreeView.OnGetSelectedIndex));
	lTreeView.OnGetSelectedIndex := TLuaEvent.Factory<TTVExpandedEvent,TLuaTVExpandedEvent>(L);
	Result := 0;
end;

function VCLua_TreeView_VCLuaSetOnNodeChanged(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
begin
	lTreeView := TLuaTreeView(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lTreeView.OnNodeChanged));
	lTreeView.OnNodeChanged := TLuaEvent.Factory<TTVNodeChangedEvent,TLuaTVNodeChangedEvent>(L);
	Result := 0;
end;

function VCLua_TreeView_VCLuaSetOnSelectionChanged(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
begin
	lTreeView := TLuaTreeView(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lTreeView.OnSelectionChanged));
	lTreeView.OnSelectionChanged := TLuaEvent.Factory<TNotifyEvent,TLuaNotifyEvent>(L);
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
	lTreeView := TLuaTreeView(CheckLuaObjectPop(L, 1));
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
	lTreeView := TLuaTreeView(CheckLuaObjectPop(L, 1));
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
	ASelectionNeedsFree:Boolean = False;
begin
	CheckArg(L, 2, 3);
	lTreeView := TLuaTreeView(CheckLuaObjectPop(L, 1));
	ASelectionNeedsFree := luaL_checkOrFromTable(L,2,@ASelection,@luaL_checkStringList,TypeInfo(ASelection));
	TTrait<boolean>.luaL_optcheck(L, 3, @FreeList, True);
	try
		lTreeView.ApplyStoredSelection(ASelection,FreeList);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'ApplyStoredSelection', E.ClassName, E.Message);
	end;
	if ASelectionNeedsFree then ASelection.Free;
end;

function VCLua_TreeView_MoveToNextNode(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	ASelect:Boolean;
begin
	CheckArg(L, 1, 2);
	lTreeView := TLuaTreeView(CheckLuaObjectPop(L, 1));
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
	lTreeView := TLuaTreeView(CheckLuaObjectPop(L, 1));
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
	lTreeView := TLuaTreeView(CheckLuaObjectPop(L, 1));
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
	lTreeView := TLuaTreeView(CheckLuaObjectPop(L, 1));
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
	lTreeView := TLuaTreeView(CheckLuaObjectPop(L, 1));
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
	lTreeView := TLuaTreeView(CheckLuaObjectPop(L, 1));
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
	lTreeView := TLuaTreeView(GetLuaObjectUnsafe(L, 1));
	val := luaL_checkColor(L,2);
	try
		lTreeView.BackgroundColor := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'SetBackgroundColor', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeView_VCLuaGetBackgroundColor(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	ret:TColor;
begin
	lTreeView := TLuaTreeView(GetLuaObjectUnsafe(L, 1));
	try
		ret := lTreeView.BackgroundColor;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'GetBackgroundColor', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeView_VCLuaSetBottomItem(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	val:TTreeNode;
begin
	lTreeView := TLuaTreeView(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lTreeView.BottomItem := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'SetBottomItem', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeView_VCLuaGetBottomItem(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	ret:TTreeNode;
begin
	lTreeView := TLuaTreeView(GetLuaObjectUnsafe(L, 1));
	try
		ret := lTreeView.BottomItem;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'GetBottomItem', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeView_VCLuaSetDefaultItemHeight(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	val:integer;
begin
	lTreeView := TLuaTreeView(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lTreeView.DefaultItemHeight := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'SetDefaultItemHeight', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeView_VCLuaGetDefaultItemHeight(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	ret:integer;
begin
	lTreeView := TLuaTreeView(GetLuaObjectUnsafe(L, 1));
	try
		ret := lTreeView.DefaultItemHeight;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'GetDefaultItemHeight', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeView_VCLuaSetDropTarget(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	val:TTreeNode;
begin
	lTreeView := TLuaTreeView(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lTreeView.DropTarget := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'SetDropTarget', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeView_VCLuaGetDropTarget(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	ret:TTreeNode;
begin
	lTreeView := TLuaTreeView(GetLuaObjectUnsafe(L, 1));
	try
		ret := lTreeView.DropTarget;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'GetDropTarget', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeView_VCLuaSetExpandSignColor(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	val:TColor;
begin
	lTreeView := TLuaTreeView(GetLuaObjectUnsafe(L, 1));
	val := luaL_checkColor(L,2);
	try
		lTreeView.ExpandSignColor := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'SetExpandSignColor', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeView_VCLuaGetExpandSignColor(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	ret:TColor;
begin
	lTreeView := TLuaTreeView(GetLuaObjectUnsafe(L, 1));
	try
		ret := lTreeView.ExpandSignColor;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'GetExpandSignColor', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeView_VCLuaSetExpandSignSize(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	val:integer;
begin
	lTreeView := TLuaTreeView(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lTreeView.ExpandSignSize := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'SetExpandSignSize', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeView_VCLuaGetExpandSignSize(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	ret:integer;
begin
	lTreeView := TLuaTreeView(GetLuaObjectUnsafe(L, 1));
	try
		ret := lTreeView.ExpandSignSize;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'GetExpandSignSize', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeView_VCLuaSetExpandSignType(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	val:TTreeViewExpandSignType;
begin
	lTreeView := TLuaTreeView(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val,TypeInfo(TTreeViewExpandSignType));
	try
		lTreeView.ExpandSignType := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'SetExpandSignType', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeView_VCLuaGetExpandSignType(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	ret:TTreeViewExpandSignType;
begin
	lTreeView := TLuaTreeView(GetLuaObjectUnsafe(L, 1));
	try
		ret := lTreeView.ExpandSignType;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'GetExpandSignType', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_TreeView_VCLuaSetImages(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	val:TCustomImageList;
begin
	lTreeView := TLuaTreeView(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lTreeView.Images := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'SetImages', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeView_VCLuaGetImages(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	ret:TCustomImageList;
begin
	lTreeView := TLuaTreeView(GetLuaObjectUnsafe(L, 1));
	try
		ret := lTreeView.Images;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'GetImages', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_TreeView_VCLuaSetImagesWidth(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	val:Integer;
begin
	lTreeView := TLuaTreeView(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lTreeView.ImagesWidth := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'SetImagesWidth', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeView_VCLuaGetImagesWidth(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	ret:Integer;
begin
	lTreeView := TLuaTreeView(GetLuaObjectUnsafe(L, 1));
	try
		ret := lTreeView.ImagesWidth;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'GetImagesWidth', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeView_VCLuaSetInsertMarkNode(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	val:TTreeNode;
begin
	lTreeView := TLuaTreeView(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lTreeView.InsertMarkNode := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'SetInsertMarkNode', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeView_VCLuaGetInsertMarkNode(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	ret:TTreeNode;
begin
	lTreeView := TLuaTreeView(GetLuaObjectUnsafe(L, 1));
	try
		ret := lTreeView.InsertMarkNode;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'GetInsertMarkNode', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeView_VCLuaSetInsertMarkType(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	val:TTreeViewInsertMarkType;
begin
	lTreeView := TLuaTreeView(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val,TypeInfo(TTreeViewInsertMarkType));
	try
		lTreeView.InsertMarkType := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'SetInsertMarkType', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeView_VCLuaGetInsertMarkType(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	ret:TTreeViewInsertMarkType;
begin
	lTreeView := TLuaTreeView(GetLuaObjectUnsafe(L, 1));
	try
		ret := lTreeView.InsertMarkType;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'GetInsertMarkType', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_TreeView_VCLuaSetItems(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	val:TTreeNodes;
begin
	lTreeView := TLuaTreeView(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lTreeView.Items := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'SetItems', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeView_VCLuaGetItems(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	ret:TTreeNodes;
begin
	lTreeView := TLuaTreeView(GetLuaObjectUnsafe(L, 1));
	try
		ret := lTreeView.Items;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'GetItems', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeView_VCLuaSetKeepCollapsedNodes(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	val:boolean;
begin
	lTreeView := TLuaTreeView(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lTreeView.KeepCollapsedNodes := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'SetKeepCollapsedNodes', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeView_VCLuaGetKeepCollapsedNodes(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	ret:boolean;
begin
	lTreeView := TLuaTreeView(GetLuaObjectUnsafe(L, 1));
	try
		ret := lTreeView.KeepCollapsedNodes;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'GetKeepCollapsedNodes', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeView_VCLuaSetMultiSelectStyle(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	val:TMultiSelectStyle;
begin
	lTreeView := TLuaTreeView(GetLuaObjectUnsafe(L, 1));
	luaL_checkSet(L,2,@val,TypeInfo(TMultiSelectStyle));
	try
		lTreeView.MultiSelectStyle := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'SetMultiSelectStyle', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeView_VCLuaGetMultiSelectStyle(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	ret:TMultiSelectStyle;
begin
	lTreeView := TLuaTreeView(GetLuaObjectUnsafe(L, 1));
	try
		ret := lTreeView.MultiSelectStyle;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'GetMultiSelectStyle', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_TreeView_VCLuaSetOptions(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	val:TTreeViewOptions;
begin
	lTreeView := TLuaTreeView(GetLuaObjectUnsafe(L, 1));
	luaL_checkSet(L,2,@val,TypeInfo(TTreeViewOptions));
	try
		lTreeView.Options := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'SetOptions', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeView_VCLuaGetOptions(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	ret:TTreeViewOptions;
begin
	lTreeView := TLuaTreeView(GetLuaObjectUnsafe(L, 1));
	try
		ret := lTreeView.Options;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'GetOptions', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_TreeView_VCLuaSetScrollBars(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	val:TScrollStyle;
begin
	lTreeView := TLuaTreeView(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val,TypeInfo(TScrollStyle));
	try
		lTreeView.ScrollBars := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'SetScrollBars', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeView_VCLuaGetScrollBars(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	ret:TScrollStyle;
begin
	lTreeView := TLuaTreeView(GetLuaObjectUnsafe(L, 1));
	try
		ret := lTreeView.ScrollBars;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'GetScrollBars', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_TreeView_VCLuaSetSelected(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	val:TTreeNode;
begin
	lTreeView := TLuaTreeView(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lTreeView.Selected := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'SetSelected', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeView_VCLuaGetSelected(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	ret:TTreeNode;
begin
	lTreeView := TLuaTreeView(GetLuaObjectUnsafe(L, 1));
	try
		ret := lTreeView.Selected;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'GetSelected', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeView_VCLuaSetSelectionColor(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	val:TColor;
begin
	lTreeView := TLuaTreeView(GetLuaObjectUnsafe(L, 1));
	val := luaL_checkColor(L,2);
	try
		lTreeView.SelectionColor := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'SetSelectionColor', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeView_VCLuaGetSelectionColor(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	ret:TColor;
begin
	lTreeView := TLuaTreeView(GetLuaObjectUnsafe(L, 1));
	try
		ret := lTreeView.SelectionColor;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'GetSelectionColor', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeView_VCLuaGetSelectionCount(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	ret:Cardinal;
begin
	lTreeView := TLuaTreeView(GetLuaObjectUnsafe(L, 1));
	try
		ret := lTreeView.SelectionCount;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'GetSelectionCount', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeView_VCLuaSetSelectionFontColor(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	val:TColor;
begin
	lTreeView := TLuaTreeView(GetLuaObjectUnsafe(L, 1));
	val := luaL_checkColor(L,2);
	try
		lTreeView.SelectionFontColor := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'SetSelectionFontColor', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeView_VCLuaGetSelectionFontColor(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	ret:TColor;
begin
	lTreeView := TLuaTreeView(GetLuaObjectUnsafe(L, 1));
	try
		ret := lTreeView.SelectionFontColor;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'GetSelectionFontColor', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeView_VCLuaSetSelectionFontColorUsed(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	val:boolean;
begin
	lTreeView := TLuaTreeView(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lTreeView.SelectionFontColorUsed := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'SetSelectionFontColorUsed', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeView_VCLuaGetSelectionFontColorUsed(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	ret:boolean;
begin
	lTreeView := TLuaTreeView(GetLuaObjectUnsafe(L, 1));
	try
		ret := lTreeView.SelectionFontColorUsed;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'GetSelectionFontColorUsed', E.ClassName, E.Message);
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
	lTreeView := TLuaTreeView(GetLuaObjectUnsafe(L, 1));
	val := luaL_checkColor(L,2);
	try
		lTreeView.SeparatorColor := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'SetSeparatorColor', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeView_VCLuaGetSeparatorColor(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	ret:TColor;
begin
	lTreeView := TLuaTreeView(GetLuaObjectUnsafe(L, 1));
	try
		ret := lTreeView.SeparatorColor;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'GetSeparatorColor', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeView_VCLuaSetStateImages(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	val:TCustomImageList;
begin
	lTreeView := TLuaTreeView(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lTreeView.StateImages := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'SetStateImages', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeView_VCLuaGetStateImages(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	ret:TCustomImageList;
begin
	lTreeView := TLuaTreeView(GetLuaObjectUnsafe(L, 1));
	try
		ret := lTreeView.StateImages;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'GetStateImages', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_TreeView_VCLuaSetStateImagesWidth(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	val:Integer;
begin
	lTreeView := TLuaTreeView(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lTreeView.StateImagesWidth := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'SetStateImagesWidth', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeView_VCLuaGetStateImagesWidth(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	ret:Integer;
begin
	lTreeView := TLuaTreeView(GetLuaObjectUnsafe(L, 1));
	try
		ret := lTreeView.StateImagesWidth;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'GetStateImagesWidth', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeView_VCLuaSetTopItem(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	val:TTreeNode;
begin
	lTreeView := TLuaTreeView(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lTreeView.TopItem := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'SetTopItem', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeView_VCLuaGetTopItem(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	ret:TTreeNode;
begin
	lTreeView := TLuaTreeView(GetLuaObjectUnsafe(L, 1));
	try
		ret := lTreeView.TopItem;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'GetTopItem', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeView_VCLuaSetTreeLineColor(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	val:TColor;
begin
	lTreeView := TLuaTreeView(GetLuaObjectUnsafe(L, 1));
	val := luaL_checkColor(L,2);
	try
		lTreeView.TreeLineColor := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'SetTreeLineColor', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeView_VCLuaGetTreeLineColor(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	ret:TColor;
begin
	lTreeView := TLuaTreeView(GetLuaObjectUnsafe(L, 1));
	try
		ret := lTreeView.TreeLineColor;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'GetTreeLineColor', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TreeView_VCLuaSetTreeLinePenStyle(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	val:TPenStyle;
begin
	lTreeView := TLuaTreeView(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val,TypeInfo(TPenStyle));
	try
		lTreeView.TreeLinePenStyle := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'SetTreeLinePenStyle', E.ClassName, E.Message);
	end;
end;

function VCLua_TreeView_VCLuaGetTreeLinePenStyle(L: Plua_State): Integer; cdecl;
var
	lTreeView:TLuaTreeView;
	ret:TPenStyle;
begin
	lTreeView := TLuaTreeView(GetLuaObjectUnsafe(L, 1));
	try
		ret := lTreeView.TreeLinePenStyle;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TreeView', 'GetTreeLinePenStyle', E.ClassName, E.Message);
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
	try
	GetControlParents(L,TWinControl(Parent),Name);
	lTreeView := TLuaTreeView.Create(Parent);
	lTreeView.Parent := TWinControl(Parent);
	CreateTableForKnownType(L,'TCustomTreeView',lTreeView);
	InitControl(L,lTreeView,Name);
	Result := 1;
	except
		on E: Exception do
			CallError(L, 'VCL', 'TreeView', E.ClassName, E.Message);
	end;
end;

begin
	TreeNodeFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(TreeNodeFuncs, 'AlphaSort', @VCLua_TreeNode_AlphaSort);
	TLuaMethodInfo.Create(TreeNodeFuncs, 'Bottom', @VCLua_TreeNode_Bottom);
	TLuaMethodInfo.Create(TreeNodeFuncs, 'BottomExpanded', @VCLua_TreeNode_BottomExpanded);
	TLuaMethodInfo.Create(TreeNodeFuncs, 'DefaultTreeViewSort', @VCLua_TreeNode_DefaultTreeViewSort);
	TLuaMethodInfo.Create(TreeNodeFuncs, 'DisplayExpandSignLeft', @VCLua_TreeNode_DisplayExpandSignLeft);
	TLuaMethodInfo.Create(TreeNodeFuncs, 'DisplayExpandSignRect', @VCLua_TreeNode_DisplayExpandSignRect);
	TLuaMethodInfo.Create(TreeNodeFuncs, 'DisplayExpandSignRight', @VCLua_TreeNode_DisplayExpandSignRight);
	TLuaMethodInfo.Create(TreeNodeFuncs, 'DisplayIconLeft', @VCLua_TreeNode_DisplayIconLeft);
	TLuaMethodInfo.Create(TreeNodeFuncs, 'DisplayRect', @VCLua_TreeNode_DisplayRect);
	TLuaMethodInfo.Create(TreeNodeFuncs, 'DisplayStateIconLeft', @VCLua_TreeNode_DisplayStateIconLeft);
	TLuaMethodInfo.Create(TreeNodeFuncs, 'DisplayTextLeft', @VCLua_TreeNode_DisplayTextLeft);
	TLuaMethodInfo.Create(TreeNodeFuncs, 'DisplayTextRight', @VCLua_TreeNode_DisplayTextRight);
	TLuaMethodInfo.Create(TreeNodeFuncs, 'EditText', @VCLua_TreeNode_EditText);
	TLuaMethodInfo.Create(TreeNodeFuncs, 'FindNode', @VCLua_TreeNode_FindNode);
	TLuaMethodInfo.Create(TreeNodeFuncs, 'GetFirstChild', @VCLua_TreeNode_GetFirstChild);
	TLuaMethodInfo.Create(TreeNodeFuncs, 'GetFirstSibling', @VCLua_TreeNode_GetFirstSibling);
	TLuaMethodInfo.Create(TreeNodeFuncs, 'GetFirstVisibleChild', @VCLua_TreeNode_GetFirstVisibleChild);
	TLuaMethodInfo.Create(TreeNodeFuncs, 'GetHandle', @VCLua_TreeNode_GetHandle);
	TLuaMethodInfo.Create(TreeNodeFuncs, 'GetLastChild', @VCLua_TreeNode_GetLastChild);
	TLuaMethodInfo.Create(TreeNodeFuncs, 'GetLastSibling', @VCLua_TreeNode_GetLastSibling);
	TLuaMethodInfo.Create(TreeNodeFuncs, 'GetLastSubChild', @VCLua_TreeNode_GetLastSubChild);
	TLuaMethodInfo.Create(TreeNodeFuncs, 'GetLastVisibleChild', @VCLua_TreeNode_GetLastVisibleChild);
	TLuaMethodInfo.Create(TreeNodeFuncs, 'GetNext', @VCLua_TreeNode_GetNext);
	TLuaMethodInfo.Create(TreeNodeFuncs, 'GetNextChild', @VCLua_TreeNode_GetNextChild);
	TLuaMethodInfo.Create(TreeNodeFuncs, 'GetNextExpanded', @VCLua_TreeNode_GetNextExpanded);
	TLuaMethodInfo.Create(TreeNodeFuncs, 'GetNextMultiSelected', @VCLua_TreeNode_GetNextMultiSelected);
	TLuaMethodInfo.Create(TreeNodeFuncs, 'GetNextSibling', @VCLua_TreeNode_GetNextSibling);
	TLuaMethodInfo.Create(TreeNodeFuncs, 'GetNextSkipChildren', @VCLua_TreeNode_GetNextSkipChildren);
	TLuaMethodInfo.Create(TreeNodeFuncs, 'GetNextVisible', @VCLua_TreeNode_GetNextVisible);
	TLuaMethodInfo.Create(TreeNodeFuncs, 'GetNextVisibleSibling', @VCLua_TreeNode_GetNextVisibleSibling);
	TLuaMethodInfo.Create(TreeNodeFuncs, 'GetParentNodeOfAbsoluteLevel', @VCLua_TreeNode_GetParentNodeOfAbsoluteLevel);
	TLuaMethodInfo.Create(TreeNodeFuncs, 'GetPrev', @VCLua_TreeNode_GetPrev);
	TLuaMethodInfo.Create(TreeNodeFuncs, 'GetPrevChild', @VCLua_TreeNode_GetPrevChild);
	TLuaMethodInfo.Create(TreeNodeFuncs, 'GetPrevExpanded', @VCLua_TreeNode_GetPrevExpanded);
	TLuaMethodInfo.Create(TreeNodeFuncs, 'GetPrevMultiSelected', @VCLua_TreeNode_GetPrevMultiSelected);
	TLuaMethodInfo.Create(TreeNodeFuncs, 'GetPrevSibling', @VCLua_TreeNode_GetPrevSibling);
	TLuaMethodInfo.Create(TreeNodeFuncs, 'GetPrevVisible', @VCLua_TreeNode_GetPrevVisible);
	TLuaMethodInfo.Create(TreeNodeFuncs, 'GetPrevVisibleSibling', @VCLua_TreeNode_GetPrevVisibleSibling);
	TLuaMethodInfo.Create(TreeNodeFuncs, 'GetTextPath', @VCLua_TreeNode_GetTextPath);
	TLuaMethodInfo.Create(TreeNodeFuncs, 'HasAsParent', @VCLua_TreeNode_HasAsParent);
	TLuaMethodInfo.Create(TreeNodeFuncs, 'IndexOf', @VCLua_TreeNode_IndexOf);
	TLuaMethodInfo.Create(TreeNodeFuncs, 'IndexOfText', @VCLua_TreeNode_IndexOfText);
	TLuaMethodInfo.Create(TreeNodeFuncs, 'Assign', @VCLua_TreeNode_Assign);
	TLuaMethodInfo.Create(TreeNodeFuncs, 'Collapse', @VCLua_TreeNode_Collapse);
	TLuaMethodInfo.Create(TreeNodeFuncs, 'ConsistencyCheck', @VCLua_TreeNode_ConsistencyCheck);
	TLuaMethodInfo.Create(TreeNodeFuncs, 'Delete', @VCLua_TreeNode_Delete);
	TLuaMethodInfo.Create(TreeNodeFuncs, 'DeleteChildren', @VCLua_TreeNode_DeleteChildren);
	TLuaMethodInfo.Create(TreeNodeFuncs, 'EndEdit', @VCLua_TreeNode_EndEdit);
	TLuaMethodInfo.Create(TreeNodeFuncs, 'Expand', @VCLua_TreeNode_Expand);
	TLuaMethodInfo.Create(TreeNodeFuncs, 'ExpandParents', @VCLua_TreeNode_ExpandParents);
	TLuaMethodInfo.Create(TreeNodeFuncs, 'FreeAllNodeData', @VCLua_TreeNode_FreeAllNodeData);
	TLuaMethodInfo.Create(TreeNodeFuncs, 'MakeVisible', @VCLua_TreeNode_MakeVisible);
	TLuaMethodInfo.Create(TreeNodeFuncs, 'MoveTo', @VCLua_TreeNode_MoveTo);
	TLuaMethodInfo.Create(TreeNodeFuncs, 'MultiSelectGroup', @VCLua_TreeNode_MultiSelectGroup);
	TLuaMethodInfo.Create(TreeNodeFuncs, 'Update', @VCLua_TreeNode_Update);
	TLuaMethodInfo.Create(TreeNodeFuncs, 'WriteDebugReport', @VCLua_TreeNode_WriteDebugReport);
	TLuaMethodInfo.Create(TreeNodeFuncs, 'AbsoluteIndex', @VCLua_TreeNode_VCLuaGetAbsoluteIndex, mfCall);
	TLuaMethodInfo.Create(TreeNodeFuncs, 'Count', @VCLua_TreeNode_VCLuaGetCount, mfCall);
	TLuaMethodInfo.Create(TreeNodeFuncs, 'Cut', @VCLua_TreeNode_VCLuaGetCut, mfCall);
	TLuaMethodInfo.Create(TreeNodeFuncs, 'Data', @VCLua_TreeNode_VCLuaGetData, mfCall);
	TLuaMethodInfo.Create(TreeNodeFuncs, 'Deleting', @VCLua_TreeNode_VCLuaGetDeleting, mfCall);
	TLuaMethodInfo.Create(TreeNodeFuncs, 'DropTarget', @VCLua_TreeNode_VCLuaGetDropTarget, mfCall);
	TLuaMethodInfo.Create(TreeNodeFuncs, 'Expanded', @VCLua_TreeNode_VCLuaGetExpanded, mfCall);
	TLuaMethodInfo.Create(TreeNodeFuncs, 'Focused', @VCLua_TreeNode_VCLuaGetFocused, mfCall);
	TLuaMethodInfo.Create(TreeNodeFuncs, 'Handle', @VCLua_TreeNode_VCLuaGetHandle, mfCall);
	TLuaMethodInfo.Create(TreeNodeFuncs, 'HasChildren', @VCLua_TreeNode_VCLuaGetHasChildren, mfCall);
	TLuaMethodInfo.Create(TreeNodeFuncs, 'Height', @VCLua_TreeNode_VCLuaGetHeight, mfCall);
	TLuaMethodInfo.Create(TreeNodeFuncs, 'ImageIndex', @VCLua_TreeNode_VCLuaGetImageIndex, mfCall);
	TLuaMethodInfo.Create(TreeNodeFuncs, 'Index', @VCLua_TreeNode_VCLuaGetIndex, mfCall);
	TLuaMethodInfo.Create(TreeNodeFuncs, 'IsFullHeightVisible', @VCLua_TreeNode_VCLuaGetIsFullHeightVisible, mfCall);
	TLuaMethodInfo.Create(TreeNodeFuncs, 'IsVisible', @VCLua_TreeNode_VCLuaGetIsVisible, mfCall);
	TLuaMethodInfo.Create(TreeNodeFuncs, 'Items', @VCLua_TreeNode_Items);
	TLuaMethodInfo.Create(TreeNodeFuncs, 'Level', @VCLua_TreeNode_VCLuaGetLevel, mfCall);
	TLuaMethodInfo.Create(TreeNodeFuncs, 'MultiSelected', @VCLua_TreeNode_VCLuaGetMultiSelected, mfCall);
	TLuaMethodInfo.Create(TreeNodeFuncs, 'NodeEffect', @VCLua_TreeNode_VCLuaGetNodeEffect, mfCall);
	TLuaMethodInfo.Create(TreeNodeFuncs, 'OverlayIndex', @VCLua_TreeNode_VCLuaGetOverlayIndex, mfCall);
	TLuaMethodInfo.Create(TreeNodeFuncs, 'Owner', @VCLua_TreeNode_VCLuaGetOwner, mfCall);
	TLuaMethodInfo.Create(TreeNodeFuncs, 'Parent', @VCLua_TreeNode_VCLuaGetParent, mfCall);
	TLuaMethodInfo.Create(TreeNodeFuncs, 'Selected', @VCLua_TreeNode_VCLuaGetSelected, mfCall);
	TLuaMethodInfo.Create(TreeNodeFuncs, 'SelectedIndex', @VCLua_TreeNode_VCLuaGetSelectedIndex, mfCall);
	TLuaMethodInfo.Create(TreeNodeFuncs, 'StateIndex', @VCLua_TreeNode_VCLuaGetStateIndex, mfCall);
	TLuaMethodInfo.Create(TreeNodeFuncs, 'States', @VCLua_TreeNode_VCLuaGetStates, mfCall);
	TLuaMethodInfo.Create(TreeNodeFuncs, 'SubTreeCount', @VCLua_TreeNode_VCLuaGetSubTreeCount, mfCall);
	TLuaMethodInfo.Create(TreeNodeFuncs, 'Text', @VCLua_TreeNode_VCLuaGetText, mfCall);
	TLuaMethodInfo.Create(TreeNodeFuncs, 'Top', @VCLua_TreeNode_VCLuaGetTop, mfCall);
	TLuaMethodInfo.Create(TreeNodeFuncs, 'TreeNodes', @VCLua_TreeNode_VCLuaGetTreeNodes, mfCall);
	TLuaMethodInfo.Create(TreeNodeFuncs, 'TreeView', @VCLua_TreeNode_VCLuaGetTreeView, mfCall);
	TLuaMethodInfo.Create(TreeNodeFuncs, 'Visible', @VCLua_TreeNode_VCLuaGetVisible, mfCall);
	TreeNodeSets := TLuaVmt.Create;
	TLuaMethodInfo.Create(TreeNodeSets, 'Cut', @VCLua_TreeNode_VCLuaSetCut, mfCall, TypeInfo(Boolean));
	TLuaMethodInfo.Create(TreeNodeSets, 'Data', @VCLua_TreeNode_VCLuaSetData, mfCall, TypeInfo(Pointer));
	TLuaMethodInfo.Create(TreeNodeSets, 'DropTarget', @VCLua_TreeNode_VCLuaSetDropTarget, mfCall, TypeInfo(Boolean));
	TLuaMethodInfo.Create(TreeNodeSets, 'Expanded', @VCLua_TreeNode_VCLuaSetExpanded, mfCall, TypeInfo(Boolean));
	TLuaMethodInfo.Create(TreeNodeSets, 'Focused', @VCLua_TreeNode_VCLuaSetFocused, mfCall, TypeInfo(Boolean));
	TLuaMethodInfo.Create(TreeNodeSets, 'HasChildren', @VCLua_TreeNode_VCLuaSetHasChildren, mfCall, TypeInfo(Boolean));
	TLuaMethodInfo.Create(TreeNodeSets, 'Height', @VCLua_TreeNode_VCLuaSetHeight, mfCall, TypeInfo(integer));
	TLuaMethodInfo.Create(TreeNodeSets, 'ImageIndex', @VCLua_TreeNode_VCLuaSetImageIndex, mfCall, TypeInfo(TImageIndex));
	TLuaMethodInfo.Create(TreeNodeSets, 'Index', @VCLua_TreeNode_VCLuaSetIndex, mfCall, TypeInfo(Integer));
	TLuaMethodInfo.Create(TreeNodeSets, 'MultiSelected', @VCLua_TreeNode_VCLuaSetMultiSelected, mfCall, TypeInfo(Boolean));
	TLuaMethodInfo.Create(TreeNodeSets, 'NodeEffect', @VCLua_TreeNode_VCLuaSetNodeEffect, mfCall, TypeInfo(TGraphicsDrawEffect));
	TLuaMethodInfo.Create(TreeNodeSets, 'OverlayIndex', @VCLua_TreeNode_VCLuaSetOverlayIndex, mfCall, TypeInfo(Integer));
	TLuaMethodInfo.Create(TreeNodeSets, 'Selected', @VCLua_TreeNode_VCLuaSetSelected, mfCall, TypeInfo(Boolean));
	TLuaMethodInfo.Create(TreeNodeSets, 'SelectedIndex', @VCLua_TreeNode_VCLuaSetSelectedIndex, mfCall, TypeInfo(Integer));
	TLuaMethodInfo.Create(TreeNodeSets, 'StateIndex', @VCLua_TreeNode_VCLuaSetStateIndex, mfCall, TypeInfo(Integer));
	TLuaMethodInfo.Create(TreeNodeSets, 'Text', @VCLua_TreeNode_VCLuaSetText, mfCall, TypeInfo(string));
	TLuaMethodInfo.Create(TreeNodeSets, 'Visible', @VCLua_TreeNode_VCLuaSetVisible, mfCall, TypeInfo(Boolean));
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
	TLuaMethodInfo.Create(TreeNodesFuncs, 'GetLastExpandedSubNode', @VCLua_TreeNodes_GetLastExpandedSubNode);
	TLuaMethodInfo.Create(TreeNodesFuncs, 'GetLastNode', @VCLua_TreeNodes_GetLastNode);
	TLuaMethodInfo.Create(TreeNodesFuncs, 'GetLastSubNode', @VCLua_TreeNodes_GetLastSubNode);
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
	TLuaMethodInfo.Create(TreeNodesFuncs, 'Count', @VCLua_TreeNodes_VCLuaGetCount, mfCall);
	TLuaMethodInfo.Create(TreeNodesFuncs, 'Item', @VCLua_TreeNodes_Item);
	TLuaMethodInfo.Create(TreeNodesFuncs, 'KeepCollapsedNodes', @VCLua_TreeNodes_VCLuaGetKeepCollapsedNodes, mfCall);
	TLuaMethodInfo.Create(TreeNodesFuncs, 'Owner', @VCLua_TreeNodes_VCLuaGetOwner, mfCall);
	TLuaMethodInfo.Create(TreeNodesFuncs, 'SelectionCount', @VCLua_TreeNodes_VCLuaGetSelectionCount, mfCall);
	TLuaMethodInfo.Create(TreeNodesFuncs, 'TopLvlCount', @VCLua_TreeNodes_VCLuaGetTopLvlCount, mfCall);
	TLuaMethodInfo.Create(TreeNodesFuncs, 'TopLvlItems', @VCLua_TreeNodes_TopLvlItems);
	TreeNodesSets := TLuaVmt.Create;
	TLuaMethodInfo.Create(TreeNodesSets, 'KeepCollapsedNodes', @VCLua_TreeNodes_VCLuaSetKeepCollapsedNodes, mfCall, TypeInfo(boolean));
	CustomTreeViewFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(CustomTreeViewFuncs, 'AccessibilityOn', @VCLua_TreeView_VCLuaGetAccessibilityOn, mfCall);
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
	TLuaMethodInfo.Create(CustomTreeViewSets, 'AccessibilityOn', @VCLua_TreeView_VCLuaSetAccessibilityOn, mfCall, TypeInfo(Boolean));
	TLuaMethodInfo.Create(CustomTreeViewSets, 'OnAddition', @VCLua_TreeView_VCLuaSetOnAddition, mfCall, TypeInfo(TTVExpandedEvent));
	TLuaMethodInfo.Create(CustomTreeViewSets, 'OnAdvancedCustomDraw', @VCLua_TreeView_VCLuaSetOnAdvancedCustomDraw, mfCall, TypeInfo(TTVAdvancedCustomDrawEvent));
	TLuaMethodInfo.Create(CustomTreeViewSets, 'OnAdvancedCustomDrawItem', @VCLua_TreeView_VCLuaSetOnAdvancedCustomDrawItem, mfCall, TypeInfo(TTVAdvancedCustomDrawItemEvent));
	TLuaMethodInfo.Create(CustomTreeViewSets, 'OnChange', @VCLua_TreeView_VCLuaSetOnChange, mfCall, TypeInfo(TTVChangedEvent));
	TLuaMethodInfo.Create(CustomTreeViewSets, 'OnChanging', @VCLua_TreeView_VCLuaSetOnChanging, mfCall, TypeInfo(TTVChangingEvent));
	TLuaMethodInfo.Create(CustomTreeViewSets, 'OnCollapsed', @VCLua_TreeView_VCLuaSetOnCollapsed, mfCall, TypeInfo(TTVExpandedEvent));
	TLuaMethodInfo.Create(CustomTreeViewSets, 'OnCollapsing', @VCLua_TreeView_VCLuaSetOnCollapsing, mfCall, TypeInfo(TTVCollapsingEvent));
	TLuaMethodInfo.Create(CustomTreeViewSets, 'OnCompare', @VCLua_TreeView_VCLuaSetOnCompare, mfCall, TypeInfo(TTVCompareEvent));
	TLuaMethodInfo.Create(CustomTreeViewSets, 'OnCustomCreateItem', @VCLua_TreeView_VCLuaSetOnCustomCreateItem, mfCall, TypeInfo(TTVCustomCreateNodeEvent));
	TLuaMethodInfo.Create(CustomTreeViewSets, 'OnCustomDraw', @VCLua_TreeView_VCLuaSetOnCustomDraw, mfCall, TypeInfo(TTVCustomDrawEvent));
	TLuaMethodInfo.Create(CustomTreeViewSets, 'OnCustomDrawItem', @VCLua_TreeView_VCLuaSetOnCustomDrawItem, mfCall, TypeInfo(TTVCustomDrawItemEvent));
	TLuaMethodInfo.Create(CustomTreeViewSets, 'OnCustomDrawArrow', @VCLua_TreeView_VCLuaSetOnCustomDrawArrow, mfCall, TypeInfo(TTVCustomDrawArrowEvent));
	TLuaMethodInfo.Create(CustomTreeViewSets, 'OnDeletion', @VCLua_TreeView_VCLuaSetOnDeletion, mfCall, TypeInfo(TTVExpandedEvent));
	TLuaMethodInfo.Create(CustomTreeViewSets, 'OnEdited', @VCLua_TreeView_VCLuaSetOnEdited, mfCall, TypeInfo(TTVEditedEvent));
	TLuaMethodInfo.Create(CustomTreeViewSets, 'OnEditing', @VCLua_TreeView_VCLuaSetOnEditing, mfCall, TypeInfo(TTVEditingEvent));
	TLuaMethodInfo.Create(CustomTreeViewSets, 'OnEditingEnd', @VCLua_TreeView_VCLuaSetOnEditingEnd, mfCall, TypeInfo(TTVEditingEndEvent));
	TLuaMethodInfo.Create(CustomTreeViewSets, 'OnExpanded', @VCLua_TreeView_VCLuaSetOnExpanded, mfCall, TypeInfo(TTVExpandedEvent));
	TLuaMethodInfo.Create(CustomTreeViewSets, 'OnExpanding', @VCLua_TreeView_VCLuaSetOnExpanding, mfCall, TypeInfo(TTVExpandingEvent));
	TLuaMethodInfo.Create(CustomTreeViewSets, 'OnGetImageIndex', @VCLua_TreeView_VCLuaSetOnGetImageIndex, mfCall, TypeInfo(TTVExpandedEvent));
	TLuaMethodInfo.Create(CustomTreeViewSets, 'OnGetSelectedIndex', @VCLua_TreeView_VCLuaSetOnGetSelectedIndex, mfCall, TypeInfo(TTVExpandedEvent));
	TLuaMethodInfo.Create(CustomTreeViewSets, 'OnNodeChanged', @VCLua_TreeView_VCLuaSetOnNodeChanged, mfCall, TypeInfo(TTVNodeChangedEvent));
	TLuaMethodInfo.Create(CustomTreeViewSets, 'OnSelectionChanged', @VCLua_TreeView_VCLuaSetOnSelectionChanged, mfCall, TypeInfo(TNotifyEvent));
	TLuaMethodInfo.Create(CustomTreeViewSets, 'BackgroundColor', @VCLua_TreeView_VCLuaSetBackgroundColor, mfCall, TypeInfo(TColor));
	TLuaMethodInfo.Create(CustomTreeViewSets, 'BottomItem', @VCLua_TreeView_VCLuaSetBottomItem, mfCall, TypeInfo(TTreeNode));
	TLuaMethodInfo.Create(CustomTreeViewSets, 'DefaultItemHeight', @VCLua_TreeView_VCLuaSetDefaultItemHeight, mfCall, TypeInfo(integer));
	TLuaMethodInfo.Create(CustomTreeViewSets, 'DropTarget', @VCLua_TreeView_VCLuaSetDropTarget, mfCall, TypeInfo(TTreeNode));
	TLuaMethodInfo.Create(CustomTreeViewSets, 'ExpandSignColor', @VCLua_TreeView_VCLuaSetExpandSignColor, mfCall, TypeInfo(TColor));
	TLuaMethodInfo.Create(CustomTreeViewSets, 'ExpandSignSize', @VCLua_TreeView_VCLuaSetExpandSignSize, mfCall, TypeInfo(integer));
	TLuaMethodInfo.Create(CustomTreeViewSets, 'ExpandSignType', @VCLua_TreeView_VCLuaSetExpandSignType, mfCall, TypeInfo(TTreeViewExpandSignType));
	TLuaMethodInfo.Create(CustomTreeViewSets, 'Images', @VCLua_TreeView_VCLuaSetImages, mfCall, TypeInfo(TCustomImageList));
	TLuaMethodInfo.Create(CustomTreeViewSets, 'ImagesWidth', @VCLua_TreeView_VCLuaSetImagesWidth, mfCall, TypeInfo(Integer));
	TLuaMethodInfo.Create(CustomTreeViewSets, 'InsertMarkNode', @VCLua_TreeView_VCLuaSetInsertMarkNode, mfCall, TypeInfo(TTreeNode));
	TLuaMethodInfo.Create(CustomTreeViewSets, 'InsertMarkType', @VCLua_TreeView_VCLuaSetInsertMarkType, mfCall, TypeInfo(TTreeViewInsertMarkType));
	TLuaMethodInfo.Create(CustomTreeViewSets, 'Items', @VCLua_TreeView_VCLuaSetItems, mfCall, TypeInfo(TTreeNodes));
	TLuaMethodInfo.Create(CustomTreeViewSets, 'KeepCollapsedNodes', @VCLua_TreeView_VCLuaSetKeepCollapsedNodes, mfCall, TypeInfo(boolean));
	TLuaMethodInfo.Create(CustomTreeViewSets, 'MultiSelectStyle', @VCLua_TreeView_VCLuaSetMultiSelectStyle, mfCall, TypeInfo(TMultiSelectStyle));
	TLuaMethodInfo.Create(CustomTreeViewSets, 'Options', @VCLua_TreeView_VCLuaSetOptions, mfCall, TypeInfo(TTreeViewOptions));
	TLuaMethodInfo.Create(CustomTreeViewSets, 'ScrollBars', @VCLua_TreeView_VCLuaSetScrollBars, mfCall, TypeInfo(TScrollStyle));
	TLuaMethodInfo.Create(CustomTreeViewSets, 'Selected', @VCLua_TreeView_VCLuaSetSelected, mfCall, TypeInfo(TTreeNode));
	TLuaMethodInfo.Create(CustomTreeViewSets, 'SelectionColor', @VCLua_TreeView_VCLuaSetSelectionColor, mfCall, TypeInfo(TColor));
	TLuaMethodInfo.Create(CustomTreeViewSets, 'SelectionFontColor', @VCLua_TreeView_VCLuaSetSelectionFontColor, mfCall, TypeInfo(TColor));
	TLuaMethodInfo.Create(CustomTreeViewSets, 'SelectionFontColorUsed', @VCLua_TreeView_VCLuaSetSelectionFontColorUsed, mfCall, TypeInfo(boolean));
	TLuaMethodInfo.Create(CustomTreeViewSets, 'SeparatorColor', @VCLua_TreeView_VCLuaSetSeparatorColor, mfCall, TypeInfo(TColor));
	TLuaMethodInfo.Create(CustomTreeViewSets, 'StateImages', @VCLua_TreeView_VCLuaSetStateImages, mfCall, TypeInfo(TCustomImageList));
	TLuaMethodInfo.Create(CustomTreeViewSets, 'StateImagesWidth', @VCLua_TreeView_VCLuaSetStateImagesWidth, mfCall, TypeInfo(Integer));
	TLuaMethodInfo.Create(CustomTreeViewSets, 'TopItem', @VCLua_TreeView_VCLuaSetTopItem, mfCall, TypeInfo(TTreeNode));
	TLuaMethodInfo.Create(CustomTreeViewSets, 'TreeLineColor', @VCLua_TreeView_VCLuaSetTreeLineColor, mfCall, TypeInfo(TColor));
	TLuaMethodInfo.Create(CustomTreeViewSets, 'TreeLinePenStyle', @VCLua_TreeView_VCLuaSetTreeLinePenStyle, mfCall, TypeInfo(TPenStyle));
end.
