.PHONY: debug run

query := 'data.rules.is_id_unique'

run:
	opa eval $(query) --data rules --input data/people.json

debug:
	opa eval $(query) --data rules --input data/people.json \
		--explain notes | jq '.explanation[] | select(.Op == "Note").Message'

