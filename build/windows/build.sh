#!/bin/bash

set -xue

cd $TRAVIS_BUILD_DIR
cp CMakeLists-win-libelectronpass.txt libelectronpass/CMakeLists.txt # apply patch
mkdir libelectronpassinstall
cd libelectronpass

MXE_DIR=/usr/lib/mxe

if [ "$ELECTRONPASS_PLATFORM" = "windows32" ]; then
    MXE_TARGET=i686-w64-mingw32.static
fi

if [ "$ELECTRONPASS_PLATFORM" = "windows64" ]; then
    MXE_TARGET=x86_64-w64-mingw32.static
fi

${MXE_DIR}/usr/bin/${MXE_TARGET}-cmake -DCMAKE_INSTALL_PREFIX=${TRAVIS_BUILD_DIR}/libelectronpassinstall .
make -j2
make install

set +xue
