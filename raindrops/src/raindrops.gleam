import gleam/int
import gleam/list
import gleam/string

pub fn convert(number: Int) -> String {
  [#(3, "Pling"), #(5, "Plang"), #(7, "Plong")]
  |> list.map(fn(sound) {
    case number % sound.0 == 0 {
      True -> sound.1
      False -> ""
    }
  })
  |> string.concat()
  |> fn(sounds) {
    case sounds {
      "" -> int.to_string(number)
      _ -> sounds
    }
  }
}
