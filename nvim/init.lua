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

vim.o.number = true
vim.o.relativenumber = true

vim.o.clipboard = "unnamedplus"
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8

vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.smartindent = true

vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = false

vim.o.signcolumn = "yes"
vim.o.updatetime = 300
vim.o.termguicolors = true
