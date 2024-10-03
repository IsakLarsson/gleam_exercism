import gleam/dict.{type Dict}
import gleam/int
import gleam/list
import gleam/order
import gleam/string

pub type School {
  School(roster: List(Student))
}

pub type Student {
  Student(name: String, grade: Int)
}

pub fn create() -> School {
  School([])
}

pub fn roster(school: School) -> List(String) {
  school.roster |> list.map(fn(student) { student.name })
}

pub fn add(
  to school: School,
  student student: String,
  grade grade: Int,
) -> Result(School, Nil) {
  case
    school.roster
    |> list.any(fn(current_student) { student == current_student.name })
  {
    True -> Error(Nil)
    False ->
      Ok(
        [Student(student, grade), ..school.roster]
        |> School()
        |> get_sorted_school(),
      )
  }
}

pub fn grade(school: School, desired_grade: Int) -> List(String) {
  school.roster
  |> list.filter(fn(student) { student.grade == desired_grade })
  |> School()
  |> get_sorted_school()
  |> roster
}

fn get_sorted_school(school: School) -> School {
  school.roster
  |> list.sort(fn(a, b) {
    case int.compare(a.grade, b.grade) {
      order.Eq -> string.compare(a.name, b.name)
      order -> order
    }
  })
  |> School()
}
