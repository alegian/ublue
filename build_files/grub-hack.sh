#!/bin/bash

GRUB_FILE="/etc/default/grub"

sed -i 's/^GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"/GRUB_CMDLINE_LINUX_DEFAULT="quiet splash acpi_osi=\\"!Windows 2015\\""/' "$GRUB_FILE"

grub-mkconfig -o /boot/grub/grub.cfg
