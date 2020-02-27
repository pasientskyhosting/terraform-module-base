.ONESHELL:

# VERSION=v0.0.1
# SHELL=/bin/bash
# CONSUL:=$(shell docker ps -q -f name=consul 2>/dev/null)
# ANSIBLE_DIR=ansible
# NETBOX_DIR=netbox-docker
# AWX_DIR=tmp/.awx
# PROJECT_DIR=~/Projects/github/pasientskyhosting/terraform-templating
GITHUB_DEPLOY_RSA_KEY=`cat /Users/kj/.ssh/terraform_rsa`

all: build

build: build-module build-test

run: run-test

build-module:
	ansible-playbook -i ansible/inventory.ini ansible/build_module.yml

build-test:	
	ansible-playbook -i ansible/inventory.ini ansible/build_test.yml

run-test:
	ansible-playbook -i ansible/inventory.ini ansible/run_test_plan.yml && \
	read -p "Press enter to apply"; \
	ansible-playbook -i ansible/inventory.ini ansible/run_test_apply.yml && \
	read -p "Press enter to test integrations"; \
	ansible-playbook -i ansible/inventory.ini ansible/run_test_integrations.yml && \
	read -p "Press enter to destroy"; \
	ansible-playbook -i ansible/inventory.ini ansible/run_test_destroy.yml