#!/usr/bin/env bash
set -e

FASTFETCH_SRC="$(cd "$(dirname "$0")" && pwd)"
FASTFETCH_DEST="$HOME/.config/fastfetch"
BACKUP="$HOME/.dotfiles_backup"

mkdir -p "$BACKUP"
mkdir -p "$HOME/.config"

if [ -L "$FASTFETCH_DEST" ]; then
  exit 0
fi

if [ -e "$FASTFETCH_DEST" ]; then
  mv "$FASTFETCH_DEST" "$BACKUP/"
fi

ln -s "$FASTFETCH_SRC" "$FASTFETCH_DEST"