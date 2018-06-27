FROM alvisisme/arm64-android-toolchain

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends binutils git

ENV PLATFORM=android
ENV CFLAGS="-D__ANDROID_API__=21"
COPY build.sh /build.sh
VOLUME ["/home/out"]
CMD ["/bin/bash","/build.sh"]