#!/bin/bash

cp -R "$(dirname "$0")/greetd" /etc

groupadd video
useradd -M -G video greeter
chmod -R go+r /etc/greetd/
systemctl enable --now greetd
