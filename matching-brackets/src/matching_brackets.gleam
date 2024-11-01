import gleam/io
import gleam/list
import gleam/result
import gleam/string

pub fn is_paired(value: String) -> Bool {
  value
  |> string.to_graphemes()
  |> do_paired([])
}

fn do_paired(text: List(String), acc: List(String)) -> Bool {
  //for each character, if it is an opening bracket,
  // if it is, add to stack,
  // if it is a closing bracket, check if it matches the top opening bracket in the stack
  //if it does, remove the opening bracket from the stack
  io.debug(acc)
  case text, acc {
    ["(", ..rest], acc -> do_paired(rest, ["(", ..acc])
    ["{", ..rest], acc -> do_paired(rest, ["{", ..acc])
    ["[", ..rest], acc -> do_paired(rest, ["[", ..acc])
    [")", ..rest], acc ->
      case list.first(acc) |> result.unwrap("") |> check_match("(") {
        True -> do_paired(rest, remove_first(acc))
        False -> False
      }
    ["}", ..rest], acc ->
      case list.first(acc) |> result.unwrap("") |> check_match("{") {
        True -> do_paired(rest, remove_first(acc))
        False -> False
      }
    ["]", ..rest], acc ->
      case list.first(acc) |> result.unwrap("") |> check_match("]") {
        True -> do_paired(rest, remove_first(acc))
        False -> False
      }
    [_, ..rest], acc -> do_paired(rest, acc)
    [], [] -> True
    [], [_, ..] -> False
  }
}

fn remove_first(list: List(a)) -> List(a) {
  case list.rest(list) {
    Ok(list) -> list
    Error(_) -> list
  }
}

fn check_match(char: String, match: String) -> Bool {
  case char {
    "(" if match == ")" -> True
    "{" if match == "}" -> True
    "[" if match == "]" -> True
    _ -> False
  }
}
