# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal dotfiles repository containing modular environment configurations for macOS/Linux/WSL. The repository is designed to be cloned directly into `~/.config` and uses symlinks to deploy configurations to their proper locations.

**Core Philosophy:**
- Modular structure with independent setup scripts
- Symlink-based deployment (no direct file copying)
- Idempotent operations (safe to re-run)
- Automatic backups to `~/.dotfiles_backup/` before any changes
- No automatic dependency installation (user must install manually)

## Setup Commands

```bash
# Initial setup (from ~/.config)
chmod +x setup.sh
./setup.sh

# Individual module setup
./dotfiles/setup.sh    # Zsh configuration only
./nvim/setup.sh        # Neovim configuration only
./fastfetch/setup.sh   # Fastfetch configuration only
```

The root `setup.sh` orchestrates all module setup scripts. Each module's setup script only creates symlinks and performs no other system modifications.

## Architecture

### Module Structure

The repository is organized into independent configuration modules:

```
.
├── dotfiles/          # Shell configuration (Zsh)
│   ├── setup.sh       # Creates ~/.zshrc symlink
│   └── zsh/
│       ├── zshrc      # Main Zsh config (loads Oh My Zsh + modules)
│       ├── env.zsh    # Environment variables (JAVA_HOME, ANDROID_HOME, LANG)
│       ├── paths.zsh  # PATH modifications (Flutter, Android SDK, .local/bin)
│       └── aliases.zsh # Shell aliases
│
├── nvim/              # Neovim configuration
│   ├── setup.sh       # Creates ~/.config/nvim symlink (if needed)
│   ├── init.lua       # Entry point: loads plugins and sets vim options
│   └── lua/
│       ├── config/
│       │   └── lazy.lua    # Lazy.nvim bootstrap (leader: space)
│       ├── plugins.lua     # Plugin declarations
│       ├── remap.lua       # Global keybindings
│       └── plugin/         # Individual plugin configurations
│           ├── lsp.lua
│           ├── cmp.lua
│           ├── telescope.lua
│           ├── tree.lua
│           ├── formatting.lua
│           ├── linters.lua
│           └── ...
│
├── fastfetch/         # System info display
│   ├── setup.sh       # Creates ~/.config/fastfetch symlink
│   ├── config.jsonc   # Fastfetch configuration
│   └── logo.txt       # Custom ASCII logo
│
├── ghostty/           # Ghostty terminal emulator
│   └── config         # Terminal settings (fonts, colors, opacity)
│
└── setup.sh           # Root orchestrator script
```

### Zsh Configuration

- **Theme**: `gnzh` (Oh My Zsh)
- **Plugins**: git, zsh-autosuggestions, zsh-syntax-highlighting
- **Modular loading**: Sources env.zsh → paths.zsh → aliases.zsh
- **Fastfetch integration**: Auto-runs on first shell (`SHLVL -eq 1`), skipped in nested shells

### Neovim Configuration

**Plugin Manager**: lazy.nvim (auto-bootstrapped on first run, optimized for performance)

**Leader Key**: Space (` `)

**Keybindings Reference**: See `/Users/bmanzo/.config/nvim/KEYBINDINGS.md` for complete keybindings documentation

**Line Numbers**: Relative line numbers enabled (cursor line shows absolute number, other lines show relative distance)

**Performance Optimizations**:
- Lazy loading for most plugins
- Disabled unused built-in plugins
- Optimized updatetime (250ms) and timeoutlen (300ms)
- Persistent undo with dedicated directory
- Smart cache configuration
- Limited syntax highlighting to 300 columns
- Debounced/throttled completion (60ms/30ms)

**Key Plugin Categories**:
- **LSP**: Mason + mason-lspconfig + nvim-lspconfig (language servers)
- **Completion**: nvim-cmp with LSP, buffer, path, cmdline sources + lspkind for icons
  - **Copilot Integration**: copilot.lua + copilot-cmp (fixes crashes from copilot.vim)
  - Performance: debounce 60ms, throttle 30ms, max 30 entries
  - Smart sorting with Copilot prioritization
  - Ghost text preview
- **Snippets**: LuaSnip with friendly-snippets
- **Finding**: Telescope with fzf-native (optimized layout and performance)
  - Horizontal layout with top prompt
  - Smart caching (last 10 pickers)
  - Better keymaps: `<leader>ff/fg/fb/fh/fo/fc/fr/fw/fd/fs`
  - Git integration: `<leader>fgc/fgs`
- **File explorer**: nvim-tree (enhanced performance and features)
  - File system watchers with debouncing
  - Better icons and git integration
  - Custom keymaps: `h/l` for navigation, `v/s` for splits
- **Git**: gitsigns
- **AI**: GitHub Copilot (copilot.lua) + claudecode.nvim (`<leader>a*` keybindings)
- **Formatting**: conform.nvim
- **Linting**: nvim-lint
- **Terminal**: toggleterm
- **Diagnostics**: trouble.nvim (`<leader>x*` keybindings)
- **Navigation**: flash.nvim (`s` for jump, `S` for treesitter jump)
- **Syntax**: nvim-treesitter (configured with 18+ languages)
- **UI**: lualine, which-key, jellybeans theme (transparent)
- **Editing**: nvim-autopairs, nvim-surround, vim-visual-multi (multicursor)

**Multi-cursor** (vim-visual-multi):
- `<C-n>`: Find next occurrence
- `<A-j>/<A-k>`: Add cursor down/up
- `n`: Skip region
- `N`: Remove last cursor
- `<C-a>`: Select all occurrences

**Window navigation**:
- `<C-h/j/k/l>`: Move between splits
- `<C-Up/Down/Left/Right>`: Resize windows
- `<S-h/l>`: Previous/next buffer

**Better editing**:
- `<C-d/u>`: Scroll with centered cursor
- `n/N`: Search with centered cursor
- Visual `J/K`: Move selection up/down
- Visual `</>`: Indent with reselection
- `<leader>p`: Paste without yanking
- `<C-s>`: Quick save (normal and insert)

**Important**: Plugin configurations are in separate files under `lua/plugin/` (not inline in plugins.lua)

### Ghostty Terminal

- **Font**: JetBrainsMono Nerd Font
- **Theme**: Jellybeans
- **Background**: 90% opacity with blur (radius 30)
- **Dimensions**: 120x30 default window size

## Key Dependencies

These must be installed manually:

- **Zsh**: Oh My Zsh framework
- **Zsh plugins**: zsh-autosuggestions, zsh-syntax-highlighting (Oh My Zsh plugins)
- **Neovim**: Latest version
- **Fastfetch**: Optional (system info display)
- **Homebrew**: Package manager (macOS/Linux)
- **Java**: Zulu JDK 17 (configured in env.zsh)
- **Android SDK**: For Android development (ANDROID_HOME set in env.zsh)
- **Flutter**: SDK path in paths.zsh

## Important Notes

1. **Symlink behavior**: Setup scripts check if symlinks already exist and skip creation if correct. Existing files/dirs are backed up before symlinking.

2. **Path to repo matters**: If the repo is cloned to `~/.config`, nvim and fastfetch setup scripts detect this and skip symlink creation (already in correct location).

3. **Backups**: All replaced configurations are moved to `~/.dotfiles_backup/` with timestamps preserved.

4. **Idempotency**: All setup scripts can be run multiple times safely.

5. **Git integration**: The repository tracks only the configuration files. Flutter SDK directory is included but should be ignored in most operations (it's a large external dependency).

## Modifying Configurations

When editing configuration files:

- **Zsh changes**: Edit files in `dotfiles/zsh/`, changes take effect on new shell or `source ~/.zshrc`
- **Neovim changes**: Edit files in `nvim/`, restart Neovim or `:source %` for init.lua changes
- **Plugin additions**: Add to `nvim/lua/plugins.lua`, lazy.nvim auto-installs on next launch
- **Plugin configs**: Create new file in `nvim/lua/plugin/` and require it in `init.lua`
- **PATH changes**: Edit `dotfiles/zsh/paths.zsh`
- **Environment variables**: Edit `dotfiles/zsh/env.zsh`
