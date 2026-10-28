#!/bin/bash

setup() {
  sudo timedatectl set-timezone Europe/Athens

  mkdir -p ~/projects/alegian
  mkdir -p ~/projects/givelink
  mkdir -p ~/obsidian

  if [ ! -f "$HOME/.ssh/id_rsa" ] && [ ! -f "$HOME/.ssh/id_ed25519" ]; then
    ssh-keygen
  fi

  gtk-launch com.brave.Browser
}

chez() {
  rm -rf "$HOME/.local/share/chezmoi"
  chezmoi init git@github.com:alegian/dotfiles.git --apply
}
