#!/bin/bash

set -ouex pipefail

sudo dnf5 copr enable -y tofik/nwg-shell
sudo dnf5 copr enable -y swayfx/swayfx
sudo dnf5 copr enable -y erikreider/SwayNotificationCenter

dnf5 install -y sway-config-fedora swayfx NetworkManager-openvpn \
  nm-connection-editor network-manager-applet pavucontrol wlogout \
  blueman-applet btop ddcutil light qt6ct nwg-look alacritty ripgrep \
  gammastep gvfs nautilus SwayNotificationCenter chezmoi

sudo dnf5 copr disable -y tofik/nwg-shell
sudo dnf5 copr disable -y swayfx/swayfx
sudo dnf5 copr disable -y erikreider/SwayNotificationCenter

bash "$(dirname "$0")/neovim.sh"

systemctl enable podman.socket
