import gleam/list
import gleam/result
import gleam/string

pub fn to_rna(dna: String) -> Result(String, Nil) {
  case get_dna_as_list(dna) {
    [] -> Ok("")
    sequence ->
      list.try_map(sequence, fn(char) { translate_dna(char) })
      |> result.map(string.concat)
  }
}

pub fn get_dna_as_list(dna: String) -> List(String) {
  dna |> string.to_graphemes()
}

pub fn translate_dna(char: String) -> Result(String, Nil) {
  case char {
    "G" -> "C" |> Ok
    "C" -> "G" |> Ok
    "T" -> "A" |> Ok
    "A" -> "U" |> Ok
    _ -> Error(Nil)
  }
}
//G -> C
//C -> G
//T -> A
//A -> U
