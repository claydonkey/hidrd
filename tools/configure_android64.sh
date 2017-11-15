#!/bin/sh

if [[ $# -eq 0 ]] ; then
    echo 'please provide <YOUR_TOOLCHAIN>'
    exit 0
fi

case "$1" in
    /aarch64-linux-android) echo 'welcome home:' "$1" ;;
    *) echo 'your prefix is: ' "$1" ;;
esac

SDIR=$(dirname $0)
export CROSS_COMPILE=aarch64-linux-android

export PREFIX="$1"
export PATH=${PREFIX}/bin:${PATH}
export SYSROOT=${PREFIX}/sysroot/usr
export CFLAGS="-g -ggdb -shared -fPIE -I${ANDROID_PREFIX}/include/libxml2 -I${ANDROID_PREFIX}/include/python2.7 " 
#-DHAVE_IEEEFP_H=0 -DHAVE_SSIZE_T -DPY_FORMAT_SIZE_T=l -DPY_FORMAT_LONG_LONG=ll
export CROSS_PATH=${PREFIX}/bin/${CROSS_COMPILE}
export PYTHON_INCLUDES=${PREFIX}/include/python2.7
export PYTHON_LIBS=" -L${PREFIX}/lib/python2.7 -L${PREFIX}/lib"
export CPP=${CROSS_PATH}-cpp
export AR=${CROSS_PATH}-ar
export AS=${CROSS_PATH}-as
export NM=${CROSS_PATH}-nm
export CC=${CROSS_PATH}-gcc
export CXX=${CROSS_PATH}-g++
export LD=${CROSS_PATH}-ld
export RANLIB=${CROSS_PATH}-ranlib
export PKG_CONFIG_PATH=${PREFIX}/lib/pkgconfig
export CFLAGS="${CFLAGS} --sysroot=${SYSROOT} -I${PREFIX}/include -I${SYSROOT}/include "
export CPPFLAGS="${CFLAGS}  --sysroot=${SYSROOT} -I${PREFIX}/include -I${SYSROOT}/include"
echo CPPFLAGS="${CFLAGS}"
echo CFLAGS="${CFLAGS}"

export LDFLAGS="${LDFLAGS} -pie -L${SYSROOT}/lib -L${PREFIX}/lib -llog"

./$SDIR/../configure --host=${CROSS_COMPILE}   --prefix=${PREFIX}  --build=x86_64-pc-linux-gnu --enable-debug --with-sysroot=$1  $2

exit 0
