import gleam/int
import gleam/option.{type Option, None, Some}

pub type Player {
  Player(name: Option(String), level: Int, health: Int, mana: Option(Int))
}

pub fn introduce(player: Player) -> String {
  case player.name {
    Some(n) -> n
    None -> "Mighty Magician"
  }
}

pub fn revive(player: Player) -> Option(Player) {
  case player.health {
    h if h <= 0 && player.level >= 10 ->
      Some(Player(..player, health: 100, mana: Some(100)))
    h if h <= 0 -> Some(Player(..player, health: 100))
    _ -> None
  }
}

pub fn cast_spell(player: Player, cost: Int) -> #(Player, Int) {
  //if the player has enough mana for the spell, deduct mana from the mana pool 
  // and return the (player ,mana *2)
  case player.mana {
    Some(m) if m >= cost -> #(Player(..player, mana: Some(m - cost)), cost * 2)
    Some(_) -> #(player, 0)
    None -> #(Player(..player, health: int.max(player.health - cost, 0)), 0)
  }
  //if mana is none or not enough, deduct health from the player and return 
  // (player: health - cost, 0)
}
