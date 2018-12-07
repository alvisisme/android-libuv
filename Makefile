all: env build

env:
	docker-compose build

build:
	docker-compose run android-build-libuv

dist:
	rm -rf dist/*
	cp build/libuv/out/Debug/libuv.a dist/
	cp -r build/libuv/include dist/include

.PHONY: env build dist