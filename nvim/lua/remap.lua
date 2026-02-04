-- ============================================================================
-- Global Keybindings
-- ============================================================================
-- General keybindings that don't belong to specific plugins
-- Plugin-specific keybindings are in their respective lua/plugin/*.lua files

local map = vim.keymap.set

-- ============================================================================
-- Leader Keys
-- ============================================================================
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- ============================================================================
-- Vim Visual Multi (Multicursor) Configuration
-- ============================================================================

-- Disable default mappings
vim.g.VM_default_mappings = 0

-- Custom keybindings
vim.g.VM_maps = {
	-- Find and select
	["Find Under"] = "<C-n>", -- Find next occurrence of word under cursor
	["Find Subword Under"] = "<C-n>", -- Find next occurrence (subword)

	-- Add cursors vertically
	["Select Cursor Down"] = "<A-j>", -- Add cursor down
	["Select Cursor Up"] = "<A-k>", -- Add cursor up

	-- Selection control
	["Skip Region"] = "n", -- Skip current region and go to next
	["Remove Last Cursor"] = "N", -- Remove last cursor

	-- Select all
	["Select All"] = "<C-a>", -- Select all occurrences

	-- Exit multicursor mode
	["Exit"] = "<leader>mq",
}

-- ============================================================================
-- Window Navigation
-- ============================================================================
map("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Move to window below" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to window above" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- ============================================================================
-- Window Resizing
-- ============================================================================
map("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase window height" })
map("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease window height" })
map("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
map("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase window width" })

-- ============================================================================
-- Buffer Navigation
-- ============================================================================
map("n", "<S-h>", ":bprevious<CR>", { desc = "Previous buffer" })
map("n", "<S-l>", ":bnext<CR>", { desc = "Next buffer" })
map("n", "<leader>bd", ":bdelete<CR>", { desc = "Delete buffer" })

-- ============================================================================
-- Text Editing
-- ============================================================================

-- Better indenting (maintains selection)
map("v", "<", "<gv", { desc = "Indent left" })
map("v", ">", ">gv", { desc = "Indent right" })

-- Move text up and down
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Better paste (don't yank replaced text)
map("x", "<leader>p", '"_dP', { desc = "Paste without yanking" })

-- ============================================================================
-- Navigation & Scrolling
-- ============================================================================

-- Keep cursor centered when scrolling
map("n", "<C-d>", "<C-d>zz", { desc = "Scroll down (centered)" })
map("n", "<C-u>", "<C-u>zz", { desc = "Scroll up (centered)" })

-- Keep cursor centered when searching
map("n", "n", "nzzzv", { desc = "Next search result (centered)" })
map("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })

-- ============================================================================
-- Search & Highlighting
-- ============================================================================
map("n", "<Esc>", ":noh<CR>", { desc = "Clear search highlighting" })

-- ============================================================================
-- File Operations
-- ============================================================================
map("n", "<C-s>", ":w<CR>", { desc = "Save file" })
map("i", "<C-s>", "<Esc>:w<CR>a", { desc = "Save file (insert mode)" })
