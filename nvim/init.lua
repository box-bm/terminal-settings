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

local opt = vim.opt

opt.number = true
opt.relativenumber = true

opt.clipboard = "unnamedplus"
opt.scrolloff = 8
opt.sidescrolloff = 8

opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.smartindent = true

opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false

opt.signcolumn = "yes"
opt.cursorline = true
opt.splitright = true
opt.splitbelow = true
