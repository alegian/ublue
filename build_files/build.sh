#!/bin/bash

set -ouex pipefail

dnf5 install -y tmux sway-config-fedora NetworkManager-openvpn \
  nm-connection-editor network-manager-applet pavucontrol dolphin \
  blueman-applet btop ddcutil light

gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'

# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging

#### Example for enabling a System Unit File

systemctl enable podman.socket
