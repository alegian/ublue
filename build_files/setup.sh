#!/bin/bash

setup() {
  sudo timedatectl set-timezone Europe/Athens

  mkdir -p ~/projects/alegian
  mkdir -p ~/projects/givelink
  mkdir -p ~/obsidian

  mkdir -p ~/.local/share/fonts/nerd-fonts-symbols \
    && curl -L -o /tmp/NerdFontsSymbolsOnly.zip \
       https://github.com/ryanoasis/nerd-fonts/releases/latest/download/NerdFontsSymbolsOnly.zip \
    && unzip /tmp/NerdFontsSymbolsOnly.zip -d ~/.local/share/fonts/nerd-fonts-symbols \
    && rm -f /tmp/NerdFontsSymbolsOnly.zip

  mkdir -p ~/.local/share/fonts/roboto-mono \
    && curl -L -o /tmp/roboto-mono.zip \
       https://github.com/googlefonts/RobotoMono/archive/refs/tags/v3.001.zip \
    && unzip /tmp/roboto-mono.zip -d ~/.local/share/fonts/roboto-mono \
    && rm -f /tmp/roboto-mono.zip

  mkdir -p ~/.local/share/fonts/roboto-mono \
    && cd ~/.local/share/fonts/roboto-mono \
    && curl -LO https://github.com/google/fonts/raw/main/apache/robotomono/RobotoMono-Regular.ttf \
    && curl -LO https://github.com/google/fonts/raw/main/apache/robotomono/RobotoMono-Italic.ttf \
    && curl -LO https://github.com/google/fonts/raw/main/apache/robotomono/RobotoMono-Bold.ttf \
    && curl -LO https://github.com/google/fonts/raw/main/apache/robotomono/RobotoMono-BoldItalic.ttf

  curl -L -o ~/.local/share/fonts/NotoColorEmoji.ttf \
       https://github.com/googlefonts/noto-emoji/raw/main/fonts/NotoColorEmoji.ttf

  flatpak install -y flathub com.brave.Browser org.telegram.desktop

  ssh-keygen

  gtk-launch com.brave.Browser
}

chez() {
  chezmoi init git@github.com:alegian/dotfiles.git --apply
}
