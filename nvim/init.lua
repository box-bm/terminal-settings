-- ============================================================================
-- Vim Options (Set BEFORE loading plugins)
-- ============================================================================

local opt = vim.opt
local g = vim.g

-- Performance settings
opt.updatetime = 250
opt.timeoutlen = 300
opt.lazyredraw = false -- Don't redraw while executing macros
opt.synmaxcol = 300 -- Only syntax highlight first 300 columns

-- Numbers (RELATIVE LINE NUMBERS)
opt.number = true
opt.relativenumber = true

-- Clipboard
opt.clipboard = "unnamedplus"

-- Scroll
opt.scrolloff = 8
opt.sidescrolloff = 8

-- Indentation
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.smartindent = true
opt.autoindent = true

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false
opt.incsearch = true

-- UI
opt.signcolumn = "yes"
opt.cursorline = true
opt.splitright = true
opt.splitbelow = true
opt.termguicolors = true
opt.wrap = false

-- File handling
opt.swapfile = false
opt.backup = false
opt.undofile = true
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

-- Completion
opt.completeopt = { "menu", "menuone", "noselect" }
opt.pumheight = 10 -- Limit popup menu height

-- Mouse
opt.mouse = "a"

-- Misc
opt.hidden = true
opt.showmode = false
opt.ruler = false

-- Create undo directory if it doesn't exist
local undodir = os.getenv("HOME") .. "/.vim/undodir"
if vim.fn.isdirectory(undodir) == 0 then
	vim.fn.mkdir(undodir, "p")
end

-- ============================================================================
-- Load Keymaps and Plugins
-- ============================================================================

require("remap")
require("config.lazy")

require("plugin.autopairs")
require("plugin.theme")
require("plugin.lsp")
require("plugin.cmp")
require("plugin.telescope")
require("plugin.tree")
require("plugin.lualine")
require("plugin.gitsigns")
require("plugin.formatting")
require("plugin.linters")
require("plugin.bufremove")
require("plugin.toggleterm")
require("plugin.multicursor")
require("plugin.treesitter")
