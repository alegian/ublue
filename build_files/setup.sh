#!/bin/bash

setup() {
  sudo timedatectl set-timezone Europe/Athens

  mkdir -p ~/projects/alegian
  mkdir -p ~/projects/givelink
  mkdir -p ~/obsidian

  mkdir -p ~/.local/share/fonts/roboto-mono-nerd \
    && curl -L -o /tmp/RobotoMono.zip \
       https://github.com/ryanoasis/nerd-fonts/releases/latest/download/RobotoMono.zip \
    && unzip /tmp/RobotoMono.zip -d ~/.local/share/fonts/roboto-mono-nerd \
    && rm -f /tmp/RobotoMono.zip 

  flatpak install -y flathub com.brave.Browser org.telegram.desktop

  ssh-keygen

  gtk-launch com.brave.Browser
}

chez() {
  chezmoi init git@github.com:alegian/dotfiles.git --apply
}
