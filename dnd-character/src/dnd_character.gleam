import gleam/int
import gleam/list

pub type Character {
  Character(
    charisma: Int,
    constitution: Int,
    dexterity: Int,
    hitpoints: Int,
    intelligence: Int,
    strength: Int,
    wisdom: Int,
  )
}

pub fn generate_character() -> Character {
  let constitution = ability()
  Character(
    charisma: ability(),
    constitution: constitution,
    dexterity: ability(),
    hitpoints: 10 + { modifier(constitution) },
    intelligence: ability(),
    strength: ability(),
    wisdom: ability(),
  )
}

pub fn modifier(score: Int) -> Int {
  case { score - 10 } |> int.floor_divide(2) {
    Error(_) -> 0
    Ok(v) -> v
  }
}

pub fn ability() -> Int {
  roll_dice([], 4)
  |> list.sort(int.compare)
  |> list.drop(1)
  |> list.fold(0, int.add)
}

fn roll_dice(throws: List(Int), times: Int) -> List(Int) {
  case times {
    0 -> throws
    _ -> {
      let dice_roll = int.random(5) + 1
      roll_dice([dice_roll, ..throws], times - 1)
    }
  }
}
