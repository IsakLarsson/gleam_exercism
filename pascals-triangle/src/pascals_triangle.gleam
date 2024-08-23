import gleam/list

pub fn rows(n: Int) -> List(List(Int)) {
  case n {
    0 -> [[]]
    1 -> [[1]]
    _ -> {
      let smaller_triangle = rows(n - 1)
      let assert Ok(last_row) = list.last(smaller_triangle)
      let new_row = list.concat([[[1]], [last_row]])
    }
  }
}
