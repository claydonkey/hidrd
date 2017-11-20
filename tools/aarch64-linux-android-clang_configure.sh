#!/bin/sh

echo running: "$0"

export CROSS_COMPILE=aarch64-linux-android
export PREFIX=/aarch64-linux-android-clang
export PATH=${PREFIX}/bin:${PATH}

echo PATH: ${PATH}

export SYSROOT=${PREFIX}/sysroot/usr
export CFLAGS="-fPIE -pie -I${ANDROID_PREFIX}/include/python2.7 -DHAVE_IEEEFP_H=0 -DHAVE_SSIZE_T -DPY_FORMAT_SIZE_T=l -DPY_FORMAT_LONG_LONG=ll"
export CROSS_PATH=${PREFIX}/bin/${CROSS_COMPILE}
export PYTHON_INCLUDES=${PREFIX}/include/python2.7
export PYTHON_LIBS="-L${PREFIX}/lib/python2.7 -L${PREFIX}/lib"

# Non-exhaustive lists of compiler + binutils
# Depending on what you compile, you might need more binutils than that
export CPP=${CROSS_PATH}-cpp
export AR=${CROSS_PATH}-ar
export AS=${CROSS_PATH}-as
export NM=${CROSS_PATH}-nm
export CC=${CROSS_PATH}-gcc
export CXX=${CROSS_PATH}-g++
export LD=${CROSS_PATH}-ld
export RANLIB=${CROSS_PATH}-ranlib


export XML2_CONFIG="${PREFIX}/bin/xml2-config"
export LIBXML2_CFLAGS="-I${PREFIX}/include/libxml2"
export LIBXML2_LIBS="-L${PREFIX}/lib -lxml2 -lz -liconv"


# Don't mix up .pc files from your host and build target
export PKG_CONFIG_PATH=${PREFIX}/lib/pkgconfig

# You can clone the full Android sources to get bionic if you want.. I didn't
# want to so I just got linker.h from here: http://gitorious.org/0xdroid/bionic
# Note that this was only required to build boehm-gc with dynamic linking support.
export CFLAGS=" -g -O0  ${CFLAGS} ${LIBXML2_CFLAGS}  -fPIE -fPIC  -I${PREFIX}/include --sysroot=${SYSROOT} -I${SYSROOT}/include -I${PREFIX}/  -L${PREFIX}/sysroot/usr/include -w -Wno-error "
export CPPFLAGS="${CFLAGS}"
export LDFLAGS="${LDFLAGS} -pie -L${SYSROOT}/lib -L${PREFIX}/lib -L${PREFIX}/sysroot/usr/lib -lz"

./configure $*  --build=x86_64-pc-mingw64  --prefix=/${PREFIX} --exec_prefix=/${PREFIX} --bindir=/${PREFIX}/bin --sbindir=/${PREFIX}/sbin --host=${CROSS_COMPILE}  --target=${CROSS_COMPILE} --with-sysroot=${SYSROOT} --enable-debug  "$@"
