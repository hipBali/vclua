unit HashList;

{$mode Delphi}

interface

uses Contnrs;

type
  THashList = class;
  PHashList = ^THashList;
  THashList = class(TFPHashObjectList)
    public
      procedure Merge(const parent: PHashList);
      procedure MergeOne(Item: TObject; arg: pointer);
  end;

implementation

procedure THashList.Merge(const parent: PHashList);
begin
  parent^.ForEachCall(Self.MergeOne, nil);
end;

procedure THashList.MergeOne(Item: TObject; arg: pointer);
var
  Key: ShortString;
begin
  Key := (Item as TFPHashObject).Name;
  if (Self.FindIndexOf(Key) = -1) then
     Self.Add(Key, Item);
end;

end.
