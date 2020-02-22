.PHONY: opa-run opa-debug sentinel-run

opa_query := data.rules.is_id_unique

opa-run: data/employee.json
	opa eval $(opa_query) --data opa --input $< --format pretty
	opa eval data.rules.is_department_set --data opa --input $< --format pretty

opa-debug: data/employee.json
	opa eval $(opa_query) --data opa --input $< \
		--explain notes | jq '.explanation[] | select(.Op == "Note").Message'

sentinel-run: sentinel/employee.sentinel sentinel/data/employee.json
	sentinel apply -config $(word 2,$^) $<

sentinel/data/employee.json: data/employee.json
	mkdir -p $(dir $@)
	jq '{param: .}' $< > $@
