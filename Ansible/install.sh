#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$ROOT_DIR"

echo "==> Starting Mac installer from $ROOT_DIR"

if ! xcode-select -p >/dev/null 2>&1; then
  echo "==> Installing Xcode Command Line Tools..."
  xcode-select --install
  echo ""
  echo "Xcode Command Line Tools installation has started. Re-run this script after it finishes."
  exit 1
fi

if ! command -v brew >/dev/null 2>&1; then
  echo "==> Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

if command -v brew >/dev/null 2>&1; then
  eval "$(brew shellenv)"
else
  echo "ERROR: Homebrew is not available after installation."
  exit 1
fi

echo "==> Updating Homebrew and installing packages..."
brew update
brew install git ansible

echo "==> Installing required Ansible collection..."
ansible-galaxy collection install community.general

echo "==> Running Ansible playbook..."
ansible-playbook -i inventory.ini playbook.yml -c local

echo "==> Mac setup complete."
