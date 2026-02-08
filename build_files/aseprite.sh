#!/bin/bash

sudo dnf5 install -y gcc-c++ clang libcxx-devel cmake ninja-build libX11-devel libXcursor-devel libXi-devel libXrandr-devel mesa-libGL-devel fontconfig-devel

git clone --recursive https://github.com/aseprite/aseprite.git
cd aseprite

bash build.sh --auto

cp build/bin/aseprite /usr/bin/aseprite

cd ..
rm -rf aseprite
