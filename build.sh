#!/bin/bash
VERSION=1.21.0
wget https://codeload.github.com/libuv/libuv/tar.gz/v$VERSION -O libuv.tar.gz
tar xvf libuv.tar.gz
cd libuv-$VERSION
mkdir -p build
mkdir -p out
git clone --depth 1 https://github.com/bnoordhuis/gyp.git build/gyp
./gyp_uv.py -Dtarget_arch=arm64 -DOS=android -f make-android
make -C out
rm -rf /home/out/*
cp -r include /home/out/include
cp out/Debug/libuv.a /home/out/libuv.a



