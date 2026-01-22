#!/bin/bash

set -ouex pipefail

sudo dnf copr enable lbarrys/nwg-look

dnf5 install -y tmux sway-config-fedora NetworkManager-openvpn \
  nm-connection-editor network-manager-applet pavucontrol dolphin \
  blueman-applet btop ddcutil light qt6ct nwg-look alacritty

systemctl enable podman.socket
