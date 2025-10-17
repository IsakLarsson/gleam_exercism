import gleam/list
import gleam/string

const ignore_list = ["", " ", "_", "-"]

pub fn find_words(input: List(String)) -> String {
  work_find_word(input, "", "")
}

fn work_find_word(input: List(String), previous: String, acc: String) -> String {
  case input {
    [] -> acc
    [x, ..xs] ->
      case list.contains(ignore_list, x) {
        True -> work_find_word(xs, x, acc)
        False ->
          case list.contains(ignore_list, previous) {
            True -> work_find_word(xs, x, acc <> string.uppercase(x))
            False -> work_find_word(xs, x, acc)
          }
      }
  }
}

pub fn abbreviate(phrase phrase: String) -> String {
  phrase
  |> string.to_graphemes()
  |> find_words()
}
