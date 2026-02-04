-- ============================================================================
-- Telescope Fuzzy Finder Configuration
-- ============================================================================

local telescope = require("telescope")
local builtin = require("telescope.builtin")
local open_with_trouble = require("trouble.sources.telescope").open
local actions = require("telescope.actions")

telescope.load_extension("fzf")

telescope.setup({
	defaults = {
		path_display = { "truncate" },

		-- Performance
		cache_picker = {
			num_pickers = 10,
		},

		-- Layout
		layout_strategy = "horizontal",
		layout_config = {
			horizontal = {
				prompt_position = "bottom",
				preview_width = 0.55,
				results_width = 0.8,
			},
			vertical = {
				mirror = false,
			},
			width = 0.87,
			height = 0.80,
			preview_cutoff = 120,
		},

		-- Sorting
		sorting_strategy = "ascending",

		-- Files to ignore
		file_ignore_patterns = {
			"node_modules",
			".git/",
			"%.lock",
			"dist/",
			"build/",
			"target/",
			"vendor/",
		},

		-- Better grep
		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
			"--hidden",
			"--glob=!.git/",
		},

		-- Mappings
		mappings = {
			i = {
				["<C-t>"] = open_with_trouble,
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
				["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
				["<C-d>"] = actions.delete_buffer,
				["<Esc>"] = actions.close,
			},
			n = {
				["<C-t>"] = open_with_trouble,
				["q"] = actions.close,
				["dd"] = actions.delete_buffer,
			},
		},
	},

	pickers = {
		find_files = {
			hidden = true,
			no_ignore = false,
			follow = true,
			previewer = false, -- Faster without preview for file finding
		},
		buffers = {
			sort_mru = true,
			sort_lastused = true,
			ignore_current_buffer = true,
		},
		live_grep = {
			only_sort_text = true,
		},
		git_files = {
			show_untracked = true,
		},
	},

	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case",
		},
	},
})

-- ============================================================================
-- Telescope Keybindings
-- ============================================================================

local map = vim.keymap.set

-- Which-key group label
map("n", "<leader>f", "", { desc = "+Find/Search" })

-- ============================================================================
-- File Finding
-- ============================================================================
map("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
map("n", "<leader>fo", builtin.oldfiles, { desc = "Recent Files" })
map("n", "<leader>fr", builtin.resume, { desc = "Resume Last Search" })

-- ============================================================================
-- Text Search
-- ============================================================================
map("n", "<leader>fg", builtin.live_grep, { desc = "Live Grep (Search Text)" })
map("n", "<leader>fw", builtin.grep_string, { desc = "Find Word Under Cursor" })

-- ============================================================================
-- Buffers & Navigation
-- ============================================================================
map("n", "<leader>fb", builtin.buffers, { desc = "Buffers" })

-- ============================================================================
-- Help & Commands
-- ============================================================================
map("n", "<leader>fh", builtin.help_tags, { desc = "Help Tags" })
map("n", "<leader>fc", builtin.commands, { desc = "Commands" })
map("n", "<leader>fk", builtin.keymaps, { desc = "Keymaps" })

-- ============================================================================
-- Git Integration
-- ============================================================================
map("n", "<leader>fgc", builtin.git_commits, { desc = "Git Commits" })
map("n", "<leader>fgs", builtin.git_status, { desc = "Git Status" })
map("n", "<leader>fgb", builtin.git_branches, { desc = "Git Branches" })

-- ============================================================================
-- LSP & Diagnostics
-- ============================================================================
map("n", "<leader>fd", builtin.diagnostics, { desc = "Diagnostics" })
map("n", "<leader>fs", builtin.lsp_document_symbols, { desc = "Document Symbols" })
map("n", "<leader>fS", builtin.lsp_workspace_symbols, { desc = "Workspace Symbols" })
