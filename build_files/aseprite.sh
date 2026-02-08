#!/bin/bash

sudo dnf5 install -y gcc-c++ clang libcxx-devel cmake ninja-build libX11-devel libXcursor-devel libXi-devel libXrandr-devel mesa-libGL-devel fontconfig-devel

git clone --recursive --depth 1 https://github.com/aseprite/aseprite.git
cd aseprite

bash build.sh --auto --norun

cd ..

cp -R aseprite /usr/bin/aseprite
ln -s /usr/bin/aseprite/build/bin/aseprite /usr/bin/aseprite

rm -rf aseprite
