#!/bin/bash
set -e

# dotfiles/setup.sh
# Only handles shell-related symlinks

DOTFILES="$HOME/.config/dotfiles"
BACKUP_DIR="$HOME/.dotfiles_backup"

mkdir -p "$BACKUP_DIR"

link() {
  src="$1"
  dest="$2"

  if [ -L "$dest" ]; then
    echo "Symlink already exists: $dest"
    return
  fi

  if [ -e "$dest" ]; then
    echo "Backing up $dest"
    mv "$dest" "$BACKUP_DIR/"
  fi

  ln -s "$src" "$dest"
  echo "Linked $dest → $src"
}

# Zsh
link "$DOTFILES/zsh/zshrc" "$HOME/.zshrc"