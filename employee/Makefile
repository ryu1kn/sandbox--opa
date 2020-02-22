.PHONY: opa-run opa-debug sentinel-run

opa_query := data.rules.is_id_unique data.rules.is_department_set

opa-run: data/employee.json
	$(foreach q,$(opa_query), \
		opa eval $q --data opa --input $< --fail --format pretty ; \
	)

opa-debug: data/employee.json
	opa eval $(opa_query) --data opa --input $< \
		--explain notes | jq '.explanation[] | select(.Op == "Note").Message'

sentinel-run: sentinel/data/employee.json $(wildcard sentinel/*.sentinel)
	$(foreach s,$(filter-out $<,$^),\
		sentinel apply -config $< $s ; \
	)

sentinel/data/employee.json: data/employee.json
	mkdir -p $(dir $@)
	jq '{param: .}' $< > $@
