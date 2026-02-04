-- ============================================================================
-- ToggleTerm Configuration
-- ============================================================================

require("toggleterm").setup({
	size = function(term)
		if term.direction == "vertical" then
			return vim.o.columns * 0.4
		end
		return 12
	end,
	open_mapping = [[<c-\>]],
	direction = "horizontal",
	persist_size = true,
	close_on_exit = false,
})

local map = vim.keymap.set

map("n", "<leader>tt", "<cmd>ToggleTerm<CR>", { desc = "Toggle terminal" })
map("n", "<leader>tf", "<cmd>ToggleTerm direction=float<CR>", { desc = "Toggle floating terminal" })
map("n", "<leader>th", "<cmd>ToggleTerm direction=horizontal<CR>", { desc = "Toggle horizontal terminal" })
map("n", "<leader>tv", "<cmd>ToggleTerm direction=vertical<CR>", { desc = "Toggle vertical terminal" })
map("n", "<leader>tn", "<cmd>ToggleTerm direction=tab<CR>", { desc = "Open terminal in tab" })

map("t", "<Esc><Esc>", "<C-\\><C-n>", {
	silent = true,
	desc = "Exit terminal mode",
})

vim.api.nvim_create_autocmd("TermOpen", {
	pattern = "term://*toggleterm#*",
	callback = function()
		vim.opt_local.winfixheight = true
	end,
})
