.PHONY: all

curdir=$(CURDIR)
image=xebxeb/spinningup

all: run

build:
	docker build -t ${image} .

debug: build
	docker run --rm -it \
		-p 8930:8888 \
		-p 5930:5900 \
		${image} /bin/bash

lunar-run: build
	docker run --rm -t -v ${curdir}/data:/ds/data ${image} /ds/lunar-run.sh

lunar-watch:
	docker run --rm -t \
		-v ${curdir}/data:/ds/data \
		-v /tmp.X11-unix:/tmp.X11-unix \
		-e DISPLAY:$$DISPLAY \
		${image} \
		/ds/lunar-watch.sh

local-lunar-run:
	./lunar-run.sh ${curdir}/data

local-lunar-watch:
	./lunar-watch.sh
