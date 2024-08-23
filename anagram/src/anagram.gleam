import gleam/list
import gleam/string

pub fn find_anagrams(word: String, candidates: List(String)) -> List(String) {
  candidates
  |> list.filter(fn(candidate) {
    string.lowercase(candidate) != string.lowercase(word)
  })
  |> list.filter(fn(candidate) {
    word
    |> string.lowercase()
    |> string.to_graphemes()
    |> list.sort(string.compare)
    == candidate
    |> string.lowercase()
    |> string.to_graphemes()
    |> list.sort(string.compare)
  })
}
