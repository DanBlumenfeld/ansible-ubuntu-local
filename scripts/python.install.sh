#!/bin/bash
# Description: Ensure Python + venv + pipx are installed and usable (Ubuntu/Debian)
# Example: ./python.install.sh
set -euo pipefail

SCRIPT_DIR="$(dirname "$(realpath "$0")")"

check_installed() {
  command -v "$1" >/dev/null 2>&1
}

ensure_apt_packages() {
  sudo apt update
  sudo apt install -y "$@"
}

main() {
  # Install required packages if missing
  if ! check_installed python3; then
    echo "Installing python3…"
    ensure_apt_packages python3
  fi
  if ! python3 -m venv --help >/dev/null 2>&1; then
    echo "Installing python3-venv…"
    ensure_apt_packages python3-venv
  fi
  if ! check_installed pipx; then
    echo "Installing pipx…"
    ensure_apt_packages pipx
  fi

  # Make sure PATH contains ~/.local/bin now and in future shells
  export PATH="$HOME/.local/bin:$PATH"
  pipx ensurepath >/dev/null 2>&1 || true

  # Light verification
  echo "python3: $(python3 --version)"
  echo "pipx: $(pipx --version)"
  case ":$PATH:" in
    *":$HOME/.local/bin:"*) echo "~/.local/bin is on PATH";;
    *) echo "NOTE: ~/.local/bin not on PATH for this shell; source your shell rc or start a new session.";;
  esac
}

main "$@"
