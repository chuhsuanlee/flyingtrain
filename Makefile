DOCKER := docker

IMAGE_NAME := flyingtrain
IMAGE_NAMESPACE := chuhsuanlee
IMAGE_REPO := $(IMAGE_NAMESPACE)/$(IMAGE_NAME)

WORKDIR := $(shell pwd)
DATA_PATH := $(WORKDIR)/raw_data
FLAG := \
	-v /etc/localtime:/etc/localtime \
	-v $(DATA_PATH):/usr/src/app/raw_data

# Followings are the Make commands that can be used.

.PHONY: help
help:
	@echo "Usage:"
	@echo "    make <target>"
	@echo
	@echo "Targets:"
	@echo "    build"
	@echo "        Build docker image."
	@echo
	@echo "    clean"
	@echo "        Remove docker image."
	@echo
	@echo "    exec (CMD=<cmd>)"
	@echo "        Create container and execute specified command (default: bash)."
	@echo
	@echo "    run"
	@echo "        Create container and perform task."
	@echo

.PHONY: build
build:
	$(DOCKER) build \
		-t $(IMAGE_REPO) \
		.

.PHONY: clean
clean:
	$(DOCKER) rmi $(IMAGE_REPO) || true

.PHONY: exec
exec: build
	$(eval CMD ?= bash)
	$(DOCKER) run \
		--rm -it ${FLAG} \
		--entrypoint $(CMD) \
		$(IMAGE_REPO)

.PHONY: run
run: build
	$(DOCKER) run \
		--rm ${FLAG} \
		$(IMAGE_REPO)
