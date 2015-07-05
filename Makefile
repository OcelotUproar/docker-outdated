NAME = ocelotuproar/docker-outdated
INSTANCE = docker-outdated

.PHONY: default build copy debug run release dev

default: build

build:
	docker build -t $(NAME) .

copy:
	docker create --name $(INSTANCE) $(NAME)
	docker cp $(INSTANCE):/go/bin/app $(shell pwd)/build
	docker rm $(INSTANCE)

debug:
	docker run --rm -it --name $(INSTANCE) $(NAME) /bin/bash

run:
	docker run --rm -v /var/run/docker.sock:/var/run/docker.sock --name $(INSTANCE) $(NAME)

dev:
	docker run -it --rm -v $(shell pwd)/vendor/github.com/:/go/src/github.com/ -v $(shell pwd):/go/src/github.com/$(NAME) golang

release: build push
