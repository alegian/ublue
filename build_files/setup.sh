#!/bin/bash

set -ouex pipefail

setup() {
  mkdir -p ~/projects/alegian
  mkdir -p ~/projects/givelink
  mkdir -p ~/obsidian

  chezmoi init git@github.com:alegian/dotfiles.git --apply

  ssh-keygen
}
