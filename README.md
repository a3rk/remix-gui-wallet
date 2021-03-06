[![Build Status](https://travis-ci.org/a3rk/remix-gui-wallet.svg?branch=master)](https://travis-ci.org/a3rk/remix-gui-wallet)

# Remix Wallet GUI

Copyright (c) 2014-2017, The Monero Project
Portions Copyright (c) 2018, A3RK

## Development Resources

- Web: [remixcoin.io](https://remixcoin.io/)
- GitHub: [https://github.com/a3rk/remix](https://github.com/a3rk/remix)
- Discord: [remix on Discord](https://discord.gg/dxWkpGX)

## Introduction

THIS CODE IS CURRENTLY A WIP (WORK IN PROGRESS) DO NOT USE THIS JUST YET


## About this Project

TBD

## License

TBD

# Contributing

**Anyone is welcome to contribute to Remix Wallet's codebase!** If you have a fix or code change, feel free to submit it as a pull request directly to the "master" branch. In cases where the change is relatively small or does not affect other parts of the codebase it may be merged in immediately by any one of the collaborators. On the other hand, if the change is particularly large or complex, it is expected that it will be discussed at length either well in advance of the pull request being submitted, or even directly on the pull request.

## Installing Remix Wallet Core from a Package

No packages are available at the moment. If you would like to create a pull request, packaging for your favorite distribution would be a welcome contribution!

## Compiling Remix Wallet Core from Source

### On Linux:

(Tested on Ubuntu 16.04 x86, 16.10 x64, Gentoo x64 and Linux Mint 18 "Sarah" - Cinnamon x64)

1. Install Remix Wallet dependencies

  - For Ubuntu and Mint

	`sudo apt install build-essential cmake libboost-all-dev miniupnpc libunbound-dev graphviz doxygen libunwind8-dev pkg-config libssl-dev`

  - For Gentoo

	`sudo emerge app-arch/xz-utils app-doc/doxygen dev-cpp/gtest dev-libs/boost dev-libs/expat dev-libs/openssl dev-util/cmake media-gfx/graphviz net-dns/unbound net-libs/ldns net-libs/miniupnpc sys-libs/libunwind`

2. Grab an up-to-date copy of the remix-gui-wallet repository

	`git clone https://github.com/a3rk/remix-gui-wallet.git --recursive `

3. Go into the repository

	`cd remix-gui-wallet`

4. Install the GUI dependencies

  - For Ubuntu 16.04 x86

	`sudo apt-get install qtbase5-dev qt5-default qtdeclarative5-dev qml-module-qtquick-controls qml-module-qtquick-xmllistmodel qttools5-dev-tools qml-module-qtquick-dialogs`

  - For Ubuntu 16.04+ x64

    `sudo apt-get install qtbase5-dev qt5-default qtdeclarative5-dev qml-module-qtquick-controls qml-module-qtquick-xmllistmodel qttools5-dev-tools qml-module-qtquick-dialogs qml-module-qt-labs-settings libqt5qml-graphicaleffects`

  - For Linux Mint 18 "Sarah" - Cinnamon x64

    `sudo apt install qml-module-qt-labs-settings qml-module-qtgraphicaleffects`

  - For Gentoo

    `sudo emerge dev-qt/qtcore:5 dev-qt/qtdeclarative:5 dev-qt/qtquickcontrols:5 dev-qt/qtquickcontrols2:5 dev-qt/qtgraphicaleffects:5`

  - Optional : To build the flag `WITH_SCANNER`

    - For Ubuntu and Mint

      `sudo apt install qtmultimedia5-dev qml-module-qtmultimedia libzbar-dev`

    - For Gentoo

      The *qml* USE flag must be enabled.

      `emerge dev-qt/qtmultimedia:5 media-gfx/zbar`

5. Build the GUI

  - For Ubuntu and Mint

	`./build.sh`

  - For Gentoo

    `QT_SELECT=5 ./build.sh`

The executable can be found in the build/release/bin folder.

6. Build the linux64 binary using the ./ci/ubuntu.16.04.x86_64.sh script

  1. First, changed BUILD_GUI_DEPS within the remix/ submodule's CMakeLists.txt file to `ON` instead of `OFF`
  2. Next, set BUILD_VERSION to the version of the build for the binary, ```export BUILD_VERSION=v#.#.#.#```, which should reflect the version of remix being used as per the remix/ submodule, which can be checked by referring to the .gitmodules file in the root directory
  3. Finally, run the ./ci/ubuntu.16.04.x86_64.sh script, and find the SHA256 checksum and the .tar.bz2 package containing the linux64 binary within build/release/bin/ accordingly

### On OS X:

1. Install Xcode from AppStore
2. Install [homebrew](http://brew.sh/)
3. Install [remix-gui-wallet](https://github.com/a3rk/remix-gui-wallet) dependencies:

  `brew install boost --c++11`

  `brew install openssl` - to install openssl headers

  `brew install pkgconfig`

  `brew install cmake`

  `brew install qt5`  (or download QT 5.8+ from [qt.io](https://www.qt.io/download-open-source/))

  If you have an older version of Qt installed via homebrew, you can force it to use 5.x like so:
  
  `brew link --force --overwrite qt5`

5. Add the Qt bin directory to your path

    Example: `export PATH=$PATH:$HOME/Qt/5.8/clang_64/bin`

    This is the directory where Qt 5.x is installed on **your** system

6. Grab an up-to-date copy of the remix-gui-wallet repository

  `git clone https://github.com/a3rk/remix-gui-wallet.git --recursive`

7. Go into the repository

  `cd remix-gui-wallet`

8. Start the build

  `./build.sh`

The executable can be found in the `build/release/bin` folder.

**Note:** Workaround for "ERROR: Xcode not set up properly"

Edit `$HOME/Qt/5.8/clang_64/mkspecs/features/mac/default_pre.prf`

replace
`isEmpty($$list($$system("/usr/bin/xcrun -find xcrun 2>/dev/null")))`

with
`isEmpty($$list($$system("/usr/bin/xcrun -find xcodebuild 2>/dev/null")))`

More info: http://stackoverflow.com/a/35098040/1683164


### On Windows:

1. Install [msys2](http://msys2.github.io/), follow the instructions on that page on how to update packages to the latest versions

2. Install Remix Wallet dependencies as described in [Remix Wallet documentation](https://github.com/valiant1x/remix) into msys2 environment
   **As we only build application for x86, install only dependencies for x86 architecture (i686 in package name)**
   ```
   pacman -S mingw-w64-i686-toolchain make mingw-w64-i686-cmake mingw-w64-i686-boost

   ```

3. Install git into msys2 environment

    ```
    pacman -S git
    ```

4. Install Qt5 into msys2 environment
   
   You can install these MSYS2 packages using pacman:

    mingw-w64-i686-qt
    mingw-w64-i686-qt-creator
    mingw-w64-x86_64-qt
    mingw-w64-x86_64-qt-creator

    ```
    pacman -S git mingw-w64-x86_64-qt mingw-w64-x86_64-qt-creator
    ```

  Note to launch qtcreator:
    Open up a MinGW-w64 32-bit or 64-bit shell using the appropriate shortcut in your Start Menu, and run "qtcreator" at the command line.

5. Open ```MinGW-w64 Win32 Shell``` shell

   ```%MSYS_ROOT%\msys2_shell.cmd -mingw32```

   Where ```%MSYS_ROOT%``` will be ```c:\msys32``` if your host OS is x86-based or ```c:\msys64``` if your host OS
   is x64-based

6. Install the latest version of boost, specificly the required static libraries
    ```
    cd
    wget http://sourceforge.net/projects/boost/files/boost/1.63.0/boost_1_63_0.tar.bz2
    tar xjf boost_1_63_0.tar.bz2
    cd boost_1_63_0
    ./bootstrap.sh mingw
    ./b2 --prefix=/mingw32/boost --layout=tagged --without-mpi --without-python toolset=gcc address-model=32 variant=debug,release link=static threading=multi runtime-link=static -j$(nproc) install
    ```

7. Clone repository
    ```
    cd
    git clone https://github.com/a3rk/remix-gui-wallet.git --recursive
    ```

8. Build the GUI
    ```
    cd remix-gui-wallet
    export PATH=$(ls -rd /c/msys64/mingw64/bin | head -1):$PATH
    ./build.sh
    cd build
    make deploy
    ```

The executable can be found in the ```.\release\bin``` directory.
