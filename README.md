# build libuv for android

编译android平台arm和arm64架构的libuv静态库.

## 测试环境

* ubuntu16.04
* android-ndk-r14b
* libuv v1.15.0

## 编译步骤

* 修改**build.sh**设定NDK路径,默认为

    ```shell
    export NDK=/opt/android-ndk
    ```

* 执行**build.sh**脚本,根据提示选择编译架构

    ```shell
    bash build.sh
    ```

* 编译后头文件位于 **$ARCH/include**, 静态库位于 **$ARCH/lib**
