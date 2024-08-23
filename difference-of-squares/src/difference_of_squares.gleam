pub fn square_of_sum(n: Int) -> Int {
  let sum = case n {
    1 -> 1
    _ -> square_of_sum(n - 1)
  }
  sum * sum
}

pub fn sum_of_squares(n: Int) -> Int {
  todo as "Implement this function"
}

pub fn difference(n: Int) -> Int {
  todo as "Implement this function"
}
