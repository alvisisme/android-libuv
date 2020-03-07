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
if [ ! -d gyp ];then
git clone --depth 1 https://github.com/bnoordhuis/gyp.git
fi

tar xf libuv.tar.gz
mv libuv-$LIBUV_VERSION libuv
mkdir -p libuv/build
mkdir -p libuv/out
cp -r gyp libuv/build/gyp
cd libuv
./gyp_uv.py -Dtarget_arch=arm64 -DOS=android -f make-android
make -C out
cd $CWD
