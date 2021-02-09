.DEFAULT_GOAL := help

.PHONY: docs-build  ## Generate the docs and update README.md
docs-build:
	hugo -D


.PHONY: help  ## Display this message
help:
	@grep -E \
		'^.PHONY: .*?## .*$$' $(MAKEFILE_LIST) | \
		sort | \
		awk 'BEGIN {FS = ".PHONY: |## "}; {printf "\033[36m%-16s\033[0m %s\n", $$2, $$3}'
