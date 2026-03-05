#!/bin/bash

setup() {
  sudo timedatectl set-timezone Europe/Athens

  mkdir -p ~/projects/alegian
  mkdir -p ~/projects/givelink
  mkdir -p ~/obsidian

  if [ ! -d "$HOME/.local/share/fonts/nerd-fonts-symbols" ]; then
    mkdir -p "$HOME/.local/share/fonts/nerd-fonts-symbols"
    curl -L -o /tmp/NerdFontsSymbolsOnly.zip \
      https://github.com/ryanoasis/nerd-fonts/releases/latest/download/NerdFontsSymbolsOnly.zip
    unzip /tmp/NerdFontsSymbolsOnly.zip -d "$HOME/.local/share/fonts/nerd-fonts-symbols"
    rm -f /tmp/NerdFontsSymbolsOnly.zip
  fi

  if [ ! -d "$HOME/.local/share/fonts/roboto-mono" ]; then
    mkdir -p "$HOME/.local/share/fonts/roboto-mono"
    curl -L -o /tmp/roboto-mono.zip \
      https://github.com/googlefonts/RobotoMono/archive/refs/tags/v3.001.zip
    unzip /tmp/roboto-mono.zip -d "$HOME/.local/share/fonts/roboto-mono"
    rm -f /tmp/roboto-mono.zip
    cd "$HOME/.local/share/fonts/roboto-mono"
    curl -LO https://github.com/google/fonts/raw/main/apache/robotomono/RobotoMono-Regular.ttf
    curl -LO https://github.com/google/fonts/raw/main/apache/robotomono/RobotoMono-Italic.ttf
    curl -LO https://github.com/google/fonts/raw/main/apache/robotomono/RobotoMono-Bold.ttf
    curl -LO https://github.com/google/fonts/raw/main/apache/robotomono/RobotoMono-BoldItalic.ttf
  fi

  if [ ! -f "$HOME/.local/share/fonts/NotoColorEmoji.ttf" ]; then
    curl -L -o "$HOME/.local/share/fonts/NotoColorEmoji.ttf" \
      https://github.com/googlefonts/noto-emoji/raw/main/fonts/NotoColorEmoji.ttf
  fi

  flatpak install -y flathub com.brave.Browser org.telegram.desktop

  if [ ! -f "$HOME/.ssh/id_rsa" ] && [ ! -f "$HOME/.ssh/id_ed25519" ]; then
    ssh-keygen
  fi

  gtk-launch com.brave.Browser
}

chez() {
  rm -rf "$HOME/.local/share/chezmoi"
  chezmoi init git@github.com:alegian/dotfiles.git --apply
}
