#!/bin/bash

setup() {
  chezmoi init git@github.com:alegian/dotfiles.git --apply

  ssh-keygen
}
