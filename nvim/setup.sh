#!/usr/bin/env bash
set -e

NVIM_SRC="$(cd "$(dirname "$0")" && pwd)"
NVIM_DEST="$HOME/.config/nvim"
BACKUP="$HOME/.dotfiles_backup"

mkdir -p "$BACKUP"

if [ -L "$NVIM_DEST" ]; then
  exit 0
fi

if [ -e "$NVIM_DEST" ]; then
  mv "$NVIM_DEST" "$BACKUP/"
fi

ln -s "$NVIM_SRC" "$NVIM_DEST"