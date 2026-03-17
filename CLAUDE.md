# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Personal dotfiles and environment configuration managed via symlinks. Covers Zsh, Neovim, Fastfetch, Ghostty, and Git.

## Setup

```sh
chmod +x setup.sh
./setup.sh
```

The root `setup.sh` delegates to per-module `setup.sh` scripts (`dotfiles/`, `nvim/`, `fastfetch/`). Each script creates symlinks and backs up existing configs to `~/.dotfiles_backup/`. Scripts are idempotent — safe to re-run.

## Architecture

### Symlink model
- Config files live in this repo; `setup.sh` creates symlinks at the expected system paths.
- No dependencies are installed — the scripts assume tools are already present.

### Zsh (`dotfiles/`)
- `dotfiles/zsh/zshrc` → symlinked to `~/.zshrc`
- Loads Oh My Zsh (theme: `gnzh`, plugins: `git`, `zsh-autosuggestions`, `zsh-syntax-highlighting`)
- Sources modular files: `env.zsh`, `paths.zsh`, `aliases.zsh`
- Fastfetch runs once on SHLVL=1 interactive shells

### Neovim (`nvim/`)
- Entry point: `nvim/init.lua` — sets vim options, then loads `remap.lua` and `config/lazy.lua`
- Plugin manager: [lazy.nvim](https://github.com/folke/lazy.nvim) (auto-bootstrapped)
- Plugin specs live in `lua/plugins/` (imported via `{ import = "plugins" }`)
- Plugin configs live in `lua/plugin/*.lua` (loaded explicitly from `init.lua`)
- LSP servers managed by Mason; configured in `lua/plugin/lsp.lua`
- Leader key: `<Space>`

### Ghostty (`ghostty/`)
- Single config file at `ghostty/config`
- Theme: Jellybeans, Font: JetBrains Mono

### Git (`git/`)
- `git/ignore` — global gitignore
- `git/allowed_signers` — commit signing config
