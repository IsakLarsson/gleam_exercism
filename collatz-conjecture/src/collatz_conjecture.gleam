import gleam/int

pub type Error {
  NonPositiveNumber
}

pub fn steps(number: Int) -> Result(Int, Error) {
  case number {
    x if x <= 0 -> Error(NonPositiveNumber)
    _ -> Ok(do_collatz(number, 0))
  }
}

fn do_collatz(number: Int, acc: Int) -> Int {
  case int.is_odd(number), number {
    _, 1 -> acc
    False, _ -> do_collatz(number / 2, acc + 1)
    True, _ -> do_collatz({ number * 3 } + 1, acc + 1)
  }
}
