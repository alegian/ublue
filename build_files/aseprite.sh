#!/bin/bash

sudo dnf5 install -y gcc-c++ clang libcxx-devel cmake ninja-build libX11-devel libXcursor-devel libXi-devel libXrandr-devel mesa-libGL-devel fontconfig-devel

git clone --recursive --depth 1 https://github.com/aseprite/aseprite.git
cd aseprite

bash build.sh --auto --norun

cp -R build/bin /usr/bin/aseprite-build
ln -s /usr/bin/aseprite-build/aseprite /usr/bin/aseprite

cd ..
rm -rf aseprite
