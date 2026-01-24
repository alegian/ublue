#!/bin/bash

curl -L -R -O https://www.lua.org/ftp/lua-5.5.0.tar.gz
tar zxf lua-5.5.0.tar.gz
cd lua-5.5.0
make linux install INSTALL_TOP=/usr
cd ..

FILENAME="nvim-linux-x86_64.tar.gz"
EXTRACT_DIR="nvim-linux-x86_64"

curl -LO https://github.com/neovim/neovim/releases/download/v0.11.5/nvim-linux-x86_64.tar.gz

tar xzf $FILENAME

sudo cp -r $EXTRACT_DIR/bin/* /usr/bin/
sudo cp -r $EXTRACT_DIR/lib/* /usr/lib/
sudo cp -r $EXTRACT_DIR/share/* /usr/share/

rm -rf $FILENAME $EXTRACT_DIR
