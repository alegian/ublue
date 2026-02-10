#!/bin/bash

set -ouex pipefail

sudo dnf5 install -y gcc gcc-c++ gmp gmp-devel make ncurses ncurses-compat-libs xz perl
