import gleam/list
import gleam/result
import gleam/string
import simplifile

pub fn read_emails(path: String) -> Result(List(String), Nil) {
  case simplifile.read(path) {
    Error(_) -> Error(Nil)
    Ok(content) -> content |> string.trim() |> string.split("\n") |> Ok()
  }
}

pub fn create_log_file(path: String) -> Result(Nil, Nil) {
  case simplifile.create_file(path) {
    Error(_) -> Error(Nil)
    Ok(_) -> Ok(Nil)
  }
}

pub fn log_sent_email(path: String, email: String) -> Result(Nil, Nil) {
  case simplifile.append(path, email <> "\n") {
    Error(_) -> Error(Nil)
    Ok(_) -> Ok(Nil)
  }
}

pub fn send_newsletter(
  emails_path: String,
  log_path: String,
  send_email: fn(String) -> Result(Nil, Nil),
) -> Result(Nil, Nil) {
  let _ = create_log_file(log_path)
  read_emails(emails_path)
  |> result.unwrap(or: [])
  |> list.map(fn(email) {
    case send_email(email) {
      Ok(_) -> log_sent_email(log_path, email)
      _ -> Error(Nil)
    }
  })
  Ok(Nil)
}
