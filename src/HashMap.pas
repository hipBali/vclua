unit HashMap;

{$mode Delphi}

interface

uses LazFglHash, Contnrs;

type
  THashMap<T> = class(TLazFPGHashTable<T>)
    protected
      // original GetData returns bullshit for absent indices, this returns default
      function GetData(const index: string): T; override;
  end;

  THashList = class(TFPHashObjectList)
    public
      procedure Merge(const parent: THashList);
      procedure MergeOne(Item: TObject; arg: pointer);
  end;

implementation

procedure THashList.Merge(const parent: THashList);
begin
  parent.ForEachCall(Self.MergeOne, nil);
end;

procedure THashList.MergeOne(Item: TObject; arg: pointer);
var
  Key: ShortString;
begin
  Key := (Item as TFPHashObject).Name;
  if (Self.FindIndexOf(Key) = -1) then
     Self.Add(Key, Item);
end;

function THashMap<T>.GetData(const index: string): T;
var
  node: THTCustomNode;
begin
  Result := Default(T);
  node:=Self.Find(Index);
  if Assigned(node) then
    Result:=THTGNode(node).Data;
end;

end.
