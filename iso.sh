#!/bin/bash

podman pull ghcr.io/alegian/ublue:latest

just clean
just _build-bib ghcr.io/alegian/ublue latest anaconda-iso disk_config/iso.toml
