import gleam/list

pub opaque type Set(t) {
  Set(members: List(t))
}

pub fn new(members: List(t)) -> Set(t) {
  members |> list.unique() |> Set
}

pub fn is_empty(set: Set(t)) -> Bool {
  set.members |> list.is_empty()
}

pub fn contains(in set: Set(t), this member: t) -> Bool {
  set.members |> list.contains(member)
}

pub fn is_subset(first: Set(t), of second: Set(t)) -> Bool {
  list.all(first.members, contains(second, _))
}

pub fn disjoint(first: Set(t), second: Set(t)) -> Bool {
  !list.any(first.members, contains(second, _))
}

pub fn is_equal(first: Set(t), to second: Set(t)) -> Bool {
  is_subset(first, second) && is_subset(second, first)
}

pub fn add(to set: Set(t), this member: t) -> Set(t) {
  Set([member, ..set.members])
}

pub fn intersection(of first: Set(t), and second: Set(t)) -> Set(t) {
  first.members
  |> list.filter(fn(x) { list.contains(second.members, x) })
  |> Set
}

pub fn difference(between first: Set(t), and second: Set(t)) -> Set(t) {
  first.members
  |> list.filter(fn(x) { !list.contains(second.members, x) })
  |> Set
}

pub fn union(of first: Set(t), and second: Set(t)) -> Set(t) {
  [first.members, second.members] |> list.concat |> Set
}
