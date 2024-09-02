import gleam/float
import gleam/list

pub fn equilateral(a: Float, b: Float, c: Float) -> Bool {
  is_triangle(a, b, c) && a == b && b == c
}

pub fn isosceles(a: Float, b: Float, c: Float) -> Bool {
  is_triangle(a, b, c) && { a == b || b == c || a == c }
}

pub fn scalene(a: Float, b: Float, c: Float) -> Bool {
  is_triangle(a, b, c) && { a != b && b != c && a != c }
}

fn is_triangle(a: Float, b: Float, c: Float) -> Bool {
  let assert Ok(largest) = [a, b, c] |> list.sort(float.compare) |> list.last()
  2.0 *. largest <. a +. b +. c
}
