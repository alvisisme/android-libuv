#!/bin/bash

wget https://codeload.github.com/libuv/libuv/tar.gz/v1.15.0 -O libuv.tar.gz && \
tar xvf libuv.tar.gz && \
cd libuv-1.15.0 && \
mkdir -p build　&& \
mkdir -p out && \
git clone --depth 1 https://github.com/bnoordhuis/gyp.git build/gyp && \
./gyp_uv.py -Dtarget_arch=arm64 -DOS=android -f make-android && \
make -C out &&
cp -r include /home/dev/out/include && \
cp out/Debug/libuv.a /home/dev/out/libuv.a



