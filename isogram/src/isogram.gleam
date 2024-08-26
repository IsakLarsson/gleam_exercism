import gleam/list
import gleam/regex
import gleam/string

pub fn is_isogram(phrase phrase: String) -> Bool {
  let clean =
    phrase
    |> remove_specials()
    |> string.to_graphemes()
  list.unique(clean) == clean
}

fn remove_specials(input: String) -> String {
  let assert Ok(re) = regex.from_string("[ -]")
  re |> regex.split(input) |> string.concat() |> string.lowercase()
}
