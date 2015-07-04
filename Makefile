NAME = ocelotuproar/docker-outdated
INSTANCE = docker-outdated

.PHONY: default build copy debug run release

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
	docker run --rm --name $(INSTANCE) $(NAME)

release: build push
