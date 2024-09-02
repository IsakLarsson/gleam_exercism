import gleam/int
import gleam/io

pub type Error {
  InvalidSquare
}

pub fn square(square: Int) -> Result(Int, Error) {
  case square {
    x if x == 1 -> Ok(1)
    x if x > 1 && x <= 64 -> Ok(int.bitwise_shift_left(1, square - 1))
    _ -> Error(InvalidSquare)
  }
}

pub fn total() -> Int {
  int.bitwise_shift_left(1, 64) - 1
}

pub fn main() {
  io.debug(total())
}
