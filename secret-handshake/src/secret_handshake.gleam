import gleam/int
import gleam/list
import gleam/option.{None, Some}
import gleam/string

pub type Command {
  Wink
  DoubleBlink
  CloseYourEyes
  Jump
  ReverseOrder
}

pub fn commands(encoded_message: Int) -> List(Command) {
  let command_list =
    encoded_message
    |> int.to_base2()
    |> string.to_graphemes()
    |> list.reverse()
    |> list.index_map(fn(number, index) {
      case number {
        "1" if index == 0 -> Some(Wink)
        "1" if index == 1 -> Some(DoubleBlink)
        "1" if index == 2 -> Some(CloseYourEyes)
        "1" if index == 3 -> Some(Jump)
        "1" if index == 4 -> Some(ReverseOrder)
        _ -> None
      }
    })
    |> option.values()

  case command_list |> list.contains(ReverseOrder) {
    True -> command_list |> list.reverse() |> remove_reverse_command()
    False -> command_list |> remove_reverse_command()
  }
}

fn remove_reverse_command(commands: List(Command)) -> List(Command) {
  commands |> list.filter(fn(x) { x != ReverseOrder })
}
