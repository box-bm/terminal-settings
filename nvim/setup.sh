#!/usr/bin/env bash
set -e

NVIM_SRC="$(cd "$(dirname "$0")" && pwd)"
NVIM_DEST="$HOME/.config/nvim"
BACKUP="$HOME/.dotfiles_backup"

mkdir -p "$HOME/.config"
mkdir -p "$BACKUP"

if [ "$NVIM_SRC" = "$NVIM_DEST" ]; then
  echo "Neovim config already in ~/.config/nvim, nothing to do"
  exit 0
fi

if [ -L "$NVIM_DEST" ] && [ "$(readlink "$NVIM_DEST")" = "$NVIM_SRC" ]; then
  echo "Neovim symlink already correct"
  exit 0
fi

if [ -e "$NVIM_DEST" ]; then
  echo "Backing up existing ~/.config/nvim"
  mv "$NVIM_DEST" "$BACKUP/nvim"
fi

ln -s "$NVIM_SRC" "$NVIM_DEST"
echo "Linked ~/.config/nvim → $NVIM_SRC"
