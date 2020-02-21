package rules.array

reverse(array) = new_array {
  length := count(array)
  new_array := [x | array[i]; x := array[length - 1 - i]]
}

dropLast(array) = new_array {
  length := count(array)
  new_array := [x | x := array[i]; i != length - 1]
}
