import gleam/string

fn is_question(string: String) -> Bool {
  string.ends_with(string, "?")
}

fn is_yelling(string: String) -> Bool {
  string == string.uppercase(string) && string.lowercase(string) != string
}

fn calm_down(string: String) -> Bool {
  is_yelling(string) && is_question(string)
}

pub fn hey(remark: String) -> String {
  let trimmed = string.trim(remark)
  let question = is_question(trimmed)
  let yelling = is_yelling(trimmed)
  let calm = calm_down(trimmed)
  let empty = string.is_empty(trimmed)
  case trimmed {
    _ if empty -> "Fine. Be that way!"
    _ if calm -> "Calm down, I know what I'm doing!"
    _ if question -> "Sure."
    _ if yelling -> "Whoa, chill out!"
    _ -> "Whatever."
  }
}
