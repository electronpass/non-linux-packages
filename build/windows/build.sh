#!/bin/bash

set -xue

cd $TRAVIS_BUILD_DIR
cd libelectronpass

MXE_DIR=/usr/lib/mxe

if [ "$BATTLESHIP_PLATFORM" = "windows32" ]; then
    MXE_TARGET=i686-w64-mingw32.static
fi

if [ "$BATTLESHIP_PLATFORM" = "windows64" ]; then
    MXE_TARGET=x86_64-w64-mingw32.static
fi

${MXE_DIR}/usr/bin/${MXE_TARGET}-cmake .
cmake --build

set +xue
