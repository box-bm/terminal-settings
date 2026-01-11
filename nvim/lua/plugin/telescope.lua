local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files by name" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Search text in the entire project" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "View and switch between open buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Search Neovim help tags" })

local open_with_trouble = require("trouble.sources.telescope").open
local telescope = require("telescope")

telescope.setup({
  defaults = {
    mappings = {
      i = { ["<c-t>"] = open_with_trouble },
      n = { ["<c-t>"] = open_with_trouble },
    },
    file_ignore_patterns = {},
    hidden = true,
    no_ignore = true,
  },
  pickers = {
    find_files = {
      hidden = true,
      no_ignore = true,
      follow = true,
    },
  },
})
