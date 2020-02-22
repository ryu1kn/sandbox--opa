package rules

is_id_unique {
  unique_count := count(employee_id)
  all_count := count([id | employee_id[id]])
  all_count == unique_count
}

employee_id[x] {
  x := input.employees[_].basic.id
}

is_department_set {
  employee_without_department := {e | e := input.employees[_]; not e.department}
  count(employee_without_department) == 0
}
