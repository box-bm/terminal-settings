require("catppuccin").setup({
	dim_inactive = {
		enabled = true,
	},
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
