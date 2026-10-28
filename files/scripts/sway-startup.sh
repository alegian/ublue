#!/usr/bin/env bash
set -euo pipefail

sed -i '2i cd $HOME' /usr/bin/start-sway
