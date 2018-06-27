all: env build

env:
	docker build -t android-libuv-build .

build:
	docker run --rm -v `pwd`/out:/home/out android-libuv-build