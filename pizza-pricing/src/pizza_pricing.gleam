import gleam/list

// TODO: please define the Pizza custom type
pub type Pizza {
  Margherita
  Caprese
  Formaggio
  ExtraSauce(Pizza)
  ExtraToppings(Pizza)
}

pub fn pizza_price(pizza: Pizza) -> Int {
  do_pizza_prize(pizza, 0)
}

fn do_pizza_prize(pizza: Pizza, acc: Int) -> Int {
  case pizza {
    Margherita -> 7 + acc
    Caprese -> 9 + acc
    Formaggio -> 10 + acc
    ExtraSauce(p) -> do_pizza_prize(p, acc + 1)
    ExtraToppings(p) -> do_pizza_prize(p, acc + 2)
  }
}

pub fn order_price(order: List(Pizza)) -> Int {
  let price = list.fold(order, 0, fn(acc, pizza) { acc + pizza_price(pizza) })
  case list.length(order) {
    1 -> 3 + price
    2 -> 2 + price
    _ -> price
  }
}
