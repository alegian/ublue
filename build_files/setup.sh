#!/bin/bash

setup() {
  mkdir -p ~/projects/alegian
  mkdir -p ~/projects/givelink
  mkdir -p ~/obsidian

  flatpak install -y flathub com.brave.Browser org.telegram.desktop

  ssh-keygen

  gtk-launch com.brave.Browser
}

chez() {
  chezmoi init git@github.com:alegian/dotfiles.git --apply
}
