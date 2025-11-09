#!/bin/bash
# Description: Install Ansible (system) + pipx-managed dev tools on Ubuntu
# Example: ./ansible.install.sh
set -euo pipefail

PROGRAM="ansible"
SCRIPT_DIR="$(dirname "$(realpath "$0")")"

# --- helpers ---------------------------------------------------------------
check_installed() {
  if [[ -x "$SCRIPT_DIR/util/check_is_installed.sh" ]]; then
    "$SCRIPT_DIR/util/check_is_installed.sh" "$1"
  else
    command -v "$1" >/dev/null 2>&1
  fi
}

ensure_apt_packages() {
  sudo apt update
  sudo apt install -y "$@"
}

install_ansible_system() {
  if check_installed "$PROGRAM"; then
    echo "$PROGRAM already installed."
    return
  fi

  echo "$PROGRAM not found. Proceeding with system installation…"
  ensure_apt_packages software-properties-common
  sudo add-apt-repository --yes --update ppa:ansible/ansible
  ensure_apt_packages "$PROGRAM"
}

ensure_ansible_dev_tools() {
  export PATH="$HOME/.local/bin:$PATH"

  tools=(
    ansible-lint
    molecule
    ansible-navigator
    ansible-builder
    ansible-creator
    ansible-sign
    pytest-ansible
    tox-ansible
    ansible-dev-environment
  )

  for t in "${tools[@]}"; do
    if pipx list | grep -q "package $t "; then
      echo "pipx upgrade $t"
      pipx upgrade "$t" || true
    else
      echo "pipx install $t"
      pipx install "$t"
    fi
  done

  which ansible-lint || echo "WARN: ansible-lint not on PATH; ensure ~/.local/bin is exported."
}


# --- main ------------------------------------------------------------------
# Ensure pipx exists (and Python/venv if needed) by delegating to the companion script
if ! check_installed pipx; then
  echo "pipx not found. Running python.install.sh…"
  "$SCRIPT_DIR/python.install.sh"
fi

# Now install system Ansible if needed
if check_installed "$PROGRAM"; then
  echo "$PROGRAM already installed."
else
  install_ansible_system
fi

# Dev tools via pipx (ansible-lint, molecule, etc.)
ensure_ansible_dev_tools

# Common extras
if check_installed ansible-galaxy; then
  echo "Installing common Ansible collections…"
  ansible-galaxy collection install ansible.posix
fi

# Final verification
if check_installed "$PROGRAM"; then
  echo "$PROGRAM has been successfully installed."
else
  echo "Failed to install $PROGRAM." >&2
  exit 1
fi
