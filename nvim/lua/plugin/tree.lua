-- ============================================================================
-- Nvim-Tree File Explorer Configuration
-- ============================================================================

-- Disable netrw (nvim-tree replaces it)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local function my_on_attach(bufnr)
	local api = require("nvim-tree.api")

	local function opts(desc)
		return {
			desc = "nvim-tree: " .. desc,
			buffer = bufnr,
			noremap = true,
			silent = true,
			nowait = true,
		}
	end

	-- ========================================================================
	-- Default Mappings (from nvim-tree)
	-- ========================================================================
	api.config.mappings.default_on_attach(bufnr)

	-- ========================================================================
	-- Custom Keybindings
	-- ========================================================================

	-- Navigation
	vim.keymap.set("n", "l", api.node.open.edit, opts("Open"))
	vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Close"))

	-- Split windows
	vim.keymap.set("n", "v", api.node.open.vertical, opts("Open: Vertical Split"))
	vim.keymap.set("n", "s", api.node.open.horizontal, opts("Open: Horizontal Split"))

	-- Help
	vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
end

require("nvim-tree").setup({
	on_attach = my_on_attach,

	-- Performance
	hijack_cursor = true,
	sync_root_with_cwd = true,
	reload_on_bufenter = false,
	respect_buf_cwd = false,

	update_focused_file = {
		enable = true,
		update_root = false,
		ignore_list = {},
	},

	view = {
		width = 36,
		side = "left",
		preserve_window_proportions = false,
		number = false,
		relativenumber = false,
		signcolumn = "yes",
	},

	sort = {
		sorter = "case_sensitive",
		folders_first = true,
	},

	git = {
		enable = true,
		ignore = false,
		show_on_dirs = true,
		show_on_open_dirs = true,
		timeout = 400,
	},

	filesystem_watchers = {
		enable = true,
		debounce_delay = 50,
		ignore_dirs = {
			"node_modules",
			".git",
			"target",
			"build",
			"dist",
		},
	},

	filters = {
		dotfiles = false,
		git_clean = false,
		no_buffer = false,
		custom = { "^.git$", "^.DS_Store$" },
		exclude = {},
	},

	actions = {
		use_system_clipboard = true,
		change_dir = {
			enable = true,
			global = false,
			restrict_above_cwd = false,
		},
		open_file = {
			quit_on_open = false,
			resize_window = true,
			window_picker = {
				enable = true,
				chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
				exclude = {
					filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
					buftype = { "nofile", "terminal", "help" },
				},
			},
		},
	},

	renderer = {
		add_trailing = false,
		group_empty = false,
		highlight_git = true,
		full_name = false,
		highlight_opened_files = "none",
		root_folder_label = ":~:s?$?/..?",
		indent_width = 2,
		indent_markers = {
			enable = true,
			inline_arrows = true,
			icons = {
				corner = "└",
				edge = "│",
				item = "│",
				bottom = "─",
				none = " ",
			},
		},
		icons = {
			webdev_colors = true,
			git_placement = "before",
			padding = " ",
			symlink_arrow = " ➛ ",
			show = {
				file = true,
				folder = true,
				folder_arrow = true,
				git = true,
			},
			glyphs = {
				default = "",
				symlink = "",
				bookmark = "",
				folder = {
					arrow_closed = "",
					arrow_open = "",
					default = "",
					open = "",
					empty = "",
					empty_open = "",
					symlink = "",
					symlink_open = "",
				},
				git = {
					unstaged = "✗",
					staged = "✓",
					unmerged = "",
					renamed = "➜",
					untracked = "★",
					deleted = "",
					ignored = "◌",
				},
			},
		},
		special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
		symlink_destination = true,
	},
})

-- ============================================================================
-- Global Keybindings (outside of nvim-tree buffer)
-- ============================================================================

vim.keymap.set("n", "<leader>e", "", { desc = "+Explorer" })
vim.keymap.set("n", "<leader>et", "<cmd>NvimTreeToggle<CR>", {
	silent = true,
	desc = "Toggle File Explorer",
})
vim.keymap.set("n", "<leader>ef", "<cmd>NvimTreeFocus<CR>", {
	silent = true,
	desc = "Focus File Explorer",
})
vim.keymap.set("n", "<leader>ee", "<cmd>NvimTreeFindFile<CR>", {
	silent = true,
	desc = "Find Current File in Explorer",
})
vim.keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", {
	silent = true,
	desc = "Collapse File Explorer",
})
