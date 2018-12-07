#!/bin/bash
LIBUV_VERSION=1.21.0

CWD=$PWD
mkdir -p $CWD/build

cd $CWD/build
if [ ! -f libuv.tar.gz ];then
wget https://codeload.github.com/libuv/libuv/tar.gz/v$LIBUV_VERSION -O libuv.tar.gz
fi
if [ -d libuv ];then
rm -rf libuv
fi
tar xvf libuv.tar.gz
mv libuv-$LIBUV_VERSION libuv
cd libuv-$LIBUV_VERSION
mkdir -p build
mkdir -p out
git clone --depth 1 https://github.com/bnoordhuis/gyp.git build/gyp
./gyp_uv.py -Dtarget_arch=arm64 -DOS=android -f make-android
make -C out
cd $CWD



