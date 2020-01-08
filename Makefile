.PHONY: help
.DEFAULT_GOAL := help

help:
	@grep -E '^[0-9a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-25s\033[0m %s\n", $$1, $$2, $$3, $$4, $$5}'

build: ## Make image for use terraform
	@docker build -t fabianoflorentino/ansible-cli .

run: ## Start Terraform
	@docker container rm -f terraform
	@docker run -it --name ansible -v ${PWD}:/home/ansible --entrypoint "" fabianoflorentino/ansible-cli sh