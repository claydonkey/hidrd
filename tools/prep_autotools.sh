#!/bin/sh

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
pushd ${DIR}
cd ..
aclocal
autoheader
autoconf
automake --add-missing
libtoolize
popd
