import gleam/io
import gleam/list

pub fn proteins(rna: String) -> Result(List(String), Nil) {
  to_proteins(rna, [])
}

//this is uglier than my first iteration but i rewrote it to learn and made it more concise 
pub fn to_proteins(rna: String, acc: List(String)) -> Result(List(String), Nil) {
  case rna {
    "AUG" <> rest -> to_proteins(rest, ["Methionine", ..acc])
    "UUU" <> rest | "UUC" <> rest -> to_proteins(rest, ["Phenylalanine", ..acc])
    "UUA" <> rest | "UUG" <> rest -> to_proteins(rest, ["Leucine", ..acc])
    "UCU" <> rest | "UCC" <> rest | "UCA" <> rest | "UCG" <> rest ->
      to_proteins(rest, ["Serine", ..acc])
    "UAU" <> rest | "UAC" <> rest -> to_proteins(rest, ["Tyrosine", ..acc])
    "UGU" <> rest | "UGC" <> rest -> to_proteins(rest, ["Cysteine", ..acc])
    "UGG" <> rest -> to_proteins(rest, ["Tryptophan", ..acc])
    "" | "UAA" <> _ | "UAG" <> _ | "UGA" <> _ -> Ok(list.reverse(acc))
    _ -> Error(Nil)
  }
}
//I need to study these types of recursive algorithms
// to_proteins(rest, ["Serine, ..acc"])
//pick out a 3 letter sequence and translate it 
// add it to a list with the accumulated list behind it
// put the rest of the string in to the function as the first argument
// as the second argument, we pass in a list of the so far decoded proteins.
// This list is then used as accumulator in the next iteration of the function
