import gleam/list
import gleam/result
import gleam/string

pub fn extract_error(problem: Result(a, b)) -> b {
  let assert Error(err) = problem
  err
}

pub fn remove_team_prefix(team: String) -> String {
  let assert Ok(team) = string.split(team, " ") |> list.last()
  team
}

pub fn split_region_and_team(combined: String) -> #(String, String) {
  let assert [region, team] = string.split(combined, ",")
  #(region, remove_team_prefix(team))
}
