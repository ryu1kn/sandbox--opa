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
  not exist_department_missing_employee
}

exist_department_missing_employee {
    x := input.employees[_]
    not x.department
}
