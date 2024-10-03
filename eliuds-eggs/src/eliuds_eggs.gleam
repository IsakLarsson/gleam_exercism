import gleam/int
import gleam/list

pub fn egg_count(number: Int) -> Int {
  sum_binary(number, [])
  // or super concise
  // case number {
  //   0 -> 0
  //   _ -> number % 2 + egg_count(number / 2)
  // }
}

fn sum_binary(number: Int, acc: List(Int)) -> Int {
  let remainder = number % 2
  case number, remainder == 0 {
    0, _ -> list.reverse(acc) |> int.sum()
    _, False -> sum_binary(number / 2, [remainder, ..acc])
    _, True -> sum_binary(number / 2, [0, ..acc])
  }
}
