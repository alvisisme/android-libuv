#!/bin/bash

set -e
export NDK=/opt/android-ndk-r14b

[ ! -d libuv ] && {
git clone https://github.com/libuv/libuv.git
cd libuv
git checkout -b v1.15.0 v1.15.0
mkdir -p build
mkdir -p out
git clone https://github.com/bnoordhuis/gyp.git build
cd ..
}

echo $"Choose arch you like to build, arm(1) or arm64(2)? (1/2)"
read ans;

case $ans in
    1)
        ARCH=arm
        TOOLCHAIN_NAME=arm-linux-android-4.9
        TOOL_PREFIX=arm-linux-androideabi-;;
    2)
       	ARCH=arm64
       	TOOLCHAIN_NAME=aarch64-linux-android-4.9
       	TOOL_PREFIX=aarch64-linux-android-;;
    *)
        exit;;
esac

# create a local android toolchain
$NDK/build/tools/make-standalone-toolchain.sh \
   --force \
   --arch=$ARCH \
   --platform=android-24 \
   --toolchain=$TOOLCHAIN_NAME \
   --install-dir=`pwd`/$ARCH
 
# setup environment to use the gcc/ld from the android toolchain
export TOOLCHAIN_PATH=`pwd`/${ARCH}/bin
export NDK_TOOLCHAIN_BASENAME=${TOOLCHAIN_PATH}/${TOOL_PREFIX}
export CC=${NDK_TOOLCHAIN_BASENAME}gcc
export CXX=${NDK_TOOLCHAIN_BASENAME}g++
export LINK=${CXX}
export LD=${NDK_TOOLCHAIN_BASENAME}ld
export AR=${NDK_TOOLCHAIN_BASENAME}ar
export RANLIB=${NDK_TOOLCHAIN_BASENAME}ranlib
export STRIP=${NDK_TOOLCHAIN_BASENAME}strip
export PLATFORM=android

echo 'build libuv'
# configure and build libuv
cd libuv
case ${ARCH} in
    arm64)
        echo "building arm64 for android"
        ./gyp_uv.py -Dtarget_arch=arm64 -DOS=android -f make-android
        ;;
    arm)
        echo "building arm for android"
        ./gyp_uv.py -Dtarget_arch=arm -DOS=android -f make-android
        ;;
    *)
        exit;;
esac

make -C out
cp -r include ${TOOLCHAIN_PATH}/../include/libuv
cp out/Debug/libuv.a ${TOOLCHAIN_PATH}/../lib
cd ..
echo 'build libuv done'


