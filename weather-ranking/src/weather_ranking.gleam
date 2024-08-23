import gleam/float
import gleam/list
import gleam/order.{type Order}

pub type City {
  City(name: String, temperature: Temperature)
}

pub type Temperature {
  Celsius(Float)
  Fahrenheit(Float)
}

pub fn fahrenheit_to_celsius(f: Float) -> Float {
  { f -. 32.0 } /. 1.8
}

pub fn compare_temperature(left: Temperature, right: Temperature) -> Order {
  case left, right {
    Celsius(temp_c), Fahrenheit(temp_f) ->
      float.compare(temp_c, fahrenheit_to_celsius(temp_f))
    Fahrenheit(temp_f), Celsius(temp_c) ->
      float.compare(fahrenheit_to_celsius(temp_f), temp_c)
    Fahrenheit(temp1), Fahrenheit(temp2) -> float.compare(temp1, temp2)
    Celsius(temp1), Celsius(temp2) -> float.compare(temp1, temp2)
  }
}

pub fn sort_cities_by_temperature(cities: List(City)) -> List(City) {
  list.sort(cities, fn(city1, city2) {
    compare_temperature(city1.temperature, city2.temperature)
  })
}
