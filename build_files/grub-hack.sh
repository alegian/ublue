#!/bin/bash

mkdir -p /usr/lib/bootc/kargs.d

echo 'kargs = ["acpi_osi=\"!Windows 2015\""]' > /usr/lib/bootc/kargs.d/acpi-fix.toml
