#!/bin/bash

set -ouex pipefail

sudo dnf5 copr enable -y tofik/nwg-shell
sudo dnf5 copr enable -y swayfx/swayfx
sudo dnf5 copr enable -y erikreider/SwayNotificationCenter
sudo dnf5 copr enable -y alternateved/cliphist
sudo dnf5 copr enable -y lihaohong/yazi

dnf5 install -y sway-config-fedora swayfx NetworkManager-openvpn golang \
  nm-connection-editor network-manager-applet pavucontrol wlogout \
  blueman-applet btop ddcutil light qt6ct nwg-look alacritty ripgrep \
  gammastep gvfs nautilus SwayNotificationCenter chezmoi make gcc cliphist \
  java-25-openjdk maven grim slurp yazi

sudo dnf5 copr disable -y lihaohong/yazi
sudo dnf5 copr disable -y alternateved/cliphist
sudo dnf5 copr disable -y erikreider/SwayNotificationCenter
sudo dnf5 copr disable -y swayfx/swayfx
sudo dnf5 copr disable -y tofik/nwg-shell

bash "$(dirname "$0")/neovim.sh"

export PROTON_PASS_CLI_INSTALL_DIR=/usr/bin
curl -fsSL https://proton.me/download/pass-cli/install.sh | bash

systemctl enable podman.socket
