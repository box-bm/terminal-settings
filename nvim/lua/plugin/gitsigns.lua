require("gitsigns").setup({
	signs = {
		add = { text = "┃" },
		change = { text = "┃" },
		delete = { text = "_" },
		topdelete = { text = "‾" },
		changedelete = { text = "~" },
		untracked = { text = "┆" },
	},
	signcolumn = true, -- Muestra los signos en la columna lateral
	numhl = false, -- No resalta el número de línea
	linehl = false, -- No resalta la línea completa
	word_diff = false, -- No muestra diferencias por palabra
	watch_gitdir = {
		follow_files = true,
	},
	auto_attach = true,
	attach_to_untracked = false,
	current_line_blame = false, -- Muestra el blame en la línea actual
	current_line_blame_opts = {
		virt_text = true,
		virt_text_pos = "eol", -- Muestra el texto al final de la línea
		delay = 500,
		ignore_whitespace = false,
		virt_text_priority = 100,
		use_focus = true,
	},
	current_line_blame_formatter = "<author> • <author_time:%Y-%m-%d %H:%M> • <summary>",
	sign_priority = 6,
	update_debounce = 100,
	status_formatter = nil, -- Usa el formato por defecto
	max_file_length = 40000, -- Desactiva si el archivo es muy grande
	preview_config = {
		style = "minimal",
		relative = "cursor",
		row = 0,
		col = 1,
	},
})

vim.keymap.set("n", "<leader>gb", function()
	require("gitsigns").toggle_current_line_blame()
end, { desc = "Toggle git blame line" })

vim.keymap.set("n", "]h", function()
	require("gitsigns").next_hunk()
end, { desc = "Next git hunk" })

vim.keymap.set("n", "[h", function()
	require("gitsigns").prev_hunk()
end, { desc = "Prev git hunk" })

vim.keymap.set("n", "<leader>gp", function()
	require("gitsigns").preview_hunk()
end, { desc = "Preview git hunk" })
