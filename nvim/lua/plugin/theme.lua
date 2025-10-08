require("catppuccin").setup({
	flavour = "mocha", -- latte, frappe, macchiato, mocha
	transparent_background = false, -- disables setting the background color.
	show_end_of_buffer = true, -- shows the '~' characters after the end of buffers
	default_integrations = true,
	auto_integrations = true,
	integrations = {
		mason = true,
		cmp = true,
		copilot_vim = true,
		nvimtree = true,
		telescope = {
			enabled = true,
		},
		lsp_trouble = true,
	},
})

-- setup must be called before loading
vim.cmd.colorscheme("catppuccin")
