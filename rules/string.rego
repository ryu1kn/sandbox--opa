package rules.string

import data.rules.array.dropLast

dropLast(str, delimiter) = new_str {
  new_str := concat(delimiter, dropLast(split(str, delimiter)))
}
