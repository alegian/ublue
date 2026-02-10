#!/bin/bash

set -ouex pipefail

bash "$(dirname "$0")/grub-hack.sh"

sudo dnf5 copr enable -y tofik/nwg-shell
sudo dnf5 copr enable -y swayfx/swayfx
sudo dnf5 copr enable -y erikreider/SwayNotificationCenter
sudo dnf5 copr enable -y alternateved/cliphist
sudo dnf5 copr enable -y lihaohong/yazi

dnf5 install -y sway-config-fedora swayfx NetworkManager-openvpn golang \
  nm-connection-editor network-manager-applet pavucontrol wlogout \
  blueman-applet btop ddcutil light qt6ct nwg-look alacritty ripgrep \
  gammastep gvfs nautilus SwayNotificationCenter chezmoi make gcc cliphist \
  java-25-openjdk maven grim slurp yazi age gtklock ImageMagick greetd \
  gtkgreet

sudo dnf5 copr disable -y lihaohong/yazi
sudo dnf5 copr disable -y alternateved/cliphist
sudo dnf5 copr disable -y erikreider/SwayNotificationCenter
sudo dnf5 copr disable -y swayfx/swayfx
sudo dnf5 copr disable -y tofik/nwg-shell

sudo dnf install -y https://api2.cursor.sh/updates/download/golden/linux-x64-rpm/cursor/2.4
sudo dnf install -y https://cdn.insynchq.com/builds/linux/3.9.8.60034/insync-3.9.8.60034-fc43.x86_64.rpm
sudo dnf install -y https://cdn.insynchq.com/builds/linux/3.9.5.60024/insync-nautilus-3.9.5.60024-1.noarch.rpm

cp "$(dirname "$0")/setup.sh" /etc/profile.d/setup.sh

bash "$(dirname "$0")/neovim.sh"
# bash "$(dirname "$0")/aseprite.sh"
bash "$(dirname "$0")/ghcup.sh"

export PROTON_PASS_CLI_INSTALL_DIR=/usr/bin
curl -fsSL https://proton.me/download/pass-cli/install.sh | bash

systemctl enable podman.socket greetd
