package rules

import data.rules.string.dropLast

is_id_unique {
  unique_count := count(person_id)
  all_count := count([id | person_id[id]])
  all_count == unique_count
}

person_id[x] {
  x := input.people[_].basic.id
}

is_name_unique {
  unique_count := count(person_name)
  all_count := count([x | person_name[x]])
  all_count == unique_count
}

person_name[x] {
  x := input.people[_].basic.name
}

namespace[x] {
  x := dropLast(input.people[_].basic.id, ":")
}
