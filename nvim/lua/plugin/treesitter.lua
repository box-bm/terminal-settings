-- ============================================================================
-- Treesitter Configuration
-- ============================================================================

require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"lua",
		"vim",
		"vimdoc",
		"javascript",
		"typescript",
		"tsx",
		"json",
		"html",
		"css",
		"python",
		"ruby",
		"rust",
		"kotlin",
		"dart",
		"sql",
		"yaml",
		"markdown",
		"markdown_inline",
		"bash",
	},

	sync_install = false,
	auto_install = true,

	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},

	indent = {
		enable = true,
	},

	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<CR>",
			node_incremental = "<CR>",
			scope_incremental = "<S-CR>",
			node_decremental = "<BS>",
		},
	},
})
