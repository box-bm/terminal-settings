#!/usr/bin/env bash
set -e

FASTFETCH_SRC="$(cd "$(dirname "$0")" && pwd)"
FASTFETCH_DEST="$HOME/.config/fastfetch"
BACKUP="$HOME/.dotfiles_backup"

mkdir -p "$HOME/.config"
mkdir -p "$BACKUP"

# Caso 1: el repo ya vive en ~/.config/fastfetch
if [ "$FASTFETCH_SRC" = "$FASTFETCH_DEST" ]; then
  echo "Fastfetch config already in ~/.config/fastfetch, nothing to do"
  exit 0
fi

# Caso 2: symlink correcto ya existe
if [ -L "$FASTFETCH_DEST" ] && [ "$(readlink "$FASTFETCH_DEST")" = "$FASTFETCH_SRC" ]; then
  echo "Fastfetch symlink already correct"
  exit 0
fi

# Caso 3: existe algo distinto en ~/.config/fastfetch
if [ -e "$FASTFETCH_DEST" ]; then
  echo "Backing up existing ~/.config/fastfetch"
  mv "$FASTFETCH_DEST" "$BACKUP/fastfetch"
fi

# Crear symlink
ln -s "$FASTFETCH_SRC" "$FASTFETCH_DEST"
echo "Linked ~/.config/fastfetch → $FASTFETCH_SRC"
