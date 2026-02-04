-- ============================================================================
-- Buffer Remove Configuration
-- ============================================================================

local bufremove = require("mini.bufremove")

vim.keymap.set("n", "<leader>bd", function()
	bufremove.delete(0, false)
end, { desc = "Cerrar buffer (sin forzar)", silent = true })

vim.keymap.set("n", "<leader>bD", function()
	bufremove.delete(0, true)
end, { desc = "Cerrar buffer (forzar)", silent = true })

vim.keymap.set("n", "<Tab>", "<cmd>bnext<CR>", {
	desc = "Buffer siguiente",
	silent = true,
})

vim.keymap.set("n", "<S-Tab>", "<cmd>bprev<CR>", {
	desc = "Buffer anterior",
	silent = true,
})

vim.keymap.set("n", "<leader>bl", "<cmd>ls<CR>", {
	desc = "Listar buffers",
	silent = true,
})

vim.keymap.set("n", "<leader>sh", "<C-w>s", {
	desc = "Split buffer horizontally",
	silent = true,
})

vim.keymap.set("n", "<leader>sv", "<C-w>v", {
	desc = "Split buffer vertically",
	silent = true,
})

vim.opt.equalalways = false
