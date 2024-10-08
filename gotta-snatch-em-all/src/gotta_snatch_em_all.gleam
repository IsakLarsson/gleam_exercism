import gleam/list
import gleam/set.{type Set}
import gleam/string

pub fn new_collection(card: String) -> Set(String) {
  set.from_list([card])
}

pub fn add_card(collection: Set(String), card: String) -> #(Bool, Set(String)) {
  #(set.contains(collection, card), set.insert(collection, card))
}

pub fn trade_card(
  my_card: String,
  their_card: String,
  collection: Set(String),
) -> #(Bool, Set(String)) {
  #(
    !set.contains(collection, their_card) && set.contains(collection, my_card),
    set.delete(collection, my_card) |> set.insert(their_card),
  )
}

pub fn boring_cards(collections: List(Set(String))) -> List(String) {
  case collections {
    [] -> set.new()
    [c] -> c
    [c, ..cs] -> list.fold(cs, c, set.intersection)
  }
  |> set.to_list()
}

pub fn total_cards(collections: List(Set(String))) -> Int {
  list.fold(collections, set.new(), set.union)
  |> set.size()
}

pub fn shiny_cards(collection: Set(String)) -> Set(String) {
  set.filter(collection, fn(card) { string.starts_with(card, "Shiny ") })
}
