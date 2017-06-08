# ElectronPass on Windows and Mac OS

This repository holds:
 - [instructions for building electronpass-desktop on Windows](github.com/electronpass/windows-packages/blob/master/building_on_windows.md)
 - [Travis CI](https://travis-ci.org/dashboard)  build scripts for building Windows binaries on Linux
 - [Travis CI](https://travis-ci.org/dashboard) build configuration for building Mac OS packages
 - modified CMakeLists files from electronpass-desktop and libelectronpass, to help CMake find packages on Windows. Initial CMake configuration should be modified to provide this functionality automatically, but currently none of us want to to deal with CMake on Win. Therefore, this ugly patch remains for now.

## License
Code in this project is licensed under [GNU GPLv3 license](https://github.com/electronpass/windows-packages/blob/release/LICENSE).
