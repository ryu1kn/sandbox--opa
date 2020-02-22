
# Open Policy Agent (OPA) and Hashicorp Sentinel sandbox

## Prerequisite

* Open Policy Agent: `brew install opa`
* Hashicorp Sentinel: `brew install sentinel`
* jq: `brew install jq`

## Usage

See `Makefile` in each test theme directories.

## Notes

### OPA

* Unlike Prolog, recursion is not supported.
* Unlike Prolog, in addition to **rule** (**clause** in Prolog), there is **function** that returns a value.
* Doesn't seem to be able to pass rule as an argument to a function;
  no second-order logic support.

### Sentinel

* [Sentinel language is closed-source](https://github.com/hashicorp/sentinel-sdk/issues/2)
* [Cannot share functions/rules between policies](https://github.com/hashicorp/sentinel-sdk/issues/14)
* More opinionated. Each policy needs to have `main` variable that evaluates to a boolean value.
* [Function supports recursion](https://docs.hashicorp.com/sentinel/language/functions/#recursion)
* Function is a first-class object.

    ```sentinel
    main = rule {
        map([1,2,3], add_n(2)) == [3,4,5]
    }

    add_n = func (n) {
        return func (m) { return n + m }
    }

    map = func (list, fn) {
        new_list = []
        for list as item { append(new_list, fn(item)) }
        return new_list
    }
    ```

### References

* [Policy Language](https://www.openpolicyagent.org/docs/latest/policy-language/#comprehensions)
* [Policy Reference](https://www.openpolicyagent.org/docs/latest/policy-reference)
