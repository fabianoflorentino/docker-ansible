.PHONY: help
.DEFAULT_GOAL := help

help:
	@grep -E '^[0-9a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-25s\033[0m %s\n", $$1, $$2, $$3, $$4, $$5}'

build: ## Make image for use terraform
	@docker build --no-cache -t fabianoflorentino/ansible .

run: ## Start Terraform
	@docker run -it --name ansible -v ${PWD}:/ansible --entrypoint "" fabianoflorentino/ansible sh

rm: ## Remove container
	@docker container rm -f ansible

rmi: ## Remove untagged images
	@docker rmi -f $(docker images | grep "^<none>" |cut -d" " -f50)

ansible-test: ## Test of ansible roles to apply
	@ansible-playbook -i inventory/invetory.ini -u supervisor -b -e ssh_connection_user=supervisor setup.yaml -C

ansible-run: ## Test of ansible roles to apply
	@ansible-playbook -i inventory/invetory.ini -u supervisor -b -e ssh_connection_user=supervisor setup.yaml