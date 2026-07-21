.DEFAULT_GOAL := help

PROJECT_NAME := manage-github
DEFAULT_BRANCH := main

.PHONY: help

help:
	@echo ""
	@echo "Available targets:"
	@echo ""
	@echo " Git"
	@echo "  make feature NAME=<branch-name>"
	@echo "  make commit MSG=\"commit message\""
	@echo "  make push"
	@echo "  make pr"
	@echo ""
	@echo " Terraform"
	@echo "  make fmt"
	@echo "  make validate"
	@echo "  make plan"
	@echo "  make apply"
	@echo "  make destroy"
	@echo ""

##########################################
# Git
##########################################

feature:
	@if [ -z "$(NAME)" ]; then \
		echo "Usage: make feature NAME=github-labels"; \
		exit 1; \
	fi
	git checkout $(DEFAULT_BRANCH)
	git pull origin $(DEFAULT_BRANCH)
	git checkout -b feature/$(NAME)

commit:
	@if [ -z "$(MSG)" ]; then \
		echo "Usage: make commit MSG=\"message\""; \
		exit 1; \
	fi
	git add .
	git commit -m "$(MSG)"

push:
	git push -u origin $$(git branch --show-current)

pr:
	gh pr create \
		--fill \
		--base $(DEFAULT_BRANCH)

##########################################
# Terraform
##########################################

fmt:
	terraform fmt -recursive

fmt-check:
	terraform fmt -check -recursive

validate: fmt-check
	terraform init
	terraform validate

plan:
	terraform plan

apply:
	terraform apply

destroy:
	terraform destroy

##########################################
# Quality
##########################################

lint:
	tflint

security:
	tfsec .

check:
	make fmt
	make validate
	make lint
	make security
