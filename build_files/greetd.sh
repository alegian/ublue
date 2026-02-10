#!/bin/bash

set -ouex pipefail

cp -R "$(dirname "$0")/greetd" /etc

useradd -M -g 39 greeter
chmod -R go+r /etc/greetd/
systemctl enable --now greetd
