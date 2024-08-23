import gleam/list

pub fn new_list() -> List(String) {
  []
}

pub fn existing_list() -> List(String) {
  ["Gleam", "Go", "TypeScript"]
}

pub fn add_language(languages: List(String), language: String) -> List(String) {
  [language, ..languages]
}

pub fn count_languages(languages: List(String)) -> Int {
  case languages {
    [] -> 0
    [_, ..rest] -> count_languages(rest) + 1
  }
}

pub fn reverse_list(languages: List(String)) -> List(String) {
  list.reverse(languages)
}

pub fn exciting_list(languages: List(String)) -> Bool {
  let two_or_three =
    count_languages(languages) == 2 || count_languages(languages) == 3
  case languages {
    ["Gleam", ..] -> True
    [_, "Gleam", ..] if two_or_three -> True
    _ -> False
  }
}
