
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
* Unlike Prolog, there is function that returns a value.
* Doesn't seem to be able to pass rule as an argument to a function;
  negative impact on removing structural duplications.

### Sentinel

* [Sentinel language is closed-source](https://github.com/hashicorp/sentinel-sdk/issues/2)
* [Cannot share functions/rules between policies](https://github.com/hashicorp/sentinel-sdk/issues/14)

### References

* [Policy Language](https://www.openpolicyagent.org/docs/latest/policy-language/#comprehensions)
* [Policy Reference](https://www.openpolicyagent.org/docs/latest/policy-reference)
