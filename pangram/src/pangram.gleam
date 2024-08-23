import gleam/list
import gleam/regex
import gleam/set
import gleam/string

const alphabet = [
  "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p",
  "q", "r", "s", "t", "u", "v", "w", "x", "y", "z",
]

pub fn is_pangram(sentence: String) -> Bool {
  alphabet
  |> list.all(string.contains(string.lowercase(sentence), _))
}
