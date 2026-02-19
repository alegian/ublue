#!/bin/bash

set -ouex pipefail

dnf5 copr enable -y tofik/nwg-shell
dnf5 copr enable -y swayfx/swayfx
dnf5 copr enable -y erikreider/SwayNotificationCenter
dnf5 copr enable -y alternateved/cliphist
dnf5 copr enable -y lihaohong/yazi

dnf5 install -y sway-config-fedora swayfx NetworkManager-openvpn golang \
  nm-connection-editor network-manager-applet pavucontrol wlogout \
  blueman-applet btop ddcutil light qt6ct nwg-look alacritty ripgrep \
  gammastep gvfs nautilus SwayNotificationCenter chezmoi make gcc cliphist \
  java-21-openjdk maven grim slurp yazi age gtklock ImageMagick greetd \
  gtkgreet python3-tmuxp

dnf5 copr disable -y lihaohong/yazi
dnf5 copr disable -y alternateved/cliphist
dnf5 copr disable -y erikreider/SwayNotificationCenter
dnf5 copr disable -y swayfx/swayfx
dnf5 copr disable -y tofik/nwg-shell

dnf install -y https://api2.cursor.sh/updates/download/golden/linux-x64-rpm/cursor/2.5
dnf install -y https://cdn.insynchq.com/builds/linux/3.9.8.60034/insync-3.9.8.60034-fc43.x86_64.rpm
dnf install -y https://cdn.insynchq.com/builds/linux/3.9.5.60024/insync-nautilus-3.9.5.60024-1.noarch.rpm

bash "$(dirname "$0")/neovim.sh"
bash "$(dirname "$0")/aseprite.sh"

export PROTON_PASS_CLI_INSTALL_DIR=/usr/bin
curl -fsSL https://proton.me/download/pass-cli/install.sh | bash

sudo sed -i '2i cd $HOME' /usr/bin/start-sway

mkdir -p /usr/local/share/fonts/roboto-mono-nerd \
  && curl -L -o /tmp/RobotoMono.zip \
     https://github.com/ryanoasis/nerd-fonts/releases/latest/download/RobotoMono.zip \
  && unzip /tmp/RobotoMono.zip -d /usr/local/share/fonts/roboto-mono-nerd \
  && rm -f /tmp/RobotoMono.zip 

systemctl set-default graphical.target
systemctl enable podman.socket greetd
