FROM alvisisme/arm64-android-toolchain
LABEL maintainer=alvis<alvisisme@163.com>
RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y --no-install-recommends binutils git

ENV PLATFORM=android
ENV CFLAGS="-D__ANDROID_API__=21"
USER root
WORKDIR /out
VOLUME ["/out"]
CMD ["/bin/bash","/out/build.sh"]