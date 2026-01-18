local telescope = require("telescope")
local builtin = require("telescope.builtin")
local open_with_trouble = require("trouble.sources.telescope").open

vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files by name" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Search text in the entire project" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "View and switch between open buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Search Neovim help tags" })
vim.keymap.set("n", "<leader>fo", builtin.oldfiles, {
	desc = "Find recently opened files",
})
vim.keymap.set("n", "<leader>fc", builtin.commands, {
	desc = "Search available commands",
})

telescope.setup({
	defaults = {
		mappings = {
			i = { ["<C-t>"] = open_with_trouble },
			n = { ["<C-t>"] = open_with_trouble },
		},
		file_ignore_patterns = { "node_modules", ".git/" },
		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
		},
	},
	pickers = {
		find_files = {
			hidden = true,
			no_ignore = true,
			follow = true,
		},
	},
})
