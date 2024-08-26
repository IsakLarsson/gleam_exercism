import gleam/regex
import gleam/result
import gleam/string

pub fn clean(input: String) -> Result(String, String) {
  let input = string.trim(input)
  input
  |> remove_separators()
  |> contains_digits_only()
  |> result.try(check_length_and_country_code)
  |> result.try(check_area_code)
  |> result.try(check_exchange_code)
}

fn check_length_and_country_code(input: String) -> Result(String, String) {
  case string.length(input), input {
    11, "1" <> rest -> Ok(rest)
    11, _ -> Error("11 digits must start with 1")
    10, _ -> Ok(input)
    x, _ if x > 11 -> Error("must not be greater than 11 digits")
    _, _ -> Error("must not be fewer than 10 digits")
  }
}

fn check_exchange_code(input: String) -> Result(String, String) {
  case string.slice(input, 3, 1) {
    "1" -> Error("exchange code cannot start with one")
    "0" -> Error("exchange code cannot start with zero")
    _ -> Ok(input)
  }
}

fn contains_digits_only(input: String) -> Result(String, String) {
  let assert Ok(letters) = regex.from_string("[a-zA-Z]")
  let assert Ok(non_numbers) = regex.from_string("[^0-9]")

  case regex.check(letters, input), regex.check(non_numbers, input) {
    True, _ -> Error("letters not permitted")
    _, True -> Error("punctuations not permitted")
    False, False -> Ok(input)
  }
}

fn check_area_code(input: String) -> Result(String, String) {
  case string.slice(input, 0, 1) {
    "1" -> Error("area code cannot start with one")
    "0" -> Error("area code cannot start with zero")
    _ -> Ok(input)
  }
}

fn remove_separators(input: String) -> String {
  let assert Ok(re) = regex.from_string("[+()-. ]")
  re |> regex.split(input) |> string.concat()
}
