(*
Generated with Lua-fpc parser/generator
(C) 2018-2023 Hi-Project Ltd.
*)
unit LuaSynEdit;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, SynEdit, SynEditTypes, SynEditKeyCmds, LCLType, SynEditHighlighter, LuaSynHighlighterAttributes, Controls;

function CreateSynEdit(L: Plua_State): Integer; cdecl;
procedure SynEditToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaSynEdit = class(TSynEdit)
        LuaCtl: TVCLuaControl;
    end;


implementation
Uses LuaProperties, TypInfo, LuaProxy, LuaHelper, LCLClasses; 

function VCLua_SynEdit_AfterLoadFromFile(L: Plua_State): Integer; cdecl;
var 
	lSynEdit:TLuaSynEdit;
begin
	CheckArg(L, 1);
	lSynEdit := TLuaSynEdit(GetLuaObject(L, 1));
	lSynEdit.AfterLoadFromFile();
	
	Result := 0;
end;

function VCLua_SynEdit_BeginUndoBlock(L: Plua_State): Integer; cdecl;
var 
	lSynEdit:TLuaSynEdit;
begin
	CheckArg(L, 1);
	lSynEdit := TLuaSynEdit(GetLuaObject(L, 1));
	lSynEdit.BeginUndoBlock();
	
	Result := 0;
end;

function VCLua_SynEdit_BeginUpdate(L: Plua_State): Integer; cdecl;
var 
	lSynEdit:TLuaSynEdit;
	WithUndoBlock:Boolean;
begin
	CheckArg(L, -1);
	lSynEdit := TLuaSynEdit(GetLuaObject(L, 1));
	WithUndoBlock := luaL_optbool(L,2, True);
	lSynEdit.BeginUpdate(WithUndoBlock);
	
	Result := 0;
end;

function VCLua_SynEdit_EndUndoBlock(L: Plua_State): Integer; cdecl;
var 
	lSynEdit:TLuaSynEdit;
begin
	CheckArg(L, 1);
	lSynEdit := TLuaSynEdit(GetLuaObject(L, 1));
	lSynEdit.EndUndoBlock();
	
	Result := 0;
end;

function VCLua_SynEdit_EndUpdate(L: Plua_State): Integer; cdecl;
var 
	lSynEdit:TLuaSynEdit;
begin
	CheckArg(L, 1);
	lSynEdit := TLuaSynEdit(GetLuaObject(L, 1));
	lSynEdit.EndUpdate();
	
	Result := 0;
end;

function VCLua_SynEdit_CaretXPix(L: Plua_State): Integer; cdecl;
var 
	lSynEdit:TLuaSynEdit;
	ret:Integer;
begin
	CheckArg(L, 1);
	lSynEdit := TLuaSynEdit(GetLuaObject(L, 1));
	ret := lSynEdit.CaretXPix();
	lua_pushinteger(L,ret);
	
	Result := 1;
end;

function VCLua_SynEdit_CaretYPix(L: Plua_State): Integer; cdecl;
var 
	lSynEdit:TLuaSynEdit;
	ret:Integer;
begin
	CheckArg(L, 1);
	lSynEdit := TLuaSynEdit(GetLuaObject(L, 1));
	ret := lSynEdit.CaretYPix();
	lua_pushinteger(L,ret);
	
	Result := 1;
end;

function VCLua_SynEdit_EnsureCursorPosVisible(L: Plua_State): Integer; cdecl;
var 
	lSynEdit:TLuaSynEdit;
begin
	CheckArg(L, 1);
	lSynEdit := TLuaSynEdit(GetLuaObject(L, 1));
	lSynEdit.EnsureCursorPosVisible();
	
	Result := 0;
end;

function VCLua_SynEdit_MoveCaretToVisibleArea(L: Plua_State): Integer; cdecl;
var 
	lSynEdit:TLuaSynEdit;
begin
	CheckArg(L, 1);
	lSynEdit := TLuaSynEdit(GetLuaObject(L, 1));
	lSynEdit.MoveCaretToVisibleArea();
	
	Result := 0;
end;

function VCLua_SynEdit_MoveCaretIgnoreEOL(L: Plua_State): Integer; cdecl;
var 
	lSynEdit:TLuaSynEdit;
	NewCaret:TPoint;
begin
	CheckArg(L, 2);
	lSynEdit := TLuaSynEdit(GetLuaObject(L, 1));
	NewCaret := lua_toTPoint(L,2);
	lSynEdit.MoveCaretIgnoreEOL(NewCaret);
	
	Result := 0;
end;

function VCLua_SynEdit_MoveLogicalCaretIgnoreEOL(L: Plua_State): Integer; cdecl;
var 
	lSynEdit:TLuaSynEdit;
	NewLogCaret:TPoint;
begin
	CheckArg(L, 2);
	lSynEdit := TLuaSynEdit(GetLuaObject(L, 1));
	NewLogCaret := lua_toTPoint(L,2);
	lSynEdit.MoveLogicalCaretIgnoreEOL(NewLogCaret);
	
	Result := 0;
end;

function VCLua_SynEdit_ClearSelection(L: Plua_State): Integer; cdecl;
var 
	lSynEdit:TLuaSynEdit;
begin
	CheckArg(L, 1);
	lSynEdit := TLuaSynEdit(GetLuaObject(L, 1));
	lSynEdit.ClearSelection();
	
	Result := 0;
end;

function VCLua_SynEdit_SelectAll(L: Plua_State): Integer; cdecl;
var 
	lSynEdit:TLuaSynEdit;
begin
	CheckArg(L, 1);
	lSynEdit := TLuaSynEdit(GetLuaObject(L, 1));
	lSynEdit.SelectAll();
	
	Result := 0;
end;

function VCLua_SynEdit_SelectToBrace(L: Plua_State): Integer; cdecl;
var 
	lSynEdit:TLuaSynEdit;
begin
	CheckArg(L, 1);
	lSynEdit := TLuaSynEdit(GetLuaObject(L, 1));
	lSynEdit.SelectToBrace();
	
	Result := 0;
end;

function VCLua_SynEdit_SelectWord(L: Plua_State): Integer; cdecl;
var 
	lSynEdit:TLuaSynEdit;
begin
	CheckArg(L, 1);
	lSynEdit := TLuaSynEdit(GetLuaObject(L, 1));
	lSynEdit.SelectWord();
	
	Result := 0;
end;

function VCLua_SynEdit_SelectLine(L: Plua_State): Integer; cdecl;
var 
	lSynEdit:TLuaSynEdit;
	WithLeadSpaces:Boolean;
begin
	CheckArg(L, -1);
	lSynEdit := TLuaSynEdit(GetLuaObject(L, 1));
	WithLeadSpaces := luaL_optbool(L,2, True);
	lSynEdit.SelectLine(WithLeadSpaces);
	
	Result := 0;
end;

function VCLua_SynEdit_SelectParagraph(L: Plua_State): Integer; cdecl;
var 
	lSynEdit:TLuaSynEdit;
begin
	CheckArg(L, 1);
	lSynEdit := TLuaSynEdit(GetLuaObject(L, 1));
	lSynEdit.SelectParagraph();
	
	Result := 0;
end;

function VCLua_SynEdit_Clear(L: Plua_State): Integer; cdecl;
var 
	lSynEdit:TLuaSynEdit;
begin
	CheckArg(L, 1);
	lSynEdit := TLuaSynEdit(GetLuaObject(L, 1));
	lSynEdit.Clear();
	
	Result := 0;
end;

function VCLua_SynEdit_Append(L: Plua_State): Integer; cdecl;
var 
	lSynEdit:TLuaSynEdit;
	Value:String;
begin
	CheckArg(L, 2);
	lSynEdit := TLuaSynEdit(GetLuaObject(L, 1));
	Value := lua_tostring(L,2);
	lSynEdit.Append(Value);
	
	Result := 0;
end;

function VCLua_SynEdit_ClearAll(L: Plua_State): Integer; cdecl;
var 
	lSynEdit:TLuaSynEdit;
begin
	CheckArg(L, 1);
	lSynEdit := TLuaSynEdit(GetLuaObject(L, 1));
	lSynEdit.ClearAll();
	
	Result := 0;
end;

function VCLua_SynEdit_InsertTextAtCaret(L: Plua_State): Integer; cdecl;
var 
	lSynEdit:TLuaSynEdit;
	aText:String;
	aCaretMode :TSynCaretAdjustMode;
begin
	CheckArg(L, 3);
	lSynEdit := TLuaSynEdit(GetLuaObject(L, 1));
	aText := lua_tostring(L,2);
	aCaretMode  := TSynCaretAdjustMode(GetLuaObject(L,3));
	lSynEdit.InsertTextAtCaret(aText,aCaretMode );
	
	Result := 0;
end;

function VCLua_SynEdit_SetTextBetweenPoints(L: Plua_State): Integer; cdecl;
var 
	lSynEdit:TLuaSynEdit;
	aStartPoint:TPoint;
	aEndPoint:TPoint;
	AValue:String;
	aFlags:TSynEditTextFlags;
	aCaretMode:TSynCaretAdjustMode;
	aMarksMode:TSynMarksAdjustMode;
	aSelectionMode:TSynSelectionMode;
begin
	CheckArg(L, 8);
	lSynEdit := TLuaSynEdit(GetLuaObject(L, 1));
	aStartPoint := lua_toTPoint(L,2);
	aEndPoint := lua_toTPoint(L,3);
	AValue := lua_tostring(L,4);
	aFlags := TSynEditTextFlags(GetEnumValue(TypeInfo(TSynEditTextFlags),lua_tostring(L,5)));
	aCaretMode := TSynCaretAdjustMode(GetLuaObject(L,6));
	aMarksMode := TSynMarksAdjustMode(GetLuaObject(L,7));
	aSelectionMode := TSynSelectionMode(GetLuaObject(L,8));
	lSynEdit.SetTextBetweenPoints(aStartPoint,aEndPoint,AValue,aFlags,aCaretMode,aMarksMode,aSelectionMode);
	
	Result := 0;
end;

function VCLua_SynEdit_GetLineState(L: Plua_State): Integer; cdecl;
var 
	lSynEdit:TLuaSynEdit;
	ALine:Integer;
	ret:TSynLineState;
begin
	CheckArg(L, 2);
	lSynEdit := TLuaSynEdit(GetLuaObject(L, 1));
	ALine := lua_tointeger(L,2);
	ret := lSynEdit.GetLineState(ALine);
	SynEditToTable(L,-1,ret);
	
	Result := 1;
end;

function VCLua_SynEdit_MarkTextAsSaved(L: Plua_State): Integer; cdecl;
var 
	lSynEdit:TLuaSynEdit;
begin
	CheckArg(L, 1);
	lSynEdit := TLuaSynEdit(GetLuaObject(L, 1));
	lSynEdit.MarkTextAsSaved();
	
	Result := 0;
end;

function VCLua_SynEdit_ClearBookMark(L: Plua_State): Integer; cdecl;
var 
	lSynEdit:TLuaSynEdit;
	BookMark:Integer;
begin
	CheckArg(L, 2);
	lSynEdit := TLuaSynEdit(GetLuaObject(L, 1));
	BookMark := lua_tointeger(L,2);
	lSynEdit.ClearBookMark(BookMark);
	
	Result := 0;
end;

function VCLua_SynEdit_GetBookMark(L: Plua_State): Integer; cdecl;
var 
	lSynEdit:TLuaSynEdit;
	BookMark:integer;
	X:integer;
	 Y:integer;
	ret:boolean;
begin
	CheckArg(L, 2);
	lSynEdit := TLuaSynEdit(GetLuaObject(L, 1));
	BookMark := lua_tointeger(L,2);
	ret := lSynEdit.GetBookMark(BookMark,X, Y);
	lua_pushboolean(L,ret);
	lua_pushinteger(L,X);	
lua_pushinteger(L, Y);
	Result := 3;
end;

function VCLua_SynEdit_GotoBookMark(L: Plua_State): Integer; cdecl;
var 
	lSynEdit:TLuaSynEdit;
	BookMark:Integer;
begin
	CheckArg(L, 2);
	lSynEdit := TLuaSynEdit(GetLuaObject(L, 1));
	BookMark := lua_tointeger(L,2);
	lSynEdit.GotoBookMark(BookMark);
	
	Result := 0;
end;

function VCLua_SynEdit_IsBookmark(L: Plua_State): Integer; cdecl;
var 
	lSynEdit:TLuaSynEdit;
	BookMark:integer;
	ret:boolean;
begin
	CheckArg(L, 2);
	lSynEdit := TLuaSynEdit(GetLuaObject(L, 1));
	BookMark := lua_tointeger(L,2);
	ret := lSynEdit.IsBookmark(BookMark);
	lua_pushboolean(L,ret);
	
	Result := 1;
end;

function VCLua_SynEdit_SetBookMark(L: Plua_State): Integer; cdecl;
var 
	lSynEdit:TLuaSynEdit;
	BookMark:Integer;
	X:Integer;
	Y:Integer;
begin
	CheckArg(L, 4);
	lSynEdit := TLuaSynEdit(GetLuaObject(L, 1));
	BookMark := lua_tointeger(L,2);
	X := lua_tointeger(L,3);
	Y := lua_tointeger(L,4);
	lSynEdit.SetBookMark(BookMark,X,Y);
	
	Result := 0;
end;

function VCLua_SynEdit_ClearUndo(L: Plua_State): Integer; cdecl;
var 
	lSynEdit:TLuaSynEdit;
begin
	CheckArg(L, 1);
	lSynEdit := TLuaSynEdit(GetLuaObject(L, 1));
	lSynEdit.ClearUndo();
	
	Result := 0;
end;

function VCLua_SynEdit_Redo(L: Plua_State): Integer; cdecl;
var 
	lSynEdit:TLuaSynEdit;
begin
	CheckArg(L, 1);
	lSynEdit := TLuaSynEdit(GetLuaObject(L, 1));
	lSynEdit.Redo();
	
	Result := 0;
end;

function VCLua_SynEdit_Undo(L: Plua_State): Integer; cdecl;
var 
	lSynEdit:TLuaSynEdit;
begin
	CheckArg(L, 1);
	lSynEdit := TLuaSynEdit(GetLuaObject(L, 1));
	lSynEdit.Undo();
	
	Result := 0;
end;

function VCLua_SynEdit_CopyToClipboard(L: Plua_State): Integer; cdecl;
var 
	lSynEdit:TLuaSynEdit;
begin
	CheckArg(L, 1);
	lSynEdit := TLuaSynEdit(GetLuaObject(L, 1));
	lSynEdit.CopyToClipboard();
	
	Result := 0;
end;

function VCLua_SynEdit_CutToClipboard(L: Plua_State): Integer; cdecl;
var 
	lSynEdit:TLuaSynEdit;
begin
	CheckArg(L, 1);
	lSynEdit := TLuaSynEdit(GetLuaObject(L, 1));
	lSynEdit.CutToClipboard();
	
	Result := 0;
end;

function VCLua_SynEdit_PasteFromClipboard(L: Plua_State): Integer; cdecl;
var 
	lSynEdit:TLuaSynEdit;
	AForceColumnMode:Boolean;
begin
	CheckArg(L, -1);
	lSynEdit := TLuaSynEdit(GetLuaObject(L, 1));
	AForceColumnMode := luaL_optbool(L,2, False);
	lSynEdit.PasteFromClipboard(AForceColumnMode);
	
	Result := 0;
end;

function VCLua_SynEdit_DoCopyToClipboard(L: Plua_State): Integer; cdecl;
var 
	lSynEdit:TLuaSynEdit;
	SText:string;
	FoldInfo:String;
begin
	CheckArg(L, -1);
	lSynEdit := TLuaSynEdit(GetLuaObject(L, 1));
	SText := lua_tostring(L,2);
	FoldInfo := luaL_optstring(L,3,' ');
	lSynEdit.DoCopyToClipboard(SText,FoldInfo);
	
	Result := 0;
end;

function VCLua_SynEdit_DragDrop(L: Plua_State): Integer; cdecl;
var 
	lSynEdit:TLuaSynEdit;
	Source:TObject;
	X:Integer;
	Y:Integer;
begin
	CheckArg(L, 4);
	lSynEdit := TLuaSynEdit(GetLuaObject(L, 1));
	Source := TObject(GetLuaObject(L,2));
	X := lua_tointeger(L,3);
	Y := lua_tointeger(L,4);
	lSynEdit.DragDrop(Source,X,Y);
	
	Result := 0;
end;

function VCLua_SynEdit_ExecuteAction(L: Plua_State): Integer; cdecl;
var 
	lSynEdit:TLuaSynEdit;
	ExeAction:TBasicAction;
	ret:boolean;
begin
	CheckArg(L, 2);
	lSynEdit := TLuaSynEdit(GetLuaObject(L, 1));
	ExeAction := TBasicAction(GetLuaObject(L,2));
	ret := lSynEdit.ExecuteAction(ExeAction);
	lua_pushboolean(L,ret);
	
	Result := 1;
end;

function VCLua_SynEdit_CommandProcessor(L: Plua_State): Integer; cdecl;
var 
	lSynEdit:TLuaSynEdit;
	Command:TSynEditorCommand;
	AChar:TUTF8Char;
	Data:pointer;
	ASkipHooks:THookedCommandFlags;
begin
	CheckArg(L, 5);
	lSynEdit := TLuaSynEdit(GetLuaObject(L, 1));
	Command := TSynEditorCommand(GetLuaObject(L,2));
	AChar := TUTF8Char(lua_tostring(L,3));
	Data := Pointer(lua_touserdata(L,4));
	ASkipHooks := THookedCommandFlags(GetLuaObject(L,5));
	lSynEdit.CommandProcessor(Command,AChar,Data,ASkipHooks);
	
	Result := 0;
end;

function VCLua_SynEdit_ExecuteCommand(L: Plua_State): Integer; cdecl;
var 
	lSynEdit:TLuaSynEdit;
	Command:TSynEditorCommand;
	AChar:TUTF8Char;
	Data:pointer;
begin
	CheckArg(L, 4);
	lSynEdit := TLuaSynEdit(GetLuaObject(L, 1));
	Command := TSynEditorCommand(GetLuaObject(L,2));
	AChar := TUTF8Char(lua_tostring(L,3));
	Data := Pointer(lua_touserdata(L,4));
	lSynEdit.ExecuteCommand(Command,AChar,Data);
	
	Result := 0;
end;

function VCLua_SynEdit_GetHighlighterAttriAtRowCol(L: Plua_State): Integer; cdecl;
var 
	lSynEdit:TLuaSynEdit;
	XY:TPoint;
	Token:string;
	Attri:TSynHighlighterAttributes;
	ret:boolean;
begin
	CheckArg(L, 2);
	lSynEdit := TLuaSynEdit(GetLuaObject(L, 1));
	XY := lua_toTPoint(L,2);
	ret := lSynEdit.GetHighlighterAttriAtRowCol(XY,Token,Attri);
	lua_pushboolean(L,ret);
	lua_pushstring(L,PChar(Token));	
SynHighlighterAttributesToTable(L,-1,Attri);
	Result := 3;
end;

function VCLua_SynEdit_GetHighlighterAttriAtRowColEx(L: Plua_State): Integer; cdecl;
var 
	lSynEdit:TLuaSynEdit;
	XY:TPoint;
	Token:string;
	TokenType:Integer;
	 Start:Integer;
	Attri:TSynHighlighterAttributes;
	ret:boolean;
begin
	CheckArg(L, 2);
	lSynEdit := TLuaSynEdit(GetLuaObject(L, 1));
	XY := lua_toTPoint(L,2);
	ret := lSynEdit.GetHighlighterAttriAtRowColEx(XY,Token,TokenType, Start,Attri);
	lua_pushboolean(L,ret);
	lua_pushstring(L,PChar(Token));	
lua_pushinteger(L,TokenType);	
lua_pushinteger(L, Start);	
SynHighlighterAttributesToTable(L,-1,Attri);
	Result := 5;
end;

function VCLua_SynEdit_CaretAtIdentOrString(L: Plua_State): Integer; cdecl;
var 
	lSynEdit:TLuaSynEdit;
	XY:TPoint;
	AtIdent:Boolean;
	 NearString:Boolean;
begin
	CheckArg(L, 2);
	lSynEdit := TLuaSynEdit(GetLuaObject(L, 1));
	XY := lua_toTPoint(L,2);
	lSynEdit.CaretAtIdentOrString(XY,AtIdent, NearString);
	lua_pushboolean(L,AtIdent);
	lua_pushboolean(L, NearString);
	Result := 2;
end;

function VCLua_SynEdit_GetWordBoundsAtRowCol(L: Plua_State): Integer; cdecl;
var 
	lSynEdit:TLuaSynEdit;
	XY:TPoint;
	StartX:integer;
	 EndX:integer;
begin
	CheckArg(L, 2);
	lSynEdit := TLuaSynEdit(GetLuaObject(L, 1));
	XY := lua_toTPoint(L,2);
	lSynEdit.GetWordBoundsAtRowCol(XY,StartX, EndX);
	lua_pushinteger(L,StartX);
	lua_pushinteger(L, EndX);
	Result := 2;
end;

function VCLua_SynEdit_GetWordAtRowCol(L: Plua_State): Integer; cdecl;
var 
	lSynEdit:TLuaSynEdit;
	XY:TPoint;
	ret:string;
begin
	CheckArg(L, 2);
	lSynEdit := TLuaSynEdit(GetLuaObject(L, 1));
	XY := lua_toTPoint(L,2);
	ret := lSynEdit.GetWordAtRowCol(XY);
	lua_pushstring(L,PChar(ret));
	
	Result := 1;
end;

function VCLua_SynEdit_NextWordPos(L: Plua_State): Integer; cdecl;
var 
	lSynEdit:TLuaSynEdit;
	ret:TPoint;
begin
	CheckArg(L, 1);
	lSynEdit := TLuaSynEdit(GetLuaObject(L, 1));
	ret := lSynEdit.NextWordPos();
	lua_pushTPoint(L,ret);
	
	Result := 1;
end;

function VCLua_SynEdit_PrevWordPos(L: Plua_State): Integer; cdecl;
var 
	lSynEdit:TLuaSynEdit;
	ret:TPoint;
begin
	CheckArg(L, 1);
	lSynEdit := TLuaSynEdit(GetLuaObject(L, 1));
	ret := lSynEdit.PrevWordPos();
	lua_pushTPoint(L,ret);
	
	Result := 1;
end;

function VCLua_SynEdit_IsIdentChar(L: Plua_State): Integer; cdecl;
var 
	lSynEdit:TLuaSynEdit;
	c:TUTF8Char;
	ret:boolean;
begin
	CheckArg(L, 2);
	lSynEdit := TLuaSynEdit(GetLuaObject(L, 1));
	c := TUTF8Char(lua_tostring(L,2));
	ret := lSynEdit.IsIdentChar(c);
	lua_pushboolean(L,ret);
	
	Result := 1;
end;

function VCLua_SynEdit_IsLinkable(L: Plua_State): Integer; cdecl;
var 
	lSynEdit:TLuaSynEdit;
	Y:Integer;
	X1:Integer;
	X2:Integer;
	ret:Boolean;
begin
	CheckArg(L, 4);
	lSynEdit := TLuaSynEdit(GetLuaObject(L, 1));
	Y := lua_tointeger(L,2);
	X1 := lua_tointeger(L,3);
	X2 := lua_tointeger(L,4);
	ret := lSynEdit.IsLinkable(Y,X1,X2);
	lua_pushboolean(L,ret);
	
	Result := 1;
end;

function VCLua_SynEdit_InvalidateGutter(L: Plua_State): Integer; cdecl;
var 
	lSynEdit:TLuaSynEdit;
begin
	CheckArg(L, 1);
	lSynEdit := TLuaSynEdit(GetLuaObject(L, 1));
	lSynEdit.InvalidateGutter();
	
	Result := 0;
end;

function VCLua_SynEdit_InvalidateLine(L: Plua_State): Integer; cdecl;
var 
	lSynEdit:TLuaSynEdit;
	Line:integer;
begin
	CheckArg(L, 2);
	lSynEdit := TLuaSynEdit(GetLuaObject(L, 1));
	Line := lua_tointeger(L,2);
	lSynEdit.InvalidateLine(Line);
	
	Result := 0;
end;

function VCLua_SynEdit_InvalidateLines(L: Plua_State): Integer; cdecl;
var 
	lSynEdit:TLuaSynEdit;
	FirstLine:integer;
	LastLine:integer;
begin
	CheckArg(L, 3);
	lSynEdit := TLuaSynEdit(GetLuaObject(L, 1));
	FirstLine := lua_tointeger(L,2);
	LastLine := lua_tointeger(L,3);
	lSynEdit.InvalidateLines(FirstLine,LastLine);
	
	Result := 0;
end;

function VCLua_SynEdit_LogicalToPhysicalPos(L: Plua_State): Integer; cdecl;
var 
	lSynEdit:TLuaSynEdit;
	p:TPoint;
	ret:TPoint;
begin
	CheckArg(L, 2);
	lSynEdit := TLuaSynEdit(GetLuaObject(L, 1));
	p := lua_toTPoint(L,2);
	ret := lSynEdit.LogicalToPhysicalPos(p);
	lua_pushTPoint(L,ret);
	
	Result := 1;
end;

function VCLua_SynEdit_LogicalToPhysicalCol(L: Plua_State): Integer; cdecl;
var 
	lSynEdit:TLuaSynEdit;
	Line:String;
	Index:integer;
	LogicalPos:integer;
	ret:integer;
begin
	CheckArg(L, 4);
	lSynEdit := TLuaSynEdit(GetLuaObject(L, 1));
	Line := lua_tostring(L,2);
	Index := lua_tointeger(L,3);
	LogicalPos := lua_tointeger(L,4);
	ret := lSynEdit.LogicalToPhysicalCol(Line,Index,LogicalPos);
	lua_pushinteger(L,ret);
	
	Result := 1;
end;

function VCLua_SynEdit_PhysicalToLogicalPos(L: Plua_State): Integer; cdecl;
var 
	lSynEdit:TLuaSynEdit;
	p:TPoint;
	ret:TPoint;
begin
	CheckArg(L, 2);
	lSynEdit := TLuaSynEdit(GetLuaObject(L, 1));
	p := lua_toTPoint(L,2);
	ret := lSynEdit.PhysicalToLogicalPos(p);
	lua_pushTPoint(L,ret);
	
	Result := 1;
end;

function VCLua_SynEdit_PhysicalToLogicalCol(L: Plua_State): Integer; cdecl;
var 
	lSynEdit:TLuaSynEdit;
	Line:string;
	Index:integer;
	PhysicalPos:integer;
	ret:integer;
begin
	CheckArg(L, 4);
	lSynEdit := TLuaSynEdit(GetLuaObject(L, 1));
	Line := lua_tostring(L,2);
	Index := lua_tointeger(L,3);
	PhysicalPos := lua_tointeger(L,4);
	ret := lSynEdit.PhysicalToLogicalCol(Line,Index,PhysicalPos);
	lua_pushinteger(L,ret);
	
	Result := 1;
end;

function VCLua_SynEdit_PhysicalLineLength(L: Plua_State): Integer; cdecl;
var 
	lSynEdit:TLuaSynEdit;
	Line:String;
	Index:integer;
	ret:integer;
begin
	CheckArg(L, 3);
	lSynEdit := TLuaSynEdit(GetLuaObject(L, 1));
	Line := lua_tostring(L,2);
	Index := lua_tointeger(L,3);
	ret := lSynEdit.PhysicalLineLength(Line,Index);
	lua_pushinteger(L,ret);
	
	Result := 1;
end;

function VCLua_SynEdit_CharIndexToRowCol(L: Plua_State): Integer; cdecl;
var 
	lSynEdit:TLuaSynEdit;
	Index:integer;
	ret:TPoint;
begin
	CheckArg(L, 2);
	lSynEdit := TLuaSynEdit(GetLuaObject(L, 1));
	Index := lua_tointeger(L,2);
	ret := lSynEdit.CharIndexToRowCol(Index);
	lua_pushTPoint(L,ret);
	
	Result := 1;
end;

function VCLua_SynEdit_RowColToCharIndex(L: Plua_State): Integer; cdecl;
var 
	lSynEdit:TLuaSynEdit;
	RowCol:TPoint;
	ret:integer;
begin
	CheckArg(L, 2);
	lSynEdit := TLuaSynEdit(GetLuaObject(L, 1));
	RowCol := lua_toTPoint(L,2);
	ret := lSynEdit.RowColToCharIndex(RowCol);
	lua_pushinteger(L,ret);
	
	Result := 1;
end;

function VCLua_SynEdit_PixelsToRowColumn(L: Plua_State): Integer; cdecl;
var 
	lSynEdit:TLuaSynEdit;
	Pixels:TPoint;
	aFlags:TSynCoordinateMappingFlags;
	ret:TPoint;
begin
	CheckArg(L, 3);
	lSynEdit := TLuaSynEdit(GetLuaObject(L, 1));
	Pixels := lua_toTPoint(L,2);
	aFlags := TSynCoordinateMappingFlags(GetLuaObject(L,3));
	ret := lSynEdit.PixelsToRowColumn(Pixels,aFlags);
	lua_pushTPoint(L,ret);
	
	Result := 1;
end;

function VCLua_SynEdit_PixelsToLogicalPos(L: Plua_State): Integer; cdecl;
var 
	lSynEdit:TLuaSynEdit;
	Pixels:TPoint;
	ret:TPoint;
begin
	CheckArg(L, 2);
	lSynEdit := TLuaSynEdit(GetLuaObject(L, 1));
	Pixels := lua_toTPoint(L,2);
	ret := lSynEdit.PixelsToLogicalPos(Pixels);
	lua_pushTPoint(L,ret);
	
	Result := 1;
end;

function VCLua_SynEdit_ScreenRowToRow(L: Plua_State): Integer; cdecl;
var 
	lSynEdit:TLuaSynEdit;
	ScreenRow:integer;
	LimitToLines:Boolean;
	ret:integer;
begin
	CheckArg(L, -1);
	lSynEdit := TLuaSynEdit(GetLuaObject(L, 1));
	ScreenRow := lua_tointeger(L,2);
	LimitToLines := luaL_optbool(L,3, True);
	ret := lSynEdit.ScreenRowToRow(ScreenRow,LimitToLines);
	lua_pushinteger(L,ret);
	
	Result := 1;
end;

function VCLua_SynEdit_RowToScreenRow(L: Plua_State): Integer; cdecl;
var 
	lSynEdit:TLuaSynEdit;
	PhysicalRow:integer;
	ret:integer;
begin
	CheckArg(L, 2);
	lSynEdit := TLuaSynEdit(GetLuaObject(L, 1));
	PhysicalRow := lua_tointeger(L,2);
	ret := lSynEdit.RowToScreenRow(PhysicalRow);
	lua_pushinteger(L,ret);
	
	Result := 1;
end;

function VCLua_SynEdit_Notification(L: Plua_State): Integer; cdecl;
var 
	lSynEdit:TLuaSynEdit;
	AComponent:TComponent;
	Operation:TOperation;
begin
	CheckArg(L, 3);
	lSynEdit := TLuaSynEdit(GetLuaObject(L, 1));
	AComponent := TComponent(GetLuaObject(L,2));
	Operation := TOperation(GetLuaObject(L,3));
	lSynEdit.Notification(AComponent,Operation);
	
	Result := 0;
end;

function VCLua_SynEdit_SearchReplace(L: Plua_State): Integer; cdecl;
var 
	lSynEdit:TLuaSynEdit;
	ASearch:string;
	AReplace:string;
	AOptions:TSynSearchOptions;
	ret:integer;
begin
	CheckArg(L, 4);
	lSynEdit := TLuaSynEdit(GetLuaObject(L, 1));
	ASearch := lua_tostring(L,2);
	AReplace := lua_tostring(L,3);
	AOptions := TSynSearchOptions(GetLuaObject(L,4));
	ret := lSynEdit.SearchReplace(ASearch,AReplace,AOptions);
	lua_pushinteger(L,ret);
	
	Result := 1;
end;

function VCLua_SynEdit_SearchReplaceEx(L: Plua_State): Integer; cdecl;
var 
	lSynEdit:TLuaSynEdit;
	ASearch:string;
	AReplace:string;
	AOptions:TSynSearchOptions;
	AStart:TPoint;
	ret:integer;
begin
	CheckArg(L, 5);
	lSynEdit := TLuaSynEdit(GetLuaObject(L, 1));
	ASearch := lua_tostring(L,2);
	AReplace := lua_tostring(L,3);
	AOptions := TSynSearchOptions(GetLuaObject(L,4));
	AStart := lua_toTPoint(L,5);
	ret := lSynEdit.SearchReplaceEx(ASearch,AReplace,AOptions,AStart);
	lua_pushinteger(L,ret);
	
	Result := 1;
end;

function VCLua_SynEdit_SetUseIncrementalColor(L: Plua_State): Integer; cdecl;
var 
	lSynEdit:TLuaSynEdit;
	AValue :Boolean;
begin
	CheckArg(L, 2);
	lSynEdit := TLuaSynEdit(GetLuaObject(L, 1));
	AValue  := lua_toboolean(L,2);
	lSynEdit.SetUseIncrementalColor(AValue );
	
	Result := 0;
end;

function VCLua_SynEdit_SetDefaultKeystrokes(L: Plua_State): Integer; cdecl;
var 
	lSynEdit:TLuaSynEdit;
begin
	CheckArg(L, 1);
	lSynEdit := TLuaSynEdit(GetLuaObject(L, 1));
	lSynEdit.SetDefaultKeystrokes();
	
	Result := 0;
end;

function VCLua_SynEdit_SetOptionFlag(L: Plua_State): Integer; cdecl;
var 
	lSynEdit:TLuaSynEdit;
	Flag:TSynEditorOption;
	Value:boolean;
begin
	CheckArg(L, 3);
	lSynEdit := TLuaSynEdit(GetLuaObject(L, 1));
	Flag := TSynEditorOption(GetLuaObject(L,2));
	Value := lua_toboolean(L,3);
	lSynEdit.SetOptionFlag(Flag,Value);
	
	Result := 0;
end;

function VCLua_SynEdit_UpdateAction(L: Plua_State): Integer; cdecl;
var 
	lSynEdit:TLuaSynEdit;
	TheAction:TBasicAction;
	ret:boolean;
begin
	CheckArg(L, 2);
	lSynEdit := TLuaSynEdit(GetLuaObject(L, 1));
	TheAction := TBasicAction(GetLuaObject(L,2));
	ret := lSynEdit.UpdateAction(TheAction);
	lua_pushboolean(L,ret);
	
	Result := 1;
end;

function VCLua_SynEdit_FindGutterFromGutterPartList(L: Plua_State): Integer; cdecl;
var 
	lSynEdit:TLuaSynEdit;
	APartList:TObject;
	ret:TObject;
begin
	CheckArg(L, 2);
	lSynEdit := TLuaSynEdit(GetLuaObject(L, 1));
	APartList := TObject(GetLuaObject(L,2));
	ret := lSynEdit.FindGutterFromGutterPartList(APartList);
	SynEditToTable(L,-1,ret);
	
	Result := 1;
end;

function VCLua_SynEdit_FindMatchingBracket(L: Plua_State): Integer; cdecl;
var 
	lSynEdit:TLuaSynEdit;
begin
	CheckArg(L, 1);
	lSynEdit := TLuaSynEdit(GetLuaObject(L, 1));
	lSynEdit.FindMatchingBracket();
	
	Result := 0;
end;

function VCLua_SynEdit_FindMatchingBracket2(L: Plua_State): Integer; cdecl;
var 
	lSynEdit:TLuaSynEdit;
	PhysStartBracket:TPoint;
	StartIncludeNeighborChars:Boolean;
	MoveCaret:Boolean;
	SelectBrackets:Boolean;
	OnlyVisible:Boolean;
	ret:TPoint;
begin
	CheckArg(L, 6);
	lSynEdit := TLuaSynEdit(GetLuaObject(L, 1));
	PhysStartBracket := lua_toTPoint(L,2);
	StartIncludeNeighborChars := lua_toboolean(L,3);
	MoveCaret := lua_toboolean(L,4);
	SelectBrackets := lua_toboolean(L,5);
	OnlyVisible := lua_toboolean(L,6);
	ret := lSynEdit.FindMatchingBracket(PhysStartBracket,StartIncludeNeighborChars,MoveCaret,SelectBrackets,OnlyVisible);
	lua_pushTPoint(L,ret);
	
	Result := 1;
end;

function VCLua_SynEdit_FindMatchingBracketLogical(L: Plua_State): Integer; cdecl;
var 
	lSynEdit:TLuaSynEdit;
	LogicalStartBracket:TPoint;
	StartIncludeNeighborChars:Boolean;
	MoveCaret:Boolean;
	SelectBrackets:Boolean;
	OnlyVisible:Boolean;
	ret:TPoint;
begin
	CheckArg(L, 6);
	lSynEdit := TLuaSynEdit(GetLuaObject(L, 1));
	LogicalStartBracket := lua_toTPoint(L,2);
	StartIncludeNeighborChars := lua_toboolean(L,3);
	MoveCaret := lua_toboolean(L,4);
	SelectBrackets := lua_toboolean(L,5);
	OnlyVisible := lua_toboolean(L,6);
	ret := lSynEdit.FindMatchingBracketLogical(LogicalStartBracket,StartIncludeNeighborChars,MoveCaret,SelectBrackets,OnlyVisible);
	lua_pushTPoint(L,ret);
	
	Result := 1;
end;

function VCLua_SynEdit_CodeFoldAction(L: Plua_State): Integer; cdecl;
var 
	lSynEdit:TLuaSynEdit;
	iLine:integer;
begin
	CheckArg(L, 2);
	lSynEdit := TLuaSynEdit(GetLuaObject(L, 1));
	iLine := lua_tointeger(L,2);
	lSynEdit.CodeFoldAction(iLine);
	
	Result := 0;
end;

function VCLua_SynEdit_UnfoldAll(L: Plua_State): Integer; cdecl;
var 
	lSynEdit:TLuaSynEdit;
begin
	CheckArg(L, 1);
	lSynEdit := TLuaSynEdit(GetLuaObject(L, 1));
	lSynEdit.UnfoldAll();
	
	Result := 0;
end;

function VCLua_SynEdit_FoldAll(L: Plua_State): Integer; cdecl;
var 
	lSynEdit:TLuaSynEdit;
	StartLevel :Integer;
	IgnoreNested :Boolean;
begin
	CheckArg(L, -1);
	lSynEdit := TLuaSynEdit(GetLuaObject(L, 1));
	StartLevel  := luaL_optint(L,2, 0);
	IgnoreNested  := luaL_optbool(L,3, False);
	lSynEdit.FoldAll(StartLevel ,IgnoreNested );
	
	Result := 0;
end;

function VCLua_SynEdit_AddKey(L: Plua_State): Integer; cdecl;
var 
	lSynEdit:TLuaSynEdit;
	Command:TSynEditorCommand;
	Key1:word;
	SS1:TShiftState;
	Key2:word;
	SS2:TShiftState;
begin
	CheckArg(L, 6);
	lSynEdit := TLuaSynEdit(GetLuaObject(L, 1));
	Command := TSynEditorCommand(GetLuaObject(L,2));
	Key1 := Word(lua_tointeger(L,3));
	SS1 := TShiftState(GetEnumValue(TypeInfo(TShiftState),lua_tostring(L,4)));
	Key2 := Word(lua_tointeger(L,5));
	SS2 := TShiftState(GetEnumValue(TypeInfo(TShiftState),lua_tostring(L,6)));
	lSynEdit.AddKey(Command,Key1,SS1,Key2,SS2);
	
	Result := 0;
end;

function VCLua_SynEdit_Invalidate(L: Plua_State): Integer; cdecl;
var 
	lSynEdit:TLuaSynEdit;
begin
	CheckArg(L, 1);
	lSynEdit := TLuaSynEdit(GetLuaObject(L, 1));
	lSynEdit.Invalidate();
	
	Result := 0;
end;

function VCLua_SynEdit_ShareTextBufferFrom(L: Plua_State): Integer; cdecl;
var 
	lSynEdit:TLuaSynEdit;
	AShareEditor:TCustomSynEdit;
begin
	CheckArg(L, 2);
	lSynEdit := TLuaSynEdit(GetLuaObject(L, 1));
	AShareEditor := TCustomSynEdit(GetLuaObject(L,2));
	lSynEdit.ShareTextBufferFrom(AShareEditor);
	
	Result := 0;
end;

function VCLua_SynEdit_UnShareTextBuffer(L: Plua_State): Integer; cdecl;
var 
	lSynEdit:TLuaSynEdit;
begin
	CheckArg(L, 1);
	lSynEdit := TLuaSynEdit(GetLuaObject(L, 1));
	lSynEdit.UnShareTextBuffer();
	
	Result := 0;
end;

function VCLua_SynEdit_PluginCount(L: Plua_State): Integer; cdecl;
var 
	lSynEdit:TLuaSynEdit;
	ret:Integer;
begin
	CheckArg(L, 1);
	lSynEdit := TLuaSynEdit(GetLuaObject(L, 1));
	ret := lSynEdit.PluginCount();
	lua_pushinteger(L,ret);
	
	Result := 1;
end;

function VCLua_SynEdit_MarkupCount(L: Plua_State): Integer; cdecl;
var 
	lSynEdit:TLuaSynEdit;
	ret:Integer;
begin
	CheckArg(L, 1);
	lSynEdit := TLuaSynEdit(GetLuaObject(L, 1));
	ret := lSynEdit.MarkupCount();
	lua_pushinteger(L,ret);
	
	Result := 1;
end;

function VCLua_SynEdit_UpdateCursorOverride(L: Plua_State): Integer; cdecl;
var 
	lSynEdit:TLuaSynEdit;
begin
	CheckArg(L, 1);
	lSynEdit := TLuaSynEdit(GetLuaObject(L, 1));
	lSynEdit.UpdateCursorOverride();
	
	Result := 0;
end;

procedure SynEditToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	SetDefaultMethods(L,Index,Sender);
	LuaSetTableFunction(L, Index, 'AfterLoadFromFile', @VCLua_SynEdit_AfterLoadFromFile);
	LuaSetTableFunction(L, Index, 'BeginUndoBlock', @VCLua_SynEdit_BeginUndoBlock);
	LuaSetTableFunction(L, Index, 'BeginUpdate', @VCLua_SynEdit_BeginUpdate);
	LuaSetTableFunction(L, Index, 'EndUndoBlock', @VCLua_SynEdit_EndUndoBlock);
	LuaSetTableFunction(L, Index, 'EndUpdate', @VCLua_SynEdit_EndUpdate);
	LuaSetTableFunction(L, Index, 'CaretXPix', @VCLua_SynEdit_CaretXPix);
	LuaSetTableFunction(L, Index, 'CaretYPix', @VCLua_SynEdit_CaretYPix);
	LuaSetTableFunction(L, Index, 'EnsureCursorPosVisible', @VCLua_SynEdit_EnsureCursorPosVisible);
	LuaSetTableFunction(L, Index, 'MoveCaretToVisibleArea', @VCLua_SynEdit_MoveCaretToVisibleArea);
	LuaSetTableFunction(L, Index, 'MoveCaretIgnoreEOL', @VCLua_SynEdit_MoveCaretIgnoreEOL);
	LuaSetTableFunction(L, Index, 'MoveLogicalCaretIgnoreEOL', @VCLua_SynEdit_MoveLogicalCaretIgnoreEOL);
	LuaSetTableFunction(L, Index, 'ClearSelection', @VCLua_SynEdit_ClearSelection);
	LuaSetTableFunction(L, Index, 'SelectAll', @VCLua_SynEdit_SelectAll);
	LuaSetTableFunction(L, Index, 'SelectToBrace', @VCLua_SynEdit_SelectToBrace);
	LuaSetTableFunction(L, Index, 'SelectWord', @VCLua_SynEdit_SelectWord);
	LuaSetTableFunction(L, Index, 'SelectLine', @VCLua_SynEdit_SelectLine);
	LuaSetTableFunction(L, Index, 'SelectParagraph', @VCLua_SynEdit_SelectParagraph);
	LuaSetTableFunction(L, Index, 'Clear', @VCLua_SynEdit_Clear);
	LuaSetTableFunction(L, Index, 'Append', @VCLua_SynEdit_Append);
	LuaSetTableFunction(L, Index, 'ClearAll', @VCLua_SynEdit_ClearAll);
	LuaSetTableFunction(L, Index, 'InsertTextAtCaret', @VCLua_SynEdit_InsertTextAtCaret);
	LuaSetTableFunction(L, Index, 'SetTextBetweenPoints', @VCLua_SynEdit_SetTextBetweenPoints);
	LuaSetTableFunction(L, Index, 'GetLineState', @VCLua_SynEdit_GetLineState);
	LuaSetTableFunction(L, Index, 'MarkTextAsSaved', @VCLua_SynEdit_MarkTextAsSaved);
	LuaSetTableFunction(L, Index, 'ClearBookMark', @VCLua_SynEdit_ClearBookMark);
	LuaSetTableFunction(L, Index, 'GetBookMark', @VCLua_SynEdit_GetBookMark);
	LuaSetTableFunction(L, Index, 'GotoBookMark', @VCLua_SynEdit_GotoBookMark);
	LuaSetTableFunction(L, Index, 'IsBookmark', @VCLua_SynEdit_IsBookmark);
	LuaSetTableFunction(L, Index, 'SetBookMark', @VCLua_SynEdit_SetBookMark);
	LuaSetTableFunction(L, Index, 'ClearUndo', @VCLua_SynEdit_ClearUndo);
	LuaSetTableFunction(L, Index, 'Redo', @VCLua_SynEdit_Redo);
	LuaSetTableFunction(L, Index, 'Undo', @VCLua_SynEdit_Undo);
	LuaSetTableFunction(L, Index, 'CopyToClipboard', @VCLua_SynEdit_CopyToClipboard);
	LuaSetTableFunction(L, Index, 'CutToClipboard', @VCLua_SynEdit_CutToClipboard);
	LuaSetTableFunction(L, Index, 'PasteFromClipboard', @VCLua_SynEdit_PasteFromClipboard);
	LuaSetTableFunction(L, Index, 'DoCopyToClipboard', @VCLua_SynEdit_DoCopyToClipboard);
	LuaSetTableFunction(L, Index, 'DragDrop', @VCLua_SynEdit_DragDrop);
	LuaSetTableFunction(L, Index, 'ExecuteAction', @VCLua_SynEdit_ExecuteAction);
	LuaSetTableFunction(L, Index, 'CommandProcessor', @VCLua_SynEdit_CommandProcessor);
	LuaSetTableFunction(L, Index, 'ExecuteCommand', @VCLua_SynEdit_ExecuteCommand);
	LuaSetTableFunction(L, Index, 'GetHighlighterAttriAtRowCol', @VCLua_SynEdit_GetHighlighterAttriAtRowCol);
	LuaSetTableFunction(L, Index, 'GetHighlighterAttriAtRowColEx', @VCLua_SynEdit_GetHighlighterAttriAtRowColEx);
	LuaSetTableFunction(L, Index, 'CaretAtIdentOrString', @VCLua_SynEdit_CaretAtIdentOrString);
	LuaSetTableFunction(L, Index, 'GetWordBoundsAtRowCol', @VCLua_SynEdit_GetWordBoundsAtRowCol);
	LuaSetTableFunction(L, Index, 'GetWordAtRowCol', @VCLua_SynEdit_GetWordAtRowCol);
	LuaSetTableFunction(L, Index, 'NextWordPos', @VCLua_SynEdit_NextWordPos);
	LuaSetTableFunction(L, Index, 'PrevWordPos', @VCLua_SynEdit_PrevWordPos);
	LuaSetTableFunction(L, Index, 'IsIdentChar', @VCLua_SynEdit_IsIdentChar);
	LuaSetTableFunction(L, Index, 'IsLinkable', @VCLua_SynEdit_IsLinkable);
	LuaSetTableFunction(L, Index, 'InvalidateGutter', @VCLua_SynEdit_InvalidateGutter);
	LuaSetTableFunction(L, Index, 'InvalidateLine', @VCLua_SynEdit_InvalidateLine);
	LuaSetTableFunction(L, Index, 'InvalidateLines', @VCLua_SynEdit_InvalidateLines);
	LuaSetTableFunction(L, Index, 'LogicalToPhysicalPos', @VCLua_SynEdit_LogicalToPhysicalPos);
	LuaSetTableFunction(L, Index, 'LogicalToPhysicalCol', @VCLua_SynEdit_LogicalToPhysicalCol);
	LuaSetTableFunction(L, Index, 'PhysicalToLogicalPos', @VCLua_SynEdit_PhysicalToLogicalPos);
	LuaSetTableFunction(L, Index, 'PhysicalToLogicalCol', @VCLua_SynEdit_PhysicalToLogicalCol);
	LuaSetTableFunction(L, Index, 'PhysicalLineLength', @VCLua_SynEdit_PhysicalLineLength);
	LuaSetTableFunction(L, Index, 'CharIndexToRowCol', @VCLua_SynEdit_CharIndexToRowCol);
	LuaSetTableFunction(L, Index, 'RowColToCharIndex', @VCLua_SynEdit_RowColToCharIndex);
	LuaSetTableFunction(L, Index, 'PixelsToRowColumn', @VCLua_SynEdit_PixelsToRowColumn);
	LuaSetTableFunction(L, Index, 'PixelsToLogicalPos', @VCLua_SynEdit_PixelsToLogicalPos);
	LuaSetTableFunction(L, Index, 'ScreenRowToRow', @VCLua_SynEdit_ScreenRowToRow);
	LuaSetTableFunction(L, Index, 'RowToScreenRow', @VCLua_SynEdit_RowToScreenRow);
	LuaSetTableFunction(L, Index, 'Notification', @VCLua_SynEdit_Notification);
	LuaSetTableFunction(L, Index, 'SearchReplace', @VCLua_SynEdit_SearchReplace);
	LuaSetTableFunction(L, Index, 'SearchReplaceEx', @VCLua_SynEdit_SearchReplaceEx);
	LuaSetTableFunction(L, Index, 'SetUseIncrementalColor', @VCLua_SynEdit_SetUseIncrementalColor);
	LuaSetTableFunction(L, Index, 'SetDefaultKeystrokes', @VCLua_SynEdit_SetDefaultKeystrokes);
	LuaSetTableFunction(L, Index, 'SetOptionFlag', @VCLua_SynEdit_SetOptionFlag);
	LuaSetTableFunction(L, Index, 'UpdateAction', @VCLua_SynEdit_UpdateAction);
	LuaSetTableFunction(L, Index, 'FindGutterFromGutterPartList', @VCLua_SynEdit_FindGutterFromGutterPartList);
	LuaSetTableFunction(L, Index, 'FindMatchingBracket', @VCLua_SynEdit_FindMatchingBracket);
	LuaSetTableFunction(L, Index, 'FindMatchingBracket2', @VCLua_SynEdit_FindMatchingBracket2);
	LuaSetTableFunction(L, Index, 'FindMatchingBracketLogical', @VCLua_SynEdit_FindMatchingBracketLogical);
	LuaSetTableFunction(L, Index, 'CodeFoldAction', @VCLua_SynEdit_CodeFoldAction);
	LuaSetTableFunction(L, Index, 'UnfoldAll', @VCLua_SynEdit_UnfoldAll);
	LuaSetTableFunction(L, Index, 'FoldAll', @VCLua_SynEdit_FoldAll);
	LuaSetTableFunction(L, Index, 'AddKey', @VCLua_SynEdit_AddKey);
	LuaSetTableFunction(L, Index, 'Invalidate', @VCLua_SynEdit_Invalidate);
	LuaSetTableFunction(L, Index, 'ShareTextBufferFrom', @VCLua_SynEdit_ShareTextBufferFrom);
	LuaSetTableFunction(L, Index, 'UnShareTextBuffer', @VCLua_SynEdit_UnShareTextBuffer);
	LuaSetTableFunction(L, Index, 'PluginCount', @VCLua_SynEdit_PluginCount);
	LuaSetTableFunction(L, Index, 'MarkupCount', @VCLua_SynEdit_MarkupCount);
	LuaSetTableFunction(L, Index, 'UpdateCursorOverride', @VCLua_SynEdit_UpdateCursorOverride);
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
end;
function CreateSynEdit(L: Plua_State): Integer; cdecl;
var
	lSynEdit:TLuaSynEdit;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lSynEdit := TLuaSynEdit.Create(Parent);
	lSynEdit.Parent := TWinControl(Parent);
	lSynEdit.LuaCtl := TVCLuaControl.Create(TControl(lSynEdit),L,@SynEditToTable);
	InitControl(L,lSynEdit,Name);
	SynEditToTable(L, -1, lSynEdit);
	Result := 1;
end;

end.
