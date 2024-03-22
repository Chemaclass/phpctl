.PHONY: default
default: build

.PHONY: build
build:
	@parallel --line-buffer PHP_VERSION={} ./bin/phpctl build ::: 81 82 83

.PHONY: test
test:
	@parallel --line-buffer PHP_VERSION={} COMPOSER_AUTH= TERM= ./bin/notty ./lib/bashunit ./tests/ ::: 81 82 83

.PHONY: install
install:
	@sudo ./scripts/symlink-bins.sh

.PHONY: devcontainer
devcontainer:
	@devcontainer build --no-cache --workspace-folder devcontainer --push true --image-name opencodeco/phpctl:php83-devcontainer
