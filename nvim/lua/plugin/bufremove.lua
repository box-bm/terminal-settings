local bufremove = require("mini.bufremove")

-- Cerrar buffer actual (normal)
vim.keymap.set("n", "<leader>bd", function()
	bufremove.delete(0, false)
end, { desc = "Close buffer" })

-- Cerrar buffer actual forzado (sin guardar cambios)
vim.keymap.set("n", "<leader>bD", function()
	bufremove.delete(0, true)
end, { desc = "Force close buffer" })

-- Wipeout (como si nunca hubiera existido)
vim.keymap.set("n", "<leader>bw", function()
	bufremove.wipeout(0, false)
end, { desc = "Wipeout buffer" })

-- Cerrar todos menos el actual (muy usado en VSCode)
vim.keymap.set("n", "<leader>bo", function()
	local current = vim.fn.bufnr()
	for _, buf in ipairs(vim.api.nvim_list_bufs()) do
		if vim.api.nvim_buf_is_loaded(buf) and buf ~= current then
			bufremove.delete(buf, false)
		end
	end
end, { desc = "Close other buffers" })
