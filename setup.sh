#!/usr/bin/env bash
set -e

run() {
  name="$1"
  script="$2"

  if [ -x "$script" ]; then
    echo "→ setting up $name"
    "$script"
  else
    echo "↷ skipping $name (no setup.sh)"
  fi
}

run "zsh"       "./dotfiles/setup.sh"
run "neovim"    "./nvim/setup.sh"
# run "fastfetch" "./fastfetch/setup.sh"