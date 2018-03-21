# Build libuv for android

Build libuv(libuv.a) for android(arm64).

## Build Environment

* Ubuntu 16.04.4 LTS amd64
* Docker version 17.12.1-ce, build 7390fc6

## Source and Tools

* [android-ndk-r13b](https://dl.google.com/android/repository/android-ndk-r13b-linux-x86_64.zip)
* [libuv v1.15.0](https://codeload.github.com/libuv/libuv/tar.gz/v1.15.0)
* [gyp](https://github.com/bnoordhuis/gyp.git)

## How to Build

  ```shell
  make
  ```

  Check the **out** directory for output files.
