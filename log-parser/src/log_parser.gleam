import gleam/regex

pub fn is_valid_line(line: String) -> Bool {
  let assert Ok(re) = regex.from_string("^([ERROR]|[WARN]|[INFO])")
}

pub fn split_line(line: String) -> List(String) {
  todo
}

pub fn tag_with_user_name(line: String) -> String {
  todo
}
