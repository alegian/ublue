#!/usr/bin/env bash
set -euo pipefail

export PROTON_PASS_CLI_INSTALL_DIR=/usr/bin
curl -fsSL https://proton.me/download/pass-cli/install.sh | bash
