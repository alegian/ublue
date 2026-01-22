#!/bin/bash

set -ouex pipefail

sudo dnf copr enable -y tofik/nwg-shell

dnf5 install -y sway-config-fedora NetworkManager-openvpn \
  nm-connection-editor network-manager-applet pavucontrol dolphin \
  blueman-applet btop ddcutil light qt6ct nwg-look alacritty

sudo dnf copr disable -y tofik/nwg-shell

systemctl enable podman.socket
