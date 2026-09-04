#!/bin/bash

set -ouex pipefail

dnf5 copr enable -y tofik/nwg-shell
dnf5 copr enable -y swayfx/swayfx
dnf5 copr enable -y erikreider/SwayNotificationCenter
dnf5 copr enable -y alternateved/cliphist
dnf5 copr enable -y lihaohong/yazi
dnf5 copr enable -y leloubil/wl-clip-persist

dnf5 install -y sway-config-fedora swayfx NetworkManager-openvpn golang \
  nm-connection-editor network-manager-applet pavucontrol wlogout \
  blueman-applet btop ddcutil light qt6ct nwg-look alacritty ripgrep \
  gammastep gvfs nautilus SwayNotificationCenter chezmoi make gcc cliphist \
  java-25-openjdk maven grim slurp yazi age gtklock ImageMagick greetd \
  gtkgreet python3-tmuxp flite wl-clip-persist rofimoji postgresql \
  gnome-keyring nmap cronie gh gtk3-devel mesa-demos zlib-ng-compat.i686 \
  bzip2-libs.i686 chromium git-delta libxcrypt-compat

dnf5 copr disable -y leloubil/wl-clip-persist
dnf5 copr disable -y lihaohong/yazi
dnf5 copr disable -y alternateved/cliphist
dnf5 copr disable -y erikreider/SwayNotificationCenter
dnf5 copr disable -y swayfx/swayfx
dnf5 copr disable -y tofik/nwg-shell

tee /etc/yum.repos.d/smallstep.repo >/dev/null <<'EOF'
[smallstep]
name=Smallstep
baseurl=https://packages.smallstep.com/stable/fedora/
enabled=1
repo_gpgcheck=0
gpgcheck=1
gpgkey=https://packages.smallstep.com/keys/smallstep-0x889B19391F774443.gpg
EOF

dnf5 makecache
dnf5 install -y step-cli

dnf install -y https://api2.cursor.sh/updates/download/golden/linux-x64-rpm/cursor/latest
dnf install -y https://cdn.insynchq.com/builds/linux/3.9.8.60034/insync-3.9.8.60034-fc43.x86_64.rpm
dnf install -y https://cdn.insynchq.com/builds/linux/3.9.5.60024/insync-nautilus-3.9.5.60024-1.noarch.rpm

dnf5 install -y \
    /akmods/kmods/*openrazer*.rpm \
    /akmods/common/*openrazer*.rpm

bash "$(dirname "$0")/neovim.sh"

export PROTON_PASS_CLI_INSTALL_DIR=/usr/bin
curl -fsSL https://proton.me/download/pass-cli/install.sh | bash

sed -i '2i cd $HOME' /usr/bin/start-sway

systemctl set-default graphical.target
systemctl enable podman.socket greetd
