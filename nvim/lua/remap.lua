vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.api.nvim_set_keymap

-- Window navigation
-- Move to left window
map("n", "<C-H>", "<C-W>h", { silent = true, desc = "Move to left window" })
-- Move to window below
map("n", "<C-J>", "<C-W>j", { silent = true, desc = "Move to window below" })
-- Move to window above
map("n", "<C-K>", "<C-W>k", { silent = true, desc = "Move to window above" })
-- Move to right window
map("n", "<C-L>", "<C-W>l", { silent = true, desc = "Move to right window" })

-- Buffer management
-- Next buffer
map("n", "<leader>wn", ":bnext<CR>", { silent = true, desc = "Next buffer" })
-- Previous buffer
map("n", "<leader>wp", ":bprevious<CR>", { silent = true, desc = "Previous buffer" })
-- Delete buffer
map("n", "<leader>wd", ":bdelete<CR>", { silent = true, desc = "Delete buffer" })
-- Toggle terminal
map("n", "<leader>tt", "<cmd>ToggleTerm<CR>", { silent = true, desc = "Toggle terminal" })

-- Split
vim.keymap.set("n", "<leader>sv", ":vsplit<CR>", { noremap = true, silent = true, desc = "Vertical Split" })   -- Split vertical
vim.keymap.set("n", "<leader>sh", ":split<CR>", { noremap = true, silent = true, desc = "Horizontal Split" })    -- Split horizontal


-- LSP mappings
-- Go to definition
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { silent = true, desc = "Go to definition" })
-- List references
map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { silent = true, desc = "List references" })
-- Hover documentation
map("n", "K",  "<cmd>lua vim.lsp.buf.hover()<CR>", { silent = true, desc = "Hover documentation" })
-- Rename symbol
map("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", { silent = true, desc = "Rename symbol" })
-- Code action
map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", { silent = true, desc = "Code action" })
