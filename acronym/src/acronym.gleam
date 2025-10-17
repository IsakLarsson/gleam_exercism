import gleam/list
import gleam/string

const ignore_list = ["", " ", "_", "-"]

pub fn find_words(input: List(String), previous: String, acc: String) -> String {
  case input {
    [] -> acc
    [x, ..xs] ->
      case list.contains(ignore_list, x) {
        True -> find_words(xs, x, acc)
        False ->
          case list.contains(ignore_list, previous) {
            True -> find_words(xs, x, acc <> x)
            False -> find_words(xs, x, acc)
          }
      }
  }
}

pub fn abbreviate(phrase phrase: String) -> String {
  phrase
  |> string.to_graphemes()
  |> find_words("", "")
  |> string.uppercase()
}
