# Personal Configuration (dotfiles, nvim, fastfetch)

This repository contains my full environment configuration:
- Zsh (dotfiles)
- Neovim
- Fastfetch

The setup is **modular**, **portable**, and **safe**:
- Each module has its own `setup.sh`
- A root script orchestrates all modules
- No dependencies are installed automatically
- Everything is managed via symbolic links

Compatible with:
- macOS
- Linux
- WSL (Windows via Linux)

## Quick Install

Clone the repository:

```sh
git clone https://github.com/box-bm/terminal-settings.git ~/.config
cd ~/.config
```

**I recommend to check [Dependencies](#dependencies-manual-installation) before run each setup**

Make scripts executable:

```sh
chmod +x setup.sh dotfiles/setup.sh nvim/setup.sh fastfetch/setup.sh
```

Run everything:

```sh
./setup.sh
```

You can also run individual modules:

```sh
./dotfiles/setup.sh
./nvim/setup.sh
./fastfetch/setup.sh
```

## What Each Module Does

### Zsh (dotfiles/)
-	Creates a symlink for ~/.zshrc
-	Loads modular configuration (env, paths, aliases, etc.)
-	Runs fastfetch on interactive shell startup (if installed)

### Neovim (nvim/)
-	Creates a symlink for ~/.config/nvim
-	Does not install Neovim or plugins automatically

### Fastfetch (fastfetch/)
-	Creates a symlink for ~/.config/fastfetch
-	Execution is controlled from Zsh

## Backups

Existing configurations are backed up to:

```sh
~/.dotfiles_backup/
```

Nothing is deleted without a backup.

## Dependencies (Manual Installation)

This repository does not install dependencies automatically.
All tools must be installed explicitly.

Install it manually and **check the oficial website if something change along the time**.

**The repository assumes that is already installed each of them**

### [Homebrew](https://brew.sh)

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### [Oh My Zsh](https://ohmyz.sh)

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

## Repository

### Philosophy

- setup.sh only creates symlinks
- The README documents
- Nothing modifies the system without explicit user intent
- Everything is idempotent and re-runnable

### Structure

Each folder is independent.

dotfiles/   → shell configuration

nvim/       → Neovim configuration

fastfetch/  → fastfetch configuration



## Daily Usage

Open a new terminal.
If fastfetch is installed, it will run automatically.
If not, nothing happens.

## License

Personal use.

> If you are looking my personal keys, there are not here so let's stop searching them pls :) 
