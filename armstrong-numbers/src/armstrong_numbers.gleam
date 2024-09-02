import gleam/int
import gleam/list

pub fn is_armstrong_number(number: Int) -> Bool {
  let assert Ok(digits) = int.digits(number, 10)
  do_armstrong(digits) == number
}

fn do_armstrong(numbers: List(Int)) -> Int {
  let length = numbers |> list.length()
  numbers |> list.fold(0, fn(acc, number) { acc + exp(number, length) })
}

fn exp(number: Int, pow: Int) -> Int {
  list.repeat(number, pow) |> list.fold(1, fn(acc, x) { acc * x })
}
