# Neovim Keybindings Reference

**Leader Key**: `Space`

---

## Global Navigation & Editing
*Defined in: `lua/remap.lua`*

### Window Navigation
| Key | Action |
|-----|--------|
| `<C-h>` | Move to left window |
| `<C-j>` | Move to window below |
| `<C-k>` | Move to window above |
| `<C-l>` | Move to right window |

### Window Resizing
| Key | Action |
|-----|--------|
| `<C-Up>` | Increase window height |
| `<C-Down>` | Decrease window height |
| `<C-Left>` | Decrease window width |
| `<C-Right>` | Increase window width |

### Buffer Navigation
| Key | Action |
|-----|--------|
| `<S-h>` | Previous buffer |
| `<S-l>` | Next buffer |
| `<leader>bd` | Delete buffer |

### Text Editing
| Key | Mode | Action |
|-----|------|--------|
| `<` | Visual | Indent left (maintains selection) |
| `>` | Visual | Indent right (maintains selection) |
| `J` | Visual | Move selection down |
| `K` | Visual | Move selection up |
| `<leader>p` | Visual | Paste without yanking replaced text |

### Scrolling & Search
| Key | Action |
|-----|--------|
| `<C-d>` | Scroll down (cursor centered) |
| `<C-u>` | Scroll up (cursor centered) |
| `n` | Next search result (cursor centered) |
| `N` | Previous search result (cursor centered) |
| `<Esc>` | Clear search highlighting |

### File Operations
| Key | Mode | Action |
|-----|------|--------|
| `<C-s>` | Normal/Insert | Save file |

---

## File Explorer (Nvim-Tree)
*Defined in: `lua/plugin/tree.lua`*

### Global Keybindings (from any buffer)
| Key | Action |
|-----|--------|
| `<leader>et` | Toggle file explorer |
| `<leader>ef` | Focus file explorer |
| `<leader>ee` | Find current file in explorer |
| `<leader>ec` | Collapse file explorer |

### In Explorer Buffer
| Key | Action |
|-----|--------|
| `l` | Open file/folder |
| `h` | Close folder/go to parent |
| `v` | Open in vertical split |
| `s` | Open in horizontal split |
| `?` | Toggle help |
| *Plus all default nvim-tree mappings* | |

---

## Fuzzy Finder (Telescope)
*Defined in: `lua/plugin/telescope.lua`*

### File Finding
| Key | Action |
|-----|--------|
| `<leader>ff` | Find files by name |
| `<leader>fo` | Recent files (oldfiles) |
| `<leader>fr` | Resume last search |

### Text Search
| Key | Action |
|-----|--------|
| `<leader>fg` | Live grep (search text in project) |
| `<leader>fw` | Find word under cursor |

### Buffers & Navigation
| Key | Action |
|-----|--------|
| `<leader>fb` | List open buffers |

### Help & Commands
| Key | Action |
|-----|--------|
| `<leader>fh` | Search help tags |
| `<leader>fc` | Search commands |
| `<leader>fk` | Search keymaps |

### Git Integration
| Key | Action |
|-----|--------|
| `<leader>fgc` | Git commits |
| `<leader>fgs` | Git status |
| `<leader>fgb` | Git branches |

### LSP & Diagnostics
| Key | Action |
|-----|--------|
| `<leader>fd` | Show diagnostics |
| `<leader>fs` | Document symbols |
| `<leader>fS` | Workspace symbols |

### Inside Telescope Picker
| Key | Mode | Action |
|-----|------|--------|
| `<C-j>` | Insert | Next item |
| `<C-k>` | Insert | Previous item |
| `<C-t>` | Insert/Normal | Send to Trouble |
| `<C-q>` | Insert | Send selected to quickfix |
| `<C-d>` | Insert | Delete buffer |
| `<Esc>` | Insert | Close picker |
| `q` | Normal | Close picker |
| `dd` | Normal | Delete buffer |

---

## LSP (Language Server)
*Defined in: `lua/plugin/lsp.lua`*

### Navigation
| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gi` | Go to implementation |
| `gr` | Go to references |
| `gt` | Go to type definition |

### Documentation
| Key | Action |
|-----|--------|
| `K` | Hover documentation |
| `<leader>k` | Signature help |

### Code Actions & Refactoring
| Key | Action |
|-----|--------|
| `<leader>ca` | Code action |
| `<leader>rn` | Rename symbol |
| `<leader>cf` | Format buffer |

---

## Completion (nvim-cmp)
*Defined in: `lua/plugin/cmp.lua`*

### Insert Mode
| Key | Action |
|-----|--------|
| `<Tab>` | Next completion / expand snippet |
| `<S-Tab>` | Previous completion / jump back in snippet |
| `<C-Space>` | Trigger completion |
| `<C-e>` | Abort completion |
| `<CR>` | Confirm selection |
| `<C-b>` | Scroll docs up |
| `<C-f>` | Scroll docs down |

---

## Multicursor (vim-visual-multi)
*Defined in: `lua/plugin/multicursor.lua`*

| Key | Action |
|-----|--------|
| `<C-n>` | Find next occurrence / add cursor |
| `<A-j>` | Add cursor down |
| `<A-k>` | Add cursor up |
| `n` | Skip current region |
| `N` | Remove last cursor |
| `<C-a>` | Select all occurrences |
| `<leader>mq` | Exit multicursor mode |

---

## Flash Navigation
*Defined in: `lua/plugins.lua`*

| Key | Mode | Action |
|-----|------|--------|
| `s` | Normal/Visual/Operator | Jump to any location |
| `S` | Normal/Visual/Operator | Treesitter jump |
| `r` | Operator | Remote flash |
| `R` | Visual/Operator | Treesitter search |

---

## Trouble (Diagnostics)
*Defined in: `lua/plugins.lua`*

| Key | Action |
|-----|--------|
| `<leader>xx` | Toggle diagnostics |
| `<leader>xX` | Buffer diagnostics |
| `<leader>cs` | Symbols |
| `<leader>cl` | LSP definitions/references |
| `<leader>xL` | Location list |
| `<leader>xQ` | Quickfix list |

---

## Claude Code (AI Assistant)
*Defined in: `lua/plugins.lua`*

| Key | Mode | Action |
|-----|------|--------|
| `<leader>ac` | Normal | Toggle Claude |
| `<leader>af` | Normal | Focus Claude |
| `<leader>ar` | Normal | Resume Claude |
| `<leader>aC` | Normal | Continue Claude |
| `<leader>am` | Normal | Select Claude model |
| `<leader>ab` | Normal | Add current buffer |
| `<leader>as` | Visual | Send to Claude |
| `<leader>aa` | Normal | Accept diff |
| `<leader>ad` | Normal | Deny diff |

---

## Quick Reference Card

### Most Used Commands
```
<leader>ff    - Find files
<leader>fg    - Search text (grep)
<leader>et    - Toggle file tree
<C-h/j/k/l>   - Navigate windows
<S-h/l>       - Switch buffers
gd            - Go to definition
K             - Show documentation
<leader>ca    - Code action
<C-n>         - Multicursor (find next)
s             - Flash jump
```

### Leader Key Groups
```
<leader>f     - Find/Search (Telescope)
<leader>e     - Explorer (Nvim-Tree)
<leader>x     - Diagnostics (Trouble)
<leader>a     - AI/Claude Code
<leader>c     - Code actions
<leader>r     - Refactor
<leader>b     - Buffers
```
