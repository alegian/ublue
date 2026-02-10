#!/bin/bash

cp -R "$(dirname "$0")/greetd" /etc/greetd

sudo useradd -M -G video greeter
sudo chmod -R go+r /etc/greetd/
systemctl enable --now greetd
