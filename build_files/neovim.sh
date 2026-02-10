#!/bin/bash

set -ouex pipefail

DIRECTORY=temp-neovim
mkdir -p $DIRECTORY && cd $DIRECTORY

curl -LO https://www.lua.org/ftp/lua-5.5.0.tar.gz
tar xzf lua-5.5.0.tar.gz
cd lua-5.5.0
make linux install INSTALL_TOP=/usr
cd ..

curl -LO https://luarocks.org/releases/luarocks-3.13.0.tar.gz
tar zxpf luarocks-3.13.0.tar.gz
cd luarocks-3.13.0
./configure --prefix=/usr && make && sudo make install
cd ..

curl -LO https://github.com/neovim/neovim/releases/download/v0.11.5/nvim-linux-x86_64.tar.gz
tar xzf nvim-linux-x86_64.tar.gz
cp -r nvim-linux-x86_64/* /usr/

cd ..
rm -rf $DIRECTORY
