#!/bin/bash

URL="https://github.com/neovim/neovim/releases/download/v0.11.5/nvim-linux-x86_64.tar.gz"
FILENAME="nvim-linux-x86_64.tar.gz"
EXTRACT_DIR="nvim-linux-x86_64"

curl -LO $URL

tar xzf $FILENAME

sudo cp -r $EXTRACT_DIR/bin/* /usr/bin/
sudo cp -r $EXTRACT_DIR/lib/* /usr/lib/
sudo cp -r $EXTRACT_DIR/share/* /usr/share/

rm -rf $FILENAME $EXTRACT_DIR
