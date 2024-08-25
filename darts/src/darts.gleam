import gleam/float
import gleam/result

type Score {
  Miss
  Outer
  Middle
  Inner
}

pub fn score(x: Float, y: Float) -> Int {
  let hit = distance_from_center(x, y) |> distance_to_score()
  case hit {
    Miss -> 0
    Outer -> 1
    Middle -> 5
    Inner -> 10
  }
}

fn distance_to_score(distance: Float) -> Score {
  case distance {
    x if x <=. 1.0 -> Inner
    x if x <=. 5.0 -> Middle
    x if x <=. 10.0 -> Outer
    _ -> Miss
  }
}

fn distance_from_center(x: Float, y: Float) -> Float {
  let x_square = x *. x
  let y_square = y *. y
  float.square_root(x_square +. y_square)
  |> result.unwrap(0.0)
}
