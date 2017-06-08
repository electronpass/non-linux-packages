#!/bin/bash

set -xue

MXE_DIR=/usr/lib/mxe

if [ "$ELECTRONPASS_PLATFORM" = "windows32" ]; then
  MXE_TARGET=i686-w64-mingw32.static
fi

if [ "$ELECTRONPASS_PLATFORM" = "windows64" ]; then
  MXE_TARGET=x86_64-w64-mingw32.static
fi

# install libelectronpass
cd $TRAVIS_BUILD_DIR
git clone https://github.com/electronpass/libelectronpass.git
cp CMakeLists-win-libelectronpass.txt libelectronpass/CMakeLists.txt # apply patch
cd libelectronpass
${MXE_DIR}/usr/bin/${MXE_TARGET}-cmake .
make -j2
sudo make install


# install extra-cmake-modules
cd $TRAVIS_BUILD_DIR
git clone https://github.com/KDE/extra-cmake-modules.git
cd extra-cmake-modules
${MXE_DIR}/usr/bin/${MXE_TARGET}-cmake .
make -j2
sudo make install

# build electronpass-desktop
cd $TRAVIS_BUILD_DIR
git clone -b develop https://github.com/electronpass/electronpass-desktop.git
cd electronpass-desktop
cp app/sync/keys.default.txt app/sync/keys.txt  # copy default keys for now
${MXE_DIR}/usr/bin/${MXE_TARGET}-cmake .
make -j2

set +xue
