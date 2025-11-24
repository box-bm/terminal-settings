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

-- duplicate selection down
-- Duplicate line or selection down
map("v", "<leader>dj", "y'>p", { silent = true, desc = "Duplicate selection down" })

-- Duplicate line or selection up
map("v", "<leader>dk", "y'<P", { silent = true, desc = "Duplicate selection up" })

-- format code with prettier
map("n", "<leader>pf", "<cmd>Prettier<CR>", { silent = true, desc = "Format code with Prettier" })

-- LSP mappings
-- Go to definition
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { silent = true, desc = "Go to definition" })
-- List references
map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { silent = true, desc = "List references" })
-- Rename symbol
map("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", { silent = true, desc = "Rename symbol" })
-- Code action
map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", { silent = true, desc = "Code action" })

-- Multicursor
-- Desactivar mapeos por defecto
vim.g.VM_default_mappings = 0

-- Mapeos personalizados
vim.g.VM_maps = {
	["Find Under"] = "<C-n>", -- Añadir cursor en palabra actual
	["Find Subword Under"] = "<C-n>", -- Igual pero para subpalabras
	["Select Cursor Down"] = "<C-j>", -- Control + Option + j
	["Select Cursor Up"] = "<C-k>", -- Control + Option + k
	["Remove Last Cursor"] = "<C-x>", -- Quitar último cursor
	["Skip Region"] = "<C-s>", -- Saltar coincidencia
	["Select All"] = "<C-a>", -- Seleccionar todas las coincidencias
	["Exit"] = "<Esc>", -- salir del modo multicursor
}
