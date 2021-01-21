.DEFAULT_GOAL := help

.PHONY: lock  ## Update the lockfile
lock:
	./scripts/lock.sh

.PHONY: docs-build  ## Generate the docs and update README.md
docs-build:
	mkdocs build

.PHONY: docs-live  ## Serve the docs with live reload as you make changes
docs-live:
	mkdocs serve --dev-addr 0.0.0.0:8008


.PHONY: init
init:
	python -m poetry config virtualenvs.in-project true
	python -m poetry config virtualenvs.path env/
	python -m poetry install --no-root

.PHONY: help  ## Display this message
help:
	@grep -E \
		'^.PHONY: .*?## .*$$' $(MAKEFILE_LIST) | \
		sort | \
		awk 'BEGIN {FS = ".PHONY: |## "}; {printf "\033[36m%-16s\033[0m %s\n", $$2, $$3}'
