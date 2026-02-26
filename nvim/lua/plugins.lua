return {
	-- theme
	{
		"wtfox/jellybeans.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			transparent = true,
		}, -- Optional
	},
	-- icons
	{ "nvim-mini/mini.nvim", version = "*" },

	{
		"mason-org/mason-lspconfig.nvim",
		opts = {},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
	},
	{
		"hrsh7th/nvim-cmp",
		version = false, -- last release is way too old
		event = { "InsertEnter", "CmdlineEnter" },
		dependencies = {
			"neovim/nvim-lspconfig",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"petertriho/cmp-git",
			"onsails/lspkind.nvim", -- VSCode-like pictograms
		},
	},
	-- Snippets engine and collection
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		build = "make install_jsregexp",
	},
	{ "rafamadriz/friendly-snippets" },

	-- Autopares
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},
	-- Find
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			-- optional but recommended
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
	},

	-- treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
	},

	{
		"nvim-tree/nvim-tree.lua", -- For file explorer
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
	},

	-- trouble
	{
		"folke/trouble.nvim", -- For showing diagnostics, references, etc.
		opts = {}, -- for default options, refer to the configuration section for custom setup.
		cmd = "Trouble",
		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
			{
				"<leader>xX",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Buffer Diagnostics (Trouble)",
			},
			{
				"<leader>cs",
				"<cmd>Trouble symbols toggle focus=false<cr>",
				desc = "Symbols (Trouble)",
			},
			{
				"<leader>cl",
				"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				desc = "LSP Definitions / references / ... (Trouble)",
			},
			{
				"<leader>xL",
				"<cmd>Trouble loclist toggle<cr>",
				desc = "Location List (Trouble)",
			},
			{
				"<leader>xQ",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Quickfix List (Trouble)",
			},
		},
	},

	{
		"coder/claudecode.nvim",
		dependencies = { "folke/snacks.nvim" },
		config = true,
		keys = {
			{ "<leader>a", nil, desc = "AI/Claude Code" },
			{ "<leader>ac", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
			{ "<leader>af", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
			{ "<leader>ar", "<cmd>ClaudeCode --resume<cr>", desc = "Resume Claude" },
			{ "<leader>aC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
			{ "<leader>am", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Claude model" },
			{ "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current buffer" },
			{ "<leader>as", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send to Claude" },
			{
				"<leader>as",
				"<cmd>ClaudeCodeTreeAdd<cr>",
				desc = "Add file",
				ft = { "NvimTree", "neo-tree", "oil", "minifiles", "netrw" },
			},
			-- Diff management
			{ "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
			{ "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny diff" },
		},
	},

	{
		"folke/which-key.nvim", -- For displaying possible keybindings
		event = "VeryLazy",
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
	},

	{
		"nvim-lualine/lualine.nvim", -- For statusline
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{
		"lewis6991/gitsigns.nvim", -- For Git integration
	},
	{ "akinsho/toggleterm.nvim", version = "*", config = true }, -- Toggle terminal
	{
		"stevearc/conform.nvim", -- For formatting
		event = { "BufReadPre", "BufNewFile" },
	},
	{
		"mfussenegger/nvim-lint", -- For linting
		event = {
			"BufReadPre",
			"BufNewFile",
		},
	},
	{
		"kylechui/nvim-surround",
		version = "*",
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({})
		end,
	},

	{
		"echasnovski/mini.bufremove", -- For buffer removal
	},
	{
		"mg979/vim-visual-multi", -- For multicursor
		branch = "master",
	},
	"github/copilot.vim",
}
