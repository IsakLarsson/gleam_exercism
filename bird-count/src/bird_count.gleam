pub fn today(days: List(Int)) -> Int {
  case days {
    [today, ..] -> today
    [] -> 0
  }
}

pub fn increment_day_count(days: List(Int)) -> List(Int) {
  case days {
    [today, ..rest] -> [today + 1, ..rest]
    [] -> [1]
  }
}

pub fn has_day_without_birds(days: List(Int)) -> Bool {
  case days {
    [] -> False
    [0, ..] -> True
    [_, ..rest] -> has_day_without_birds(rest)
  }
}

pub fn total(days: List(Int)) -> Int {
  case days {
    [] -> 0
    [day, ..rest] -> total(rest) + day
  }
}

pub fn busy_days(days: List(Int)) -> Int {
  case days {
    [] -> 0
    [day, ..rest] if day >= 5 -> busy_days(rest) + 1
    [_, ..rest] -> busy_days(rest)
  }
}
