.PHONY: help
SHELL            := /bin/bash
DOCKER_REPO_NAME := binbash

help:
	@echo 'Available Commands:'
	@egrep '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":"}; { if ($$3 == "") { printf " - \033[36m%-18s\033[0m %s\n", $$1, $$2 } else { printf " - \033[36m%-18s\033[0m %s\n", $$2, $$3 }}'

#==============================================================#
# DOCKER-COMPOSE                                               #
#==============================================================#
build: ## build docker image
	docker build -t binbash/${DOCKER_IMG_NAME}:${DOCKER_TAG} --build-arg DOCKER_TAG='${DOCKER_TAG}' .

build-no-cache: ## build docker image no cache
	docker build --no-cache -t binbash/${DOCKER_IMG_NAME}:${DOCKER_TAG} --build-arg DOCKER_TAG='${DOCKER_TAG}' .

push: ## push docker image to registry
	docker push binbash/${DOCKER_IMG_NAME}:${DOCKER_TAG}
