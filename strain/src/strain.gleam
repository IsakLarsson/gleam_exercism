import gleam/list

pub fn keep(list: List(t), predicate: fn(t) -> Bool) -> List(t) {
  do_keep(list, predicate, [])
  //Alternatively, 
  //case list {
  //  [] -> []
  //  [head, ..tail] -> {
  //    case predicate(head) {
  //      True -> [head, ..keep(tail, predicate)]
  //      False -> keep(tail, predicate)
  //    }
  //  }
  //}
}

fn do_keep(list: List(a), fun: fn(a) -> Bool, acc: List(a)) -> List(a) {
  case list {
    [] -> list.reverse(acc)
    [x, ..xs] -> {
      let new_acc = case fun(x) {
        True -> [x, ..acc]
        False -> acc
      }
      do_keep(xs, fun, new_acc)
    }
  }
}

pub fn discard(list: List(t), predicate: fn(t) -> Bool) -> List(t) {
  do_discard(list, predicate, [])
}

fn do_discard(list: List(a), fun: fn(a) -> Bool, acc: List(a)) -> List(a) {
  case list {
    [] -> list.reverse(acc)
    [x, ..xs] -> {
      let new_acc = case fun(x) {
        True -> acc
        False -> [x, ..acc]
      }
      do_discard(xs, fun, new_acc)
    }
  }
}
