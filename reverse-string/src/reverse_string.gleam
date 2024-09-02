import gleam/string

pub fn reverse(value: String) -> String {
  string.to_graphemes(value) |> do_reverse([]) |> string.join("")
}

fn do_reverse(value: List(String), acc: List(String)) -> List(String) {
  case value {
    [] -> acc
    [a, ..rest] -> do_reverse(rest, [a, ..acc])
  }
}
