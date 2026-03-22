#!/usr/bin/env bash

# Usage: install_package <package> [winget_id]
install_package() {
  local package="$1"
  local winget_id="${2:-$1}"
  local install_cmd

  if command -v brew &>/dev/null; then
    install_cmd="brew install $package"
  elif command -v apt-get &>/dev/null; then
    install_cmd="sudo apt-get install -y $package"
  elif command -v dnf &>/dev/null; then
    install_cmd="sudo dnf install -y $package"
  elif command -v yum &>/dev/null; then
    install_cmd="sudo yum install -y $package"
  elif command -v winget &>/dev/null; then
    install_cmd="winget install $winget_id"
  elif command -v choco &>/dev/null; then
    install_cmd="choco install $package"
  else
    echo "$package is not installed and no supported package manager was found."
    echo "Please install $package manually."
    return 1
  fi

  read -r -p "$package is not installed. Install it now? ($install_cmd) [y/N] " response
  if [[ "$response" =~ ^[Yy]$ ]]; then
    eval "$install_cmd"
  else
    echo "$package is required. Exiting."
    return 1
  fi
}

if ! command -v stow &>/dev/null; then
  install_package stow GnuStow.Stow || exit 1
fi

stow .

if [ ! -d ~/.tmux/plugins/tpm ]; then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi