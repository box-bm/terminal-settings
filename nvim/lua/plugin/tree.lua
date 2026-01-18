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

	api.config.mappings.default_on_attach(bufnr)
	vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
end

require("nvim-tree").setup({
	on_attach = my_on_attach,

	update_focused_file = {
		enable = true,
		update_root = false,
	},

	view = {
		width = 36,
		side = "left",
	},

	sort = {
		sorter = "case_sensitive",
	},

	git = {
		ignore = false,
	},

	filters = {
		dotfiles = false,
		custom = { ".git" },
	},

	actions = {
		open_file = {
			resize_window = false,
		},
		change_dir = {
			enable = true,
			restrict_above_cwd = true,
		},
	},

	renderer = {
		root_folder_label = ":t",
		indent_markers = {
			enable = true,
		},
	},
})

vim.keymap.set("n", "<leader>et", "<cmd>NvimTreeToggle<CR>", {
	silent = true,
	desc = "Toggle NvimTree",
})

vim.keymap.set("n", "<leader>ef", "<cmd>NvimTreeFocus<CR>", {
	silent = true,
	desc = "Focus NvimTree",
})
