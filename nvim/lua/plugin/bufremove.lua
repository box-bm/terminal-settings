local bufremove = require("mini.bufremove")
bufremove.setup()

local opts = { noremap = true, silent = true }

-- Cerrar buffer actual sin cerrar ventana
vim.keymap.set("n", "<leader>bd", function()
	bufremove.delete(0, false)
end, { desc = "Cerrar buffer (sin forzar)", noremap = true, silent = true })

-- Forzar cierre del buffer actual
vim.keymap.set("n", "<leader>bD", function()
	bufremove.delete(0, true)
end, { desc = "Cerrar buffer (forzar)", noremap = true, silent = true })

-- Navegar buffers
vim.keymap.set("n", "<Tab>", ":bnext<CR>", { desc = "Buffer siguiente", noremap = true, silent = true })
vim.keymap.set("n", "<S-Tab>", ":bprev<CR>", { desc = "Buffer anterior", noremap = true, silent = true })

-- Listar buffers
vim.keymap.set("n", "<leader>bl", ":ls<CR>", { desc = "Listar buffers", noremap = true, silent = true })

local map = vim.api.nvim_set_keymap

-- split buffer
map("n", "<leader>sh", "<C-W>s", { silent = true, desc = "Split buffer horizontally" })
map("n", "<leader>sv", "<C-W>v", { silent = true, desc = "Split buffer vertically" })
