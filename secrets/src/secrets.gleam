pub fn secret_add(secret: Int) -> fn(Int) -> Int {
  fn(add) { add + secret }
}

pub fn secret_subtract(secret: Int) -> fn(Int) -> Int {
  fn(subtract) { subtract - secret }
}

pub fn secret_multiply(secret: Int) -> fn(Int) -> Int {
  fn(multi) { multi * secret }
}

pub fn secret_divide(secret: Int) -> fn(Int) -> Int {
  fn(divide) { divide / secret }
}

pub fn secret_combine(
  secret_function1: fn(Int) -> Int,
  secret_function2: fn(Int) -> Int,
) -> fn(Int) -> Int {
  fn(secret) {
    secret_function1(secret)
    |> secret_function2
  }
}
